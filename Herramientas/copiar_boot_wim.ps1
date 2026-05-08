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
        NoBootPayload = "I cannot find boot.wim, boot.esd or boot*.swm inside {0}"
        ChooseBootSource = "Choose boot.* source:"
        SourceNotFound = "Source does not exist: {0}"
        SourceInsideImages = "The source must be inside {0}"
        SourceMustBeBoot = "The source must be named boot.wim, boot.esd or boot*.swm"
        SwmNeedsBoot = "To copy SWM, boot.swm must exist next to boot2.swm, etc."
        ReasonCd = "CD-ROM/not writable"
        ReasonNotUsb = "does not look like USB or Windows media"
        ReasonNoFs = "no file system"
        ReasonSpace = "not enough space"
        SourceTitle = "Source:"
        TypeLabel = "Type"
        FilesLabel = "Files"
        TotalSizeLabel = "Total size"
        ValidTargets = "Valid destinations:"
        SkippedTargets = "Skipped:"
        None = "None."
        NoValidTargets = "There is no valid destination for boot.* of {0}."
        DestPrompt = "Destinations: letters or numbers separated by comma ({0}A = all)"
        DefaultOne = "ENTER = {0}, "
        NoDestination = "No destination drive was specified."
        InvalidDestNumber = "Invalid destination number: {0}"
        InvalidDest = "Invalid destination: {0}"
        DriveNotListed = "Drive {0}: is not in the valid destination list."
        DriveNotValid = "Drive {0} is not a valid destination: {1}"
        CopyPlan = "Copy plan:"
        CreateSources = "sources folder will be created"
        ReplaceExisting = "will replace: {0}"
        WillCopy = "will copy: {0}"
        ConfirmCopy = "Type {0} to start"
        CancelNoCopy = "Cancelled. Nothing was copied."
        CopyingTo = "Copying boot.* to {0}..."
        CopyDone = "Copy completed."
        ColNum = "No"
        ColLetter = "Letter"
        ColLabel = "Label"
        ColFs = "FileSystem"
        ColType = "Type"
        ColFree = "Free"
        ColSources = "HasSources"
        ColExisting = "ExistingBoot"
        ColReason = "Reason"
    }
    es = @{
        CopyConfirmWord = "COPIAR"
        NoBootPayload = "No encuentro boot.wim, boot.esd ni boot*.swm dentro de {0}"
        ChooseBootSource = "Elige boot.* origen:"
        SourceNotFound = "No existe el origen: {0}"
        SourceInsideImages = "El origen debe estar dentro de {0}"
        SourceMustBeBoot = "El origen debe llamarse boot.wim, boot.esd o boot*.swm"
        SwmNeedsBoot = "Para copiar SWM debe existir boot.swm junto a boot2.swm, etc."
        ReasonCd = "CD-ROM/no escribible"
        ReasonNotUsb = "no parece USB ni medio Windows"
        ReasonNoFs = "sin sistema de archivos"
        ReasonSpace = "espacio insuficiente"
        SourceTitle = "Origen:"
        TypeLabel = "Tipo"
        FilesLabel = "Archivos"
        TotalSizeLabel = "Tamano total"
        ValidTargets = "Destinos validos:"
        SkippedTargets = "Omitidos:"
        None = "Ninguno."
        NoValidTargets = "No hay ningun destino valido para boot.* de {0}."
        DestPrompt = "Destinos: letras o numeros separados por coma ({0}A = todos)"
        DefaultOne = "ENTER = {0}, "
        NoDestination = "No se indico ninguna unidad destino."
        InvalidDestNumber = "Numero de destino no valido: {0}"
        InvalidDest = "Destino no valido: {0}"
        DriveNotListed = "La unidad {0}: no esta en la lista de destinos validos."
        DriveNotValid = "La unidad {0} no es destino valido: {1}"
        CopyPlan = "Plan de copia:"
        CreateSources = "se creara carpeta sources"
        ReplaceExisting = "se reemplazara: {0}"
        WillCopy = "se copiara: {0}"
        ConfirmCopy = "Escribe {0} para empezar"
        CancelNoCopy = "Cancelado. No he copiado nada."
        CopyingTo = "Copiando boot.* a {0}..."
        CopyDone = "Copia completada."
        ColNum = "Num"
        ColLetter = "Letra"
        ColLabel = "Etiqueta"
        ColFs = "Sistema"
        ColType = "Tipo"
        ColFree = "Libre"
        ColSources = "TieneSources"
        ColExisting = "BootExistente"
        ColReason = "Motivo"
    }
}
Add-LabTranslations @{
    fr = @{
        CopyConfirmWord = "COPIER"; NoBootPayload = "Je ne trouve pas boot.wim, boot.esd ni boot*.swm dans {0}"; ChooseBootSource = "Choisir la source boot.*:"; ValidTargets = "Destinations valides:"; SkippedTargets = "Ignorees:"; CopyPlan = "Plan de copie:"; ConfirmCopy = "Tapez {0} pour commencer"; CancelNoCopy = "Annule. Rien n'a ete copie."; CopyingTo = "Copie de boot.* vers {0}..."; CopyDone = "Copie terminee."; None = "Aucune."; DestPrompt = "Destinations: lettres ou numeros separes par virgule ({0}A = tout)"
    }
    ro = @{
        CopyConfirmWord = "COPIAZA"; NoBootPayload = "Nu gasesc boot.wim, boot.esd sau boot*.swm in {0}"; ChooseBootSource = "Alege sursa boot.*:"; ValidTargets = "Destinatii valide:"; SkippedTargets = "Omise:"; CopyPlan = "Plan de copiere:"; ConfirmCopy = "Tasteaza {0} pentru a incepe"; CancelNoCopy = "Anulat. Nu am copiat nimic."; CopyingTo = "Copiez boot.* in {0}..."; CopyDone = "Copiere finalizata."; None = "Niciuna."; DestPrompt = "Destinatii: litere sau numere separate prin virgula ({0}A = toate)"
    }
    de = @{
        CopyConfirmWord = "KOPIEREN"; NoBootPayload = "Ich finde boot.wim, boot.esd oder boot*.swm nicht in {0}"; ChooseBootSource = "boot.* Quelle waehlen:"; ValidTargets = "Gueltige Ziele:"; SkippedTargets = "Uebersprungen:"; CopyPlan = "Kopierplan:"; ConfirmCopy = "Tippen Sie {0} zum Start"; CancelNoCopy = "Abgebrochen. Es wurde nichts kopiert."; CopyingTo = "Kopiere boot.* nach {0}..."; CopyDone = "Kopie abgeschlossen."; None = "Keine."; DestPrompt = "Ziele: Buchstaben oder Nummern durch Komma getrennt ({0}A = alle)"
    }
}
Add-LabTranslations @{
    fr = @{
        SourceNotFound = "La source n'existe pas: {0}"
        SourceInsideImages = "La source doit etre dans {0}"
        SourceMustBeBoot = "La source doit s'appeler boot.wim, boot.esd ou boot*.swm"
        SwmNeedsBoot = "Pour copier SWM, boot.swm doit etre avec boot2.swm, etc."
        ReasonCd = "CD-ROM/non inscriptible"
        ReasonNotUsb = "ne ressemble pas a USB ni media Windows"
        ReasonNoFs = "pas de systeme de fichiers"
        ReasonSpace = "espace insuffisant"
        SourceTitle = "Source:"
        TypeLabel = "Type"
        FilesLabel = "Fichiers"
        TotalSizeLabel = "Taille totale"
        NoValidTargets = "Aucune destination valide pour boot.* de {0}."
        DefaultOne = "ENTREE = {0}, "
        NoDestination = "Aucune unite destination indiquee."
        InvalidDestNumber = "Numero de destination invalide: {0}"
        InvalidDest = "Destination invalide: {0}"
        DriveNotListed = "L'unite {0}: n'est pas dans la liste des destinations valides."
        DriveNotValid = "L'unite {0} n'est pas une destination valide: {1}"
        CreateSources = "le dossier sources sera cree"
        ReplaceExisting = "sera remplace: {0}"
        WillCopy = "sera copie: {0}"
        ColNum = "No"
        ColLetter = "Lettre"
        ColLabel = "Etiquette"
        ColFs = "Systeme"
        ColType = "Type"
        ColFree = "Libre"
        ColSources = "Sources"
        ColExisting = "BootExistant"
        ColReason = "Raison"
    }
    ro = @{
        SourceNotFound = "Sursa nu exista: {0}"
        SourceInsideImages = "Sursa trebuie sa fie in {0}"
        SourceMustBeBoot = "Sursa trebuie sa se numeasca boot.wim, boot.esd sau boot*.swm"
        SwmNeedsBoot = "Pentru copiere SWM trebuie sa existe boot.swm langa boot2.swm, etc."
        ReasonCd = "CD-ROM/nu se poate scrie"
        ReasonNotUsb = "nu pare USB sau mediu Windows"
        ReasonNoFs = "fara sistem de fisiere"
        ReasonSpace = "spatiu insuficient"
        SourceTitle = "Sursa:"
        TypeLabel = "Tip"
        FilesLabel = "Fisiere"
        TotalSizeLabel = "Dimensiune totala"
        NoValidTargets = "Nu exista destinatie valida pentru boot.* de {0}."
        DefaultOne = "ENTER = {0}, "
        NoDestination = "Nu s-a indicat nicio unitate destinatie."
        InvalidDestNumber = "Numar destinatie invalid: {0}"
        InvalidDest = "Destinatie invalida: {0}"
        DriveNotListed = "Unitatea {0}: nu este in lista destinatiilor valide."
        DriveNotValid = "Unitatea {0} nu este destinatie valida: {1}"
        CreateSources = "folderul sources va fi creat"
        ReplaceExisting = "se va inlocui: {0}"
        WillCopy = "se va copia: {0}"
        ColNum = "Nr"
        ColLetter = "Litera"
        ColLabel = "Eticheta"
        ColFs = "Sistem"
        ColType = "Tip"
        ColFree = "Liber"
        ColSources = "AreSources"
        ColExisting = "BootExistent"
        ColReason = "Motiv"
    }
    de = @{
        SourceNotFound = "Quelle existiert nicht: {0}"
        SourceInsideImages = "Die Quelle muss in {0} liegen"
        SourceMustBeBoot = "Die Quelle muss boot.wim, boot.esd oder boot*.swm heissen"
        SwmNeedsBoot = "Zum Kopieren von SWM muss boot.swm neben boot2.swm usw. liegen."
        ReasonCd = "CD-ROM/nicht beschreibbar"
        ReasonNotUsb = "sieht nicht wie USB oder Windows-Medium aus"
        ReasonNoFs = "kein Dateisystem"
        ReasonSpace = "nicht genug Speicherplatz"
        SourceTitle = "Quelle:"
        TypeLabel = "Typ"
        FilesLabel = "Dateien"
        TotalSizeLabel = "Gesamtgroesse"
        NoValidTargets = "Kein gueltiges Ziel fuer boot.* mit {0}."
        DefaultOne = "ENTER = {0}, "
        NoDestination = "Kein Ziellaufwerk angegeben."
        InvalidDestNumber = "Ungueltige Zielnummer: {0}"
        InvalidDest = "Ungueltiges Ziel: {0}"
        DriveNotListed = "Laufwerk {0}: ist nicht in der Liste gueltiger Ziele."
        DriveNotValid = "Laufwerk {0} ist kein gueltiges Ziel: {1}"
        CreateSources = "Ordner sources wird erstellt"
        ReplaceExisting = "wird ersetzt: {0}"
        WillCopy = "wird kopiert: {0}"
        ColNum = "Nr"
        ColLetter = "Buchstabe"
        ColLabel = "Label"
        ColFs = "Dateisystem"
        ColType = "Typ"
        ColFree = "Frei"
        ColSources = "HatSources"
        ColExisting = "VorhandenesBoot"
        ColReason = "Grund"
    }
}

