Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

Add-Type -AssemblyName System.IO.Compression.FileSystem

function Get-MemoryExtractionRoot {
    return (Split-Path -Parent $PSScriptRoot)
}

function Get-DefaultZipPath {
    $memoryRoot = Get-MemoryExtractionRoot
    $aiSystemsRoot = Split-Path -Parent $memoryRoot
    return (Join-Path $aiSystemsRoot "ChatGPT_Export\Raw\6983b8f97d5512829399371574d104cdfd9ecd2ee5a5ebf50cdbdf3da8b6aac5-2026-05-16-12-56-21-249ce10772524f68bfa173bea492c753.zip")
}

function Get-OutputPath {
    param(
        [Parameter(Mandatory = $true)]
        [string]$MemoryExtractionRoot,
        [Parameter(Mandatory = $true)]
        [string]$RelativePath
    )

    return (Join-Path $MemoryExtractionRoot $RelativePath)
}

function Ensure-ParentDirectory {
    param(
        [Parameter(Mandatory = $true)]
        [string]$Path
    )

    $parent = Split-Path -Parent $Path
    if (-not [string]::IsNullOrWhiteSpace($parent)) {
        New-Item -ItemType Directory -Path $parent -Force | Out-Null
    }
}

function Open-ZipArchive {
    param(
        [Parameter(Mandatory = $true)]
        [string]$ZipPath
    )

    if (-not (Test-Path -LiteralPath $ZipPath)) {
        throw "ZIP archive not found: $ZipPath"
    }

    return [System.IO.Compression.ZipFile]::OpenRead($ZipPath)
}

function Get-ZipEntries {
    param(
        [Parameter(Mandatory = $true)]
        [System.IO.Compression.ZipArchive]$ZipArchive
    )

    return @($ZipArchive.Entries | Sort-Object FullName)
}

function Read-ZipEntryText {
    param(
        [Parameter(Mandatory = $true)]
        [System.IO.Compression.ZipArchiveEntry]$Entry
    )

    $reader = [System.IO.StreamReader]::new($Entry.Open())
    try {
        return $reader.ReadToEnd()
    }
    finally {
        $reader.Dispose()
    }
}

function Get-ConversationShardEntries {
    param(
        [Parameter(Mandatory = $true)]
        [System.IO.Compression.ZipArchive]$ZipArchive
    )

    return @(
        $ZipArchive.Entries |
            Where-Object { $_.FullName -match '^conversations-\d+\.json$' } |
            Sort-Object FullName
    )
}

function Convert-TimeValue {
    param(
        $Value
    )

    if ($null -eq $Value -or [string]::IsNullOrWhiteSpace([string]$Value)) {
        return ""
    }

    if ($Value -is [datetime]) {
        return $Value.ToUniversalTime().ToString("yyyy-MM-ddTHH:mm:ssZ")
    }

    $stringValue = [string]$Value
    $doubleValue = 0.0
    if ([double]::TryParse($stringValue, [ref]$doubleValue)) {
        try {
            return [DateTimeOffset]::FromUnixTimeSeconds([int64][math]::Floor($doubleValue)).UtcDateTime.ToString("yyyy-MM-ddTHH:mm:ssZ")
        }
        catch {
            return $stringValue
        }
    }

    $parsed = $null
    if ([datetime]::TryParse($stringValue, [ref]$parsed)) {
        return $parsed.ToUniversalTime().ToString("yyyy-MM-ddTHH:mm:ssZ")
    }

    return $stringValue
}

function Convert-ToBoolString {
    param(
        $Value
    )

    if ($null -eq $Value) {
        return ""
    }

    return ([bool]$Value).ToString().ToLowerInvariant()
}

