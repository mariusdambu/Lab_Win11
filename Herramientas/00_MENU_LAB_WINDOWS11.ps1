[CmdletBinding()]
param(
    [ValidateSet("en", "es", "fr", "ro", "de")]
    [string]$Language = "en"
)

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"
$env:LAB_WIN11_LANG = $Language

$ScriptRoot = Split-Path -Parent $MyInvocation.MyCommand.Path
$LabRoot = Split-Path -Parent $ScriptRoot
$WorkRoot = Join-Path $LabRoot "Trabajo"
$OfflineRoot = Join-Path $WorkRoot "offline"
$HelpRoot = Join-Path $LabRoot "Ayuda"

. (Join-Path $ScriptRoot "Lab-Idioma.ps1")
Initialize-LabLanguage -Language $Language | Out-Null

$Translations = @{
    en = @{
        BannerTitle = "WIN11 DEPLOYMENT LAB"
        Title = "WIN11 DEPLOYMENT LAB - {0}"
        Subtitle = "Main menu"
        StatusTitle = "Live lab status"
        StatusImages = "Images (WIM/ESD/SWM)"
        StatusIsos = "ISO files"
        StatusDrivers = "INF drivers"
        StatusPackages = "Update packages"
        StatusMounts = "Active DISM mounts"
        StatusMountsOk = "{0} active"
        StatusMountsNone = "0 (clean)"
        StatusMountsBroken = "{0} active (offline requires cleanup)"
        HelpHtml = "Open HTML command library"
        HelpTxt = "Open clean DISM/USB command text"
        Clipboard = "Copy a command to clipboard"
        Assistant = "Assistant: service install.wim + boot.wim"
        CreateUsb = "Create Windows 11 USB"
        CopyInstall = "Copy install.* to USB"
        CopyBoot = "Copy boot.* to USB"
        CreateIso = "Create custom Windows 11 ISO"
        Inventory = "View images, ISOs, packages and INF drivers"
        Disks = "View disks and volumes"
        Mounts = "View DISM mounts"
        WorkFolder = "Open Work folder"
        HelpFolder = "Open Help folder"
        Exit = "Exit"
        Prompt = "Option"
        PressEnter = "Press ENTER to continue"
        NotFound = "Not found: {0}"
        Invalid = "Invalid option."
        Launching = "Launching: {0}"
        RequiresAdmin = "This option opens Windows PowerShell as administrator."
        FilesHeader = "Lab inventory"
        NoFiles = "No matching files were found."
        DisksHeader = "Physical disks"
        VolumesHeader = "Volumes"
        MountsHeader = "DISM mounted images"
        OfflineCleanupWarning = "A broken or orphaned DISM mount was detected for Trabajo\offline."
        OfflineCleanupCommand = "Review it and run: dism /Cleanup-Mountpoints"
        TypeImage = "Image"
        TypeIso = "ISO"
        TypePackage = "Package"
        TypeDriver = "Driver"
        ColType = "Type"
        ColPath = "Path"
        ColSizeGb = "SizeGB"
        ColDiskNum = "Number"
        ColDiskName = "FriendlyName"
        ColBus = "Bus"
        ColStyle = "Style"
        ColState = "State"
        ColLetter = "Letter"
        ColLabel = "Label"
        ColFs = "FileSystem"
        ColDriveType = "DriveType"
        ColFreeGb = "FreeGB"
        CategoryHelp = "Help and commands"
        CategoryBuild = "Build and copy"
        CategoryInspect = "Inspect"
        CategoryFolders = "Folders"
    }
    es = @{
        BannerTitle = "LAB DE DESPLIEGUE WIN11"
        Title = "LAB DE DESPLIEGUE WIN11 - {0}"
        Subtitle = "Menú principal"
        StatusTitle = "Estado en vivo del laboratorio"
        StatusImages = "Imágenes (WIM/ESD/SWM)"
        StatusIsos = "Archivos ISO"
        StatusDrivers = "Drivers INF"
        StatusPackages = "Packages (.cab/.msu)"
        StatusMounts = "Montajes DISM activos"
        StatusMountsOk = "{0} activo(s)"
        StatusMountsNone = "0 (limpio)"
        StatusMountsBroken = "{0} activo(s) (offline requiere limpieza)"
        HelpHtml = "Abrir biblioteca HTML de comandos"
        HelpTxt = "Abrir comandos limpios DISM/USB"
        Clipboard = "Copiar un comando al portapapeles"
        Assistant = "Asistente: modificar install.wim + boot.wim"
        CreateUsb = "Crear USB de Windows 11"
        CopyInstall = "Copiar install.* a USB"
        CopyBoot = "Copiar boot.* a USB"
        CreateIso = "Crear ISO Windows 11 personalizada"
        Inventory = "Ver imágenes, ISOs, packages y drivers INF"
        Disks = "Ver discos y volúmenes"
        Mounts = "Ver montajes DISM"
        WorkFolder = "Abrir carpeta Trabajo"
        HelpFolder = "Abrir carpeta Ayuda"
        Exit = "Salir"
        Prompt = "Opción"
        PressEnter = "Pulsa INTRO para continuar"
        NotFound = "No existe: {0}"
        Invalid = "Opción no válida."
        Launching = "Lanzando: {0}"
        RequiresAdmin = "Esta opción abre Windows PowerShell como administrador."
        FilesHeader = "Inventario del lab"
        NoFiles = "No se encontraron archivos."
        DisksHeader = "Discos físicos"
        VolumesHeader = "Volúmenes"
        MountsHeader = "Imágenes montadas con DISM"
        OfflineCleanupWarning = "Se detectó un montaje DISM roto o huérfano en Trabajo\offline."
        OfflineCleanupCommand = "Revísalo y ejecuta: dism /Cleanup-Mountpoints"
        TypeImage = "Imagen"
        TypeIso = "ISO"
        TypePackage = "Package"
        TypeDriver = "Driver"
        ColType = "Tipo"
        ColPath = "Ruta"
        ColSizeGb = "TamañoGB"
        ColDiskNum = "Número"
        ColDiskName = "Nombre"
        ColBus = "Bus"
        ColStyle = "Estilo"
        ColState = "Estado"
        ColLetter = "Letra"
        ColLabel = "Etiqueta"
        ColFs = "Sistema"
        ColDriveType = "TipoUnidad"
        ColFreeGb = "LibreGB"
        CategoryHelp = "Ayuda y comandos"
        CategoryBuild = "Crear y copiar"
        CategoryInspect = "Revisar"
        CategoryFolders = "Carpetas"
    }
    fr = @{
        BannerTitle = "LAB DE DÉPLOIEMENT WIN11"
        Title = "LAB DE DÉPLOIEMENT WIN11 - {0}"
        Subtitle = "Menu principal"
        StatusTitle = "État en direct du laboratoire"
        StatusImages = "Images (WIM/ESD/SWM)"
        StatusIsos = "Fichiers ISO"
        StatusDrivers = "Pilotes INF"
        StatusPackages = "Packages (.cab/.msu)"
        StatusMounts = "Montages DISM actifs"
        StatusMountsOk = "{0} actif(s)"
        StatusMountsNone = "0 (propre)"
        StatusMountsBroken = "{0} actif(s) (offline nécessite un nettoyage)"
        HelpHtml = "Ouvrir la bibliothèque HTML des commandes"
        HelpTxt = "Ouvrir les commandes DISM/USB propres"
        Clipboard = "Copier une commande dans le presse-papiers"
        Assistant = "Assistant : modifier install.wim + boot.wim"
        CreateUsb = "Créer une clé USB Windows 11"
        CopyInstall = "Copier install.* vers USB"
        CopyBoot = "Copier boot.* vers USB"
        CreateIso = "Créer une ISO Windows 11 personnalisée"
        Inventory = "Voir images, ISOs, packages et pilotes INF"
        Disks = "Voir disques et volumes"
        Mounts = "Voir montages DISM"
        WorkFolder = "Ouvrir le dossier Trabajo"
        HelpFolder = "Ouvrir le dossier Ayuda"
        Exit = "Quitter"
        Prompt = "Option"
        PressEnter = "Appuyez sur ENTRÉE pour continuer"
        NotFound = "Introuvable : {0}"
        Invalid = "Option invalide."
        Launching = "Lancement : {0}"
        RequiresAdmin = "Cette option ouvre Windows PowerShell comme administrateur."
        FilesHeader = "Inventaire du lab"
        NoFiles = "Aucun fichier correspondant."
        DisksHeader = "Disques physiques"
        VolumesHeader = "Volumes"
        MountsHeader = "Images montées avec DISM"
        OfflineCleanupWarning = "Un montage DISM cassé ou orphelin a été détecté dans Trabajo\offline."
        OfflineCleanupCommand = "Vérifiez puis lancez : dism /Cleanup-Mountpoints"
        TypeImage = "Image"
        TypeIso = "ISO"
        TypePackage = "Package"
        TypeDriver = "Pilote"
        ColType = "Type"
        ColPath = "Chemin"
        ColSizeGb = "TailleGo"
        ColDiskNum = "Numéro"
        ColDiskName = "Nom"
        ColBus = "Bus"
        ColStyle = "Style"
        ColState = "État"
        ColLetter = "Lettre"
        ColLabel = "Étiquette"
        ColFs = "Système"
        ColDriveType = "TypeLecteur"
        ColFreeGb = "LibreGo"
        CategoryHelp = "Aide et commandes"
        CategoryBuild = "Créer et copier"
        CategoryInspect = "Vérifier"
        CategoryFolders = "Dossiers"
    }
    ro = @{
        BannerTitle = "LAB DEPLOYMENT WIN11"
        Title = "LAB DEPLOYMENT WIN11 - {0}"
        Subtitle = "Meniu principal"
        StatusTitle = "Starea în timp real a laboratorului"
        StatusImages = "Imagini (WIM/ESD/SWM)"
        StatusIsos = "Fișiere ISO"
        StatusDrivers = "Drivere INF"
        StatusPackages = "Packages (.cab/.msu)"
        StatusMounts = "Montări DISM active"
        StatusMountsOk = "{0} activ(e)"
        StatusMountsNone = "0 (curat)"
        StatusMountsBroken = "{0} activ(e) (offline necesită curățare)"
        HelpHtml = "Deschide biblioteca HTML de comenzi"
        HelpTxt = "Deschide comenzile curate DISM/USB"
        Clipboard = "Copiază o comandă în clipboard"
        Assistant = "Asistent: modifică install.wim + boot.wim"
        CreateUsb = "Creează USB Windows 11"
        CopyInstall = "Copiază install.* pe USB"
        CopyBoot = "Copiază boot.* pe USB"
        CreateIso = "Creează ISO Windows 11 personalizată"
        Inventory = "Vezi imagini, ISO-uri, packages și drivere INF"
        Disks = "Vezi discuri și volume"
        Mounts = "Vezi montări DISM"
        WorkFolder = "Deschide folderul Trabajo"
        HelpFolder = "Deschide folderul Ayuda"
        Exit = "Ieșire"
        Prompt = "Opțiune"
        PressEnter = "Apasă ENTER pentru a continua"
        NotFound = "Nu există: {0}"
        Invalid = "Opțiune invalidă."
        Launching = "Pornire: {0}"
        RequiresAdmin = "Această opțiune deschide Windows PowerShell ca administrator."
        FilesHeader = "Inventarul labului"
        NoFiles = "Nu s-au găsit fișiere."
        DisksHeader = "Discuri fizice"
        VolumesHeader = "Volume"
        MountsHeader = "Imagini montate cu DISM"
        OfflineCleanupWarning = "A fost detectată o montare DISM defectă sau orfană în Trabajo\offline."
        OfflineCleanupCommand = "Verificați și rulați: dism /Cleanup-Mountpoints"
        TypeImage = "Imagine"
        TypeIso = "ISO"
        TypePackage = "Package"
        TypeDriver = "Driver"
        ColType = "Tip"
        ColPath = "Cale"
        ColSizeGb = "DimensiuneGB"
        ColDiskNum = "Număr"
        ColDiskName = "Nume"
        ColBus = "Bus"
        ColStyle = "Stil"
        ColState = "Stare"
        ColLetter = "Literă"
        ColLabel = "Etichetă"
        ColFs = "Sistem"
        ColDriveType = "TipUnitate"
        ColFreeGb = "LiberGB"
        CategoryHelp = "Ajutor și comenzi"
        CategoryBuild = "Creare și copiere"
        CategoryInspect = "Verificare"
        CategoryFolders = "Foldere"
    }
    de = @{
        BannerTitle = "WIN11 DEPLOYMENT LAB"
        Title = "WIN11 DEPLOYMENT LAB - {0}"
        Subtitle = "Hauptmenü"
        StatusTitle = "Live-Status des Labors"
        StatusImages = "Images (WIM/ESD/SWM)"
        StatusIsos = "ISO-Dateien"
        StatusDrivers = "INF-Treiber"
        StatusPackages = "Packages (.cab/.msu)"
        StatusMounts = "Aktive DISM-Mounts"
        StatusMountsOk = "{0} aktiv"
        StatusMountsNone = "0 (sauber)"
        StatusMountsBroken = "{0} aktiv (offline erfordert Bereinigung)"
        HelpHtml = "HTML-Befehlsbibliothek öffnen"
        HelpTxt = "Saubere DISM/USB-Befehle öffnen"
        Clipboard = "Befehl in die Zwischenablage kopieren"
        Assistant = "Assistent: install.wim + boot.wim bearbeiten"
        CreateUsb = "Windows 11 USB erstellen"
        CopyInstall = "install.* auf USB kopieren"
        CopyBoot = "boot.* auf USB kopieren"
        CreateIso = "Benutzerdefinierte Windows 11 ISO erstellen"
        Inventory = "Images, ISOs, Packages und INF-Treiber anzeigen"
        Disks = "Datenträger und Volumes anzeigen"
        Mounts = "DISM-Mounts anzeigen"
        WorkFolder = "Ordner Trabajo öffnen"
        HelpFolder = "Ordner Ayuda öffnen"
        Exit = "Beenden"
        Prompt = "Option"
        PressEnter = "EINGABETASTE drücken zum Fortfahren"
        NotFound = "Nicht gefunden: {0}"
        Invalid = "Ungültige Option."
        Launching = "Starte: {0}"
        RequiresAdmin = "Diese Option öffnet Windows PowerShell als Administrator."
        FilesHeader = "Lab-Inventar"
        NoFiles = "Keine passenden Dateien gefunden."
        DisksHeader = "Physische Datenträger"
        VolumesHeader = "Volumes"
        MountsHeader = "Mit DISM gemountete Images"
        OfflineCleanupWarning = "Ein defekter oder verwaister DISM-Mount wurde in Trabajo\offline erkannt."
        OfflineCleanupCommand = "Prüfen und ausführen: dism /Cleanup-Mountpoints"
        TypeImage = "Image"
        TypeIso = "ISO"
        TypePackage = "Package"
        TypeDriver = "Treiber"
        ColType = "Typ"
        ColPath = "Pfad"
        ColSizeGb = "GrößeGB"
        ColDiskNum = "Nummer"
        ColDiskName = "Name"
        ColBus = "Bus"
        ColStyle = "Stil"
        ColState = "Status"
        ColLetter = "Buchstabe"
        ColLabel = "Label"
        ColFs = "Dateisystem"
        ColDriveType = "Laufwerkstyp"
        ColFreeGb = "FreiGB"
        CategoryHelp = "Hilfe und Befehle"
        CategoryBuild = "Erstellen und kopieren"
        CategoryInspect = "Prüfen"
        CategoryFolders = "Ordner"
    }
}

