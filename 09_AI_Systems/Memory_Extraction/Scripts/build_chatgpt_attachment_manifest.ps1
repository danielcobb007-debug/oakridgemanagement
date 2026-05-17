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

$csvPath = Get-OutputPath -MemoryExtractionRoot $MemoryExtractionRoot -RelativePath "Reports\CHATGPT_ATTACHMENT_MANIFEST.csv"
$mdPath = Get-OutputPath -MemoryExtractionRoot $MemoryExtractionRoot -RelativePath "Reports\CHATGPT_ATTACHMENT_MANIFEST.md"

$records = Get-AttachmentManifestRecords -ZipPath $ZipPath
Write-RecordsCsv -Path $csvPath -Records $records

$typeSummary = @(
    $records |
        Group-Object likely_file_type |
        Sort-Object @{ Expression = "Count"; Descending = $true }, @{ Expression = "Name"; Descending = $false } |
        ForEach-Object { [pscustomobject]@{ likely_file_type = $_.Name; count = $_.Count } }
)

$reviewSummary = @(
    $records |
        Group-Object manual_review_recommended |
        Sort-Object @{ Expression = "Count"; Descending = $true }, @{ Expression = "Name"; Descending = $false } |
        ForEach-Object { [pscustomobject]@{ manual_review_recommended = $_.Name; count = $_.Count } }
)

$previewRows = $records |
    Select-Object -First 120 source_system, source_archive_path, source_file, extension, size_bytes, likely_file_type, content_classification, manual_review_recommended, promotion_status

$lines = @(
    "# ChatGPT Attachment Manifest",
    "",
    "This manifest lists ChatGPT ZIP members that are not part of the conversation shard metadata files. Attachments were not extracted in this pass.",
    "",
    "- source_system: ChatGPT",
    "- source_archive_path: $ZipPath",
    "- attachment-like members indexed: $(@($records).Count)",
    "",
    "## Likely File Types",
    "",
    (New-MarkdownTable -Headers @("likely_file_type", "count") -Rows $typeSummary),
    "",
    "## Manual Review Summary",
    "",
    (New-MarkdownTable -Headers @("manual_review_recommended", "count") -Rows $reviewSummary),
    "",
    "## Preview",
    "",
    "The full manifest is available in CHATGPT_ATTACHMENT_MANIFEST.csv. The preview below is limited for readability.",
    "",
    (New-MarkdownTable -Headers @("source_system", "source_archive_path", "source_file", "extension", "size_bytes", "likely_file_type", "content_classification", "manual_review_recommended", "promotion_status") -Rows $previewRows)
)

Write-Utf8File -Path $mdPath -Content ($lines -join "`n")

Write-Output $csvPath
Write-Output $mdPath