function Get-ConversationTextScan {
    param(
        [Parameter(Mandatory = $true)]
        [hashtable]$Conversation,
        [int]$MaxMessages = 10,
        [int]$MaxCharacters = 4000
    )

    $segments = [System.Collections.Generic.List[string]]::new()
    $messageCount = 0
    $roles = [System.Collections.Generic.HashSet[string]]::new()
    $mapping = $Conversation["mapping"]

    if ($mapping -isnot [hashtable]) {
        return [pscustomobject]@{
            MessageCount = 0
            Roles        = @()
            ScanText     = ""
        }
    }

    foreach ($key in $mapping.Keys) {
        $node = $mapping[$key]
        if ($node -isnot [hashtable] -or -not $node.ContainsKey("message")) {
            continue
        }

        $message = $node["message"]
        if ($message -isnot [hashtable]) {
            continue
        }

        $messageCount++

        if ($message.ContainsKey("author")) {
            $author = $message["author"]
            if ($author -is [hashtable] -and $author.ContainsKey("role") -and $author["role"]) {
                [void]$roles.Add([string]$author["role"])
            }
        }

        if ($segments.Count -ge $MaxMessages) {
            continue
        }

        if (-not $message.ContainsKey("content")) {
            continue
        }

        $content = $message["content"]
        if ($content -isnot [hashtable]) {
            continue
        }

        $textValue = ""
        if ($content.ContainsKey("text") -and $content["text"]) {
            $textValue = [string]$content["text"]
        }
        elseif ($content.ContainsKey("parts") -and $content["parts"]) {
            foreach ($part in $content["parts"]) {
                if ($part) {
                    $textValue = [string]$part
                    break
                }
            }
        }

        if ([string]::IsNullOrWhiteSpace($textValue)) {
            continue
        }

        $sanitized = (($textValue -replace '\s+', ' ').Trim())
        if ([string]::IsNullOrWhiteSpace($sanitized)) {
            continue
        }

        if ($sanitized.Length -gt 500) {
            $sanitized = $sanitized.Substring(0, 500)
        }

        $segments.Add($sanitized)

        $currentLength = (($segments -join " ").Length)
        if ($currentLength -ge $MaxCharacters) {
            break
        }
    }

    return [pscustomobject]@{
        MessageCount = $messageCount
        Roles        = @($roles | Sort-Object)
        ScanText     = ($segments -join " ")
    }
}

function Get-KeywordProfiles {
    return @(
        @{
            Name              = "ORM"
            Keywords          = @("orm", "oak ridge management", "oakridge")
            SensitivityFlags  = @()
        },
        @{
            Name              = "CEH"
            Keywords          = @("ceh", "compute energy hour", "ceh standard", "ceh index")
            SensitivityFlags  = @()
        },
        @{
            Name              = "DGEI"
            Keywords          = @("dgei", "dg energy", "dg energy and infrastructure", "dg energy & infrastructure")
            SensitivityFlags  = @("partner_consent_required")
        },
        @{
            Name              = "Georgia_Benefits_Group"
            Keywords          = @("georgia benefits group", " gbg ", "gbg")
            SensitivityFlags  = @("partner_consent_required", "sbr_hub_sensitive")
        },
        @{
            Name              = "SBR_HUB_Benefits"
            Keywords          = @("sbr", "hub", "employee benefits", "benefits broker", "group benefits", "insurance", "medical", "dental", "vision")
            SensitivityFlags  = @("sbr_hub_sensitive", "partner_consent_required")
        },
        @{
            Name              = "QumulusAI_VFG_Compute"
            Keywords          = @("qumulusai", "qumulus ai", "cumulus ai", "qai", "vfg", "inventec", "gpu", "nvidia", "compute", "data center", "hosting")
            SensitivityFlags  = @("partner_consent_required")
        },
        @{
            Name              = "Legal_Papering"
            Keywords          = @("nda", "non-circumvention", "non circumvention", "legal", "papering", "contract", "agreement", "redline", "term sheet", "loi")
            SensitivityFlags  = @("legal_sensitive")
        },
        @{
            Name              = "Capital_Strategy"
            Keywords          = @("capital", "investor", "investment", "fundraising", "raise", "equity", "spv", "ic memo", "investment committee")
            SensitivityFlags  = @("investor_capital_sensitive")
        },
        @{
            Name              = "Personal_Operations"
            Keywords          = @("personal", "family", "home", "travel", "calendar", "task", "todo", "budget", "spreadsheet", "private")
            SensitivityFlags  = @("personal_private")
        },
        @{
            Name              = "AI_Systems_Command_Layer"
            Keywords          = @("ai systems", "command layer", "codex", "claude", "chatgpt", "memory", "prompt", "agent")
            SensitivityFlags  = @()
        }
    )
}