Add-LabTranslations $Translations

$script:Text = $Translations[$Language]
if (-not $script:Text) {
    $script:Text = $Translations["en"]
}

function T {
    param([string]$Key)
    if ($script:Text.ContainsKey($Key)) { return $script:Text[$Key] }
    if ($Translations["en"].ContainsKey($Key)) { return $Translations["en"][$Key] }
    return (Get-LabText $Key)
}

function TF {
    param(
        [string]$Key,
        [Parameter(ValueFromRemainingArguments = $true)]
        [object[]]$Args
    )
    return [string]::Format((T $Key), $Args)
}

function Pause-Lab {
    Read-Host (T "PressEnter") | Out-Null
}

function Write-MenuSection {
    param([string]$Title)

    Write-Host ""
    Write-Host ("  -- {0} --" -f $Title.ToUpperInvariant()) -ForegroundColor Cyan
}

function Write-MenuItem {
    param(
        [int]$Index,
        [string]$Description,
        [ConsoleColor]$KeyColor = [ConsoleColor]::Yellow
    )

    Write-Host -NoNewline ("  [{0,2}] " -f $Index) -ForegroundColor $KeyColor
    Write-Host $Description -ForegroundColor Gray
}

function Write-PageTitle {
    param([string]$Title)

    Write-LabBanner -Title (T "BannerTitle") -Subtitle $Title
}

