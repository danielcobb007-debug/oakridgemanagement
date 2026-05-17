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

$outputPaths = [System.Collections.Generic.List[string]]::new()

foreach ($scriptName in @(
    "inspect_chatgpt_export.ps1",
    "build_chatgpt_conversation_metadata_index.ps1",
    "build_chatgpt_domain_indexes.ps1",
    "build_chatgpt_attachment_manifest.ps1",
    "build_chatgpt_review_queues.ps1"
)) {
    $scriptPath = Join-Path $PSScriptRoot $scriptName
    $results = & $scriptPath -ZipPath $ZipPath -MemoryExtractionRoot $MemoryExtractionRoot
    foreach ($item in @($results)) {
        if ($item) { $outputPaths.Add([string]$item) }
    }
}

$conversationCsv = Get-OutputPath -MemoryExtractionRoot $MemoryExtractionRoot -RelativePath "Reports\CHATGPT_CONVERSATION_INDEX.csv"
$attachmentCsv = Get-OutputPath -MemoryExtractionRoot $MemoryExtractionRoot -RelativePath "Reports\CHATGPT_ATTACHMENT_MANIFEST.csv"
$conversationRecords = Import-CsvRecords -CsvPath $conversationCsv
$attachmentRecords = Import-CsvRecords -CsvPath $attachmentCsv

$domainCounts = @(
    $conversationRecords |
        Group-Object primary_domain |
        Sort-Object @{ Expression = "Count"; Descending = $true }, @{ Expression = "Name"; Descending = $false } |
        ForEach-Object { "{0}`t{1}" -f $_.Name, $_.Count }
)

$flags = @("legal_sensitive", "partner_consent_required", "personal_private", "sbr_hub_sensitive", "investor_capital_sensitive", "code_repo_sensitive", "promotion_candidate")
$sensitivityCounts = foreach ($flag in $flags) {
    "{0}`t{1}" -f $flag, (@($conversationRecords | Where-Object { $_.sensitivity_flags -split '\|' | Where-Object { $_ -eq $flag } }).Count)
}

Write-Output "OUTPUT_PATHS"
$outputPaths | Sort-Object -Unique | ForEach-Object { Write-Output $_ }
Write-Output "COUNTS"
Write-Output ("CONVERSATIONS_INDEXED`t{0}" -f @($conversationRecords).Count)
Write-Output ("ATTACHMENTS_LISTED`t{0}" -f @($attachmentRecords).Count)
Write-Output "DOMAIN_COUNTS"
$domainCounts | ForEach-Object { Write-Output $_ }
Write-Output "SENSITIVITY_COUNTS"
$sensitivityCounts | ForEach-Object { Write-Output $_ }
