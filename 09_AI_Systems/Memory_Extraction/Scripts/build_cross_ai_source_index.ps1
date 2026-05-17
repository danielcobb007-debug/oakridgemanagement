param(
    [string]$MemoryExtractionRoot = "",
    [string]$ChatGPTIndexCsv = "",
    [string]$ClaudeIndexCsv = ""
)

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

. (Join-Path $PSScriptRoot "MemoryExtraction.Common.ps1")

if ([string]::IsNullOrWhiteSpace($MemoryExtractionRoot)) {
    $MemoryExtractionRoot = Get-MemoryExtractionRoot
}

if ([string]::IsNullOrWhiteSpace($ChatGPTIndexCsv)) {
    $ChatGPTIndexCsv = Get-OutputPath -MemoryExtractionRoot $MemoryExtractionRoot -RelativePath "Reports\CHATGPT_CONVERSATION_INDEX.csv"
}

if ([string]::IsNullOrWhiteSpace($ClaudeIndexCsv)) {
    $ClaudeIndexCsv = Get-OutputPath -MemoryExtractionRoot $MemoryExtractionRoot -RelativePath "Reports\CLAUDE_SESSION_INDEX.csv"
}

$crossCsvPath = Get-OutputPath -MemoryExtractionRoot $MemoryExtractionRoot -RelativePath "Reports\CROSS_AI_SOURCE_INDEX.csv"
$crossMdPath = Get-OutputPath -MemoryExtractionRoot $MemoryExtractionRoot -RelativePath "Reports\CROSS_AI_SOURCE_INDEX.md"
$summaryPath = Get-OutputPath -MemoryExtractionRoot $MemoryExtractionRoot -RelativePath "Reports\CROSS_AI_SOURCE_SUMMARY.md"

function Has-AnyFlag {
    param(
        [string]$SensitivityFlags,
        [string[]]$Needles
    )

    if ([string]::IsNullOrWhiteSpace($SensitivityFlags)) {
        return $false
    }

    $flags = @($SensitivityFlags -split '\|' | Where-Object { -not [string]::IsNullOrWhiteSpace($_) })
    foreach ($needle in $Needles) {
        if ($flags -contains $needle) {
            return $true
        }
    }
    return $false
}

function Get-ReviewRequired {
    param(
        [psobject]$Row
    )

    $sensitivity = [string]$Row.sensitivity_flags
    $domain = [string]$Row.primary_domain

    if (-not [string]::IsNullOrWhiteSpace($sensitivity)) {
        return "yes"
    }

    $forcedDomains = @(
        "Legal_Papering",
        "SBR_HUB_Benefits",
        "Personal_Operations",
        "Capital_Strategy",
        "QumulusAI_VFG_Compute",
        "Code_Repo_Work"
    )

    if ($forcedDomains -contains $domain) {
        return "yes"
    }

    return "no"
}

function Get-Notes {
    param(
        [psobject]$Row,
        [string]$SourceIndexFile
    )

    $notes = [System.Collections.Generic.List[string]]::new()
    $notes.Add("Metadata-only cross-source record.")
    $notes.Add("No deduplication performed.")
    $notes.Add("No meaning normalization or conflict resolution performed.")
    $notes.Add("Derived from $SourceIndexFile.")

    if ([string]::IsNullOrWhiteSpace([string]$Row.primary_domain) -or [string]$Row.primary_domain -eq "Unknown") {
        $notes.Add("Primary domain unknown or weakly classified.")
    }

    return ($notes -join " ")
}