function Assert-Path {
    param([string]$Path)
    if (-not (Test-Path -LiteralPath $Path)) {
        throw (TF "NotFound" $Path)
    }
}

function Open-FileOrFolder {
    param([string]$Path)
    Assert-Path $Path
    Start-Process -FilePath $Path | Out-Null
}

function Open-HtmlHelp {
    $path = Join-Path $HelpRoot "index.html"
    Assert-Path $path
    $uri = ([System.Uri]::new($path)).AbsoluteUri
    Start-Process -FilePath ("{0}?lang={1}" -f $uri, $Language) | Out-Null
}

function Open-LocalizedHelpText {
    $localized = Join-Path $HelpRoot ("COMANDOS_DISM_Y_USB.{0}.txt" -f $Language)
    if (Test-Path -LiteralPath $localized) {
        Open-FileOrFolder $localized
        return
    }
    Open-FileOrFolder (Join-Path $HelpRoot "COMANDOS_DISM_Y_USB.txt")
}

function Invoke-LabScript {
    param([string]$Path)
    Assert-Path $Path
    Write-LabInfo (TF "Launching" $Path)
    $windowsPowerShell = Join-Path $env:SystemRoot "System32\WindowsPowerShell\v1.0\powershell.exe"
    $windowTitle = "Lab_Win11 - {0}" -f ([IO.Path]::GetFileNameWithoutExtension($Path))
    $command = 'title {0} && color 07 && "{1}" -NoProfile -ExecutionPolicy RemoteSigned -File "{2}" -Language "{3}"' -f $windowTitle, $windowsPowerShell, $Path, $Language
    Start-Process -FilePath $env:ComSpec -ArgumentList @('/d', '/c', $command) -WorkingDirectory $LabRoot | Out-Null
}

