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
        IsoTitle = "CREATE CUSTOM WINDOWS 11 ISO"
        StepCheckCustom = "Verify custom images in Trabajo\images"
        StepSelectBase = "Select base media and review ISO plan"
        StepStageMedia = "Copy base ISO structure to Trabajo\media"
        StepIntegrateImages = "Integrate custom boot.wim and install.* images"
        StepValidateMedia = "Validate staged bootable media"
        StepBuildIso = "Build bootable ISO with oscdimg"
        IsoPlanTitle = "ISO build plan"
        IsoSummaryTitle = "ISO build summary"
        PlanBaseLabel = "Base media"
        PlanBootLabel = "boot.wim source"
        PlanInstallLabel = "install.* source"
        PlanStagingLabel = "Staging folder"
        PlanOscdimgLabel = "oscdimg tool"
        PlanOutputDirLabel = "Output folder"
        SummaryStatusLabel = "Status"
        SummaryIsoPathLabel = "Output ISO"
        SummarySizeLabel = "Size"
        SummaryStagingState = "Staging state"
        BaseSourceTag = "Base ISO"
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
        IsoCreated = "ISO created successfully"
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
        IsoTitle = "CREAR ISO WINDOWS 11 PERSONALIZADA"
        StepCheckCustom = "Comprobar imágenes personalizadas en Trabajo\images"
        StepSelectBase = "Seleccionar medio base y revisar plan de ISO"
        StepStageMedia = "Copiar estructura base de la ISO a Trabajo\media"
        StepIntegrateImages = "Integrar imágenes personalizadas boot.wim e install.*"
        StepValidateMedia = "Validar estructura y arranque del medio preparado"
        StepBuildIso = "Generar ISO arrancable con oscdimg"
        IsoPlanTitle = "Plan de creación de ISO"
        IsoSummaryTitle = "Resumen final de la ISO creada"
        PlanBaseLabel = "Medio base"
        PlanBootLabel = "Origen boot.wim"
        PlanInstallLabel = "Origen install.*"
        PlanStagingLabel = "Carpeta temporal"
        PlanOscdimgLabel = "Herramienta oscdimg"
        PlanOutputDirLabel = "Carpeta de salida"
        SummaryStatusLabel = "Estado"
        SummaryIsoPathLabel = "ISO generada"
        SummarySizeLabel = "Tamaño"
        SummaryStagingState = "Carpeta media"
        BaseSourceTag = "ISO base"
        PreparingFolders = "Preparando carpetas del lab"
        MediaFolderExists = "¿Trabajo\media ya contiene archivos. Limpiarla antes de copiar la ISO base?"
        IsoCandidates = "Orígenes ISO/medio Windows disponibles"
        MountedMedia = "Medio montado {0}  [{1}]"
        LabIso = "ISO del lab {0}  [{1}]"
        ManualSource = "Escribir manualmente una letra montada o ruta ISO"
        SourcePrompt = "Número, letra montada o ruta ISO"
        SourcePromptFallback = "Letra montada o ruta ISO"
        MountingIso = "Montando ISO..."
        CannotGetIsoLetter = "No pude obtener la letra de la ISO montada."
        MissingPath = "No existe el medio indicado: {0}"
        MediaMustIso = "El origen debe ser una ISO o una letra ya montada."
        MissingWindowsMedia = "El origen no parece un medio de instalación Windows: {0}"
        MissingBootFile = "Falta archivo de arranque requerido: {0}"
        MissingSetup = "Falta setup.exe: {0}"
        MissingBootWim = "Falta sources\boot.wim."
        MissingInstall = "Falta sources\install.wim, sources\install.esd o sources\install*.swm."
        CopyBaseMedia = "Copiando ISO base a Trabajo\media"
        RobocopyFailed = "Robocopy falló con código {0}."
        ImagesStage = "Preparando imágenes Windows"
        UsingLabBoot = "Usando Trabajo\images\boot.wim"
        AskCopyBootFromIso = "¿Falta Trabajo\images\boot.wim. Copiar boot.wim desde la ISO base a Trabajo\images y usarlo?"
        UsingIsoBoot = "Usando boot.wim de la ISO base ya copiado en Trabajo\media."
        UsingLabInstall = "Usando Trabajo\images\{0}"
        AskCopyInstallFromIso = "¿Trabajo\images no tiene imagen install. Copiar imagen install desde la ISO base a Trabajo\images y usarla?"
        UsingIsoInstall = "Usando imagen install de la ISO base ya copiada en Trabajo\media."
        MultipleInstallTypes = "Hay más de un tipo install.* en {0}. Deja solo un tipo: WIM, ESD o SWM."
        SwmMissing = "Hay archivos SWM en {0}, pero falta install.swm. Deben estar install.swm, install2.swm, etc."
        ReplacingBoot = "Sustituyendo Trabajo\media\sources\boot.wim"
        ReplacingInstall = "Sustituyendo Trabajo\media\sources\install.*"
        ValidateMedia = "Validando medio preparado"
        OscdimgMissing = "No se encontró oscdimg.exe.`r`n`r`noscdimg.exe no viene de serie con Windows.`r`nForma parte de Windows ADK / Deployment Tools.`r`nSin oscdimg.exe este lab no puede crear una ISO arrancable desde este flujo."
        OscdimgFound = "oscdimg.exe: {0}"
        OutputPrompt = "Ruta o nombre de ISO final (INTRO = {0})"
        OverwriteIso = "¿La ISO ya existe. Sobrescribirla?"
        CreatingIso = "Creando ISO con oscdimg"
        IsoCreated = "ISO creada correctamente"
        DismountingIso = "Desmontando ISO..."
        LargeWimNote = "Nota: install.wim mayor de 4 GB es válido dentro de una ISO/UDF. No se divide para crear ISO."
        DoneSize = "Tamaño: {0}"
        KeepMediaQuestion = "¿Quieres conservar Trabajo\media para revisar el contenido?"
        MediaCleaned = "Trabajo\media limpiada."
        MediaKept = "Trabajo\media conservada para revisión: {0}"
        OutputInsideMedia = "La ISO de salida no puede estar dentro de Trabajo\media porque esa carpeta es temporal."
        MediaPathUnsafe = "No se permite limpiar una carpeta media fuera de Trabajo: {0}"
        NoLabel = "sin etiqueta"
        OscdimgFailed = "oscdimg falló con código {0}."
        BaseMedia = "Medio base: {0}"
        LogPath = "Log: {0}"
        CheckCustomImages = "Comprobando imágenes personalizadas en Trabajo\images"
        NoCustomImages = "No se encontró boot.wim ni imagen install en Trabajo\images. Creación de ISO cancelada. Agrega imágenes personalizadas primero; este flujo no debe recrear la ISO original."
        CustomBootFound = "boot.wim personalizado: {0}"
        CustomInstallFound = "Imagen install personalizada: {0}"
        MissingBootUsesBase = "Falta Trabajo\images\boot.wim. Si continúas, se usará boot.wim de la ISO base."
        MissingInstallUsesBase = "Trabajo\images no tiene imagen install. Si continúas, se usará install.* de la ISO base."
        ContinueWithBaseImageQuestion = "¿Continuar usando la imagen faltante desde la ISO base?"
    }
    fr = @{
        IsoTitle = "CRÉER UNE ISO WINDOWS 11 PERSONNALISÉE"
        StepCheckCustom = "Vérifier les images personnalisées dans Trabajo\images"
        StepSelectBase = "Sélectionner le média de base et vérifier le plan ISO"
        StepStageMedia = "Copier la structure ISO de base vers Trabajo\media"
        StepIntegrateImages = "Intégrer les images personnalisées boot.wim et install.*"
        StepValidateMedia = "Valider le média amorçable préparé"
        StepBuildIso = "Créer l'ISO amorçable avec oscdimg"
        IsoPlanTitle = "Plan de création ISO"
        IsoSummaryTitle = "Résumé final de l'ISO créée"
        PlanBaseLabel = "Média de base"
        PlanBootLabel = "Source boot.wim"
        PlanInstallLabel = "Source install.*"
        PlanStagingLabel = "Dossier temporaire"
        PlanOscdimgLabel = "Outil oscdimg"
        PlanOutputDirLabel = "Dossier de sortie"
        SummaryStatusLabel = "État"
        SummaryIsoPathLabel = "ISO générée"
        SummarySizeLabel = "Taille"
        SummaryStagingState = "Dossier media"
        BaseSourceTag = "ISO de base"
        PreparingFolders = "Préparation des dossiers du lab"
        MediaFolderExists = "Trabajo\media contient déjà des fichiers. Le nettoyer avant de copier la base ISO ?"
        IsoCandidates = "Sources ISO/média Windows disponibles"
        MountedMedia = "Média monté {0}  [{1}]"
        LabIso = "ISO du lab {0}  [{1}]"
        ManualSource = "Saisir manuellement une lettre montée ou un chemin ISO"
        SourcePrompt = "Numéro, lettre montée ou chemin ISO"
        SourcePromptFallback = "Lettre montée ou chemin ISO"
        MountingIso = "Montage ISO..."
        CannotGetIsoLetter = "Impossible d'obtenir la lettre de l'ISO montée."
        MissingPath = "Le média sélectionné n'existe pas : {0}"
        MediaMustIso = "La source sélectionnée doit être un fichier ISO ou une lettre déjà montée."
        MissingWindowsMedia = "La source sélectionnée ne ressemble pas à un média d'installation Windows : {0}"
        MissingBootFile = "Fichier de démarrage requis manquant : {0}"
        MissingSetup = "setup.exe manquant : {0}"
        MissingBootWim = "sources\boot.wim manquant."
        MissingInstall = "sources\install.wim, sources\install.esd ou sources\install*.swm manquant."
        CopyBaseMedia = "Copie de la base ISO vers Trabajo\media"
        RobocopyFailed = "Robocopy a échoué avec le code {0}."
        ImagesStage = "Préparation des images Windows"
        UsingLabBoot = "Utilisation de Trabajo\images\boot.wim"
        AskCopyBootFromIso = "Trabajo\images\boot.wim manque. Copier boot.wim depuis la base ISO vers Trabajo\images et l'utiliser ?"
        UsingIsoBoot = "Utilisation de boot.wim de la base ISO déjà copié dans Trabajo\media."
        UsingLabInstall = "Utilisation de Trabajo\images\{0}"
        AskCopyInstallFromIso = "Trabajo\images ne contient aucune image install. Copier l'image install depuis la base ISO vers Trabajo\images et l'utiliser ?"
        UsingIsoInstall = "Utilisation de l'image install de la base ISO déjà copiée dans Trabajo\media."
        MultipleInstallTypes = "Plusieurs types install.* existent dans {0}. Gardez un seul type : WIM, ESD ou SWM."
        SwmMissing = "Des fichiers SWM existent dans {0}, mais install.swm manque. Les fichiers doivent être install.swm, install2.swm, etc."
        ReplacingBoot = "Remplacement de Trabajo\media\sources\boot.wim"
        ReplacingInstall = "Remplacement de Trabajo\media\sources\install.*"
        ValidateMedia = "Validation du média préparé"
        OscdimgMissing = "oscdimg.exe est introuvable.`r`n`r`noscdimg.exe n'est pas inclus avec Windows standard.`r`nIl fait partie de Windows ADK / Deployment Tools.`r`nSans oscdimg.exe, ce lab ne peut pas créer une ISO démarrable avec ce flux."
        OscdimgFound = "oscdimg.exe : {0}"
        OutputPrompt = "Chemin ou nom de l'ISO finale (ENTRÉE = {0})"
        OverwriteIso = "L'ISO existe déjà. L'écraser ?"
        CreatingIso = "Création de l'ISO avec oscdimg"
        IsoCreated = "ISO créée correctement"
        DismountingIso = "Démontage ISO..."
        LargeWimNote = "Note : install.wim supérieur à 4 Go est valide dans une ISO/UDF. Il n'est pas divisé pour créer l'ISO."
        DoneSize = "Taille : {0}"
        KeepMediaQuestion = "Conserver Trabajo\media pour vérification manuelle ?"
        MediaCleaned = "Trabajo\media nettoyé."
        MediaKept = "Trabajo\media conservé pour vérification : {0}"
        OutputInsideMedia = "L'ISO de sortie ne peut pas être dans Trabajo\media car ce dossier est temporaire."
        MediaPathUnsafe = "Refus de nettoyer un dossier media hors de Trabajo : {0}"
        NoLabel = "sans étiquette"
        OscdimgFailed = "oscdimg a échoué avec le code {0}."
        BaseMedia = "Média base : {0}"
        LogPath = "Log : {0}"
        CheckCustomImages = "Vérification des images personnalisées dans Trabajo\images"
        NoCustomImages = "Aucun boot.wim ni image install trouvé dans Trabajo\images. Création ISO annulée. Ajoutez d'abord des images personnalisées ; ce flux ne doit pas recréer l'ISO originale."
        CustomBootFound = "boot.wim personnalisé : {0}"
        CustomInstallFound = "Image install personnalisée : {0}"
        MissingBootUsesBase = "Trabajo\images\boot.wim manque. Si vous continuez, boot.wim de l'ISO de base sera utilisé."
        MissingInstallUsesBase = "Trabajo\images ne contient aucune image install. Si vous continuez, install.* de l'ISO de base sera utilisé."
        ContinueWithBaseImageQuestion = "Continuer en utilisant les images manquantes depuis l'ISO de base ?"
    }
    ro = @{
        IsoTitle = "CREARE ISO WINDOWS 11 PERSONALIZATĂ"
        StepCheckCustom = "Verificare imagini personalizate în Trabajo\images"
        StepSelectBase = "Selectare mediu de bază și verificare plan ISO"
        StepStageMedia = "Copiere structură ISO de bază în Trabajo\media"
        StepIntegrateImages = "Integrare imagini personalizate boot.wim și install.*"
        StepValidateMedia = "Validare mediu bootabil pregătit"
        StepBuildIso = "Generare ISO bootabil cu oscdimg"
        IsoPlanTitle = "Plan creare ISO"
        IsoSummaryTitle = "Rezumat final ISO creat"
        PlanBaseLabel = "Mediu de bază"
        PlanBootLabel = "Sursă boot.wim"
        PlanInstallLabel = "Sursă install.*"
        PlanStagingLabel = "Folder temporar"
        PlanOscdimgLabel = "Utilitar oscdimg"
        PlanOutputDirLabel = "Folder de ieșire"
        SummaryStatusLabel = "Stare"
        SummaryIsoPathLabel = "ISO generat"
        SummarySizeLabel = "Dimensiune"
        SummaryStagingState = "Folder media"
        BaseSourceTag = "ISO de bază"
        PreparingFolders = "Pregătesc folderele labului"
        MediaFolderExists = "Trabajo\media conține deja fișiere. Îl curăț înainte să copiez baza ISO?"
        IsoCandidates = "Surse ISO/media Windows disponibile"
        MountedMedia = "Media montat {0}  [{1}]"
        LabIso = "ISO din lab {0}  [{1}]"
        ManualSource = "Tastează manual o literă montată sau o cale ISO"
        SourcePrompt = "Număr, literă montată sau cale ISO"
        SourcePromptFallback = "Literă montată sau cale ISO"
        MountingIso = "Montez ISO..."
        CannotGetIsoLetter = "Nu am putut obține litera ISO-ului montat."
        MissingPath = "Mediul selectat nu există: {0}"
        MediaMustIso = "Sursa selectată trebuie să fie fișier ISO sau literă deja montată."
        MissingWindowsMedia = "Sursa selectată nu pare mediu de instalare Windows: {0}"
        MissingBootFile = "Lipsește fișierul de boot necesar: {0}"
        MissingSetup = "Lipsește setup.exe: {0}"
        MissingBootWim = "Lipsește sources\boot.wim."
        MissingInstall = "Lipsește sources\install.wim, sources\install.esd sau sources\install*.swm."
        CopyBaseMedia = "Copiez baza ISO în Trabajo\media"
        RobocopyFailed = "Robocopy a eșuat cu codul {0}."
        ImagesStage = "Pregătesc imaginile Windows"
        UsingLabBoot = "Folosesc Trabajo\images\boot.wim"
        AskCopyBootFromIso = "Lipsește Trabajo\images\boot.wim. Copiez boot.wim din baza ISO în Trabajo\images și îl folosesc?"
        UsingIsoBoot = "Folosesc boot.wim din baza ISO deja copiat în Trabajo\media."
        UsingLabInstall = "Folosesc Trabajo\images\{0}"
        AskCopyInstallFromIso = "Trabajo\images nu are imagine install. Copiez imaginea install din baza ISO în Trabajo\images și o folosesc?"
        UsingIsoInstall = "Folosesc imaginea install din baza ISO deja copiată în Trabajo\media."
        MultipleInstallTypes = "Există mai multe tipuri install.* în {0}. Păstrează un singur tip: WIM, ESD sau SWM."
        SwmMissing = "Există fișiere SWM în {0}, dar lipsește install.swm. Fișierele trebuie să fie install.swm, install2.swm, etc."
        ReplacingBoot = "Înlocuiesc Trabajo\media\sources\boot.wim"
        ReplacingInstall = "Înlocuiesc Trabajo\media\sources\install.*"
        ValidateMedia = "Validez mediul pregătit"
        OscdimgMissing = "oscdimg.exe nu a fost găsit.`r`n`r`noscdimg.exe nu vine inclus în Windows standard.`r`nFace parte din Windows ADK / Deployment Tools.`r`nFără oscdimg.exe, acest lab nu poate crea o ISO bootabilă din acest flux."
        OscdimgFound = "oscdimg.exe: {0}"
        OutputPrompt = "Cale sau nume pentru ISO final (ENTER = {0})"
        OverwriteIso = "ISO există deja. Îl suprascriu?"
        CreatingIso = "Creez ISO cu oscdimg"
        IsoCreated = "ISO creat corect"
        DismountingIso = "Demontez ISO..."
        LargeWimNote = "Notă: install.wim mai mare de 4 GB este valid într-un ISO/UDF. Nu se împarte pentru crearea ISO."
        DoneSize = "Dimensiune: {0}"
        KeepMediaQuestion = "Păstrezi Trabajo\media pentru verificare manuală?"
        MediaCleaned = "Trabajo\media curățat."
        MediaKept = "Trabajo\media păstrat pentru verificare: {0}"
        OutputInsideMedia = "ISO-ul de ieșire nu poate fi în Trabajo\media deoarece acel folder este temporar."
        MediaPathUnsafe = "Refuz să curăț un folder media în afară de Trabajo: {0}"
        NoLabel = "fără etichetă"
        OscdimgFailed = "oscdimg a eșuat cu codul {0}."
        BaseMedia = "Mediu bază: {0}"
        LogPath = "Log: {0}"
        CheckCustomImages = "Verific imaginile personalizate în Trabajo\images"
        NoCustomImages = "Nu am găsit boot.wim sau imagine install în Trabajo\images. Crearea ISO a fost anulată. Adaugă mai întâi imagini personalizate; acest flux nu trebuie să recreeze ISO-ul original."
        CustomBootFound = "boot.wim personalizat: {0}"
        CustomInstallFound = "Imagine install personalizată: {0}"
        MissingBootUsesBase = "Lipsește Trabajo\images\boot.wim. Dacă continui, se va folosi boot.wim din ISO-ul de bază."
        MissingInstallUsesBase = "Trabajo\images nu are imagine install. Dacă continui, se va folosi install.* din ISO-ul de bază."
        ContinueWithBaseImageQuestion = "Continui folosind imaginea lipsă din ISO-ul de bază?"
    }
    de = @{
        IsoTitle = "BENUTZERDEFINIERTE WINDOWS 11 ISO ERSTELLEN"
        StepCheckCustom = "Benutzerdefinierte Images in Trabajo\images prüfen"
        StepSelectBase = "Basismedium wählen und ISO-Plan prüfen"
        StepStageMedia = "ISO-Basisstruktur nach Trabajo\media kopieren"
        StepIntegrateImages = "Benutzerdefinierte boot.wim- und install.*-Images integrieren"
        StepValidateMedia = "Vorbereitetes bootfähiges Medium validieren"
        StepBuildIso = "Bootfähige ISO mit oscdimg erstellen"
        IsoPlanTitle = "ISO-Erstellungsplan"
        IsoSummaryTitle = "Zusammenfassung der erstellten ISO"
        PlanBaseLabel = "Basismedium"
        PlanBootLabel = "Quelle boot.wim"
        PlanInstallLabel = "Quelle install.*"
        PlanStagingLabel = "Temporärer Ordner"
        PlanOscdimgLabel = "oscdimg-Werkzeug"
        PlanOutputDirLabel = "Ausgabeordner"
        SummaryStatusLabel = "Status"
        SummaryIsoPathLabel = "Erstellte ISO"
        SummarySizeLabel = "Größe"
        SummaryStagingState = "Media-Ordner"
        BaseSourceTag = "Basis-ISO"
        PreparingFolders = "Lab-Ordner werden vorbereitet"
        MediaFolderExists = "Trabajo\media enthält bereits Dateien. Vor dem Kopieren der ISO-Basis bereinigen?"
        IsoCandidates = "Verfügbare Windows ISO/Medienquellen"
        MountedMedia = "Gemountetes Medium {0}  [{1}]"
        LabIso = "Lab-ISO {0}  [{1}]"
        ManualSource = "Gemounteten Laufwerksbuchstaben oder ISO-Pfad manuell eingeben"
        SourcePrompt = "Nummer, gemounteter Buchstabe oder ISO-Pfad"
        SourcePromptFallback = "Gemounteter Buchstabe oder ISO-Pfad"
        MountingIso = "ISO wird gemountet..."
        CannotGetIsoLetter = "Der Laufwerksbuchstabe der gemounteten ISO konnte nicht ermittelt werden."
        MissingPath = "Ausgewähltes Medium existiert nicht: {0}"
        MediaMustIso = "Die ausgewählte Quelle muss eine ISO-Datei oder ein gemounteter Laufwerksbuchstabe sein."
        MissingWindowsMedia = "Die ausgewählte Quelle sieht nicht wie Windows-Setup-Medium aus: {0}"
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
        AskCopyInstallFromIso = "Trabajo\images enthält kein install-Image. install-Image aus der ISO-Basis nach Trabajo\images kopieren und verwenden?"
        UsingIsoInstall = "Verwende install-Image aus der ISO-Basis, bereits nach Trabajo\media kopiert."
        MultipleInstallTypes = "Mehr als ein install.* Typ existiert in {0}. Nur einen Typ behalten: WIM, ESD oder SWM."
        SwmMissing = "SWM-Dateien existieren in {0}, aber install.swm fehlt. Dateien müssen install.swm, install2.swm usw. heißen."
        ReplacingBoot = "Trabajo\media\sources\boot.wim wird ersetzt"
        ReplacingInstall = "Trabajo\media\sources\install.* wird ersetzt"
        ValidateMedia = "Vorbereitetes Medium wird validiert"
        OscdimgMissing = "oscdimg.exe wurde nicht gefunden.`r`n`r`noscdimg.exe ist nicht im normalen Windows enthalten.`r`nEs gehört zu Windows ADK / Deployment Tools.`r`nOhne oscdimg.exe kann dieses Lab mit diesem Ablauf keine bootfähige ISO erstellen."
        OscdimgFound = "oscdimg.exe: {0}"
        OutputPrompt = "Pfad oder Name der finalen ISO (EINGABE = {0})"
        OverwriteIso = "Die ISO existiert bereits. Überschreiben?"
        CreatingIso = "ISO wird mit oscdimg erstellt"
        IsoCreated = "ISO erfolgreich erstellt"
        DismountingIso = "ISO wird unmountet..."
        LargeWimNote = "Hinweis: install.wim größer als 4 GB ist in einer ISO/UDF gültig. Für ISO-Erstellung wird es nicht geteilt."
        DoneSize = "Größe: {0}"
        KeepMediaQuestion = "Trabajo\media für manuelle Prüfung behalten?"
        MediaCleaned = "Trabajo\media bereinigt."
        MediaKept = "Trabajo\media für Prüfung behalten: {0}"
        OutputInsideMedia = "Die Ausgabe-ISO darf nicht in Trabajo\media liegen, weil dieser Ordner temporär ist."
        MediaPathUnsafe = "Bereinigung eines media-Ordners außerhalb von Trabajo wird verweigert: {0}"
        NoLabel = "kein Label"
        OscdimgFailed = "oscdimg ist mit Code {0} fehlgeschlagen."
        BaseMedia = "Basismedium: {0}"
        LogPath = "Log: {0}"
        CheckCustomImages = "Benutzerdefinierte Images in Trabajo\images werden geprüft"
        NoCustomImages = "Kein boot.wim und kein install-Image in Trabajo\images gefunden. ISO-Erstellung abgebrochen. Fügen Sie zuerst angepasste Images hinzu; dieser Ablauf soll die Original-ISO nicht neu erstellen."
        CustomBootFound = "Benutzerdefiniertes boot.wim: {0}"
        CustomInstallFound = "Benutzerdefiniertes install-Image: {0}"
        MissingBootUsesBase = "Trabajo\images\boot.wim fehlt. Wenn Sie fortfahren, wird boot.wim aus der Basis-ISO verwendet."
        MissingInstallUsesBase = "Trabajo\images enthält kein install-Image. Wenn Sie fortfahren, wird install.* aus der Basis-ISO verwendet."
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

function Ensure-Directory {
    param([string]$Path)
    if (-not (Test-Path -LiteralPath $Path -PathType Container)) {
        New-Item -ItemType Directory -Path $Path -Force | Out-Null
    }
}

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
    Write-LabSubsection $title
    Write-IsoLog ("== {0} ==" -f $title)
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
            Write-Host ("  [{0,2}] {1}" -f ($i + 1), $options[$i].Text)
        }
        Write-Host ("  [ 0] {0}" -f (L "ManualSource"))
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
    Write-LabInfo (L "MountingIso") Cyan
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

    $types = @()
    if ($wim) { $types += "WIM" }
    if ($esd) { $types += "ESD" }
    if ($swmFiles.Count -gt 0) {
        if (-not ($swmFiles | Where-Object { $_.Name -ieq "install.swm" })) {
            throw (LF "SwmMissing" $SourceDirectory)
        }
        $types += "SWM"
    }

    if ($types.Count -gt 1) {
        throw (LF "MultipleInstallTypes" $SourceDirectory)
    }

    if ($wim) { return [pscustomobject]@{ Type = "WIM"; Files = @($wim) } }
    if ($esd) { return [pscustomobject]@{ Type = "ESD"; Files = @($esd) } }
    if ($swmFiles.Count -gt 0) { return [pscustomobject]@{ Type = "SWM"; Files = @($swmFiles) } }

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
        Write-LabWarning (L "MissingBootUsesBase")
        Write-IsoLog (L "MissingBootUsesBase")
    }

    if ($hasInstall) {
        $installNames = ((@($status.InstallSet.Files) | ForEach-Object Name) -join ", ")
        Write-LabOk (LF "CustomInstallFound" $installNames)
    }
    else {
        Write-LabWarning (L "MissingInstallUsesBase")
        Write-IsoLog (L "MissingInstallUsesBase")
    }

    if (-not $hasBoot -or -not $hasInstall) {
        if (-not (Confirm-LabYesNo -Question (L "ContinueWithBaseImageQuestion") -Default $false)) {
            throw (L "Cancelled")
        }
    }

    return $status
}

