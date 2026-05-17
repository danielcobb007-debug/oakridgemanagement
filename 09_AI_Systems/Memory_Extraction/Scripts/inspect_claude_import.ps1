param(
    [string]$ZipPath = "",
    [string]$MemoryExtractionRoot = "",
    [string]$ClaudePath = "C:\Users\dpc\OneDrive - Oak Ridge Management (1)\Documents\Claude"
)

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

. (Join-Path $PSScriptRoot "MemoryExtraction.Common.ps1")

if ([string]::IsNullOrWhiteSpace($MemoryExtractionRoot)) {
    $MemoryExtractionRoot = Get-MemoryExtractionRoot
}

$reportPath = Get-OutputPath -MemoryExtractionRoot $MemoryExtractionRoot -RelativePath "Reports\CLAUDE_IMPORT_INVENTORY.md"

$exists = Test-Path -LiteralPath $ClaudePath
$lines = [System.Collections.Generic.List[string]]::new()
$lines.Add("# Claude Import Inventory")
$lines.Add("")
$lines.Add("This report inventories the Claude source separately from ChatGPT. No merge or normalization has been performed in this pass.")
$lines.Add("")
$lines.Add("- source_system: Claude")
$lines.Add("- inspected_path: $ClaudePath")
$lines.Add("- extraction_run_date: $((Get-Date).ToString('yyyy-MM-dd'))")
$lines.Add("")

if (-not $exists) {
    $lines.Add("## Status")
    $lines.Add("")
    $lines.Add("No Claude import source was found at the inspected path. Claude normalization should remain blocked until a concrete source archive or import folder is identified.")
    Write-Utf8File -Path $reportPath -Content ($lines -join "`n")
    Write-Output $reportPath
    return
}

$items = @(
    Get-ChildItem -Recurse -Depth 4 -Force -LiteralPath $ClaudePath -ErrorAction SilentlyContinue |
        Select-Object FullName, PSIsContainer, Length, LastWriteTime
)

$topRows = @(
    Get-ChildItem -Force -LiteralPath $ClaudePath -ErrorAction SilentlyContinue |
        Select-Object @{ Name = "name"; Expression = { $_.Name } }, @{ Name = "type"; Expression = { if ($_.PSIsContainer) { "directory" } else { "file" } } }, @{ Name = "size_bytes"; Expression = { if ($_.PSIsContainer) { "" } else { $_.Length } } }, LastWriteTime
)

$extensionRows = @(
    $items |
        Where-Object { -not $_.PSIsContainer } |
        Group-Object { [System.IO.Path]::GetExtension($_.FullName).ToLowerInvariant() } |
        Sort-Object @{ Expression = "Count"; Descending = $true }, @{ Expression = "Name"; Descending = $false } |
        ForEach-Object {
            [pscustomobject]@{
                extension = if ([string]::IsNullOrWhiteSpace($_.Name)) { "[no extension]" } else { $_.Name }
                count     = $_.Count
            }
        }
)

$schemaHints = @(
    $items |
        Where-Object { -not $_.PSIsContainer } |
        Select-Object -First 50 @{ Name = "path"; Expression = { $_.FullName } }, @{ Name = "size_bytes"; Expression = { $_.Length } }, LastWriteTime
)

$lines.Add("## Status")
$lines.Add("")
$lines.Add("Claude source material was located and inventoried separately. This pass does not assume it is a conversation export schema, and no normalization has been attempted.")
$lines.Add("")
$lines.Add("## Top Level")
$lines.Add("")
$lines.Add((New-MarkdownTable -Headers @("name", "type", "size_bytes", "LastWriteTime") -Rows $topRows))
$lines.Add("")
$lines.Add("## Extension Summary")
$lines.Add("")
$lines.Add((New-MarkdownTable -Headers @("extension", "count") -Rows $extensionRows))
$lines.Add("")
$lines.Add("## Sample Paths")
$lines.Add("")
$lines.Add((New-MarkdownTable -Headers @("path", "size_bytes", "LastWriteTime") -Rows $schemaHints))
$lines.Add("")
$lines.Add("## Provenance Note")
$lines.Add("")
$lines.Add("Any future Claude indexing should include source_system, source_archive_path, source_file, an equivalent conversation identifier if available, timestamps if available, extraction_run_date, and promotion_status.")

Write-Utf8File -Path $reportPath -Content ($lines -join "`n")
Write-Output $reportPath
