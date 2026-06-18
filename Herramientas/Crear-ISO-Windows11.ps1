#Requires -RunAsAdministrator
[CmdletBinding()]
param(
    [ValidateSet("en", "es", "fr", "ro", "de")]
    [string]$Language = $env:LAB_WIN11_LANG
)

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

. (Join-Path $PSScriptRoot "Lab-Idioma.ps1")
Initialize-LabLanguage -Language $Language | Out-Null

Add-LabTranslations @{
    en = @{
        IsoTitle = "Create custom Windows 11 ISO"
        PreparingFolders = "Preparing lab folders"
        MediaFolderExists = "Trabajo\media already contains files. Clean it before copying the ISO base?"
        IsoCandidates = "Available Windows ISO/media sources"
        MountedMedia = "Mounted media {0}  [{1}]"
        LabIso = "Lab ISO {0}  [{1}]"
        ManualSource = "Type a mounted drive letter or ISO path manually"
        SourcePrompt = "Number, mounted drive letter or ISO path"
        SourcePromptFallback = "Mounted drive letter or ISO path"
        MountingIso = "Mounting ISO..."
        CannotGetIsoLetter = "I could not get the mounted ISO drive letter."
        MissingPath = "Selected media does not exist: {0}"
        MediaMustIso = "The selected source must be an ISO file or mounted drive letter."
        MissingWindowsMedia = "The selected source does not look like Windows setup media: {0}"
        MissingBootFile = "Missing required boot file: {0}"
        MissingSetup = "Missing setup.exe: {0}"
        MissingBootWim = "Missing sources\boot.wim."
        MissingInstall = "Missing sources\install.wim, sources\install.esd or sources\install*.swm."
        CopyBaseMedia = "Copying ISO base to Trabajo\media"
        RobocopyFailed = "Robocopy failed with exit code {0}."
        ImagesStage = "Preparing Windows images"
        UsingLabBoot = "Using Trabajo\images\boot.wim"
        AskCopyBootFromIso = "Trabajo\images\boot.wim is missing. Copy boot.wim from the ISO base to Trabajo\images and use it?"
        UsingIsoBoot = "Using boot.wim from ISO base already copied to Trabajo\media."
        UsingLabInstall = "Using Trabajo\images\{0}"
        AskCopyInstallFromIso = "Trabajo\images has no install image. Copy install image from ISO base to Trabajo\images and use it?"
        UsingIsoInstall = "Using install image from ISO base already copied to Trabajo\media."
        MultipleInstallTypes = "More than one install.* type exists in {0}. Keep only one type: WIM, ESD or SWM."
        SwmMissing = "SWM files exist in {0}, but install.swm is missing. Files must be install.swm, install2.swm, etc."
        ReplacingBoot = "Replacing Trabajo\media\sources\boot.wim"
        ReplacingInstall = "Replacing Trabajo\media\sources\install.*"
        ValidateMedia = "Validating prepared media"
        OscdimgMissing = "oscdimg.exe was not found.`r`n`r`noscdimg.exe is not included with standard Windows.`r`nIt is part of Windows ADK / Deployment Tools.`r`nWithout oscdimg.exe this lab cannot create a bootable ISO from this flow."
        OscdimgFound = "oscdimg.exe: {0}"
        OutputPrompt = "Output ISO path or name (ENTER = {0})"
        OverwriteIso = "The ISO already exists. Overwrite it?"
        CreatingIso = "Creating ISO with oscdimg"
        IsoCreated = "ISO created successfully:"
        DismountingIso = "Unmounting ISO..."
        LargeWimNote = "Note: install.wim larger than 4 GB is valid inside an ISO/UDF. It is not split for ISO creation."
        DoneSize = "Size: {0}"
        KeepMediaQuestion = "Keep Trabajo\media for manual review?"
        MediaCleaned = "Trabajo\media cleaned."
        MediaKept = "Trabajo\media kept for review: {0}"
        OutputInsideMedia = "The output ISO cannot be inside Trabajo\media because that folder is temporary."
        MediaPathUnsafe = "Refusing to clean media path outside Trabajo: {0}"
        NoLabel = "no label"
        OscdimgFailed = "oscdimg failed with exit code {0}."
        BaseMedia = "Base media: {0}"
        LogPath = "Log: {0}"
        CheckCustomImages = "Checking custom images in Trabajo\images"
        NoCustomImages = "No boot.wim or install image was found in Trabajo\images. Create ISO cancelled. Add customized images first; this flow should not recreate the original ISO."
        CustomBootFound = "Custom boot.wim: {0}"
        CustomInstallFound = "Custom install image: {0}"
        MissingBootUsesBase = "Trabajo\images\boot.wim is missing. If you continue, boot.wim from the base ISO will be used."
        MissingInstallUsesBase = "Trabajo\images has no install image. If you continue, install.* from the base ISO will be used."
        ContinueWithBaseImageQuestion = "Continue using missing image(s) from the base ISO?"
    }
    es = @{
        IsoTitle = "Crear ISO Windows 11 personalizada"
        PreparingFolders = "Preparando carpetas del lab"
        MediaFolderExists = "Trabajo\media ya contiene archivos. Limpiarla antes de copiar la ISO base?"
        IsoCandidates = "Origenes ISO/medio Windows disponibles"
        MountedMedia = "Medio montado {0}  [{1}]"
        LabIso = "ISO del lab {0}  [{1}]"
        ManualSource = "Escribir manualmente una letra montada o ruta ISO"
        SourcePrompt = "Numero, letra montada o ruta ISO"
        SourcePromptFallback = "Letra montada o ruta ISO"
        MountingIso = "Montando ISO..."
        CannotGetIsoLetter = "No pude obtener la letra de la ISO montada."
        MissingPath = "No existe el medio indicado: {0}"
        MediaMustIso = "El origen debe ser una ISO o una letra ya montada."
        MissingWindowsMedia = "El origen no parece un medio de instalacion Windows: {0}"
        MissingBootFile = "Falta archivo de arranque requerido: {0}"
        MissingSetup = "Falta setup.exe: {0}"
        MissingBootWim = "Falta sources\boot.wim."
        MissingInstall = "Falta sources\install.wim, sources\install.esd o sources\install*.swm."
        CopyBaseMedia = "Copiando ISO base a Trabajo\media"
        RobocopyFailed = "Robocopy fallo con codigo {0}."
        ImagesStage = "Preparando imagenes Windows"
        UsingLabBoot = "Usando Trabajo\images\boot.wim"
        AskCopyBootFromIso = "Falta Trabajo\images\boot.wim. Copiar boot.wim desde la ISO base a Trabajo\images y usarlo?"
        UsingIsoBoot = "Usando boot.wim de la ISO base ya copiado en Trabajo\media."
        UsingLabInstall = "Usando Trabajo\images\{0}"
        AskCopyInstallFromIso = "Trabajo\images no tiene imagen install. Copiar imagen install desde la ISO base a Trabajo\images y usarla?"
        UsingIsoInstall = "Usando imagen install de la ISO base ya copiada en Trabajo\media."
        MultipleInstallTypes = "Hay mas de un tipo install.* en {0}. Deja solo un tipo: WIM, ESD o SWM."
        SwmMissing = "Hay archivos SWM en {0}, pero falta install.swm. Deben estar install.swm, install2.swm, etc."
        ReplacingBoot = "Sustituyendo Trabajo\media\sources\boot.wim"
        ReplacingInstall = "Sustituyendo Trabajo\media\sources\install.*"
        ValidateMedia = "Validando medio preparado"
        OscdimgMissing = "No se encontro oscdimg.exe.`r`n`r`noscdimg.exe no viene de serie con Windows.`r`nForma parte de Windows ADK / Deployment Tools.`r`nSin oscdimg.exe este lab no puede crear una ISO arrancable desde este flujo."
        OscdimgFound = "oscdimg.exe: {0}"
        OutputPrompt = "Ruta o nombre de ISO final (ENTER = {0})"
        OverwriteIso = "La ISO ya existe. Sobrescribirla?"
        CreatingIso = "Creando ISO con oscdimg"
        IsoCreated = "ISO creada correctamente:"
        DismountingIso = "Desmontando ISO..."
        LargeWimNote = "Nota: install.wim mayor de 4 GB es valido dentro de una ISO/UDF. No se divide para crear ISO."
        DoneSize = "Tamano: {0}"
        KeepMediaQuestion = "Quieres conservar Trabajo\media para revisar el contenido?"
        MediaCleaned = "Trabajo\media limpiada."
        MediaKept = "Trabajo\media conservada para revision: {0}"
        OutputInsideMedia = "La ISO de salida no puede estar dentro de Trabajo\media porque esa carpeta es temporal."
        MediaPathUnsafe = "No se permite limpiar una carpeta media fuera de Trabajo: {0}"
        NoLabel = "sin etiqueta"
        OscdimgFailed = "oscdimg fallo con codigo {0}."
        BaseMedia = "Medio base: {0}"
        LogPath = "Log: {0}"
        CheckCustomImages = "Comprobando imagenes personalizadas en Trabajo\images"
        NoCustomImages = "No se encontro boot.wim ni imagen install en Trabajo\images. Creacion de ISO cancelada. Agrega imagenes personalizadas primero; este flujo no debe recrear la ISO original."
        CustomBootFound = "boot.wim personalizado: {0}"
        CustomInstallFound = "Imagen install personalizada: {0}"
        MissingBootUsesBase = "Falta Trabajo\images\boot.wim. Si continuas, se usara boot.wim de la ISO base."
        MissingInstallUsesBase = "Trabajo\images no tiene imagen install. Si continuas, se usara install.* de la ISO base."
        ContinueWithBaseImageQuestion = "Continuar usando la imagen faltante desde la ISO base?"
    }
    fr = @{
        IsoTitle = "Creer une ISO Windows 11 personnalisee"
        PreparingFolders = "Preparation des dossiers du lab"
        MediaFolderExists = "Trabajo\media contient deja des fichiers. Le nettoyer avant de copier la base ISO?"
        IsoCandidates = "Sources ISO/media Windows disponibles"
        MountedMedia = "Media monte {0}  [{1}]"
        LabIso = "ISO du lab {0}  [{1}]"
        ManualSource = "Saisir manuellement une lettre montee ou un chemin ISO"
        SourcePrompt = "Numero, lettre montee ou chemin ISO"
        SourcePromptFallback = "Lettre montee ou chemin ISO"
        MountingIso = "Montage ISO..."
        CannotGetIsoLetter = "Impossible d obtenir la lettre de l ISO montee."
        MissingPath = "Le media selectionne n existe pas: {0}"
        MediaMustIso = "La source selectionnee doit etre un fichier ISO ou une lettre deja montee."
        MissingWindowsMedia = "La source selectionnee ne ressemble pas a un media d installation Windows: {0}"
        MissingBootFile = "Fichier de demarrage requis manquant: {0}"
        MissingSetup = "setup.exe manquant: {0}"
        MissingBootWim = "sources\boot.wim manquant."
        MissingInstall = "sources\install.wim, sources\install.esd ou sources\install*.swm manquant."
        CopyBaseMedia = "Copie de la base ISO vers Trabajo\media"
        RobocopyFailed = "Robocopy a echoue avec le code {0}."
        ImagesStage = "Preparation des images Windows"
        UsingLabBoot = "Utilisation de Trabajo\images\boot.wim"
        AskCopyBootFromIso = "Trabajo\images\boot.wim manque. Copier boot.wim depuis la base ISO vers Trabajo\images et l utiliser?"
        UsingIsoBoot = "Utilisation de boot.wim de la base ISO deja copie dans Trabajo\media."
        UsingLabInstall = "Utilisation de Trabajo\images\{0}"
        AskCopyInstallFromIso = "Trabajo\images ne contient aucune image install. Copier l image install depuis la base ISO vers Trabajo\images et l utiliser?"
        UsingIsoInstall = "Utilisation de l image install de la base ISO deja copiee dans Trabajo\media."
        MultipleInstallTypes = "Plusieurs types install.* existent dans {0}. Gardez un seul type: WIM, ESD ou SWM."
        SwmMissing = "Des fichiers SWM existent dans {0}, mais install.swm manque. Les fichiers doivent etre install.swm, install2.swm, etc."
        ReplacingBoot = "Remplacement de Trabajo\media\sources\boot.wim"
        ReplacingInstall = "Remplacement de Trabajo\media\sources\install.*"
        ValidateMedia = "Validation du media prepare"
        OscdimgMissing = "oscdimg.exe est introuvable.`r`n`r`noscdimg.exe n est pas inclus avec Windows standard.`r`nIl fait partie de Windows ADK / Deployment Tools.`r`nSans oscdimg.exe, ce lab ne peut pas creer une ISO demarrable avec ce flux."
        OscdimgFound = "oscdimg.exe: {0}"
        OutputPrompt = "Chemin ou nom de l ISO finale (ENTREE = {0})"
        OverwriteIso = "L ISO existe deja. L ecraser?"
        CreatingIso = "Creation de l ISO avec oscdimg"
        IsoCreated = "ISO creee correctement:"
        DismountingIso = "Demontage ISO..."
        LargeWimNote = "Note: install.wim superieur a 4 GB est valide dans une ISO/UDF. Il n est pas divise pour creer l ISO."
        DoneSize = "Taille: {0}"
        KeepMediaQuestion = "Conserver Trabajo\media pour verification manuelle?"
        MediaCleaned = "Trabajo\media nettoye."
        MediaKept = "Trabajo\media conserve pour verification: {0}"
        OutputInsideMedia = "L ISO de sortie ne peut pas etre dans Trabajo\media car ce dossier est temporaire."
        MediaPathUnsafe = "Refus de nettoyer un dossier media hors de Trabajo: {0}"
        NoLabel = "sans etiquette"
        OscdimgFailed = "oscdimg a echoue avec le code {0}."
        BaseMedia = "Media base: {0}"
        LogPath = "Log: {0}"
        CheckCustomImages = "Verification des images personnalisees dans Trabajo\images"
        NoCustomImages = "Aucun boot.wim ni image install trouve dans Trabajo\images. Creation ISO annulee. Ajoutez d abord des images personnalisees; ce flux ne doit pas recreer l ISO originale."
        CustomBootFound = "boot.wim personnalise: {0}"
        CustomInstallFound = "Image install personnalisee: {0}"
        MissingBootUsesBase = "Trabajo\images\boot.wim manque. Si vous continuez, boot.wim de l ISO de base sera utilise."
        MissingInstallUsesBase = "Trabajo\images ne contient aucune image install. Si vous continuez, install.* de l ISO de base sera utilise."
        ContinueWithBaseImageQuestion = "Continuer en utilisant les images manquantes depuis l ISO de base?"
    }
    ro = @{
        IsoTitle = "Creeaza ISO Windows 11 personalizata"
        PreparingFolders = "Pregatesc folderele labului"
        MediaFolderExists = "Trabajo\media contine deja fisiere. Il curat inainte sa copiez baza ISO?"
        IsoCandidates = "Surse ISO/media Windows disponibile"
        MountedMedia = "Media montat {0}  [{1}]"
        LabIso = "ISO din lab {0}  [{1}]"
        ManualSource = "Tasteaza manual o litera montata sau o cale ISO"
        SourcePrompt = "Numar, litera montata sau cale ISO"
        SourcePromptFallback = "Litera montata sau cale ISO"
        MountingIso = "Montez ISO..."
        CannotGetIsoLetter = "Nu am putut obtine litera ISO-ului montat."
        MissingPath = "Mediul selectat nu exista: {0}"
        MediaMustIso = "Sursa selectata trebuie sa fie fisier ISO sau litera deja montata."
        MissingWindowsMedia = "Sursa selectata nu pare mediu de instalare Windows: {0}"
        MissingBootFile = "Lipseste fisierul de boot necesar: {0}"
        MissingSetup = "Lipseste setup.exe: {0}"
        MissingBootWim = "Lipseste sources\boot.wim."
        MissingInstall = "Lipseste sources\install.wim, sources\install.esd sau sources\install*.swm."
        CopyBaseMedia = "Copiez baza ISO in Trabajo\media"
        RobocopyFailed = "Robocopy a esuat cu codul {0}."
        ImagesStage = "Pregatesc imaginile Windows"
        UsingLabBoot = "Folosesc Trabajo\images\boot.wim"
        AskCopyBootFromIso = "Lipseste Trabajo\images\boot.wim. Copiez boot.wim din baza ISO in Trabajo\images si il folosesc?"
        UsingIsoBoot = "Folosesc boot.wim din baza ISO deja copiat in Trabajo\media."
        UsingLabInstall = "Folosesc Trabajo\images\{0}"
        AskCopyInstallFromIso = "Trabajo\images nu are imagine install. Copiez imaginea install din baza ISO in Trabajo\images si o folosesc?"
        UsingIsoInstall = "Folosesc imaginea install din baza ISO deja copiata in Trabajo\media."
        MultipleInstallTypes = "Exista mai multe tipuri install.* in {0}. Pastreaza un singur tip: WIM, ESD sau SWM."
        SwmMissing = "Exista fisiere SWM in {0}, dar lipseste install.swm. Fisierele trebuie sa fie install.swm, install2.swm, etc."
        ReplacingBoot = "Inlocuiesc Trabajo\media\sources\boot.wim"
        ReplacingInstall = "Inlocuiesc Trabajo\media\sources\install.*"
        ValidateMedia = "Validez mediul pregatit"
        OscdimgMissing = "oscdimg.exe nu a fost gasit.`r`n`r`noscdimg.exe nu vine inclus in Windows standard.`r`nFace parte din Windows ADK / Deployment Tools.`r`nFara oscdimg.exe, acest lab nu poate crea o ISO bootabila din acest flux."
        OscdimgFound = "oscdimg.exe: {0}"
        OutputPrompt = "Cale sau nume pentru ISO final (ENTER = {0})"
        OverwriteIso = "ISO exista deja. Il suprascriu?"
        CreatingIso = "Creez ISO cu oscdimg"
        IsoCreated = "ISO creat corect:"
        DismountingIso = "Demontez ISO..."
        LargeWimNote = "Nota: install.wim mai mare de 4 GB este valid intr-un ISO/UDF. Nu se imparte pentru crearea ISO."
        DoneSize = "Dimensiune: {0}"
        KeepMediaQuestion = "Pastrezi Trabajo\media pentru verificare manuala?"
        MediaCleaned = "Trabajo\media curatat."
        MediaKept = "Trabajo\media pastrat pentru verificare: {0}"
        OutputInsideMedia = "ISO-ul de iesire nu poate fi in Trabajo\media deoarece acel folder este temporar."
        MediaPathUnsafe = "Refuz sa curat un folder media in afara de Trabajo: {0}"
        NoLabel = "fara eticheta"
        OscdimgFailed = "oscdimg a esuat cu codul {0}."
        BaseMedia = "Mediu baza: {0}"
        LogPath = "Log: {0}"
        CheckCustomImages = "Verific imaginile personalizate in Trabajo\images"
        NoCustomImages = "Nu am gasit boot.wim sau imagine install in Trabajo\images. Crearea ISO a fost anulata. Adauga mai intai imagini personalizate; acest flux nu trebuie sa recreeze ISO-ul original."
        CustomBootFound = "boot.wim personalizat: {0}"
        CustomInstallFound = "Imagine install personalizata: {0}"
        MissingBootUsesBase = "Lipseste Trabajo\images\boot.wim. Daca continui, se va folosi boot.wim din ISO-ul de baza."
        MissingInstallUsesBase = "Trabajo\images nu are imagine install. Daca continui, se va folosi install.* din ISO-ul de baza."
        ContinueWithBaseImageQuestion = "Continui folosind imaginea lipsa din ISO-ul de baza?"
    }
    de = @{
        IsoTitle = "Benutzerdefinierte Windows 11 ISO erstellen"
        PreparingFolders = "Lab-Ordner werden vorbereitet"
        MediaFolderExists = "Trabajo\media enthaelt bereits Dateien. Vor dem Kopieren der ISO-Basis bereinigen?"
        IsoCandidates = "Verfuegbare Windows ISO/Medienquellen"
        MountedMedia = "Gemountetes Medium {0}  [{1}]"
        LabIso = "Lab-ISO {0}  [{1}]"
        ManualSource = "Gemounteten Laufwerksbuchstaben oder ISO-Pfad manuell eingeben"
        SourcePrompt = "Nummer, gemounteter Buchstabe oder ISO-Pfad"
        SourcePromptFallback = "Gemounteter Buchstabe oder ISO-Pfad"
        MountingIso = "ISO wird gemountet..."
        CannotGetIsoLetter = "Der Laufwerksbuchstabe der gemounteten ISO konnte nicht ermittelt werden."
        MissingPath = "Ausgewaehltes Medium existiert nicht: {0}"
        MediaMustIso = "Die ausgewaehlte Quelle muss eine ISO-Datei oder ein gemounteter Laufwerksbuchstabe sein."
        MissingWindowsMedia = "Die ausgewaehlte Quelle sieht nicht wie Windows-Setup-Medium aus: {0}"
        MissingBootFile = "Erforderliche Boot-Datei fehlt: {0}"
        MissingSetup = "setup.exe fehlt: {0}"
        MissingBootWim = "sources\boot.wim fehlt."
        MissingInstall = "sources\install.wim, sources\install.esd oder sources\install*.swm fehlt."
        CopyBaseMedia = "ISO-Basis wird nach Trabajo\media kopiert"
        RobocopyFailed = "Robocopy ist mit Code {0} fehlgeschlagen."
        ImagesStage = "Windows-Images werden vorbereitet"
        UsingLabBoot = "Verwende Trabajo\images\boot.wim"
        AskCopyBootFromIso = "Trabajo\images\boot.wim fehlt. boot.wim aus der ISO-Basis nach Trabajo\images kopieren und verwenden?"
        UsingIsoBoot = "Verwende boot.wim aus der ISO-Basis, bereits nach Trabajo\media kopiert."
        UsingLabInstall = "Verwende Trabajo\images\{0}"
        AskCopyInstallFromIso = "Trabajo\images enthaelt kein install-Image. install-Image aus der ISO-Basis nach Trabajo\images kopieren und verwenden?"
        UsingIsoInstall = "Verwende install-Image aus der ISO-Basis, bereits nach Trabajo\media kopiert."
        MultipleInstallTypes = "Mehr als ein install.* Typ existiert in {0}. Nur einen Typ behalten: WIM, ESD oder SWM."
        SwmMissing = "SWM-Dateien existieren in {0}, aber install.swm fehlt. Dateien muessen install.swm, install2.swm usw. heissen."
        ReplacingBoot = "Trabajo\media\sources\boot.wim wird ersetzt"
        ReplacingInstall = "Trabajo\media\sources\install.* wird ersetzt"
        ValidateMedia = "Vorbereitetes Medium wird validiert"
        OscdimgMissing = "oscdimg.exe wurde nicht gefunden.`r`n`r`noscdimg.exe ist nicht im normalen Windows enthalten.`r`nEs gehoert zu Windows ADK / Deployment Tools.`r`nOhne oscdimg.exe kann dieses Lab mit diesem Ablauf keine bootfaehige ISO erstellen."
        OscdimgFound = "oscdimg.exe: {0}"
        OutputPrompt = "Pfad oder Name der finalen ISO (ENTER = {0})"
        OverwriteIso = "Die ISO existiert bereits. Ueberschreiben?"
        CreatingIso = "ISO wird mit oscdimg erstellt"
        IsoCreated = "ISO erfolgreich erstellt:"
        DismountingIso = "ISO wird unmountet..."
        LargeWimNote = "Hinweis: install.wim groesser als 4 GB ist in einer ISO/UDF gueltig. Fuer ISO-Erstellung wird es nicht geteilt."
        DoneSize = "Groesse: {0}"
        KeepMediaQuestion = "Trabajo\media fuer manuelle Pruefung behalten?"
        MediaCleaned = "Trabajo\media bereinigt."
        MediaKept = "Trabajo\media fuer Pruefung behalten: {0}"
        OutputInsideMedia = "Die Ausgabe-ISO darf nicht in Trabajo\media liegen, weil dieser Ordner temporaer ist."
        MediaPathUnsafe = "Bereinigung eines media-Ordners ausserhalb von Trabajo wird verweigert: {0}"
        NoLabel = "kein Label"
        OscdimgFailed = "oscdimg ist mit Code {0} fehlgeschlagen."
        BaseMedia = "Basismedium: {0}"
        LogPath = "Log: {0}"
        CheckCustomImages = "Benutzerdefinierte Images in Trabajo\images werden geprueft"
        NoCustomImages = "Kein boot.wim und kein install-Image in Trabajo\images gefunden. ISO-Erstellung abgebrochen. Fuegen Sie zuerst angepasste Images hinzu; dieser Ablauf soll die Original-ISO nicht neu erstellen."
        CustomBootFound = "Benutzerdefiniertes boot.wim: {0}"
        CustomInstallFound = "Benutzerdefiniertes install-Image: {0}"
        MissingBootUsesBase = "Trabajo\images\boot.wim fehlt. Wenn Sie fortfahren, wird boot.wim aus der Basis-ISO verwendet."
        MissingInstallUsesBase = "Trabajo\images enthaelt kein install-Image. Wenn Sie fortfahren, wird install.* aus der Basis-ISO verwendet."
        ContinueWithBaseImageQuestion = "Mit fehlenden Images aus der Basis-ISO fortfahren?"
    }
}

