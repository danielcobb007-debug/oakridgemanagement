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

$reportPath = Get-OutputPath -MemoryExtractionRoot $MemoryExtractionRoot -RelativePath "Reports\CHATGPT_EXPORT_INVENTORY.md"

$zip = Open-ZipArchive -ZipPath $ZipPath
try {
    $entries = Get-ZipEntries -ZipArchive $zip
    $shards = Get-ConversationShardEntries -ZipArchive $zip
    $keyFiles = @(
        "chat.html",
        "export_manifest.json",
        "library_files.json",
        "message_feedback.json",
        "shared_conversations.json",
        "user.json",
        "user_settings.json"
    )

    $keyFileRows = foreach ($name in $keyFiles) {
        $match = $entries | Where-Object FullName -eq $name | Select-Object -First 1
        [pscustomobject]@{
            name      = $name
            present   = if ($match) { "yes" } else { "no" }
            size_bytes = if ($match) { $match.Length } else { "" }
        }
    }

    $topTwoLevel = foreach ($entry in $entries) {
        $normalized = ($entry.FullName -replace '\\', '/').Trim('/')
        if ([string]::IsNullOrWhiteSpace($normalized)) {
            continue
        }

        $parts = $normalized.Split('/')
        if ($parts.Length -ge 2) {
            "$($parts[0])/$($parts[1])"
        }
        else {
            $parts[0]
        }
    }

    $treeRows = $topTwoLevel |
        Group-Object |
        Sort-Object @{ Expression = "Count"; Descending = $true }, @{ Expression = "Name"; Descending = $false } |
        ForEach-Object {
            [pscustomobject]@{
                path        = $_.Name
                entry_count = $_.Count
            }
        }

    $largestRows = $entries |
        Where-Object { -not [string]::IsNullOrEmpty($_.Name) } |
        Sort-Object Length -Descending |
        Select-Object -First 20 |
        ForEach-Object {
            [pscustomobject]@{
                path             = $_.FullName
                size_bytes       = $_.Length
                compressed_bytes = $_.CompressedLength
            }
        }

    $lines = @(
        "# CHATGPT Export Inventory",
        "",
        "This report was generated from the source ZIP in place. No raw files were modified or extracted in bulk.",
        "",
        "## Source",
        "",
        "- ZIP path: $ZipPath",
        "- ZIP entries: $($entries.Count)",
        "- Conversation shards: $($shards.Count)",
        "",
        "## Key Files",
        "",
        (New-MarkdownTable -Headers @("name", "present", "size_bytes") -Rows $keyFileRows),
        "",
        "## Conversation Shards",
        "",
        (New-MarkdownTable -Headers @("FullName", "Length") -Rows ($shards | Select-Object FullName, Length)),
        "",
        "## Internal Tree (2 Levels)",
        "",
        (New-MarkdownTable -Headers @("path", "entry_count") -Rows $treeRows),
        "",
        "## Largest Members",
        "",
        (New-MarkdownTable -Headers @("path", "size_bytes", "compressed_bytes") -Rows $largestRows)
    )

    Write-Utf8File -Path $reportPath -Content ($lines -join "`n")
}
finally {
    $zip.Dispose()
}

Write-Output $reportPath
