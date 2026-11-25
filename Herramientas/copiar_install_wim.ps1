[CmdletBinding()]
param(
    [string]$Source,
    [string[]]$DestinationLetters,
    [ValidateSet("en", "es", "fr", "ro", "de")]
    [string]$Language = $env:LAB_WIN11_LANG
)

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

. (Join-Path $PSScriptRoot "Lab-Idioma.ps1")
Initialize-LabLanguage -Language $Language | Out-Null

$ToolsRoot = $PSScriptRoot
$LabRoot = Split-Path -Parent $ToolsRoot
$WorkRoot = Join-Path $LabRoot "Trabajo"
$ImagesRoot = Join-Path $WorkRoot "images"
$IsosRoot = Join-Path $WorkRoot "ISOs"

Add-LabTranslations @{
    en = @{
        CopyInstallBanner = "COPY INSTALL.* TO USB"
        StepSelectSource = "Select source install.* payload"
        StepSelectTargets = "Select destination USB volumes and verify USB speed"
        StepConfirmPlan = "Review copy plan and confirm"
        StepExecuteCopy = "Copy install.* files to USB"
        CopySummaryTitle = "Copy summary"
        SummaryStatusLabel = "Status"
        SummaryTargetsLabel = "Updated targets"
        CopyConfirmWord = "COPY"
        SwmMissing = "SWM files exist in {0}, but install.swm is missing."
        NoPayload = "I cannot find install.wim, install.esd or install*.swm inside {0}"
        AskCopyInstallFromIso = "Trabajo\images does not contain install.*. Mount an ISO from Trabajo\ISOs and copy the original install.* now?"
        NoIsoFound = "No ISO files were found in {0}."
        ChooseIso = "Choose ISO to mount:"
        MountingIso = "Mounting ISO: {0}"
        DismountingIso = "Dismounting ISO: {0}"
        IsoSourcesMissing = "The mounted ISO does not contain a sources folder: {0}"
        IsoInstallMissing = "The mounted ISO does not contain install.wim, install.esd or install*.swm."
        CopyingInstallFromIso = "Copying install.* from ISO to Trabajo\images..."
        ChooseSource = "Choose install.* source:"
        SourceNotFound = "Source does not exist: {0}"
        SourceInsideImages = "The source must be inside {0}"
        SwmNeedsInstall = "To copy SWM, install.swm must exist next to install2.swm, etc."
        SourceMustBeInstall = "The source must be named install.wim, install.esd or install*.swm"
        ReasonCd = "CD-ROM/not writable"
        ReasonNotUsb = "does not look like USB or Windows media"
        ReasonNoFs = "no file system"
        ReasonFat32 = "FAT32 does not support files larger than 4 GB"
        ReasonSpace = "not enough space"
        DestPrompt = "Destinations: letters or numbers separated by comma ({0}A = all)"
        NoDestination = "No destination drive was specified."
        InvalidDestNumber = "Invalid destination number: {0}"
        InvalidDest = "Invalid destination: {0}"
        DriveNotListed = "Drive {0}: is not in the valid destination list."
        SourceTitle = "Selected source"
        TypeLabel = "Type"
        FilesLabel = "Files"
        TotalSizeLabel = "Total size"
        ValidTargets = "Valid destinations:"
        None = "None."
        SkippedTargets = "Skipped:"
        NoValidTargets = "There is no valid destination for install.* of {0}."
        DriveNotValid = "Drive {0} is not a valid destination: {1}"
        CopyPlan = "Copy plan"
        CreateSources = "sources folder will be created"
        ReplaceExisting = "replaces: {0}"
        WillCopy = "copies: {0}"
        ConfirmCopy = "Type {0} to start"
        CancelNoCopy = "Cancelled. Nothing was copied."
        CopyingTo = "Copying install.* to {0}..."
        CopyDone = "Copy completed."
        DefaultOne = "ENTER = {0}:, "
        ColNum = "No"
        ColLetter = "Letter"
        ColLabel = "Label"
        ColFs = "FileSystem"
        ColType = "Type"
        ColFree = "Free"
        ColSources = "HasSources"
        ColExisting = "ExistingInstall"
        ColReason = "Reason"
    }
    es = @{
        CopyInstallBanner = "COPIAR INSTALL.* A USB"
        StepSelectSource = "Seleccionar imagen install.* de origen"
        StepSelectTargets = "Seleccionar volúmenes USB de destino y verificar velocidad"
        StepConfirmPlan = "Revisar plan de copia y confirmar"
        StepExecuteCopy = "Copiar archivos install.* al USB"
        CopySummaryTitle = "Resumen de copia"
        SummaryStatusLabel = "Estado"
        SummaryTargetsLabel = "Destinos actualizados"
        CopyConfirmWord = "COPIAR"
        SwmMissing = "Hay archivos SWM en {0}, pero falta install.swm."
        NoPayload = "No encuentro install.wim, install.esd ni install*.swm dentro de {0}"
        AskCopyInstallFromIso = "¿Trabajo\images no contiene install.*. Montar una ISO de Trabajo\ISOs y copiar el install.* original ahora?"
        NoIsoFound = "No se encontraron archivos ISO en {0}."
        ChooseIso = "Elige ISO para montar:"
        MountingIso = "Montando ISO: {0}"
        DismountingIso = "Desmontando ISO: {0}"
        IsoSourcesMissing = "La ISO montada no contiene carpeta sources: {0}"
        IsoInstallMissing = "La ISO montada no contiene install.wim, install.esd ni install*.swm."
        CopyingInstallFromIso = "Copiando install.* desde ISO a Trabajo\images..."
        ChooseSource = "Elige install.* origen:"
        SourceNotFound = "No existe el origen: {0}"
        SourceInsideImages = "El origen debe estar dentro de {0}"
        SwmNeedsInstall = "Para copiar SWM debe existir install.swm junto a install2.swm, etc."
        SourceMustBeInstall = "El origen debe llamarse install.wim, install.esd o install*.swm"
        ReasonCd = "CD-ROM/no escribible"
        ReasonNotUsb = "no parece USB ni medio Windows"
        ReasonNoFs = "sin sistema de archivos"
        ReasonFat32 = "FAT32 no admite archivos de más de 4 GB"
        ReasonSpace = "espacio insuficiente"
        DestPrompt = "Destinos: letras o números separados por coma ({0}A = todos)"
        NoDestination = "No se indicó ninguna unidad destino."
        InvalidDestNumber = "Número de destino no válido: {0}"
        InvalidDest = "Destino no válido: {0}"
        DriveNotListed = "La unidad {0}: no está en la lista de destinos válidos."
        SourceTitle = "Origen seleccionado"
        TypeLabel = "Tipo"
        FilesLabel = "Archivos"
        TotalSizeLabel = "Tamaño total"
        ValidTargets = "Destinos válidos:"
        None = "Ninguno."
        SkippedTargets = "Omitidos:"
        NoValidTargets = "No hay ningún destino válido para install.* de {0}."
        DriveNotValid = "La unidad {0} no es destino válido: {1}"
        CopyPlan = "Plan de copia"
        CreateSources = "se creará carpeta sources"
        ReplaceExisting = "reemplaza: {0}"
        WillCopy = "copia: {0}"
        ConfirmCopy = "Escribe {0} para empezar"
        CancelNoCopy = "Cancelado. No se ha copiado nada."
        CopyingTo = "Copiando install.* a {0}..."
        CopyDone = "Copia completada."
        DefaultOne = "INTRO = {0}:, "
        ColNum = "Num"
        ColLetter = "Letra"
        ColLabel = "Etiqueta"
        ColFs = "Sistema"
        ColType = "Tipo"
        ColFree = "Libre"
        ColSources = "TieneSources"
        ColExisting = "InstallExistente"
        ColReason = "Motivo"
    }
    fr = @{
        CopyInstallBanner = "COPIER INSTALL.* VERS USB"
        StepSelectSource = "Sélectionner l'image source install.*"
        StepSelectTargets = "Sélectionner les volumes USB cibles et vérifier la vitesse"
        StepConfirmPlan = "Vérifier le plan de copie et confirmer"
        StepExecuteCopy = "Copier les fichiers install.* vers la clé USB"
        CopySummaryTitle = "Résumé de la copie"
        SummaryStatusLabel = "État"
        SummaryTargetsLabel = "Destinations mises à jour"
        CopyConfirmWord = "COPIER"
        SwmMissing = "Des fichiers SWM existent dans {0}, mais install.swm manque."
        NoPayload = "Je ne trouve pas install.wim, install.esd ni install*.swm dans {0}"
        AskCopyInstallFromIso = "Trabajo\images ne contient pas install.*. Monter une ISO depuis Trabajo\ISOs et copier le install.* original maintenant ?"
        NoIsoFound = "Aucun fichier ISO trouvé dans {0}."
        ChooseIso = "Choisir l'ISO à monter :"
        MountingIso = "Montage ISO : {0}"
        DismountingIso = "Démontage ISO : {0}"
        IsoSourcesMissing = "L'ISO montée ne contient pas de dossier sources : {0}"
        IsoInstallMissing = "L'ISO montée ne contient pas install.wim, install.esd ni install*.swm."
        CopyingInstallFromIso = "Copie de install.* depuis l'ISO vers Trabajo\images..."
        ChooseSource = "Choisir la source install.* :"
        SourceNotFound = "La source n'existe pas : {0}"
        SourceInsideImages = "La source doit être dans {0}"
        SwmNeedsInstall = "Pour copier SWM, install.swm doit être avec install2.swm, etc."
        SourceMustBeInstall = "La source doit s'appeler install.wim, install.esd ou install*.swm"
        ReasonCd = "CD-ROM/non inscriptible"
        ReasonNotUsb = "ne ressemble pas à USB ni média Windows"
        ReasonNoFs = "pas de système de fichiers"
        ReasonFat32 = "FAT32 ne prend pas en charge les fichiers de plus de 4 Go"
        ReasonSpace = "espace insuffisant"
        DestPrompt = "Destinations : lettres ou numéros séparés par virgule ({0}A = tout)"
        NoDestination = "Aucune unité destination indiquée."
        InvalidDestNumber = "Numéro de destination invalide : {0}"
        InvalidDest = "Destination invalide : {0}"
        DriveNotListed = "L'unité {0}: n'est pas dans la liste des destinations valides."
        SourceTitle = "Source sélectionnée"
        TypeLabel = "Type"
        FilesLabel = "Fichiers"
        TotalSizeLabel = "Taille totale"
        ValidTargets = "Destinations valides :"
        None = "Aucune."
        SkippedTargets = "Ignorées :"
        NoValidTargets = "Aucune destination valide pour install.* de {0}."
        DriveNotValid = "L'unité {0} n'est pas une destination valide : {1}"
        CopyPlan = "Plan de copie"
        CreateSources = "le dossier sources sera créé"
        ReplaceExisting = "remplace : {0}"
        WillCopy = "copie : {0}"
        ConfirmCopy = "Tapez {0} pour commencer"
        CancelNoCopy = "Annulé. Rien n'a été copié."
        CopyingTo = "Copie de install.* vers {0}..."
        CopyDone = "Copie terminée."
        DefaultOne = "ENTRÉE = {0}:, "
        ColNum = "No"
        ColLetter = "Lettre"
        ColLabel = "Étiquette"
        ColFs = "Système"
        ColType = "Type"
        ColFree = "Libre"
        ColSources = "Sources"
        ColExisting = "InstallExistant"
        ColReason = "Raison"
    }
    ro = @{
        CopyInstallBanner = "COPIERE INSTALL.* PE USB"
        StepSelectSource = "Selectare imagine sursă install.*"
        StepSelectTargets = "Selectare volume USB destinație și verificare viteză"
        StepConfirmPlan = "Verificare plan de copiere și confirmare"
        StepExecuteCopy = "Copiere fișiere install.* pe USB"
        CopySummaryTitle = "Rezumatul copierii"
        SummaryStatusLabel = "Stare"
        SummaryTargetsLabel = "Destinații actualizate"
        CopyConfirmWord = "COPIAZA"
        SwmMissing = "Există fișiere SWM în {0}, dar lipsește install.swm."
        NoPayload = "Nu găsesc install.wim, install.esd sau install*.swm în {0}"
        AskCopyInstallFromIso = "Trabajo\images nu conține install.*. Montezi un ISO din Trabajo\ISOs și copiezi install.* original acum?"
        NoIsoFound = "Nu s-au găsit fișiere ISO în {0}."
        ChooseIso = "Alege ISO pentru montare:"
        MountingIso = "Montez ISO: {0}"
        DismountingIso = "Demontez ISO: {0}"
        IsoSourcesMissing = "ISO-ul montat nu conține folder sources: {0}"
        IsoInstallMissing = "ISO-ul montat nu conține install.wim, install.esd sau install*.swm."
        CopyingInstallFromIso = "Copiez install.* din ISO în Trabajo\images..."
        ChooseSource = "Alege sursa install.*:"
        SourceNotFound = "Sursa nu există: {0}"
        SourceInsideImages = "Sursa trebuie să fie în {0}"
        SwmNeedsInstall = "Pentru copiere SWM trebuie să existe install.swm lângă install2.swm, etc."
        SourceMustBeInstall = "Sursa trebuie să se numească install.wim, install.esd sau install*.swm"
        ReasonCd = "CD-ROM/nu se poate scrie"
        ReasonNotUsb = "nu pare USB sau mediu Windows"
        ReasonNoFs = "fără sistem de fișiere"
        ReasonFat32 = "FAT32 nu suportă fișiere mai mari de 4 GB"
        ReasonSpace = "spațiu insuficient"
        DestPrompt = "Destinații: litere sau numere separate prin virgulă ({0}A = toate)"
        NoDestination = "Nu s-a indicat nicio unitate destinație."
        InvalidDestNumber = "Număr destinație invalid: {0}"
        InvalidDest = "Destinație invalidă: {0}"
        DriveNotListed = "Unitatea {0}: nu este în lista destinațiilor valide."
        SourceTitle = "Sursă selectată"
        TypeLabel = "Tip"
        FilesLabel = "Fișiere"
        TotalSizeLabel = "Dimensiune totală"
        ValidTargets = "Destinații valide:"
        None = "Niciuna."
        SkippedTargets = "Omise:"
        NoValidTargets = "Nu există destinație validă pentru install.* de {0}."
        DriveNotValid = "Unitatea {0} nu este destinație validă: {1}"
        CopyPlan = "Plan de copiere"
        CreateSources = "folderul sources va fi creat"
        ReplaceExisting = "înlocuiește: {0}"
        WillCopy = "copiază: {0}"
        ConfirmCopy = "Tastează {0} pentru a începe"
        CancelNoCopy = "Anulat. Nu am copiat nimic."
        CopyingTo = "Copiez install.* în {0}..."
        CopyDone = "Copiere finalizată."
        DefaultOne = "ENTER = {0}:, "
        ColNum = "Nr"
        ColLetter = "Literă"
        ColLabel = "Etichetă"
        ColFs = "Sistem"
        ColType = "Tip"
        ColFree = "Liber"
        ColSources = "AreSources"
        ColExisting = "InstallExistent"
        ColReason = "Motiv"
    }
    de = @{
        CopyInstallBanner = "INSTALL.* AUF USB KOPIEREN"
        StepSelectSource = "install.*-Quell-Image auswählen"
        StepSelectTargets = "Ziel-USB-Volumes wählen und Geschwindigkeit prüfen"
        StepConfirmPlan = "Kopierplan prüfen und bestätigen"
        StepExecuteCopy = "install.*-Dateien auf USB kopieren"
        CopySummaryTitle = "Kopierzusammenfassung"
        SummaryStatusLabel = "Status"
        SummaryTargetsLabel = "Aktualisierte Ziele"
        CopyConfirmWord = "KOPIEREN"
        SwmMissing = "SWM-Dateien sind in {0} vorhanden, aber install.swm fehlt."
        NoPayload = "Ich finde install.wim, install.esd oder install*.swm nicht in {0}"
        AskCopyInstallFromIso = "Trabajo\images enthält kein install.*. Eine ISO aus Trabajo\ISOs mounten und das originale install.* jetzt kopieren?"
        NoIsoFound = "Keine ISO-Dateien in {0} gefunden."
        ChooseIso = "ISO zum Mounten wählen:"
        MountingIso = "ISO wird gemountet: {0}"
        DismountingIso = "ISO wird demountet: {0}"
        IsoSourcesMissing = "Die gemountete ISO enthält keinen sources-Ordner: {0}"
        IsoInstallMissing = "Die gemountete ISO enthält kein install.wim, install.esd oder install*.swm."
        CopyingInstallFromIso = "install.* wird aus ISO nach Trabajo\images kopiert..."
        ChooseSource = "install.* Quelle wählen:"
        SourceNotFound = "Quelle existiert nicht: {0}"
        SourceInsideImages = "Die Quelle muss in {0} liegen"
        SwmNeedsInstall = "Zum Kopieren von SWM muss install.swm neben install2.swm usw. liegen."
        SourceMustBeInstall = "Die Quelle muss install.wim, install.esd oder install*.swm heißen"
        ReasonCd = "CD-ROM/nicht beschreibbar"
        ReasonNotUsb = "sieht nicht wie USB oder Windows-Medium aus"
        ReasonNoFs = "kein Dateisystem"
        ReasonFat32 = "FAT32 unterstützt keine Dateien über 4 GB"
        ReasonSpace = "nicht genug Speicherplatz"
        DestPrompt = "Ziele: Buchstaben oder Nummern durch Komma getrennt ({0}A = alle)"
        NoDestination = "Kein Ziellaufwerk angegeben."
        InvalidDestNumber = "Ungültige Zielnummer: {0}"
        InvalidDest = "Ungültiges Ziel: {0}"
        DriveNotListed = "Laufwerk {0}: ist nicht in der Liste gültiger Ziele."
        SourceTitle = "Ausgewählte Quelle"
        TypeLabel = "Typ"
        FilesLabel = "Dateien"
        TotalSizeLabel = "Gesamtgröße"
        ValidTargets = "Gültige Ziele:"
        None = "Keine."
        SkippedTargets = "Übersprungen:"
        NoValidTargets = "Kein gültiges Ziel für install.* mit {0}."
        DriveNotValid = "Laufwerk {0} ist kein gültiges Ziel: {1}"
        CopyPlan = "Kopierplan"
        CreateSources = "Ordner sources wird erstellt"
        ReplaceExisting = "ersetzt: {0}"
        WillCopy = "kopiert: {0}"
        ConfirmCopy = "Tippen Sie {0} zum Start"
        CancelNoCopy = "Abgebrochen. Es wurde nichts kopiert."
        CopyingTo = "Kopiere install.* nach {0}..."
        CopyDone = "Kopie abgeschlossen."
        DefaultOne = "EINGABE = {0}:, "
        ColNum = "Nr"
        ColLetter = "Buchstabe"
        ColLabel = "Label"
        ColFs = "Dateisystem"
        ColType = "Typ"
        ColFree = "Frei"
        ColSources = "HatSources"
        ColExisting = "VorhandenesInstall"
        ColReason = "Grund"
    }
}

