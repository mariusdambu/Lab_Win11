#Requires -RunAsAdministrator
[CmdletBinding()]
param(
    [string]$ImageFile,
    [Nullable[int]]$Index,
    [switch]$SkipDrivers,
    [switch]$SkipPackages,
    [switch]$SkipCleanup,
    [switch]$AutoCommit,
    [ValidateSet("en", "es", "fr", "ro", "de")]
    [string]$Language = $env:LAB_WIN11_LANG
)

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

. (Join-Path $PSScriptRoot "Lab-Idioma.ps1")
Initialize-LabLanguage -Language $Language | Out-Null

Add-LabTranslations @{
    en = @{
        AssistantBanner = "ASSISTANT: SERVICE INSTALL.WIM + BOOT.WIM"
        StepInstallSelect = "Select install.wim image and edition index"
        StepInstallPlan = "Configure servicing options and review plan"
        StepInstallMount = "Mount install.wim in Trabajo\offline"
        StepInstallService = "Apply offline servicing changes"
        StepInstallFinish = "Save or unmount install.wim"
        StepBootPlan = "Select boot.wim index and review plan"
        StepBootMount = "Mount boot.wim in Trabajo\offline"
        StepBootService = "Apply boot.wim drivers / WinPE review"
        StepBootFinish = "Save or unmount boot.wim"
        InstallSummaryTitle = "install.wim servicing summary"
        BootPlanTitle = "boot.wim servicing plan"
        BootSummaryTitle = "boot.wim servicing summary"
        SummaryActionLabel = "Result"
        ManualChangesNote = "No automatic driver/package step selected; ready for final action or manual review."
        ImageMissing = "The selected image does not exist: {0}"
        ImageMustBeInside = "The image must be inside {0}"
        NoInstallWim = "I cannot find install.wim inside {0}"
        ChooseInstallWim = "Choose install.wim"
        OfflineNotEmpty = "The offline folder is not empty: {0}"
        AlreadyMounted = "DISM already has an image mounted in {0}"
        DismFailed = "DISM failed in '{0}' with exit code {1}."
        DismConsoleLog = "DISM console output"
        DismOk = "OK: {0}"
        DismErrorTail = "Last DISM lines before the error:"
        ExportInstallTitle = "Export optimized install.wim"
        ExportDestinationLabel = "Output file"
        ExportInstallIndexUnavailable = "The processed image index could not be verified; export was skipped."
        ExportOverwriteQuestion = "Destination file already exists ({0}). Overwrite it with a clean optimized export?"
        ExportResultTitle = "Optimized WIM export summary"
        ExportBeforeLabel = "Source WIM (before)"
        ExportAfterLabel = "Optimized WIM (after)"
        ExportDeltaLabel = "Size difference"
        ExportInstallRunQuestion = "Export the processed image to install_optimizado.wim now?"
        ExportInstallSkipped = "Closing without running DISM export."
        ImageInformation = "Image information"
        ViewInstallIndexes = "View install.wim indexes"
        MountIndexPrompt = "Index to mount"
        MountIndexPromptDefault = "Index to mount [ENTER = {0} (Windows 11 Pro)]"
        InvalidIndex = "Invalid index."
        InjectDriversQuestion = "Inject {0} INF drivers from Trabajo\Drivers?"
        InjectPackagesQuestion = "Inject {0} packages from Trabajo\packages?"
        CleanupQuestion = "Run StartComponentCleanup before saving? It does not use ResetBase. Recommended: NO until the image is validated"
        Plan = "install.wim servicing plan"
        Image = "Image"
        Index = "Index"
        Mount = "Mount"
        Drivers = "Drivers"
        Packages = "Packages"
        Cleanup = "Cleanup"
        CleanupYes = "YES, StartComponentCleanup without ResetBase"
        StartNowQuestion = "Start now?"
        MountInstall = "Mount install.wim"
        InjectDrivers = "Inject drivers"
        InjectPackages = "Inject packages"
        CleanComponents = "Clean components"
        Finish = "Finish"
        FinalSave = "S = Save changes and unmount"
        FinalDiscard = "D = Discard changes and unmount"
        FinalMounted = "M = Keep mounted for manual review"
        SaveAndUnmount = "Save and unmount"
        DiscardAndUnmount = "Discard and unmount"
        LeftMounted = "Image left mounted in {0}"
        Completed = "Done"
        MaybeMounted = "The image may still be mounted in {0}."
        ManualCommitDiscard = "You can review it and then use Commit or Discard from the command menu."
        ManualPromptIntro = "Manual PowerShell prompt opened in this elevated window."
        ManualPromptExit = "Type exit when you want to close this window."
        BootWimMissing = "boot.wim was not found in {0}. boot.wim step skipped."
        BootNoDrivers = "No INF drivers were found. You can still mount boot.wim for manual changes."
        BootQuestion = "Work with boot.wim too: drivers or manual WinPE/startnet changes?"
        BootFlowTitle = "boot.wim flow"
        FlowChoiceTitle = "What do you want to modify?"
        FlowChoiceInstall = "  [1] install.wim"
        FlowChoiceBoot = "  [2] boot.wim"
        FlowChoiceBoth = "  [3] both (install.wim first)"
        FlowChoicePrompt = "Option [ENTER = 1]"
        FlowChoiceInvalid = "Invalid option."
        ContinueInstallQuestion = "Continue with install.wim now?"
        CannotContinueMounted = "Cannot continue because an image is still mounted in {0}."
        ImportBootQuestion = "No boot.wim is ready in Trabajo\images. Copy boot.wim from ISO/media now?"
        BootInfo = "boot.wim information"
        BootIndexPrompt = "boot.wim index to mount [ENTER = 2]"
        InvalidBootIndex = "Invalid boot.wim index."
        MountBoot = "Mount boot.wim"
        InjectBootDriversQuestion = "Inject {0} INF drivers into boot.wim from Trabajo\Drivers?"
        InjectBootDrivers = "Inject drivers into boot.wim"
        SaveBoot = "Save and unmount boot.wim"
        BootDone = "boot.wim step completed."
        ReadOnlyCheck = "Checking read-only attributes on boot.* and install.*..."
        ReadOnlyCleared = "Read-only removed: {0}"
        ReadOnlyClearFailed = "I could not remove read-only from {0}: {1}"
        NoLabel = "no label"
        MountedMediaText = "Use already mounted ISO/media {0}  [{1}, {2}]"
        LabIsoText = "Mount lab ISO {0}  [{1}]"
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
        DismountingIso = "Unmounting ISO..."
        ImportImagesQuestion = "No install.wim is ready in Trabajo\images. Copy images from ISO/media now?"
        ImportChoicePrompt = "Copy what? 1=install.*  2=boot.wim  3=both [ENTER = 3]"
        InvalidImportChoice = "Invalid copy option."
        CopyInstallFromMedia = "Copying install.* from media to Trabajo\images..."
        CopyBootFromMedia = "Copying boot.wim from media to Trabajo\images..."
        ImportCopyDone = "Copied: {0} [{1}]"
        ImportInstallRequired = "install.wim is required to continue with this assistant."
        SwmMissing = "SWM exists in {0}, but install.swm is missing. Files must be install.swm, install2.swm, etc."
        MultipleInstallTypes = "There is more than one install.* type in {0} ({1}). Leave only WIM, only ESD or only SWM."
        NoInstallPayload = "I cannot find install.wim, install.esd or install*.swm in {0}."
    }
    es = @{
        AssistantBanner = "ASISTENTE: MODIFICAR INSTALL.WIM + BOOT.WIM"
        StepInstallSelect = "Seleccionar imagen install.wim e índice de edición"
        StepInstallPlan = "Configurar opciones de servicio y revisar plan"
        StepInstallMount = "Montar install.wim en Trabajo\offline"
        StepInstallService = "Aplicar modificaciones offline en la imagen"
        StepInstallFinish = "Guardar o desmontar install.wim"
        StepBootPlan = "Seleccionar índice de boot.wim y revisar plan"
        StepBootMount = "Montar boot.wim en Trabajo\offline"
        StepBootService = "Integrar drivers en boot.wim / revisión WinPE"
        StepBootFinish = "Guardar o desmontar boot.wim"
        InstallSummaryTitle = "Resumen de servicio de install.wim"
        BootPlanTitle = "Plan de servicio de boot.wim"
        BootSummaryTitle = "Resumen de servicio de boot.wim"
        SummaryActionLabel = "Resultado"
        ManualChangesNote = "Sin inyección automática seleccionada; listo para acción final o revisión manual."
        ImageMissing = "No existe la imagen indicada: {0}"
        ImageMustBeInside = "La imagen debe estar dentro de {0}"
        NoInstallWim = "No encuentro install.wim dentro de {0}"
        ChooseInstallWim = "Elige install.wim"
        OfflineNotEmpty = "La carpeta offline no está vacía: {0}"
        AlreadyMounted = "DISM ya tiene una imagen montada en {0}"
        DismFailed = "DISM falló en '{0}' con código {1}."
        DismConsoleLog = "Salida consola DISM"
        DismOk = "OK: {0}"
        DismErrorTail = "Últimas líneas de DISM antes del error:"
        ExportInstallTitle = "Exportar install.wim optimizado"
        ExportDestinationLabel = "Archivo de salida"
        ExportInstallIndexUnavailable = "No se pudo verificar el índice de la imagen procesada; se omitió la exportación."
        ExportOverwriteQuestion = "¿El archivo destino ya existe ({0}). Sobrescribirlo con una exportación optimizada limpia?"
        ExportResultTitle = "Resumen de exportación optimizada WIM"
        ExportBeforeLabel = "WIM origen (antes)"
        ExportAfterLabel = "WIM optimizado (después)"
        ExportDeltaLabel = "Diferencia de tamaño"
        ExportInstallRunQuestion = "¿Exportar ahora la imagen procesada a install_optimizado.wim?"
        ExportInstallSkipped = "Cerrando sin ejecutar la exportación DISM."
        ImageInformation = "Información de la imagen"
        ViewInstallIndexes = "Ver índices de install.wim"
        MountIndexPrompt = "Índice que quieres montar"
        MountIndexPromptDefault = "Índice que quieres montar [INTRO = {0} (Windows 11 Pro)]"
        InvalidIndex = "Índice no válido."
        InjectDriversQuestion = "¿Inyectar {0} drivers INF desde Trabajo\Drivers?"
        InjectPackagesQuestion = "¿Inyectar {0} packages desde Trabajo\packages?"
        CleanupQuestion = "¿Ejecutar StartComponentCleanup antes de guardar? No usa ResetBase. Recomendado: NO hasta validar la imagen"
        Plan = "Plan de servicio de install.wim"
        Image = "Imagen"
        Index = "Índice"
        Mount = "Montaje"
        Drivers = "Drivers"
        Packages = "Packages"
        Cleanup = "Limpieza"
        CleanupYes = "SÍ, StartComponentCleanup sin ResetBase"
        StartNowQuestion = "¿Empezar ahora?"
        MountInstall = "Montar install.wim"
        InjectDrivers = "Inyectar drivers"
        InjectPackages = "Inyectar packages"
        CleanComponents = "Limpiar componentes"
        Finish = "Finalizar"
        FinalSave = "G = Guardar cambios y desmontar"
        FinalDiscard = "D = Descartar cambios y desmontar"
        FinalMounted = "M = Dejar montado para revisar manualmente"
        SaveAndUnmount = "Guardar y desmontar"
        DiscardAndUnmount = "Descartar y desmontar"
        LeftMounted = "Imagen dejada montada en {0}"
        Completed = "Terminado"
        MaybeMounted = "La imagen puede seguir montada en {0}."
        ManualCommitDiscard = "Puedes revisar y luego usar Commit o Discard desde el menú de comandos."
        ManualPromptIntro = "Consola interactiva de PowerShell abierta en esta ventana con permisos elevados."
        ManualPromptExit = "Escribe exit cuando quieras cerrar esta ventana."
        BootWimMissing = "No se encontró boot.wim en {0}. Se omite el paso boot.wim."
        BootNoDrivers = "No se encontraron drivers INF. Aún puedes montar boot.wim para cambios manuales."
        BootQuestion = "¿Trabajar también con boot.wim: drivers o cambios manuales de WinPE/startnet?"
        BootFlowTitle = "Flujo boot.wim"
        FlowChoiceTitle = "¿Qué quieres modificar?"
        FlowChoiceInstall = "  [1] install.wim"
        FlowChoiceBoot = "  [2] boot.wim"
        FlowChoiceBoth = "  [3] ambos (install.wim primero)"
        FlowChoicePrompt = "Opción [INTRO = 1]"
        FlowChoiceInvalid = "Opción no válida."
        ContinueInstallQuestion = "¿Continuar ahora con install.wim?"
        CannotContinueMounted = "No puedo continuar porque una imagen sigue montada en {0}."
        ImportBootQuestion = "¿No hay boot.wim listo en Trabajo\images. Copiar boot.wim desde ISO/medio ahora?"
        BootInfo = "Información de boot.wim"
        BootIndexPrompt = "Índice de boot.wim a montar [INTRO = 2]"
        InvalidBootIndex = "Índice de boot.wim no válido."
        MountBoot = "Montar boot.wim"
        InjectBootDriversQuestion = "¿Inyectar {0} drivers INF en boot.wim desde Trabajo\Drivers?"
        InjectBootDrivers = "Inyectar drivers en boot.wim"
        SaveBoot = "Guardar y desmontar boot.wim"
        BootDone = "Paso boot.wim completado."
        ReadOnlyCheck = "Comprobando atributo solo lectura en boot.* e install.*..."
        ReadOnlyCleared = "Solo lectura quitado: {0}"
        ReadOnlyClearFailed = "No pude quitar solo lectura de {0}: {1}"
        NoLabel = "sin etiqueta"
        MountedMediaText = "Usar ISO/medio ya montado {0}  [{1}, {2}]"
        LabIsoText = "Montar ISO del lab {0}  [{1}]"
        InstallMediaAvailable = "Medios de instalación disponibles:"
        ManualMediaOption = "Escribir una letra montada o una ISO del lab manualmente"
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
        DismountingIso = "Desmontando ISO..."
        ImportImagesQuestion = "¿No hay install.wim listo en Trabajo\images. Copiar imágenes desde ISO/medio ahora?"
        ImportChoicePrompt = "¿Qué quieres copiar? 1=install.*  2=boot.wim  3=ambos [INTRO = 3]"
        InvalidImportChoice = "Opción de copia no válida."
        CopyInstallFromMedia = "Copiando install.* desde el medio a Trabajo\images..."
        CopyBootFromMedia = "Copiando boot.wim desde el medio a Trabajo\images..."
        ImportCopyDone = "Copiado: {0} [{1}]"
        ImportInstallRequired = "install.wim es necesario para continuar con este asistente."
        SwmMissing = "Hay SWM en {0}, pero falta install.swm. Deben estar install.swm, install2.swm, etc."
        MultipleInstallTypes = "Hay más de un tipo de install.* en {0} ({1}). Deja solo WIM, solo ESD o solo SWM."
        NoInstallPayload = "No encuentro install.wim, install.esd ni install*.swm en {0}."
    }
    fr = @{
        AssistantBanner = "ASSISTANT : MODIFIER INSTALL.WIM + BOOT.WIM"
        StepInstallSelect = "Sélectionner l'image install.wim et l'index d'édition"
        StepInstallPlan = "Configurer les options de maintenance et vérifier le plan"
        StepInstallMount = "Monter install.wim dans Trabajo\offline"
        StepInstallService = "Appliquer les modifications hors ligne"
        StepInstallFinish = "Enregistrer ou démonter install.wim"
        StepBootPlan = "Sélectionner l'index de boot.wim et vérifier le plan"
        StepBootMount = "Monter boot.wim dans Trabajo\offline"
        StepBootService = "Injecter les pilotes boot.wim / révision WinPE"
        StepBootFinish = "Enregistrer ou démonter boot.wim"
        InstallSummaryTitle = "Résumé de maintenance de install.wim"
        BootPlanTitle = "Plan de maintenance de boot.wim"
        BootSummaryTitle = "Résumé de maintenance de boot.wim"
        SummaryActionLabel = "Résultat"
        ManualChangesNote = "Aucune injection automatique choisie ; prêt pour l'action finale ou révision manuelle."
        ImageMissing = "L'image indiquée n'existe pas : {0}"
        ImageMustBeInside = "L'image doit être dans {0}"
        NoInstallWim = "Je ne trouve pas install.wim dans {0}"
        ChooseInstallWim = "Choisir install.wim"
        OfflineNotEmpty = "Le dossier offline n'est pas vide : {0}"
        AlreadyMounted = "DISM a déjà une image montée dans {0}"
        DismFailed = "DISM a échoué dans '{0}' avec le code {1}."
        DismConsoleLog = "Sortie console DISM"
        DismOk = "OK : {0}"
        DismErrorTail = "Dernières lignes DISM avant l'erreur :"
        ExportInstallTitle = "Exporter install.wim optimisé"
        ExportDestinationLabel = "Fichier de sortie"
        ExportInstallIndexUnavailable = "Index traité non vérifiable ; export ignoré."
        ExportOverwriteQuestion = "Le fichier cible existe déjà ({0}). L'écraser avec un export optimisé propre ?"
        ExportResultTitle = "Résumé de l'export WIM optimisé"
        ExportBeforeLabel = "WIM source (avant)"
        ExportAfterLabel = "WIM optimisé (après)"
        ExportDeltaLabel = "Différence de taille"
        ExportInstallRunQuestion = "Exporter maintenant cette image vers install_optimizado.wim ?"
        ExportInstallSkipped = "Fermeture sans exécuter l'export DISM."
        ImageInformation = "Informations de l'image"
        ViewInstallIndexes = "Voir les index de install.wim"
        MountIndexPrompt = "Index à monter"
        MountIndexPromptDefault = "Index à monter [ENTRÉE = {0} (Windows 11 Pro)]"
        InvalidIndex = "Index invalide."
        InjectDriversQuestion = "Injecter {0} pilotes INF depuis Trabajo\Drivers ?"
        InjectPackagesQuestion = "Injecter {0} packages depuis Trabajo\packages ?"
        CleanupQuestion = "Exécuter StartComponentCleanup avant d'enregistrer ? N'utilise pas ResetBase. Recommandé : NON jusqu'à validation de l'image"
        Plan = "Plan de maintenance de install.wim"
        Image = "Image"
        Index = "Index"
        Mount = "Montage"
        Drivers = "Pilotes"
        Packages = "Packages"
        Cleanup = "Nettoyage"
        CleanupYes = "OUI, StartComponentCleanup sans ResetBase"
        StartNowQuestion = "Commencer maintenant ?"
        MountInstall = "Monter install.wim"
        InjectDrivers = "Injecter les pilotes"
        InjectPackages = "Injecter les packages"
        CleanComponents = "Nettoyer les composants"
        Finish = "Terminer"
        FinalSave = "E = Enregistrer les changements et démonter"
        FinalDiscard = "D = Abandonner les changements et démonter"
        FinalMounted = "M = Laisser monté pour vérification manuelle"
        SaveAndUnmount = "Enregistrer et démonter"
        DiscardAndUnmount = "Abandonner et démonter"
        LeftMounted = "Image laissée montée dans {0}"
        Completed = "Terminé"
        MaybeMounted = "L'image peut encore être montée dans {0}."
        ManualCommitDiscard = "Vous pouvez vérifier puis utiliser Commit ou Discard depuis le menu de commandes."
        ManualPromptIntro = "Console PowerShell interactive ouverte dans cette fenêtre avec des privilèges élevés."
        ManualPromptExit = "Tapez exit quand vous voulez fermer cette fenêtre."
        BootWimMissing = "boot.wim introuvable dans {0}. Étape boot.wim ignorée."
        BootNoDrivers = "Aucun pilote INF trouvé. Vous pouvez quand même monter boot.wim pour des changements manuels."
        BootQuestion = "Travailler aussi avec boot.wim : pilotes ou changements manuels WinPE/startnet ?"
        BootFlowTitle = "Flux boot.wim"
        FlowChoiceTitle = "Que voulez-vous modifier ?"
        FlowChoiceInstall = "  [1] install.wim"
        FlowChoiceBoot = "  [2] boot.wim"
        FlowChoiceBoth = "  [3] les deux (install.wim d'abord)"
        FlowChoicePrompt = "Option [ENTRÉE = 1]"
        FlowChoiceInvalid = "Option invalide."
        ContinueInstallQuestion = "Continuer avec install.wim maintenant ?"
        CannotContinueMounted = "Impossible de continuer car une image est encore montée dans {0}."
        ImportBootQuestion = "Aucun boot.wim prêt dans Trabajo\images. Copier boot.wim depuis ISO/média maintenant ?"
        BootInfo = "Informations de boot.wim"
        BootIndexPrompt = "Index boot.wim à monter [ENTRÉE = 2]"
        InvalidBootIndex = "Index boot.wim invalide."
        MountBoot = "Monter boot.wim"
        InjectBootDriversQuestion = "Injecter {0} pilotes INF dans boot.wim depuis Trabajo\Drivers ?"
        InjectBootDrivers = "Injecter les pilotes dans boot.wim"
        SaveBoot = "Enregistrer et démonter boot.wim"
        BootDone = "Étape boot.wim terminée."
        ReadOnlyCheck = "Vérification de l'attribut lecture seule sur boot.* et install.*..."
        ReadOnlyCleared = "Lecture seule retirée : {0}"
        ReadOnlyClearFailed = "Impossible de retirer la lecture seule de {0} : {1}"
        NoLabel = "sans étiquette"
        MountedMediaText = "Utiliser ISO/média déjà monté {0}  [{1}, {2}]"
        LabIsoText = "Monter ISO du lab {0}  [{1}]"
        InstallMediaAvailable = "Médias d'installation disponibles :"
        ManualMediaOption = "Saisir une lettre montée ou une ISO du lab manuellement"
        MountedIsoHint = "Si l'ISO est déjà montée, choisissez l'option lecteur monté."
        MediaPrompt = "Numéro, lettre montée (ex. I:) ou chemin ISO"
        MediaPromptFallback = "Lettre montée ou ISO dans {0}, exemple I: ou {0}\Win11.iso"
        MissingBootWim = "Le média {0} ne ressemble pas à un installateur Windows. sources\boot.wim manque."
        MissingInstallImage = "Le média {0} ne contient pas sources\install.wim, sources\install.esd ni sources\install.swm."
        MediaNotFound = "Média sélectionné introuvable : {0}"
        MediaMustIso = "Le média doit être une ISO ou une lettre déjà montée."
        IsoMustBeInside = "L'ISO doit être dans {0}. Copiez-la là d'abord pour garder le lab propre."
        MountingIso = "Montage de l'ISO..."
        CannotGetIsoLetter = "Impossible d'obtenir la lettre de l'ISO montée."
        DismountingIso = "Démontage de l'ISO..."
        ImportImagesQuestion = "Aucun install.wim prêt dans Trabajo\images. Copier les images depuis ISO/média maintenant ?"
        ImportChoicePrompt = "Que copier ? 1=install.*  2=boot.wim  3=les deux [ENTRÉE = 3]"
        InvalidImportChoice = "Option de copie invalide."
        CopyInstallFromMedia = "Copie de install.* depuis le média vers Trabajo\images..."
        CopyBootFromMedia = "Copie de boot.wim depuis le média vers Trabajo\images..."
        ImportCopyDone = "Copié : {0} [{1}]"
        ImportInstallRequired = "install.wim est nécessaire pour continuer avec cet assistant."
        SwmMissing = "Il y a du SWM dans {0}, mais install.swm manque. Les fichiers doivent être install.swm, install2.swm, etc."
        MultipleInstallTypes = "Il y a plusieurs types install.* dans {0} ({1}). Laissez seulement WIM, ESD ou SWM."
        NoInstallPayload = "Je ne trouve pas install.wim, install.esd ni install*.swm dans {0}."
    }
    ro = @{
        AssistantBanner = "ASISTENT: MODIFICARE INSTALL.WIM + BOOT.WIM"
        StepInstallSelect = "Selectare imagine install.wim și index ediție"
        StepInstallPlan = "Configurare opțiuni de mentenanță și verificare plan"
        StepInstallMount = "Montare install.wim în Trabajo\offline"
        StepInstallService = "Aplicare modificări offline în imagine"
        StepInstallFinish = "Salvare sau demontare install.wim"
        StepBootPlan = "Selectare index boot.wim și verificare plan"
        StepBootMount = "Montare boot.wim în Trabajo\offline"
        StepBootService = "Injectare drivere în boot.wim / verificare WinPE"
        StepBootFinish = "Salvare sau demontare boot.wim"
        InstallSummaryTitle = "Rezumat modificare install.wim"
        BootPlanTitle = "Plan modificare boot.wim"
        BootSummaryTitle = "Rezumat modificare boot.wim"
        SummaryActionLabel = "Rezultat"
        ManualChangesNote = "Fără injectare automată selectată; gata pentru acțiunea finală sau verificare manuală."
        ImageMissing = "Imaginea indicată nu există: {0}"
        ImageMustBeInside = "Imaginea trebuie să fie în {0}"
        NoInstallWim = "Nu găsesc install.wim în {0}"
        ChooseInstallWim = "Alege install.wim"
        OfflineNotEmpty = "Folderul offline nu este gol: {0}"
        AlreadyMounted = "DISM are deja o imagine montată în {0}"
        DismFailed = "DISM a eșuat în '{0}' cu codul {1}."
        DismConsoleLog = "Ieșire consolă DISM"
        DismOk = "OK: {0}"
        DismErrorTail = "Ultimele linii DISM înainte de eroare:"
        ExportInstallTitle = "Exportă install.wim optimizat"
        ExportDestinationLabel = "Fișier rezultat"
        ExportInstallIndexUnavailable = "Indexul imaginii prelucrate nu a putut fi verificat; exportul a fost omis."
        ExportOverwriteQuestion = "Fișierul destinație există deja ({0}). Îl suprascrii cu un export optimizat curat?"
        ExportResultTitle = "Rezumat export WIM optimizat"
        ExportBeforeLabel = "WIM sursă (înainte)"
        ExportAfterLabel = "WIM optimizat (după)"
        ExportDeltaLabel = "Diferență dimensiune"
        ExportInstallRunQuestion = "Exporți acum imaginea prelucrată în install_optimizado.wim?"
        ExportInstallSkipped = "Închidere fără executarea exportului DISM."
        ImageInformation = "Informații imagine"
        ViewInstallIndexes = "Vezi indexurile install.wim"
        MountIndexPrompt = "Indexul de montat"
        MountIndexPromptDefault = "Indexul de montat [ENTER = {0} (Windows 11 Pro)]"
        InvalidIndex = "Index invalid."
        InjectDriversQuestion = "Injectezi {0} drivere INF din Trabajo\Drivers?"
        InjectPackagesQuestion = "Injectezi {0} packages din Trabajo\packages?"
        CleanupQuestion = "Rulezi StartComponentCleanup înainte de salvare? Nu folosește ResetBase. Recomandat: NU până validezi imaginea"
        Plan = "Plan modificare install.wim"
        Image = "Imagine"
        Index = "Index"
        Mount = "Montare"
        Drivers = "Drivere"
        Packages = "Packages"
        Cleanup = "Curățare"
        CleanupYes = "DA, StartComponentCleanup fără ResetBase"
        StartNowQuestion = "Începi acum?"
        MountInstall = "Montează install.wim"
        InjectDrivers = "Injectează drivere"
        InjectPackages = "Injectează packages"
        CleanComponents = "Curăță componentele"
        Finish = "Finalizare"
        FinalSave = "S = Salvează modificările și demontează"
        FinalDiscard = "D = Renunță la modificări și demontează"
        FinalMounted = "M = Lasă montat pentru verificare manuală"
        SaveAndUnmount = "Salvează și demontează"
        DiscardAndUnmount = "Renunță și demontează"
        LeftMounted = "Imagine lăsată montată în {0}"
        Completed = "Terminat"
        MaybeMounted = "Imaginea poate fi încă montată în {0}."
        ManualCommitDiscard = "Poți verifica și apoi folosi Commit sau Discard din meniul de comenzi."
        ManualPromptIntro = "Consolă PowerShell interactivă deschisă în această fereastră cu privilegii ridicate."
        ManualPromptExit = "Tastează exit când vrei să închizi fereastra."
        BootWimMissing = "boot.wim nu a fost găsit în {0}. Pasul boot.wim este omis."
        BootNoDrivers = "Nu s-au găsit drivere INF. Tot poți monta boot.wim pentru modificări manuale."
        BootQuestion = "Lucrezi și cu boot.wim: drivere sau modificări manuale WinPE/startnet?"
        BootFlowTitle = "Flux boot.wim"
        FlowChoiceTitle = "Ce vrei să modifici?"
        FlowChoiceInstall = "  [1] install.wim"
        FlowChoiceBoot = "  [2] boot.wim"
        FlowChoiceBoth = "  [3] ambele (install.wim primul)"
        FlowChoicePrompt = "Opțiune [ENTER = 1]"
        FlowChoiceInvalid = "Opțiune invalidă."
        ContinueInstallQuestion = "Continui acum cu install.wim?"
        CannotContinueMounted = "Nu pot continua deoarece o imagine este încă montată în {0}."
        ImportBootQuestion = "Nu există boot.wim pregătit în Trabajo\images. Copiezi boot.wim din ISO/media acum?"
        BootInfo = "Informații boot.wim"
        BootIndexPrompt = "Index boot.wim de montat [ENTER = 2]"
        InvalidBootIndex = "Index boot.wim invalid."
        MountBoot = "Montează boot.wim"
        InjectBootDriversQuestion = "Injectezi {0} drivere INF în boot.wim din Trabajo\Drivers?"
        InjectBootDrivers = "Injectează drivere în boot.wim"
        SaveBoot = "Salvează și demontează boot.wim"
        BootDone = "Pasul boot.wim este finalizat."
        ReadOnlyCheck = "Verific atributul doar-citire pe boot.* și install.*..."
        ReadOnlyCleared = "Doar-citire eliminat: {0}"
        ReadOnlyClearFailed = "Nu am putut elimina doar-citire de pe {0}: {1}"
        NoLabel = "fără etichetă"
        MountedMediaText = "Folosește ISO/media deja montat {0}  [{1}, {2}]"
        LabIsoText = "Montează ISO din lab {0}  [{1}]"
        InstallMediaAvailable = "Medii de instalare disponibile:"
        ManualMediaOption = "Tastează manual o literă montată sau un ISO din lab"
        MountedIsoHint = "Dacă ISO este deja montat, alege opțiunea de unitate montată."
        MediaPrompt = "Număr, literă montată (ex. I:) sau cale ISO"
        MediaPromptFallback = "Literă montată sau ISO în {0}, exemplu I: sau {0}\Win11.iso"
        MissingBootWim = "Mediul {0} nu pare instalator Windows. Lipsește sources\boot.wim."
        MissingInstallImage = "Mediul {0} nu conține sources\install.wim, sources\install.esd sau sources\install.swm."
        MediaNotFound = "Mediul selectat nu există: {0}"
        MediaMustIso = "Mediul trebuie să fie un ISO sau o literă deja montată."
        IsoMustBeInside = "ISO trebuie să fie în {0}. Copiază-l acolo mai întâi pentru un lab curat."
        MountingIso = "Montez ISO..."
        CannotGetIsoLetter = "Nu am putut obține litera ISO montat."
        DismountingIso = "Demontez ISO..."
        ImportImagesQuestion = "Nu există install.wim pregătit în Trabajo\images. Copiezi imaginile din ISO/media acum?"
        ImportChoicePrompt = "Ce copiezi? 1=install.*  2=boot.wim  3=ambele [ENTER = 3]"
        InvalidImportChoice = "Opțiune de copiere nevalidă."
        CopyInstallFromMedia = "Copiez install.* din media în Trabajo\images..."
        CopyBootFromMedia = "Copiez boot.wim din media în Trabajo\images..."
        ImportCopyDone = "Copiat: {0} [{1}]"
        ImportInstallRequired = "install.wim este necesar pentru a continua cu acest asistent."
        SwmMissing = "Există SWM în {0}, dar lipsește install.swm. Trebuie să fie install.swm, install2.swm, etc."
        MultipleInstallTypes = "Există mai multe tipuri install.* în {0} ({1}). Lasă doar WIM, doar ESD sau doar SWM."
        NoInstallPayload = "Nu găsesc install.wim, install.esd sau install*.swm în {0}."
    }
    de = @{
        AssistantBanner = "ASSISTENT: INSTALL.WIM + BOOT.WIM BEARBEITEN"
        StepInstallSelect = "install.wim-Image und Editions-Index auswählen"
        StepInstallPlan = "Bearbeitungsoptionen konfigurieren und Plan prüfen"
        StepInstallMount = "install.wim in Trabajo\offline mounten"
        StepInstallService = "Offline-Änderungen auf das Image anwenden"
        StepInstallFinish = "install.wim speichern oder unmounten"
        StepBootPlan = "boot.wim-Index wählen und Plan prüfen"
        StepBootMount = "boot.wim in Trabajo\offline mounten"
        StepBootService = "Treiber in boot.wim integrieren / WinPE-Prüfung"
        StepBootFinish = "boot.wim speichern oder unmounten"
        InstallSummaryTitle = "Zusammenfassung der install.wim-Bearbeitung"
        BootPlanTitle = "Plan für boot.wim-Bearbeitung"
        BootSummaryTitle = "Zusammenfassung der boot.wim-Bearbeitung"
        SummaryActionLabel = "Ergebnis"
        ManualChangesNote = "Keine automatische Integration gewählt; bereit für Abschluss oder manuelle Prüfung."
        ImageMissing = "Das angegebene Image existiert nicht: {0}"
        ImageMustBeInside = "Das Image muss in {0} liegen"
        NoInstallWim = "Ich finde install.wim nicht in {0}"
        ChooseInstallWim = "install.wim auswählen"
        OfflineNotEmpty = "Der Offline-Ordner ist nicht leer: {0}"
        AlreadyMounted = "DISM hat bereits ein Image in {0} gemountet"
        DismFailed = "DISM ist in '{0}' mit Code {1} fehlgeschlagen."
        DismConsoleLog = "DISM Konsolenausgabe"
        DismOk = "OK: {0}"
        DismErrorTail = "Letzte DISM-Zeilen vor dem Fehler:"
        ExportInstallTitle = "Optimiertes install.wim exportieren"
        ExportDestinationLabel = "Ausgabedatei"
        ExportInstallIndexUnavailable = "Der Index des bearbeiteten Abbilds konnte nicht bestätigt werden; Export übersprungen."
        ExportOverwriteQuestion = "Zieldatei existiert bereits ({0}). Mit einem sauberen optimierten Export überschreiben?"
        ExportResultTitle = "Zusammenfassung des optimierten WIM-Exports"
        ExportBeforeLabel = "Quell-WIM (vorher)"
        ExportAfterLabel = "Optimiertes WIM (nachher)"
        ExportDeltaLabel = "Größenunterschied"
        ExportInstallRunQuestion = "Das bearbeitete Abbild jetzt nach install_optimizado.wim exportieren?"
        ExportInstallSkipped = "Beenden ohne DISM-Export."
        ImageInformation = "Image-Informationen"
        ViewInstallIndexes = "Indexe von install.wim anzeigen"
        MountIndexPrompt = "Zu mountender Index"
        MountIndexPromptDefault = "Zu mountender Index [EINGABE = {0} (Windows 11 Pro)]"
        InvalidIndex = "Ungültiger Index."
        InjectDriversQuestion = "{0} INF-Treiber aus Trabajo\Drivers injizieren?"
        InjectPackagesQuestion = "{0} Packages aus Trabajo\packages injizieren?"
        CleanupQuestion = "StartComponentCleanup vor dem Speichern ausführen? Nutzt kein ResetBase. Empfehlung: NEIN bis das Image validiert ist"
        Plan = "Plan für install.wim-Bearbeitung"
        Image = "Image"
        Index = "Index"
        Mount = "Mount"
        Drivers = "Treiber"
        Packages = "Packages"
        Cleanup = "Bereinigung"
        CleanupYes = "JA, StartComponentCleanup ohne ResetBase"
        StartNowQuestion = "Jetzt starten?"
        MountInstall = "install.wim mounten"
        InjectDrivers = "Treiber injizieren"
        InjectPackages = "Packages injizieren"
        CleanComponents = "Komponenten bereinigen"
        Finish = "Abschließen"
        FinalSave = "S = Änderungen speichern und unmounten"
        FinalDiscard = "D = Änderungen verwerfen und unmounten"
        FinalMounted = "M = Gemountet lassen für manuelle Prüfung"
        SaveAndUnmount = "Speichern und unmounten"
        DiscardAndUnmount = "Verwerfen und unmounten"
        LeftMounted = "Image bleibt gemountet in {0}"
        Completed = "Fertig"
        MaybeMounted = "Das Image kann noch in {0} gemountet sein."
        ManualCommitDiscard = "Sie können es prüfen und dann Commit oder Discard aus dem Befehlsmenü verwenden."
        ManualPromptIntro = "Manuelle PowerShell-Eingabe in diesem erhöhten Fenster geöffnet."
        ManualPromptExit = "Geben Sie exit ein, wenn Sie dieses Fenster schließen wollen."
        BootWimMissing = "boot.wim wurde in {0} nicht gefunden. boot.wim-Schritt wird übersprungen."
        BootNoDrivers = "Keine INF-Treiber gefunden. boot.wim kann trotzdem für manuelle Änderungen gemountet werden."
        BootQuestion = "Auch mit boot.wim arbeiten: Treiber oder manuelle WinPE/startnet-Änderungen?"
        BootFlowTitle = "boot.wim Ablauf"
        FlowChoiceTitle = "Was möchten Sie bearbeiten?"
        FlowChoiceInstall = "  [1] install.wim"
        FlowChoiceBoot = "  [2] boot.wim"
        FlowChoiceBoth = "  [3] beides (install.wim zuerst)"
        FlowChoicePrompt = "Option [EINGABE = 1]"
        FlowChoiceInvalid = "Ungültige Option."
        ContinueInstallQuestion = "Jetzt mit install.wim fortfahren?"
        CannotContinueMounted = "Fortfahren nicht möglich, weil ein Image noch in {0} gemountet ist."
        ImportBootQuestion = "Kein boot.wim in Trabajo\images bereit. boot.wim jetzt aus ISO/Medium kopieren?"
        BootInfo = "boot.wim-Informationen"
        BootIndexPrompt = "Zu mountender boot.wim Index [EINGABE = 2]"
        InvalidBootIndex = "Ungültiger boot.wim Index."
        MountBoot = "boot.wim mounten"
        InjectBootDriversQuestion = "{0} INF-Treiber aus Trabajo\Drivers in boot.wim injizieren?"
        InjectBootDrivers = "Treiber in boot.wim injizieren"
        SaveBoot = "boot.wim speichern und unmounten"
        BootDone = "boot.wim-Schritt abgeschlossen."
        ReadOnlyCheck = "Schreibschutz für boot.* und install.* wird geprüft..."
        ReadOnlyCleared = "Schreibschutz entfernt: {0}"
        ReadOnlyClearFailed = "Schreibschutz konnte nicht von {0} entfernt werden: {1}"
        NoLabel = "kein Label"
        MountedMediaText = "Bereits gemountete ISO/Medium verwenden {0}  [{1}, {2}]"
        LabIsoText = "Lab-ISO mounten {0}  [{1}]"
        InstallMediaAvailable = "Verfügbare Installationsmedien:"
        ManualMediaOption = "Gemounteten Laufwerksbuchstaben oder Lab-ISO manuell eingeben"
        MountedIsoHint = "Wenn die ISO bereits gemountet ist, wählen Sie die gemountete Laufwerksoption."
        MediaPrompt = "Nummer, gemounteter Buchstabe (z.B. I:) oder ISO-Pfad"
        MediaPromptFallback = "Gemounteter Buchstabe oder ISO in {0}, Beispiel I: oder {0}\Win11.iso"
        MissingBootWim = "Medium {0} sieht nicht wie Windows-Setup aus. sources\boot.wim fehlt."
        MissingInstallImage = "Medium {0} enthält weder sources\install.wim, sources\install.esd noch sources\install.swm."
        MediaNotFound = "Ausgewähltes Medium existiert nicht: {0}"
        MediaMustIso = "Das Medium muss eine ISO oder ein bereits gemounteter Laufwerksbuchstabe sein."
        IsoMustBeInside = "Die ISO muss in {0} liegen. Kopieren Sie sie zuerst dorthin, damit das Lab sauber bleibt."
        MountingIso = "ISO wird gemountet..."
        CannotGetIsoLetter = "Der Laufwerksbuchstabe der gemounteten ISO konnte nicht ermittelt werden."
        DismountingIso = "ISO wird unmountet..."
        ImportImagesQuestion = "Kein install.wim in Trabajo\images bereit. Images jetzt aus ISO/Medium kopieren?"
        ImportChoicePrompt = "Was kopieren? 1=install.*  2=boot.wim  3=beides [EINGABE = 3]"
        InvalidImportChoice = "Ungültige Kopieroption."
        CopyInstallFromMedia = "install.* wird vom Medium nach Trabajo\images kopiert..."
        CopyBootFromMedia = "boot.wim wird vom Medium nach Trabajo\images kopiert..."
        ImportCopyDone = "Kopiert: {0} [{1}]"
        ImportInstallRequired = "install.wim ist erforderlich, um mit diesem Assistenten fortzufahren."
        SwmMissing = "In {0} gibt es SWM, aber install.swm fehlt. Dateien müssen install.swm, install2.swm usw. heißen."
        MultipleInstallTypes = "Es gibt mehr als einen install.* Typ in {0} ({1}). Lassen Sie nur WIM, nur ESD oder nur SWM."
        NoInstallPayload = "Ich finde install.wim, install.esd oder install*.swm nicht in {0}."
    }
}

