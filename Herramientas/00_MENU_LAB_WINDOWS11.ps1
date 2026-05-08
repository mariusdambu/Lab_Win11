[CmdletBinding()]
param(
    [ValidateSet("en", "es", "fr", "ro", "de")]
    [string]$Language = "en"
)

$ErrorActionPreference = "Stop"
$env:LAB_WIN11_LANG = $Language

$ScriptRoot = Split-Path -Parent $MyInvocation.MyCommand.Path
$LabRoot = Split-Path -Parent $ScriptRoot
$WorkRoot = Join-Path $LabRoot "Trabajo"
$HelpRoot = Join-Path $LabRoot "Ayuda"

$Translations = @{
    en = @{
        Title = "WIN11 DEPLOYMENT LAB - {0}"
        Subtitle = "Main menu"
        HelpHtml = "Open HTML command library"
        HelpTxt = "Open clean DISM/USB command text"
        Clipboard = "Copy a command to clipboard"
        Assistant = "Assistant: service install.wim"
        CreateUsb = "Create Windows 11 USB"
        CopyInstall = "Copy install.* to USB"
        CopyBoot = "Copy boot.* to USB"
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
        TypeImage = "Image"
        TypeIso = "ISO"
        TypePackage = "Package"
        TypeDriver = "Driver"
        CategoryHelp = "Help and commands"
        CategoryBuild = "Build and copy"
        CategoryInspect = "Inspect"
        CategoryFolders = "Folders"
    }
    es = @{
        Title = "LAB DE DESPLIEGUE WIN11 - {0}"
        Subtitle = "Menu principal"
        HelpHtml = "Abrir biblioteca HTML de comandos"
        HelpTxt = "Abrir comandos limpios DISM/USB"
        Clipboard = "Copiar un comando al portapapeles"
        Assistant = "Asistente: modificar install.wim"
        CreateUsb = "Crear USB de Windows 11"
        CopyInstall = "Copiar install.* a USB"
        CopyBoot = "Copiar boot.* a USB"
        Inventory = "Ver imagenes, ISOs, packages y drivers INF"
        Disks = "Ver discos y volumenes"
        Mounts = "Ver montajes DISM"
        WorkFolder = "Abrir carpeta Trabajo"
        HelpFolder = "Abrir carpeta Ayuda"
        Exit = "Salir"
        Prompt = "Opcion"
        PressEnter = "Pulsa ENTER para continuar"
        NotFound = "No existe: {0}"
        Invalid = "Opcion no valida."
        Launching = "Lanzando: {0}"
        RequiresAdmin = "Esta opcion abre Windows PowerShell como administrador."
        FilesHeader = "Inventario del lab"
        NoFiles = "No se encontraron archivos."
        DisksHeader = "Discos fisicos"
        VolumesHeader = "Volumenes"
        MountsHeader = "Imagenes montadas con DISM"
        TypeImage = "Imagen"
        TypeIso = "ISO"
        TypePackage = "Package"
        TypeDriver = "Driver"
        CategoryHelp = "Ayuda y comandos"
        CategoryBuild = "Crear y copiar"
        CategoryInspect = "Revisar"
        CategoryFolders = "Carpetas"
    }
    fr = @{
        Title = "LAB DE DEPLOIEMENT WIN11 - {0}"
        Subtitle = "Menu principal"
        HelpHtml = "Ouvrir la bibliotheque HTML des commandes"
        HelpTxt = "Ouvrir les commandes DISM/USB propres"
        Clipboard = "Copier une commande dans le presse-papiers"
        Assistant = "Assistant: modifier install.wim"
        CreateUsb = "Creer une cle USB Windows 11"
        CopyInstall = "Copier install.* vers USB"
        CopyBoot = "Copier boot.* vers USB"
        Inventory = "Voir images, ISOs, packages et pilotes INF"
        Disks = "Voir disques et volumes"
        Mounts = "Voir montages DISM"
        WorkFolder = "Ouvrir le dossier Travail"
        HelpFolder = "Ouvrir le dossier Aide"
        Exit = "Quitter"
        Prompt = "Option"
        PressEnter = "Appuyez sur ENTREE pour continuer"
        NotFound = "Introuvable: {0}"
        Invalid = "Option invalide."
        Launching = "Lancement: {0}"
        RequiresAdmin = "Cette option ouvre Windows PowerShell comme administrateur."
        FilesHeader = "Inventaire du lab"
        NoFiles = "Aucun fichier correspondant."
        DisksHeader = "Disques physiques"
        VolumesHeader = "Volumes"
        MountsHeader = "Images montees avec DISM"
        TypeImage = "Image"
        TypeIso = "ISO"
        TypePackage = "Package"
        TypeDriver = "Pilote"
        CategoryHelp = "Aide et commandes"
        CategoryBuild = "Creer et copier"
        CategoryInspect = "Verifier"
        CategoryFolders = "Dossiers"
    }
    ro = @{
        Title = "LAB DEPLOYMENT WIN11 - {0}"
        Subtitle = "Meniu principal"
        HelpHtml = "Deschide biblioteca HTML de comenzi"
        HelpTxt = "Deschide comenzile curate DISM/USB"
        Clipboard = "Copiaza o comanda in clipboard"
        Assistant = "Asistent: modifica install.wim"
        CreateUsb = "Creeaza USB Windows 11"
        CopyInstall = "Copiaza install.* pe USB"
        CopyBoot = "Copiaza boot.* pe USB"
        Inventory = "Vezi imagini, ISO-uri, packages si drivere INF"
        Disks = "Vezi discuri si volume"
        Mounts = "Vezi montari DISM"
        WorkFolder = "Deschide folderul Trabajo"
        HelpFolder = "Deschide folderul Ayuda"
        Exit = "Iesire"
        Prompt = "Optiune"
        PressEnter = "Apasa ENTER pentru a continua"
        NotFound = "Nu exista: {0}"
        Invalid = "Optiune invalida."
        Launching = "Pornire: {0}"
        RequiresAdmin = "Aceasta optiune deschide Windows PowerShell ca administrator."
        FilesHeader = "Inventarul labului"
        NoFiles = "Nu s-au gasit fisiere."
        DisksHeader = "Discuri fizice"
        VolumesHeader = "Volume"
        MountsHeader = "Imagini montate cu DISM"
        TypeImage = "Imagine"
        TypeIso = "ISO"
        TypePackage = "Package"
        TypeDriver = "Driver"
        CategoryHelp = "Ajutor si comenzi"
        CategoryBuild = "Creare si copiere"
        CategoryInspect = "Verificare"
        CategoryFolders = "Foldere"
    }
    de = @{
        Title = "WIN11 DEPLOYMENT LAB - {0}"
        Subtitle = "Hauptmenue"
        HelpHtml = "HTML-Befehlsbibliothek oeffnen"
        HelpTxt = "Saubere DISM/USB-Befehle oeffnen"
        Clipboard = "Befehl in die Zwischenablage kopieren"
        Assistant = "Assistent: install.wim bearbeiten"
        CreateUsb = "Windows 11 USB erstellen"
        CopyInstall = "install.* auf USB kopieren"
        CopyBoot = "boot.* auf USB kopieren"
        Inventory = "Images, ISOs, Packages und INF-Treiber anzeigen"
        Disks = "Datentraeger und Volumes anzeigen"
        Mounts = "DISM-Mounts anzeigen"
        WorkFolder = "Ordner Trabajo oeffnen"
        HelpFolder = "Ordner Ayuda oeffnen"
        Exit = "Beenden"
        Prompt = "Option"
        PressEnter = "ENTER druecken zum Fortfahren"
        NotFound = "Nicht gefunden: {0}"
        Invalid = "Ungueltige Option."
        Launching = "Starte: {0}"
        RequiresAdmin = "Diese Option oeffnet Windows PowerShell als Administrator."
        FilesHeader = "Lab-Inventar"
        NoFiles = "Keine passenden Dateien gefunden."
        DisksHeader = "Physische Datentraeger"
        VolumesHeader = "Volumes"
        MountsHeader = "Mit DISM gemountete Images"
        TypeImage = "Image"
        TypeIso = "ISO"
        TypePackage = "Package"
        TypeDriver = "Treiber"
        CategoryHelp = "Hilfe und Befehle"
        CategoryBuild = "Erstellen und kopieren"
        CategoryInspect = "Pruefen"
        CategoryFolders = "Ordner"
    }
}