function Pause-Exit {
    Write-Host ""
    Read-Host (L "PressEnterContinue") | Out-Null
}

function Test-InsidePath {
    param(
        [string]$Path,
        [string]$Root
    )

    $resolvedPath = (Resolve-Path -LiteralPath $Path).Path
    $resolvedRoot = (Resolve-Path -LiteralPath $Root).Path.TrimEnd("\")
    return ($resolvedPath -eq $resolvedRoot -or $resolvedPath.StartsWith($resolvedRoot + "\", [System.StringComparison]::OrdinalIgnoreCase))
}

function Format-Bytes {
    param([UInt64]$Bytes)

    return (Format-LabBytes -Bytes $Bytes)
}

function Convert-DriveTypeName {
    param($DriveType)

    switch ([string]$DriveType) {
        "0" { "Unknown"; break }
        "1" { "NoRootDirectory"; break }
        "2" { "Removable"; break }
        "3" { "Fixed"; break }
        "4" { "Network"; break }
        "5" { "CD-ROM"; break }
        "6" { "RAM"; break }
        default { [string]$DriveType }
    }
}

function Get-LabVolumeInfo {
    try {
        return @(Get-Volume -ErrorAction Stop |
            Where-Object DriveLetter |
            ForEach-Object {
                [pscustomobject]@{
                    DriveLetter = ([string]$_.DriveLetter).ToUpperInvariant()
                    FileSystemLabel = $_.FileSystemLabel
                    FileSystem = $_.FileSystem
                    DriveType = Convert-DriveTypeName -DriveType $_.DriveType
                    SizeRemaining = [UInt64]$_.SizeRemaining
                    Size = [UInt64]$_.Size
                }
            })
    }
    catch {
        return @(Get-CimInstance -ClassName Win32_LogicalDisk -ErrorAction Stop |
            Where-Object DeviceID |
            ForEach-Object {
                [pscustomobject]@{
                    DriveLetter = $_.DeviceID.TrimEnd(":").ToUpperInvariant()
                    FileSystemLabel = $_.VolumeName
                    FileSystem = $_.FileSystem
                    DriveType = Convert-DriveTypeName -DriveType $_.DriveType
                    SizeRemaining = if ($null -ne $_.FreeSpace) { [UInt64]$_.FreeSpace } else { [UInt64]0 }
                    Size = if ($null -ne $_.Size) { [UInt64]$_.Size } else { [UInt64]0 }
                }
            })
    }
}

function Get-FileTotalSize {
    param([object[]]$Files)

    $total = [UInt64]0
    foreach ($file in @($Files)) {
        if ($null -ne $file -and $null -ne $file.Length) {
            $total += [UInt64]$file.Length
        }
    }

    return $total
}

function New-InstallPayload {
    param(
        [string]$Type,
        [string]$SourceName,
        [object[]]$Files
    )

    $fileArray = @($Files | Sort-Object Name)
    [pscustomobject]@{
        Type = $Type
        Source = $SourceName
        Files = $fileArray
        TotalSize = Get-FileTotalSize -Files $fileArray
        Names = (($fileArray | ForEach-Object Name) -join ", ")
    }
}

function Get-InstallPayloadCandidates {
    if (-not (Test-Path -LiteralPath $ImagesRoot -PathType Container)) {
        return @()
    }

    $payloads = New-Object System.Collections.Generic.List[object]

    $wim = Get-Item -LiteralPath (Join-Path $ImagesRoot "install.wim") -ErrorAction SilentlyContinue
    if ($wim) {
        $payloads.Add((New-InstallPayload -Type "WIM" -SourceName "Trabajo\images" -Files @($wim)))
    }

    $esd = Get-Item -LiteralPath (Join-Path $ImagesRoot "install.esd") -ErrorAction SilentlyContinue
    if ($esd) {
        $payloads.Add((New-InstallPayload -Type "ESD" -SourceName "Trabajo\images" -Files @($esd)))
    }

    $swmFiles = @(Get-ChildItem -LiteralPath $ImagesRoot -File -Filter "install*.swm" -ErrorAction SilentlyContinue | Sort-Object Name)
    if ($swmFiles.Count -gt 0) {
        if (-not ($swmFiles | Where-Object { $_.Name -ieq "install.swm" })) {
            throw (LF "SwmMissing" $ImagesRoot)
        }
        $payloads.Add((New-InstallPayload -Type "SWM" -SourceName "Trabajo\images" -Files $swmFiles))
    }

    return @($payloads.ToArray())
}

function Get-IsoCandidates {
    if (-not (Test-Path -LiteralPath $IsosRoot -PathType Container)) {
        return @()
    }

    return @(Get-ChildItem -LiteralPath $IsosRoot -Filter "*.iso" -File -ErrorAction SilentlyContinue | Sort-Object LastWriteTime -Descending)
}

function Select-IsoCandidate {
    $isos = @(Get-IsoCandidates)
    if ($isos.Count -eq 0) {
        throw (LF "NoIsoFound" $IsosRoot)
    }
    if ($isos.Count -eq 1) {
        return $isos[0]
    }

    Write-LabSubsection (L "ChooseIso")
    for ($i = 0; $i -lt $isos.Count; $i++) {
        Write-Host ("  [{0,2}] {1}  [{2}]" -f ($i + 1), $isos[$i].FullName, (Format-Bytes -Bytes ([UInt64]$isos[$i].Length)))
    }

    do {
        $answer = Read-Host (L "Number")
        $number = 0
    } until ([int]::TryParse($answer, [ref]$number) -and $number -ge 1 -and $number -le $isos.Count)

    return $isos[$number - 1]
}

function Mount-IsoForSources {
    param([string]$IsoPath)

    $mountedByScript = $false
    try {
        $image = Get-DiskImage -ImagePath $IsoPath -ErrorAction SilentlyContinue
        if (-not $image -or -not $image.Attached) {
            Write-LabInfo (LF "MountingIso" $IsoPath) Cyan
            Mount-DiskImage -ImagePath $IsoPath -ErrorAction Stop | Out-Null
            $mountedByScript = $true
            Start-Sleep -Seconds 1
            $image = Get-DiskImage -ImagePath $IsoPath -ErrorAction Stop
        }

        $volume = @($image | Get-Volume -ErrorAction SilentlyContinue | Where-Object DriveLetter | Select-Object -First 1)
        if ($volume.Count -eq 0) {
            throw (LF "IsoSourcesMissing" $IsoPath)
        }

        $sources = "{0}:\sources" -f $volume[0].DriveLetter
        if (-not (Test-Path -LiteralPath $sources -PathType Container)) {
            throw (LF "IsoSourcesMissing" $sources)
        }

        return [pscustomobject]@{
            IsoPath = $IsoPath
            MountedByScript = $mountedByScript
            Sources = $sources
        }
    }
    catch {
        if ($mountedByScript) {
            Dismount-DiskImage -ImagePath $IsoPath -ErrorAction SilentlyContinue | Out-Null
        }
        throw
    }
}

function Dismount-IsoForSources {
    param([object]$MountInfo)

    if ($MountInfo -and $MountInfo.MountedByScript) {
        Write-LabInfo (LF "DismountingIso" $MountInfo.IsoPath) Cyan
        Dismount-DiskImage -ImagePath $MountInfo.IsoPath -ErrorAction SilentlyContinue | Out-Null
    }
}

function Get-InstallPayloadFromIsoSources {
    param([string]$SourcesRoot)

    $wim = Get-Item -LiteralPath (Join-Path $SourcesRoot "install.wim") -ErrorAction SilentlyContinue
    if ($wim) { return New-InstallPayload -Type "WIM" -SourceName "ISO\sources" -Files @($wim) }

    $esd = Get-Item -LiteralPath (Join-Path $SourcesRoot "install.esd") -ErrorAction SilentlyContinue
    if ($esd) { return New-InstallPayload -Type "ESD" -SourceName "ISO\sources" -Files @($esd) }

    $swmFiles = @(Get-ChildItem -LiteralPath $SourcesRoot -File -Filter "install*.swm" -ErrorAction SilentlyContinue | Sort-Object Name)
    if ($swmFiles.Count -gt 0) {
        if (-not ($swmFiles | Where-Object { $_.Name -ieq "install.swm" })) {
            throw (LF "SwmMissing" $SourcesRoot)
        }
        return New-InstallPayload -Type "SWM" -SourceName "ISO\sources" -Files $swmFiles
    }

    return $null
}

function Ensure-InstallPayloadFromIso {
    if (-not (Confirm-LabYesNo -Question (L "AskCopyInstallFromIso") -Default $true)) {
        return $false
    }

    $iso = Select-IsoCandidate
    $mountInfo = $null
    try {
        $mountInfo = Mount-IsoForSources -IsoPath $iso.FullName
        $payload = Get-InstallPayloadFromIsoSources -SourcesRoot $mountInfo.Sources
        if (-not $payload) {
            throw (L "IsoInstallMissing")
        }

        if (-not (Test-Path -LiteralPath $ImagesRoot -PathType Container)) {
            New-Item -ItemType Directory -Path $ImagesRoot -Force | Out-Null
        }

        Write-LabSubsection (L "CopyingInstallFromIso")
        foreach ($file in @($payload.Files)) {
            Copy-LabFileWithProgress -Source $file.FullName -Destination (Join-Path $ImagesRoot $file.Name) -Activity (L "CopyingInstallFromIso") | Out-Null
        }

        return $true
    }
    finally {
        Dismount-IsoForSources -MountInfo $mountInfo
    }
}

function Resolve-SourcePayload {
    param([string]$SourcePath)

    if ([string]::IsNullOrWhiteSpace($SourcePath)) {
        $payloads = @(Get-InstallPayloadCandidates)
        if ($payloads.Count -eq 0) {
            if (Ensure-InstallPayloadFromIso) {
                $payloads = @(Get-InstallPayloadCandidates)
            }
        }

        if ($payloads.Count -eq 0) {
            throw (LF "NoPayload" $ImagesRoot)
        }

        if ($payloads.Count -eq 1) {
            return $payloads[0]
        }

        Write-LabSubsection (L "ChooseSource")
        for ($i = 0; $i -lt $payloads.Count; $i++) {
            $payload = $payloads[$i]
            Write-Host ("  [{0,2}] {1}  [{2}]  {3}" -f ($i + 1), $payload.Type, (Format-Bytes -Bytes $payload.TotalSize), $payload.Names)
        }

        do {
            $answer = Read-Host (L "Number")
            $number = 0
        } until ([int]::TryParse($answer, [ref]$number) -and $number -ge 1 -and $number -le $payloads.Count)

        return $payloads[$number - 1]
    }

    $SourcePath = $SourcePath.Trim('"')
    if (-not (Test-Path -LiteralPath $SourcePath -PathType Leaf)) {
        throw (LF "SourceNotFound" $SourcePath)
    }
    if (-not (Test-InsidePath -Path $SourcePath -Root $ImagesRoot)) {
        throw (LF "SourceInsideImages" $ImagesRoot)
    }

    $item = Get-Item -LiteralPath $SourcePath
    switch -Regex ($item.Name.ToLowerInvariant()) {
        "^install\.wim$" { return New-InstallPayload -Type "WIM" -SourceName "Trabajo\images" -Files @($item) }
        "^install\.esd$" { return New-InstallPayload -Type "ESD" -SourceName "Trabajo\images" -Files @($item) }
        "^install\d*\.swm$" {
            $swmFiles = @(Get-ChildItem -LiteralPath $item.DirectoryName -File -Filter "install*.swm" | Sort-Object Name)
            if (-not ($swmFiles | Where-Object { $_.Name -ieq "install.swm" })) {
                throw (L "SwmNeedsInstall")
            }
            return New-InstallPayload -Type "SWM" -SourceName "Trabajo\images" -Files $swmFiles
        }
        default { throw (L "SourceMustBeInstall") }
    }
}

function Get-ExistingInstallFiles {
    param([string]$SourcesDir)

    if (-not (Test-Path -LiteralPath $SourcesDir -PathType Container)) {
        return @()
    }

    return @(Get-ChildItem -LiteralPath $SourcesDir -File -ErrorAction SilentlyContinue |
        Where-Object { $_.Name -match "^install(\d*)\.(wim|esd|swm)$" } |
        Sort-Object Name)
}

function Get-InstallTargetCheck {
    param(
        [object]$Volume,
        [UInt64]$SourceSize,
        [object[]]$SourceFiles
    )

    $root = "$($Volume.DriveLetter):\"
    $sourcesDir = Join-Path $root "sources"
    $hasSources = Test-Path -LiteralPath $sourcesDir
    $existingFiles = @(Get-ExistingInstallFiles -SourcesDir $sourcesDir)
    $existingSize = Get-FileTotalSize -Files $existingFiles
    $usableFree = [UInt64]($Volume.SizeRemaining + $existingSize)
    $fileSystem = ([string]$Volume.FileSystem).ToUpperInvariant()
    $driveType = [string]$Volume.DriveType
    $hasFat32OversizedFile = @($SourceFiles | Where-Object { [UInt64]$_.Length -ge 4GB }).Count -gt 0

    $reason = $null
    if ($driveType -eq "CD-ROM") {
        $reason = L "ReasonCd"
    }
    elseif (-not ($driveType -eq "Removable" -or $hasSources)) {
        $reason = L "ReasonNotUsb"
    }
    elseif ([string]::IsNullOrWhiteSpace($fileSystem)) {
        $reason = L "ReasonNoFs"
    }
    elseif (($fileSystem -eq "FAT32" -or $fileSystem -eq "FAT") -and $hasFat32OversizedFile) {
        $reason = L "ReasonFat32"
    }
    elseif ($usableFree -lt $SourceSize) {
        $reason = L "ReasonSpace"
    }

    [pscustomobject]@{
        IsValid = [string]::IsNullOrWhiteSpace($reason)
        Reason = $reason
        HasSources = $hasSources
        ExistingFiles = $existingFiles
        UsableFree = $usableFree
    }
}

function Get-DestinationRows {
    param([UInt64]$SourceSize, [object[]]$SourceFiles)

    $index = 1
    foreach ($volume in @(Get-LabVolumeInfo | Sort-Object DriveLetter)) {
        $check = Get-InstallTargetCheck -Volume $volume -SourceSize $SourceSize -SourceFiles $SourceFiles
        $appearsRelevant = ($volume.DriveType -eq "Removable" -or $check.HasSources -or $volume.DriveType -eq "CD-ROM")
        if (-not $appearsRelevant) {
            continue
        }

        $usbInfo = Get-LabVolumeUsbSpeedInfo -DriveLetter $volume.DriveLetter
        [pscustomobject]@{
            Num = $index
            Letra = $volume.DriveLetter
            Etiqueta = $volume.FileSystemLabel
            Sistema = $volume.FileSystem
            Tipo = $volume.DriveType
            Usb = $usbInfo.UsbDisplay
            Libre = Format-Bytes -Bytes ([UInt64]$volume.SizeRemaining)
            TieneSources = $check.HasSources
            InstallExistente = if (@($check.ExistingFiles).Count -gt 0) { ((@($check.ExistingFiles) | ForEach-Object Name) -join ", ") } else { "" }
            Valido = $check.IsValid
            Motivo = if ($check.IsValid) { "" } else { $check.Reason }
        }
        $index++
    }
}

function Resolve-DestinationSelection {
    param(
        [object[]]$ValidRows,
        [string[]]$Requested
    )

    if ($Requested -and $Requested.Count -gt 0) {
        $raw = ($Requested -join ",")
    }
    else {
        $defaultText = if ($ValidRows.Count -eq 1) { LF "DefaultOne" $ValidRows[0].Letra } else { "" }
        $raw = Read-Host (LF "DestPrompt" $defaultText)
        if ([string]::IsNullOrWhiteSpace($raw) -and $ValidRows.Count -eq 1) {
            $raw = $ValidRows[0].Letra
        }
    }

    if ([string]::IsNullOrWhiteSpace($raw)) {
        throw (L "NoDestination")
    }

    $selected = New-Object System.Collections.Generic.List[string]
    foreach ($part in ($raw -split "[,; ]+")) {
        $token = $part.Trim().TrimEnd(":\/").ToUpperInvariant()
        if ([string]::IsNullOrWhiteSpace($token)) { continue }

        if ($token -in @("A", "ALL", "TODOS", "TOUT", "TOUS", "TOATE", "ALLE")) {
            foreach ($row in $ValidRows) {
                if (-not $selected.Contains($row.Letra)) { $selected.Add($row.Letra) }
            }
            continue
        }

        $number = 0
        if ([int]::TryParse($token, [ref]$number)) {
            $row = $ValidRows | Where-Object Num -eq $number | Select-Object -First 1
            if (-not $row) { throw (LF "InvalidDestNumber" $token) }
            if (-not $selected.Contains($row.Letra)) { $selected.Add($row.Letra) }
            continue
        }

        if ($token -notmatch "^[A-Z]$") {
            throw (LF "InvalidDest" $part)
        }

        $row = $ValidRows | Where-Object Letra -eq $token | Select-Object -First 1
        if (-not $row) { throw (LF "DriveNotListed" $token) }
        if (-not $selected.Contains($token)) { $selected.Add($token) }
    }

    return @($selected.ToArray())
}

try {
    Clear-Host
    Write-LabBanner -Title (L "CopyInstallBanner") -Subtitle $LabRoot

    Write-LabStepHeader -Step 1 -TotalSteps 4 -Title (L "StepSelectSource")
    $payload = Resolve-SourcePayload -SourcePath $Source
    Write-LabStatusPanel -Title (L "SourceTitle") -Items @(
        @{ Label = (L "TypeLabel"); Value = $payload.Type; Color = [ConsoleColor]::White },
        @{ Label = (L "FilesLabel"); Value = $payload.Names; Color = [ConsoleColor]::Green },
        @{ Label = (L "TotalSizeLabel"); Value = (Format-Bytes -Bytes $payload.TotalSize); Color = [ConsoleColor]::Cyan }
    )

    Write-LabStepHeader -Step 2 -TotalSteps 4 -Title (L "StepSelectTargets")
    $destinationRows = @(Get-DestinationRows -SourceSize $payload.TotalSize -SourceFiles @($payload.Files))
    $validRows = @($destinationRows | Where-Object Valido)
    $invalidRows = @($destinationRows | Where-Object { -not $_.Valido })

    Write-LabSubsection (L "ValidTargets")
    if ($validRows.Count -eq 0) {
        Write-Host ("  {0}" -f (L "None")) -ForegroundColor Yellow
    }
    else {
        $validRows |
            Select-Object @{Name = (L "ColNum"); Expression = { $_.Num } },
                          @{Name = (L "ColLetter"); Expression = { $_.Letra } },
                          @{Name = (L "ColLabel"); Expression = { $_.Etiqueta } },
                          @{Name = (L "ColFs"); Expression = { $_.Sistema } },
                          @{Name = (L "ColType"); Expression = { $_.Tipo } },
                          @{Name = (L "UsbColHeader"); Expression = { $_.Usb } },
                          @{Name = (L "ColFree"); Expression = { $_.Libre } },
                          @{Name = (L "ColSources"); Expression = { $_.TieneSources } },
                          @{Name = (L "ColExisting"); Expression = { $_.InstallExistente } } |
            Format-Table -AutoSize
    }

    if ($invalidRows.Count -gt 0) {
        Write-LabSubsection (L "SkippedTargets") Yellow
        $invalidRows |
            Select-Object @{Name = (L "ColLetter"); Expression = { $_.Letra } },
                          @{Name = (L "ColLabel"); Expression = { $_.Etiqueta } },
                          @{Name = (L "ColFs"); Expression = { $_.Sistema } },
                          @{Name = (L "ColType"); Expression = { $_.Tipo } },
                          @{Name = (L "UsbColHeader"); Expression = { $_.Usb } },
                          @{Name = (L "ColFree"); Expression = { $_.Libre } },
                          @{Name = (L "ColReason"); Expression = { $_.Motivo } } |
            Format-Table -AutoSize
    }

    if ($validRows.Count -eq 0) {
        throw (LF "NoValidTargets" (Format-Bytes -Bytes $payload.TotalSize))
    }

    $letters = @(Resolve-DestinationSelection -ValidRows $validRows -Requested $DestinationLetters)
    $usbCheck = Confirm-LabUsbVolumesSpeed -DriveLetters $letters
    if (-not $usbCheck.Approved) {
        Write-LabWarning (L "CancelNoCopy")
        Pause-Exit
        return
    }
    $letters = @($usbCheck.DriveLetters)

    $volumeByLetter = @{}
    foreach ($volume in @(Get-LabVolumeInfo)) {
        $volumeByLetter[$volume.DriveLetter] = $volume
    }

    $targets = @(foreach ($letter in $letters) {
        if (-not $volumeByLetter.ContainsKey($letter)) {
            throw (LF "DriveNotListed" $letter)
        }
        $volume = $volumeByLetter[$letter]
        $root = "$letter`:\"
        $sourcesDir = Join-Path $root "sources"
        $check = Get-InstallTargetCheck -Volume $volume -SourceSize $payload.TotalSize -SourceFiles @($payload.Files)
        if (-not $check.IsValid) {
            throw (LF "DriveNotValid" $root $check.Reason)
        }
        $volUsbInfo = Get-LabVolumeUsbSpeedInfo -DriveLetter $letter

        [pscustomobject]@{
            Letter = $letter
            Root = $root
            SourcesDir = $sourcesDir
            UsbDisplay = $volUsbInfo.UsbDisplay
            IsUsb2 = $volUsbInfo.IsUsb2
            NeedsSources = -not (Test-Path -LiteralPath $sourcesDir)
            ExistingFiles = @($check.ExistingFiles)
        }
    })

    Write-LabStepHeader -Step 3 -TotalSteps 4 -Title (L "StepConfirmPlan")
    $planItems = [System.Collections.Generic.List[object]]::new()
    $planItems.Add(@{ Label = (L "FilesLabel"); Value = ("{0} ({1}, {2})" -f $payload.Names, $payload.Type, (Format-Bytes -Bytes $payload.TotalSize)); Color = [ConsoleColor]::White })
    foreach ($target in $targets) {
        $actions = [System.Collections.Generic.List[string]]::new()
        if ($target.NeedsSources) { $actions.Add((L "CreateSources")) }
        if (@($target.ExistingFiles).Count -gt 0) {
            $actions.Add((LF "ReplaceExisting" ((@($target.ExistingFiles) | ForEach-Object Name) -join ", ")))
        }
        $actions.Add((LF "WillCopy" $payload.Names))
        $planItems.Add(@{
            Label = ("{0}sources [{1}]" -f $target.Root, $target.UsbDisplay)
            Value = ($actions.ToArray() -join " | ")
            Color = $(if ($target.IsUsb2) { [ConsoleColor]::Yellow } else { [ConsoleColor]::Green })
        })
    }
    Write-LabStatusPanel -Title (L "CopyPlan") -Items ($planItems.ToArray())

    $confirmWord = L "CopyConfirmWord"
    $confirmation = Read-Host (LF "ConfirmCopy" $confirmWord)
    if ($confirmation.Trim().ToUpperInvariant() -notin @($confirmWord.ToUpperInvariant(), "COPIAR", "COPY")) {
        Write-LabWarning (L "CancelNoCopy")
        Pause-Exit
        return
    }

    Write-LabStepHeader -Step 4 -TotalSteps 4 -Title (L "StepExecuteCopy")
    foreach ($target in $targets) {
        if ($target.NeedsSources) {
            New-Item -ItemType Directory -Path $target.SourcesDir -Force | Out-Null
        }

        foreach ($existing in @($target.ExistingFiles)) {
            Remove-Item -LiteralPath $existing.FullName -Force
        }

        Write-LabSubsection (LF "CopyingTo" $target.SourcesDir)
        foreach ($file in @($payload.Files)) {
            Copy-LabFileWithProgress -Source $file.FullName -Destination (Join-Path $target.SourcesDir $file.Name) -Activity (LF "CopyingTo" $target.SourcesDir) | Out-Null
        }
    }

    $targetSummary = (($targets | ForEach-Object { "{0}sources [{1}]" -f $_.Root, $_.UsbDisplay }) -join ", ")
    Write-LabStatusPanel -Title (L "CopySummaryTitle") -TitleColor Green -Items @(
        @{ Label = (L "SummaryStatusLabel"); Value = (L "CopyDone"); Color = [ConsoleColor]::Green },
        @{ Label = (L "FilesLabel"); Value = $payload.Names; Color = [ConsoleColor]::White },
        @{ Label = (L "TotalSizeLabel"); Value = (Format-Bytes -Bytes $payload.TotalSize); Color = [ConsoleColor]::Cyan },
        @{ Label = (L "SummaryTargetsLabel"); Value = $targetSummary; Color = [ConsoleColor]::Green }
    )
    Pause-Exit
}
catch {
    Write-Host ""
    Write-LabError (LF "ErrorPrefix" $_.Exception.Message)
    Pause-Exit
}