$ToolsRoot = $PSScriptRoot
$LabRoot = Split-Path -Parent $ToolsRoot
$WorkRoot = Join-Path $LabRoot "Trabajo"
$ImagesRoot = Join-Path $WorkRoot "images"
$IsoRoot = Join-Path $WorkRoot "ISOs"
$OfflineRoot = Join-Path $WorkRoot "offline"
$DriversRoot = Join-Path $WorkRoot "Drivers"
$PackagesRoot = Join-Path $WorkRoot "packages"
$LogsRoot = Join-Path $WorkRoot "Logs"
$ScratchRoot = Join-Path $WorkRoot "Scratch"
$Mounted = $false
$MountedIsoPath = $null
$DismConsoleLogPath = $null
$script:LastInstallWimPath = $null
$script:LastInstallWimIndex = $null

function Write-Section {
    param([string]$Title)

    Write-LabSubsection -Title $Title
}

function Format-Bytes {
    param([UInt64]$Bytes)

    return (Format-LabBytes -Bytes $Bytes)
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

function Clear-ImageReadOnlyAttribute {
    param([string]$Path)

    if (-not (Test-Path -LiteralPath $Path -PathType Leaf)) {
        return
    }

    $file = Get-Item -LiteralPath $Path -ErrorAction Stop
    if (-not $file.IsReadOnly) {
        return
    }

    try {
        $file.IsReadOnly = $false
        Write-LabWarning (LF "ReadOnlyCleared" $file.FullName)
    }
    catch {
        throw (LF "ReadOnlyClearFailed" $file.FullName $_.Exception.Message)
    }
}

function Clear-LabImageReadOnlyAttributes {
    if (-not (Test-Path -LiteralPath $ImagesRoot -PathType Container)) {
        return
    }

    Write-LabInfo (L "ReadOnlyCheck") Cyan
    $patterns = @(
        "boot*.wim",
        "boot*.esd",
        "boot*.swm",
        "install*.wim",
        "install*.esd",
        "install*.swm"
    )

    foreach ($pattern in $patterns) {
        Get-ChildItem -LiteralPath $ImagesRoot -Recurse -File -Filter $pattern -ErrorAction SilentlyContinue |
            ForEach-Object { Clear-ImageReadOnlyAttribute -Path $_.FullName }
    }
}

function Get-LabInstallWimCandidates {
    if (-not (Test-Path -LiteralPath $ImagesRoot -PathType Container)) {
        return @()
    }

    return @(Get-ChildItem -LiteralPath $ImagesRoot -Recurse -File -Filter "install*.wim" -ErrorAction SilentlyContinue | Sort-Object FullName)
}

function Get-IsoCandidates {
    if (-not (Test-Path -LiteralPath $IsoRoot -PathType Container)) {
        return @()
    }

    return @(Get-ChildItem -LiteralPath $IsoRoot -Recurse -File -Filter "*.iso" -ErrorAction SilentlyContinue | Sort-Object LastWriteTime -Descending)
}

function Assert-WindowsInstallMedia {
    param([string]$Root)

    $sources = Join-Path $Root "sources"
    if (-not (Test-Path -LiteralPath (Join-Path $sources "boot.wim") -PathType Leaf)) {
        throw (LF "MissingBootWim" $Root)
    }

    $hasInstallImage = @("install.wim", "install.esd", "install.swm") |
        Where-Object { Test-Path -LiteralPath (Join-Path $sources $_) -PathType Leaf } |
        Select-Object -First 1

    if (-not $hasInstallImage) {
        throw (LF "MissingInstallImage" $Root)
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
                Value = $root
                Text = (LF "MountedMediaText" $root $label $(if ($volume.Size) { Format-Bytes -Bytes ([UInt64]$volume.Size) } else { "" }))
            }
        }
    }
}

