#Requires -RunAsAdministrator
[CmdletBinding()]
param(
    [string]$MediaPath,
    [Nullable[int]]$DiskNumber,
    [int]$BootSizeMB = 2048,
    [string]$BootLabel = "Win11Boot",
    [string]$InstallLabel = "Win11exFAT",
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
        UsbBannerTitle = "CREATE WINDOWS 11 UEFI/GPT USB"
        StepSelectMedia = "Select source media and Windows images"
        StepSelectDisk = "Select target USB drive and check port speed"
        StepPlanAndConfirm = "Review execution plan and confirm disk erase"
        StepPreparePartitions = "Clean disk and create UEFI/GPT partitions"
        StepCopyPayload = "Copy boot files and Windows images to USB"
        UsbPlanTitle = "USB preparation plan"
        UsbSummaryTitle = "USB preparation summary"
        PlanModeLabel = "Mode"
        PlanModeFull = "Full Windows 11 USB (GPT: FAT32 + {0})"
        PlanModePartitionsOnly = "Partitions only (GPT: FAT32 + {0})"
        PlanMediaLabel = "Base media"
        PlanBootLabel = "Boot image"
        PlanInstallLabel = "Install image"
        PlanTargetDiskLabel = "Target disk"
        PlanUsbSpeedLabel = "USB speed"
        PlanPartitionsLabel = "Layout"
        SummaryBootPartLabel = "FAT32 boot partition"
        SummaryInstallPartLabel = "Installer partition ({0})"
        SummaryStatusLabel = "Status"
        LogStartUsb = "Start Create Win11 USB"
        MountedMediaText = "Use already mounted ISO/media {0}  [{1}, {2}]"
        LabIsoText = "Mount lab ISO {0}  [{1}]"
        NoLabel = "no label"
        InstallMediaAvailable = "Available installation media:"
        ManualMediaOption = "Type a mounted drive letter or a lab ISO manually"
        MountedIsoHint = "If the ISO is already mounted, choose the mounted drive option."
        MediaPrompt = "Number, mounted drive letter (example I:) or ISO path"
        MediaPromptFallback = "Mounted drive letter or ISO inside {0}, example I: or {0}\Win11.iso"
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
        CleanRetry = "Retrying USB clean ({0}/{1})..."
        CleanAttemptFailed = "Clean attempt {0} failed. Review {1}"
        CleanManualTitle = "Windows still cannot clean the USB automatically."
        CleanManualHelp1 = "You can unplug/replug the USB or clean it manually with Disk Management/DiskPart."
        CleanManualHelp2 = "Do not close this window. When the USB is ready, come back here."
        CleanManualPrompt = "Press ENTER to re-check the USB and continue"
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
        PressEnterExit = "Press ENTER to exit"
        DiskColNumber = "Number"
        DiskColName = "Name"
        DiskColBus = "Bus"
        DiskColSize = "Size"
        DiskColStyle = "Style"
        DiskColBoot = "Boot"
        DiskColSystem = "System"
        DiskColOffline = "Offline"
        DiskColReadOnly = "ReadOnly"
        DiskColState = "State"
        DiskColSerial = "Serial"
        PartColNumber = "Partition"
        PartColLetter = "Letter"
        PartColSize = "Size"
        PartColLabel = "Label"
        PartColFs = "FileSystem"
    }
    es = @{
        UsbBannerTitle = "CREAR USB WINDOWS 11 UEFI/GPT"
        StepSelectMedia = "Seleccionar medio de origen e imágenes Windows"
        StepSelectDisk = "Seleccionar disco USB y comprobar velocidad del puerto"
        StepPlanAndConfirm = "Revisar plan de ejecución y confirmar borrado"
        StepPreparePartitions = "Limpiar disco y crear particiones UEFI/GPT"
        StepCopyPayload = "Copiar archivos de arranque e imágenes al USB"
        UsbPlanTitle = "Plan de preparación del USB"
        UsbSummaryTitle = "Resumen final del USB preparado"
        PlanModeLabel = "Modo"
        PlanModeFull = "USB completo Windows 11 (GPT: FAT32 + {0})"
        PlanModePartitionsOnly = "Solo particiones (GPT: FAT32 + {0})"
        PlanMediaLabel = "Medio base"
        PlanBootLabel = "Imagen arranque"
        PlanInstallLabel = "Imagen install"
        PlanTargetDiskLabel = "Disco destino"
        PlanUsbSpeedLabel = "Velocidad USB"
        PlanPartitionsLabel = "Esquema"
        SummaryBootPartLabel = "Partición arranque FAT32"
        SummaryInstallPartLabel = "Partición instalador ({0})"
        SummaryStatusLabel = "Estado"
        LogStartUsb = "Inicio Crear USB Win11"
        MountedMediaText = "Usar ISO/medio ya montado {0}  [{1}, {2}]"
        LabIsoText = "Montar ISO del lab {0}  [{1}]"
        NoLabel = "sin etiqueta"
        InstallMediaAvailable = "Medio de instalación disponible:"
        ManualMediaOption = "Escribir manualmente una letra montada o una ISO del lab"
        MountedIsoHint = "Si ya tenías la ISO montada, elige la opción de unidad ya montada."
        MediaPrompt = "Número, letra montada (ej. I:) o ruta ISO"
        MediaPromptFallback = "Letra ya montada o ISO dentro de {0}, ejemplo I: o {0}\Win11.iso"
        MissingBootWim = "El medio {0} no parece instalador Windows. Falta sources\boot.wim."
        MissingInstallImage = "El medio {0} no tiene sources\install.wim, sources\install.esd ni sources\install.swm."
        MediaNotFound = "No existe el medio indicado: {0}"
        MediaMustIso = "El medio debe ser una ISO o una letra ya montada."
        IsoMustBeInside = "La ISO debe estar dentro de {0}. Cópiala ahí primero para mantener limpio el lab."
        MountingIso = "Montando ISO..."
        CannotGetIsoLetter = "No pude obtener la letra de la ISO montada."
        BootOtherWarning = "Aviso: para arrancar uso boot.wim exacto; no usaré otros boot.* de images."
        SourceMountedIso = "ISO montada"
        SourceLabImages = "Trabajo\images"
        BootSelectionTitle = "Orígenes boot.wim disponibles:"
        BootSelectionPrompt = "Opción de arranque (INTRO = {0})"
        BootSelectionInvalid = "Opción boot no válida."
        BootCopiesAs = "se copia como sources\boot.wim"
        SwmMissing = "Hay SWM en {0}, pero falta install.swm. Deben estar install.swm, install2.swm, etc."
        MultipleInstallTypes = "Hay más de un tipo de install.* en {0} ({1}). Deja solo WIM, solo ESD o solo SWM."
        NoInstallPayload = "No encuentro install.wim, install.esd ni install*.swm en {0} ni en {1}."
        DiskReadFailed = "No pude leer la lista de discos."
        DisksAvailable = "Discos disponibles:"
        DiskNumberPrompt = "Número del USB que se va a BORRAR"
        InvalidDiskNumber = "Número de disco no válido."
        RefuseSystemDisk = "El disco {0} es de arranque/sistema. No lo voy a tocar."
        NoPartitionsVisible = "  Sin particiones visibles."
        NotExternalWarn1 = "AVISO: este disco no aparece como USB/SD/MMC."
        NotExternalWarn2 = "Windows lo muestra como BusType: {0}"
        NotExternalWarn3 = "Si es una caja USB o adaptador, puede ser normal. Si no estás seguro, cancela."
        UnderstandDisk = "ENTIENDO DISCO {0}"
        TypeExactToContinue = "Escribe exactamente '{0}' para seguir con este disco"
        CancelNotUsb = "Cancelado porque el disco no parecía USB."
        RunningDiskPart = "Ejecutando DiskPart: {0}"
        DiskPartFailed = "DiskPart falló. Revisa {0}"
        CleanRetry = "Reintentando limpiar el USB ({0}/{1})..."
        CleanAttemptFailed = "El intento de clean {0} falló. Revisa {1}"
        CleanManualTitle = "Windows sigue sin poder limpiar el USB automáticamente."
        CleanManualHelp1 = "Puedes desconectar/conectar el USB o limpiarlo manualmente con Administración de discos/DiskPart."
        CleanManualHelp2 = "No cierres esta ventana. Cuando el USB esté preparado, vuelve aquí."
        CleanManualPrompt = "Pulsa INTRO para comprobar el USB y continuar"
        CleaningDisk = "Limpiando disco {0}..."
        StateAfterClean = "Estado tras clean: {0}"
        InitGpt = "Inicializando disco {0} como GPT para UEFI..."
        ConvertGpt = "Convirtiendo disco {0} de MBR a GPT para UEFI..."
        AlreadyGpt = "El disco {0} ya está GPT después de clean; continúo."
        UnexpectedStyle = "Estado de partición inesperado después de clean: {0}"
        NotGpt = "El disco {0} no quedó como GPT. Estado actual: {1}"
        StillPartitions = "El disco {0} todavía tiene particiones después de limpiar/inicializar. No continúo."
        SelectedDisk = "DISCO SELECCIONADO:"
        CurrentPartitions = "Particiones actuales:"
        ErasePhrase = "BORRAR DISCO {0}"
        DeleteWarning = "Esto eliminará todas las particiones del disco {0}."
        ErasePrompt = "Escribe exactamente '{0}' para continuar"
        CancelBadConfirm = "Cancelado por confirmación incorrecta."
        RobocopyFailed = "Robocopy falló con código {0}."
        CopyBootSkeleton = "Copiando arranque FAT32 sin sources completo..."
        CopyBootWimToFat32 = "Copiando el boot.wim elegido a sources de FAT32..."
        BootCopyMissing = "No se copió boot.wim en {0}."
        BootCopySizeMismatch = "El tamaño de boot.wim no coincide. Origen: {0}. Destino: {1}."
        BootCopyDone = "boot.wim copiado a FAT32: {0} [{1}]"
        CopyInstallFrom = "Copiando install.* desde {0} a {1}..."
        InstallCopyMissing = "No se copió {0} en {1}."
        InstallCopySizeMismatch = "El tamaño de {0} no coincide. Origen: {1}. Destino: {2}."
        InstallCopyDone = "{0} copiado a {1}: {2} [{3}]"
        InstallMedia = "Medio de instalación: {0}"
        BootLine = "Boot.wim: {0} ({1})"
        InstallLine = "Install.*: {0} ({1}: {2})"
        PreparingDisk = "Preparando disco..."
        CreatingBootPartition = "Creando partición FAT32 de arranque ({0} MB)..."
        CreatingInstallPartition = "Creando partición {0} Basic Data para instalador..."
        CannotGetLetters = "No pude obtener las letras asignadas a las particiones creadas."
        PartitionsCreated = "Particiones creadas:"
        Fat32BootLine = "  FAT32: {0}"
        InstallPartitionLine = "  {0}: {1}"
        CopyIsoSkeleton = "Copiando esqueleto de la ISO al {0} sin boot.wim/install.*..."
        UsbReady = "USB Windows 11 preparado."
        UsbCopySummary = "Copia de imágenes finalizada:"
        UsbBootWimCopied = "  boot.wim -> FAT32: {0} [{1}]"
        UsbInstallCopied = "  {0} -> {1}: {2} [{3}]"
        UsbPartitionsSummary = "Particiones:"
        UsbBootLine = "  FAT32 arranque: {0}"
        UsbInstallLine = "  {0} instalador: {1}"
        DismountingIso = "Desmontando ISO..."
        PressEnterExit = "Pulsa INTRO para salir"
        DiskColNumber = "Número"
        DiskColName = "Nombre"
        DiskColBus = "Bus"
        DiskColSize = "Tamaño"
        DiskColStyle = "Estilo"
        DiskColBoot = "Arranque"
        DiskColSystem = "Sistema"
        DiskColOffline = "Offline"
        DiskColReadOnly = "SoloLectura"
        DiskColState = "Estado"
        DiskColSerial = "Serie"
        PartColNumber = "Partición"
        PartColLetter = "Letra"
        PartColSize = "Tamaño"
        PartColLabel = "Etiqueta"
        PartColFs = "Sistema"
    }
    fr = @{
        UsbBannerTitle = "CRÉER CLÉ USB WINDOWS 11 UEFI/GPT"
        StepSelectMedia = "Sélectionner le média source et les images Windows"
        StepSelectDisk = "Sélectionner la clé USB et vérifier la vitesse du port"
        StepPlanAndConfirm = "Vérifier le plan d'exécution et confirmer l'effacement"
        StepPreparePartitions = "Nettoyer le disque et créer les partitions UEFI/GPT"
        StepCopyPayload = "Copier les fichiers de démarrage et les images sur la clé USB"
        UsbPlanTitle = "Plan de préparation USB"
        UsbSummaryTitle = "Résumé final de la clé USB"
        PlanModeLabel = "Mode"
        PlanModeFull = "Clé USB complète Windows 11 (GPT : FAT32 + {0})"
        PlanModePartitionsOnly = "Partitions uniquement (GPT : FAT32 + {0})"
        PlanMediaLabel = "Média de base"
        PlanBootLabel = "Image de démarrage"
        PlanInstallLabel = "Image d'installation"
        PlanTargetDiskLabel = "Disque cible"
        PlanUsbSpeedLabel = "Vitesse USB"
        PlanPartitionsLabel = "Schéma"
        SummaryBootPartLabel = "Partition démarrage FAT32"
        SummaryInstallPartLabel = "Partition installateur ({0})"
        SummaryStatusLabel = "État"
        LogStartUsb = "Début création USB Win11"
        MountedMediaText = "Utiliser ISO/média déjà monté {0}  [{1}, {2}]"
        LabIsoText = "Monter l'ISO du lab {0}  [{1}]"
        NoLabel = "sans étiquette"
        InstallMediaAvailable = "Média d'installation disponible :"
        ManualMediaOption = "Taper manuellement une lettre montée ou une ISO du lab"
        MountedIsoHint = "Si l'ISO est déjà montée, choisissez l'option de lecteur monté."
        MediaPrompt = "Numéro, lettre montée (ex. I:) ou chemin ISO"
        MediaPromptFallback = "Lettre déjà montée ou ISO dans {0}, exemple I: ou {0}\Win11.iso"
        MissingBootWim = "Le média {0} ne ressemble pas à un installateur Windows. sources\boot.wim manque."
        MissingInstallImage = "Le média {0} ne contient pas sources\install.wim, sources\install.esd ni sources\install.swm."
        MediaNotFound = "Le média indiqué n'existe pas : {0}"
        MediaMustIso = "Le média doit être une ISO ou une lettre déjà montée."
        IsoMustBeInside = "L'ISO doit être dans {0}. Copiez-la là d'abord pour garder le lab propre."
        MountingIso = "Montage de l'ISO..."
        CannotGetIsoLetter = "Impossible d'obtenir la lettre de l'ISO montée."
        BootOtherWarning = "Avis : pour démarrer j'utilise boot.wim exact ; les autres boot.* de images ne seront pas utilisés."
        SourceMountedIso = "ISO montée"
        SourceLabImages = "Trabajo\images"
        BootSelectionTitle = "Sources boot.wim disponibles :"
        BootSelectionPrompt = "Option de démarrage (ENTRÉE = {0})"
        BootSelectionInvalid = "Option boot invalide."
        BootCopiesAs = "copié comme sources\boot.wim"
        SwmMissing = "Il y a du SWM dans {0}, mais install.swm manque. Les fichiers doivent être install.swm, install2.swm, etc."
        MultipleInstallTypes = "Il y a plusieurs types install.* dans {0} ({1}). Laissez seulement WIM, seulement ESD ou seulement SWM."
        NoInstallPayload = "Je ne trouve pas install.wim, install.esd ni install*.swm dans {0} ni dans {1}."
        DiskReadFailed = "Impossible de lire la liste des disques."
        DisksAvailable = "Disques disponibles :"
        DiskNumberPrompt = "Numéro de la clé USB qui SERA EFFACÉE"
        InvalidDiskNumber = "Numéro de disque invalide."
        RefuseSystemDisk = "Le disque {0} est de démarrage/système. Je ne le toucherai pas."
        NoPartitionsVisible = "  Aucune partition visible."
        NotExternalWarn1 = "AVIS : ce disque n'apparaît pas comme USB/SD/MMC."
        NotExternalWarn2 = "Windows affiche BusType : {0}"
        NotExternalWarn3 = "Si c'est un boîtier USB ou adaptateur, cela peut être normal. Si vous doutez, annulez."
        UnderstandDisk = "JE COMPRENDS DISQUE {0}"
        TypeExactToContinue = "Tapez exactement '{0}' pour continuer avec ce disque"
        CancelNotUsb = "Annulé car le disque ne semblait pas USB."
        RunningDiskPart = "Exécution de DiskPart : {0}"
        DiskPartFailed = "DiskPart a échoué. Revoyez {0}"
        CleanRetry = "Nouvel essai de nettoyage USB ({0}/{1})..."
        CleanAttemptFailed = "La tentative clean {0} a échoué. Revoyez {1}"
        CleanManualTitle = "Windows ne peut toujours pas nettoyer la clé USB automatiquement."
        CleanManualHelp1 = "Vous pouvez débrancher/rebrancher la clé USB ou la nettoyer manuellement avec Gestion des disques/DiskPart."
        CleanManualHelp2 = "Ne fermez pas cette fenêtre. Quand la clé USB est prête, revenez ici."
        CleanManualPrompt = "Appuyez sur ENTRÉE pour vérifier la clé USB et continuer"
        CleaningDisk = "Nettoyage du disque {0}..."
        StateAfterClean = "État après clean : {0}"
        InitGpt = "Initialisation du disque {0} en GPT pour UEFI..."
        ConvertGpt = "Conversion du disque {0} de MBR vers GPT pour UEFI..."
        AlreadyGpt = "Le disque {0} est déjà GPT après clean ; je continue."
        UnexpectedStyle = "Style de partition inattendu après clean : {0}"
        NotGpt = "Le disque {0} n'est pas resté en GPT. État actuel : {1}"
        StillPartitions = "Le disque {0} a encore des partitions après nettoyage/initialisation. Je ne continue pas."
        SelectedDisk = "DISQUE SÉLECTIONNÉ :"
        CurrentPartitions = "Partitions actuelles :"
        ErasePhrase = "EFFACER DISQUE {0}"
        DeleteWarning = "Cela supprimera toutes les partitions du disque {0}."
        ErasePrompt = "Tapez exactement '{0}' pour continuer"
        CancelBadConfirm = "Annulé car la confirmation était incorrecte."
        RobocopyFailed = "Robocopy a échoué avec le code {0}."
        CopyBootSkeleton = "Copie du démarrage FAT32 sans sources complet..."
        CopyBootWimToFat32 = "Copie du boot.wim choisi vers sources FAT32..."
        BootCopyMissing = "boot.wim n'a pas été copié vers {0}."
        BootCopySizeMismatch = "La taille de boot.wim ne correspond pas. Source : {0}. Destination : {1}."
        BootCopyDone = "boot.wim copié vers FAT32 : {0} [{1}]"
        CopyInstallFrom = "Copie de install.* depuis {0} vers {1}..."
        InstallCopyMissing = "{0} n'a pas été copié vers {1}."
        InstallCopySizeMismatch = "La taille de {0} ne correspond pas. Source : {1}. Destination : {2}."
        InstallCopyDone = "{0} copié vers {1} : {2} [{3}]"
        InstallMedia = "Média d'installation : {0}"
        BootLine = "Boot.wim : {0} ({1})"
        InstallLine = "Install.* : {0} ({1} : {2})"
        PreparingDisk = "Préparation du disque..."
        CreatingBootPartition = "Création de la partition FAT32 de démarrage ({0} MB)..."
        CreatingInstallPartition = "Création de la partition installateur {0} Basic Data..."
        CannotGetLetters = "Impossible d'obtenir les lettres assignées aux partitions créées."
        PartitionsCreated = "Partitions créées :"
        Fat32BootLine = "  FAT32 : {0}"
        InstallPartitionLine = "  {0} : {1}"
        CopyIsoSkeleton = "Copie du squelette ISO vers {0} sans boot.wim/install.*..."
        UsbReady = "USB Windows 11 préparé."
        UsbCopySummary = "Copie des images terminée :"
        UsbBootWimCopied = "  boot.wim -> FAT32 : {0} [{1}]"
        UsbInstallCopied = "  {0} -> {1} : {2} [{3}]"
        UsbPartitionsSummary = "Partitions :"
        UsbBootLine = "  Démarrage FAT32 : {0}"
        UsbInstallLine = "  Installateur {0} : {1}"
        DismountingIso = "Démontage de l'ISO..."
        PressEnterExit = "Appuyez sur ENTRÉE pour quitter"
        DiskColNumber = "Numéro"
        DiskColName = "Nom"
        DiskColBus = "Bus"
        DiskColSize = "Taille"
        DiskColStyle = "Style"
        DiskColBoot = "Démarrage"
        DiskColSystem = "Système"
        DiskColOffline = "HorsLigne"
        DiskColReadOnly = "LectureSeule"
        DiskColState = "État"
        DiskColSerial = "Série"
        PartColNumber = "Partition"
        PartColLetter = "Lettre"
        PartColSize = "Taille"
        PartColLabel = "Étiquette"
        PartColFs = "Système"
    }
    ro = @{
        UsbBannerTitle = "CREARE USB WINDOWS 11 UEFI/GPT"
        StepSelectMedia = "Selectare mediu sursă și imagini Windows"
        StepSelectDisk = "Selectare disc USB și verificare viteză port"
        StepPlanAndConfirm = "Verificare plan de execuție și confirmare ștergere"
        StepPreparePartitions = "Curățare disc și creare partiții UEFI/GPT"
        StepCopyPayload = "Copiere fișiere de boot și imagini pe USB"
        UsbPlanTitle = "Plan de pregătire USB"
        UsbSummaryTitle = "Rezumat final USB pregătit"
        PlanModeLabel = "Mod"
        PlanModeFull = "USB complet Windows 11 (GPT: FAT32 + {0})"
        PlanModePartitionsOnly = "Doar partiții (GPT: FAT32 + {0})"
        PlanMediaLabel = "Mediu de bază"
        PlanBootLabel = "Imagine boot"
        PlanInstallLabel = "Imagine install"
        PlanTargetDiskLabel = "Disc țintă"
        PlanUsbSpeedLabel = "Viteză USB"
        PlanPartitionsLabel = "Schemă"
        SummaryBootPartLabel = "Partiție boot FAT32"
        SummaryInstallPartLabel = "Partiție instalator ({0})"
        SummaryStatusLabel = "Stare"
        LogStartUsb = "Start creare USB Win11"
        MountedMediaText = "Folosește ISO/mediu deja montat {0}  [{1}, {2}]"
        LabIsoText = "Montează ISO din lab {0}  [{1}]"
        NoLabel = "fără etichetă"
        InstallMediaAvailable = "Medii de instalare disponibile:"
        ManualMediaOption = "Scrie manual o literă montată sau un ISO din lab"
        MountedIsoHint = "Dacă ISO-ul este deja montat, alege opțiunea de unitate montată."
        MediaPrompt = "Număr, literă montată (ex. I:) sau cale ISO"
        MediaPromptFallback = "Literă deja montată sau ISO în {0}, exemplu I: sau {0}\Win11.iso"
        MissingBootWim = "Mediul {0} nu pare instalator Windows. Lipsește sources\boot.wim."
        MissingInstallImage = "Mediul {0} nu are sources\install.wim, sources\install.esd sau sources\install.swm."
        MediaNotFound = "Mediul indicat nu există: {0}"
        MediaMustIso = "Mediul trebuie să fie un ISO sau o literă deja montată."
        IsoMustBeInside = "ISO-ul trebuie să fie în {0}. Copiază-l acolo întâi pentru a păstra labul curat."
        MountingIso = "Montez ISO..."
        CannotGetIsoLetter = "Nu am putut obține litera ISO-ului montat."
        BootOtherWarning = "Avertisment: pentru boot folosesc exact boot.wim; alte boot.* din images nu vor fi folosite."
        SourceMountedIso = "ISO montat"
        SourceLabImages = "Trabajo\images"
        BootSelectionTitle = "Surse boot.wim disponibile:"
        BootSelectionPrompt = "Opțiune de pornire (ENTER = {0})"
        BootSelectionInvalid = "Opțiune boot nevalidă."
        BootCopiesAs = "se copiază ca sources\boot.wim"
        SwmMissing = "Există SWM în {0}, dar lipsește install.swm. Trebuie să fie install.swm, install2.swm, etc."
        MultipleInstallTypes = "Există mai multe tipuri install.* în {0} ({1}). Lasă doar WIM, doar ESD sau doar SWM."
        NoInstallPayload = "Nu găsesc install.wim, install.esd sau install*.swm în {0} sau {1}."
        DiskReadFailed = "Nu am putut citi lista de discuri."
        DisksAvailable = "Discuri disponibile:"
        DiskNumberPrompt = "Numărul USB-ului care VA FI ȘTERS"
        InvalidDiskNumber = "Număr de disc invalid."
        RefuseSystemDisk = "Discul {0} este de boot/sistem. Nu îl ating."
        NoPartitionsVisible = "  Fără partiții vizibile."
        NotExternalWarn1 = "AVERTISMENT: acest disc nu apare ca USB/SD/MMC."
        NotExternalWarn2 = "Windows arată BusType: {0}"
        NotExternalWarn3 = "Dacă este o carcasă USB sau adaptor, poate fi normal. Dacă nu ești sigur, anulează."
        UnderstandDisk = "INTELEG DISC {0}"
        TypeExactToContinue = "Tastează exact '{0}' pentru a continua cu acest disc"
        CancelNotUsb = "Anulat deoarece discul nu părea USB."
        RunningDiskPart = "Rulez DiskPart: {0}"
        DiskPartFailed = "DiskPart a eșuat. Verifică {0}"
        CleanRetry = "Reîncerc curățarea USB ({0}/{1})..."
        CleanAttemptFailed = "Încercarea clean {0} a eșuat. Verifică {1}"
        CleanManualTitle = "Windows încă nu poate curăța USB-ul automat."
        CleanManualHelp1 = "Poți scoate/reconecta USB-ul sau îl poți curăța manual cu Disk Management/DiskPart."
        CleanManualHelp2 = "Nu închide această fereastră. Când USB-ul este gata, revino aici."
        CleanManualPrompt = "Apasă ENTER pentru a verifica USB-ul și a continua"
        CleaningDisk = "Curăț discul {0}..."
        StateAfterClean = "Stare după clean: {0}"
        InitGpt = "Inițializez discul {0} ca GPT pentru UEFI..."
        ConvertGpt = "Convertesc discul {0} din MBR în GPT pentru UEFI..."
        AlreadyGpt = "Discul {0} este deja GPT după clean; continui."
        UnexpectedStyle = "Stil de partiție neașteptat după clean: {0}"
        NotGpt = "Discul {0} nu a rămas GPT. Stare curentă: {1}"
        StillPartitions = "Discul {0} încă are partiții după curățare/inițializare. Nu continui."
        SelectedDisk = "DISC SELECTAT:"
        CurrentPartitions = "Partiții curente:"
        ErasePhrase = "STERGE DISC {0}"
        DeleteWarning = "Aceasta va elimina toate partițiile de pe discul {0}."
        ErasePrompt = "Tastează exact '{0}' pentru a continua"
        CancelBadConfirm = "Anulat din cauza confirmării incorecte."
        RobocopyFailed = "Robocopy a eșuat cu codul {0}."
        CopyBootSkeleton = "Copiez boot FAT32 fără sources complet..."
        CopyBootWimToFat32 = "Copiez boot.wim ales în sources FAT32..."
        BootCopyMissing = "boot.wim nu a fost copiat în {0}."
        BootCopySizeMismatch = "Dimensiunea boot.wim nu coincide. Sursă: {0}. Destinație: {1}."
        BootCopyDone = "boot.wim copiat în FAT32: {0} [{1}]"
        CopyInstallFrom = "Copiez install.* din {0} în {1}..."
        InstallCopyMissing = "{0} nu a fost copiat în {1}."
        InstallCopySizeMismatch = "Dimensiunea {0} nu coincide. Sursă: {1}. Destinație: {2}."
        InstallCopyDone = "{0} copiat în {1}: {2} [{3}]"
        InstallMedia = "Mediu de instalare: {0}"
        BootLine = "Boot.wim: {0} ({1})"
        InstallLine = "Install.*: {0} ({1}: {2})"
        PreparingDisk = "Pregătesc discul..."
        CreatingBootPartition = "Creez partiția FAT32 de boot ({0} MB)..."
        CreatingInstallPartition = "Creez partiția de instalator {0} Basic Data..."
        CannotGetLetters = "Nu am putut obține literele asignate partițiilor create."
        PartitionsCreated = "Partiții create:"
        Fat32BootLine = "  FAT32: {0}"
        InstallPartitionLine = "  {0}: {1}"
        CopyIsoSkeleton = "Copiez scheletul ISO în {0} fără boot.wim/install.*..."
        UsbReady = "USB Windows 11 pregătit."
        UsbCopySummary = "Copierea imaginilor finalizată:"
        UsbBootWimCopied = "  boot.wim -> FAT32: {0} [{1}]"
        UsbInstallCopied = "  {0} -> {1}: {2} [{3}]"
        UsbPartitionsSummary = "Partiții:"
        UsbBootLine = "  Boot FAT32: {0}"
        UsbInstallLine = "  Instalator {0}: {1}"
        DismountingIso = "Demontez ISO..."
        PressEnterExit = "Apasă ENTER pentru ieșire"
        DiskColNumber = "Număr"
        DiskColName = "Nume"
        DiskColBus = "Bus"
        DiskColSize = "Dimensiune"
        DiskColStyle = "Stil"
        DiskColBoot = "Boot"
        DiskColSystem = "Sistem"
        DiskColOffline = "Offline"
        DiskColReadOnly = "DoarCitire"
        DiskColState = "Stare"
        DiskColSerial = "Serie"
        PartColNumber = "Partiție"
        PartColLetter = "Literă"
        PartColSize = "Dimensiune"
        PartColLabel = "Etichetă"
        PartColFs = "Sistem"
    }
    de = @{
        UsbBannerTitle = "WINDOWS 11 UEFI/GPT-USB ERSTELLEN"
        StepSelectMedia = "Quellmedium und Windows-Images auswählen"
        StepSelectDisk = "USB-Datenträger wählen und Anschlussgeschwindigkeit prüfen"
        StepPlanAndConfirm = "Ausführungsplan prüfen und Löschen bestätigen"
        StepPreparePartitions = "Datenträger bereinigen und UEFI/GPT-Partitionen erstellen"
        StepCopyPayload = "Bootdateien und Windows-Images auf USB kopieren"
        UsbPlanTitle = "USB-Vorbereitungsplan"
        UsbSummaryTitle = "Zusammenfassung des vorbereiteten USB-Laufwerks"
        PlanModeLabel = "Modus"
        PlanModeFull = "Vollständiger Windows 11 USB (GPT: FAT32 + {0})"
        PlanModePartitionsOnly = "Nur Partitionen (GPT: FAT32 + {0})"
        PlanMediaLabel = "Basismedium"
        PlanBootLabel = "Boot-Image"
        PlanInstallLabel = "Install-Image"
        PlanTargetDiskLabel = "Zieldatenträger"
        PlanUsbSpeedLabel = "USB-Geschwindigkeit"
        PlanPartitionsLabel = "Layout"
        SummaryBootPartLabel = "FAT32-Bootpartition"
        SummaryInstallPartLabel = "Installer-Partition ({0})"
        SummaryStatusLabel = "Status"
        LogStartUsb = "Start Windows 11 USB erstellen"
        MountedMediaText = "Bereits gemountete ISO/Medium verwenden {0}  [{1}, {2}]"
        LabIsoText = "Lab-ISO mounten {0}  [{1}]"
        NoLabel = "kein Label"
        InstallMediaAvailable = "Verfügbare Installationsmedien:"
        ManualMediaOption = "Gemounteten Laufwerksbuchstaben oder Lab-ISO manuell eingeben"
        MountedIsoHint = "Wenn die ISO bereits gemountet ist, wählen Sie die gemountete Laufwerksoption."
        MediaPrompt = "Nummer, gemounteter Buchstabe (z.B. I:) oder ISO-Pfad"
        MediaPromptFallback = "Bereits gemounteter Buchstabe oder ISO in {0}, Beispiel I: oder {0}\Win11.iso"
        MissingBootWim = "Medium {0} sieht nicht wie Windows-Setup aus. sources\boot.wim fehlt."
        MissingInstallImage = "Medium {0} enthält kein sources\install.wim, sources\install.esd oder sources\install.swm."
        MediaNotFound = "Angegebenes Medium existiert nicht: {0}"
        MediaMustIso = "Das Medium muss eine ISO oder ein bereits gemounteter Laufwerksbuchstabe sein."
        IsoMustBeInside = "Die ISO muss in {0} liegen. Kopieren Sie sie zuerst dorthin, um das Lab sauber zu halten."
        MountingIso = "ISO wird gemountet..."
        CannotGetIsoLetter = "Der Laufwerksbuchstabe der gemounteten ISO konnte nicht ermittelt werden."
        BootOtherWarning = "Hinweis: für den Start nutze ich genau boot.wim; andere boot.* in images werden nicht verwendet."
        SourceMountedIso = "Gemountete ISO"
        SourceLabImages = "Trabajo\images"
        BootSelectionTitle = "Verfügbare boot.wim Quellen:"
        BootSelectionPrompt = "Startoption (EINGABE = {0})"
        BootSelectionInvalid = "Ungültige Boot-Option."
        BootCopiesAs = "wird als sources\boot.wim kopiert"
        SwmMissing = "In {0} gibt es SWM, aber install.swm fehlt. Es müssen install.swm, install2.swm usw. vorhanden sein."
        MultipleInstallTypes = "Es gibt mehr als einen install.* Typ in {0} ({1}). Lassen Sie nur WIM, nur ESD oder nur SWM."
        NoInstallPayload = "Ich finde install.wim, install.esd oder install*.swm weder in {0} noch in {1}."
        DiskReadFailed = "Die Datenträgerliste konnte nicht gelesen werden."
        DisksAvailable = "Verfügbare Datenträger:"
        DiskNumberPrompt = "USB-Datenträgernummer, die GELÖSCHT WIRD"
        InvalidDiskNumber = "Ungültige Datenträgernummer."
        RefuseSystemDisk = "Datenträger {0} ist Boot/System. Ich fasse ihn nicht an."
        NoPartitionsVisible = "  Keine sichtbaren Partitionen."
        NotExternalWarn1 = "WARNUNG: dieser Datenträger erscheint nicht als USB/SD/MMC."
        NotExternalWarn2 = "Windows zeigt BusType: {0}"
        NotExternalWarn3 = "Bei USB-Gehäuse oder Adapter kann das normal sein. Wenn unsicher, abbrechen."
        UnderstandDisk = "ICH VERSTEHE DATENTRAEGER {0}"
        TypeExactToContinue = "Geben Sie exakt '{0}' ein, um mit diesem Datenträger fortzufahren"
        CancelNotUsb = "Abgebrochen, weil der Datenträger nicht wie USB aussah."
        RunningDiskPart = "DiskPart wird ausgeführt: {0}"
        DiskPartFailed = "DiskPart ist fehlgeschlagen. Prüfen Sie {0}"
        CleanRetry = "USB-Bereinigung wird erneut versucht ({0}/{1})..."
        CleanAttemptFailed = "Clean-Versuch {0} ist fehlgeschlagen. Prüfen Sie {1}"
        CleanManualTitle = "Windows kann den USB-Datenträger weiterhin nicht automatisch bereinigen."
        CleanManualHelp1 = "Sie können den USB-Datenträger neu einstecken oder manuell mit Datenträgerverwaltung/DiskPart bereinigen."
        CleanManualHelp2 = "Schließen Sie dieses Fenster nicht. Wenn der USB-Datenträger bereit ist, kommen Sie hierher zurück."
        CleanManualPrompt = "Drücken Sie EINGABE, um den USB-Datenträger erneut zu prüfen und fortzufahren"
        CleaningDisk = "Datenträger {0} wird bereinigt..."
        StateAfterClean = "Status nach clean: {0}"
        InitGpt = "Datenträger {0} wird als GPT für UEFI initialisiert..."
        ConvertGpt = "Datenträger {0} wird von MBR zu GPT für UEFI konvertiert..."
        AlreadyGpt = "Datenträger {0} ist nach clean bereits GPT; weiter."
        UnexpectedStyle = "Unerwarteter Partitionsstil nach clean: {0}"
        NotGpt = "Datenträger {0} wurde nicht GPT. Aktueller Status: {1}"
        StillPartitions = "Datenträger {0} hat nach Bereinigung/Initialisierung noch Partitionen. Ich fahre nicht fort."
        SelectedDisk = "AUSGEWÄHLTER DATENTRÄGER:"
        CurrentPartitions = "Aktuelle Partitionen:"
        ErasePhrase = "DATENTRAEGER LOESCHEN {0}"
        DeleteWarning = "Dies entfernt alle Partitionen von Datenträger {0}."
        ErasePrompt = "Geben Sie exakt '{0}' ein, um fortzufahren"
        CancelBadConfirm = "Abgebrochen wegen falscher Bestätigung."
        RobocopyFailed = "Robocopy ist mit Code {0} fehlgeschlagen."
        CopyBootSkeleton = "FAT32-Bootdateien ohne vollständige sources werden kopiert..."
        CopyBootWimToFat32 = "Ausgewählte boot.wim wird nach FAT32 sources kopiert..."
        BootCopyMissing = "boot.wim wurde nicht nach {0} kopiert."
        BootCopySizeMismatch = "boot.wim Größe stimmt nicht. Quelle: {0}. Ziel: {1}."
        BootCopyDone = "boot.wim nach FAT32 kopiert: {0} [{1}]"
        CopyInstallFrom = "install.* wird von {0} nach {1} kopiert..."
        InstallCopyMissing = "{0} wurde nicht nach {1} kopiert."
        InstallCopySizeMismatch = "{0} Größe stimmt nicht. Quelle: {1}. Ziel: {2}."
        InstallCopyDone = "{0} nach {1} kopiert: {2} [{3}]"
        InstallMedia = "Installationsmedium: {0}"
        BootLine = "Boot.wim: {0} ({1})"
        InstallLine = "Install.*: {0} ({1}: {2})"
        PreparingDisk = "Datenträger wird vorbereitet..."
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
        PressEnterExit = "EINGABETASTE drücken zum Beenden"
        DiskColNumber = "Nummer"
        DiskColName = "Name"
        DiskColBus = "Bus"
        DiskColSize = "Größe"
        DiskColStyle = "Stil"
        DiskColBoot = "Boot"
        DiskColSystem = "System"
        DiskColOffline = "Offline"
        DiskColReadOnly = "NurLesen"
        DiskColState = "Status"
        DiskColSerial = "Seriennr"
        PartColNumber = "Partition"
        PartColLetter = "Buchstabe"
        PartColSize = "Größe"
        PartColLabel = "Label"
        PartColFs = "Dateisystem"
    }
}