function Get-LabMountDiagnostics {
    $expectedMountPath = [System.IO.Path]::GetFullPath($OfflineRoot).TrimEnd([char]92)
    $activeMounts = 0
    $offlineMountedOk = $false
    $offlineNeedsCleanup = $false
    $inspectedMounts = $false

    $wimMountRegPath = "HKLM:\SOFTWARE\Microsoft\WIMMount\Mounted Images"
    if (Test-Path -LiteralPath $wimMountRegPath) {
        try {
            $subKeys = @(Get-ChildItem -LiteralPath $wimMountRegPath -ErrorAction Stop)
            $inspectedMounts = $true
            foreach ($key in $subKeys) {
                $props = Get-ItemProperty -LiteralPath $key.PSPath -ErrorAction SilentlyContinue
                if ($null -eq $props) { continue }
                $activeMounts++

                $mountDirProp = $props.PSObject.Properties["Mount Path"]
                $statusProp = $props.PSObject.Properties["Status"]
                if ($mountDirProp -and -not [string]::IsNullOrWhiteSpace([string]$mountDirProp.Value)) {
                    try {
                        $resolvedPath = [System.IO.Path]::GetFullPath([string]$mountDirProp.Value).TrimEnd([char]92)
                        if ($resolvedPath.Equals($expectedMountPath, [System.StringComparison]::OrdinalIgnoreCase)) {
                            $statusVal = if ($statusProp -and $null -ne $statusProp.Value) { [int]$statusProp.Value } else { 0 }
                            if ($statusVal -in @(0, 1)) {
                                $offlineMountedOk = $true
                            }
                            else {
                                $offlineNeedsCleanup = $true
                            }
                        }
                    }
                    catch {
                    }
                }
            }
        }
        catch {
            $inspectedMounts = $false
        }
    }

    if (-not $inspectedMounts) {
        try {
            $mountedInfo = @(& dism.exe /English /Get-MountedImageInfo 2>&1)
            if ($LASTEXITCODE -eq 0) {
                $inspectedMounts = $true
                $mountedInfoText = $mountedInfo -join [Environment]::NewLine
                $mountBlocks = [regex]::Split($mountedInfoText, '(?m)(?=^[ \t]*Mount Dir[ \t]*:)')
                foreach ($block in $mountBlocks) {
                    $mountMatch = [regex]::Match($block, '(?im)^[ \t]*Mount Dir[ \t]*:[ \t]*(.+?)\s*$')
                    if (-not $mountMatch.Success) { continue }
                    $activeMounts++

                    $mountPath = $mountMatch.Groups[1].Value.Trim()
                    try {
                        $resolvedMountPath = [System.IO.Path]::GetFullPath($mountPath).TrimEnd([char]92)
                    }
                    catch {
                        continue
                    }

                    if ($resolvedMountPath.Equals($expectedMountPath, [System.StringComparison]::OrdinalIgnoreCase)) {
                        $statusMatch = [regex]::Match($block, '(?im)^[ \t]*Status[ \t]*:[ \t]*(.+?)\s*$')
                        if ($statusMatch.Success -and ($statusMatch.Groups[1].Value.Trim() -match '^(?i:ok|mounted)$')) {
                            $offlineMountedOk = $true
                        }
                        else {
                            $offlineNeedsCleanup = $true
                        }
                    }
                }
            }
        }
        catch {
        }
    }

    if (-not $offlineMountedOk -and -not $offlineNeedsCleanup -and (Test-Path -LiteralPath $OfflineRoot -PathType Container)) {
        $placeholders = @(".gitkeep", "README.md", "README.txt", "README_OFFLINE.txt")
        $remainingItems = @(Get-ChildItem -LiteralPath $OfflineRoot -Force -ErrorAction SilentlyContinue |
            Where-Object { $_.Name -notin $placeholders })
        if ($remainingItems.Count -gt 0) {
            $offlineNeedsCleanup = $true
        }
    }

    return [pscustomobject]@{
        ActiveCount = $activeMounts
        NeedsCleanup = $offlineNeedsCleanup
    }
}