function Select-InstallMediaPath {
    $mountedMedia = @(Get-MountedInstallMediaCandidates)
    $isoCandidates = @(Get-IsoCandidates)

    if ($mountedMedia.Count -eq 0 -and $isoCandidates.Count -eq 1) {
        return $isoCandidates[0].FullName
    }

    $options = New-Object System.Collections.Generic.List[object]
    foreach ($mounted in $mountedMedia) {
        $options.Add($mounted)
    }

    foreach ($iso in $isoCandidates) {
        $options.Add([pscustomobject]@{
            Value = $iso.FullName
            Text = (LF "LabIsoText" $iso.FullName (Format-Bytes -Bytes ([UInt64]$iso.Length)))
        })
    }

    if ($options.Count -gt 0) {
        Write-Section (L "InstallMediaAvailable")
        for ($i = 0; $i -lt $options.Count; $i++) {
            Write-Host ("  [{0,2}] {1}" -f ($i + 1), $options[$i].Text)
        }
        Write-Host ("  [ 0] {0}" -f (L "ManualMediaOption"))
        Write-Host ""
        Write-Host (L "MountedIsoHint") -ForegroundColor Yellow

        $answer = Read-Host (L "MediaPrompt")
        if ([string]::IsNullOrWhiteSpace($answer)) {
            return $options[0].Value
        }

        $number = 0
        if ([int]::TryParse($answer, [ref]$number) -and $number -ge 1 -and $number -le $options.Count) {
            return $options[$number - 1].Value
        }

        if ($answer.Trim() -ne "0") {
            return $answer
        }
    }

    return (Read-Host (LF "MediaPromptFallback" $IsoRoot))
}

