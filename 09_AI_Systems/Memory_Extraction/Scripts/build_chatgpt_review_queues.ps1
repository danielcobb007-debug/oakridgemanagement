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

$records = Import-CsvRecords -CsvPath $ChatGPTConversationIndexCsv

function Select-ChatGPTFlaggedRecords {
    param(
        [object[]]$Rows,
        [string]$Flag
    )
    return @($Rows | Where-Object { $_.sensitivity_flags -split '\|' | Where-Object { $_ -eq $Flag } } | Sort-Object update_time, title, source_file)
}

function Write-ChatGPTQueue {
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
        "This queue is ChatGPT-derived metadata only and requires manual review before any broader use.",
        "",
        "- conversations in queue: $rowCount",
        ""
    )

    if ($rowCount -gt 0) {
        $lines += @(
            "## Conversations",
            "",
            (New-MarkdownTable -Headers @("source_system", "source_file", "conversation_id", "title", "update_time", "primary_domain", "sensitivity_flags", "promotion_status") -Rows $safeRows)
        )
    }
    else {
        $lines += "No conversations matched this queue in the current pass."
    }

    Write-Utf8File -Path $Path -Content ($lines -join "`n")
}

$legalRows = Select-ChatGPTFlaggedRecords -Rows $records -Flag "legal_sensitive"
$partnerRows = Select-ChatGPTFlaggedRecords -Rows $records -Flag "partner_consent_required"
$personalRows = Select-ChatGPTFlaggedRecords -Rows $records -Flag "personal_private"
$sbrRows = Select-ChatGPTFlaggedRecords -Rows $records -Flag "sbr_hub_sensitive"
$investorRows = Select-ChatGPTFlaggedRecords -Rows $records -Flag "investor_capital_sensitive"
$codeRows = Select-ChatGPTFlaggedRecords -Rows $records -Flag "code_repo_sensitive"
$promotionRows = Select-ChatGPTFlaggedRecords -Rows $records -Flag "promotion_candidate"

$legalPath = Get-OutputPath -MemoryExtractionRoot $MemoryExtractionRoot -RelativePath "Legal_Sensitive\CHATGPT_LEGAL_SENSITIVE_REVIEW_QUEUE.md"
$partnerPath = Get-OutputPath -MemoryExtractionRoot $MemoryExtractionRoot -RelativePath "Partner_Consent_Required\CHATGPT_PARTNER_CONSENT_REVIEW_QUEUE.md"
$promotionPath = Get-OutputPath -MemoryExtractionRoot $MemoryExtractionRoot -RelativePath "Promotion_Queue\CHATGPT_PROMOTION_CANDIDATE_QUEUE.md"
$summaryPath = Get-OutputPath -MemoryExtractionRoot $MemoryExtractionRoot -RelativePath "Reports\CHATGPT_SENSITIVE_REVIEW_QUEUE_SUMMARY.md"

Write-ChatGPTQueue -Path $legalPath -Title "ChatGPT Legal Sensitive Review Queue" -Rows $legalRows
Write-ChatGPTQueue -Path $partnerPath -Title "ChatGPT Partner Consent Review Queue" -Rows $partnerRows
Write-ChatGPTQueue -Path $promotionPath -Title "ChatGPT Promotion Candidate Queue" -Rows $promotionRows

$summaryRows = @(
    [pscustomobject]@{ queue = "legal_sensitive"; count = @($legalRows | Where-Object { $null -ne $_ }).Count },
    [pscustomobject]@{ queue = "partner_consent_required"; count = @($partnerRows | Where-Object { $null -ne $_ }).Count },
    [pscustomobject]@{ queue = "personal_private"; count = @($personalRows | Where-Object { $null -ne $_ }).Count },
    [pscustomobject]@{ queue = "sbr_hub_sensitive"; count = @($sbrRows | Where-Object { $null -ne $_ }).Count },
    [pscustomobject]@{ queue = "investor_capital_sensitive"; count = @($investorRows | Where-Object { $null -ne $_ }).Count },
    [pscustomobject]@{ queue = "code_repo_sensitive"; count = @($codeRows | Where-Object { $null -ne $_ }).Count },
    [pscustomobject]@{ queue = "promotion_candidate"; count = @($promotionRows | Where-Object { $null -ne $_ }).Count }
)

$summaryLines = @(
    "# ChatGPT Sensitive Review Queue Summary",
    "",
    "This summary is derived from lightweight ChatGPT metadata classification only.",
    "",
    (New-MarkdownTable -Headers @("queue", "count") -Rows $summaryRows)
)
Write-Utf8File -Path $summaryPath -Content ($summaryLines -join "`n")

Write-Output $legalPath
Write-Output $partnerPath
Write-Output $promotionPath
Write-Output $summaryPath