function Get-LabLiveStatusItems {
    $imagesDir = Join-Path $WorkRoot "images"
    $isosDir = Join-Path $WorkRoot "ISOs"
    $driversDir = Join-Path $WorkRoot "Drivers"
    $packagesDir = Join-Path $WorkRoot "packages"

    $imageFiles = @()
    if (Test-Path -LiteralPath $imagesDir -PathType Container) {
        foreach ($pat in @("*.wim", "*.esd", "*.swm")) {
            $imageFiles += @(Get-ChildItem -LiteralPath $imagesDir -Filter $pat -Recurse -File -ErrorAction SilentlyContinue)
        }
    }
    $imageSummary = if ($imageFiles.Count -gt 0 -and $imageFiles.Count -le 3) {
        "{0} ({1})" -f $imageFiles.Count, (($imageFiles | Sort-Object Name | ForEach-Object Name) -join ", ")
    } else {
        [string]$imageFiles.Count
    }

    $isoFiles = @(if (Test-Path -LiteralPath $isosDir -PathType Container) {
        Get-ChildItem -LiteralPath $isosDir -Filter "*.iso" -Recurse -File -ErrorAction SilentlyContinue
    })
    $isoSummary = if ($isoFiles.Count -eq 1) {
        "1 ({0})" -f $isoFiles[0].Name
    } else {
        [string]$isoFiles.Count
    }

    $driverCount = @(if (Test-Path -LiteralPath $driversDir -PathType Container) {
        Get-ChildItem -LiteralPath $driversDir -Filter "*.inf" -Recurse -File -ErrorAction SilentlyContinue
    }).Count

    $packageCount = 0
    if (Test-Path -LiteralPath $packagesDir -PathType Container) {
        foreach ($pat in @("*.cab", "*.msu")) {
            $packageCount += @(Get-ChildItem -LiteralPath $packagesDir -Filter $pat -Recurse -File -ErrorAction SilentlyContinue).Count
        }
    }

    $mountDiag = Get-LabMountDiagnostics
    $script:OfflineCleanupNeeded = [bool]$mountDiag.NeedsCleanup

    $mountText = if ($mountDiag.NeedsCleanup) {
        TF "StatusMountsBroken" $mountDiag.ActiveCount
    } elseif ($mountDiag.ActiveCount -gt 0) {
        TF "StatusMountsOk" $mountDiag.ActiveCount
    } else {
        T "StatusMountsNone"
    }

    $mountColor = if ($mountDiag.NeedsCleanup) {
        [ConsoleColor]::Yellow
    } elseif ($mountDiag.ActiveCount -gt 0) {
        [ConsoleColor]::Cyan
    } else {
        [ConsoleColor]::Green
    }

    return @(
        @{ Label = (T "StatusImages"); Value = $imageSummary; Color = $(if ($imageFiles.Count -gt 0) { [ConsoleColor]::Green } else { [ConsoleColor]::DarkGray }) },
        @{ Label = (T "StatusIsos"); Value = $isoSummary; Color = $(if ($isoFiles.Count -gt 0) { [ConsoleColor]::Green } else { [ConsoleColor]::DarkGray }) },
        @{ Label = (T "StatusDrivers"); Value = [string]$driverCount; Color = $(if ($driverCount -gt 0) { [ConsoleColor]::White } else { [ConsoleColor]::DarkGray }) },
        @{ Label = (T "StatusPackages"); Value = [string]$packageCount; Color = $(if ($packageCount -gt 0) { [ConsoleColor]::White } else { [ConsoleColor]::DarkGray }) },
        @{ Label = (T "StatusMounts"); Value = $mountText; Color = $mountColor }
    )
}