function Resolve-InstallMedia {
    $path = Select-InstallMediaPath
    $path = $path.Trim('"')

    if ($path -match "^[A-Za-z]:\\?$") {
        $root = ($path.Substring(0, 1).ToUpperInvariant() + ":\")
        Assert-WindowsInstallMedia -Root $root
        return $root
    }

    if (-not (Test-Path -LiteralPath $path -PathType Leaf)) {
        throw (LF "MediaNotFound" $path)
    }

    if ([System.IO.Path]::GetExtension($path) -ine ".iso") {
        throw (L "MediaMustIso")
    }

    if (-not (Test-InsidePath -Path $path -Root $IsoRoot)) {
        throw (LF "IsoMustBeInside" $IsoRoot)
    }

    Write-LabInfo (L "MountingIso") Cyan
    Mount-DiskImage -ImagePath $path | Out-Null
    $script:MountedIsoPath = $path
    Start-Sleep -Seconds 2

    $volume = Get-DiskImage -ImagePath $path | Get-Volume | Where-Object DriveLetter | Select-Object -First 1
    if (-not $volume) {
        throw (L "CannotGetIsoLetter")
    }

    $root = "$($volume.DriveLetter):\"
    Assert-WindowsInstallMedia -Root $root
    return $root
}

function Dismount-LabIsoIfNeeded {
    if (-not $script:MountedIsoPath) {
        return
    }

    Write-LabInfo (L "DismountingIso") Cyan
    Dismount-DiskImage -ImagePath $script:MountedIsoPath -ErrorAction SilentlyContinue
    $script:MountedIsoPath = $null
}

function Get-InstallPayloadSet {
    param([string]$SourceDirectory)

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
        throw (LF "NoInstallPayload" $SourceDirectory)
    }

    if ($types.Count -gt 1) {
        throw (LF "MultipleInstallTypes" $SourceDirectory ($types -join ', '))
    }

    switch ($types[0]) {
        "WIM" { return @($wim) }
        "ESD" { return @($esd) }
        "SWM" { return @($swmFiles) }
    }
}