function Convert-ChatGPTRow {
    param(
        [psobject]$Row,
        [string]$SourceIndexFile
    )

    $primaryDomain = if ([string]::IsNullOrWhiteSpace([string]$Row.primary_domain)) { "Unknown" } else { [string]$Row.primary_domain }
    $reviewRequired = Get-ReviewRequired -Row $Row

    return [pscustomobject]@{
        source_system               = if ([string]::IsNullOrWhiteSpace([string]$Row.source_system)) { "ChatGPT" } else { [string]$Row.source_system }
        source_archive_path         = if ([string]::IsNullOrWhiteSpace([string]$Row.source_archive_path)) { "Unknown" } else { [string]$Row.source_archive_path }
        source_file                 = if ([string]::IsNullOrWhiteSpace([string]$Row.source_file)) { "Unknown" } else { [string]$Row.source_file }
        source_record_id            = if ([string]::IsNullOrWhiteSpace([string]$Row.conversation_id)) { "Unknown" } else { [string]$Row.conversation_id }
        title_or_ai_title           = if ([string]::IsNullOrWhiteSpace([string]$Row.title)) { "Unknown" } else { [string]$Row.title }
        create_or_first_timestamp   = if ([string]::IsNullOrWhiteSpace([string]$Row.create_time)) { "Unknown" } else { [string]$Row.create_time }
        update_or_last_timestamp    = if ([string]::IsNullOrWhiteSpace([string]$Row.update_time)) { "Unknown" } else { [string]$Row.update_time }
        primary_domain              = $primaryDomain
        all_domain_matches          = if ([string]::IsNullOrWhiteSpace([string]$Row.domain_matches)) { $primaryDomain } else { [string]$Row.domain_matches }
        sensitivity_flags           = if ([string]::IsNullOrWhiteSpace([string]$Row.sensitivity_flags)) { "" } else { [string]$Row.sensitivity_flags }
        promotion_status            = if ([string]::IsNullOrWhiteSpace([string]$Row.promotion_status)) { "Raw / Unreviewed" } else { [string]$Row.promotion_status }
        extraction_run_date         = if ([string]::IsNullOrWhiteSpace([string]$Row.extraction_run_date)) { "Unknown" } else { [string]$Row.extraction_run_date }
        source_index_file           = $SourceIndexFile
        review_required             = $reviewRequired
        normalization_status        = "Not Started"
        notes                       = Get-Notes -Row $Row -SourceIndexFile $SourceIndexFile
    }
}

function Convert-ClaudeRow {
    param(
        [psobject]$Row,
        [string]$SourceIndexFile
    )

    $primaryDomain = if ([string]::IsNullOrWhiteSpace([string]$Row.primary_domain)) { "Unknown" } else { [string]$Row.primary_domain }
    $reviewRequired = Get-ReviewRequired -Row $Row

    return [pscustomobject]@{
        source_system               = if ([string]::IsNullOrWhiteSpace([string]$Row.source_system)) { "Claude" } else { [string]$Row.source_system }
        source_archive_path         = if ([string]::IsNullOrWhiteSpace([string]$Row.source_archive_path)) { "Unknown" } else { [string]$Row.source_archive_path }
        source_file                 = if ([string]::IsNullOrWhiteSpace([string]$Row.source_file)) { "Unknown" } else { [string]$Row.source_file }
        source_record_id            = if ([string]::IsNullOrWhiteSpace([string]$Row.session_id)) { "Unknown" } else { [string]$Row.session_id }
        title_or_ai_title           = if ([string]::IsNullOrWhiteSpace([string]$Row.ai_title)) { "Unknown" } else { [string]$Row.ai_title }
        create_or_first_timestamp   = if ([string]::IsNullOrWhiteSpace([string]$Row.first_timestamp)) { "Unknown" } else { [string]$Row.first_timestamp }
        update_or_last_timestamp    = if ([string]::IsNullOrWhiteSpace([string]$Row.last_timestamp)) { "Unknown" } else { [string]$Row.last_timestamp }
        primary_domain              = $primaryDomain
        all_domain_matches          = if ([string]::IsNullOrWhiteSpace([string]$Row.domain_matches)) { $primaryDomain } else { [string]$Row.domain_matches }
        sensitivity_flags           = if ([string]::IsNullOrWhiteSpace([string]$Row.sensitivity_flags)) { "" } else { [string]$Row.sensitivity_flags }
        promotion_status            = if ([string]::IsNullOrWhiteSpace([string]$Row.promotion_status)) { "Raw / Unreviewed" } else { [string]$Row.promotion_status }
        extraction_run_date         = if ([string]::IsNullOrWhiteSpace([string]$Row.extraction_run_date)) { "Unknown" } else { [string]$Row.extraction_run_date }
        source_index_file           = $SourceIndexFile
        review_required             = $reviewRequired
        normalization_status        = "Not Started"
        notes                       = Get-Notes -Row $Row -SourceIndexFile $SourceIndexFile
    }
}