function Test-KeywordMatch {
    param(
        [Parameter(Mandatory = $true)]
        [string]$Haystack,
        [Parameter(Mandatory = $true)]
        [string]$Keyword
    )

    $trimmedKeyword = $Keyword.Trim()
    if ([string]::IsNullOrWhiteSpace($trimmedKeyword)) {
        return $false
    }

    if ($trimmedKeyword -match '^[A-Za-z0-9]{2,6}$') {
        return ($Haystack -match ("\b" + [regex]::Escape($trimmedKeyword.ToLowerInvariant()) + "\b"))
    }

    return $Haystack.Contains($trimmedKeyword.ToLowerInvariant())
}

function Get-SensitivityFlagDescriptions {
    return [ordered]@{
        legal_sensitive          = "Potential legal or papering sensitivity"
        partner_consent_required = "May involve partner or third-party review"
        personal_private         = "Likely personal or private material"
        sbr_hub_sensitive        = "Likely employee benefits or insurance sensitivity"
        investor_capital_sensitive = "Likely investor or capital strategy sensitivity"
        promotion_candidate      = "Possible candidate for later promotion review"
    }
}

function Get-KeywordClassification {
    param(
        [string]$Title,
        [string]$ScanText
    )

    $haystack = (" $Title $ScanText ").ToLowerInvariant()
    $profiles = Get-KeywordProfiles
    $matchedDomains = [System.Collections.Generic.List[string]]::new()
    $matchedKeywords = [System.Collections.Generic.List[string]]::new()
    $flags = [System.Collections.Generic.HashSet[string]]::new()

    foreach ($profile in $profiles) {
        $matched = $false
        foreach ($keyword in $profile.Keywords) {
            if (Test-KeywordMatch -Haystack $haystack -Keyword $keyword) {
                $matched = $true
                $matchedKeywords.Add($keyword)
            }
        }

        if ($matched) {
            $matchedDomains.Add($profile.Name)
            foreach ($flag in $profile.SensitivityFlags) {
                [void]$flags.Add($flag)
            }
        }
    }

    $primaryDomain = if ($matchedDomains.Count -gt 0) { $matchedDomains[0] } else { "Unknown" }

    if (
        $matchedDomains.Count -gt 0 -and
        -not $flags.Contains("legal_sensitive") -and
        -not $flags.Contains("personal_private") -and
        -not $flags.Contains("sbr_hub_sensitive") -and
        -not $flags.Contains("investor_capital_sensitive")
    ) {
        [void]$flags.Add("promotion_candidate")
    }

    if ($matchedDomains -contains "ORM" -or $matchedDomains -contains "CEH" -or $matchedDomains -contains "DGEI" -or $matchedDomains -contains "AI_Systems_Command_Layer") {
        [void]$flags.Add("promotion_candidate")
    }

    return [pscustomobject]@{
        PrimaryDomain  = $primaryDomain
        DomainMatches  = @($matchedDomains | Select-Object -Unique)
        KeywordMatches = @($matchedKeywords | Select-Object -Unique)
        Sensitivity    = @($flags | Sort-Object)
    }
}

function Get-ConversationMetadataRecord {
    param(
        [Parameter(Mandatory = $true)]
        [hashtable]$Conversation,
        [Parameter(Mandatory = $true)]
        [string]$SourceArchivePath,
        [Parameter(Mandatory = $true)]
        [string]$SourceFile,
        [Parameter(Mandatory = $true)]
        [string]$ExtractionRunDate
    )

    $conversationId = if ($Conversation.ContainsKey("conversation_id") -and $Conversation["conversation_id"]) {
        [string]$Conversation["conversation_id"]
    }
    elseif ($Conversation.ContainsKey("id") -and $Conversation["id"]) {
        [string]$Conversation["id"]
    }
    else {
        ""
    }

    $title = ""
    if ($Conversation.ContainsKey("title") -and $Conversation["title"]) {
        $title = ([string]$Conversation["title"]).Trim()
    }

    $scan = Get-ConversationTextScan -Conversation $Conversation
    $classification = Get-KeywordClassification -Title $title -ScanText $scan.ScanText

    return [pscustomobject]@{
        source_system              = "ChatGPT"
        source_archive_path        = $SourceArchivePath
        source_file                = $SourceFile
        conversation_id            = $conversationId
        title                      = $title
        create_time                = Convert-TimeValue $Conversation["create_time"]
        update_time                = Convert-TimeValue $Conversation["update_time"]
        extraction_run_date        = $ExtractionRunDate
        promotion_status           = "Raw / Unreviewed"
        model_slug                 = [string]$Conversation["default_model_slug"]
        is_archived                = Convert-ToBoolString $Conversation["is_archived"]
        is_starred                 = Convert-ToBoolString $Conversation["is_starred"]
        is_temporary_chat          = Convert-ToBoolString $Conversation["is_temporary_chat"]
        is_read_only               = Convert-ToBoolString $Conversation["is_read_only"]
        approximate_message_count  = $scan.MessageCount
        observed_roles             = ($scan.Roles -join "|")
        primary_domain             = $classification.PrimaryDomain
        domain_matches             = ($classification.DomainMatches -join "|")
        keyword_matches            = ($classification.KeywordMatches -join "|")
        sensitivity_flags          = ($classification.Sensitivity -join "|")
    }
}