function Read-ImportChoice {
    while ($true) {
        $answer = (Read-Host (L "ImportChoicePrompt")).Trim()
        if ([string]::IsNullOrWhiteSpace($answer)) {
            $answer = "3"
        }

        switch ($answer.ToUpperInvariant()) {
            "1" { return [pscustomobject]@{ CopyInstall = $true; CopyBoot = $false } }
            "I" { return [pscustomobject]@{ CopyInstall = $true; CopyBoot = $false } }
            "2" { return [pscustomobject]@{ CopyInstall = $false; CopyBoot = $true } }
            "B" { return [pscustomobject]@{ CopyInstall = $false; CopyBoot = $true } }
            "3" { return [pscustomobject]@{ CopyInstall = $true; CopyBoot = $true } }
            "A" { return [pscustomobject]@{ CopyInstall = $true; CopyBoot = $true } }
        }

        Write-Host (L "InvalidImportChoice") -ForegroundColor Yellow
    }
}

function Copy-ImageFileToImages {
    param(
        [System.IO.FileInfo]$SourceFile,
        [string]$DestinationName
    )

    $destination = Join-Path $ImagesRoot $DestinationName
    $copied = Copy-LabFileWithProgress -Source $SourceFile.FullName -Destination $destination -Activity (LF "ImportCopyDone" $DestinationName (Format-Bytes -Bytes ([UInt64]$SourceFile.Length)))
    Clear-ImageReadOnlyAttribute -Path $copied.FullName
    Write-LabOk (LF "ImportCopyDone" $copied.FullName (Format-Bytes -Bytes ([UInt64]$copied.Length)))
}

function Import-ImagesFromInstallMedia {
    $mediaRoot = Resolve-InstallMedia
    $sources = Join-Path $mediaRoot "sources"
    $choice = Read-ImportChoice

    try {
        if ($choice.CopyInstall) {
            Write-Section (L "CopyInstallFromMedia")
            foreach ($file in @(Get-InstallPayloadSet -SourceDirectory $sources)) {
                Copy-ImageFileToImages -SourceFile $file -DestinationName $file.Name
            }
        }

        if ($choice.CopyBoot) {
            Write-Section (L "CopyBootFromMedia")
            $bootWim = Get-Item -LiteralPath (Join-Path $sources "boot.wim") -ErrorAction Stop
            Copy-ImageFileToImages -SourceFile $bootWim -DestinationName "boot.wim"
        }
    }
    finally {
        Dismount-LabIsoIfNeeded
    }
}

function Ensure-InstallWimReady {
    if (@(Get-LabInstallWimCandidates).Count -gt 0) {
        return $false
    }

    if (-not (Read-YesNo -Question (L "ImportImagesQuestion") -Default $true)) {
        return $false
    }

    Import-ImagesFromInstallMedia

    if (@(Get-LabInstallWimCandidates).Count -eq 0) {
        throw (L "ImportInstallRequired")
    }

    return $true
}

function Read-YesNo {
    param(
        [string]$Question,
        [bool]$Default = $true
    )

    return (Confirm-LabYesNo -Question $Question -Default $Default)
}

function Copy-TextToClipboardSafe {
    param([string]$Text)

    try {
        Set-Clipboard -Value $Text -ErrorAction Stop
    }
    catch {
        $Text | clip.exe
    }
}

function Get-WimIndexEntries {
    param([string]$ImagePath)

    $entries = New-Object System.Collections.Generic.List[object]

    try {
        if (Get-Command Get-WindowsImage -ErrorAction SilentlyContinue) {
            $images = @(Get-WindowsImage -ImagePath $ImagePath -ErrorAction Stop | Sort-Object ImageIndex)
            foreach ($img in $images) {
                $entries.Add([pscustomobject]@{
                    ImageIndex = [int]$img.ImageIndex
                    ImageName = [string]$img.ImageName
                })
            }
            if ($entries.Count -gt 0) {
                return @($entries.ToArray())
            }
        }
    }
    catch {
    }

    try {
        $dismLines = @(& dism.exe /English /Get-ImageInfo "/ImageFile:$ImagePath" 2>&1)
        if ($LASTEXITCODE -eq 0) {
            $currentIndex = $null
            foreach ($line in $dismLines) {
                $text = [string]$line
                if ($text -match '^\s*Index\s*:\s*(\d+)\s*$') {
                    $currentIndex = [int]$Matches[1]
                }
                elseif ($null -ne $currentIndex -and $text -match '^\s*Name\s*:\s*(.+?)\s*$') {
                    $entries.Add([pscustomobject]@{
                        ImageIndex = $currentIndex
                        ImageName = $Matches[1].Trim()
                    })
                    $currentIndex = $null
                }
            }
        }
    }
    catch {
    }

    return @($entries.ToArray())
}

function New-InstallExportCommandText {
    param(
        [string]$SourceImageFile,
        [int]$SourceIndex,
        [string]$DestinationImageFile
    )

    return 'Dism /Export-Image /SourceImageFile:"{0}" /SourceIndex:{1} /DestinationImageFile:"{2}" /Compress:max /CheckIntegrity' -f $SourceImageFile, $SourceIndex, $DestinationImageFile
}