$script:Text = $Translations[$Language]
if (-not $script:Text) {
    $script:Text = $Translations["en"]
}

function T {
    param([string]$Key)
    if ($script:Text.ContainsKey($Key)) { return $script:Text[$Key] }
    return $Translations["en"][$Key]
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
    Write-Host ("-- {0}" -f $Title) -ForegroundColor Cyan
}

function Write-PageTitle {
    param([string]$Title)

    Write-Host ""
    Write-Host ("=" * 72) -ForegroundColor DarkGray
    Write-Host $Title -ForegroundColor Cyan
    Write-Host ("=" * 72) -ForegroundColor DarkGray
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

function Start-ElevatedScript {
    param([string]$Path)
    Assert-Path $Path
    Write-Host (TF "Launching" $Path) -ForegroundColor Cyan
    Write-Host (T "RequiresAdmin") -ForegroundColor Yellow
    $args = "-NoProfile -ExecutionPolicy RemoteSigned -File `"$Path`" -Language `"$Language`""
    $windowsPowerShell = Join-Path $env:SystemRoot "System32\WindowsPowerShell\v1.0\powershell.exe"
    Start-Process -FilePath $windowsPowerShell -ArgumentList $args -Verb RunAs | Out-Null
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

    $files = foreach ($entry in $patterns) {
        if (Test-Path -LiteralPath $entry.Base) {
            foreach ($pattern in $entry.Paths) {
                Get-ChildItem -LiteralPath $entry.Base -Filter $pattern -Recurse -File -ErrorAction SilentlyContinue |
                    Select-Object @{Name = "Type"; Expression = { $entry.Type } },
                                  FullName,
                                  @{Name = "GB"; Expression = { "{0:N2}" -f ($_.Length / 1GB) } }
            }
        }
    }

    if ($files) {
        $files | Sort-Object Type, FullName | Format-Table -AutoSize
    } else {
        Write-Host (T "NoFiles") -ForegroundColor Yellow
    }
    Pause-Lab
}

function Show-DisksAndVolumes {
    Clear-Host
    Write-PageTitle (T "DisksHeader")
    Get-Disk | Sort-Object Number | Format-Table Number, FriendlyName, BusType, PartitionStyle,
        @{Name = "SizeGB"; Expression = { "{0:N2}" -f ($_.Size / 1GB) } },
        OperationalStatus -AutoSize

    Write-PageTitle (T "VolumesHeader")
    Get-Volume | Sort-Object DriveLetter |
        Select-Object DriveLetter, FileSystemLabel, FileSystem, DriveType,
                      @{Name = "SizeGB"; Expression = { if ($_.Size) { "{0:N2}" -f ($_.Size / 1GB) } else { "" } } },
                      @{Name = "FreeGB"; Expression = { if ($_.SizeRemaining) { "{0:N2}" -f ($_.SizeRemaining / 1GB) } else { "" } } } |
        Format-Table -AutoSize
    Pause-Lab
}

function Show-DismMounts {
    Clear-Host
    Write-PageTitle (T "MountsHeader")
    dism /English /Get-MountedWimInfo
    Pause-Lab
}

function Show-Menu {
    Clear-Host
    Write-PageTitle (TF "Title" $LabRoot)
    Write-MenuSection (T "CategoryHelp")
    Write-Host (" 1. " + (T "HelpHtml"))
    Write-Host (" 2. " + (T "HelpTxt"))
    Write-Host (" 3. " + (T "Clipboard"))
    Write-MenuSection (T "CategoryBuild")
    Write-Host (" 4. " + (T "Assistant"))
    Write-Host (" 5. " + (T "CreateUsb"))
    Write-Host (" 6. " + (T "CopyInstall"))
    Write-Host (" 7. " + (T "CopyBoot"))
    Write-MenuSection (T "CategoryInspect")
    Write-Host (" 8. " + (T "Inventory"))
    Write-Host (" 9. " + (T "Disks"))
    Write-Host ("10. " + (T "Mounts"))
    Write-MenuSection (T "CategoryFolders")
    Write-Host ("11. " + (T "WorkFolder"))
    Write-Host ("12. " + (T "HelpFolder"))
    Write-Host ""
    Write-Host (" 0. " + (T "Exit"))
    Write-Host ""
}

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
    try {
        switch ($choice) {
            "1" { Open-HtmlHelp }
            "2" { Open-LocalizedHelpText }
            "3" { & (Join-Path $ScriptRoot "Copiar-Comando.ps1") -Language $Language }
            "4" { Start-ElevatedScript (Join-Path $ScriptRoot "Modificar-InstallWim.ps1") }
            "5" { Start-ElevatedScript (Join-Path $ScriptRoot "WINDOWS_USBPowerShell.PS1") }
            "6" { & (Join-Path $ScriptRoot "copiar_install_wim.ps1") -Language $Language }
            "7" { & (Join-Path $ScriptRoot "copiar_boot_wim.ps1") -Language $Language }
            "8" { Show-LabFiles }
            "9" { Show-DisksAndVolumes }
            "10" { Start-ElevatedScript (Join-Path $ScriptRoot "Ver-MontajesDism.ps1") }
            "11" { Open-FileOrFolder $WorkRoot }
            "12" { Open-FileOrFolder $HelpRoot }
            "0" { return }
            default {
                Write-Host (T "Invalid") -ForegroundColor Yellow
                Pause-Lab
            }
        }
    } catch {
        Write-Host $_.Exception.Message -ForegroundColor Red
        Pause-Lab
    }
} while ($true)