function Show-LabFiles {
    Clear-Host
    Write-PageTitle (T "FilesHeader")
    $typeNames = @{
        Image = T "TypeImage"
        ISO = T "TypeIso"
        Package = T "TypePackage"
        Driver = T "TypeDriver"
    }
    $patterns = @(
        @{ Type = $typeNames.Image; Paths = @("*.wim", "*.esd", "*.swm"); Base = Join-Path $WorkRoot "images" },
        @{ Type = $typeNames.ISO; Paths = @("*.iso"); Base = Join-Path $WorkRoot "ISOs" },
        @{ Type = $typeNames.Package; Paths = @("*.cab", "*.msu"); Base = Join-Path $WorkRoot "packages" },
        @{ Type = $typeNames.Driver; Paths = @("*.inf"); Base = Join-Path $WorkRoot "Drivers" }
    )

    $files = @(foreach ($entry in $patterns) {
        if (Test-Path -LiteralPath $entry.Base) {
            foreach ($pattern in $entry.Paths) {
                Get-ChildItem -LiteralPath $entry.Base -Filter $pattern -Recurse -File -ErrorAction SilentlyContinue |
                    Select-Object @{Name = (T "ColType"); Expression = { $entry.Type } },
                                  @{Name = (T "ColPath"); Expression = { $_.FullName } },
                                  @{Name = (T "ColSizeGb"); Expression = { "{0:N2}" -f ($_.Length / 1GB) } }
            }
        }
    })

    if ($files.Count -gt 0) {
        $files | Sort-Object (T "ColType"), (T "ColPath") | Format-Table -AutoSize
    } else {
        Write-LabWarning (T "NoFiles")
    }
    Pause-Lab
}