function Offer-InstallWimExport {
    param(
        [string]$SourceImageFile = "",
        [Nullable[int]]$SourceIndex = $null
    )

    $resolvedSource = ""
    if (-not [string]::IsNullOrWhiteSpace($SourceImageFile) -and (Test-Path -LiteralPath $SourceImageFile -PathType Leaf)) {
        $resolvedSource = (Resolve-Path -LiteralPath $SourceImageFile).Path
    }
    else {
        $defaultInstallPath = Join-Path $ImagesRoot "install.wim"
        if (Test-Path -LiteralPath $defaultInstallPath -PathType Leaf) {
            $resolvedSource = (Resolve-Path -LiteralPath $defaultInstallPath).Path
        }
    }

    if ([string]::IsNullOrWhiteSpace($resolvedSource) -or -not (Test-Path -LiteralPath $resolvedSource -PathType Leaf)) {
        return "UNAVAILABLE"
    }

    $indexEntries = @(Get-WimIndexEntries -ImagePath $resolvedSource)
    $selectedIndex = $null
    if ($null -ne $SourceIndex -and [int]$SourceIndex -ge 1) {
        $selectedIndex = [int]$SourceIndex
    }
    elseif ($indexEntries.Count -eq 1) {
        $selectedIndex = [int]$indexEntries[0].ImageIndex
    }

    if ($null -eq $selectedIndex) {
        Write-LabWarning (L "ExportInstallIndexUnavailable")
        return "UNAVAILABLE"
    }

    $chosenEntry = @($indexEntries | Where-Object { [int]$_.ImageIndex -eq $selectedIndex } | Select-Object -First 1)
    if ($indexEntries.Count -gt 0 -and $chosenEntry.Count -eq 0) {
        Write-LabWarning (L "ExportInstallIndexUnavailable")
        return "UNAVAILABLE"
    }

    $imageName = if ($chosenEntry.Count -gt 0 -and -not [string]::IsNullOrWhiteSpace($chosenEntry[0].ImageName)) {
        [string]$chosenEntry[0].ImageName
    }
    else {
        ""
    }
    $chosenDisplay = if (-not [string]::IsNullOrWhiteSpace($imageName)) {
        "{0} [{1}]" -f $imageName, $selectedIndex
    }
    else {
        ("[{0}]" -f $selectedIndex)
    }

    $destinationImage = Join-Path $ImagesRoot "install_optimizado.wim"
    Write-LabSection (L "ExportInstallTitle")
    Write-LabStatusPanel -Title (L "ExportInstallTitle") -Items @(
        @{ Label = (L "Image"); Value = $resolvedSource; Color = [ConsoleColor]::White },
        @{ Label = (L "Index"); Value = $chosenDisplay; Color = [ConsoleColor]::Cyan },
        @{ Label = (L "ExportDestinationLabel"); Value = $destinationImage; Color = [ConsoleColor]::Gray }
    )

    if (-not (Read-YesNo -Question (L "ExportInstallRunQuestion") -Default $false)) {
        Write-LabInfo (L "ExportInstallSkipped") Cyan
        return "SKIPPED"
    }

    if (Test-Path -LiteralPath $destinationImage -PathType Leaf) {
        if (-not (Read-YesNo -Question (LF "ExportOverwriteQuestion" $destinationImage) -Default $false)) {
            Write-LabInfo (L "ExportInstallSkipped") Cyan
            return "SKIPPED"
        }
        Clear-ImageReadOnlyAttribute -Path $destinationImage
        Remove-Item -LiteralPath $destinationImage -Force
    }

    $sizeBefore = [UInt64](Get-Item -LiteralPath $resolvedSource -ErrorAction Stop).Length
    try {
        Invoke-DismStep -Title (L "ExportInstallTitle") -Arguments @(
            "/Export-Image",
            "/SourceImageFile:$resolvedSource",
            "/SourceIndex:$selectedIndex",
            "/DestinationImageFile:$destinationImage",
            "/Compress:max",
            "/CheckIntegrity"
        )

        $exportedItem = Get-Item -LiteralPath $destinationImage -ErrorAction Stop
        $sizeAfter = [UInt64]$exportedItem.Length
        if ($sizeAfter -le $sizeBefore) {
            $savedBytes = $sizeBefore - $sizeAfter
            $savedPct = if ($sizeBefore -gt 0) { ($savedBytes * 100.0) / $sizeBefore } else { 0.0 }
            $deltaText = "-{0} (-{1:N1}%)" -f (Format-Bytes -Bytes $savedBytes), $savedPct
            $deltaColor = [ConsoleColor]::Green
        }
        else {
            $extraBytes = $sizeAfter - $sizeBefore
            $extraPct = if ($sizeBefore -gt 0) { ($extraBytes * 100.0) / $sizeBefore } else { 0.0 }
            $deltaText = "+{0} (+{1:N1}%)" -f (Format-Bytes -Bytes $extraBytes), $extraPct
            $deltaColor = [ConsoleColor]::Yellow
        }

        Write-LabStatusPanel -Title (L "ExportResultTitle") -TitleColor Green -Items @(
            @{ Label = (L "Index"); Value = $chosenDisplay; Color = [ConsoleColor]::White },
            @{ Label = (L "ExportBeforeLabel"); Value = ("{0} [{1}]" -f $resolvedSource, (Format-Bytes -Bytes $sizeBefore)); Color = [ConsoleColor]::Gray },
            @{ Label = (L "ExportAfterLabel"); Value = ("{0} [{1}]" -f $exportedItem.FullName, (Format-Bytes -Bytes $sizeAfter)); Color = [ConsoleColor]::Green },
            @{ Label = (L "ExportDeltaLabel"); Value = $deltaText; Color = $deltaColor }
        )
    }
    catch {
        Write-LabError $_.Exception.Message
    }
    return "EXECUTED"
}
function Invoke-DismStep {
    param(
        [string]$Title,
        [string[]]$Arguments,
        [switch]$ShowOutput
    )

    Write-Section $Title
    $commandLine = "dism.exe {0}" -f ($Arguments -join " ")
    if ($script:DismConsoleLogPath) {
        Add-Content -LiteralPath $script:DismConsoleLogPath -Value "" -Encoding UTF8
        Add-Content -LiteralPath $script:DismConsoleLogPath -Value ("[{0}] {1}" -f (Get-Date -Format "yyyy-MM-dd HH:mm:ss"), $Title) -Encoding UTF8
        Add-Content -LiteralPath $script:DismConsoleLogPath -Value $commandLine -Encoding UTF8
    }

    Write-LabCommand $commandLine

    $dismExe = Join-Path $env:SystemRoot "System32\dism.exe"
    if (-not (Test-Path -LiteralPath $dismExe -PathType Leaf)) {
        $dismExe = "dism.exe"
    }

    $outputLines = @()
    & $dismExe @Arguments 2>&1 | ForEach-Object {
        $line = $_.ToString()
        $outputLines += $line
        Write-Host $line
    }
    $exitCode = $LASTEXITCODE

    if ($script:DismConsoleLogPath) {
        Add-Content -LiteralPath $script:DismConsoleLogPath -Value $outputLines -Encoding UTF8
    }

    if ($exitCode -ne 0) {
        if ($outputLines.Count -gt 0) {
            Write-LabWarning (L "DismErrorTail")
            foreach ($line in @($outputLines | Select-Object -Last 14)) {
                Write-Host ("  {0}" -f $line) -ForegroundColor Yellow
            }
        }
        throw (LF "DismFailed" $Title $exitCode)
    }

    Write-LabOk (LF "DismOk" $Title)
}

function Select-ImageFile {
    if (-not [string]::IsNullOrWhiteSpace($ImageFile)) {
        $candidate = $ImageFile.Trim('"')
        if (-not (Test-Path -LiteralPath $candidate -PathType Leaf)) {
            throw (LF "ImageMissing" $candidate)
        }
        if (-not (Test-InsidePath -Path $candidate -Root $ImagesRoot)) {
            throw (LF "ImageMustBeInside" $ImagesRoot)
        }
        return (Resolve-Path -LiteralPath $candidate).Path
    }

    $candidates = @(Get-LabInstallWimCandidates)
    if ($candidates.Count -eq 0) {
        throw (LF "NoInstallWim" $ImagesRoot)
    }
    if ($candidates.Count -eq 1) {
        return $candidates[0].FullName
    }

    Write-Section (L "ChooseInstallWim")
    for ($i = 0; $i -lt $candidates.Count; $i++) {
        Write-Host ("  [{0,2}] {1} [{2}]" -f ($i + 1), $candidates[$i].FullName, (Format-Bytes -Bytes ([UInt64]$candidates[$i].Length)))
    }

    while ($true) {
        $answer = Read-Host (L "Number")
        $number = 0
        if ([int]::TryParse($answer, [ref]$number) -and $number -ge 1 -and $number -le $candidates.Count) {
            return $candidates[$number - 1].FullName
        }
        Write-Host (L "InvalidNumber") -ForegroundColor Yellow
    }
}

function Get-LabDriverSelection {
    param([ValidateSet("install", "boot")][string]$Target)

    $targetRoot = Join-Path $DriversRoot $Target
    if (Test-Path -LiteralPath $targetRoot -PathType Container) {
        $targetFiles = @(Get-ChildItem -LiteralPath $targetRoot -Recurse -File -Filter "*.inf" -ErrorAction SilentlyContinue)
        if ($targetFiles.Count -gt 0) {
            return [pscustomobject]@{
                Path = $targetRoot
                Count = $targetFiles.Count
            }
        }
    }

    $rootFiles = @(if (Test-Path -LiteralPath $DriversRoot -PathType Container) {
        Get-ChildItem -LiteralPath $DriversRoot -Recurse -File -Filter "*.inf" -ErrorAction SilentlyContinue
    })

    return [pscustomobject]@{
        Path = $DriversRoot
        Count = $rootFiles.Count
    }
}

function Get-LabDriverCount {
    return (Get-LabDriverSelection -Target "boot").Count
}

function Get-WindowsProIndex {
    param([string]$ImagePath)

    $entries = @(Get-WimIndexEntries -ImagePath $ImagePath)
    $proImage = @($entries | Where-Object { $_.ImageName -ceq "Windows 11 Pro" } | Select-Object -First 1)
    if ($proImage.Count -gt 0) {
        return [int]$proImage[0].ImageIndex
    }

    return $null
}

function Test-OfflineRootMounted {
    $mountedInfo = & dism.exe /English /Get-MountedImageInfo 2>&1
    return (($mountedInfo -join "`n") -match [regex]::Escape($OfflineRoot))
}

function Assert-OfflineReady {
    if (-not (Test-Path -LiteralPath $OfflineRoot -PathType Container)) {
        New-Item -ItemType Directory -Path $OfflineRoot -Force | Out-Null
    }

    $placeholderNames = @(".gitkeep", "README.md", "README.txt", "README_OFFLINE.txt")
    Get-ChildItem -LiteralPath $OfflineRoot -Force -File -ErrorAction SilentlyContinue |
        Where-Object { $_.Name -in $placeholderNames } |
        Remove-Item -Force -ErrorAction SilentlyContinue

    $offlineItems = @(Get-ChildItem -LiteralPath $OfflineRoot -Force -ErrorAction SilentlyContinue)
    if ($offlineItems.Count -gt 0) {
        throw (LF "OfflineNotEmpty" $OfflineRoot)
    }

    $mountedInfo = & dism.exe /English /Get-MountedImageInfo 2>&1
    if (($mountedInfo -join "`n") -match [regex]::Escape($OfflineRoot)) {
        throw (LF "AlreadyMounted" $OfflineRoot)
    }
}

function Read-BootIndex {
    while ($true) {
        $answer = (Read-Host (L "BootIndexPrompt")).Trim()
        if ([string]::IsNullOrWhiteSpace($answer)) {
            return 2
        }

        $parsed = 0
        if ([int]::TryParse($answer, [ref]$parsed) -and $parsed -ge 1) {
            return $parsed
        }
        Write-Host (L "InvalidBootIndex") -ForegroundColor Yellow
    }
}

function Read-AssistantTargetChoice {
    Write-Section (L "FlowChoiceTitle")
    Write-Host (L "FlowChoiceInstall")
    Write-Host (L "FlowChoiceBoot")
    Write-Host (L "FlowChoiceBoth")
    Write-Host ""

    while ($true) {
        $answer = (Read-Host (L "FlowChoicePrompt")).Trim()
        if ([string]::IsNullOrWhiteSpace($answer)) {
            return "INSTALL"
        }

        switch ($answer.ToUpperInvariant()) {
            "1" { return "INSTALL" }
            "I" { return "INSTALL" }
            "2" { return "BOOT" }
            "B" { return "BOOT" }
            "3" { return "BOTH" }
            "A" { return "BOTH" }
        }

        Write-Host (L "FlowChoiceInvalid") -ForegroundColor Yellow
    }
}

function New-DismLogSession {
    $timestamp = Get-Date -Format "yyyyMMdd-HHmmss"
    $logPath = Join-Path $LogsRoot "Modificar-InstallWim-$timestamp.log"
    $script:DismConsoleLogPath = Join-Path $LogsRoot "Modificar-InstallWim-$timestamp.console.txt"
    Set-Content -LiteralPath $script:DismConsoleLogPath -Value ("DISM console output - {0}" -f (Get-Date -Format "yyyy-MM-dd HH:mm:ss")) -Encoding UTF8
    return $logPath
}

