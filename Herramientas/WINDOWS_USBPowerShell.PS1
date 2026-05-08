#Requires -RunAsAdministrator
[CmdletBinding()]
param(
    [string]$MediaPath,
    [Nullable[int]]$DiskNumber,
    [int]$BootSizeMB = 2048,
    [string]$BootLabel = "WIN11BOOT",
    [string]$InstallLabel = "WIN11EXFAT",
    [ValidateSet("exFAT", "NTFS")]
    [string]$InstallFileSystem = "exFAT",
    [switch]$CreatePartitionsOnly,
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
$IsoRoot = Join-Path $WorkRoot "ISOs"
$ImagesRoot = Join-Path $WorkRoot "images"
$LogsRoot = Join-Path $WorkRoot "Logs"
$MountedIsoPath = $null
$LogPath = Join-Path $LogsRoot ("Crear-USB-Win11-{0}.log" -f (Get-Date -Format "yyyyMMdd-HHmmss"))
foreach ($root in @($IsoRoot, $ImagesRoot, $LogsRoot)) {
    if (-not (Test-Path -LiteralPath $root)) {
        New-Item -ItemType Directory -Path $root -Force | Out-Null
    }
}

Add-LabTranslations @{
    en = @{
        LogStartUsb = "Start Create Win11 USB"
        MountedMediaText = "Use already mounted ISO/media {0}  [{1}, {2}]"
        LabIsoText = "Mount lab ISO {0}  [{1}]"
        NoLabel = "no label"
        InstallMediaAvailable = "Available installation media:"
        ManualMediaOption = "Type a mounted drive letter or a lab ISO manually"
        MountedIsoHint = "If the ISO is already mounted, choose the mounted drive option."
        MediaPrompt = "Number, mounted drive letter (example I:) or ISO path"
        MediaPromptFallback = "Mounted drive letter or ISO inside {0}, example I: or E:\Lab_Win11\Trabajo\ISOs\Win11.iso"
        MissingBootWim = "Media {0} does not look like Windows setup media. sources\boot.wim is missing."
        MissingInstallImage = "Media {0} does not contain sources\install.wim, sources\install.esd or sources\install.swm."
        MediaNotFound = "Selected media does not exist: {0}"
        MediaMustIso = "The media must be an ISO or an already mounted drive letter."
        IsoMustBeInside = "The ISO must be inside {0}. Copy it there first to keep the lab clean."
        MountingIso = "Mounting ISO..."
        CannotGetIsoLetter = "I could not get the mounted ISO drive letter."
        BootOtherWarning = "Warning: for boot I use exact boot.wim; other boot.* files in images will not be used."
        SourceMountedIso = "Mounted ISO"
        SourceLabImages = "Trabajo\images"
        BootSelectionTitle = "Available boot.wim sources:"
        BootSelectionPrompt = "Boot option (ENTER = {0})"
        BootSelectionInvalid = "Invalid boot option."
        BootCopiesAs = "copies as sources\boot.wim"
        SwmMissing = "SWM exists in {0}, but install.swm is missing. Files must be install.swm, install2.swm, etc."
        MultipleInstallTypes = "There is more than one install.* type in {0} ({1}). Leave only WIM, only ESD or only SWM."
        NoInstallPayload = "I cannot find install.wim, install.esd or install*.swm in {0} or {1}."
        DiskReadFailed = "I could not read the disk list."
        DisksAvailable = "Available disks:"
        DiskNumberPrompt = "USB disk number that WILL BE ERASED"
        InvalidDiskNumber = "Invalid disk number."
        RefuseSystemDisk = "Disk {0} is boot/system. I will not touch it."
        NoPartitionsVisible = "  No visible partitions."
        NotExternalWarn1 = "WARNING: this disk does not appear as USB/SD/MMC."
        NotExternalWarn2 = "Windows shows BusType: {0}"
        NotExternalWarn3 = "If it is a USB enclosure or adapter this may be normal. If unsure, cancel."
        UnderstandDisk = "I UNDERSTAND DISK {0}"
        TypeExactToContinue = "Type exactly '{0}' to continue with this disk"
        CancelNotUsb = "Cancelled because the disk did not look like USB."
        RunningDiskPart = "Running DiskPart: {0}"
        DiskPartFailed = "DiskPart failed. Review {0}"
        CleaningDisk = "Cleaning disk {0}..."
        StateAfterClean = "State after clean: {0}"
        InitGpt = "Initializing disk {0} as GPT for UEFI..."
        ConvertGpt = "Converting disk {0} from MBR to GPT for UEFI..."
        AlreadyGpt = "Disk {0} is already GPT after clean; continuing."
        UnexpectedStyle = "Unexpected partition style after clean: {0}"
        NotGpt = "Disk {0} did not end as GPT. Current state: {1}"
        StillPartitions = "Disk {0} still has partitions after cleaning/initializing. I will not continue."
        SelectedDisk = "SELECTED DISK:"
        CurrentPartitions = "Current partitions:"
        ErasePhrase = "ERASE DISK {0}"
        DeleteWarning = "This will remove all partitions from disk {0}."
        ErasePrompt = "Type exactly '{0}' to continue"
        CancelBadConfirm = "Cancelled because confirmation was incorrect."
        RobocopyFailed = "Robocopy failed with exit code {0}."
        CopyBootSkeleton = "Copying FAT32 boot files without full sources..."
        CopyBootWimToFat32 = "Copying selected boot.wim to FAT32 sources..."
        BootCopyMissing = "boot.wim was not copied to {0}."
        BootCopySizeMismatch = "boot.wim copy size mismatch. Source: {0}. Destination: {1}."
        BootCopyDone = "boot.wim copied to FAT32: {0} [{1}]"
        CopyInstallFrom = "Copying install.* from {0} to {1}..."
        InstallCopyMissing = "{0} was not copied to {1}."
        InstallCopySizeMismatch = "{0} copy size mismatch. Source: {1}. Destination: {2}."
        InstallCopyDone = "{0} copied to {1}: {2} [{3}]"
        InstallMedia = "Installation media: {0}"
        BootLine = "Boot.wim: {0} ({1})"
        InstallLine = "Install.*: {0} ({1}: {2})"
        PreparingDisk = "Preparing disk..."
        CreatingBootPartition = "Creating FAT32 boot partition ({0} MB)..."
        CreatingInstallPartition = "Creating {0} Basic Data installer partition..."
        CannotGetLetters = "I could not get the drive letters assigned to the created partitions."
        PartitionsCreated = "Partitions created:"
        Fat32BootLine = "  FAT32: {0}"
        InstallPartitionLine = "  {0}: {1}"
        CopyIsoSkeleton = "Copying ISO skeleton to {0} without boot.wim/install.*..."
        UsbReady = "Windows 11 USB prepared."
        UsbCopySummary = "Image copy completed:"
        UsbBootWimCopied = "  boot.wim -> FAT32: {0} [{1}]"
        UsbInstallCopied = "  {0} -> {1}: {2} [{3}]"
        UsbPartitionsSummary = "Partitions:"
        UsbBootLine = "  FAT32 boot: {0}"
        UsbInstallLine = "  {0} installer: {1}"
        DismountingIso = "Unmounting ISO..."
        DiskColNumber = "Number"
        DiskColName = "Name"
        DiskColSize = "Size"
        DiskColStyle = "Style"
        DiskColBoot = "Boot"
        DiskColSystem = "System"
        DiskColReadOnly = "ReadOnly"
        DiskColState = "State"
        PartColNumber = "Partition"
        PartColLetter = "Letter"
        PartColSize = "Size"
        PartColLabel = "Label"
        PartColFs = "FileSystem"
    }
    es = @{
        LogStartUsb = "Inicio Crear USB Win11"
        MountedMediaText = "Usar ISO/medio ya montado {0}  [{1}, {2}]"
        LabIsoText = "Montar ISO del lab {0}  [{1}]"
        NoLabel = "sin etiqueta"
        InstallMediaAvailable = "Medio de instalacion disponible:"
        ManualMediaOption = "Escribir manualmente una letra montada o una ISO del lab"
        MountedIsoHint = "Si ya tenias la ISO montada, elige la opcion de unidad ya montada."
        MediaPrompt = "Numero, letra montada (ej. I:) o ruta ISO"
        MediaPromptFallback = "Letra ya montada o ISO dentro de {0}, ejemplo I: o E:\Lab_Win11\Trabajo\ISOs\Win11.iso"
        MissingBootWim = "El medio {0} no parece instalador Windows. Falta sources\boot.wim."
        MissingInstallImage = "El medio {0} no tiene sources\install.wim, sources\install.esd ni sources\install.swm."
        MediaNotFound = "No existe el medio indicado: {0}"
        MediaMustIso = "El medio debe ser una ISO o una letra ya montada."
        IsoMustBeInside = "La ISO debe estar dentro de {0}. Copiala ahi primero para mantener limpio el lab."
        MountingIso = "Montando ISO..."
        CannotGetIsoLetter = "No pude obtener la letra de la ISO montada."
        BootOtherWarning = "Aviso: para arrancar uso boot.wim exacto; no usare otros boot.* de images."
        SourceMountedIso = "ISO montada"
        SourceLabImages = "Trabajo\images"
        BootSelectionTitle = "Origenes boot.wim disponibles:"
        BootSelectionPrompt = "Opcion boot (ENTER = {0})"
        BootSelectionInvalid = "Opcion boot no valida."
        BootCopiesAs = "se copia como sources\boot.wim"
        SwmMissing = "Hay SWM en {0}, pero falta install.swm. Deben estar install.swm, install2.swm, etc."
        MultipleInstallTypes = "Hay mas de un tipo de install.* en {0} ({1}). Deja solo WIM, solo ESD o solo SWM."
        NoInstallPayload = "No encuentro install.wim, install.esd ni install*.swm en {0} ni en {1}."
        DiskReadFailed = "No pude leer la lista de discos."
        DisksAvailable = "Discos disponibles:"
        DiskNumberPrompt = "Numero del USB que se va a BORRAR"
        InvalidDiskNumber = "Numero de disco no valido."
        RefuseSystemDisk = "El disco {0} es de arranque/sistema. No lo voy a tocar."
        NoPartitionsVisible = "  Sin particiones visibles."
        NotExternalWarn1 = "AVISO: este disco no aparece como USB/SD/MMC."
        NotExternalWarn2 = "Windows lo muestra como BusType: {0}"
        NotExternalWarn3 = "Si es una caja USB o adaptador, puede ser normal. Si no estas seguro, cancela."
        UnderstandDisk = "ENTIENDO DISCO {0}"
        TypeExactToContinue = "Escribe exactamente '{0}' para seguir con este disco"
        CancelNotUsb = "Cancelado porque el disco no parecia USB."
        RunningDiskPart = "Ejecutando DiskPart: {0}"
        DiskPartFailed = "DiskPart fallo. Revisa {0}"
        CleaningDisk = "Limpiando disco {0}..."
        StateAfterClean = "Estado tras clean: {0}"
        InitGpt = "Inicializando disco {0} como GPT para UEFI..."
        ConvertGpt = "Convirtiendo disco {0} de MBR a GPT para UEFI..."
        AlreadyGpt = "El disco {0} ya esta GPT despues de clean; continuo."
        UnexpectedStyle = "Estado de particion inesperado despues de clean: {0}"
        NotGpt = "El disco {0} no quedo como GPT. Estado actual: {1}"
        StillPartitions = "El disco {0} todavia tiene particiones despues de limpiar/inicializar. No continuo."
        SelectedDisk = "DISCO SELECCIONADO:"
        CurrentPartitions = "Particiones actuales:"
        ErasePhrase = "BORRAR DISCO {0}"
        DeleteWarning = "Esto eliminara todas las particiones del disco {0}."
        ErasePrompt = "Escribe exactamente '{0}' para continuar"
        CancelBadConfirm = "Cancelado por confirmacion incorrecta."
        RobocopyFailed = "Robocopy fallo con codigo {0}."
        CopyBootSkeleton = "Copiando arranque FAT32 sin sources completo..."
        CopyBootWimToFat32 = "Copiando el boot.wim elegido a sources de FAT32..."
        BootCopyMissing = "No se copio boot.wim en {0}."
        BootCopySizeMismatch = "El tamano de boot.wim no coincide. Origen: {0}. Destino: {1}."
        BootCopyDone = "boot.wim copiado a FAT32: {0} [{1}]"
        CopyInstallFrom = "Copiando install.* desde {0} a {1}..."
        InstallCopyMissing = "No se copio {0} en {1}."
        InstallCopySizeMismatch = "El tamano de {0} no coincide. Origen: {1}. Destino: {2}."
        InstallCopyDone = "{0} copiado a {1}: {2} [{3}]"
        InstallMedia = "Medio de instalacion: {0}"
        BootLine = "Boot.wim: {0} ({1})"
        InstallLine = "Install.*: {0} ({1}: {2})"
        PreparingDisk = "Preparando disco..."
        CreatingBootPartition = "Creando particion FAT32 de arranque ({0} MB)..."
        CreatingInstallPartition = "Creando particion {0} Basic Data para instalador..."
        CannotGetLetters = "No pude obtener las letras asignadas a las particiones creadas."
        PartitionsCreated = "Particiones creadas:"
        Fat32BootLine = "  FAT32: {0}"
        InstallPartitionLine = "  {0}: {1}"
        CopyIsoSkeleton = "Copiando esqueleto de la ISO al {0} sin boot.wim/install.*..."
        UsbReady = "USB Windows 11 preparado."
        UsbCopySummary = "Copia de imagenes finalizada:"
        UsbBootWimCopied = "  boot.wim -> FAT32: {0} [{1}]"
        UsbInstallCopied = "  {0} -> {1}: {2} [{3}]"
        UsbPartitionsSummary = "Particiones:"
        UsbBootLine = "  FAT32 arranque: {0}"
        UsbInstallLine = "  {0} instalador: {1}"
        DismountingIso = "Desmontando ISO..."
        DiskColNumber = "Numero"
        DiskColName = "Nombre"
        DiskColSize = "Tamano"
        DiskColStyle = "Estilo"
        DiskColBoot = "Arranque"
        DiskColSystem = "Sistema"
        DiskColReadOnly = "SoloLectura"
        DiskColState = "Estado"
        PartColNumber = "Particion"
        PartColLetter = "Letra"
        PartColSize = "Tamano"
        PartColLabel = "Etiqueta"
        PartColFs = "Sistema"
    }
}
Add-LabTranslations @{
    fr = @{
        LogStartUsb = "Debut creation USB Win11"
        MountedMediaText = "Utiliser ISO/media deja monte {0}  [{1}, {2}]"
        LabIsoText = "Monter l'ISO du lab {0}  [{1}]"
        NoLabel = "sans etiquette"
        InstallMediaAvailable = "Media d'installation disponible:"
        ManualMediaOption = "Taper manuellement une lettre montee ou une ISO du lab"
        MountedIsoHint = "Si l'ISO est deja montee, choisissez l'option de lecteur monte."
        MediaPrompt = "Numero, lettre montee (ex. I:) ou chemin ISO"
        MediaPromptFallback = "Lettre deja montee ou ISO dans {0}, exemple I: ou E:\Lab_Win11\Trabajo\ISOs\Win11.iso"
        MissingBootWim = "Le media {0} ne ressemble pas a un installateur Windows. sources\boot.wim manque."
        MissingInstallImage = "Le media {0} ne contient pas sources\install.wim, sources\install.esd ni sources\install.swm."
        MediaNotFound = "Le media indique n'existe pas: {0}"
        MediaMustIso = "Le media doit etre une ISO ou une lettre deja montee."
        IsoMustBeInside = "L'ISO doit etre dans {0}. Copiez-la la d'abord pour garder le lab propre."
        MountingIso = "Montage de l'ISO..."
        CannotGetIsoLetter = "Impossible d'obtenir la lettre de l'ISO montee."
        BootOtherWarning = "Avis: pour demarrer j'utilise boot.wim exact; les autres boot.* de images ne seront pas utilises."
        SourceMountedIso = "ISO montee"
        SourceLabImages = "Trabajo\images"
        BootSelectionTitle = "Sources boot.wim disponibles:"
        BootSelectionPrompt = "Option boot (ENTREE = {0})"
        BootSelectionInvalid = "Option boot invalide."
        BootCopiesAs = "copie comme sources\boot.wim"
        SwmMissing = "Il y a du SWM dans {0}, mais install.swm manque. Les fichiers doivent etre install.swm, install2.swm, etc."
        MultipleInstallTypes = "Il y a plusieurs types install.* dans {0} ({1}). Laissez seulement WIM, seulement ESD ou seulement SWM."
        NoInstallPayload = "Je ne trouve pas install.wim, install.esd ni install*.swm dans {0} ni dans {1}."
        DiskReadFailed = "Impossible de lire la liste des disques."
        DisksAvailable = "Disques disponibles:"
        DiskNumberPrompt = "Numero de la cle USB qui SERA EFFACEE"
        InvalidDiskNumber = "Numero de disque invalide."
        RefuseSystemDisk = "Le disque {0} est de demarrage/systeme. Je ne le toucherai pas."
        NoPartitionsVisible = "  Aucune partition visible."
        NotExternalWarn1 = "AVIS: ce disque n'apparait pas comme USB/SD/MMC."
        NotExternalWarn2 = "Windows affiche BusType: {0}"
        NotExternalWarn3 = "Si c'est un boitier USB ou adaptateur, cela peut etre normal. Si vous doutez, annulez."
        UnderstandDisk = "JE COMPRENDS DISQUE {0}"
        TypeExactToContinue = "Tapez exactement '{0}' pour continuer avec ce disque"
        CancelNotUsb = "Annule car le disque ne semblait pas USB."
        RunningDiskPart = "Execution de DiskPart: {0}"
        DiskPartFailed = "DiskPart a echoue. Revoyez {0}"
        CleaningDisk = "Nettoyage du disque {0}..."
        StateAfterClean = "Etat apres clean: {0}"
        InitGpt = "Initialisation du disque {0} en GPT pour UEFI..."
        ConvertGpt = "Conversion du disque {0} de MBR vers GPT pour UEFI..."
        AlreadyGpt = "Le disque {0} est deja GPT apres clean; je continue."
        UnexpectedStyle = "Style de partition inattendu apres clean: {0}"
        NotGpt = "Le disque {0} n'est pas reste en GPT. Etat actuel: {1}"
        StillPartitions = "Le disque {0} a encore des partitions apres nettoyage/initialisation. Je ne continue pas."
        SelectedDisk = "DISQUE SELECTIONNE:"
        CurrentPartitions = "Partitions actuelles:"
        ErasePhrase = "EFFACER DISQUE {0}"
        DeleteWarning = "Cela supprimera toutes les partitions du disque {0}."
        ErasePrompt = "Tapez exactement '{0}' pour continuer"
        CancelBadConfirm = "Annule car la confirmation etait incorrecte."
        RobocopyFailed = "Robocopy a echoue avec le code {0}."
        CopyBootSkeleton = "Copie du demarrage FAT32 sans sources complet..."
        CopyBootWimToFat32 = "Copie du boot.wim choisi vers sources FAT32..."
        BootCopyMissing = "boot.wim n'a pas ete copie vers {0}."
        BootCopySizeMismatch = "La taille de boot.wim ne correspond pas. Source: {0}. Destination: {1}."
        BootCopyDone = "boot.wim copie vers FAT32: {0} [{1}]"
        CopyInstallFrom = "Copie de install.* depuis {0} vers {1}..."
        InstallCopyMissing = "{0} n'a pas ete copie vers {1}."
        InstallCopySizeMismatch = "La taille de {0} ne correspond pas. Source: {1}. Destination: {2}."
        InstallCopyDone = "{0} copie vers {1}: {2} [{3}]"
        InstallMedia = "Media d'installation: {0}"
        BootLine = "Boot.wim: {0} ({1})"
        InstallLine = "Install.*: {0} ({1}: {2})"
        PreparingDisk = "Preparation du disque..."
        CreatingBootPartition = "Creation de la partition FAT32 de demarrage ({0} MB)..."
        CreatingInstallPartition = "Creation de la partition installateur {0} Basic Data..."
        CannotGetLetters = "Impossible d'obtenir les lettres assignees aux partitions creees."
        PartitionsCreated = "Partitions creees:"
        Fat32BootLine = "  FAT32: {0}"
        InstallPartitionLine = "  {0}: {1}"
        CopyIsoSkeleton = "Copie du squelette ISO vers {0} sans boot.wim/install.*..."
        UsbReady = "USB Windows 11 prepare."
        UsbCopySummary = "Copie des images terminee:"
        UsbBootWimCopied = "  boot.wim -> FAT32: {0} [{1}]"
        UsbInstallCopied = "  {0} -> {1}: {2} [{3}]"
        UsbPartitionsSummary = "Partitions:"
        UsbBootLine = "  Demarrage FAT32: {0}"
        UsbInstallLine = "  Installateur {0}: {1}"
        DismountingIso = "Demontage de l'ISO..."
        PressEnterExit = "Appuyez sur ENTREE pour quitter"
        DiskColNumber = "Numero"
        DiskColName = "Nom"
        DiskColSize = "Taille"
        DiskColStyle = "Style"
        DiskColBoot = "Demarrage"
        DiskColSystem = "Systeme"
        DiskColReadOnly = "LectureSeule"
        DiskColState = "Etat"
        PartColNumber = "Partition"
        PartColLetter = "Lettre"
        PartColSize = "Taille"
        PartColLabel = "Etiquette"
        PartColFs = "Systeme"
    }
    ro = @{
        LogStartUsb = "Start creare USB Win11"
        MountedMediaText = "Foloseste ISO/mediu deja montat {0}  [{1}, {2}]"
        LabIsoText = "Monteaza ISO din lab {0}  [{1}]"
        NoLabel = "fara eticheta"
        InstallMediaAvailable = "Medii de instalare disponibile:"
        ManualMediaOption = "Scrie manual o litera montata sau un ISO din lab"
        MountedIsoHint = "Daca ISO-ul este deja montat, alege optiunea de unitate montata."
        MediaPrompt = "Numar, litera montata (ex. I:) sau cale ISO"
        MediaPromptFallback = "Litera deja montata sau ISO in {0}, exemplu I: sau E:\Lab_Win11\Trabajo\ISOs\Win11.iso"
        MissingBootWim = "Mediul {0} nu pare instalator Windows. Lipseste sources\boot.wim."
        MissingInstallImage = "Mediul {0} nu are sources\install.wim, sources\install.esd sau sources\install.swm."
        MediaNotFound = "Mediul indicat nu exista: {0}"
        MediaMustIso = "Mediul trebuie sa fie un ISO sau o litera deja montata."
        IsoMustBeInside = "ISO-ul trebuie sa fie in {0}. Copiaza-l acolo intai pentru a pastra labul curat."
        MountingIso = "Montez ISO..."
        CannotGetIsoLetter = "Nu am putut obtine litera ISO-ului montat."
        BootOtherWarning = "Avertisment: pentru boot folosesc exact boot.wim; alte boot.* din images nu vor fi folosite."
        SourceMountedIso = "ISO montat"
        SourceLabImages = "Trabajo\images"
        BootSelectionTitle = "Surse boot.wim disponibile:"
        BootSelectionPrompt = "Optiune boot (ENTER = {0})"
        BootSelectionInvalid = "Optiune boot nevalida."
        BootCopiesAs = "se copiaza ca sources\boot.wim"
        SwmMissing = "Exista SWM in {0}, dar lipseste install.swm. Trebuie sa fie install.swm, install2.swm, etc."
        MultipleInstallTypes = "Exista mai multe tipuri install.* in {0} ({1}). Lasa doar WIM, doar ESD sau doar SWM."
        NoInstallPayload = "Nu gasesc install.wim, install.esd sau install*.swm in {0} sau {1}."
        DiskReadFailed = "Nu am putut citi lista de discuri."
        DisksAvailable = "Discuri disponibile:"
        DiskNumberPrompt = "Numarul USB-ului care VA FI STERS"
        InvalidDiskNumber = "Numar de disc invalid."
        RefuseSystemDisk = "Discul {0} este de boot/sistem. Nu il ating."
        NoPartitionsVisible = "  Fara partitii vizibile."
        NotExternalWarn1 = "AVERTISMENT: acest disc nu apare ca USB/SD/MMC."
        NotExternalWarn2 = "Windows arata BusType: {0}"
        NotExternalWarn3 = "Daca este o carcasa USB sau adaptor, poate fi normal. Daca nu esti sigur, anuleaza."
        UnderstandDisk = "INTELEG DISC {0}"
        TypeExactToContinue = "Tasteaza exact '{0}' pentru a continua cu acest disc"
        CancelNotUsb = "Anulat deoarece discul nu parea USB."
        RunningDiskPart = "Rulez DiskPart: {0}"
        DiskPartFailed = "DiskPart a esuat. Verifica {0}"
        CleaningDisk = "Curat discul {0}..."
        StateAfterClean = "Stare dupa clean: {0}"
        InitGpt = "Initializez discul {0} ca GPT pentru UEFI..."
        ConvertGpt = "Convertesc discul {0} din MBR in GPT pentru UEFI..."
        AlreadyGpt = "Discul {0} este deja GPT dupa clean; continui."
        UnexpectedStyle = "Stil de partitie neasteptat dupa clean: {0}"
        NotGpt = "Discul {0} nu a ramas GPT. Stare curenta: {1}"
        StillPartitions = "Discul {0} inca are partitii dupa curatare/initializare. Nu continui."
        SelectedDisk = "DISC SELECTAT:"
        CurrentPartitions = "Partitii curente:"
        ErasePhrase = "STERGE DISC {0}"
        DeleteWarning = "Aceasta va elimina toate partitiile de pe discul {0}."
        ErasePrompt = "Tasteaza exact '{0}' pentru a continua"
        CancelBadConfirm = "Anulat din cauza confirmarii incorecte."
        RobocopyFailed = "Robocopy a esuat cu codul {0}."
        CopyBootSkeleton = "Copiez boot FAT32 fara sources complet..."
        CopyBootWimToFat32 = "Copiez boot.wim ales in sources FAT32..."
        BootCopyMissing = "boot.wim nu a fost copiat in {0}."
        BootCopySizeMismatch = "Dimensiunea boot.wim nu coincide. Sursa: {0}. Destinatie: {1}."
        BootCopyDone = "boot.wim copiat in FAT32: {0} [{1}]"
        CopyInstallFrom = "Copiez install.* din {0} in {1}..."
        InstallCopyMissing = "{0} nu a fost copiat in {1}."
        InstallCopySizeMismatch = "Dimensiunea {0} nu coincide. Sursa: {1}. Destinatie: {2}."
        InstallCopyDone = "{0} copiat in {1}: {2} [{3}]"
        InstallMedia = "Mediu de instalare: {0}"
        BootLine = "Boot.wim: {0} ({1})"
        InstallLine = "Install.*: {0} ({1}: {2})"
        PreparingDisk = "Pregatesc discul..."
        CreatingBootPartition = "Creez partitia FAT32 de boot ({0} MB)..."
        CreatingInstallPartition = "Creez partitia de instalator {0} Basic Data..."
        CannotGetLetters = "Nu am putut obtine literele asignate partitiilor create."
        PartitionsCreated = "Partitii create:"
        Fat32BootLine = "  FAT32: {0}"
        InstallPartitionLine = "  {0}: {1}"
        CopyIsoSkeleton = "Copiez scheletul ISO in {0} fara boot.wim/install.*..."
        UsbReady = "USB Windows 11 pregatit."
        UsbCopySummary = "Copierea imaginilor finalizata:"
        UsbBootWimCopied = "  boot.wim -> FAT32: {0} [{1}]"
        UsbInstallCopied = "  {0} -> {1}: {2} [{3}]"
        UsbPartitionsSummary = "Partitii:"
        UsbBootLine = "  Boot FAT32: {0}"
        UsbInstallLine = "  Instalator {0}: {1}"
        DismountingIso = "Demontez ISO..."
        PressEnterExit = "Apasa ENTER pentru iesire"
        DiskColNumber = "Numar"
        DiskColName = "Nume"
        DiskColSize = "Dimensiune"
        DiskColStyle = "Stil"
        DiskColBoot = "Boot"
        DiskColSystem = "Sistem"
        DiskColReadOnly = "DoarCitire"
        DiskColState = "Stare"
        PartColNumber = "Partitie"
        PartColLetter = "Litera"
        PartColSize = "Dimensiune"
        PartColLabel = "Eticheta"
        PartColFs = "Sistem"
    }
    de = @{
        LogStartUsb = "Start Windows 11 USB erstellen"
        MountedMediaText = "Bereits gemountete ISO/Medium verwenden {0}  [{1}, {2}]"
        LabIsoText = "Lab-ISO mounten {0}  [{1}]"
        NoLabel = "kein Label"
        InstallMediaAvailable = "Verfuegbare Installationsmedien:"
        ManualMediaOption = "Gemounteten Laufwerksbuchstaben oder Lab-ISO manuell eingeben"
        MountedIsoHint = "Wenn die ISO bereits gemountet ist, waehlen Sie die gemountete Laufwerksoption."
        MediaPrompt = "Nummer, gemounteter Buchstabe (z.B. I:) oder ISO-Pfad"
        MediaPromptFallback = "Bereits gemounteter Buchstabe oder ISO in {0}, Beispiel I: oder E:\Lab_Win11\Trabajo\ISOs\Win11.iso"
        MissingBootWim = "Medium {0} sieht nicht wie Windows-Setup aus. sources\boot.wim fehlt."
        MissingInstallImage = "Medium {0} enthaelt kein sources\install.wim, sources\install.esd oder sources\install.swm."
        MediaNotFound = "Angegebenes Medium existiert nicht: {0}"
        MediaMustIso = "Das Medium muss eine ISO oder ein bereits gemounteter Laufwerksbuchstabe sein."
        IsoMustBeInside = "Die ISO muss in {0} liegen. Kopieren Sie sie zuerst dorthin, um das Lab sauber zu halten."
        MountingIso = "ISO wird gemountet..."
        CannotGetIsoLetter = "Der Laufwerksbuchstabe der gemounteten ISO konnte nicht ermittelt werden."
        BootOtherWarning = "Hinweis: fuer den Start nutze ich genau boot.wim; andere boot.* in images werden nicht verwendet."
        SourceMountedIso = "Gemountete ISO"
        SourceLabImages = "Trabajo\images"
        BootSelectionTitle = "Verfuegbare boot.wim Quellen:"
        BootSelectionPrompt = "Boot-Option (ENTER = {0})"
        BootSelectionInvalid = "Ungueltige Boot-Option."
        BootCopiesAs = "wird als sources\boot.wim kopiert"
        SwmMissing = "In {0} gibt es SWM, aber install.swm fehlt. Es muessen install.swm, install2.swm usw. vorhanden sein."
        MultipleInstallTypes = "Es gibt mehr als einen install.* Typ in {0} ({1}). Lassen Sie nur WIM, nur ESD oder nur SWM."
        NoInstallPayload = "Ich finde install.wim, install.esd oder install*.swm weder in {0} noch in {1}."
        DiskReadFailed = "Die Datentraegerliste konnte nicht gelesen werden."
        DisksAvailable = "Verfuegbare Datentraeger:"
        DiskNumberPrompt = "USB-Datentraegernummer, die GELOESCHT WIRD"
        InvalidDiskNumber = "Ungueltige Datentraegernummer."
        RefuseSystemDisk = "Datentraeger {0} ist Boot/System. Ich fasse ihn nicht an."
        NoPartitionsVisible = "  Keine sichtbaren Partitionen."
        NotExternalWarn1 = "WARNUNG: dieser Datentraeger erscheint nicht als USB/SD/MMC."
        NotExternalWarn2 = "Windows zeigt BusType: {0}"
        NotExternalWarn3 = "Bei USB-Gehaeuse oder Adapter kann das normal sein. Wenn unsicher, abbrechen."
        UnderstandDisk = "ICH VERSTEHE DATENTRAEGER {0}"
        TypeExactToContinue = "Geben Sie exakt '{0}' ein, um mit diesem Datentraeger fortzufahren"
        CancelNotUsb = "Abgebrochen, weil der Datentraeger nicht wie USB aussah."
        RunningDiskPart = "DiskPart wird ausgefuehrt: {0}"
        DiskPartFailed = "DiskPart ist fehlgeschlagen. Pruefen Sie {0}"
        CleaningDisk = "Datentraeger {0} wird bereinigt..."
        StateAfterClean = "Status nach clean: {0}"
        InitGpt = "Datentraeger {0} wird als GPT fuer UEFI initialisiert..."
        ConvertGpt = "Datentraeger {0} wird von MBR zu GPT fuer UEFI konvertiert..."
        AlreadyGpt = "Datentraeger {0} ist nach clean bereits GPT; weiter."
        UnexpectedStyle = "Unerwarteter Partitionsstil nach clean: {0}"
        NotGpt = "Datentraeger {0} wurde nicht GPT. Aktueller Status: {1}"
        StillPartitions = "Datentraeger {0} hat nach Bereinigung/Initialisierung noch Partitionen. Ich fahre nicht fort."
        SelectedDisk = "AUSGEWAEHLTER DATENTRAEGER:"
        CurrentPartitions = "Aktuelle Partitionen:"
        ErasePhrase = "DATENTRAEGER LOESCHEN {0}"
        DeleteWarning = "Dies entfernt alle Partitionen von Datentraeger {0}."
        ErasePrompt = "Geben Sie exakt '{0}' ein, um fortzufahren"
        CancelBadConfirm = "Abgebrochen wegen falscher Bestaetigung."
        RobocopyFailed = "Robocopy ist mit Code {0} fehlgeschlagen."
        CopyBootSkeleton = "FAT32-Bootdateien ohne vollstaendige sources werden kopiert..."
        CopyBootWimToFat32 = "Ausgewaehlte boot.wim wird nach FAT32 sources kopiert..."
        BootCopyMissing = "boot.wim wurde nicht nach {0} kopiert."
        BootCopySizeMismatch = "boot.wim Groesse stimmt nicht. Quelle: {0}. Ziel: {1}."
        BootCopyDone = "boot.wim nach FAT32 kopiert: {0} [{1}]"
        CopyInstallFrom = "install.* wird von {0} nach {1} kopiert..."
        InstallCopyMissing = "{0} wurde nicht nach {1} kopiert."
        InstallCopySizeMismatch = "{0} Groesse stimmt nicht. Quelle: {1}. Ziel: {2}."
        InstallCopyDone = "{0} nach {1} kopiert: {2} [{3}]"
        InstallMedia = "Installationsmedium: {0}"
        BootLine = "Boot.wim: {0} ({1})"
        InstallLine = "Install.*: {0} ({1}: {2})"
        PreparingDisk = "Datentraeger wird vorbereitet..."
        CreatingBootPartition = "FAT32-Bootpartition wird erstellt ({0} MB)..."
        CreatingInstallPartition = "{0} Basic Data Installer-Partition wird erstellt..."
        CannotGetLetters = "Die zugewiesenen Laufwerksbuchstaben der erstellten Partitionen konnten nicht ermittelt werden."
        PartitionsCreated = "Partitionen erstellt:"
        Fat32BootLine = "  FAT32: {0}"
        InstallPartitionLine = "  {0}: {1}"
        CopyIsoSkeleton = "ISO-Grundstruktur wird nach {0} ohne boot.wim/install.* kopiert..."
        UsbReady = "Windows 11 USB vorbereitet."
        UsbCopySummary = "Image-Kopie abgeschlossen:"
        UsbBootWimCopied = "  boot.wim -> FAT32: {0} [{1}]"
        UsbInstallCopied = "  {0} -> {1}: {2} [{3}]"
        UsbPartitionsSummary = "Partitionen:"
        UsbBootLine = "  FAT32 Boot: {0}"
        UsbInstallLine = "  {0} Installer: {1}"
        DismountingIso = "ISO wird unmountet..."
        PressEnterExit = "ENTER druecken zum Beenden"
        DiskColNumber = "Nummer"
        DiskColName = "Name"
        DiskColSize = "Groesse"
        DiskColStyle = "Stil"
        DiskColBoot = "Boot"
        DiskColSystem = "System"
        DiskColReadOnly = "NurLesen"
        DiskColState = "Status"
        PartColNumber = "Partition"
        PartColLetter = "Buchstabe"
        PartColSize = "Groesse"
        PartColLabel = "Label"
        PartColFs = "Dateisystem"
    }
}

Add-Content -LiteralPath $LogPath -Value ("[{0}] {1}" -f (Get-Date -Format "yyyy-MM-dd HH:mm:ss"), (L "LogStartUsb"))

function Write-Step {
    param(
        [string]$Message,
        [ConsoleColor]$Color = [ConsoleColor]::Gray
    )

    Write-Host $Message -ForegroundColor $Color
    Add-Content -LiteralPath $LogPath -Value ("[{0}] {1}" -f (Get-Date -Format "yyyy-MM-dd HH:mm:ss"), $Message)
}

function Write-Section {
    param(
        [string]$Title,
        [ConsoleColor]$Color = [ConsoleColor]::Cyan
    )

    Write-LabSection -Title $Title -Color $Color
    Add-Content -LiteralPath $LogPath -Value ("[{0}] {1}" -f (Get-Date -Format "yyyy-MM-dd HH:mm:ss"), $Title)
}

function Format-Bytes {
    param([UInt64]$Bytes)

    if ($Bytes -ge 1TB) { return "{0:N2} TB" -f ($Bytes / 1TB) }
    if ($Bytes -ge 1GB) { return "{0:N2} GB" -f ($Bytes / 1GB) }
    if ($Bytes -ge 1MB) { return "{0:N2} MB" -f ($Bytes / 1MB) }
    return "$Bytes bytes"
}

function Test-PathInsideDirectory {
    param(
        [string]$Path,
        [string]$Root
    )

    $resolvedPath = (Resolve-Path -LiteralPath $Path -ErrorAction Stop).ProviderPath
    $resolvedRoot = (Resolve-Path -LiteralPath $Root -ErrorAction Stop).ProviderPath.TrimEnd("\")
    return $resolvedPath.StartsWith(($resolvedRoot + "\"), [System.StringComparison]::OrdinalIgnoreCase)
}

function Get-IsoCandidates {
    $roots = @($IsoRoot) | Where-Object { Test-Path -LiteralPath $_ }

    foreach ($root in $roots) {
        Get-ChildItem -LiteralPath $root -Recurse -File -Filter "*.iso" -ErrorAction SilentlyContinue
    }
}

function Test-WindowsInstallMediaRoot {
    param([string]$Root)

    try {
        Assert-WindowsInstallMedia -Root $Root
        return $true
    }
    catch {
        return $false
    }
}

function Get-MountedInstallMediaCandidates {
    $volumes = @(Get-Volume -ErrorAction SilentlyContinue | Where-Object DriveLetter | Sort-Object DriveLetter)
    foreach ($volume in $volumes) {
        $root = "$($volume.DriveLetter):\"
        if (Test-WindowsInstallMediaRoot -Root $root) {
            $label = if ($volume.FileSystemLabel) { $volume.FileSystemLabel } else { L "NoLabel" }
            [pscustomobject]@{
                Kind = "Mounted"
                Value = $root
                Label = $label
                Size = if ($volume.Size) { Format-Bytes -Bytes ([UInt64]$volume.Size) } else { "" }
            }
        }
    }
}

function Select-IsoPath {
    $options = New-Object System.Collections.Generic.List[object]
    foreach ($mounted in @(Get-MountedInstallMediaCandidates)) {
        $options.Add([pscustomobject]@{
            Kind = "Mounted"
            Value = $mounted.Value
            Text = (LF "MountedMediaText" $mounted.Value $mounted.Label $mounted.Size)
        })
    }

    foreach ($iso in @(Get-IsoCandidates | Sort-Object LastWriteTime -Descending)) {
        $options.Add([pscustomobject]@{
            Kind = "ISO"
            Value = $iso.FullName
            Text = (LF "LabIsoText" $iso.FullName (Format-Bytes -Bytes ([UInt64]$iso.Length)))
        })
    }

    if ($options.Count -gt 0) {
        Write-Section (L "InstallMediaAvailable")
        for ($i = 0; $i -lt $options.Count; $i++) {
            Write-Host ("{0,2}. {1}" -f ($i + 1), $options[$i].Text)
        }
        Write-Host (" 0. {0}" -f (L "ManualMediaOption"))
        Write-Host ""
        Write-Host (L "MountedIsoHint") -ForegroundColor Yellow

        $answer = Read-Host (L "MediaPrompt")
        $number = 0
        if ([int]::TryParse($answer, [ref]$number) -and $number -ge 1 -and $number -le $options.Count) {
            return $options[$number - 1].Value
        }

        if (-not [string]::IsNullOrWhiteSpace($answer) -and $answer.Trim() -ne "0") {
            return $answer
        }
    }

    return (Read-Host (LF "MediaPromptFallback" $IsoRoot))
}

function Assert-WindowsInstallMedia {
    param([string]$Root)

    $sources = Join-Path $Root "sources"
    if (-not (Test-Path -LiteralPath (Join-Path $sources "boot.wim"))) {
        throw (LF "MissingBootWim" $Root)
    }

    $hasInstallImage = @("install.wim", "install.esd", "install.swm") |
        Where-Object { Test-Path -LiteralPath (Join-Path $sources $_) } |
        Select-Object -First 1

    if (-not $hasInstallImage) {
        throw (LF "MissingInstallImage" $Root)
    }
}

function Resolve-InstallMedia {
    param([string]$Path)

    if ([string]::IsNullOrWhiteSpace($Path)) {
        $Path = Select-IsoPath
    }

    $Path = $Path.Trim('"')

    if ($Path -match "^[A-Za-z]:\\?$") {
        $root = ($Path.Substring(0, 1).ToUpperInvariant() + ":\")
        Assert-WindowsInstallMedia -Root $root
        return $root
    }

    if (-not (Test-Path -LiteralPath $Path -PathType Leaf)) {
        throw (LF "MediaNotFound" $Path)
    }

    if ([System.IO.Path]::GetExtension($Path) -ne ".iso") {
        throw (L "MediaMustIso")
    }

    if (-not (Test-PathInsideDirectory -Path $Path -Root $IsoRoot)) {
        throw (LF "IsoMustBeInside" $IsoRoot)
    }

    Write-Host ""
    Write-Host (L "MountingIso") -ForegroundColor Cyan
    Mount-DiskImage -ImagePath $Path | Out-Null
    $script:MountedIsoPath = $Path
    Start-Sleep -Seconds 2

    $volume = Get-DiskImage -ImagePath $Path | Get-Volume | Where-Object DriveLetter | Select-Object -First 1
    if (-not $volume) {
        throw (L "CannotGetIsoLetter")
    }

    $root = "$($volume.DriveLetter):\"
    Assert-WindowsInstallMedia -Root $root

    return $root
}

function Get-BootImageFile {
    param([string]$MediaRoot)

    $candidates = @()

    $labBootFiles = @(
        Get-ChildItem -LiteralPath $ImagesRoot -File -Filter "boot*.wim" -ErrorAction SilentlyContinue |
            Sort-Object @{ Expression = { if ($_.Name -ieq "boot.wim") { 0 } else { 1 } } }, Name
    )
    foreach ($file in $labBootFiles) {
        $candidates += [pscustomobject]@{
            Source = L "SourceLabImages"
            Path = $file.FullName
            Display = ("Trabajo\images\{0}" -f $file.Name)
            Length = $file.Length
        }
    }

    $isoBootPath = Join-Path $MediaRoot "sources\boot.wim"
    $isoBoot = Get-Item -LiteralPath $isoBootPath -ErrorAction Stop
    $candidates += [pscustomobject]@{
        Source = L "SourceMountedIso"
        Path = $isoBoot.FullName
        Display = "ISO sources\boot.wim"
        Length = $isoBoot.Length
    }

    if ($candidates.Count -eq 1) {
        return $candidates[0]
    }

    Write-Section (L "BootSelectionTitle")
    for ($i = 0; $i -lt $candidates.Count; $i++) {
        $candidate = $candidates[$i]
        Write-Host ("{0}. {1}  [{2}]  ({3}; {4})" -f ($i + 1), $candidate.Display, (Format-Bytes -Bytes ([UInt64]$candidate.Length)), $candidate.Source, (L "BootCopiesAs"))
    }

    $defaultChoice = 1
    $answer = Read-Host (LF "BootSelectionPrompt" $defaultChoice)
    if ([string]::IsNullOrWhiteSpace($answer)) {
        return $candidates[$defaultChoice - 1]
    }

    $selectedNumber = 0
    if (-not [int]::TryParse($answer.Trim(), [ref]$selectedNumber) -or $selectedNumber -lt 1 -or $selectedNumber -gt $candidates.Count) {
        throw (L "BootSelectionInvalid")
    }

    return $candidates[$selectedNumber - 1]
}

function Get-InstallPayloadSet {
    param(
        [string]$SourceDirectory,
        [string]$SourceName
    )

    if (-not (Test-Path -LiteralPath $SourceDirectory)) {
        return $null
    }

    $wim = Get-Item -LiteralPath (Join-Path $SourceDirectory "install.wim") -ErrorAction SilentlyContinue
    $esd = Get-Item -LiteralPath (Join-Path $SourceDirectory "install.esd") -ErrorAction SilentlyContinue
    $swmFiles = @(Get-ChildItem -LiteralPath $SourceDirectory -File -Filter "install*.swm" -ErrorAction SilentlyContinue | Sort-Object Name)

    $types = @()
    if ($wim) { $types += "WIM" }
    if ($esd) { $types += "ESD" }
    if ($swmFiles.Count -gt 0) {
        if (-not ($swmFiles | Where-Object { $_.Name -ieq "install.swm" })) {
            throw (LF "SwmMissing" $SourceDirectory)
        }
        $types += "SWM"
    }

    if ($types.Count -eq 0) {
        return $null
    }

    if ($types.Count -gt 1) {
        throw (LF "MultipleInstallTypes" $SourceDirectory ($types -join ', '))
    }

    switch ($types[0]) {
        "WIM" { $files = @($wim) }
        "ESD" { $files = @($esd) }
        "SWM" { $files = @($swmFiles) }
    }

    return [pscustomobject]@{
        Source = $SourceName
        Type = $types[0]
        Files = @($files)
    }
}

function Resolve-InstallPayloadSet {
    param([string]$MediaRoot)

    $labSet = Get-InstallPayloadSet -SourceDirectory $ImagesRoot -SourceName (L "SourceLabImages")
    if ($labSet) {
        return $labSet
    }

    $isoSources = Join-Path $MediaRoot "sources"
    $isoSet = Get-InstallPayloadSet -SourceDirectory $isoSources -SourceName (L "SourceMountedIso")
    if ($isoSet) {
        return $isoSet
    }

    throw (LF "NoInstallPayload" $ImagesRoot $isoSources)
}

function Show-DiskTable {
    $rows = @(
        Get-Disk |
            Sort-Object Number |
            ForEach-Object {
                $row = [ordered]@{}
                $row[(L "DiskColNumber")] = $_.Number
                $row[(L "DiskColName")] = $_.FriendlyName
                $row["Bus"] = $_.BusType
                $row[(L "DiskColSize")] = Format-Bytes -Bytes ([UInt64]$_.Size)
                $row[(L "DiskColStyle")] = $_.PartitionStyle
                $row[(L "DiskColBoot")] = $_.IsBoot
                $row[(L "DiskColSystem")] = $_.IsSystem
                $row["Offline"] = $_.IsOffline
                $row[(L "DiskColReadOnly")] = $_.IsReadOnly
                $row[(L "DiskColState")] = ($_.OperationalStatus -join ",")
                [pscustomobject]$row
            }
    )

    if ($rows.Count -eq 0) {
        throw (L "DiskReadFailed")
    }

    Write-Host ($rows | Format-Table -AutoSize | Out-String -Width 240)
}

function Get-SelectedDisk {
    if (-not $PSBoundParameters.ContainsKey("DiskNumber") -or $null -eq $DiskNumber) {
        Write-Section (L "DisksAvailable")
        Show-DiskTable
        $answer = Read-Host (L "DiskNumberPrompt")
        $parsed = 0
        if (-not [int]::TryParse($answer, [ref]$parsed)) {
            throw (L "InvalidDiskNumber")
        }
        $script:DiskNumber = $parsed
    }

    $disk = Get-Disk -Number $DiskNumber -ErrorAction Stop
    if ($disk.IsBoot -or $disk.IsSystem) {
        throw (LF "RefuseSystemDisk" $DiskNumber)
    }

    return $disk
}

function Show-DiskVolumes {
    param([int]$Number)

    $partitions = @(Get-Partition -DiskNumber $Number -ErrorAction SilentlyContinue)
    if ($partitions.Count -eq 0) {
        Write-Host (L "NoPartitionsVisible")
        return
    }

    $partitions |
        ForEach-Object {
            $volume = $_ | Get-Volume -ErrorAction SilentlyContinue
            $row = [ordered]@{}
            $row[(L "PartColNumber")] = $_.PartitionNumber
            $row[(L "PartColLetter")] = $_.DriveLetter
            $row[(L "PartColSize")] = Format-Bytes -Bytes ([UInt64]$_.Size)
            $row[(L "PartColLabel")] = if ($volume) { $volume.FileSystemLabel } else { "" }
            $row[(L "PartColFs")] = if ($volume) { $volume.FileSystem } else { "" }
            [pscustomobject]$row
        } | Format-Table -AutoSize
}

function Confirm-DiskLooksExternal {
    param([Microsoft.Management.Infrastructure.CimInstance]$Disk)

    $bus = $Disk.BusType.ToString()
    if ($bus -in @("USB", "SD", "MMC")) {
        return
    }

    Write-Host ""
    Write-Host (L "NotExternalWarn1") -ForegroundColor Yellow
    Write-Host (LF "NotExternalWarn2" $bus) -ForegroundColor Yellow
    Write-Host (L "NotExternalWarn3") -ForegroundColor Yellow

    $expected = LF "UnderstandDisk" $Disk.Number
    $confirmation = Read-Host (LF "TypeExactToContinue" $expected)
    if ($confirmation -ne $expected) {
        throw (L "CancelNotUsb")
    }
}

function Invoke-DiskPartScript {
    param(
        [string[]]$Lines,
        [string]$Name
    )

    $scriptPath = Join-Path $LogsRoot ("diskpart-{0}-{1}.txt" -f $Name, (Get-Date -Format "yyyyMMdd-HHmmss"))
    $outputPath = [System.IO.Path]::ChangeExtension($scriptPath, ".out.txt")
    Set-Content -LiteralPath $scriptPath -Value $Lines -Encoding ASCII

    Write-Step (LF "RunningDiskPart" $scriptPath) Cyan
    $output = & diskpart.exe /s $scriptPath 2>&1
    $output | Set-Content -LiteralPath $outputPath -Encoding UTF8
    Add-Content -LiteralPath $LogPath -Value ($output | Out-String)

    if ($LASTEXITCODE -ne 0 -or ($output -match "DiskPart has encountered an error|Virtual Disk Service error|error")) {
        throw (LF "DiskPartFailed" $outputPath)
    }
}

function Initialize-DiskForUefiGptUsb {
    param([int]$Number)

    Write-Step (LF "CleaningDisk" $Number) Cyan
    Invoke-DiskPartScript -Name "clean-disk$Number" -Lines @(
        "select disk $Number",
        "clean",
        "rescan",
        "exit"
    )

    Start-Sleep -Seconds 2
    Update-Disk -Number $Number -ErrorAction SilentlyContinue
    $current = Get-Disk -Number $Number -ErrorAction Stop
    $style = $current.PartitionStyle.ToString()
    Write-Step (LF "StateAfterClean" $style) Yellow

    if ($style -eq "RAW") {
        Write-Step (LF "InitGpt" $Number) Cyan
        Initialize-Disk -Number $Number -PartitionStyle GPT
    }
    elseif ($style -eq "MBR") {
        Write-Step (LF "ConvertGpt" $Number) Cyan
        Invoke-DiskPartScript -Name "convert-gpt-disk$Number" -Lines @(
            "select disk $Number",
            "convert gpt",
            "rescan",
            "exit"
        )
    }
    elseif ($style -eq "GPT") {
        Write-Step (LF "AlreadyGpt" $Number) Cyan
    }
    else {
        throw (LF "UnexpectedStyle" $style)
    }

    Start-Sleep -Seconds 2
    Update-Disk -Number $Number -ErrorAction SilentlyContinue
    $current = Get-Disk -Number $Number -ErrorAction Stop
    if ($current.PartitionStyle.ToString() -ne "GPT") {
        throw (LF "NotGpt" $Number $current.PartitionStyle)
    }

    $remaining = @(Get-Partition -DiskNumber $Number -ErrorAction SilentlyContinue)
    if ($remaining.Count -gt 0) {
        throw (LF "StillPartitions" $Number)
    }

    return $current
}

function Confirm-DiskErase {
    param([Microsoft.Management.Infrastructure.CimInstance]$Disk)

    Write-Section (L "SelectedDisk") Yellow
    $selectedRow = [ordered]@{}
    $selectedRow[(L "DiskColNumber")] = $Disk.Number
    $selectedRow[(L "DiskColName")] = $Disk.FriendlyName
    $selectedRow["Bus"] = $Disk.BusType
    $selectedRow[(L "DiskColSize")] = Format-Bytes -Bytes ([UInt64]$Disk.Size)
    $selectedRow["Serial"] = $Disk.SerialNumber
    Write-Host ([pscustomobject]$selectedRow | Format-Table -AutoSize | Out-String -Width 180)

    Write-Section (L "CurrentPartitions") Yellow
    Show-DiskVolumes -Number $Disk.Number

    $expected = LF "ErasePhrase" $Disk.Number
    Write-Host ""
    Write-Host (LF "DeleteWarning" $Disk.Number) -ForegroundColor Red
    $confirmation = Read-Host (LF "ErasePrompt" $expected)
    if ($confirmation -ne $expected) {
        throw (L "CancelBadConfirm")
    }
}

function Invoke-RobocopyCopy {
    param(
        [string]$Source,
        [string]$Destination,
        [switch]$ExcludeWindowsImages,
        [switch]$ExcludeSourcesDirectory
    )

    $arguments = @(
        $Source.TrimEnd("\"),
        $Destination.TrimEnd("\"),
        "/E",
        "/COPY:DAT",
        "/DCOPY:DAT",
        "/R:2",
        "/W:2"
    )

    if ($ExcludeSourcesDirectory) {
        $arguments += @("/XD", "sources")
    }

    if ($ExcludeWindowsImages) {
        $arguments += @(
            "/XF",
            "boot.wim",
            "boot.esd",
            "boot.swm",
            "install.wim",
            "install.esd",
            "install*.swm"
        )
    }

    Write-Progress -Activity "Robocopy" -Status ("{0} -> {1}" -f $Source, $Destination) -PercentComplete 0
    $output = @(& robocopy @arguments 2>&1)
    $exitCode = $LASTEXITCODE
    Write-Progress -Activity "Robocopy" -Completed
    Add-Content -LiteralPath $LogPath -Value ($output | Out-String)
    if ($exitCode -ge 8) {
        throw (LF "RobocopyFailed" $exitCode)
    }
}

function Copy-BootPartitionFiles {
    param(
        [string]$MediaRoot,
        [string]$BootRoot,
        [string]$BootImagePath
    )

    Write-Host ""
    Write-Host (L "CopyBootSkeleton") -ForegroundColor Cyan
    Invoke-RobocopyCopy -Source $MediaRoot -Destination $BootRoot -ExcludeSourcesDirectory

    Copy-BootWimToFat32 -BootRoot $BootRoot -BootImagePath $BootImagePath
}

function Test-BootWimOnFat32 {
    param(
        [string]$BootImagePath,
        [string]$DestinationBootPath,
        [switch]$Quiet
    )

    $sourceBoot = Get-Item -LiteralPath $BootImagePath -ErrorAction Stop
    if (-not (Test-Path -LiteralPath $DestinationBootPath -PathType Leaf)) {
        throw (LF "BootCopyMissing" $DestinationBootPath)
    }

    $destinationBoot = Get-Item -LiteralPath $DestinationBootPath -ErrorAction Stop
    if ($destinationBoot.Length -ne $sourceBoot.Length) {
        throw (LF "BootCopySizeMismatch" (Format-Bytes -Bytes ([UInt64]$sourceBoot.Length)) (Format-Bytes -Bytes ([UInt64]$destinationBoot.Length)))
    }

    if (-not $Quiet) {
        Write-Host (LF "BootCopyDone" $DestinationBootPath (Format-Bytes -Bytes ([UInt64]$destinationBoot.Length))) -ForegroundColor Green
    }
}

function Copy-BootWimToFat32 {
    param(
        [string]$BootRoot,
        [string]$BootImagePath
    )

    $bootSources = Join-Path $BootRoot "sources"
    New-Item -ItemType Directory -Path $bootSources -Force | Out-Null
    $destinationBoot = Join-Path $bootSources "boot.wim"

    Write-Host ""
    Write-Host (L "CopyBootWimToFat32") -ForegroundColor Cyan
    Copy-LabFileWithProgress -Source $BootImagePath -Destination $destinationBoot -Activity (L "CopyBootWimToFat32") | Out-Null
    Test-BootWimOnFat32 -BootImagePath $BootImagePath -DestinationBootPath $destinationBoot
}

function Copy-InstallPayloadFiles {
    param(
        [pscustomobject]$PayloadSet,
        [string]$InstallRoot,
        [string]$InstallFileSystem
    )

    $sourcesDir = Join-Path $InstallRoot "sources"
    New-Item -ItemType Directory -Path $sourcesDir -Force | Out-Null

    Write-Host ""
    Write-Host (LF "CopyInstallFrom" $PayloadSet.Source $sourcesDir) -ForegroundColor Cyan
    foreach ($file in @($PayloadSet.Files)) {
        $destinationFile = Join-Path $sourcesDir $file.Name
        Copy-LabFileWithProgress -Source $file.FullName -Destination $destinationFile -Activity (LF "CopyInstallFrom" $PayloadSet.Source $sourcesDir) | Out-Null

        if (-not (Test-Path -LiteralPath $destinationFile -PathType Leaf)) {
            throw (LF "InstallCopyMissing" $file.Name $destinationFile)
        }

        $copiedFile = Get-Item -LiteralPath $destinationFile -ErrorAction Stop
        if ($copiedFile.Length -ne $file.Length) {
            throw (LF "InstallCopySizeMismatch" $file.Name (Format-Bytes -Bytes ([UInt64]$file.Length)) (Format-Bytes -Bytes ([UInt64]$copiedFile.Length)))
        }

        Write-Host (LF "InstallCopyDone" $file.Name $InstallFileSystem $destinationFile (Format-Bytes -Bytes ([UInt64]$copiedFile.Length))) -ForegroundColor Green
    }
}

try {
    $mediaRoot = $null
    $bootImage = $null
    $installPayload = $null
    if (-not $CreatePartitionsOnly) {
        $mediaRoot = Resolve-InstallMedia -Path $MediaPath
        $bootImage = Get-BootImageFile -MediaRoot $mediaRoot
        $installPayload = Resolve-InstallPayloadSet -MediaRoot $mediaRoot

        Write-Host (LF "InstallMedia" $mediaRoot) -ForegroundColor Green
        Write-Host (LF "BootLine" $bootImage.Path $bootImage.Source) -ForegroundColor Green
        Write-Host (LF "InstallLine" $installPayload.Source $installPayload.Type ((@($installPayload.Files) | ForEach-Object Name) -join ', ')) -ForegroundColor Green
    }

    $disk = Get-SelectedDisk
    Confirm-DiskLooksExternal -Disk $disk
    Confirm-DiskErase -Disk $disk

    Write-Host ""
    Write-Step (L "PreparingDisk") Cyan
    Set-Disk -Number $disk.Number -IsOffline $false -ErrorAction SilentlyContinue
    Set-Disk -Number $disk.Number -IsReadOnly $false -ErrorAction SilentlyContinue
    $disk = Initialize-DiskForUefiGptUsb -Number $disk.Number

    $basicDataPartitionGptType = "{ebd0a0a2-b9e5-4433-87c0-68b6b72699c7}"

    Write-Step (LF "CreatingBootPartition" $BootSizeMB) Cyan
    $bootPartition = New-Partition -DiskNumber $disk.Number -Size ($BootSizeMB * 1MB) -GptType $basicDataPartitionGptType -AssignDriveLetter
    $bootPartition | Format-Volume -FileSystem FAT32 -NewFileSystemLabel $BootLabel -Confirm:$false -Force | Out-Null

    Write-Step (LF "CreatingInstallPartition" $InstallFileSystem) Cyan
    $installPartition = New-Partition -DiskNumber $disk.Number -UseMaximumSize -GptType $basicDataPartitionGptType -AssignDriveLetter
    $installPartition | Format-Volume -FileSystem $InstallFileSystem -NewFileSystemLabel $InstallLabel -Confirm:$false -Force | Out-Null

    Start-Sleep -Seconds 2
    $bootPartition = Get-Partition -DiskNumber $disk.Number -PartitionNumber $bootPartition.PartitionNumber
    $installPartition = Get-Partition -DiskNumber $disk.Number -PartitionNumber $installPartition.PartitionNumber
    if (-not $bootPartition.DriveLetter -or -not $installPartition.DriveLetter) {
        throw (L "CannotGetLetters")
    }
    $bootRoot = "$($bootPartition.DriveLetter):\"
    $installRoot = "$($installPartition.DriveLetter):\"

    if ($CreatePartitionsOnly) {
        Write-Host ""
        Write-Host (L "PartitionsCreated") -ForegroundColor Green
        Write-Host (LF "Fat32BootLine" $bootRoot)
        Write-Host (LF "InstallPartitionLine" $InstallFileSystem $installRoot)
        return
    }

    Copy-BootPartitionFiles -MediaRoot $mediaRoot -BootRoot $bootRoot -BootImagePath $bootImage.Path

    Write-Host ""
    Write-Host (LF "CopyIsoSkeleton" $InstallFileSystem) -ForegroundColor Cyan
    Invoke-RobocopyCopy -Source $mediaRoot -Destination $installRoot -ExcludeWindowsImages

    Copy-InstallPayloadFiles -PayloadSet $installPayload -InstallRoot $installRoot -InstallFileSystem $InstallFileSystem
    Test-BootWimOnFat32 -BootImagePath $bootImage.Path -DestinationBootPath (Join-Path $bootRoot "sources\boot.wim") -Quiet

    $finalBootWim = Get-Item -LiteralPath (Join-Path $bootRoot "sources\boot.wim") -ErrorAction Stop
    $finalInstallFiles = foreach ($file in @($installPayload.Files)) {
        Get-Item -LiteralPath (Join-Path (Join-Path $installRoot "sources") $file.Name) -ErrorAction Stop
    }

    Write-Host ""
    Write-Host (L "UsbReady") -ForegroundColor Green
    Write-Host (L "UsbCopySummary") -ForegroundColor Green
    Write-Host (LF "UsbBootWimCopied" $finalBootWim.FullName (Format-Bytes -Bytes ([UInt64]$finalBootWim.Length)))
    foreach ($file in @($finalInstallFiles)) {
        Write-Host (LF "UsbInstallCopied" $file.Name $InstallFileSystem $file.FullName (Format-Bytes -Bytes ([UInt64]$file.Length)))
    }
    Write-Host (L "UsbPartitionsSummary") -ForegroundColor Green
    Write-Host (LF "UsbBootLine" $bootRoot)
    Write-Host (LF "UsbInstallLine" $InstallFileSystem $installRoot)
}
catch {
    Write-Host ""
    Write-Host (LF "ErrorPrefix" $_.Exception.Message) -ForegroundColor Red
    Write-Host ("{0}: {1}" -f (L "Log"), $LogPath) -ForegroundColor Yellow
    Add-Content -LiteralPath $LogPath -Value ("[{0}] ERROR: {1}" -f (Get-Date -Format "yyyy-MM-dd HH:mm:ss"), $_.Exception.Message)
    Add-Content -LiteralPath $LogPath -Value ($_.ScriptStackTrace | Out-String)
}
finally {
    if ($MountedIsoPath) {
        Write-Host ""
        Write-Host (L "DismountingIso") -ForegroundColor Cyan
        Add-Content -LiteralPath $LogPath -Value ("[{0}] Desmontando ISO: {1}" -f (Get-Date -Format "yyyy-MM-dd HH:mm:ss"), $MountedIsoPath)
        Dismount-DiskImage -ImagePath $MountedIsoPath -ErrorAction SilentlyContinue
    }
}

Write-Host ""
Write-Host ("{0}: {1}" -f (L "Log"), $LogPath) -ForegroundColor Yellow
Read-Host (L "PressEnterExit") | Out-Null
exit
