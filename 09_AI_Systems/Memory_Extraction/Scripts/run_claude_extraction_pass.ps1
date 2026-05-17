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

$outputPaths = [System.Collections.Generic.List[string]]::new()

foreach ($scriptName in @(
    "inventory_claude_import.ps1",
    "build_claude_session_metadata_index.ps1",
    "build_claude_project_indexes.ps1",
    "build_claude_review_queues.ps1"
)) {
    $scriptPath = Join-Path $PSScriptRoot $scriptName
    $results = & $scriptPath -CodexImportPath $CodexImportPath -ClaudeProjectsRoot $ClaudeProjectsRoot -MemoryExtractionRoot $MemoryExtractionRoot
    foreach ($item in @($results)) {
        if ($item) { $outputPaths.Add([string]$item) }
    }
}

$sessionCsv = Get-OutputPath -MemoryExtractionRoot $MemoryExtractionRoot -RelativePath "Reports\CLAUDE_SESSION_INDEX.csv"
$records = Import-CsvRecords -CsvPath $sessionCsv
$allJsonl = @(
    Get-ChildItem -LiteralPath $ClaudeProjectsRoot -Recurse -File -Filter *.jsonl -ErrorAction SilentlyContinue |
        Sort-Object FullName
)
$topLevel = @($allJsonl | Where-Object { $_.FullName -notmatch '\\subagents\\' })
$subagents = @($allJsonl | Where-Object { $_.FullName -match '\\subagents\\' })

$domainCounts = @(
    $records |
        Group-Object primary_domain |
        Sort-Object @{ Expression = "Count"; Descending = $true }, @{ Expression = "Name"; Descending = $false } |
        ForEach-Object { "{0}`t{1}" -f $_.Name, $_.Count }
)

$flags = @("legal_sensitive", "partner_consent_required", "personal_private", "sbr_hub_sensitive", "investor_capital_sensitive", "code_repo_sensitive", "promotion_candidate")
$sensitivityCounts = foreach ($flag in $flags) {
    "{0}`t{1}" -f $flag, (@($records | Where-Object { $_.sensitivity_flags -split '\|' | Where-Object { $_ -eq $flag } }).Count)
}

Write-Output "OUTPUT_PATHS"
$outputPaths | Sort-Object -Unique | ForEach-Object { Write-Output $_ }
Write-Output "SESSION_COUNTS"
Write-Output ("TOP_LEVEL_INDEXED`t{0}" -f $topLevel.Count)
Write-Output ("SUBAGENT_DETECTED`t{0}" -f $subagents.Count)
Write-Output "DOMAIN_COUNTS"
$domainCounts | ForEach-Object { Write-Output $_ }
Write-Output "SENSITIVITY_COUNTS"
$sensitivityCounts | ForEach-Object { Write-Output $_ }