function Ensure-BootWimReady {
    $bootWim = Join-Path $ImagesRoot "boot.wim"
    if (Test-Path -LiteralPath $bootWim -PathType Leaf) {
        return $false
    }

    if (-not (Read-YesNo -Question (L "ImportBootQuestion") -Default $true)) {
        return $false
    }

    try {
        $mediaRoot = Resolve-InstallMedia
        $sources = Join-Path $mediaRoot "sources"
        Write-Section (L "CopyBootFromMedia")
        $bootFile = Get-Item -LiteralPath (Join-Path $sources "boot.wim") -ErrorAction Stop
        Copy-ImageFileToImages -SourceFile $bootFile -DestinationName "boot.wim"
        return $true
    }
    finally {
        Dismount-LabIsoIfNeeded
    }
}

function Ensure-ImagesForFlow {
    param(
        [ValidateSet("INSTALL", "BOOT", "BOTH")]
        [string]$FlowChoice
    )

    $importedImages = $false

    if ($FlowChoice -in @("INSTALL", "BOTH")) {
        $importedImages = (Ensure-InstallWimReady) -or $importedImages
    }

    if ($FlowChoice -in @("BOOT", "BOTH")) {
        $importedImages = (Ensure-BootWimReady) -or $importedImages
    }

    if ($importedImages) {
        Clear-LabImageReadOnlyAttributes
    }
}

function Invoke-BootContinuation {
    param(
        [string]$LogPath,
        [int]$DriverCount,
        [bool]$AskBeforeStart
    )

    if ($AskBeforeStart -and -not (Read-YesNo -Question (L "BootQuestion") -Default $true)) {
        return "SKIPPED"
    }

    $importedBoot = Ensure-BootWimReady
    if ($importedBoot) {
        Clear-LabImageReadOnlyAttributes
    }

    return Invoke-BootWimDriverFlow -DriverCount $DriverCount -LogPath $LogPath -AskBeforeStart $false
}

function Invoke-BootWimDriverFlow {
    param(
        [int]$DriverCount,
        [string]$LogPath,
        [bool]$AskBeforeStart = $true
    )

    $bootWim = Join-Path $ImagesRoot "boot.wim"
    if (-not (Test-Path -LiteralPath $bootWim -PathType Leaf)) {
        Write-LabWarning (LF "BootWimMissing" $ImagesRoot)
        return "SKIPPED"
    }

    if ($AskBeforeStart -and -not (Read-YesNo -Question (L "BootQuestion") -Default $true)) {
        return "SKIPPED"
    }

    $driverSelection = Get-LabDriverSelection -Target "boot"
    $DriverCount = $driverSelection.Count

    Write-LabStepHeader -Step 1 -TotalSteps 4 -Title (L "StepBootPlan")

    $doBootDrivers = $false
    if ($DriverCount -le 0) {
        Write-LabWarning (L "BootNoDrivers")
    }
    else {
        $doBootDrivers = Read-YesNo -Question (LF "InjectBootDriversQuestion" $DriverCount) -Default $true
    }

    Clear-ImageReadOnlyAttribute -Path $bootWim

    Invoke-DismStep -Title (L "BootInfo") -ShowOutput -Arguments @(
        "/Get-ImageInfo",
        "/ImageFile:$bootWim",
        "/LogPath:$LogPath",
        "/ScratchDir:$ScratchRoot"
    )

    $bootIndex = Read-BootIndex

    Write-LabStatusPanel -Title (L "BootPlanTitle") -Items @(
        @{ Label = (L "Image"); Value = $bootWim; Color = [ConsoleColor]::White },
        @{ Label = (L "Index"); Value = [string]$bootIndex; Color = [ConsoleColor]::Cyan },
        @{ Label = (L "Mount"); Value = $OfflineRoot; Color = [ConsoleColor]::Gray },
        @{ Label = (L "Drivers"); Value = $(if ($doBootDrivers) { "{0} ({1} INF)" -f (L "YesText"), $DriverCount } else { L "NoText" }); Color = $(if ($doBootDrivers) { [ConsoleColor]::Green } else { [ConsoleColor]::Gray }) },
        @{ Label = (L "Log"); Value = $LogPath; Color = [ConsoleColor]::DarkGray }
    )

    Assert-OfflineReady

    Write-LabStepHeader -Step 2 -TotalSteps 4 -Title (L "StepBootMount")
    Invoke-DismStep -Title (L "MountBoot") -Arguments @(
        "/Mount-Wim",
        "/WimFile:$bootWim",
        "/Index:$bootIndex",
        "/MountDir:$OfflineRoot",
        "/CheckIntegrity",
        "/LogPath:$LogPath",
        "/ScratchDir:$ScratchRoot"
    )
    $script:Mounted = $true

    Write-LabStepHeader -Step 3 -TotalSteps 4 -Title (L "StepBootService")
    if ($doBootDrivers) {
        Invoke-DismStep -Title (L "InjectBootDrivers") -Arguments @(
            "/Image:$OfflineRoot",
            "/Add-Driver",
            "/Driver:$($driverSelection.Path)",
            "/Recurse",
            "/ForceUnsigned",
            "/LogPath:$LogPath",
            "/ScratchDir:$ScratchRoot"
        )
    }
    else {
        Write-LabInfo (L "ManualChangesNote") Cyan
    }

    Write-LabStepHeader -Step 4 -TotalSteps 4 -Title (L "StepBootFinish")
    Write-Host ("  {0}" -f (L "FinalSave"))
    Write-Host ("  {0}" -f (L "FinalDiscard"))
    Write-Host ("  {0}" -f (L "FinalMounted"))
    $bootFinalAction = $null
    do {
        $answer = (Read-Host (L "Option")).Trim().ToUpperInvariant()
        if ($answer -in @("S", "G", "E", "C")) { $bootFinalAction = "SAVE" }
        elseif ($answer -eq "D") { $bootFinalAction = "DISCARD" }
        elseif ($answer -eq "M") { $bootFinalAction = "MOUNTED" }
    } until ($bootFinalAction)

    if ($bootFinalAction -eq "SAVE") {
        Invoke-DismStep -Title (L "SaveBoot") -Arguments @(
            "/Unmount-Image",
            "/MountDir:$OfflineRoot",
            "/Commit",
            "/CheckIntegrity",
            "/LogPath:$LogPath",
            "/ScratchDir:$ScratchRoot"
        )
        $script:Mounted = $false
        Write-LabStatusPanel -Title (L "BootSummaryTitle") -TitleColor Green -Items @(
            @{ Label = (L "SummaryActionLabel"); Value = (L "BootDone"); Color = [ConsoleColor]::Green },
            @{ Label = (L "Image"); Value = $bootWim; Color = [ConsoleColor]::White },
            @{ Label = (L "Index"); Value = [string]$bootIndex; Color = [ConsoleColor]::Cyan },
            @{ Label = (L "Log"); Value = $LogPath; Color = [ConsoleColor]::DarkGray }
        )
        return "SAVE"
    }
    elseif ($bootFinalAction -eq "DISCARD") {
        Invoke-DismStep -Title (L "DiscardAndUnmount") -Arguments @(
            "/Unmount-Image",
            "/MountDir:$OfflineRoot",
            "/Discard",
            "/LogPath:$LogPath",
            "/ScratchDir:$ScratchRoot"
        )
        $script:Mounted = $false
        Write-LabStatusPanel -Title (L "BootSummaryTitle") -TitleColor Yellow -Items @(
            @{ Label = (L "SummaryActionLabel"); Value = (L "DiscardAndUnmount"); Color = [ConsoleColor]::Yellow },
            @{ Label = (L "Image"); Value = $bootWim; Color = [ConsoleColor]::White },
            @{ Label = (L "Index"); Value = [string]$bootIndex; Color = [ConsoleColor]::Cyan },
            @{ Label = (L "Log"); Value = $LogPath; Color = [ConsoleColor]::DarkGray }
        )
        return "DISCARD"
    }
    else {
        Write-LabWarning (LF "LeftMounted" $OfflineRoot)
        Write-Host ""
        Write-Host (L "ManualPromptIntro") -ForegroundColor Yellow
        Write-Host (L "ManualCommitDiscard")
        Write-Host (L "ManualPromptExit") -ForegroundColor Yellow
        Write-Host ""
        $host.EnterNestedPrompt()

        if (Test-OfflineRootMounted) {
            Write-Host ""
            Write-LabWarning (LF "LeftMounted" $OfflineRoot)
            Write-Host (L "ManualCommitDiscard")
            return "MOUNTED"
        }
        else {
            $script:Mounted = $false
            Write-LabOk (L "BootDone")
            return "MANUAL_UNMOUNTED"
        }
    }
}