function Show-DisksAndVolumes {
    Clear-Host
    Write-PageTitle (T "DisksHeader")
    Get-Disk | Sort-Object Number | ForEach-Object {
        $usbInfo = Get-LabDiskUsbSpeedInfo -DiskNumber $_.Number -Disk $_
        $row = [ordered]@{}
        $row[(T "ColDiskNum")] = $_.Number
        $row[(T "ColDiskName")] = $_.FriendlyName
        $row[(T "ColBus")] = $_.BusType
        $row[(Get-LabText "UsbColHeader")] = $usbInfo.UsbDisplay
        $row[(T "ColStyle")] = $_.PartitionStyle
        $row[(T "ColSizeGb")] = "{0:N2}" -f ($_.Size / 1GB)
        $row[(T "ColState")] = ($_.OperationalStatus -join ",")
        [pscustomobject]$row
    } | Format-Table -AutoSize

    Write-LabSection (T "VolumesHeader")
    Get-Volume | Sort-Object DriveLetter | ForEach-Object {
        $volUsb = if ($_.DriveLetter) { (Get-LabVolumeUsbSpeedInfo -DriveLetter ([string]$_.DriveLetter)).UsbDisplay } else { "-" }
        $vRow = [ordered]@{}
        $vRow[(T "ColLetter")] = $_.DriveLetter
        $vRow[(T "ColLabel")] = $_.FileSystemLabel
        $vRow[(T "ColFs")] = $_.FileSystem
        $vRow[(T "ColDriveType")] = $_.DriveType
        $vRow[(Get-LabText "UsbColHeader")] = $volUsb
        $vRow[(T "ColSizeGb")] = if ($_.Size) { "{0:N2}" -f ($_.Size / 1GB) } else { "" }
        $vRow[(T "ColFreeGb")] = if ($_.SizeRemaining) { "{0:N2}" -f ($_.SizeRemaining / 1GB) } else { "" }
        [pscustomobject]$vRow
    } | Format-Table -AutoSize
    Pause-Lab
}

function Show-DismMounts {
    Clear-Host
    Write-PageTitle (T "MountsHeader")
    dism /English /Get-MountedWimInfo
    Pause-Lab
}

function Update-LabMenuWindowSize {
    param([object[]]$StatusItems)

    $maxLineLen = 108
    $bannerLine = "  {0}      [{1}]  " -f (T "BannerTitle"), (Get-LabLanguageDisplay)
    $subtitleLine = "  {0}  |  {1}  " -f $LabRoot, (T "Subtitle")
    if ($bannerLine.Length -gt $maxLineLen) { $maxLineLen = $bannerLine.Length }
    if ($subtitleLine.Length -gt $maxLineLen) { $maxLineLen = $subtitleLine.Length }

    $maxStatusLbl = 8
    foreach ($item in @($StatusItems)) {
        $lblLen = ([string]$item.Label).Length
        if ($lblLen -gt $maxStatusLbl) { $maxStatusLbl = $lblLen }
    }
    foreach ($item in @($StatusItems)) {
        $rowLen = $maxStatusLbl + 5 + ([string]$item.Value).Length + 4
        if ($rowLen -gt $maxLineLen) { $maxLineLen = $rowLen }
    }

    $optionKeys = @(
        "HelpHtml", "HelpTxt", "Clipboard",
        "Assistant", "CreateUsb", "CreateIso", "CopyInstall", "CopyBoot",
        "Inventory", "Disks", "Mounts",
        "WorkFolder", "HelpFolder", "Exit"
    )
    foreach ($optKey in $optionKeys) {
        $optLen = (T $optKey).Length + 12
        if ($optLen -gt $maxLineLen) { $maxLineLen = $optLen }
    }

    if ($script:OfflineCleanupNeeded) {
        $warnLen = (T "OfflineCleanupWarning").Length + 12
        if ($warnLen -gt $maxLineLen) { $maxLineLen = $warnLen }
    }

    $neededWidth = [Math]::Min(128, [Math]::Max(112, $maxLineLen + 4))
    $neededHeight = 41
    if ($script:OfflineCleanupNeeded) {
        $neededHeight += 2
    }

    Set-LabConsoleWindowSize -MinWidth $neededWidth -MinHeight $neededHeight -BufferHeight 3000
}