$chatgptRows = @()
$claudeRows = @()
if (Test-Path -LiteralPath $ChatGPTIndexCsv) {
    $chatgptRows = @(Import-Csv -LiteralPath $ChatGPTIndexCsv)
}
if (Test-Path -LiteralPath $ClaudeIndexCsv) {
    $claudeRows = @(Import-Csv -LiteralPath $ClaudeIndexCsv)
}

$records = [System.Collections.Generic.List[object]]::new()
foreach ($row in $chatgptRows) {
    $records.Add((Convert-ChatGPTRow -Row $row -SourceIndexFile $ChatGPTIndexCsv))
}
foreach ($row in $claudeRows) {
    $records.Add((Convert-ClaudeRow -Row $row -SourceIndexFile $ClaudeIndexCsv))
}

$records = @($records | Sort-Object source_system, primary_domain, update_or_last_timestamp, title_or_ai_title, source_file)
Write-RecordsCsv -Path $crossCsvPath -Records $records

$previewRows = $records |
    Select-Object -First 150 source_system, source_record_id, title_or_ai_title, create_or_first_timestamp, update_or_last_timestamp, primary_domain, sensitivity_flags, review_required, normalization_status

$crossIndexLines = @(
    "# Cross AI Source Index",
    "",
    "This is a metadata-only cross-source index over ChatGPT and Claude derived indexes. It is not canonical, not deduplicated, and not normalized for meaning.",
    "",
    "- total records: $(@($records).Count)",
    "- source systems included: ChatGPT and Claude",
    "",
    "## Preview",
    "",
    "The full dataset is available in CROSS_AI_SOURCE_INDEX.csv. The preview below is limited for readability.",
    "",
    (New-MarkdownTable -Headers @("source_system", "source_record_id", "title_or_ai_title", "create_or_first_timestamp", "update_or_last_timestamp", "primary_domain", "sensitivity_flags", "review_required", "normalization_status") -Rows $previewRows)
)
Write-Utf8File -Path $crossMdPath -Content ($crossIndexLines -join "`n")

$sourceSummary = @(
    $records |
        Group-Object source_system |
        Sort-Object @{ Expression = "Name"; Descending = $false } |
        ForEach-Object { [pscustomobject]@{ source_system = $_.Name; count = $_.Count } }
)

$domainSummary = @(
    $records |
        Group-Object primary_domain |
        Sort-Object @{ Expression = "Count"; Descending = $true }, @{ Expression = "Name"; Descending = $false } |
        ForEach-Object { [pscustomobject]@{ domain = $_.Name; count = $_.Count } }
)

$flagCounts = [System.Collections.Generic.Dictionary[string,int]]::new()
foreach ($row in $records) {
    $flags = @($row.sensitivity_flags -split '\|' | Where-Object { -not [string]::IsNullOrWhiteSpace($_) })
    foreach ($flag in $flags) {
        if (-not $flagCounts.ContainsKey($flag)) {
            $flagCounts[$flag] = 0
        }
        $flagCounts[$flag]++
    }
}
$sensitivitySummary = @(
    $flagCounts.Keys |
        Sort-Object |
        ForEach-Object { [pscustomobject]@{ sensitivity_flag = $_; count = $flagCounts[$_] } }
)

