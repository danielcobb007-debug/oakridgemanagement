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

$reportPath = Get-OutputPath -MemoryExtractionRoot $MemoryExtractionRoot -RelativePath "Reports\CLAUDE_IMPORT_INVENTORY.md"

function Get-ClaudeJsonlFiles {
    param(
        [Parameter(Mandatory = $true)]
        [string]$Root
    )

    if (-not (Test-Path -LiteralPath $Root)) {
        return [pscustomobject]@{
            All      = @()
            TopLevel = @()
            Subagent = @()
        }
    }

    $all = @(
        Get-ChildItem -LiteralPath $Root -Recurse -File -Filter *.jsonl -ErrorAction SilentlyContinue |
            Sort-Object FullName
    )
    $topLevel = @($all | Where-Object { $_.FullName -notmatch '\\subagents\\' })
    $subagent = @($all | Where-Object { $_.FullName -match '\\subagents\\' })

    return [pscustomobject]@{
        All      = $all
        TopLevel = $topLevel
        Subagent = $subagent
    }
}

function Get-SchemaSummary {
    param(
        [Parameter(Mandatory = $true)]
        [System.IO.FileInfo[]]$SampleFiles
    )

    $eventTypes = [System.Collections.Generic.HashSet[string]]::new()
    $fields = [System.Collections.Generic.HashSet[string]]::new()
    $titlePresent = $false
    $cwdPresent = $false
    $gitPresent = $false
    $timestampPresent = $false
    $toolPresent = $false
    $rolesPresent = $false

    foreach ($file in $SampleFiles) {
        foreach ($line in [System.IO.File]::ReadLines($file.FullName)) {
            if ([string]::IsNullOrWhiteSpace($line)) {
                continue
            }

            $record = $line | ConvertFrom-Json -Depth 80
            $propertyNames = @($record.PSObject.Properties.Name)
            foreach ($propertyName in $propertyNames) {
                [void]$fields.Add($propertyName)
            }

            if ($propertyNames -contains "type" -and $record.type) {
                [void]$eventTypes.Add([string]$record.type)
                if ($record.type -in @("user", "assistant")) {
                    $rolesPresent = $true
                }
            }

            if ($propertyNames -contains "aiTitle" -and $record.aiTitle) {
                $titlePresent = $true
            }

            if ($propertyNames -contains "cwd" -and $record.cwd) {
                $cwdPresent = $true
            }

            if ($propertyNames -contains "gitBranch" -and $record.gitBranch) {
                $gitPresent = $true
            }

            if ($propertyNames -contains "timestamp" -and $record.timestamp) {
                $timestampPresent = $true
            }

            if (
                ($propertyNames -contains "toolUseResult" -and $record.toolUseResult) -or
                ($propertyNames -contains "sourceToolAssistantUUID" -and $record.sourceToolAssistantUUID)
            ) {
                $toolPresent = $true
            }
        }
    }

    return [pscustomobject]@{
        EventTypes       = @($eventTypes | Sort-Object)
        Fields           = @($fields | Sort-Object)
        TitlePresent     = $titlePresent
        CwdPresent       = $cwdPresent
        GitPresent       = $gitPresent
        TimestampPresent = $timestampPresent
        ToolPresent      = $toolPresent
        RolesPresent     = $rolesPresent
    }
}

$importExists = Test-Path -LiteralPath $CodexImportPath
$importRecords = @()
if ($importExists) {
    $importJson = Get-Content -LiteralPath $CodexImportPath -Raw | ConvertFrom-Json
    $importRecords = @($importJson.records)
}

$jsonl = Get-ClaudeJsonlFiles -Root $ClaudeProjectsRoot
$allFiles = $jsonl.All
$topLevelFiles = $jsonl.TopLevel
$subagentFiles = $jsonl.Subagent
$schemaSummary = Get-SchemaSummary -SampleFiles ($topLevelFiles | Select-Object -First 3)

$workspaceRows = @(
    Get-ChildItem -LiteralPath $ClaudeProjectsRoot -Directory -ErrorAction SilentlyContinue |
        Sort-Object LastWriteTime -Descending |
        Select-Object @{ Name = "workspace"; Expression = { $_.Name } }, @{ Name = "last_write_time"; Expression = { $_.LastWriteTime.ToString("yyyy-MM-dd HH:mm:ss") } }
)

$largestRows = @(
    $allFiles |
        Sort-Object Length -Descending |
        Select-Object -First 15 @{ Name = "path"; Expression = { $_.FullName } }, @{ Name = "size_bytes"; Expression = { $_.Length } }, @{ Name = "last_write_time"; Expression = { $_.LastWriteTime.ToString("yyyy-MM-dd HH:mm:ss") } }
)

$sourcePathRows = @(
    $importRecords |
        Select-Object @{ Name = "source_path"; Expression = { $_.source_path } }, @{ Name = "imported_thread_id"; Expression = { $_.imported_thread_id } }, @{ Name = "imported_at"; Expression = { Convert-TimeValue $_.imported_at } }
)

