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
    "inspect_claude_import.ps1",
    "build_conversation_metadata_index.ps1",
    "build_domain_indexes.ps1",
    "build_attachment_manifest.ps1",
    "build_review_queues.ps1"
)) {
    $scriptPath = Join-Path $PSScriptRoot $scriptName
    $results = & $scriptPath -ZipPath $ZipPath -MemoryExtractionRoot $MemoryExtractionRoot
    foreach ($item in @($results)) {
        if ($item) {
            $outputPaths.Add([string]$item)
        }
    }
}

$conversationCsv = Get-OutputPath -MemoryExtractionRoot $MemoryExtractionRoot -RelativePath "Reports\PROJECT_CONVERSATION_INDEX.csv"
$records = Import-CsvRecords -CsvPath $conversationCsv

$domainCounts = $records |
    Group-Object primary_domain |
    Sort-Object @{ Expression = "Count"; Descending = $true }, @{ Expression = "Name"; Descending = $false } |
    ForEach-Object {
        [pscustomobject]@{
            domain = $_.Name
            count  = $_.Count
        }
    }

$sensitivityRows = foreach ($flag in (Get-SensitivityFlagDescriptions).Keys) {
    [pscustomobject]@{
        flag  = $flag
        count = @($records | Where-Object { $_.sensitivity_flags -split '\|' | Where-Object { $_ -eq $flag } }).Count
    }
}

Write-Output "OUTPUT_PATHS"
$outputPaths | Sort-Object -Unique | ForEach-Object { Write-Output $_ }
Write-Output "DOMAIN_COUNTS"
$domainCounts | ForEach-Object { Write-Output ("{0}`t{1}" -f $_.domain, $_.count) }
Write-Output "SENSITIVITY_COUNTS"
$sensitivityRows | ForEach-Object { Write-Output ("{0}`t{1}" -f $_.flag, $_.count) }