Add-Content -LiteralPath $LogPath -Value ("[{0}] {1}" -f (Get-Date -Format "yyyy-MM-dd HH:mm:ss"), (L "LogStartUsb")) -Encoding UTF8

function Write-Step {
    param(
        [string]$Message,
        [ConsoleColor]$Color = [ConsoleColor]::Gray
    )

    switch ($Color) {
        ([ConsoleColor]::Green) { Write-LabOk $Message; break }
        ([ConsoleColor]::Yellow) { Write-LabWarning $Message; break }
        ([ConsoleColor]::Red) { Write-LabError $Message; break }
        ([ConsoleColor]::Cyan) { Write-LabInfo $Message Cyan; break }
        default { Write-LabInfo $Message $Color; break }
    }
    Add-Content -LiteralPath $LogPath -Value ("[{0}] {1}" -f (Get-Date -Format "yyyy-MM-dd HH:mm:ss"), $Message) -Encoding UTF8
}

function Write-Section {
    param(
        [string]$Title,
        [ConsoleColor]$Color = [ConsoleColor]::Cyan
    )

    Write-LabSection -Title $Title -Color $Color
    Add-Content -LiteralPath $LogPath -Value ("[{0}] {1}" -f (Get-Date -Format "yyyy-MM-dd HH:mm:ss"), $Title) -Encoding UTF8
}