function Copy-FileSimple {
    param(
        [string]$Source,
        [string]$Destination
    )
    $destinationDirectory = Split-Path -Parent $Destination
    Ensure-Directory -Path $destinationDirectory
    $copyLine = "  {0} -> {1}" -f (Get-DisplayPath $Source), (Get-DisplayPath $Destination)
    Write-IsoLog $copyLine
    Copy-LabFileWithProgress -Source $Source -Destination $Destination -Activity $copyLine | Out-Null
}

function Get-RobocopyPath {
    param([string]$Path)
    if ($Path -match '^[A-Za-z]:\\$') { return $Path }
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
    $mediaBoot = Join-Path $mediaSources "boot.wim"

    if (Test-Path -LiteralPath $labBoot -PathType Leaf) {
        Write-LabOk (L "UsingLabBoot")
        Write-LabInfo (L "ReplacingBoot") Cyan
        Copy-FileSimple -Source $labBoot -Destination $mediaBoot
        return
    }

    Write-LabWarning (L "UsingIsoBoot")
    Write-IsoLog (L "UsingIsoBoot")
}

function Prepare-InstallImage {
    param([string]$BaseMediaRoot)

    $mediaSources = Join-Path $MediaRoot "sources"
    $labSet = Get-InstallPayloadSet -SourceDirectory $ImagesRoot -AllowNone

    if (-not $labSet) {
        Write-LabWarning (L "UsingIsoInstall")
        Write-IsoLog (L "UsingIsoInstall")
        return
    }
    Write-LabOk (LF "UsingLabInstall" ((@($labSet.Files) | ForEach-Object Name) -join ', '))
    Write-LabInfo (L "ReplacingInstall") Cyan

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
    Write-LabCommand $commandLine
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
    Write-LabBanner -Title (L "IsoTitle") -Subtitle $LabRoot
    Write-LabWarning (L "LargeWimNote")

    Write-LabStepHeader -Step 1 -TotalSteps 6 -Title (L "StepCheckCustom")
    $customStatus = Assert-CustomImagesForIso

    Write-LabStepHeader -Step 2 -TotalSteps 6 -Title (L "StepSelectBase")
    $baseMediaRoot = Resolve-BaseMediaRoot
    Write-LabOk (LF "BaseMedia" $baseMediaRoot)
    Write-IsoLog (LF "BaseMedia" $baseMediaRoot)

    $bootSourceDesc = if ($null -ne $customStatus.Boot) { Get-DisplayPath $customStatus.Boot.FullName } else { L "BaseSourceTag" }
    $installSourceDesc = if ($null -ne $customStatus.InstallSet) {
        ".\Trabajo\images\{0}" -f ((@($customStatus.InstallSet.Files) | ForEach-Object Name) -join ", ")
    } else { L "BaseSourceTag" }
    $detectedOscdimg = Resolve-OscdimgPath

    Write-LabStatusPanel -Title (L "IsoPlanTitle") -Items @(
        @{ Label = (L "PlanBaseLabel"); Value = $baseMediaRoot; Color = [ConsoleColor]::White },
        @{ Label = (L "PlanBootLabel"); Value = $bootSourceDesc; Color = $(if ($null -ne $customStatus.Boot) { [ConsoleColor]::Green } else { [ConsoleColor]::Yellow }) },
        @{ Label = (L "PlanInstallLabel"); Value = $installSourceDesc; Color = $(if ($null -ne $customStatus.InstallSet) { [ConsoleColor]::Green } else { [ConsoleColor]::Yellow }) },
        @{ Label = (L "PlanStagingLabel"); Value = $MediaRoot; Color = [ConsoleColor]::Gray },
        @{ Label = (L "PlanOscdimgLabel"); Value = $(if ($detectedOscdimg) { $detectedOscdimg } else { "oscdimg.exe (-)" }); Color = $(if ($detectedOscdimg) { [ConsoleColor]::Green } else { [ConsoleColor]::Yellow }) },
        @{ Label = (L "PlanOutputDirLabel"); Value = $IsoRoot; Color = [ConsoleColor]::Cyan },
        @{ Label = (L "Log"); Value = $LogPath; Color = [ConsoleColor]::DarkGray }
    )

    Write-LabStepHeader -Step 3 -TotalSteps 6 -Title (L "StepStageMedia")
    Clear-MediaFolderIfNeeded
    Invoke-RobocopyMirror -Source $baseMediaRoot -Destination $MediaRoot

    Write-LabStepHeader -Step 4 -TotalSteps 6 -Title (L "StepIntegrateImages")
    Prepare-BootImage -BaseMediaRoot $baseMediaRoot
    Prepare-InstallImage -BaseMediaRoot $baseMediaRoot

    Write-LabStepHeader -Step 5 -TotalSteps 6 -Title (L "StepValidateMedia")
    Assert-PreparedIsoMedia

    Write-LabStepHeader -Step 6 -TotalSteps 6 -Title (L "StepBuildIso")
    $oscdimg = Resolve-OscdimgPath
    if (-not $oscdimg) { throw (L "OscdimgMissing") }
    Write-LabOk (LF "OscdimgFound" $oscdimg)
    Write-IsoLog (LF "OscdimgFound" $oscdimg)

    $outputIso = Resolve-OutputIsoPath
    Write-IsoLog ("Output ISO: {0}" -f $outputIso)
    Invoke-Oscdimg -OscdimgPath $oscdimg -OutputIso $outputIso

    $finalIso = Get-Item -LiteralPath $outputIso -ErrorAction Stop
    Write-IsoLog ("SUCCESS: ISO created: {0} [{1}]" -f $finalIso.FullName, (Format-LabBytes ([UInt64]$finalIso.Length)))

    Write-Host ""
    $stagingStatusText = ""
    if (Confirm-LabYesNo -Question (L "KeepMediaQuestion") -Default $false) {
        $stagingStatusText = LF "MediaKept" $MediaRoot
        Write-IsoLog $stagingStatusText
    }
    else {
        Clear-MediaFolderContents
        $stagingStatusText = L "MediaCleaned"
        Write-IsoLog $stagingStatusText
    }

    Write-LabStatusPanel -Title (L "IsoSummaryTitle") -TitleColor Green -Items @(
        @{ Label = (L "SummaryStatusLabel"); Value = (L "IsoCreated"); Color = [ConsoleColor]::Green },
        @{ Label = (L "SummaryIsoPathLabel"); Value = $finalIso.FullName; Color = [ConsoleColor]::Green },
        @{ Label = (L "SummarySizeLabel"); Value = (Format-LabBytes ([UInt64]$finalIso.Length)); Color = [ConsoleColor]::Cyan },
        @{ Label = (L "PlanBootLabel"); Value = $bootSourceDesc; Color = [ConsoleColor]::White },
        @{ Label = (L "PlanInstallLabel"); Value = $installSourceDesc; Color = [ConsoleColor]::White },
        @{ Label = (L "SummaryStagingState"); Value = $stagingStatusText; Color = [ConsoleColor]::Gray },
        @{ Label = (L "Log"); Value = $LogPath; Color = [ConsoleColor]::DarkGray }
    )
}
catch {
    Write-Host ""
    Write-LabError (LF "ErrorPrefix" $_.Exception.Message)
    Write-IsoLog ("FAILED: {0}" -f $_.Exception.Message)
    Write-IsoLogRaw ($_.ScriptStackTrace | Out-String)
    if ($script:IsoLogReady) {
        Write-Host (LF "LogPath" $LogPath) -ForegroundColor DarkGray
    }
}
finally {
    if ($script:MountedIsoPath) {
        Write-Host ""
        Write-LabInfo (L "DismountingIso") Cyan
        Write-IsoLog ("Dismounting ISO: {0}" -f $script:MountedIsoPath)
        Dismount-DiskImage -ImagePath $script:MountedIsoPath -ErrorAction SilentlyContinue
    }
    Write-IsoLog "End Crear ISO Windows 11"
    Write-Host ""
    Read-Host (L "PressEnterExit") | Out-Null
}
