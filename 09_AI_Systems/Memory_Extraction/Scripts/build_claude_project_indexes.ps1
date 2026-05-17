param(
    [string]$MemoryExtractionRoot = "",
    [string]$ClaudeSessionIndexCsv = ""
)

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

. (Join-Path $PSScriptRoot "MemoryExtraction.Common.ps1")

if ([string]::IsNullOrWhiteSpace($MemoryExtractionRoot)) {
    $MemoryExtractionRoot = Get-MemoryExtractionRoot
}

if ([string]::IsNullOrWhiteSpace($ClaudeSessionIndexCsv)) {
    $ClaudeSessionIndexCsv = Get-OutputPath -MemoryExtractionRoot $MemoryExtractionRoot -RelativePath "Reports\CLAUDE_SESSION_INDEX.csv"
}

$outRoot = Get-OutputPath -MemoryExtractionRoot $MemoryExtractionRoot -RelativePath "Raw_Project_Extractions\Claude"
New-Item -ItemType Directory -Path $outRoot -Force | Out-Null

$records = Import-CsvRecords -CsvPath $ClaudeSessionIndexCsv
$domainMap = [ordered]@{
    ORM                      = "CLAUDE_DOMAIN_INDEX_ORM.md"
    CEH                      = "CLAUDE_DOMAIN_INDEX_CEH.md"
    DGEI                     = "CLAUDE_DOMAIN_INDEX_DGEI.md"
    Georgia_Benefits_Group   = "CLAUDE_DOMAIN_INDEX_GBG.md"
    SBR_HUB_Benefits         = "CLAUDE_DOMAIN_INDEX_SBR_HUB_BENEFITS.md"
    QumulusAI_VFG_Compute    = "CLAUDE_DOMAIN_INDEX_QUMULUSAI_VFG_COMPUTE.md"
    Legal_Papering           = "CLAUDE_DOMAIN_INDEX_LEGAL_PAPERING.md"
    Capital_Strategy         = "CLAUDE_DOMAIN_INDEX_CAPITAL_STRATEGY.md"
    Personal_Operations      = "CLAUDE_DOMAIN_INDEX_PERSONAL_OPERATIONS.md"
    AI_Systems_Command_Layer = "CLAUDE_DOMAIN_INDEX_AI_SYSTEMS_COMMAND_LAYER.md"
    Code_Repo_Work           = "CLAUDE_DOMAIN_INDEX_CODE_REPO_WORK.md"
    Unknown                  = "CLAUDE_DOMAIN_INDEX_UNKNOWN.md"
}

$outputs = [System.Collections.Generic.List[string]]::new()
foreach ($domain in $domainMap.Keys) {
    $matching = @($records | Where-Object { $_.primary_domain -eq $domain } | Sort-Object last_timestamp, ai_title, source_file)
    $outPath = Join-Path $outRoot $domainMap[$domain]
    $outputs.Add($outPath)

    $lines = @(
        "# $domain Claude Domain Index",
        "",
        "This file contains raw and unreviewed Claude-derived metadata. It is not canonical ORM memory.",
        "",
        "- source_system: Claude",
        "- conversations in domain: $($matching.Count)",
        "- source index: $ClaudeSessionIndexCsv",
        ""
    )

    if ($matching.Count -gt 0) {
        $lines += @(
            "## Sessions",
            "",
            (New-MarkdownTable -Headers @("source_system", "source_file", "session_id", "ai_title", "workspace_hint", "first_timestamp", "last_timestamp", "event_count", "sensitivity_flags", "promotion_status") -Rows $matching)
        )
    }
    else {
        $lines += "No sessions matched this domain in the current pass."
    }

    Write-Utf8File -Path $outPath -Content ($lines -join "`n")
}

$readmePath = Join-Path $outRoot "README.md"
$readmeLines = @(
    "# Claude Raw Project Extractions",
    "",
    "Claude-derived outputs in this folder are raw and unreviewed.",
    "",
    "- Claude is a separate source system from ChatGPT.",
    "- Claude material lives outside the repo unless intentionally copied later.",
    "- Nothing becomes ORM memory until promoted through the promotion workflow.",
    "- Legal, SBR/HUB, partner-consent, personal, code/repo, and investor-sensitive materials require review."
)
Write-Utf8File -Path $readmePath -Content ($readmeLines -join "`n")
$outputs.Add($readmePath)

$outputs