$dateMin = ""
$dateMax = ""
$totalBytes = 0
if ($allFiles.Count -gt 0) {
    $dateMin = ($allFiles | Sort-Object LastWriteTime | Select-Object -First 1).LastWriteTime.ToString("yyyy-MM-dd HH:mm:ss")
    $dateMax = ($allFiles | Sort-Object LastWriteTime -Descending | Select-Object -First 1).LastWriteTime.ToString("yyyy-MM-dd HH:mm:ss")
    $totalBytes = ($allFiles | Measure-Object Length -Sum).Sum
}

$lines = [System.Collections.Generic.List[string]]::new()
$lines.Add("# Claude Import Inventory")
$lines.Add("")
$lines.Add("This is a read-only inspection report for Claude and Codex session sources. No .claude or .codex files were modified, and Claude has not been merged with ChatGPT.")
$lines.Add("")
$lines.Add("## Status")
$lines.Add("")
$lines.Add("- source_system: Claude")
$lines.Add("- extraction_run_date: $((Get-Date).ToString('yyyy-MM-dd'))")
$lines.Add("- Codex import metadata exists: $(if ($importExists) { 'yes' } else { 'no' })")
$lines.Add("- imported session records found: $($importRecords.Count)")
$lines.Add("- top-level Claude session JSONL files: $($topLevelFiles.Count)")
$lines.Add("- subagent Claude JSONL files: $($subagentFiles.Count)")
$lines.Add("- total Claude JSONL files: $($allFiles.Count)")
$lines.Add("- total observed bytes: $totalBytes")
$lines.Add("- observed file date range: $dateMin to $dateMax")
$lines.Add("")
$lines.Add("## Source Locations Inspected")
$lines.Add("")
$lines.Add("- $CodexImportPath")
$lines.Add("- $ClaudeProjectsRoot")
$lines.Add("")
$lines.Add("## Codex Import Records")
$lines.Add("")
$lines.Add((New-MarkdownTable -Headers @("source_path", "imported_thread_id", "imported_at") -Rows $sourcePathRows))
$lines.Add("")
$lines.Add("## Likely Workspaces")
$lines.Add("")
$lines.Add((New-MarkdownTable -Headers @("workspace", "last_write_time") -Rows $workspaceRows))
$lines.Add("")
$lines.Add("## Largest Session Files")
$lines.Add("")
$lines.Add((New-MarkdownTable -Headers @("path", "size_bytes", "last_write_time") -Rows $largestRows))
$lines.Add("")
$lines.Add("## Observed Schema")
$lines.Add("")
$lines.Add("- top-level format: JSONL event stream")
$lines.Add("- user or assistant roles available: $($schemaSummary.RolesPresent.ToString().ToLowerInvariant())")
$lines.Add("- timestamps available: $($schemaSummary.TimestampPresent.ToString().ToLowerInvariant())")
$lines.Add("- workspace cwd available: $($schemaSummary.CwdPresent.ToString().ToLowerInvariant())")
$lines.Add("- git branch available: $($schemaSummary.GitPresent.ToString().ToLowerInvariant())")
$lines.Add("- title signals available through aiTitle: $($schemaSummary.TitlePresent.ToString().ToLowerInvariant())")
$lines.Add("- tool linkage fields observed: $($schemaSummary.ToolPresent.ToString().ToLowerInvariant())")
$lines.Add("")
$lines.Add("Observed event types:")
$lines.Add("")
foreach ($eventType in $schemaSummary.EventTypes) {
    $lines.Add("- $eventType")
}
$lines.Add("")
$lines.Add("Observed top-level fields:")
$lines.Add("")
foreach ($field in $schemaSummary.Fields) {
    $lines.Add("- $field")
}
$lines.Add("")
$lines.Add("## Provenance And Safety")
$lines.Add("")
$lines.Add("- source provenance can be preserved later: yes")
$lines.Add("- Claude source system is distinct from the ChatGPT export: yes")
$lines.Add("- Claude source lives outside the repo unless intentionally copied later: yes")
$lines.Add("- content appears indexable later with a dedicated parser: yes")
$lines.Add("- subagent logs should be separated from top-level sessions in the first indexing pass: yes")
$lines.Add("")
$lines.Add("## Recommended Next Extraction Steps")
$lines.Add("")
$lines.Add("1. Build a dedicated Claude metadata index from top-level session JSONL files only.")
$lines.Add("2. Preserve source_system, source_archive_path, source_file, session_id, timestamps, workspace hints, extraction_run_date, and promotion_status on every record.")
$lines.Add("3. Track subagent files separately and keep them excluded or explicitly flagged in the first pass.")
$lines.Add("4. Build Claude-only domain indexes and sensitivity review queues without merging with ChatGPT outputs.")
$lines.Add("5. Delay normalization until Claude and ChatGPT inventories are both stable and separately reviewed.")
$lines.Add("")
$lines.Add("## Risks And Safety Findings")
$lines.Add("")
$lines.Add("- Claude sessions likely contain repo and code work: yes")
$lines.Add("- ORM command layer work likely present: yes")
$lines.Add("- CEH work likely present: yes")
$lines.Add("- DGEI work likely present: yes")
$lines.Add("- legal or papering content may be present: possible")
$lines.Add("- SBR or HUB sensitive material may be present: possible")
$lines.Add("- partner or capital sensitive content may be present: likely")
$lines.Add("- personal or private content may be present: possible")

Write-Utf8File -Path $reportPath -Content ($lines -join "`n")
Write-Output $reportPath
