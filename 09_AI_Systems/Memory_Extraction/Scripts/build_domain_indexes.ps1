param(
    [string]$ZipPath = "",
    [string]$MemoryExtractionRoot = "",
    [string]$ConversationIndexCsv = ""
)

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

. (Join-Path $PSScriptRoot "MemoryExtraction.Common.ps1")

if ([string]::IsNullOrWhiteSpace($MemoryExtractionRoot)) {
    $MemoryExtractionRoot = Get-MemoryExtractionRoot
}

if ([string]::IsNullOrWhiteSpace($ConversationIndexCsv)) {
    $ConversationIndexCsv = Get-OutputPath -MemoryExtractionRoot $MemoryExtractionRoot -RelativePath "Reports\PROJECT_CONVERSATION_INDEX.csv"
}

$records = Import-CsvRecords -CsvPath $ConversationIndexCsv
$domainMap = Get-DomainFileMap
$outputPaths = [System.Collections.Generic.List[string]]::new()

foreach ($domain in $domainMap.Keys) {
    $matching = @($records | Where-Object { $_.primary_domain -eq $domain } | Sort-Object update_time, title)
    $outPath = Get-OutputPath -MemoryExtractionRoot $MemoryExtractionRoot -RelativePath ("Raw_Project_Extractions\" + $domainMap[$domain])
    $outputPaths.Add($outPath)

    $lines = @(
        "# $domain Domain Index",
        "",
        "This file is a metadata-only working extract. It is not canonical ORM memory.",
        "",
        "- Conversations in domain: $($matching.Count)",
        "- Source index: $ConversationIndexCsv",
        ""
    )

    if ($matching.Count -gt 0) {
        $table = New-MarkdownTable -Headers @(
            "source_system",
            "source_archive_path",
            "source_file",
            "conversation_id",
            "title",
            "create_time",
            "update_time",
            "extraction_run_date",
            "promotion_status",
            "approximate_message_count",
            "observed_roles",
            "sensitivity_flags"
        ) -Rows $matching
        $lines += @("## Conversations", "", $table)
    }
    else {
        $lines += @("No conversations matched this domain in the current pass.")
    }

    Write-Utf8File -Path $outPath -Content ($lines -join "`n")
}

$outputPaths
