[CmdletBinding()]
param()

$ErrorActionPreference = "Stop"

$ToolsRoot = $PSScriptRoot
$LabRoot = Split-Path -Parent $ToolsRoot
$Menu = Join-Path $ToolsRoot "00_MENU_LAB_WINDOWS11.ps1"
$LanguageHelpers = Join-Path $ToolsRoot "Lab-Idioma.ps1"
if (Test-Path -LiteralPath $LanguageHelpers -PathType Leaf) {
    . $LanguageHelpers
    Set-LabConsoleStyle
}

try {
    Set-PSReadLineOption -HistorySaveStyle SaveNothing -ErrorAction SilentlyContinue
}
catch {
}

if (-not (Test-Path -LiteralPath $Menu -PathType Leaf)) {
    Write-LabError "Lab menu not found:"
    Write-LabCommand $Menu
    Read-Host "Press ENTER to exit" | Out-Null
    exit 1
}

Clear-Host
Write-LabSection "Windows 11 Deployment Lab"
Write-LabSubsection "Select language"
Write-Host "  1. English (default)"
Write-Host "  2. Espanol"
Write-Host "  3. Francais"
Write-Host "  4. Romana"
Write-Host "  5. Deutsch"
Write-Host ""

$choice = Read-Host "Language [1]"
if ($null -eq $choice) {
    $choice = ""
}
$choice = $choice.Trim()

switch ($choice) {
    "2" { $language = "es" }
    "3" { $language = "fr" }
    "4" { $language = "ro" }
    "5" { $language = "de" }
    default { $language = "en" }
}

$env:LAB_WIN11_LANG = $language
& $Menu -Language $language
