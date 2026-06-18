[CmdletBinding()]
param()

$ErrorActionPreference = "Stop"

$LabRoot = Split-Path -Parent $MyInvocation.MyCommand.Path
$ToolsRoot = Join-Path $LabRoot "Herramientas"
$HelpRoot = Join-Path $LabRoot "Ayuda"
$WorkRoot = Join-Path $LabRoot "Trabajo"
$Starter = Join-Path $ToolsRoot "Start-Lab.ps1"
$Menu = Join-Path $ToolsRoot "00_MENU_LAB_WINDOWS11.ps1"
$WindowsPowerShell = Join-Path $env:SystemRoot "System32\WindowsPowerShell\v1.0\powershell.exe"
$LanguageHelpers = Join-Path $ToolsRoot "Lab-Idioma.ps1"
if (Test-Path -LiteralPath $LanguageHelpers -PathType Leaf) {
    . $LanguageHelpers
    Set-LabConsoleStyle
}

function Test-LabAdministrator {
    $identity = [Security.Principal.WindowsIdentity]::GetCurrent()
    $principal = New-Object Security.Principal.WindowsPrincipal($identity)
    return $principal.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)
}

function Pause-LabBootstrap {
    Read-Host "Press ENTER to exit" | Out-Null
}

try {
    if (-not (Test-Path -LiteralPath $WindowsPowerShell -PathType Leaf)) {
        throw "Windows PowerShell 5.1 was not found: $WindowsPowerShell"
    }

    if (-not (Test-LabAdministrator)) {
        $commandProcessor = Join-Path $env:SystemRoot "System32\cmd.exe"
        $command = 'title Lab_Win11 && color 07 && "{0}" -NoProfile -ExecutionPolicy RemoteSigned -File "{1}"' -f $WindowsPowerShell, $PSCommandPath
        Start-Process -FilePath $commandProcessor -ArgumentList @('/d', '/c', $command) -Verb RunAs | Out-Null
        exit 0
    }

    Clear-Host
    Write-LabSection "Windows 11 Deployment Lab"

    Write-LabPhase "Startup checks"
    Get-ChildItem -LiteralPath $LabRoot -Recurse -File -Include *.ps1,*.cmd,*.html,*.txt -ErrorAction SilentlyContinue |
        Unblock-File -ErrorAction SilentlyContinue

    Write-LabInfo "Validating lab structure..."
    $requiredPaths = @(
        $ToolsRoot,
        $HelpRoot,
        $WorkRoot,
        $Starter,
        $Menu
    )
    foreach ($path in $requiredPaths) {
        if (-not (Test-Path -LiteralPath $path)) {
            throw "Required lab path was not found: $path"
        }
    }

    Write-LabInfo "Validating Windows tools..."
    $systemTools = @(
        (Join-Path $env:SystemRoot "System32\dism.exe"),
        (Join-Path $env:SystemRoot "System32\diskpart.exe"),
        (Join-Path $env:SystemRoot "System32\robocopy.exe")
    )
    foreach ($tool in $systemTools) {
        if (-not (Test-Path -LiteralPath $tool -PathType Leaf)) {
            throw "Required Windows tool was not found: $tool"
        }
    }

    Write-LabOk "Startup checks completed. Opening lab menu..."
    Write-Host ""
    & $Starter
    exit 0
}
catch {
    Write-Host ""
    Write-LabError $_.Exception.Message
    Pause-LabBootstrap
    exit 1
}