$reviewRequiredCount = @($records | Where-Object { $_.review_required -eq "yes" }).Count
$promotionCandidateCount = @($records | Where-Object { Has-AnyFlag -SensitivityFlags $_.sensitivity_flags -Needles @("promotion_candidate") }).Count
$unknownDomainCount = @($records | Where-Object { $_.primary_domain -eq "Unknown" }).Count

$highPriorityRows = @(
    [pscustomobject]@{ bucket = "Legal_Papering or legal_sensitive"; count = @($records | Where-Object { ($_.primary_domain -eq "Legal_Papering") -or (Has-AnyFlag -SensitivityFlags $_.sensitivity_flags -Needles @("legal_sensitive")) }).Count },
    [pscustomobject]@{ bucket = "SBR_HUB_Benefits or sbr_hub_sensitive"; count = @($records | Where-Object { ($_.primary_domain -eq "SBR_HUB_Benefits") -or (Has-AnyFlag -SensitivityFlags $_.sensitivity_flags -Needles @("sbr_hub_sensitive")) }).Count },
    [pscustomobject]@{ bucket = "Personal_Operations or personal_private"; count = @($records | Where-Object { ($_.primary_domain -eq "Personal_Operations") -or (Has-AnyFlag -SensitivityFlags $_.sensitivity_flags -Needles @("personal_private")) }).Count },
    [pscustomobject]@{ bucket = "Capital_Strategy or investor_capital_sensitive"; count = @($records | Where-Object { ($_.primary_domain -eq "Capital_Strategy") -or (Has-AnyFlag -SensitivityFlags $_.sensitivity_flags -Needles @("investor_capital_sensitive")) }).Count },
    [pscustomobject]@{ bucket = "QumulusAI_VFG_Compute or partner_consent_required"; count = @($records | Where-Object { ($_.primary_domain -eq "QumulusAI_VFG_Compute") -or (Has-AnyFlag -SensitivityFlags $_.sensitivity_flags -Needles @("partner_consent_required")) }).Count },
    [pscustomobject]@{ bucket = "Code_Repo_Work or code_repo_sensitive"; count = @($records | Where-Object { ($_.primary_domain -eq "Code_Repo_Work") -or (Has-AnyFlag -SensitivityFlags $_.sensitivity_flags -Needles @("code_repo_sensitive")) }).Count }
)

$summaryLines = @(
    "# Cross AI Source Summary",
    "",
    "This report is metadata-only and not canonical. It combines ChatGPT and Claude derived indexes without deduplicating records, normalizing meaning, merging facts, or resolving conflicts.",
    "",
    "## Totals By Source System",
    "",
    (New-MarkdownTable -Headers @("source_system", "count") -Rows $sourceSummary),
    "",
    "## Totals By Domain",
    "",
    (New-MarkdownTable -Headers @("domain", "count") -Rows $domainSummary),
    "",
    "## Totals By Sensitivity Flag",
    "",
    (New-MarkdownTable -Headers @("sensitivity_flag", "count") -Rows $sensitivitySummary),
    "",
    "## Key Counts",
    "",
    "- promotion candidate records: $promotionCandidateCount",
    "- review-required records: $reviewRequiredCount",
    "- unknown-domain records: $unknownDomainCount",
    "",
    "## High-Priority Review Buckets",
    "",
    (New-MarkdownTable -Headers @("bucket", "count") -Rows $highPriorityRows),
    "",
    "## Recommended Next Pass",
    "",
    "1. Review high-priority metadata buckets without reading full message bodies.",
    "2. Validate domain and sensitivity heuristics source by source before any deduplication attempt.",
    "3. Keep ChatGPT and Claude records separate until review standards and promotion rules are explicitly applied.",
    "4. Defer any normalized memory creation until review-required items have been triaged."
)
Write-Utf8File -Path $summaryPath -Content ($summaryLines -join "`n")

Write-Output $crossCsvPath
Write-Output $crossMdPath
Write-Output $summaryPath