function Get-ConversationMetadataRecords {
    param(
        [Parameter(Mandatory = $true)]
        [string]$ZipPath
    )

    $zip = Open-ZipArchive -ZipPath $ZipPath
    try {
        $records = [System.Collections.Generic.List[object]]::new()
        $runDate = (Get-Date).ToString("yyyy-MM-dd")
        foreach ($entry in (Get-ConversationShardEntries -ZipArchive $zip)) {
            $content = Read-ZipEntryText -Entry $entry
            $conversations = $content | ConvertFrom-Json -AsHashtable -Depth 100
            foreach ($conversation in $conversations) {
                $records.Add((Get-ConversationMetadataRecord -Conversation $conversation -SourceArchivePath $ZipPath -SourceFile $entry.FullName -ExtractionRunDate $runDate))
            }
        }

        return @($records)
    }
    finally {
        $zip.Dispose()
    }
}

function Get-InternalExportNames {
    return @(
        "chat.html",
        "export_manifest.json",
        "library_files.json",
        "message_feedback.json",
        "shared_conversations.json",
        "user.json",
        "user_settings.json"
    )
}

function Get-AttachmentTypeInfo {
    param(
        [Parameter(Mandatory = $true)]
        [string]$Path
    )

    $extension = [System.IO.Path]::GetExtension($Path).ToLowerInvariant()
    $textExtensions = @(".md", ".txt", ".csv", ".json", ".html", ".htm")
    $documentExtensions = @(".pdf", ".doc", ".docx", ".xls", ".xlsx", ".ppt", ".pptx", ".msg")
    $mediaExtensions = @(".png", ".jpg", ".jpeg", ".heic", ".webp", ".gif", ".wav", ".mp3", ".m4a", ".mp4", ".mov", ".avi")

    if ($mediaExtensions -contains $extension) {
        if (@(".wav", ".mp3", ".m4a", ".mp4", ".mov", ".avi") -contains $extension) {
            return [pscustomobject]@{
                extension              = $extension
                likely_file_type       = "media"
                content_classification = "media/binary"
                manual_review          = "yes"
            }
        }

        return [pscustomobject]@{
            extension              = $extension
            likely_file_type       = "image"
            content_classification = "media/binary"
            manual_review          = "yes"
        }
    }

    if ($documentExtensions -contains $extension) {
        return [pscustomobject]@{
            extension              = $extension
            likely_file_type       = "document"
            content_classification = "document/binary"
            manual_review          = "yes"
        }
    }

    if ($textExtensions -contains $extension) {
        return [pscustomobject]@{
            extension              = $extension
            likely_file_type       = "text"
            content_classification = "text"
            manual_review          = "review_if_sensitive"
        }
    }

    return [pscustomobject]@{
        extension              = $extension
        likely_file_type       = if ([string]::IsNullOrWhiteSpace($extension)) { "unknown" } else { "binary" }
        content_classification = if ([string]::IsNullOrWhiteSpace($extension)) { "unknown" } else { "binary" }
        manual_review          = "yes"
    }
}

