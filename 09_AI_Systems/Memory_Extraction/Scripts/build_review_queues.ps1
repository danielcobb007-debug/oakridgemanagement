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
$legalPath = Get-OutputPath -MemoryExtractionRoot $MemoryExtractionRoot -RelativePath "Legal_Sensitive\LEGAL_SENSITIVE_REVIEW_QUEUE.md"
$partnerPath = Get-OutputPath -MemoryExtractionRoot $MemoryExtractionRoot -RelativePath "Partner_Consent_Required\PARTNER_CONSENT_REVIEW_QUEUE.md"
$promotionPath = Get-OutputPath -MemoryExtractionRoot $MemoryExtractionRoot -RelativePath "Promotion_Queue\PROMOTION_CANDIDATE_QUEUE.md"
$summaryPath = Get-OutputPath -MemoryExtractionRoot $MemoryExtractionRoot -RelativePath "Reports\SENSITIVE_REVIEW_QUEUE_SUMMARY.md"

function Select-FlaggedRecords {
    param(
        [object[]]$Rows,
        [string]$Flag
    )

    return @($Rows | Where-Object { $_.sensitivity_flags -split '\|' | Where-Object { $_ -eq $Flag } } | Sort-Object update_time, title)
}

$legalRows = Select-FlaggedRecords -Rows $records -Flag "legal_sensitive"
$partnerRows = Select-FlaggedRecords -Rows $records -Flag "partner_consent_required"
$personalRows = Select-FlaggedRecords -Rows $records -Flag "personal_private"
$sbrRows = Select-FlaggedRecords -Rows $records -Flag "sbr_hub_sensitive"
$investorRows = Select-FlaggedRecords -Rows $records -Flag "investor_capital_sensitive"
$promotionRows = Select-FlaggedRecords -Rows $records -Flag "promotion_candidate"

function Write-QueueReport {
    param(
        [string]$Path,
        [string]$Title,
        [object[]]$Rows
    )

    $lines = @(
        "# $Title",
        "",
        "This queue is metadata-only and requires manual review before any promotion or external use.",
        "",
        "- Conversations in queue: $($Rows.Count)",
        ""
    )

    if ($Rows.Count -gt 0) {
        $lines += @(
            "## Conversations",
            "",
            (New-MarkdownTable -Headers @("source_system", "source_archive_path", "source_file", "conversation_id", "title", "update_time", "extraction_run_date", "promotion_status", "primary_domain", "observed_roles", "sensitivity_flags") -Rows $Rows)
        )
    }
    else {
        $lines += "No conversations matched this queue in the current pass."
    }

    Write-Utf8File -Path $Path -Content ($lines -join "`n")
}

Write-QueueReport -Path $legalPath -Title "Legal Sensitive Review Queue" -Rows $legalRows
Write-QueueReport -Path $partnerPath -Title "Partner Consent Review Queue" -Rows $partnerRows
Write-QueueReport -Path $promotionPath -Title "Promotion Candidate Queue" -Rows $promotionRows

$summaryRows = @(
    [pscustomobject]@{ queue = "legal_sensitive"; count = $legalRows.Count },
    [pscustomobject]@{ queue = "partner_consent_required"; count = $partnerRows.Count },
    [pscustomobject]@{ queue = "personal_private"; count = $personalRows.Count },
    [pscustomobject]@{ queue = "sbr_hub_sensitive"; count = $sbrRows.Count },
    [pscustomobject]@{ queue = "investor_capital_sensitive"; count = $investorRows.Count },
    [pscustomobject]@{ queue = "promotion_candidate"; count = $promotionRows.Count }
)

$summaryLines = @(
    "# Sensitive Review Queue Summary",
    "",
    "This summary is derived from metadata-only classification and lightweight keyword matching.",
    "",
    (New-MarkdownTable -Headers @("queue", "count") -Rows $summaryRows)
)

Write-Utf8File -Path $summaryPath -Content ($summaryLines -join "`n")

Write-Output $legalPath
Write-Output $partnerPath
Write-Output $promotionPath
Write-Output $summaryPath
