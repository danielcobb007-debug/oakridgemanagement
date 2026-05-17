param(
    [string]$ZipPath = "",
    [string]$MemoryExtractionRoot = "",
    [string]$ChatGPTConversationIndexCsv = ""
)

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

. (Join-Path $PSScriptRoot "MemoryExtraction.Common.ps1")

if ([string]::IsNullOrWhiteSpace($MemoryExtractionRoot)) {
    $MemoryExtractionRoot = Get-MemoryExtractionRoot
}

if ([string]::IsNullOrWhiteSpace($ChatGPTConversationIndexCsv)) {
    $ChatGPTConversationIndexCsv = Get-OutputPath -MemoryExtractionRoot $MemoryExtractionRoot -RelativePath "Reports\CHATGPT_CONVERSATION_INDEX.csv"
}

$outRoot = Get-OutputPath -MemoryExtractionRoot $MemoryExtractionRoot -RelativePath "Raw_Project_Extractions\ChatGPT"
New-Item -ItemType Directory -Path $outRoot -Force | Out-Null

$records = Import-CsvRecords -CsvPath $ChatGPTConversationIndexCsv
$domainMap = [ordered]@{
    ORM                      = "CHATGPT_DOMAIN_INDEX_ORM.md"
    CEH                      = "CHATGPT_DOMAIN_INDEX_CEH.md"
    DGEI                     = "CHATGPT_DOMAIN_INDEX_DGEI.md"
    Georgia_Benefits_Group   = "CHATGPT_DOMAIN_INDEX_GBG.md"
    SBR_HUB_Benefits         = "CHATGPT_DOMAIN_INDEX_SBR_HUB_BENEFITS.md"
    QumulusAI_VFG_Compute    = "CHATGPT_DOMAIN_INDEX_QUMULUSAI_VFG_COMPUTE.md"
    Legal_Papering           = "CHATGPT_DOMAIN_INDEX_LEGAL_PAPERING.md"
    Capital_Strategy         = "CHATGPT_DOMAIN_INDEX_CAPITAL_STRATEGY.md"
    Personal_Operations      = "CHATGPT_DOMAIN_INDEX_PERSONAL_OPERATIONS.md"
    AI_Systems_Command_Layer = "CHATGPT_DOMAIN_INDEX_AI_SYSTEMS_COMMAND_LAYER.md"
    Code_Repo_Work           = "CHATGPT_DOMAIN_INDEX_CODE_REPO_WORK.md"
    Unknown                  = "CHATGPT_DOMAIN_INDEX_UNKNOWN.md"
}

$outputs = [System.Collections.Generic.List[string]]::new()
foreach ($domain in $domainMap.Keys) {
    $matching = @($records | Where-Object { $_.primary_domain -eq $domain } | Sort-Object update_time, title, source_file)
    $outPath = Join-Path $outRoot $domainMap[$domain]
    $outputs.Add($outPath)

    $lines = @(
        "# $domain ChatGPT Domain Index",
        "",
        "This file contains raw and unreviewed ChatGPT-derived metadata. It is not canonical ORM memory.",
        "",
        "- source_system: ChatGPT",
        "- conversations in domain: $(@($matching).Count)",
        "- source index: $ChatGPTConversationIndexCsv",
        ""
    )

    if (@($matching).Count -gt 0) {
        $lines += @(
            "## Conversations",
            "",
            (New-MarkdownTable -Headers @("source_system", "source_file", "conversation_id", "title", "create_time", "update_time", "approximate_message_count", "sensitivity_flags", "promotion_status") -Rows @($matching))
        )
    }
    else {
        $lines += "No conversations matched this domain in the current pass."
    }

    Write-Utf8File -Path $outPath -Content ($lines -join "`n")
}

$readmePath = Join-Path $outRoot "README.md"
$readmeLines = @(
    "# ChatGPT Raw Project Extractions",
    "",
    "ChatGPT-derived outputs in this folder are raw and unreviewed.",
    "",
    "- ChatGPT is a separate source system from Claude.",
    "- The raw source archive remains the official ChatGPT export ZIP.",
    "- Nothing becomes ORM memory until promoted through the promotion workflow.",
    "- Legal, SBR/HUB, partner-consent, personal, code/repo, and investor-sensitive materials require review."
)
Write-Utf8File -Path $readmePath -Content ($readmeLines -join "`n")
$outputs.Add($readmePath)

$outputs
