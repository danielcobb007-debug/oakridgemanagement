param(
    [string]$ZipPath = "",
    [string]$MemoryExtractionRoot = ""
)

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

. (Join-Path $PSScriptRoot "MemoryExtraction.Common.ps1")

if ([string]::IsNullOrWhiteSpace($ZipPath)) {
    $ZipPath = Get-DefaultZipPath
}

if ([string]::IsNullOrWhiteSpace($MemoryExtractionRoot)) {
    $MemoryExtractionRoot = Get-MemoryExtractionRoot
}

$csvPath = Get-OutputPath -MemoryExtractionRoot $MemoryExtractionRoot -RelativePath "Reports\CHATGPT_CONVERSATION_INDEX.csv"
$mdPath = Get-OutputPath -MemoryExtractionRoot $MemoryExtractionRoot -RelativePath "Reports\CHATGPT_CONVERSATION_INDEX.md"

function Get-ChatGPTKeywordProfiles {
    return @(
        @{ Name = "ORM"; Keywords = @("orm", "oak ridge management", "oakridgemanagement"); Sensitivity = @() },
        @{ Name = "CEH"; Keywords = @("ceh", "compute energy hour", "ceh index", "ceh standard"); Sensitivity = @() },
        @{ Name = "DGEI"; Keywords = @("dgei", "dg energy", "dg energy and infrastructure", "dg energy & infrastructure"); Sensitivity = @("partner_consent_required") },
        @{ Name = "Georgia_Benefits_Group"; Keywords = @("georgia benefits group", "gbg"); Sensitivity = @("partner_consent_required", "sbr_hub_sensitive") },
        @{ Name = "SBR_HUB_Benefits"; Keywords = @("sbr", "hub", "employee benefits", "benefits", "insurance"); Sensitivity = @("sbr_hub_sensitive", "partner_consent_required") },
        @{ Name = "QumulusAI_VFG_Compute"; Keywords = @("qumulus", "qumulusai", "cumulus ai", "qai", "vfg", "inventec", "gpu", "nvidia", "compute", "data center", "hosting"); Sensitivity = @("partner_consent_required") },
        @{ Name = "Legal_Papering"; Keywords = @("legal", "nda", "non-circumvention", "agreement", "contract", "papering", "redline", "term sheet", "loi"); Sensitivity = @("legal_sensitive") },
        @{ Name = "Capital_Strategy"; Keywords = @("capital", "investor", "investment", "fundraising", "raise", "equity", "spv"); Sensitivity = @("investor_capital_sensitive") },
        @{ Name = "Personal_Operations"; Keywords = @("personal", "private", "family", "travel", "calendar", "budget", "home", "todo", "task"); Sensitivity = @("personal_private") },
        @{ Name = "AI_Systems_Command_Layer"; Keywords = @("codex", "claude", "chatgpt", "ai systems", "command layer", "memory", "prompt", "agent"); Sensitivity = @() },
        @{ Name = "Code_Repo_Work"; Keywords = @("github", "repo", "repository", "git", "branch", "implementation", "build", "deploy", "code", "python", "powershell", "script"); Sensitivity = @("code_repo_sensitive") }
    )
}

function Test-ChatGPTKeywordMatch {
    param(
        [string]$Haystack,
        [string]$Keyword
    )

    if ([string]::IsNullOrWhiteSpace($Keyword)) { return $false }
    if ($Keyword -match '^[A-Za-z0-9]{2,6}$') {
        return ($Haystack -match ("\b" + [regex]::Escape($Keyword.ToLowerInvariant()) + "\b"))
    }
    return $Haystack.Contains($Keyword.ToLowerInvariant())
}