function Get-AttachmentManifestRecords {
    param(
        [Parameter(Mandatory = $true)]
        [string]$ZipPath
    )

    $zip = Open-ZipArchive -ZipPath $ZipPath
    try {
        $internalNames = Get-InternalExportNames
        $records = [System.Collections.Generic.List[object]]::new()
        $runDate = (Get-Date).ToString("yyyy-MM-dd")
        foreach ($entry in (Get-ZipEntries -ZipArchive $zip)) {
            if ([string]::IsNullOrEmpty($entry.Name)) {
                continue
            }

            if ($entry.FullName -match '^conversations-\d+\.json$') {
                continue
            }

            if ($internalNames -contains $entry.FullName) {
                continue
            }

            $info = Get-AttachmentTypeInfo -Path $entry.FullName
            $records.Add([pscustomobject]@{
                source_system             = "ChatGPT"
                source_archive_path       = $ZipPath
                source_file               = $entry.FullName
                extraction_run_date       = $runDate
                promotion_status          = "Raw / Unreviewed"
                zip_path                = $entry.FullName
                extension               = $info.extension
                size_bytes              = $entry.Length
                likely_file_type        = $info.likely_file_type
                content_classification  = $info.content_classification
                manual_review_recommended = $info.manual_review
            })
        }

        return @($records | Sort-Object @{ Expression = "size_bytes"; Descending = $true }, @{ Expression = "zip_path"; Descending = $false })
    }
    finally {
        $zip.Dispose()
    }
}

function Import-CsvRecords {
    param(
        [Parameter(Mandatory = $true)]
        [string]$CsvPath
    )

    if (-not (Test-Path -LiteralPath $CsvPath)) {
        throw "CSV file not found: $CsvPath"
    }

    return @(Import-Csv -LiteralPath $CsvPath)
}

function Write-Utf8File {
    param(
        [Parameter(Mandatory = $true)]
        [string]$Path,
        [Parameter(Mandatory = $true)]
        [string]$Content
    )

    Ensure-ParentDirectory -Path $Path
    [System.IO.File]::WriteAllText($Path, $Content, [System.Text.UTF8Encoding]::new($false))
}

function Write-RecordsCsv {
    param(
        [Parameter(Mandatory = $true)]
        [string]$Path,
        [Parameter(Mandatory = $true)]
        [object[]]$Records
    )

    Ensure-ParentDirectory -Path $Path
    $Records | Export-Csv -LiteralPath $Path -NoTypeInformation -Encoding utf8
}

function New-MarkdownTable {
    param(
        [Parameter(Mandatory = $true)]
        [string[]]$Headers,
        [Parameter(Mandatory = $true)]
        [object[]]$Rows
    )

    $lines = [System.Collections.Generic.List[string]]::new()
    $lines.Add("| " + ($Headers -join " | ") + " |")
    $lines.Add("| " + (($Headers | ForEach-Object { "---" }) -join " | ") + " |")

    foreach ($row in $Rows) {
        $values = foreach ($header in $Headers) {
            $value = $row.$header
            if ($null -eq $value) { "" } else { ([string]$value).Replace("|", "\|").Replace("`r", " ").Replace("`n", " ") }
        }
        $lines.Add("| " + ($values -join " | ") + " |")
    }

    return ($lines -join "`n")
}

function Get-DomainFileMap {
    return [ordered]@{
        ORM                      = "DOMAIN_INDEX_ORM.md"
        CEH                      = "DOMAIN_INDEX_CEH.md"
        DGEI                     = "DOMAIN_INDEX_DGEI.md"
        Georgia_Benefits_Group   = "DOMAIN_INDEX_GBG.md"
        SBR_HUB_Benefits         = "DOMAIN_INDEX_SBR_HUB_BENEFITS.md"
        QumulusAI_VFG_Compute    = "DOMAIN_INDEX_QUMULUSAI_VFG_COMPUTE.md"
        Legal_Papering           = "DOMAIN_INDEX_LEGAL_PAPERING.md"
        Capital_Strategy         = "DOMAIN_INDEX_CAPITAL_STRATEGY.md"
        Personal_Operations      = "DOMAIN_INDEX_PERSONAL_OPERATIONS.md"
        AI_Systems_Command_Layer = "DOMAIN_INDEX_AI_SYSTEMS_COMMAND_LAYER.md"
        Unknown                  = "DOMAIN_INDEX_UNKNOWN.md"
    }
}
