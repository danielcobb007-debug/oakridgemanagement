param(
    [string]$CodexImportPath = "C:\Users\dpc\.codex\external_agent_session_imports.json",
    [string]$ClaudeProjectsRoot = "C:\Users\dpc\.claude\projects",
    [string]$MemoryExtractionRoot = ""
)

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

. (Join-Path $PSScriptRoot "MemoryExtraction.Common.ps1")

if ([string]::IsNullOrWhiteSpace($MemoryExtractionRoot)) {
    $MemoryExtractionRoot = Get-MemoryExtractionRoot
}

$csvPath = Get-OutputPath -MemoryExtractionRoot $MemoryExtractionRoot -RelativePath "Reports\CLAUDE_SESSION_INDEX.csv"
$mdPath = Get-OutputPath -MemoryExtractionRoot $MemoryExtractionRoot -RelativePath "Reports\CLAUDE_SESSION_INDEX.md"

function Normalize-SourcePath {
    param([string]$Path)
    if ([string]::IsNullOrWhiteSpace($Path)) { return "" }
    return ($Path -replace '^\\\\\?\\', '')
}

function Get-ClaudeKeywordProfiles {
    return @(
        @{ Name = "ORM"; Keywords = @("orm", "oak ridge management", "oakridgemanagement"); Sensitivity = @() },
        @{ Name = "CEH"; Keywords = @("ceh", "compute energy hour", "ceh-pricing-engine", "ceh index"); Sensitivity = @() },
        @{ Name = "DGEI"; Keywords = @("dgei", "dg energy", "infrastruction", "infrastructure"); Sensitivity = @("partner_consent_required") },
        @{ Name = "Georgia_Benefits_Group"; Keywords = @("georgia benefits group", "gbg"); Sensitivity = @("partner_consent_required", "sbr_hub_sensitive") },
        @{ Name = "SBR_HUB_Benefits"; Keywords = @("sbr", "hub", "employee benefits", "insurance", "benefits"); Sensitivity = @("sbr_hub_sensitive", "partner_consent_required") },
        @{ Name = "QumulusAI_VFG_Compute"; Keywords = @("qumulus", "qai", "vfg", "inventec", "gpu", "data center", "compute", "hosting"); Sensitivity = @("partner_consent_required") },
        @{ Name = "Legal_Papering"; Keywords = @("legal", "nda", "non-circumvention", "agreement", "contract", "papering", "term sheet", "loi"); Sensitivity = @("legal_sensitive") },
        @{ Name = "Capital_Strategy"; Keywords = @("capital", "investor", "fundraising", "equity", "spv", "investment"); Sensitivity = @("investor_capital_sensitive") },
        @{ Name = "Personal_Operations"; Keywords = @("personal", "private", "family", "travel", "calendar", "budget"); Sensitivity = @("personal_private") },
        @{ Name = "AI_Systems_Command_Layer"; Keywords = @("codex", "claude", "command layer", "ai systems", "memory", "prompt", "agent"); Sensitivity = @() },
        @{ Name = "Code_Repo_Work"; Keywords = @("github", "repo", "repository", "git", "branch", "implementation", "build", "deploy", "code"); Sensitivity = @("code_repo_sensitive") }
    )
}

