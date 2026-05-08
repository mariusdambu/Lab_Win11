#Requires -RunAsAdministrator
[CmdletBinding()]
param(
    [ValidateSet("en", "es", "fr", "ro", "de")]
    [string]$Language = $env:LAB_WIN11_LANG
)

$ErrorActionPreference = "Stop"

. (Join-Path $PSScriptRoot "Lab-Idioma.ps1")
Initialize-LabLanguage -Language $Language | Out-Null

Add-LabTranslations @{
    en = @{
        DismMountTitle = "DISM mounted images"
    }
    es = @{
        DismMountTitle = "Imagenes montadas con DISM"
    }
    fr = @{
        DismMountTitle = "Images montees avec DISM"
    }
    ro = @{
        DismMountTitle = "Imagini montate cu DISM"
    }
    de = @{
        DismMountTitle = "Mit DISM gemountete Images"
    }
}

Write-LabSection (L "DismMountTitle")

dism /English /Get-MountedWimInfo

Write-Host ""
Read-Host (L "PressEnterExit") | Out-Null
