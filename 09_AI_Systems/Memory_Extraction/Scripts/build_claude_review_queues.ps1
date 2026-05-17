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

$records = Import-CsvRecords -CsvPath $ClaudeSessionIndexCsv

function Select-ClaudeFlaggedRecords {
    param(
        [object[]]$Rows,
        [string]$Flag
    )
    return @($Rows | Where-Object { $_.sensitivity_flags -split '\|' | Where-Object { $_ -eq $Flag } } | Sort-Object last_timestamp, ai_title, source_file)
}

$legalRows = Select-ClaudeFlaggedRecords -Rows $records -Flag "legal_sensitive"
$partnerRows = Select-ClaudeFlaggedRecords -Rows $records -Flag "partner_consent_required"
$personalRows = Select-ClaudeFlaggedRecords -Rows $records -Flag "personal_private"
$sbrRows = Select-ClaudeFlaggedRecords -Rows $records -Flag "sbr_hub_sensitive"
$investorRows = Select-ClaudeFlaggedRecords -Rows $records -Flag "investor_capital_sensitive"
$codeRows = Select-ClaudeFlaggedRecords -Rows $records -Flag "code_repo_sensitive"
$promotionRows = Select-ClaudeFlaggedRecords -Rows $records -Flag "promotion_candidate"

function Write-ClaudeQueue {
    param(
        [string]$Path,
        [string]$Title,
        [object[]]$Rows
    )

    $safeRows = @()
    if ($null -ne $Rows) {
        $safeRows = @($Rows | Where-Object { $null -ne $_ })
    }
    $rowCount = $safeRows.Count

    $lines = @(
        "# $Title",
        "",
        "This queue is Claude-derived metadata only and requires manual review before any broader use.",
        "",
        "- sessions in queue: $rowCount",
        ""
    )

    if ($rowCount -gt 0) {
        $lines += @(
            "## Sessions",
            "",
            (New-MarkdownTable -Headers @("source_system", "source_file", "session_id", "ai_title", "workspace_hint", "last_timestamp", "primary_domain", "sensitivity_flags", "promotion_status") -Rows $safeRows)
        )
    }
    else {
        $lines += "No sessions matched this queue in the current pass."
    }

    Write-Utf8File -Path $Path -Content ($lines -join "`n")
}

$legalPath = Get-OutputPath -MemoryExtractionRoot $MemoryExtractionRoot -RelativePath "Legal_Sensitive\CLAUDE_LEGAL_SENSITIVE_REVIEW_QUEUE.md"
$partnerPath = Get-OutputPath -MemoryExtractionRoot $MemoryExtractionRoot -RelativePath "Partner_Consent_Required\CLAUDE_PARTNER_CONSENT_REVIEW_QUEUE.md"
$promotionPath = Get-OutputPath -MemoryExtractionRoot $MemoryExtractionRoot -RelativePath "Promotion_Queue\CLAUDE_PROMOTION_CANDIDATE_QUEUE.md"
$summaryPath = Get-OutputPath -MemoryExtractionRoot $MemoryExtractionRoot -RelativePath "Reports\CLAUDE_SENSITIVE_REVIEW_QUEUE_SUMMARY.md"

$legalCount = @($legalRows | Where-Object { $null -ne $_ }).Count
$partnerCount = @($partnerRows | Where-Object { $null -ne $_ }).Count
$personalCount = @($personalRows | Where-Object { $null -ne $_ }).Count
$sbrCount = @($sbrRows | Where-Object { $null -ne $_ }).Count
$investorCount = @($investorRows | Where-Object { $null -ne $_ }).Count
$codeCount = @($codeRows | Where-Object { $null -ne $_ }).Count
$promotionCount = @($promotionRows | Where-Object { $null -ne $_ }).Count

Write-ClaudeQueue -Path $legalPath -Title "Claude Legal Sensitive Review Queue" -Rows $legalRows
Write-ClaudeQueue -Path $partnerPath -Title "Claude Partner Consent Review Queue" -Rows $partnerRows
Write-ClaudeQueue -Path $promotionPath -Title "Claude Promotion Candidate Queue" -Rows $promotionRows

$summaryRows = @(
    [pscustomobject]@{ queue = "legal_sensitive"; count = $legalCount },
    [pscustomobject]@{ queue = "partner_consent_required"; count = $partnerCount },
    [pscustomobject]@{ queue = "personal_private"; count = $personalCount },
    [pscustomobject]@{ queue = "sbr_hub_sensitive"; count = $sbrCount },
    [pscustomobject]@{ queue = "investor_capital_sensitive"; count = $investorCount },
    [pscustomobject]@{ queue = "code_repo_sensitive"; count = $codeCount },
    [pscustomobject]@{ queue = "promotion_candidate"; count = $promotionCount }
)

$summaryLines = @(
    "# Claude Sensitive Review Queue Summary",
    "",
    "This summary is derived from lightweight Claude metadata classification only.",
    "",
    (New-MarkdownTable -Headers @("queue", "count") -Rows $summaryRows)
)
Write-Utf8File -Path $summaryPath -Content ($summaryLines -join "`n")

Write-Output $legalPath
Write-Output $partnerPath
Write-Output $promotionPath
Write-Output $summaryPath