function Test-ClaudeKeywordMatch {
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

function Get-ClaudeClassification {
    param(
        [string]$Title,
        [string]$WorkspaceHint,
        [string]$Cwd,
        [string]$GitBranch,
        [string]$SourceFile
    )

    $haystack = (" {0} {1} {2} {3} {4} " -f $Title, $WorkspaceHint, $Cwd, $GitBranch, $SourceFile).ToLowerInvariant()
    $domains = [System.Collections.Generic.List[string]]::new()
    $keywords = [System.Collections.Generic.List[string]]::new()
    $flags = [System.Collections.Generic.HashSet[string]]::new()

    foreach ($profile in (Get-ClaudeKeywordProfiles)) {
        $matched = $false
        foreach ($keyword in $profile.Keywords) {
            if (Test-ClaudeKeywordMatch -Haystack $haystack -Keyword $keyword) {
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

function Get-WorkspaceHint {
    param(
        [string]$FilePath,
        [string]$Cwd
    )

    if (-not [string]::IsNullOrWhiteSpace($Cwd)) {
        return ([System.IO.Path]::GetFileName($Cwd.TrimEnd('\')))
    }

    $projectDir = Split-Path -Parent $FilePath
    if ($projectDir -match '\\subagents$') {
        $projectDir = Split-Path -Parent $projectDir
    }
    return ([System.IO.Path]::GetFileName($projectDir))
}

if (-not (Test-Path -LiteralPath $ClaudeProjectsRoot)) {
    throw "Claude projects root not found: $ClaudeProjectsRoot"
}

$importMap = @{}
if (Test-Path -LiteralPath $CodexImportPath) {
    $imports = (Get-Content -LiteralPath $CodexImportPath -Raw | ConvertFrom-Json).records
    foreach ($record in $imports) {
        $normalized = Normalize-SourcePath -Path $record.source_path
        $importMap[$normalized] = [pscustomobject]@{
            imported_thread_id = [string]$record.imported_thread_id
            imported_at        = Convert-TimeValue $record.imported_at
        }
    }
}

$topLevelFiles = @(
    Get-ChildItem -LiteralPath $ClaudeProjectsRoot -Recurse -File -Filter *.jsonl -ErrorAction SilentlyContinue |
        Where-Object { $_.FullName -notmatch '\\subagents\\' } |
        Sort-Object FullName
)

$records = [System.Collections.Generic.List[object]]::new()
$runDate = (Get-Date).ToString("yyyy-MM-dd")

foreach ($file in $topLevelFiles) {
    $sessionId = ""
    $aiTitle = ""
    $cwd = ""
    $gitBranch = ""
    $firstTimestamp = $null
    $lastTimestamp = $null
    $eventCount = 0
    $userCount = 0
    $assistantCount = 0
    $eventTypes = [System.Collections.Generic.HashSet[string]]::new()

    foreach ($line in [System.IO.File]::ReadLines($file.FullName)) {
        if ([string]::IsNullOrWhiteSpace($line)) {
            continue
        }

        $record = $line | ConvertFrom-Json -Depth 80
        $eventCount++

        if ($record.PSObject.Properties.Name -contains "type" -and $record.type) {
            $eventType = [string]$record.type
            [void]$eventTypes.Add($eventType)
            if ($eventType -eq "user") { $userCount++ }
            if ($eventType -eq "assistant") { $assistantCount++ }
        }

        if (-not $sessionId -and ($record.PSObject.Properties.Name -contains "sessionId") -and $record.sessionId) {
            $sessionId = [string]$record.sessionId
        }

        if (-not $aiTitle -and ($record.PSObject.Properties.Name -contains "aiTitle") -and $record.aiTitle) {
            $aiTitle = [string]$record.aiTitle
        }

        if (-not $cwd -and ($record.PSObject.Properties.Name -contains "cwd") -and $record.cwd) {
            $cwd = [string]$record.cwd
        }

        if (-not $gitBranch -and ($record.PSObject.Properties.Name -contains "gitBranch") -and $record.gitBranch) {
            $gitBranch = [string]$record.gitBranch
        }

        if (($record.PSObject.Properties.Name -contains "timestamp") -and $record.timestamp) {
            $ts = [datetime]$record.timestamp
            if ($null -eq $firstTimestamp -or $ts -lt $firstTimestamp) {
                $firstTimestamp = $ts
            }
            if ($null -eq $lastTimestamp -or $ts -gt $lastTimestamp) {
                $lastTimestamp = $ts
            }
        }
    }

    $workspaceHint = Get-WorkspaceHint -FilePath $file.FullName -Cwd $cwd
    $classification = Get-ClaudeClassification -Title $aiTitle -WorkspaceHint $workspaceHint -Cwd $cwd -GitBranch $gitBranch -SourceFile $file.FullName
    $normalizedPath = Normalize-SourcePath -Path $file.FullName
    $importInfo = $null
    if ($importMap.ContainsKey($normalizedPath)) {
        $importInfo = $importMap[$normalizedPath]
    }

    $records.Add([pscustomobject]@{
        source_system                  = "Claude"
        source_archive_path            = $ClaudeProjectsRoot
        source_file                    = $file.FullName
        session_id                     = $sessionId
        ai_title                       = $aiTitle
        cwd                            = $cwd
        git_branch                     = $gitBranch
        first_timestamp                = if ($firstTimestamp) { $firstTimestamp.ToString("yyyy-MM-ddTHH:mm:ss") } else { "" }
        last_timestamp                 = if ($lastTimestamp) { $lastTimestamp.ToString("yyyy-MM-ddTHH:mm:ss") } else { "" }
        event_count                    = $eventCount
        observed_event_types           = ((@($eventTypes | Sort-Object)) -join "|")
        approximate_user_event_count   = $userCount
        approximate_assistant_event_count = $assistantCount
        workspace_hint                 = $workspaceHint
        imported_thread_id             = if ($importInfo) { $importInfo.imported_thread_id } else { "" }
        imported_at                    = if ($importInfo) { $importInfo.imported_at } else { "" }
        primary_domain                 = $classification.PrimaryDomain
        domain_matches                 = ($classification.DomainMatches -join "|")
        keyword_matches                = ($classification.KeywordMatches -join "|")
        sensitivity_flags              = ($classification.Sensitivity -join "|")
        extraction_run_date            = $runDate
        promotion_status               = "Raw / Unreviewed"
    })
}

$records = @($records | Sort-Object primary_domain, last_timestamp, ai_title, source_file)
Write-RecordsCsv -Path $csvPath -Records $records

$domainSummary = @(
    $records |
        Group-Object primary_domain |
        Sort-Object @{ Expression = "Count"; Descending = $true }, @{ Expression = "Name"; Descending = $false } |
        ForEach-Object {
            [pscustomobject]@{
                domain = $_.Name
                count  = $_.Count
            }
        }
)

$flagDescriptions = [ordered]@{
    legal_sensitive          = "Potential legal or papering sensitivity"
    partner_consent_required = "May involve partner or third-party review"
    personal_private         = "Likely personal or private material"
    sbr_hub_sensitive        = "Likely employee benefits or insurance sensitivity"
    investor_capital_sensitive = "Likely investor or capital strategy sensitivity"
    code_repo_sensitive      = "Likely code or repository-sensitive material"
    promotion_candidate      = "Possible candidate for later promotion review"
}

$sensitivitySummary = foreach ($flag in $flagDescriptions.Keys) {
    [pscustomobject]@{
        flag  = $flag
        count = @($records | Where-Object { $_.sensitivity_flags -split '\|' | Where-Object { $_ -eq $flag } }).Count
    }
}

$previewRows = $records |
    Select-Object -First 120 source_system, source_archive_path, source_file, session_id, ai_title, workspace_hint, first_timestamp, last_timestamp, primary_domain, sensitivity_flags, promotion_status

$lines = @(
    "# Claude Session Index",
    "",
    "This report is metadata-only and keeps Claude separate from ChatGPT. No full message bodies are reproduced.",
    "",
    "- source_system: Claude",
    "- source_archive_path: $ClaudeProjectsRoot",
    "- sessions indexed: $($records.Count)",
    "- extraction_run_date: $runDate",
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
    "The full dataset is available in CLAUDE_SESSION_INDEX.csv. The preview below is limited for readability.",
    "",
    (New-MarkdownTable -Headers @("source_system", "source_archive_path", "source_file", "session_id", "ai_title", "workspace_hint", "first_timestamp", "last_timestamp", "primary_domain", "sensitivity_flags", "promotion_status") -Rows $previewRows)
)

Write-Utf8File -Path $mdPath -Content ($lines -join "`n")

Write-Output $csvPath
Write-Output $mdPath