$ToolsRoot = $PSScriptRoot
$LabRoot = Split-Path -Parent $ToolsRoot
$WorkRoot = Join-Path $LabRoot "Trabajo"
$IsoRoot = Join-Path $WorkRoot "ISOs"
$ImagesRoot = Join-Path $WorkRoot "images"
$MediaRoot = Join-Path $WorkRoot "media"
$LogsRoot = Join-Path $WorkRoot "Logs"
$LogPath = Join-Path $LogsRoot ("Crear-ISO-Win11-{0}.log" -f (Get-Date -Format "yyyyMMdd-HHmmss"))
$script:MountedIsoPath = $null

$script:IsoLogReady = $false

function Start-IsoLog {
    Ensure-Directory -Path $LogsRoot
    Set-Content -LiteralPath $LogPath -Value ("[{0}] Start Crear ISO Windows 11" -f (Get-Date -Format "yyyy-MM-dd HH:mm:ss")) -Encoding UTF8
    $script:IsoLogReady = $true
}

function Write-IsoLog {
    param([string]$Message)
    if (-not $script:IsoLogReady) { return }
    Add-Content -LiteralPath $LogPath -Value ("[{0}] {1}" -f (Get-Date -Format "yyyy-MM-dd HH:mm:ss"), $Message) -Encoding UTF8
}

