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

$csvPath = Get-OutputPath -MemoryExtractionRoot $MemoryExtractionRoot -RelativePath "Reports\ATTACHMENT_MANIFEST.csv"
$mdPath = Get-OutputPath -MemoryExtractionRoot $MemoryExtractionRoot -RelativePath "Reports\ATTACHMENT_MANIFEST.md"

$records = Get-AttachmentManifestRecords -ZipPath $ZipPath
Write-RecordsCsv -Path $csvPath -Records $records

$typeSummary = $records |
    Group-Object likely_file_type |
    Sort-Object @{ Expression = "Count"; Descending = $true }, @{ Expression = "Name"; Descending = $false } |
    ForEach-Object {
        [pscustomobject]@{
            likely_file_type = $_.Name
            count            = $_.Count
        }
    }

$reviewSummary = $records |
    Group-Object manual_review_recommended |
    Sort-Object @{ Expression = "Count"; Descending = $true }, @{ Expression = "Name"; Descending = $false } |
    ForEach-Object {
        [pscustomobject]@{
            manual_review_recommended = $_.Name
            count                     = $_.Count
        }
    }

$previewRows = $records | Select-Object -First 150 zip_path, extension, size_bytes, likely_file_type, content_classification, manual_review_recommended
$previewRows = $records | Select-Object -First 150 source_system, source_archive_path, source_file, extraction_run_date, promotion_status, zip_path, extension, size_bytes, likely_file_type, content_classification, manual_review_recommended

$lines = @(
    "# Attachment Manifest",
    "",
    "This manifest lists ZIP members that are not part of the conversation metadata files. Attachments were not extracted in this pass.",
    "",
    "- Attachment-like members indexed: $($records.Count)",
    "- Source ZIP: $ZipPath",
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
    "The full manifest is available in `ATTACHMENT_MANIFEST.csv`. The preview below is limited to the first 150 rows for readability.",
    "",
    (New-MarkdownTable -Headers @("source_system", "source_archive_path", "source_file", "extraction_run_date", "promotion_status", "zip_path", "extension", "size_bytes", "likely_file_type", "content_classification", "manual_review_recommended") -Rows $previewRows)
)

Write-Utf8File -Path $mdPath -Content ($lines -join "`n")

Write-Output $csvPath
Write-Output $mdPath