function Format-Bytes {
    param([UInt64]$Bytes)

    return (Format-LabBytes -Bytes $Bytes)
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

    $isoCandidates = @(Get-IsoCandidates | Sort-Object LastWriteTime -Descending)
    if ($options.Count -eq 0 -and $isoCandidates.Count -eq 1) {
        return $isoCandidates[0].FullName
    }

    foreach ($iso in $isoCandidates) {
        $options.Add([pscustomobject]@{
            Kind = "ISO"
            Value = $iso.FullName
            Text = (LF "LabIsoText" $iso.FullName (Format-Bytes -Bytes ([UInt64]$iso.Length)))
        })
    }

    if ($options.Count -gt 0) {
        Write-LabSubsection (L "InstallMediaAvailable")
        for ($i = 0; $i -lt $options.Count; $i++) {
            Write-Host ("  [{0,2}] {1}" -f ($i + 1), $options[$i].Text)
        }
        Write-Host ("  [ 0] {0}" -f (L "ManualMediaOption"))
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
    Write-LabInfo (L "MountingIso") Cyan
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

    Write-LabSubsection (L "BootSelectionTitle")
    for ($i = 0; $i -lt $candidates.Count; $i++) {
        $candidate = $candidates[$i]
        Write-Host ("  [{0,2}] {1}  [{2}]  ({3}; {4})" -f ($i + 1), $candidate.Display, (Format-Bytes -Bytes ([UInt64]$candidate.Length)), $candidate.Source, (L "BootCopiesAs"))
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
                $usbInfo = Get-LabDiskUsbSpeedInfo -DiskNumber $_.Number -Disk $_
                $row = [ordered]@{}
                $row[(L "DiskColNumber")] = $_.Number
                $row[(L "DiskColName")] = $_.FriendlyName
                $row[(L "DiskColBus")] = $_.BusType
                $row[(L "UsbColHeader")] = $usbInfo.UsbDisplay
                $row[(L "DiskColSize")] = Format-Bytes -Bytes ([UInt64]$_.Size)
                $row[(L "DiskColStyle")] = $_.PartitionStyle
                $row[(L "DiskColBoot")] = $_.IsBoot
                $row[(L "DiskColSystem")] = $_.IsSystem
                $row[(L "DiskColOffline")] = $_.IsOffline
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
    param([Nullable[int]]$Number = $DiskNumber)

    if ($null -eq $Number) {
        Write-LabSubsection (L "DisksAvailable")
        Show-DiskTable
        $answer = Read-Host (L "DiskNumberPrompt")
        $parsed = 0
        if (-not [int]::TryParse($answer, [ref]$parsed)) {
            throw (L "InvalidDiskNumber")
        }
        $Number = $parsed
        $script:DiskNumber = $Number
    }

    $disk = Get-Disk -Number $Number -ErrorAction Stop
    if ($disk.IsBoot -or $disk.IsSystem) {
        throw (LF "RefuseSystemDisk" $Number)
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
        [string]$Name,
        [switch]$NoThrow
    )

    $scriptPath = Join-Path $LogsRoot ("diskpart-{0}-{1}.txt" -f $Name, (Get-Date -Format "yyyyMMdd-HHmmss"))
    $outputPath = [System.IO.Path]::ChangeExtension($scriptPath, ".out.txt")
    Set-Content -LiteralPath $scriptPath -Value $Lines -Encoding ASCII

    Write-Step (LF "RunningDiskPart" $scriptPath) Cyan
    $output = & diskpart.exe /s $scriptPath 2>&1
    $output | Set-Content -LiteralPath $outputPath -Encoding UTF8
    $outputText = ($output | Out-String)
    Add-Content -LiteralPath $LogPath -Value $outputText -Encoding UTF8

    $failureText = $outputText
    $harmlessPatterns = @(
        "(?is)(Virtual Disk Service error:|Error del Servicio de disco virtual:|Erreur du service de disque virtuel\s*:|Fehler beim Dienst f.+r virtuelle Datentr.+ger:|Eroare serviciu disc virtual:)\s*(The disk is already online\.?|El disco ya est.+ en l.+nea\.?|Le disque est d.+j.+ en ligne\.?|Der Datentr.+ger ist bereits online\.?|Discul este deja online\.?)"
    )
    foreach ($pattern in $harmlessPatterns) {
        $failureText = [regex]::Replace($failureText, $pattern, "")
    }

    $diskPartErrorPattern = "DiskPart has encountered an error|DiskPart ha encontrado un error|DiskPart a rencontr.+ une erreur|DiskPart hat einen Fehler festgestellt|DiskPart a .+nt.+mpinat o eroare|Virtual Disk Service error|Error del Servicio de disco virtual|Erreur du service de disque virtuel|Fehler beim Dienst f.+r virtuelle Datentr.+ger|Access is denied|Acceso denegado|Acc.+s refus.+|Zugriff verweigert|Accesul este interzis|No se puede|cannot|failed|fall[oó]"
    $failed = ($LASTEXITCODE -ne 0 -or ($failureText -match $diskPartErrorPattern))
    if ($failed) {
        if ($NoThrow) {
            return [pscustomobject]@{
                Success = $false
                ScriptPath = $scriptPath
                OutputPath = $outputPath
            }
        }
        throw (LF "DiskPartFailed" $outputPath)
    }

    if ($NoThrow) {
        return [pscustomobject]@{
            Success = $true
            ScriptPath = $scriptPath
            OutputPath = $outputPath
        }
    }
}

function Invoke-DiskCleanWithRetry {
    param([int]$Number)

    $maxAttempts = 3
    for ($attempt = 1; $attempt -le $maxAttempts; $attempt++) {
        if ($attempt -gt 1) {
            Write-Step (LF "CleanRetry" $attempt $maxAttempts) Yellow
        }

        Set-Disk -Number $Number -IsOffline $false -ErrorAction SilentlyContinue
        Set-Disk -Number $Number -IsReadOnly $false -ErrorAction SilentlyContinue
        Update-Disk -Number $Number -ErrorAction SilentlyContinue

        $result = Invoke-DiskPartScript -Name ("clean-disk{0}-try{1}" -f $Number, $attempt) -NoThrow -Lines @(
            "select disk $Number",
            "attributes disk clear readonly",
            "clean",
            "rescan",
            "exit"
        )

        # DiskPart may return a nonzero exit code for a harmless condition even
        # when clean succeeds. Confirm the disk state and output before retrying.
        Update-Disk -Number $Number -ErrorAction SilentlyContinue
        $diskAfterClean = Get-Disk -Number $Number -ErrorAction SilentlyContinue
        $cleanVerified = $false
        if ($null -ne $diskAfterClean -and $diskAfterClean.PartitionStyle.ToString() -in @("RAW", "MBR", "GPT")) {
            try {
                $partitionsAfterClean = @(Get-Partition -DiskNumber $Number -ErrorAction Stop)
                $cleanVerified = ($partitionsAfterClean.Count -eq 0)
            }
            catch {
                if (($_.CategoryInfo.Category -eq [System.Management.Automation.ErrorCategory]::ObjectNotFound) -or
                    ($_.FullyQualifiedErrorId -match 'ObjectNotFound|CmdletizationQuery_NotFound')) {
                    $cleanVerified = ([int]$diskAfterClean.NumberOfPartitions -eq 0)
                }
                else {
                    $cleanVerified = $false
                }
            }
        }

        $diskPartOutput = ""
        if ($null -ne $result -and -not [string]::IsNullOrWhiteSpace($result.OutputPath) -and (Test-Path -LiteralPath $result.OutputPath -PathType Leaf)) {
            $rawDiskPartOutput = Get-Content -LiteralPath $result.OutputPath -Raw -Encoding UTF8 -ErrorAction SilentlyContinue
            if ($null -ne $rawDiskPartOutput) {
                $diskPartOutput = $rawDiskPartOutput
            }
        }

        $cleanSuccessPatterns = @(
            '(?im)^\s*DiskPart succeeded in cleaning the disk\.?\s*$',
            '(?im)^\s*DiskPart ha limpiado el disco (?:satisfactoriamente|correctamente)\.?\s*$',
            '(?im)^\s*DiskPart a r(?:é|e|\S{1,2})ussi (?:à|a|\S{1,2}) nettoyer le disque\.?\s*$',
            '(?im)^\s*(?:Der Datentr(?:ä|ae|\S{1,2})ger wurde von DiskPart bereinigt|DiskPart hat den Datentr(?:ä|ae|\S{1,2})ger(?: erfolgreich)? bereinigt)\.?\s*$',
            '(?im)^\s*DiskPart a (?:reu(?:ș|ş|s|\S{1,2})it s(?:ă|a|\S{1,2}) cure(?:ț|ţ|t|\S{1,2})e discul|cur(?:ă|a|\S{1,2})(?:ț|ţ|t|\S{1,2})at discul(?: cu succes)?)\.?\s*$'
        )
        $cleanReportedSuccess = $false
        foreach ($cleanPattern in $cleanSuccessPatterns) {
            if ($diskPartOutput -match $cleanPattern) {
                $cleanReportedSuccess = $true
                break
            }
        }

        if (($result.Success -and $cleanVerified) -or $cleanReportedSuccess) {
            return
        }

        Write-Step (LF "CleanAttemptFailed" $attempt $result.OutputPath) Yellow
        Start-Sleep -Seconds (2 + $attempt)
    }

    Write-Host ""
    Write-Step (L "CleanManualTitle") Yellow
    Write-Host (L "CleanManualHelp1") -ForegroundColor Yellow
    Write-Host (L "CleanManualHelp2") -ForegroundColor Yellow
    Read-Host (L "CleanManualPrompt") | Out-Null

    Set-Disk -Number $Number -IsOffline $false -ErrorAction SilentlyContinue
    Set-Disk -Number $Number -IsReadOnly $false -ErrorAction SilentlyContinue
    Update-Disk -Number $Number -ErrorAction SilentlyContinue
    Start-Sleep -Seconds 2
}

function Initialize-DiskForUefiGptUsb {
    param([int]$Number)

    Write-Step (LF "CleaningDisk" $Number) Cyan
    Invoke-DiskCleanWithRetry -Number $Number

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
    param(
        [Microsoft.Management.Infrastructure.CimInstance]$Disk,
        [pscustomobject]$UsbSpeedInfo
    )

    Write-LabSubsection (L "SelectedDisk") Yellow
    $selectedRow = [ordered]@{}
    $selectedRow[(L "DiskColNumber")] = $Disk.Number
    $selectedRow[(L "DiskColName")] = $Disk.FriendlyName
    $selectedRow[(L "DiskColBus")] = $Disk.BusType
    $selectedRow[(L "UsbColHeader")] = if ($null -ne $UsbSpeedInfo) { $UsbSpeedInfo.UsbDisplay } else { "-" }
    $selectedRow[(L "DiskColSize")] = Format-Bytes -Bytes ([UInt64]$Disk.Size)
    $selectedRow[(L "DiskColSerial")] = if ($null -ne $UsbSpeedInfo -and -not [string]::IsNullOrWhiteSpace($UsbSpeedInfo.EffectiveSerial)) { $UsbSpeedInfo.EffectiveSerial } else { $Disk.SerialNumber }
    Write-Host ([pscustomobject]$selectedRow | Format-Table -AutoSize | Out-String -Width 200)

    Write-LabSubsection (L "CurrentPartitions") Yellow
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

    Write-Step ("Robocopy: {0} -> {1}" -f $Source, $Destination) Cyan
    $output = @(& robocopy @arguments 2>&1)
    $exitCode = $LASTEXITCODE
    Add-Content -LiteralPath $LogPath -Value ($output | Out-String) -Encoding UTF8
    if ($exitCode -ge 8) {
        throw (LF "RobocopyFailed" $exitCode)
    }
    Write-Step ("OK Robocopy (exit code {0})" -f $exitCode) Green
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
        Write-LabOk (LF "BootCopyDone" $DestinationBootPath (Format-Bytes -Bytes ([UInt64]$destinationBoot.Length)))
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
    Write-LabInfo (LF "CopyInstallFrom" $PayloadSet.Source $sourcesDir) Cyan
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

        Write-LabOk (LF "InstallCopyDone" $file.Name $InstallFileSystem $destinationFile (Format-Bytes -Bytes ([UInt64]$copiedFile.Length)))
    }
}

try {
    Clear-Host
    Write-LabBanner -Title (L "UsbBannerTitle") -Subtitle $LabRoot

    $totalSteps = if ($CreatePartitionsOnly) { 3 } else { 5 }
    $currentStep = 1

    $mediaRoot = $null
    $bootImage = $null
    $installPayload = $null
    if (-not $CreatePartitionsOnly) {
        Write-LabStepHeader -Step $currentStep -TotalSteps $totalSteps -Title (L "StepSelectMedia")
        $currentStep++

        $mediaRoot = Resolve-InstallMedia -Path $MediaPath
        $bootImage = Get-BootImageFile -MediaRoot $mediaRoot
        $installPayload = Resolve-InstallPayloadSet -MediaRoot $mediaRoot

        Write-LabOk (LF "InstallMedia" $mediaRoot)
        Write-LabOk (LF "BootLine" $bootImage.Path $bootImage.Source)
        Write-LabOk (LF "InstallLine" $installPayload.Source $installPayload.Type ((@($installPayload.Files) | ForEach-Object Name) -join ', '))
    }

    Write-LabStepHeader -Step $currentStep -TotalSteps $totalSteps -Title (L "StepSelectDisk")
    $currentStep++

    $disk = Get-SelectedDisk
    Confirm-DiskLooksExternal -Disk $disk
    $disk = Confirm-LabUsbDiskSpeed -Disk $disk
    $script:DiskNumber = $disk.Number
    $usbSpeedInfo = Get-LabDiskUsbSpeedInfo -DiskNumber $disk.Number -Disk $disk

    Write-LabStepHeader -Step $currentStep -TotalSteps $totalSteps -Title (L "StepPlanAndConfirm")
    $currentStep++

    $planItems = [System.Collections.Generic.List[object]]::new()
    $planItems.Add(@{
        Label = (L "PlanModeLabel")
        Value = $(if ($CreatePartitionsOnly) { LF "PlanModePartitionsOnly" $InstallFileSystem } else { LF "PlanModeFull" $InstallFileSystem })
        Color = [ConsoleColor]::White
    })
    $planItems.Add(@{
        Label = (L "PlanTargetDiskLabel")
        Value = ("#{0} - {1} ({2})" -f $disk.Number, $disk.FriendlyName, (Format-Bytes -Bytes ([UInt64]$disk.Size)))
        Color = [ConsoleColor]::Yellow
    })
    $planItems.Add(@{
        Label = (L "PlanUsbSpeedLabel")
        Value = $usbSpeedInfo.UsbDisplay
        Color = $(if ($usbSpeedInfo.IsUsb2) { [ConsoleColor]::Yellow } elseif ($usbSpeedInfo.IsUsb3) { [ConsoleColor]::Green } else { [ConsoleColor]::Gray })
    })
    $planItems.Add(@{
        Label = (L "PlanPartitionsLabel")
        Value = ("FAT32 ({0} MB, {1}) + {2} ({3})" -f $BootSizeMB, $BootLabel, $InstallFileSystem, $InstallLabel)
        Color = [ConsoleColor]::Gray
    })
    if (-not $CreatePartitionsOnly) {
        $planItems.Add(@{ Label = (L "PlanMediaLabel"); Value = $mediaRoot; Color = [ConsoleColor]::Gray })
        $planItems.Add(@{ Label = (L "PlanBootLabel"); Value = ("{0} ({1})" -f $bootImage.Display, $bootImage.Source); Color = [ConsoleColor]::Gray })
        $planItems.Add(@{
            Label = (L "PlanInstallLabel")
            Value = ("{0}: {1} ({2})" -f $installPayload.Type, ((@($installPayload.Files) | ForEach-Object Name) -join ", "), $installPayload.Source)
            Color = [ConsoleColor]::Gray
        })
    }
    $planItems.Add(@{ Label = (L "Log"); Value = $LogPath; Color = [ConsoleColor]::DarkGray })
    Write-LabStatusPanel -Title (L "UsbPlanTitle") -Items ($planItems.ToArray())

    Confirm-DiskErase -Disk $disk -UsbSpeedInfo $usbSpeedInfo

    Write-LabStepHeader -Step $currentStep -TotalSteps $totalSteps -Title (L "StepPreparePartitions")
    $currentStep++

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
        Write-LabStatusPanel -Title (L "UsbSummaryTitle") -TitleColor Green -Items @(
            @{ Label = (L "SummaryStatusLabel"); Value = (L "PartitionsCreated"); Color = [ConsoleColor]::Green },
            @{ Label = (L "PlanTargetDiskLabel"); Value = ("#{0} - {1}" -f $disk.Number, $disk.FriendlyName); Color = [ConsoleColor]::White },
            @{ Label = (L "PlanUsbSpeedLabel"); Value = $usbSpeedInfo.UsbDisplay; Color = [ConsoleColor]::Cyan },
            @{ Label = (L "SummaryBootPartLabel"); Value = ("{0} [{1}]" -f $bootRoot, $BootLabel); Color = [ConsoleColor]::Green },
            @{ Label = (LF "SummaryInstallPartLabel" $InstallFileSystem); Value = ("{0} [{1}]" -f $installRoot, $InstallLabel); Color = [ConsoleColor]::Green },
            @{ Label = (L "Log"); Value = $LogPath; Color = [ConsoleColor]::DarkGray }
        )
        return
    }

    Write-LabStepHeader -Step $currentStep -TotalSteps $totalSteps -Title (L "StepCopyPayload")

    Copy-BootPartitionFiles -MediaRoot $mediaRoot -BootRoot $bootRoot -BootImagePath $bootImage.Path

    Write-Host ""
    Write-LabInfo (LF "CopyIsoSkeleton" $InstallFileSystem) Cyan
    Invoke-RobocopyCopy -Source $mediaRoot -Destination $installRoot -ExcludeWindowsImages

    Copy-InstallPayloadFiles -PayloadSet $installPayload -InstallRoot $installRoot -InstallFileSystem $InstallFileSystem
    Test-BootWimOnFat32 -BootImagePath $bootImage.Path -DestinationBootPath (Join-Path $bootRoot "sources\boot.wim") -Quiet

    $finalBootWim = Get-Item -LiteralPath (Join-Path $bootRoot "sources\boot.wim") -ErrorAction Stop
    $finalInstallFiles = @(foreach ($file in @($installPayload.Files)) {
        Get-Item -LiteralPath (Join-Path (Join-Path $installRoot "sources") $file.Name) -ErrorAction Stop
    })
    $finalInstallTotal = [UInt64]0
    foreach ($fItem in $finalInstallFiles) { $finalInstallTotal += [UInt64]$fItem.Length }
    $finalInstallText = "{0} [{1}]" -f (($finalInstallFiles | ForEach-Object FullName) -join ", "), (Format-Bytes -Bytes $finalInstallTotal)

    Write-LabStatusPanel -Title (L "UsbSummaryTitle") -TitleColor Green -Items @(
        @{ Label = (L "SummaryStatusLabel"); Value = (L "UsbReady"); Color = [ConsoleColor]::Green },
        @{ Label = (L "PlanTargetDiskLabel"); Value = ("#{0} - {1}" -f $disk.Number, $disk.FriendlyName); Color = [ConsoleColor]::White },
        @{ Label = (L "PlanUsbSpeedLabel"); Value = $usbSpeedInfo.UsbDisplay; Color = $(if ($usbSpeedInfo.IsUsb3) { [ConsoleColor]::Green } else { [ConsoleColor]::Yellow }) },
        @{ Label = (L "SummaryBootPartLabel"); Value = ("{0} ({1})" -f $bootRoot, $BootLabel); Color = [ConsoleColor]::Green },
        @{ Label = (LF "SummaryInstallPartLabel" $InstallFileSystem); Value = ("{0} ({1})" -f $installRoot, $InstallLabel); Color = [ConsoleColor]::Green },
        @{ Label = (L "PlanBootLabel"); Value = ("{0} [{1}]" -f $finalBootWim.FullName, (Format-Bytes -Bytes ([UInt64]$finalBootWim.Length))); Color = [ConsoleColor]::White },
        @{ Label = (L "PlanInstallLabel"); Value = $finalInstallText; Color = [ConsoleColor]::White },
        @{ Label = (L "Log"); Value = $LogPath; Color = [ConsoleColor]::DarkGray }
    )
}
catch {
    Write-Host ""
    Write-LabError (LF "ErrorPrefix" $_.Exception.Message)
    Write-Host ("{0}: {1}" -f (L "Log"), $LogPath) -ForegroundColor Yellow
    Add-Content -LiteralPath $LogPath -Value ("[{0}] ERROR: {1}" -f (Get-Date -Format "yyyy-MM-dd HH:mm:ss"), $_.Exception.Message) -Encoding UTF8
    Add-Content -LiteralPath $LogPath -Value ($_.ScriptStackTrace | Out-String) -Encoding UTF8
}
finally {
    if ($MountedIsoPath) {
        Write-Host ""
        Write-LabInfo (L "DismountingIso") Cyan
        Add-Content -LiteralPath $LogPath -Value ("[{0}] {1} {2}" -f (Get-Date -Format "yyyy-MM-dd HH:mm:ss"), (L "DismountingIso"), $MountedIsoPath) -Encoding UTF8
        Dismount-DiskImage -ImagePath $MountedIsoPath -ErrorAction SilentlyContinue
    }
}

Write-Host ""
Write-Host ("{0}: {1}" -f (L "Log"), $LogPath) -ForegroundColor Yellow
Read-Host (L "PressEnterExit") | Out-Null
exit
