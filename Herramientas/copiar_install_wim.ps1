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

Add-LabTranslations @{
    en = @{
        CopyConfirmWord = "COPY"
        SwmMissing = "SWM files exist in {0}, but install.swm is missing."
        NoPayload = "I cannot find install.wim, install.esd or install*.swm inside {0}"
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
        SourceTitle = "Source:"
        TypeLabel = "Type"
        FilesLabel = "Files"
        TotalSizeLabel = "Total size"
        ValidTargets = "Valid destinations:"
        None = "None."
        SkippedTargets = "Skipped:"
        NoValidTargets = "There is no valid destination for install.* of {0}."
        DriveNotValid = "Drive {0} is not a valid destination: {1}"
        CopyPlan = "Copy plan:"
        CreateSources = "sources folder will be created"
        ReplaceExisting = "will replace: {0}"
        WillCopy = "will copy: {0}"
        ConfirmCopy = "Type {0} to start"
        CancelNoCopy = "Cancelled. Nothing was copied."
        CopyingTo = "Copying install.* to {0}..."
        CopyDone = "Copy completed."
        DefaultOne = "ENTER = {0}, "
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
        CopyConfirmWord = "COPIAR"
        SwmMissing = "Hay archivos SWM en {0}, pero falta install.swm."
        NoPayload = "No encuentro install.wim, install.esd ni install*.swm dentro de {0}"
        ChooseSource = "Elige install.* origen:"
        SourceNotFound = "No existe el origen: {0}"
        SourceInsideImages = "El origen debe estar dentro de {0}"
        SwmNeedsInstall = "Para copiar SWM debe existir install.swm junto a install2.swm, etc."
        SourceMustBeInstall = "El origen debe llamarse install.wim, install.esd o install*.swm"
        ReasonCd = "CD-ROM/no escribible"
        ReasonNotUsb = "no parece USB ni medio Windows"
        ReasonNoFs = "sin sistema de archivos"
        ReasonFat32 = "FAT32 no admite archivos de mas de 4 GB"
        ReasonSpace = "espacio insuficiente"
        DestPrompt = "Destinos: letras o numeros separados por coma ({0}A = todos)"
        NoDestination = "No se indico ninguna unidad destino."
        InvalidDestNumber = "Numero de destino no valido: {0}"
        InvalidDest = "Destino no valido: {0}"
        DriveNotListed = "La unidad {0}: no esta en la lista de destinos validos."
        SourceTitle = "Origen:"
        TypeLabel = "Tipo"
        FilesLabel = "Archivos"
        TotalSizeLabel = "Tamano total"
        ValidTargets = "Destinos validos:"
        None = "Ninguno."
        SkippedTargets = "Omitidos:"
        NoValidTargets = "No hay ningun destino valido para install.* de {0}."
        DriveNotValid = "La unidad {0} no es destino valido: {1}"
        CopyPlan = "Plan de copia:"
        CreateSources = "se creara carpeta sources"
        ReplaceExisting = "se reemplazara: {0}"
        WillCopy = "se copiara: {0}"
        ConfirmCopy = "Escribe {0} para empezar"
        CancelNoCopy = "Cancelado. No he copiado nada."
        CopyingTo = "Copiando install.* a {0}..."
        CopyDone = "Copia completada."
        DefaultOne = "ENTER = {0}, "
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
        CopyConfirmWord = "COPIER"
        SwmMissing = "Des fichiers SWM existent dans {0}, mais install.swm manque."
        NoPayload = "Je ne trouve pas install.wim, install.esd ni install*.swm dans {0}"
        ChooseSource = "Choisir la source install.*:"
        SourceNotFound = "La source n'existe pas: {0}"
        SourceInsideImages = "La source doit etre dans {0}"
        SwmNeedsInstall = "Pour copier SWM, install.swm doit etre avec install2.swm, etc."
        SourceMustBeInstall = "La source doit s'appeler install.wim, install.esd ou install*.swm"
        ReasonCd = "CD-ROM/non inscriptible"
        ReasonNotUsb = "ne ressemble pas a USB ni media Windows"
        ReasonNoFs = "pas de systeme de fichiers"
        ReasonFat32 = "FAT32 ne prend pas en charge les fichiers de plus de 4 Go"
        ReasonSpace = "espace insuffisant"
        DestPrompt = "Destinations: lettres ou numeros separes par virgule ({0}A = tout)"
        NoDestination = "Aucune unite destination indiquee."
        InvalidDestNumber = "Numero de destination invalide: {0}"
        InvalidDest = "Destination invalide: {0}"
        DriveNotListed = "L'unite {0}: n'est pas dans la liste des destinations valides."
        SourceTitle = "Source:"
        TypeLabel = "Type"
        FilesLabel = "Fichiers"
        TotalSizeLabel = "Taille totale"
        ValidTargets = "Destinations valides:"
        None = "Aucune."
        SkippedTargets = "Ignorees:"
        NoValidTargets = "Aucune destination valide pour install.* de {0}."
        DriveNotValid = "L'unite {0} n'est pas une destination valide: {1}"
        CopyPlan = "Plan de copie:"
        CreateSources = "le dossier sources sera cree"
        ReplaceExisting = "sera remplace: {0}"
        WillCopy = "sera copie: {0}"
        ConfirmCopy = "Tapez {0} pour commencer"
        CancelNoCopy = "Annule. Rien n'a ete copie."
        CopyingTo = "Copie de install.* vers {0}..."
        CopyDone = "Copie terminee."
        DefaultOne = "ENTREE = {0}, "
        ColNum = "No"
        ColLetter = "Lettre"
        ColLabel = "Etiquette"
        ColFs = "Systeme"
        ColType = "Type"
        ColFree = "Libre"
        ColSources = "Sources"
        ColExisting = "InstallExistant"
        ColReason = "Raison"
    }
    ro = @{
        CopyConfirmWord = "COPIAZA"
        SwmMissing = "Exista fisiere SWM in {0}, dar lipseste install.swm."
        NoPayload = "Nu gasesc install.wim, install.esd sau install*.swm in {0}"
        ChooseSource = "Alege sursa install.*:"
        SourceNotFound = "Sursa nu exista: {0}"
        SourceInsideImages = "Sursa trebuie sa fie in {0}"
        SwmNeedsInstall = "Pentru copiere SWM trebuie sa existe install.swm langa install2.swm, etc."
        SourceMustBeInstall = "Sursa trebuie sa se numeasca install.wim, install.esd sau install*.swm"
        ReasonCd = "CD-ROM/nu se poate scrie"
        ReasonNotUsb = "nu pare USB sau mediu Windows"
        ReasonNoFs = "fara sistem de fisiere"
        ReasonFat32 = "FAT32 nu suporta fisiere mai mari de 4 GB"
        ReasonSpace = "spatiu insuficient"
        DestPrompt = "Destinatii: litere sau numere separate prin virgula ({0}A = toate)"
        NoDestination = "Nu s-a indicat nicio unitate destinatie."
        InvalidDestNumber = "Numar destinatie invalid: {0}"
        InvalidDest = "Destinatie invalida: {0}"
        DriveNotListed = "Unitatea {0}: nu este in lista destinatiilor valide."
        SourceTitle = "Sursa:"
        TypeLabel = "Tip"
        FilesLabel = "Fisiere"
        TotalSizeLabel = "Dimensiune totala"
        ValidTargets = "Destinatii valide:"
        None = "Niciuna."
        SkippedTargets = "Omise:"
        NoValidTargets = "Nu exista destinatie valida pentru install.* de {0}."
        DriveNotValid = "Unitatea {0} nu este destinatie valida: {1}"
        CopyPlan = "Plan de copiere:"
        CreateSources = "folderul sources va fi creat"
        ReplaceExisting = "se va inlocui: {0}"
        WillCopy = "se va copia: {0}"
        ConfirmCopy = "Tasteaza {0} pentru a incepe"
        CancelNoCopy = "Anulat. Nu am copiat nimic."
        CopyingTo = "Copiez install.* in {0}..."
        CopyDone = "Copiere finalizata."
        DefaultOne = "ENTER = {0}, "
        ColNum = "Nr"
        ColLetter = "Litera"
        ColLabel = "Eticheta"
        ColFs = "Sistem"
        ColType = "Tip"
        ColFree = "Liber"
        ColSources = "AreSources"
        ColExisting = "InstallExistent"
        ColReason = "Motiv"
    }
    de = @{
        CopyConfirmWord = "KOPIEREN"
        SwmMissing = "SWM-Dateien sind in {0} vorhanden, aber install.swm fehlt."
        NoPayload = "Ich finde install.wim, install.esd oder install*.swm nicht in {0}"
        ChooseSource = "install.* Quelle waehlen:"
        SourceNotFound = "Quelle existiert nicht: {0}"
        SourceInsideImages = "Die Quelle muss in {0} liegen"
        SwmNeedsInstall = "Zum Kopieren von SWM muss install.swm neben install2.swm usw. liegen."
        SourceMustBeInstall = "Die Quelle muss install.wim, install.esd oder install*.swm heissen"
        ReasonCd = "CD-ROM/nicht beschreibbar"
        ReasonNotUsb = "sieht nicht wie USB oder Windows-Medium aus"
        ReasonNoFs = "kein Dateisystem"
        ReasonFat32 = "FAT32 unterstuetzt keine Dateien ueber 4 GB"
        ReasonSpace = "nicht genug Speicherplatz"
        DestPrompt = "Ziele: Buchstaben oder Nummern durch Komma getrennt ({0}A = alle)"
        NoDestination = "Kein Ziellaufwerk angegeben."
        InvalidDestNumber = "Ungueltige Zielnummer: {0}"
        InvalidDest = "Ungueltiges Ziel: {0}"
        DriveNotListed = "Laufwerk {0}: ist nicht in der Liste gueltiger Ziele."
        SourceTitle = "Quelle:"
        TypeLabel = "Typ"
        FilesLabel = "Dateien"
        TotalSizeLabel = "Gesamtgroesse"
        ValidTargets = "Gueltige Ziele:"
        None = "Keine."
        SkippedTargets = "Uebersprungen:"
        NoValidTargets = "Kein gueltiges Ziel fuer install.* mit {0}."
        DriveNotValid = "Laufwerk {0} ist kein gueltiges Ziel: {1}"
        CopyPlan = "Kopierplan:"
        CreateSources = "Ordner sources wird erstellt"
        ReplaceExisting = "wird ersetzt: {0}"
        WillCopy = "wird kopiert: {0}"
        ConfirmCopy = "Tippen Sie {0} zum Start"
        CancelNoCopy = "Abgebrochen. Es wurde nichts kopiert."
        CopyingTo = "Kopiere install.* nach {0}..."
        CopyDone = "Kopie abgeschlossen."
        DefaultOne = "ENTER = {0}, "
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

    if ($Bytes -ge 1TB) { return "{0:N2} TB" -f ($Bytes / 1TB) }
    if ($Bytes -ge 1GB) { return "{0:N2} GB" -f ($Bytes / 1GB) }
    if ($Bytes -ge 1MB) { return "{0:N2} MB" -f ($Bytes / 1MB) }
    return "$Bytes bytes"
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

function Resolve-SourcePayload {
    param([string]$SourcePath)

    if ([string]::IsNullOrWhiteSpace($SourcePath)) {
        $payloads = @(Get-InstallPayloadCandidates)
        if ($payloads.Count -eq 0) {
            throw (LF "NoPayload" $ImagesRoot)
        }

        if ($payloads.Count -eq 1) {
            return $payloads[0]
        }

        Write-LabSection (L "ChooseSource")
        for ($i = 0; $i -lt $payloads.Count; $i++) {
            $payload = $payloads[$i]
            Write-Host ("{0,2}. {1}  [{2}]  {3}" -f ($i + 1), $payload.Type, (Format-Bytes -Bytes $payload.TotalSize), $payload.Names)
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
        [UInt64]$SourceSize
    )

    $root = "$($Volume.DriveLetter):\"
    $sourcesDir = Join-Path $root "sources"
    $hasSources = Test-Path -LiteralPath $sourcesDir
    $existingFiles = @(Get-ExistingInstallFiles -SourcesDir $sourcesDir)
    $existingSize = Get-FileTotalSize -Files $existingFiles
    $usableFree = [UInt64]($Volume.SizeRemaining + $existingSize)
    $fileSystem = ([string]$Volume.FileSystem).ToUpperInvariant()
    $driveType = [string]$Volume.DriveType

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
    elseif (($fileSystem -eq "FAT32" -or $fileSystem -eq "FAT") -and $SourceSize -ge 4GB) {
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
    param([UInt64]$SourceSize)

    $index = 1
    foreach ($volume in @(Get-LabVolumeInfo | Sort-Object DriveLetter)) {
        $check = Get-InstallTargetCheck -Volume $volume -SourceSize $SourceSize
        $appearsRelevant = ($volume.DriveType -eq "Removable" -or $check.HasSources -or $volume.DriveType -eq "CD-ROM")
        if (-not $appearsRelevant) {
            continue
        }

        [pscustomobject]@{
            Num = $index
            Letra = $volume.DriveLetter
            Etiqueta = $volume.FileSystemLabel
            Sistema = $volume.FileSystem
            Tipo = $volume.DriveType
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
        $token = $part.Trim().TrimEnd(":").ToUpperInvariant()
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

$payload = Resolve-SourcePayload -SourcePath $Source
Write-LabSection (L "SourceTitle")
Write-Host ("  {0}: {1}" -f (L "TypeLabel"), $payload.Type)
Write-Host ("  {0}: {1}" -f (L "FilesLabel"), $payload.Names)
Write-Host ("  {0}: {1}" -f (L "TotalSizeLabel"), (Format-Bytes -Bytes $payload.TotalSize))

$destinationRows = @(Get-DestinationRows -SourceSize $payload.TotalSize)
$validRows = @($destinationRows | Where-Object Valido)
$invalidRows = @($destinationRows | Where-Object { -not $_.Valido })

Write-LabSection (L "ValidTargets")
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
                      @{Name = (L "ColFree"); Expression = { $_.Libre } },
                      @{Name = (L "ColSources"); Expression = { $_.TieneSources } },
                      @{Name = (L "ColExisting"); Expression = { $_.InstallExistente } } |
        Format-Table -AutoSize
}

if ($invalidRows.Count -gt 0) {
    Write-LabSection (L "SkippedTargets") Yellow
    $invalidRows |
        Select-Object @{Name = (L "ColLetter"); Expression = { $_.Letra } },
                      @{Name = (L "ColLabel"); Expression = { $_.Etiqueta } },
                      @{Name = (L "ColFs"); Expression = { $_.Sistema } },
                      @{Name = (L "ColType"); Expression = { $_.Tipo } },
                      @{Name = (L "ColFree"); Expression = { $_.Libre } },
                      @{Name = (L "ColReason"); Expression = { $_.Motivo } } |
        Format-Table -AutoSize
}

if ($validRows.Count -eq 0) {
    throw (LF "NoValidTargets" (Format-Bytes -Bytes $payload.TotalSize))
}

$letters = @(Resolve-DestinationSelection -ValidRows $validRows -Requested $DestinationLetters)
$volumeByLetter = @{}
foreach ($volume in @(Get-LabVolumeInfo)) {
    $volumeByLetter[$volume.DriveLetter] = $volume
}

$targets = foreach ($letter in $letters) {
    $volume = $volumeByLetter[$letter]
    $root = "$letter`:\"
    $sourcesDir = Join-Path $root "sources"
    $check = Get-InstallTargetCheck -Volume $volume -SourceSize $payload.TotalSize
    if (-not $check.IsValid) {
        throw (LF "DriveNotValid" $root $check.Reason)
    }

    [pscustomobject]@{
        Letter = $letter
        Root = $root
        SourcesDir = $sourcesDir
        NeedsSources = -not (Test-Path -LiteralPath $sourcesDir)
        ExistingFiles = @($check.ExistingFiles)
    }
}

Write-LabSection (L "CopyPlan")
foreach ($target in $targets) {
    Write-Host ("  {0}sources" -f $target.Root)
    if ($target.NeedsSources) {
        Write-Host ("    {0}" -f (L "CreateSources")) -ForegroundColor Yellow
    }
    if (@($target.ExistingFiles).Count -gt 0) {
        Write-Host ("    {0}" -f (LF "ReplaceExisting" ((@($target.ExistingFiles) | ForEach-Object Name) -join ", "))) -ForegroundColor Yellow
    }
    Write-Host ("    {0}" -f (LF "WillCopy" $payload.Names))
}

$confirmWord = L "CopyConfirmWord"
$confirmation = Read-Host (LF "ConfirmCopy" $confirmWord)
if ($confirmation.ToUpperInvariant() -notin @($confirmWord.ToUpperInvariant(), "COPIAR", "COPY")) {
    Write-Host (L "CancelNoCopy") -ForegroundColor Yellow
    Pause-Exit
    return
}

foreach ($target in $targets) {
    if ($target.NeedsSources) {
        New-Item -ItemType Directory -Path $target.SourcesDir -Force | Out-Null
    }

    foreach ($existing in @($target.ExistingFiles)) {
        Remove-Item -LiteralPath $existing.FullName -Force
    }

    Write-LabSection (LF "CopyingTo" $target.SourcesDir)
    foreach ($file in @($payload.Files)) {
        Write-Host ("  {0}" -f $file.Name)
        Copy-LabFileWithProgress -Source $file.FullName -Destination (Join-Path $target.SourcesDir $file.Name) -Activity (LF "CopyingTo" $target.SourcesDir) | Out-Null
    }
}

Write-Host ""
Write-LabOk (L "CopyDone")
Pause-Exit