function Show-Menu {
    $statusItems = Get-LabLiveStatusItems
    Update-LabMenuWindowSize -StatusItems $statusItems
    Clear-Host
    Write-LabBanner -Title (T "BannerTitle") -Subtitle ("{0}  |  {1}" -f $LabRoot, (T "Subtitle")) -CompactTop
    Write-LabStatusPanel -Title (T "StatusTitle") -Items $statusItems

    if ($script:OfflineCleanupNeeded) {
        Write-LabWarning (T "OfflineCleanupWarning")
        Write-Host ("  {0}" -f (T "OfflineCleanupCommand")) -ForegroundColor Yellow
    }

    Write-MenuSection (T "CategoryHelp")
    Write-MenuItem -Index 1 -Description (T "HelpHtml")
    Write-MenuItem -Index 2 -Description (T "HelpTxt")
    Write-MenuItem -Index 3 -Description (T "Clipboard")

    Write-MenuSection (T "CategoryBuild")
    Write-MenuItem -Index 4 -Description (T "Assistant")
    Write-MenuItem -Index 5 -Description (T "CreateUsb")
    Write-MenuItem -Index 6 -Description (T "CreateIso")
    Write-MenuItem -Index 7 -Description (T "CopyInstall")
    Write-MenuItem -Index 8 -Description (T "CopyBoot")

    Write-MenuSection (T "CategoryInspect")
    Write-MenuItem -Index 9 -Description (T "Inventory")
    Write-MenuItem -Index 10 -Description (T "Disks")
    Write-MenuItem -Index 11 -Description (T "Mounts")

    Write-MenuSection (T "CategoryFolders")
    Write-MenuItem -Index 12 -Description (T "WorkFolder")
    Write-MenuItem -Index 13 -Description (T "HelpFolder")

    Write-Host ""
    Write-MenuItem -Index 0 -Description (T "Exit") -KeyColor DarkYellow
    Write-Host ""
}

$script:OfflineCleanupNeeded = $false

do {
    Show-Menu
    $rawChoice = Read-Host (T "Prompt")
    if ($null -eq $rawChoice) {
        break
    }
    $choice = $rawChoice.Trim()
    if ([Console]::IsInputRedirected -and [string]::IsNullOrWhiteSpace($choice)) {
        break
    }
    $parsedChoice = 0
    if ($choice -match '^\d+$' -and [int]::TryParse($choice, [ref]$parsedChoice)) {
        $choice = [string]$parsedChoice
    }
    try {
        switch ($choice) {
            "1" { Open-HtmlHelp }
            "2" { Open-LocalizedHelpText }
            "3" { & (Join-Path $ScriptRoot "Copiar-Comando.ps1") -Language $Language }
            "4" { Invoke-LabScript (Join-Path $ScriptRoot "Modificar-InstallWim.ps1") }
            "5" { Invoke-LabScript (Join-Path $ScriptRoot "WINDOWS_USBPowerShell.PS1") }
            "6" { Invoke-LabScript (Join-Path $ScriptRoot "Crear-ISO-Windows11.ps1") }
            "7" { Invoke-LabScript (Join-Path $ScriptRoot "copiar_install_wim.ps1") }
            "8" { Invoke-LabScript (Join-Path $ScriptRoot "copiar_boot_wim.ps1") }
            "9" { Show-LabFiles }
            "10" { Show-DisksAndVolumes }
            "11" { Invoke-LabScript (Join-Path $ScriptRoot "Ver-MontajesDism.ps1") }
            "12" { Open-FileOrFolder $WorkRoot }
            "13" { Open-FileOrFolder $HelpRoot }
            "0" { return }
            default {
                Write-LabWarning (T "Invalid")
                Pause-Lab
            }
        }
    } catch {
        Write-LabError $_.Exception.Message
        Pause-Lab
    }
} while ($true)
