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
        $arguments = '-NoProfile -ExecutionPolicy RemoteSigned -File "{0}"' -f $PSCommandPath
        Start-Process -FilePath $WindowsPowerShell -ArgumentList $arguments -Verb RunAs | Out-Null
        exit 0
    }

    Clear-Host
    Write-Host ("=" * 72) -ForegroundColor DarkGray
    Write-Host "Lab_Win11 bootstrap" -ForegroundColor Cyan
    Write-Host ("=" * 72) -ForegroundColor DarkGray
    Write-Host ""

    Write-Host "Unblocking downloaded lab files..." -ForegroundColor Cyan
    Get-ChildItem -LiteralPath $LabRoot -Recurse -File -Include *.ps1,*.cmd,*.html,*.txt -ErrorAction SilentlyContinue |
        Unblock-File -ErrorAction SilentlyContinue

    Write-Host "Validating lab structure..." -ForegroundColor Cyan
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

    Write-Host "Validating Windows tools..." -ForegroundColor Cyan
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

    Write-Host "Starting Lab_Win11..." -ForegroundColor Green
    Write-Host ""
    & $Starter
    exit 0
}
catch {
    Write-Host ""
    Write-Host ("ERROR: {0}" -f $_.Exception.Message) -ForegroundColor Red
    Pause-LabBootstrap
    exit 1
}
