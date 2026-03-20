[CmdletBinding()]
param(
    [string]$Title,

    [ValidateSet('Not started', 'In progress', 'Blocked', 'Ready for review', 'Ready for QA', 'Done')]
    [string]$Status = 'In progress',

    [string]$RepositoryName,
    [string]$WorkingDirectory = (Get-Location).Path,
    [string]$BranchOrPr,
    [string]$WorkItem,
    [string[]]$MainFiles,
    [string[]]$WhatWasDone,
    [string[]]$WhatRemains,
    [string[]]$BlockedItems,
    [string[]]$RisksAndUncertainties,
    [string[]]$VerificationDone,
    [string]$RecommendedNextAction,
    [string]$OutputDirectory = (Join-Path (Get-Location).Path 'work-context'),
    [string]$OutputPath,
    [switch]$OpenAfterCreate
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

function Read-RequiredValue {
    param([string]$Prompt)

    do {
        $value = (Read-Host -Prompt $Prompt).Trim()
    } while ([string]::IsNullOrWhiteSpace($value))

    return $value
}

function Split-ListInput {
    param([string]$Value)

    if ([string]::IsNullOrWhiteSpace($Value)) {
        return @()
    }

    return @(
        $Value.Split(';') |
            ForEach-Object { $_.Trim() } |
            Where-Object { -not [string]::IsNullOrWhiteSpace($_) }
    )
}

function Read-OptionalList {
    param([string]$Prompt)

    $rawValue = Read-Host -Prompt "$Prompt (separate items with ';')"
    return Split-ListInput -Value $rawValue
}

function Resolve-List {
    param(
        [string[]]$CurrentValue,
        [string]$Prompt,
        [string]$Fallback
    )

    $normalized = @(
        $CurrentValue |
            Where-Object { -not [string]::IsNullOrWhiteSpace($_) } |
            ForEach-Object { $_.Trim() }
    )

    if ($normalized.Count -gt 0) {
        return $normalized
    }

    $prompted = Read-OptionalList -Prompt $Prompt
    if ($prompted.Count -gt 0) {
        return $prompted
    }

    return @($Fallback)
}

function ConvertTo-Slug {
    param([string]$Value)

    $slug = $Value.ToLowerInvariant()
    $slug = [System.Text.RegularExpressions.Regex]::Replace($slug, '[^a-z0-9]+', '-')
    $slug = $slug.Trim('-')

    if ([string]::IsNullOrWhiteSpace($slug)) {
        return 'work-context'
    }

    if ($slug.Length -gt 60) {
        $slug = $slug.Substring(0, 60).Trim('-')
    }

    return $slug
}

function Format-BulletList {
    param([string[]]$Items)

    return (($Items | ForEach-Object { "- $_" }) -join [Environment]::NewLine)
}

function Get-DetectedBranch {
    $gitCommand = Get-Command -Name git -ErrorAction SilentlyContinue
    if (-not $gitCommand) {
        return $null
    }

    try {
        $insideWorkTree = git rev-parse --is-inside-work-tree 2>$null
        if ($LASTEXITCODE -ne 0 -or $insideWorkTree -notcontains 'true') {
            return $null
        }

        $branch = git branch --show-current 2>$null
        if ($LASTEXITCODE -ne 0) {
            return $null
        }

        $branchName = ($branch | Select-Object -First 1).Trim()
        if ([string]::IsNullOrWhiteSpace($branchName)) {
            return $null
        }

        return $branchName
    }
    catch {
        return $null
    }
}

function Write-Utf8NoBomFile {
    param(
        [string]$Path,
        [string]$Content
    )

    $utf8NoBom = New-Object System.Text.UTF8Encoding($false)
    [System.IO.File]::WriteAllText($Path, $Content, $utf8NoBom)
}

$WorkingDirectory = (Resolve-Path -LiteralPath $WorkingDirectory).Path

if ([string]::IsNullOrWhiteSpace($RepositoryName)) {
    $RepositoryName = Split-Path -Path $WorkingDirectory -Leaf
}

if ([string]::IsNullOrWhiteSpace($Title)) {
    $Title = Read-RequiredValue -Prompt 'Task or context title'
}

if ([string]::IsNullOrWhiteSpace($BranchOrPr)) {
    $detectedBranch = Get-DetectedBranch
    if ($detectedBranch) {
        $BranchOrPr = $detectedBranch
    }
    else {
        $BranchOrPr = (Read-Host -Prompt 'Branch or PR (optional)').Trim()
    }
}

if ([string]::IsNullOrWhiteSpace($WorkItem)) {
    $WorkItem = (Read-Host -Prompt 'Work item or link (optional)').Trim()
}

$MainFiles = Resolve-List -CurrentValue $MainFiles -Prompt 'Main files to continue from' -Fallback '[not recorded]'
$WhatWasDone = Resolve-List -CurrentValue $WhatWasDone -Prompt 'What was done' -Fallback '[add completed step]'

$remainingFallback = if ($Status -eq 'Done') {
    'No remaining work noted.'
}
else {
    '[add next step]'
}
$WhatRemains = Resolve-List -CurrentValue $WhatRemains -Prompt 'What remains' -Fallback $remainingFallback

$blockedFallback = if ($Status -eq 'Blocked') {
    '[describe blocker]'
}
else {
    'None currently.'
}
$BlockedItems = Resolve-List -CurrentValue $BlockedItems -Prompt 'Blocked items or blockers' -Fallback $blockedFallback

$RisksAndUncertainties = Resolve-List -CurrentValue $RisksAndUncertainties -Prompt 'Risks and uncertainties' -Fallback 'No additional risks recorded.'
$VerificationDone = Resolve-List -CurrentValue $VerificationDone -Prompt 'Verification done' -Fallback 'Not yet verified.'

if ([string]::IsNullOrWhiteSpace($RecommendedNextAction)) {
    $defaultNextAction = if ($Status -eq 'Done') {
        'Share this summary in the primary artifact for the work.'
    }
    else {
        'Resume from the remaining work list and verify the next change.'
    }

    $promptedNextAction = (Read-Host -Prompt "Recommended next action (leave blank for '$defaultNextAction')").Trim()
    $RecommendedNextAction = if ([string]::IsNullOrWhiteSpace($promptedNextAction)) {
        $defaultNextAction
    }
    else {
        $promptedNextAction
    }
}

if ([string]::IsNullOrWhiteSpace($OutputPath)) {
    $null = New-Item -ItemType Directory -Path $OutputDirectory -Force

    $timestamp = Get-Date -Format 'yyyy-MM-dd_HHmmss'
    $fileName = '{0}_{1}.md' -f $timestamp, (ConvertTo-Slug -Value $Title)
    $OutputPath = Join-Path -Path $OutputDirectory -ChildPath $fileName
}
else {
    $parentDirectory = Split-Path -Path $OutputPath -Parent
    if (-not [string]::IsNullOrWhiteSpace($parentDirectory)) {
        $null = New-Item -ItemType Directory -Path $parentDirectory -Force
    }
}

$recordedBranchOrPr = if ([string]::IsNullOrWhiteSpace($BranchOrPr)) { '[not recorded]' } else { $BranchOrPr }
$recordedWorkItem = if ([string]::IsNullOrWhiteSpace($WorkItem)) { '[not recorded]' } else { $WorkItem }

$content = @"
# Work Context: $Title

- Generated: $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')
- Repository: $RepositoryName
- Working directory: $WorkingDirectory
- Generated by: scripts\save-work-context.ps1

## Current Status
$Status

## What Was Done
$(Format-BulletList -Items $WhatWasDone)

## What Remains
$(Format-BulletList -Items $WhatRemains)

## Blockers
$(Format-BulletList -Items $BlockedItems)

## Where to Continue
- Main file(s): $(($MainFiles -join ', '))
- Branch or PR: $recordedBranchOrPr
- Work item: $recordedWorkItem

## Risks and Uncertainties
$(Format-BulletList -Items $RisksAndUncertainties)

## Verification Done
$(Format-BulletList -Items $VerificationDone)

## Recommended Next Action
$RecommendedNextAction
"@

Write-Utf8NoBomFile -Path $OutputPath -Content $content
Write-Host "Saved work context to $OutputPath"

if ($OpenAfterCreate) {
    Invoke-Item -Path $OutputPath
}