function Get-ChatGPTClassification {
    param(
        [string]$Title,
        [string]$KeywordField,
        [string]$ModelSlug
    )

    $haystack = (" {0} {1} {2} " -f $Title, $KeywordField, $ModelSlug).ToLowerInvariant()
    $domains = [System.Collections.Generic.List[string]]::new()
    $keywords = [System.Collections.Generic.List[string]]::new()
    $flags = [System.Collections.Generic.HashSet[string]]::new()

    foreach ($profile in (Get-ChatGPTKeywordProfiles)) {
        $matched = $false
        foreach ($keyword in $profile.Keywords) {
            if (Test-ChatGPTKeywordMatch -Haystack $haystack -Keyword $keyword) {
                $matched = $true
                $keywords.Add($keyword)
            }
        }
        if ($matched) {
            $domains.Add($profile.Name)
            foreach ($flag in $profile.Sensitivity) {
                [void]$flags.Add($flag)
            }
        }
    }

    $primary = if ($domains.Count -gt 0) { $domains[0] } else { "Unknown" }

    if (
        $domains.Count -gt 0 -and
        -not $flags.Contains("legal_sensitive") -and
        -not $flags.Contains("personal_private") -and
        -not $flags.Contains("sbr_hub_sensitive") -and
        -not $flags.Contains("investor_capital_sensitive")
    ) {
        [void]$flags.Add("promotion_candidate")
    }

    return [pscustomobject]@{
        PrimaryDomain  = $primary
        DomainMatches  = @($domains | Select-Object -Unique)
        KeywordMatches = @($keywords | Select-Object -Unique)
        Sensitivity    = @($flags | Sort-Object)
    }
}

$baseRecords = Get-ConversationMetadataRecords -ZipPath $ZipPath
$records = foreach ($record in $baseRecords) {
    $classification = Get-ChatGPTClassification -Title $record.title -KeywordField ($record.keyword_matches -replace '\|', ' ') -ModelSlug $record.model_slug
    [pscustomobject]@{
        source_system             = $record.source_system
        source_archive_path       = $record.source_archive_path
        source_file               = $record.source_file
        conversation_id           = $record.conversation_id
        title                     = $record.title
        create_time               = $record.create_time
        update_time               = $record.update_time
        model_slug                = $record.model_slug
        is_archived               = $record.is_archived
        is_starred                = $record.is_starred
        is_temporary_chat         = $record.is_temporary_chat
        is_read_only              = $record.is_read_only
        approximate_message_count = $record.approximate_message_count
        observed_roles            = $record.observed_roles
        primary_domain            = $classification.PrimaryDomain
        domain_matches            = ($classification.DomainMatches -join "|")
        keyword_matches           = ($classification.KeywordMatches -join "|")
        sensitivity_flags         = ($classification.Sensitivity -join "|")
        extraction_run_date       = $record.extraction_run_date
        promotion_status          = $record.promotion_status
    }
}

$records = @($records | Sort-Object primary_domain, update_time, title)
Write-RecordsCsv -Path $csvPath -Records $records

$domainSummary = @(
    $records |
        Group-Object primary_domain |
        Sort-Object @{ Expression = "Count"; Descending = $true }, @{ Expression = "Name"; Descending = $false } |
        ForEach-Object { [pscustomobject]@{ domain = $_.Name; count = $_.Count } }
)

$flags = @("legal_sensitive", "partner_consent_required", "personal_private", "sbr_hub_sensitive", "investor_capital_sensitive", "code_repo_sensitive", "promotion_candidate")
$sensitivitySummary = foreach ($flag in $flags) {
    [pscustomobject]@{
        flag  = $flag
        count = @($records | Where-Object { $_.sensitivity_flags -split '\|' | Where-Object { $_ -eq $flag } }).Count
    }
}

$previewRows = $records |
    Select-Object -First 120 source_system, source_archive_path, source_file, conversation_id, title, create_time, update_time, model_slug, primary_domain, sensitivity_flags, promotion_status

$lines = @(
    "# ChatGPT Conversation Index",
    "",
    "This report contains metadata-only ChatGPT outputs. It remains separate from Claude-derived outputs.",
    "",
    "- source_system: ChatGPT",
    "- source_archive_path: $ZipPath",
    "- conversations indexed: $($records.Count)",
    "- extraction_run_date: $((Get-Date).ToString('yyyy-MM-dd'))",
    "",
    "## Domain Counts",
    "",
    (New-MarkdownTable -Headers @("domain", "count") -Rows $domainSummary),
    "",
    "## Sensitivity Counts",
    "",
    (New-MarkdownTable -Headers @("flag", "count") -Rows $sensitivitySummary),
    "",
    "## Preview",
    "",
    "The full dataset is available in CHATGPT_CONVERSATION_INDEX.csv. The preview below is limited for readability.",
    "",
    (New-MarkdownTable -Headers @("source_system", "source_archive_path", "source_file", "conversation_id", "title", "create_time", "update_time", "model_slug", "primary_domain", "sensitivity_flags", "promotion_status") -Rows $previewRows)
)

Write-Utf8File -Path $mdPath -Content ($lines -join "`n")

Write-Output $csvPath
Write-Output $mdPath