function Pause-Exit {
    Write-Host ""
    Read-Host (L "PressEnterContinue") | Out-Null
}

function Format-Bytes {
    param([UInt64]$Bytes)
    if ($Bytes -ge 1TB) { return "{0:N2} TB" -f ($Bytes / 1TB) }
    if ($Bytes -ge 1GB) { return "{0:N2} GB" -f ($Bytes / 1GB) }
    if ($Bytes -ge 1MB) { return "{0:N2} MB" -f ($Bytes / 1MB) }
    return "$Bytes bytes"
}

function Test-InsidePath {
    param([string]$Path, [string]$Root)
    $resolvedPath = (Resolve-Path -LiteralPath $Path).Path
    $resolvedRoot = (Resolve-Path -LiteralPath $Root).Path.TrimEnd("\")
    return ($resolvedPath -eq $resolvedRoot -or $resolvedPath.StartsWith($resolvedRoot + "\", [System.StringComparison]::OrdinalIgnoreCase))
}

function Convert-DriveTypeName {
    param($DriveType)
    switch ([string]$DriveType) {
        "2" { "Removable"; break }
        "3" { "Fixed"; break }
        "5" { "CD-ROM"; break }
        default { [string]$DriveType }
    }
}

function Get-LabVolumeInfo {
    try {
        return @(Get-Volume -ErrorAction Stop | Where-Object DriveLetter | ForEach-Object {
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
        return @(Get-CimInstance -ClassName Win32_LogicalDisk -ErrorAction Stop | Where-Object DeviceID | ForEach-Object {
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
        if ($null -ne $file -and $null -ne $file.Length) { $total += [UInt64]$file.Length }
    }
    return $total
}

function New-BootPayload {
    param([string]$Type, [object[]]$Files)
    $fileArray = @($Files | Sort-Object Name)
    [pscustomobject]@{
        Type = $Type
        Files = $fileArray
        TotalSize = Get-FileTotalSize -Files $fileArray
        Names = (($fileArray | ForEach-Object Name) -join ", ")
    }
}

function Get-BootPayloadCandidates {
    if (-not (Test-Path -LiteralPath $ImagesRoot -PathType Container)) { return @() }
    $payloads = New-Object System.Collections.Generic.List[object]
    $wim = Get-Item -LiteralPath (Join-Path $ImagesRoot "boot.wim") -ErrorAction SilentlyContinue
    if ($wim) { $payloads.Add((New-BootPayload -Type "WIM" -Files @($wim))) }
    $esd = Get-Item -LiteralPath (Join-Path $ImagesRoot "boot.esd") -ErrorAction SilentlyContinue
    if ($esd) { $payloads.Add((New-BootPayload -Type "ESD" -Files @($esd))) }
    $swmFiles = @(Get-ChildItem -LiteralPath $ImagesRoot -File -Filter "boot*.swm" -ErrorAction SilentlyContinue | Sort-Object Name)
    if ($swmFiles.Count -gt 0) {
        if (-not ($swmFiles | Where-Object { $_.Name -ieq "boot.swm" })) { throw (L "SwmNeedsBoot") }
        $payloads.Add((New-BootPayload -Type "SWM" -Files $swmFiles))
    }
    return @($payloads.ToArray())
}

function Resolve-SourcePayload {
    param([string]$SourcePath)
    if ([string]::IsNullOrWhiteSpace($SourcePath)) {
        $payloads = @(Get-BootPayloadCandidates)
        if ($payloads.Count -eq 0) { throw (LF "NoBootPayload" $ImagesRoot) }
        if ($payloads.Count -eq 1) { return $payloads[0] }
        Write-LabSection (L "ChooseBootSource")
        for ($i = 0; $i -lt $payloads.Count; $i++) {
            Write-Host ("{0,2}. {1}  [{2}]  {3}" -f ($i + 1), $payloads[$i].Type, (Format-Bytes -Bytes $payloads[$i].TotalSize), $payloads[$i].Names)
        }
        do {
            $answer = Read-Host (L "Number")
            $number = 0
        } until ([int]::TryParse($answer, [ref]$number) -and $number -ge 1 -and $number -le $payloads.Count)
        return $payloads[$number - 1]
    }

    $SourcePath = $SourcePath.Trim('"')
    if (-not (Test-Path -LiteralPath $SourcePath -PathType Leaf)) { throw (LF "SourceNotFound" $SourcePath) }
    if (-not (Test-InsidePath -Path $SourcePath -Root $ImagesRoot)) { throw (LF "SourceInsideImages" $ImagesRoot) }
    $item = Get-Item -LiteralPath $SourcePath
    switch -Regex ($item.Name.ToLowerInvariant()) {
        "^boot\.wim$" { return New-BootPayload -Type "WIM" -Files @($item) }
        "^boot\.esd$" { return New-BootPayload -Type "ESD" -Files @($item) }
        "^boot\d*\.swm$" {
            $swmFiles = @(Get-ChildItem -LiteralPath $item.DirectoryName -File -Filter "boot*.swm" | Sort-Object Name)
            if (-not ($swmFiles | Where-Object { $_.Name -ieq "boot.swm" })) { throw (L "SwmNeedsBoot") }
            return New-BootPayload -Type "SWM" -Files $swmFiles
        }
        default { throw (L "SourceMustBeBoot") }
    }
}

function Get-ExistingBootFiles {
    param([string]$SourcesDir)
    if (-not (Test-Path -LiteralPath $SourcesDir -PathType Container)) { return @() }
    return @(Get-ChildItem -LiteralPath $SourcesDir -File -ErrorAction SilentlyContinue |
        Where-Object { $_.Name -match "^boot(\d*)\.(wim|esd|swm)$" } |
        Sort-Object Name)
}

function Get-TargetCheck {
    param([object]$Volume, [UInt64]$SourceSize)
    $root = "$($Volume.DriveLetter):\"
    $sourcesDir = Join-Path $root "sources"
    $hasSources = Test-Path -LiteralPath $sourcesDir
    $existingFiles = @(Get-ExistingBootFiles -SourcesDir $sourcesDir)
    $usableFree = [UInt64]($Volume.SizeRemaining + (Get-FileTotalSize -Files $existingFiles))
    $reason = $null
    if ($Volume.DriveType -eq "CD-ROM") { $reason = L "ReasonCd" }
    elseif (-not ($Volume.DriveType -eq "Removable" -or $hasSources)) { $reason = L "ReasonNotUsb" }
    elseif ([string]::IsNullOrWhiteSpace([string]$Volume.FileSystem)) { $reason = L "ReasonNoFs" }
    elseif ($usableFree -lt $SourceSize) { $reason = L "ReasonSpace" }
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
        $check = Get-TargetCheck -Volume $volume -SourceSize $SourceSize
        if (-not ($volume.DriveType -eq "Removable" -or $check.HasSources -or $volume.DriveType -eq "CD-ROM")) { continue }
        [pscustomobject]@{
            Num = $index
            Letra = $volume.DriveLetter
            Etiqueta = $volume.FileSystemLabel
            Sistema = $volume.FileSystem
            Tipo = $volume.DriveType
            Libre = Format-Bytes -Bytes ([UInt64]$volume.SizeRemaining)
            TieneSources = $check.HasSources
            BootExistente = if (@($check.ExistingFiles).Count -gt 0) { ((@($check.ExistingFiles) | ForEach-Object Name) -join ", ") } else { "" }
            Valido = $check.IsValid
            Motivo = if ($check.IsValid) { "" } else { $check.Reason }
        }
        $index++
    }
}

function Resolve-DestinationSelection {
    param([object[]]$ValidRows, [string[]]$Requested)
    if ($Requested -and $Requested.Count -gt 0) { $raw = ($Requested -join ",") }
    else {
        $defaultText = if ($ValidRows.Count -eq 1) { LF "DefaultOne" $ValidRows[0].Letra } else { "" }
        $raw = Read-Host (LF "DestPrompt" $defaultText)
        if ([string]::IsNullOrWhiteSpace($raw) -and $ValidRows.Count -eq 1) { $raw = $ValidRows[0].Letra }
    }
    if ([string]::IsNullOrWhiteSpace($raw)) { throw (L "NoDestination") }
    $selected = New-Object System.Collections.Generic.List[string]
    foreach ($part in ($raw -split "[,; ]+")) {
        $token = $part.Trim().TrimEnd(":").ToUpperInvariant()
        if ([string]::IsNullOrWhiteSpace($token)) { continue }
        if ($token -in @("A", "ALL", "TODOS", "TOUT", "TOUS", "TOATE", "ALLE")) {
            foreach ($row in $ValidRows) { if (-not $selected.Contains($row.Letra)) { $selected.Add($row.Letra) } }
            continue
        }
        $number = 0
        if ([int]::TryParse($token, [ref]$number)) {
            $row = $ValidRows | Where-Object Num -eq $number | Select-Object -First 1
            if (-not $row) { throw (LF "InvalidDestNumber" $token) }
            if (-not $selected.Contains($row.Letra)) { $selected.Add($row.Letra) }
            continue
        }
        if ($token -notmatch "^[A-Z]$") { throw (LF "InvalidDest" $part) }
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
if ($validRows.Count -eq 0) { Write-Host ("  {0}" -f (L "None")) -ForegroundColor Yellow }
else {
    $validRows |
        Select-Object @{Name = (L "ColNum"); Expression = { $_.Num } },
                      @{Name = (L "ColLetter"); Expression = { $_.Letra } },
                      @{Name = (L "ColLabel"); Expression = { $_.Etiqueta } },
                      @{Name = (L "ColFs"); Expression = { $_.Sistema } },
                      @{Name = (L "ColType"); Expression = { $_.Tipo } },
                      @{Name = (L "ColFree"); Expression = { $_.Libre } },
                      @{Name = (L "ColSources"); Expression = { $_.TieneSources } },
                      @{Name = (L "ColExisting"); Expression = { $_.BootExistente } } |
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

if ($validRows.Count -eq 0) { throw (LF "NoValidTargets" (Format-Bytes -Bytes $payload.TotalSize)) }

$letters = @(Resolve-DestinationSelection -ValidRows $validRows -Requested $DestinationLetters)
$volumeByLetter = @{}
foreach ($volume in @(Get-LabVolumeInfo)) { $volumeByLetter[$volume.DriveLetter] = $volume }

$targets = foreach ($letter in $letters) {
    $volume = $volumeByLetter[$letter]
    $root = "$letter`:\"
    $sourcesDir = Join-Path $root "sources"
    $check = Get-TargetCheck -Volume $volume -SourceSize $payload.TotalSize
    if (-not $check.IsValid) { throw (LF "DriveNotValid" $root $check.Reason) }
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
    if ($target.NeedsSources) { Write-Host ("    {0}" -f (L "CreateSources")) -ForegroundColor Yellow }
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
    if ($target.NeedsSources) { New-Item -ItemType Directory -Path $target.SourcesDir -Force | Out-Null }
    foreach ($existing in @($target.ExistingFiles)) { Remove-Item -LiteralPath $existing.FullName -Force }
    Write-LabSection (LF "CopyingTo" $target.SourcesDir)
    foreach ($file in @($payload.Files)) {
        Write-Host ("  {0}" -f $file.Name)
        Copy-LabFileWithProgress -Source $file.FullName -Destination (Join-Path $target.SourcesDir $file.Name) -Activity (LF "CopyingTo" $target.SourcesDir) | Out-Null
    }
}

Write-Host ""
Write-LabOk (L "CopyDone")
Pause-Exit
