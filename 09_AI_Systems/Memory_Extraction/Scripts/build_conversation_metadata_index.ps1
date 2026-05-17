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

$csvPath = Get-OutputPath -MemoryExtractionRoot $MemoryExtractionRoot -RelativePath "Reports\PROJECT_CONVERSATION_INDEX.csv"
$mdPath = Get-OutputPath -MemoryExtractionRoot $MemoryExtractionRoot -RelativePath "Reports\PROJECT_CONVERSATION_INDEX.md"

$records = Get-ConversationMetadataRecords -ZipPath $ZipPath | Sort-Object primary_domain, update_time, title
Write-RecordsCsv -Path $csvPath -Records $records

$domainSummary = $records |
    Group-Object primary_domain |
    Sort-Object @{ Expression = "Count"; Descending = $true }, @{ Expression = "Name"; Descending = $false } |
    ForEach-Object {
        [pscustomobject]@{
            domain = $_.Name
            count  = $_.Count
        }
    }

$sensitivitySummary = @()
foreach ($flag in (Get-SensitivityFlagDescriptions).Keys) {
    $count = @($records | Where-Object { $_.sensitivity_flags -split '\|' | Where-Object { $_ -eq $flag } }).Count
    $sensitivitySummary += [pscustomobject]@{
        flag  = $flag
        count = $count
    }
}

$previewRows = $records |
    Select-Object -First 150 source_system, source_archive_path, source_file, conversation_id, title, create_time, update_time, extraction_run_date, promotion_status, primary_domain, approximate_message_count, observed_roles, sensitivity_flags

$lines = @(
    "# Project Conversation Index",
    "",
    "This report contains metadata-only derived outputs from the ChatGPT export. No full message bodies are reproduced.",
    "",
    "## Summary",
    "",
    "- Conversations indexed: $($records.Count)",
    "- ZIP source: $ZipPath",
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
    "The full dataset is available in `PROJECT_CONVERSATION_INDEX.csv`. The preview below is limited to the first 150 rows for readability.",
    "",
    (New-MarkdownTable -Headers @("source_system", "source_archive_path", "source_file", "conversation_id", "title", "create_time", "update_time", "extraction_run_date", "promotion_status", "primary_domain", "approximate_message_count", "observed_roles", "sensitivity_flags") -Rows $previewRows)
)

Write-Utf8File -Path $mdPath -Content ($lines -join "`n")

Write-Output $csvPath
Write-Output $mdPath