function Invoke-InstallWimFlow {
    param(
        [string]$LogPath,
        [switch]$OfferBootAfter,
        [switch]$RunBootAfter
    )

    Write-LabStepHeader -Step 1 -TotalSteps 5 -Title (L "StepInstallSelect")
    $selectedImage = Select-ImageFile
    $script:LastInstallWimPath = $selectedImage
    Clear-ImageReadOnlyAttribute -Path $selectedImage
    $driverSelection = Get-LabDriverSelection -Target "install"
    $driverCount = $driverSelection.Count
    $packageCount = if (Test-Path -LiteralPath $PackagesRoot -PathType Container) {
        @(Get-ChildItem -LiteralPath $PackagesRoot -Recurse -File -ErrorAction SilentlyContinue | Where-Object { $_.Extension -in @(".cab", ".msu") }).Count
    } else {
        0
    }

    Invoke-DismStep -Title (L "ViewInstallIndexes") -ShowOutput -Arguments @(
        "/Get-ImageInfo",
        "/ImageFile:$selectedImage",
        "/LogPath:$LogPath",
        "/ScratchDir:$ScratchRoot"
    )

    if ($null -eq $Index) {
        $preferredIndex = Get-WindowsProIndex -ImagePath $selectedImage
        while ($true) {
            $prompt = if ($null -ne $preferredIndex) {
                LF "MountIndexPromptDefault" $preferredIndex
            } else {
                L "MountIndexPrompt"
            }
            $answer = Read-Host $prompt
            if ([string]::IsNullOrWhiteSpace($answer) -and $null -ne $preferredIndex) {
                $Index = [int]$preferredIndex
                break
            }

            $parsed = 0
            if ([int]::TryParse($answer, [ref]$parsed) -and $parsed -ge 1) {
                $Index = $parsed
                break
            }
            Write-Host (L "InvalidIndex") -ForegroundColor Yellow
        }
    }
    $mountedInstallIndex = [int]$Index
    $script:LastInstallWimIndex = $mountedInstallIndex

    Write-LabStepHeader -Step 2 -TotalSteps 5 -Title (L "StepInstallPlan")
    $doDrivers = (-not $SkipDrivers) -and $driverCount -gt 0 -and (Read-YesNo -Question (LF "InjectDriversQuestion" $driverCount) -Default $true)
    $doPackages = (-not $SkipPackages) -and $packageCount -gt 0 -and (Read-YesNo -Question (LF "InjectPackagesQuestion" $packageCount) -Default $true)
    $doCleanup = (-not $SkipCleanup) -and (Read-YesNo -Question (L "CleanupQuestion") -Default $false)

    Write-LabStatusPanel -Title (L "Plan") -Items @(
        @{ Label = (L "Image"); Value = $selectedImage; Color = [ConsoleColor]::White },
        @{ Label = (L "Index"); Value = [string]$mountedInstallIndex; Color = [ConsoleColor]::Cyan },
        @{ Label = (L "Mount"); Value = $OfflineRoot; Color = [ConsoleColor]::Gray },
        @{ Label = (L "Drivers"); Value = $(if ($doDrivers) { "{0} ({1} INF)" -f (L "YesText"), $driverCount } else { L "NoText" }); Color = $(if ($doDrivers) { [ConsoleColor]::Green } else { [ConsoleColor]::Gray }) },
        @{ Label = (L "Packages"); Value = $(if ($doPackages) { "{0} ({1})" -f (L "YesText"), $packageCount } else { L "NoText" }); Color = $(if ($doPackages) { [ConsoleColor]::Green } else { [ConsoleColor]::Gray }) },
        @{ Label = (L "Cleanup"); Value = $(if ($doCleanup) { L "CleanupYes" } else { L "NoText" }); Color = $(if ($doCleanup) { [ConsoleColor]::Yellow } else { [ConsoleColor]::Gray }) },
        @{ Label = (L "Log"); Value = $LogPath; Color = [ConsoleColor]::DarkGray },
        @{ Label = (L "DismConsoleLog"); Value = $script:DismConsoleLogPath; Color = [ConsoleColor]::DarkGray }
    )
    Write-Host ""

    if (-not (Read-YesNo -Question (L "StartNowQuestion") -Default $true)) {
        Write-LabWarning (L "Cancelled")
        return "CANCELLED"
    }

    Assert-OfflineReady

    Write-LabStepHeader -Step 3 -TotalSteps 5 -Title (L "StepInstallMount")
    Invoke-DismStep -Title (L "MountInstall") -Arguments @(
        "/Mount-Image",
        "/ImageFile:$selectedImage",
        "/Index:$mountedInstallIndex",
        "/MountDir:$OfflineRoot",
        "/CheckIntegrity",
        "/LogPath:$LogPath",
        "/ScratchDir:$ScratchRoot"
    )
    $script:Mounted = $true

    Write-LabStepHeader -Step 4 -TotalSteps 5 -Title (L "StepInstallService")
    if ($doDrivers) {
        Invoke-DismStep -Title (L "InjectDrivers") -Arguments @(
            "/Image:$OfflineRoot",
            "/Add-Driver",
            "/Driver:$($driverSelection.Path)",
            "/Recurse",
            "/ForceUnsigned",
            "/LogPath:$LogPath",
            "/ScratchDir:$ScratchRoot"
        )
    }

    if ($doPackages) {
        Invoke-DismStep -Title (L "InjectPackages") -Arguments @(
            "/Image:$OfflineRoot",
            "/Add-Package",
            "/PackagePath:$PackagesRoot",
            "/LogPath:$LogPath",
            "/ScratchDir:$ScratchRoot"
        )
    }

    if ($doCleanup) {
        Invoke-DismStep -Title (L "CleanComponents") -Arguments @(
            "/Image:$OfflineRoot",
            "/Cleanup-Image",
            "/StartComponentCleanup",
            "/LogPath:$LogPath",
            "/ScratchDir:$ScratchRoot"
        )
    }

    if (-not $doDrivers -and -not $doPackages -and -not $doCleanup) {
        Write-LabInfo (L "ManualChangesNote") Cyan
    }

    Write-LabStepHeader -Step 5 -TotalSteps 5 -Title (L "StepInstallFinish")
    $finalAction = $null
    if ($AutoCommit) {
        $finalAction = "SAVE"
    } else {
        Write-Host ("  {0}" -f (L "FinalSave"))
        Write-Host ("  {0}" -f (L "FinalDiscard"))
        Write-Host ("  {0}" -f (L "FinalMounted"))
        do {
            $answer = (Read-Host (L "Option")).Trim().ToUpperInvariant()
            if ($answer -in @("S", "G", "E", "C")) { $finalAction = "SAVE" }
            elseif ($answer -eq "D") { $finalAction = "DISCARD" }
            elseif ($answer -eq "M") { $finalAction = "MOUNTED" }
        } until ($finalAction)
    }

    if ($finalAction -eq "SAVE") {
        Invoke-DismStep -Title (L "SaveAndUnmount") -Arguments @(
            "/Unmount-Image",
            "/MountDir:$OfflineRoot",
            "/Commit",
            "/CheckIntegrity",
            "/LogPath:$LogPath",
            "/ScratchDir:$ScratchRoot"
        )
        $script:Mounted = $false
        Write-LabStatusPanel -Title (L "InstallSummaryTitle") -TitleColor Green -Items @(
            @{ Label = (L "SummaryActionLabel"); Value = (L "SaveAndUnmount"); Color = [ConsoleColor]::Green },
            @{ Label = (L "Image"); Value = $selectedImage; Color = [ConsoleColor]::White },
            @{ Label = (L "Index"); Value = [string]$mountedInstallIndex; Color = [ConsoleColor]::Cyan },
            @{ Label = (L "Log"); Value = $LogPath; Color = [ConsoleColor]::DarkGray }
        )
    } elseif ($finalAction -eq "DISCARD") {
        Invoke-DismStep -Title (L "DiscardAndUnmount") -Arguments @(
            "/Unmount-Image",
            "/MountDir:$OfflineRoot",
            "/Discard",
            "/LogPath:$LogPath",
            "/ScratchDir:$ScratchRoot"
        )
        $script:Mounted = $false
        Write-LabStatusPanel -Title (L "InstallSummaryTitle") -TitleColor Yellow -Items @(
            @{ Label = (L "SummaryActionLabel"); Value = (L "DiscardAndUnmount"); Color = [ConsoleColor]::Yellow },
            @{ Label = (L "Image"); Value = $selectedImage; Color = [ConsoleColor]::White },
            @{ Label = (L "Index"); Value = [string]$mountedInstallIndex; Color = [ConsoleColor]::Cyan },
            @{ Label = (L "Log"); Value = $LogPath; Color = [ConsoleColor]::DarkGray }
        )
    } else {
        Write-LabWarning (LF "LeftMounted" $OfflineRoot)
    }

    if ($finalAction -eq "SAVE") {
        if ($RunBootAfter) {
            [void](Invoke-BootContinuation -DriverCount (Get-LabDriverCount) -LogPath $LogPath -AskBeforeStart $false)
        }
        elseif ($OfferBootAfter) {
            [void](Invoke-BootContinuation -DriverCount (Get-LabDriverCount) -LogPath $LogPath -AskBeforeStart $true)
        }
        return "SAVE"
    } elseif ($finalAction -eq "DISCARD") {
        if ($RunBootAfter) {
            [void](Invoke-BootContinuation -DriverCount (Get-LabDriverCount) -LogPath $LogPath -AskBeforeStart $false)
        }
        elseif ($OfferBootAfter) {
            [void](Invoke-BootContinuation -DriverCount (Get-LabDriverCount) -LogPath $LogPath -AskBeforeStart $true)
        }
        return "DISCARD"
    } elseif ($finalAction -eq "MOUNTED") {
        Write-Host ""
        Write-Host (L "ManualPromptIntro") -ForegroundColor Yellow
        Write-Host (L "ManualCommitDiscard")
        Write-Host (L "ManualPromptExit") -ForegroundColor Yellow
        Write-Host ""
        $host.EnterNestedPrompt()

        if (Test-OfflineRootMounted) {
            Write-Host ""
            Write-LabWarning (LF "LeftMounted" $OfflineRoot)
            Write-Host (L "ManualCommitDiscard")
            return "MOUNTED"
        }
        else {
            $script:Mounted = $false
            if ($RunBootAfter) {
                [void](Invoke-BootContinuation -DriverCount (Get-LabDriverCount) -LogPath $LogPath -AskBeforeStart $false)
            }
            elseif ($OfferBootAfter) {
                [void](Invoke-BootContinuation -DriverCount (Get-LabDriverCount) -LogPath $LogPath -AskBeforeStart $true)
            }
            return "MANUAL_UNMOUNTED"
        }
    }
}

$pauseBeforeExit = $true

try {
    foreach ($dir in @($ImagesRoot, $IsoRoot, $LogsRoot, $ScratchRoot)) {
        New-Item -ItemType Directory -Path $dir -Force | Out-Null
    }

    Clear-Host
    Write-LabBanner -Title (L "AssistantBanner") -Subtitle $LabRoot

    Clear-LabImageReadOnlyAttributes
    $flowChoice = Read-AssistantTargetChoice
    $logPath = New-DismLogSession
    $flowCancelled = $false

    if ($flowChoice -eq "BOOT") {
        Ensure-ImagesForFlow -FlowChoice "BOOT"
        $bootResult = Invoke-BootWimDriverFlow -DriverCount (Get-LabDriverCount) -LogPath $logPath -AskBeforeStart $false
        if ($bootResult -eq "MOUNTED" -or (Test-OfflineRootMounted)) {
            Write-Host ""
            Write-LabWarning (LF "CannotContinueMounted" $OfflineRoot)
            $pauseBeforeExit = $false
        }
        elseif (Read-YesNo -Question (L "ContinueInstallQuestion") -Default $false) {
            Ensure-ImagesForFlow -FlowChoice "INSTALL"
            $installResult = Invoke-InstallWimFlow -LogPath $logPath
            if ($installResult -eq "CANCELLED") {
                $flowCancelled = $true
            }
            else {
                $pauseBeforeExit = $false
            }
        }
        else {
            $pauseBeforeExit = $false
        }
    }
    elseif ($flowChoice -eq "BOTH") {
        Ensure-ImagesForFlow -FlowChoice "BOTH"
        $installResult = Invoke-InstallWimFlow -LogPath $logPath -RunBootAfter
        if ($installResult -eq "CANCELLED") {
            $flowCancelled = $true
        }
        else {
            $pauseBeforeExit = $false
        }
    }
    else {
        Ensure-ImagesForFlow -FlowChoice "INSTALL"
        $installResult = Invoke-InstallWimFlow -LogPath $logPath -OfferBootAfter
        if ($installResult -eq "CANCELLED") {
            $flowCancelled = $true
        }
        else {
            $pauseBeforeExit = $false
        }
    }

    if ((-not $AutoCommit) -and (-not $flowCancelled) -and (-not $script:Mounted) -and (-not (Test-OfflineRootMounted))) {
        $exportAction = Offer-InstallWimExport -SourceImageFile $script:LastInstallWimPath -SourceIndex $script:LastInstallWimIndex
        if ($exportAction -in @("EXECUTED", "COPIED")) {
            $pauseBeforeExit = $true
        }
        elseif ($exportAction -eq "SKIPPED") {
            $pauseBeforeExit = $false
        }
    }
}
catch {
    Write-Host ""
    Write-LabError $_.Exception.Message

    $imageStillMounted = $false
    try {
        $imageStillMounted = ($script:Mounted -or (Test-OfflineRootMounted))
    }
    catch {
        $imageStillMounted = $script:Mounted
    }

    if ($imageStillMounted) {
        Write-Host ""
        Write-LabWarning (LF "MaybeMounted" $OfflineRoot)
        Write-Host (L "ManualCommitDiscard")
        Write-Host ""
        Write-Host (L "ManualPromptIntro") -ForegroundColor Yellow
        Write-Host (L "ManualPromptExit") -ForegroundColor Yellow
        Write-Host ""
        $pauseBeforeExit = $false
        $host.EnterNestedPrompt()

        if (Test-OfflineRootMounted) {
            Write-Host ""
            Write-LabWarning (LF "LeftMounted" $OfflineRoot)
            Write-Host (L "ManualCommitDiscard")
        }
        else {
            $script:Mounted = $false
        }
    }
}
finally {
    Dismount-LabIsoIfNeeded
}

if ($pauseBeforeExit) {
    Write-Host ""
    Read-Host (L "PressEnterExit") | Out-Null
}