function Write-IsoLogRaw {
    param([string]$Line)
    if (-not $script:IsoLogReady) { return }
    Add-Content -LiteralPath $LogPath -Value $Line -Encoding UTF8
}

function Write-IsoSection {
    param([string]$Key)
    $title = L $Key
    Write-LabSection $title
    Write-IsoLog ("== {0} ==" -f $title)
}

function Ensure-Directory {
    param([string]$Path)
    if (-not (Test-Path -LiteralPath $Path -PathType Container)) {
        New-Item -ItemType Directory -Path $Path -Force | Out-Null
    }
}

function Get-DisplayPath {
    param([string]$Path)
    if ($Path.StartsWith($LabRoot, [System.StringComparison]::OrdinalIgnoreCase)) {
        return $Path.Replace($LabRoot, ".")
    }
    return $Path
}

function Test-PreparedMediaPathSafe {
    $resolvedMedia = (Resolve-Path -LiteralPath $MediaRoot -ErrorAction Stop).ProviderPath.TrimEnd("\")
    $resolvedWork = (Resolve-Path -LiteralPath $WorkRoot -ErrorAction Stop).ProviderPath.TrimEnd("\")
    if (-not $resolvedMedia.StartsWith(($resolvedWork + "\"), [System.StringComparison]::OrdinalIgnoreCase)) {
        throw (LF "MediaPathUnsafe" $resolvedMedia)
    }
}

function Clear-MediaFolderIfNeeded {
    Ensure-Directory -Path $MediaRoot
    Test-PreparedMediaPathSafe
    $existing = @(Get-ChildItem -LiteralPath $MediaRoot -Force -ErrorAction SilentlyContinue)
    if ($existing.Count -eq 0) { return }

    if (-not (Confirm-LabYesNo -Question (L "MediaFolderExists") -Default $false)) {
        throw (L "Cancelled")
    }

    Write-IsoLog ("Cleaning Trabajo\media before ISO staging. Items: {0}" -f $existing.Count)
    foreach ($item in $existing) {
        Write-IsoLog ("Remove media item: {0}" -f $item.FullName)
        Remove-Item -LiteralPath $item.FullName -Recurse -Force
    }
}

function Clear-MediaFolderContents {
    Ensure-Directory -Path $MediaRoot
    Test-PreparedMediaPathSafe
    $items = @(Get-ChildItem -LiteralPath $MediaRoot -Force -ErrorAction SilentlyContinue)
    Write-IsoLog ("Cleaning Trabajo\media after ISO flow. Items: {0}" -f $items.Count)
    foreach ($item in $items) {
        Write-IsoLog ("Remove media item: {0}" -f $item.FullName)
        Remove-Item -LiteralPath $item.FullName -Recurse -Force
    }
}

function Test-WindowsIsoRoot {
    param([string]$Root)
    return (Test-Path -LiteralPath (Join-Path $Root "setup.exe") -PathType Leaf) -and
           (Test-Path -LiteralPath (Join-Path $Root "sources\boot.wim") -PathType Leaf)
}

function Assert-WindowsIsoRoot {
    param([string]$Root)

    if (-not (Test-Path -LiteralPath (Join-Path $Root "setup.exe") -PathType Leaf)) {
        throw (LF "MissingSetup" (Join-Path $Root "setup.exe"))
    }
    if (-not (Test-Path -LiteralPath (Join-Path $Root "sources\boot.wim") -PathType Leaf)) {
        throw (L "MissingBootWim")
    }
    if (-not (Get-InstallPayloadSet -SourceDirectory (Join-Path $Root "sources") -AllowNone)) {
        throw (L "MissingInstall")
    }
}

function Get-IsoCandidates {
    if (-not (Test-Path -LiteralPath $IsoRoot -PathType Container)) { return @() }
    return @(Get-ChildItem -LiteralPath $IsoRoot -Recurse -File -Filter "*.iso" -ErrorAction SilentlyContinue | Sort-Object LastWriteTime -Descending)
}

function Get-MountedMediaCandidates {
    $candidates = @()
    $volumes = @(Get-Volume -ErrorAction SilentlyContinue | Where-Object DriveLetter | Sort-Object DriveLetter)
    foreach ($volume in $volumes) {
        $root = "$($volume.DriveLetter):\"
        if (Test-WindowsIsoRoot -Root $root) {
            $label = if ($volume.FileSystemLabel) { $volume.FileSystemLabel } else { (L "NoLabel") }
            $candidates += [pscustomobject]@{
                Kind = "Mounted"
                Value = $root
                Text = (LF "MountedMedia" $root $label)
            }
        }
    }
    return $candidates
}

function Select-BaseMediaSource {
    $options = New-Object System.Collections.Generic.List[object]

    foreach ($mounted in @(Get-MountedMediaCandidates)) { $options.Add($mounted) }
    foreach ($iso in @(Get-IsoCandidates)) {
        $options.Add([pscustomobject]@{
            Kind = "ISO"
            Value = $iso.FullName
            Text = (LF "LabIso" $iso.FullName (Format-LabBytes ([UInt64]$iso.Length)))
        })
    }

    if ($options.Count -gt 0) {
        Write-IsoSection "IsoCandidates"
        for ($i = 0; $i -lt $options.Count; $i++) {
            Write-Host ("{0,2}. {1}" -f ($i + 1), $options[$i].Text)
        }
        Write-Host (" 0. {0}" -f (L "ManualSource"))
        Write-Host ""
        $answer = Read-Host (L "SourcePrompt")
        $number = 0
        if ([int]::TryParse($answer, [ref]$number) -and $number -ge 1 -and $number -le $options.Count) {
            return $options[$number - 1].Value
        }
        if (-not [string]::IsNullOrWhiteSpace($answer) -and $answer.Trim() -ne "0") {
            return $answer.Trim()
        }
    }

    return (Read-Host (L "SourcePromptFallback"))
}

function Resolve-BaseMediaRoot {
    $path = Select-BaseMediaSource
    if ([string]::IsNullOrWhiteSpace($path)) { throw (L "Cancelled") }
    $path = $path.Trim().Trim('"')

    if ($path -match "^[A-Za-z]:\\?$") {
        $root = ($path.Substring(0, 1).ToUpperInvariant() + ":\")
        Assert-WindowsIsoRoot -Root $root
        return $root
    }

    if (-not (Test-Path -LiteralPath $path -PathType Leaf)) {
        throw (LF "MissingPath" $path)
    }

    if ([System.IO.Path]::GetExtension($path) -ine ".iso") {
        throw (L "MediaMustIso")
    }

    Write-Host ""
    Write-Host (L "MountingIso") -ForegroundColor Cyan
    Mount-DiskImage -ImagePath $path | Out-Null
    $script:MountedIsoPath = $path
    Start-Sleep -Seconds 2

    $volume = Get-DiskImage -ImagePath $path | Get-Volume | Where-Object DriveLetter | Select-Object -First 1
    if (-not $volume) { throw (L "CannotGetIsoLetter") }

    $root = "$($volume.DriveLetter):\"
    Assert-WindowsIsoRoot -Root $root
    return $root
}

function Get-InstallPayloadSet {
    param(
        [string]$SourceDirectory,
        [switch]$AllowNone
    )

    if (-not (Test-Path -LiteralPath $SourceDirectory -PathType Container)) {
        if ($AllowNone) { return $null }
        throw (LF "MissingPath" $SourceDirectory)
    }

    $wim = Get-Item -LiteralPath (Join-Path $SourceDirectory "install.wim") -ErrorAction SilentlyContinue
    $esd = Get-Item -LiteralPath (Join-Path $SourceDirectory "install.esd") -ErrorAction SilentlyContinue
    $swmFiles = @(Get-ChildItem -LiteralPath $SourceDirectory -File -Filter "install*.swm" -ErrorAction SilentlyContinue | Sort-Object Name)

    if ($wim) { return [pscustomobject]@{ Type = "WIM"; Files = @($wim) } }
    if ($esd) { return [pscustomobject]@{ Type = "ESD"; Files = @($esd) } }
    if ($swmFiles.Count -gt 0) {
        if (-not ($swmFiles | Where-Object { $_.Name -ieq "install.swm" })) {
            throw (LF "SwmMissing" $SourceDirectory)
        }
        return [pscustomobject]@{ Type = "SWM"; Files = @($swmFiles) }
    }

    if ($AllowNone) { return $null }
    throw (L "MissingInstall")
}

function Get-CustomImageStatus {
    $boot = Get-Item -LiteralPath (Join-Path $ImagesRoot "boot.wim") -ErrorAction SilentlyContinue
    $installSet = Get-InstallPayloadSet -SourceDirectory $ImagesRoot -AllowNone
    return [pscustomobject]@{
        Boot = $boot
        InstallSet = $installSet
    }
}

function Assert-CustomImagesForIso {
    Write-IsoSection "CheckCustomImages"
    $status = Get-CustomImageStatus
    $hasBoot = $null -ne $status.Boot
    $hasInstall = $null -ne $status.InstallSet

    if (-not $hasBoot -and -not $hasInstall) {
        throw (L "NoCustomImages")
    }

    if ($hasBoot) {
        Write-LabOk (LF "CustomBootFound" (Get-DisplayPath $status.Boot.FullName))
    }
    else {
        Write-Host (L "MissingBootUsesBase") -ForegroundColor Yellow
        Write-IsoLog (L "MissingBootUsesBase")
    }

    if ($hasInstall) {
        $installNames = ((@($status.InstallSet.Files) | ForEach-Object Name) -join ", ")
        Write-LabOk (LF "CustomInstallFound" $installNames)
    }
    else {
        Write-Host (L "MissingInstallUsesBase") -ForegroundColor Yellow
        Write-IsoLog (L "MissingInstallUsesBase")
    }

    if (-not $hasBoot -or -not $hasInstall) {
        if (-not (Confirm-LabYesNo -Question (L "ContinueWithBaseImageQuestion") -Default $false)) {
            throw (L "Cancelled")
        }
    }
}

function Remove-WindowsImageFiles {
    param([string]$SourcesDirectory)
    foreach ($name in @("boot.wim", "boot.esd", "boot.swm", "install.wim", "install.esd")) {
        $path = Join-Path $SourcesDirectory $name
        if (Test-Path -LiteralPath $path -PathType Leaf) {
            try { (Get-Item -LiteralPath $path).IsReadOnly = $false } catch {}
            Remove-Item -LiteralPath $path -Force
        }
    }
    Get-ChildItem -LiteralPath $SourcesDirectory -File -Filter "install*.swm" -ErrorAction SilentlyContinue | Remove-Item -Force
}

function Copy-FileSimple {
    param(
        [string]$Source,
        [string]$Destination
    )
    $destinationDirectory = Split-Path -Parent $Destination
    Ensure-Directory -Path $destinationDirectory
    $copyLine = "  {0} -> {1}" -f (Get-DisplayPath $Source), (Get-DisplayPath $Destination)
    Write-Host $copyLine -ForegroundColor DarkGray
    Write-IsoLog $copyLine
    Copy-Item -LiteralPath $Source -Destination $Destination -Force
}


function Get-RobocopyPath {
    param([string]$Path)
    if ($Path -match '^[A-Za-z]:\$') { return $Path }
    return $Path.TrimEnd('\')
}
function Invoke-RobocopyMirror {
    param(
        [string]$Source,
        [string]$Destination
    )

    Write-IsoSection "CopyBaseMedia"
    $arguments = @(
        (Get-RobocopyPath -Path $Source),
        (Get-RobocopyPath -Path $Destination),
        "/MIR",
        "/COPY:DAT",
        "/DCOPY:DAT",
        "/R:2",
        "/W:2"
    )

    Write-IsoLog ("Robocopy command: robocopy {0}" -f ($arguments -join " "))
    & robocopy @arguments 2>&1 | ForEach-Object {
        $line = $_.ToString()
        Write-Host $line
        Write-IsoLogRaw $line
    }
    $exitCode = $LASTEXITCODE
    Write-IsoLog ("Robocopy exit code: {0}" -f $exitCode)
    if ($exitCode -ge 8) { throw (LF "RobocopyFailed" $exitCode) }
}

function Prepare-BootImage {
    param([string]$BaseMediaRoot)

    $mediaSources = Join-Path $MediaRoot "sources"
    $labBoot = Join-Path $ImagesRoot "boot.wim"
    $isoBoot = Join-Path $BaseMediaRoot "sources\boot.wim"
    $mediaBoot = Join-Path $mediaSources "boot.wim"

    if (Test-Path -LiteralPath $labBoot -PathType Leaf) {
        Write-Host (L "UsingLabBoot") -ForegroundColor Green
        Write-Host (L "ReplacingBoot") -ForegroundColor Cyan
        Copy-FileSimple -Source $labBoot -Destination $mediaBoot
        return
    }

    Write-Host (L "UsingIsoBoot") -ForegroundColor Yellow
    Write-IsoLog (L "UsingIsoBoot")
}

function Prepare-InstallImage {
    param([string]$BaseMediaRoot)

    $mediaSources = Join-Path $MediaRoot "sources"
    $isoSources = Join-Path $BaseMediaRoot "sources"
    $labSet = Get-InstallPayloadSet -SourceDirectory $ImagesRoot -AllowNone

    if (-not $labSet) {
        Write-Host (L "UsingIsoInstall") -ForegroundColor Yellow
        Write-IsoLog (L "UsingIsoInstall")
        return
    }
    Write-Host (LF "UsingLabInstall" ((@($labSet.Files) | ForEach-Object Name) -join ', ')) -ForegroundColor Green
    Write-Host (L "ReplacingInstall") -ForegroundColor Cyan

    foreach ($name in @("install.wim", "install.esd")) {
        $target = Join-Path $mediaSources $name
        if (Test-Path -LiteralPath $target -PathType Leaf) { Remove-Item -LiteralPath $target -Force }
    }
    Get-ChildItem -LiteralPath $mediaSources -File -Filter "install*.swm" -ErrorAction SilentlyContinue | Remove-Item -Force

    foreach ($file in @($labSet.Files)) {
        Copy-FileSimple -Source $file.FullName -Destination (Join-Path $mediaSources $file.Name)
    }
}

function Assert-PreparedIsoMedia {
    Write-IsoSection "ValidateMedia"
    $requiredFiles = @(
        (Join-Path $MediaRoot "setup.exe"),
        (Join-Path $MediaRoot "boot\etfsboot.com"),
        (Join-Path $MediaRoot "efi\microsoft\boot\efisys.bin"),
        (Join-Path $MediaRoot "sources\boot.wim")
    )

    foreach ($path in $requiredFiles) {
        if (-not (Test-Path -LiteralPath $path -PathType Leaf)) {
            if ($path -like "*etfsboot.com" -or $path -like "*efisys.bin") { throw (LF "MissingBootFile" $path) }
            if ($path -like "*setup.exe") { throw (LF "MissingSetup" $path) }
            throw (L "MissingBootWim")
        }
        Write-LabOk (Get-DisplayPath $path)
    }

    $installSet = Get-InstallPayloadSet -SourceDirectory (Join-Path $MediaRoot "sources")
    foreach ($file in @($installSet.Files)) { Write-LabOk (Get-DisplayPath $file.FullName) }
}

function Resolve-OscdimgPath {
    $command = Get-Command "oscdimg.exe" -ErrorAction SilentlyContinue | Select-Object -First 1
    if ($command) { return $command.Source }

    $candidates = @()
    $programFilesX86 = ${env:ProgramFiles(x86)}
    if ($programFilesX86) {
        $candidates += Join-Path $programFilesX86 "Windows Kits\10\Assessment and Deployment Kit\Deployment Tools\amd64\Oscdimg\oscdimg.exe"
        $candidates += Join-Path $programFilesX86 "Windows Kits\10\Assessment and Deployment Kit\Deployment Tools\x86\Oscdimg\oscdimg.exe"
    }
    if ($env:ProgramFiles) {
        $candidates += Join-Path $env:ProgramFiles "Windows Kits\10\Assessment and Deployment Kit\Deployment Tools\amd64\Oscdimg\oscdimg.exe"
    }

    foreach ($candidate in $candidates) {
        if (Test-Path -LiteralPath $candidate -PathType Leaf) { return $candidate }
    }

    if ($programFilesX86) {
        $kitsRoot = Join-Path $programFilesX86 "Windows Kits"
        if (Test-Path -LiteralPath $kitsRoot -PathType Container) {
            $found = Get-ChildItem -LiteralPath $kitsRoot -Recurse -Filter "oscdimg.exe" -File -ErrorAction SilentlyContinue | Select-Object -First 1
            if ($found) { return $found.FullName }
        }
    }

    return $null
}

function Test-OutputIsoOutsideMedia {
    param([string]$OutputIso)
    $mediaFull = [System.IO.Path]::GetFullPath($MediaRoot).TrimEnd('\')
    $outputFull = [System.IO.Path]::GetFullPath($OutputIso)
    if ($outputFull.StartsWith(($mediaFull + '\'), [System.StringComparison]::OrdinalIgnoreCase)) {
        throw (L "OutputInsideMedia")
    }
}

function Resolve-OutputIsoPath {
    $default = Join-Path $IsoRoot "Win11_custom.iso"
    $answer = Read-Host (LF "OutputPrompt" $default)
    if ([string]::IsNullOrWhiteSpace($answer)) { $answer = $default }
    $answer = $answer.Trim().Trim('"')

    if (-not [System.IO.Path]::IsPathRooted($answer)) {
        $answer = Join-Path $IsoRoot $answer
    }
    if ([System.IO.Path]::GetExtension($answer) -eq "") {
        $answer = [System.IO.Path]::ChangeExtension($answer, ".iso")
    }

    Ensure-Directory -Path (Split-Path -Parent $answer)
    Test-OutputIsoOutsideMedia -OutputIso $answer

    if (Test-Path -LiteralPath $answer -PathType Leaf) {
        if (-not (Confirm-LabYesNo -Question (L "OverwriteIso") -Default $false)) { throw (L "Cancelled") }
        Remove-Item -LiteralPath $answer -Force
    }

    return $answer
}

function Invoke-Oscdimg {
    param(
        [string]$OscdimgPath,
        [string]$OutputIso
    )

    $etfsboot = Join-Path $MediaRoot "boot\etfsboot.com"
    $efisys = Join-Path $MediaRoot "efi\microsoft\boot\efisys.bin"
    $bootData = "-bootdata:2#p0,e,b`"$etfsboot`"#pEF,e,b`"$efisys`""
    $commandLine = '"{0}" -m {1} -u1 -udfver102 "{2}" "{3}"' -f $OscdimgPath, $bootData, $MediaRoot, $OutputIso

    Write-IsoSection "CreatingIso"
    Write-Host $commandLine -ForegroundColor DarkGray
    Write-IsoLog ("oscdimg command: {0}" -f $commandLine)

    $previousErrorActionPreference = $ErrorActionPreference
    try {
        $ErrorActionPreference = "Continue"
        $output = & $env:ComSpec /d /c $commandLine 2>&1
        $exitCode = $LASTEXITCODE
    }
    finally {
        $ErrorActionPreference = $previousErrorActionPreference
    }

    foreach ($entry in @($output)) {
        $line = $entry.ToString()
        Write-Host $line
        Write-IsoLogRaw $line
    }

    Write-IsoLog ("oscdimg exit code: {0}" -f $exitCode)
    if ($exitCode -ne 0) { throw (LF "OscdimgFailed" $exitCode) }
}

try {
    foreach ($folder in @($WorkRoot, $IsoRoot, $ImagesRoot, $MediaRoot, $LogsRoot)) { Ensure-Directory -Path $folder }
    Start-IsoLog
    Write-IsoLog ("LabRoot: {0}" -f $LabRoot)
    Write-IsoLog ("WorkRoot: {0}" -f $WorkRoot)
    Write-IsoLog ("MediaRoot: {0}" -f $MediaRoot)
    Write-IsoLog ("ImagesRoot: {0}" -f $ImagesRoot)
    Write-IsoLog ("IsoRoot: {0}" -f $IsoRoot)
    Write-IsoLog ("Language: {0}" -f $Language)

    Clear-Host
    Write-IsoSection "IsoTitle"
    Write-LabWarning (L "LargeWimNote")

    Assert-CustomImagesForIso

    $baseMediaRoot = Resolve-BaseMediaRoot
    Write-LabOk (LF "BaseMedia" $baseMediaRoot)
    Write-IsoLog (LF "BaseMedia" $baseMediaRoot)

    Clear-MediaFolderIfNeeded
    Invoke-RobocopyMirror -Source $baseMediaRoot -Destination $MediaRoot

    Write-IsoSection "ImagesStage"
    Prepare-BootImage -BaseMediaRoot $baseMediaRoot
    Prepare-InstallImage -BaseMediaRoot $baseMediaRoot

    Assert-PreparedIsoMedia

    $oscdimg = Resolve-OscdimgPath
    if (-not $oscdimg) { throw (L "OscdimgMissing") }
    Write-LabOk (LF "OscdimgFound" $oscdimg)
    Write-IsoLog (LF "OscdimgFound" $oscdimg)

    $outputIso = Resolve-OutputIsoPath
    Write-IsoLog ("Output ISO: {0}" -f $outputIso)
    Invoke-Oscdimg -OscdimgPath $oscdimg -OutputIso $outputIso

    $finalIso = Get-Item -LiteralPath $outputIso -ErrorAction Stop
    Write-Host ""
    Write-Host (L "IsoCreated") -ForegroundColor Green
    Write-Host $finalIso.FullName -ForegroundColor Green
    Write-Host (LF "DoneSize" (Format-LabBytes ([UInt64]$finalIso.Length))) -ForegroundColor Green
    Write-IsoLog ("SUCCESS: ISO created: {0} [{1}]" -f $finalIso.FullName, (Format-LabBytes ([UInt64]$finalIso.Length)))
    Write-Host (LF "LogPath" $LogPath) -ForegroundColor DarkGray

    Write-Host ""
    if (Confirm-LabYesNo -Question (L "KeepMediaQuestion") -Default $false) {
        Write-Host (LF "MediaKept" $MediaRoot) -ForegroundColor Yellow
        Write-IsoLog (LF "MediaKept" $MediaRoot)
    }
    else {
        Clear-MediaFolderContents
        Write-Host (L "MediaCleaned") -ForegroundColor Green
        Write-IsoLog (L "MediaCleaned")
    }
}
catch {
    Write-Host ""
    Write-Host (LF "ErrorPrefix" $_.Exception.Message) -ForegroundColor Red
    Write-IsoLog ("FAILED: {0}" -f $_.Exception.Message)
    Write-IsoLogRaw ($_.ScriptStackTrace)
    if ($script:IsoLogReady) {
        Write-Host (LF "LogPath" $LogPath) -ForegroundColor DarkGray
    }
}
finally {
    if ($script:MountedIsoPath) {
        Write-Host ""
        Write-Host (L "DismountingIso") -ForegroundColor Cyan
        Write-IsoLog ("Dismounting ISO: {0}" -f $script:MountedIsoPath)
        Dismount-DiskImage -ImagePath $script:MountedIsoPath -ErrorAction SilentlyContinue
    }
    Write-IsoLog "End Crear ISO Windows 11"
    Write-Host ""
    Read-Host (L "PressEnterExit") | Out-Null
}







