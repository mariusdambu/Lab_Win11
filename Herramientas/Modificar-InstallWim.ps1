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
        ImageMissing = "The selected image does not exist: {0}"
        ImageMustBeInside = "The image must be inside {0}"
        NoInstallWim = "I cannot find install.wim inside {0}"
        ChooseInstallWim = "Choose install.wim"
        OfflineNotEmpty = "The offline folder is not empty: {0}"
        AlreadyMounted = "DISM already has an image mounted in {0}"
        DismFailed = "DISM failed in '{0}' with exit code {1}."
        DismConsoleLog = "DISM console output"
        DismWorking = "DISM is working. Long output is hidden here and saved to the log."
        DismOk = "OK: {0}"
        DismErrorTail = "Last DISM lines before the error:"
        ImageInformation = "Image information"
        ViewInstallIndexes = "View install.wim indexes"
        MountIndexPrompt = "Index to mount"
        InvalidIndex = "Invalid index."
        InjectDriversQuestion = "Inject {0} INF drivers from Trabajo\Drivers?"
        InjectPackagesQuestion = "Inject {0} packages from Trabajo\packages?"
        CleanupQuestion = "Run StartComponentCleanup before saving? It does not use ResetBase. Recommended: NO until the image is validated"
        Plan = "Plan"
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
        BootWimMissing = "boot.wim was not found in {0}. Boot driver injection skipped."
        BootNoDrivers = "No INF drivers were found, so boot.wim driver injection is skipped."
        BootQuestion = "Also inject the same drivers into boot.wim for setup/storage/network?"
        BootInfo = "boot.wim information"
        BootIndexPrompt = "boot.wim index to mount [2]"
        InvalidBootIndex = "Invalid boot.wim index."
        MountBoot = "Mount boot.wim"
        InjectBootDrivers = "Inject drivers into boot.wim"
        SaveBoot = "Save and unmount boot.wim"
        BootDone = "boot.wim driver injection completed."
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
        ImportChoicePrompt = "Copy what? 1=install.*  2=boot.wim  3=both [3]"
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
        ImageMissing = "No existe la imagen indicada: {0}"
        ImageMustBeInside = "La imagen debe estar dentro de {0}"
        NoInstallWim = "No encuentro install.wim dentro de {0}"
        ChooseInstallWim = "Elige install.wim"
        OfflineNotEmpty = "La carpeta offline no esta vacia: {0}"
        AlreadyMounted = "DISM ya tiene una imagen montada en {0}"
        DismFailed = "DISM fallo en '{0}' con codigo {1}."
        DismConsoleLog = "Salida consola DISM"
        DismWorking = "DISM trabajando. La salida larga se oculta aqui y queda guardada en el log."
        DismOk = "OK: {0}"
        DismErrorTail = "Ultimas lineas de DISM antes del error:"
        ImageInformation = "Informacion de la imagen"
        ViewInstallIndexes = "Ver indices de install.wim"
        MountIndexPrompt = "Indice que quieres montar"
        InvalidIndex = "Indice no valido."
        InjectDriversQuestion = "Injectar {0} drivers INF desde Trabajo\Drivers?"
        InjectPackagesQuestion = "Injectar {0} packages desde Trabajo\packages?"
        CleanupQuestion = "Ejecutar StartComponentCleanup antes de guardar? No usa ResetBase. Recomendado: NO hasta validar la imagen"
        Plan = "Plan"
        Image = "Imagen"
        Index = "Indice"
        Mount = "Montaje"
        Drivers = "Drivers"
        Packages = "Packages"
        Cleanup = "Limpieza"
        CleanupYes = "SI, StartComponentCleanup sin ResetBase"
        StartNowQuestion = "Empezar ahora?"
        MountInstall = "Montar install.wim"
        InjectDrivers = "Injectar drivers"
        InjectPackages = "Injectar packages"
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
        ManualCommitDiscard = "Puedes revisar y luego usar Commit o Discard desde el menu de comandos."
        ManualPromptIntro = "Prompt manual de PowerShell abierto en esta ventana elevada."
        ManualPromptExit = "Escribe exit cuando quieras cerrar esta ventana."
        BootWimMissing = "No se encontro boot.wim en {0}. Se omite la inyeccion de drivers en boot.wim."
        BootNoDrivers = "No se encontraron drivers INF, asi que se omite la inyeccion en boot.wim."
        BootQuestion = "Injectar tambien los mismos drivers en boot.wim para setup/almacenamiento/red?"
        BootInfo = "Informacion de boot.wim"
        BootIndexPrompt = "Indice de boot.wim a montar [2]"
        InvalidBootIndex = "Indice de boot.wim no valido."
        MountBoot = "Montar boot.wim"
        InjectBootDrivers = "Injectar drivers en boot.wim"
        SaveBoot = "Guardar y desmontar boot.wim"
        BootDone = "Inyeccion de drivers en boot.wim completada."
        ReadOnlyCheck = "Comprobando atributo solo lectura en boot.* e install.*..."
        ReadOnlyCleared = "Solo lectura quitado: {0}"
        ReadOnlyClearFailed = "No pude quitar solo lectura de {0}: {1}"
        NoLabel = "sin etiqueta"
        MountedMediaText = "Usar ISO/medio ya montado {0}  [{1}, {2}]"
        LabIsoText = "Montar ISO del lab {0}  [{1}]"
        InstallMediaAvailable = "Medios de instalacion disponibles:"
        ManualMediaOption = "Escribir una letra montada o una ISO del lab manualmente"
        MountedIsoHint = "Si ya tenias la ISO montada, elige la opcion de unidad ya montada."
        MediaPrompt = "Numero, letra montada (ej. I:) o ruta ISO"
        MediaPromptFallback = "Letra ya montada o ISO dentro de {0}, ejemplo I: o {0}\Win11.iso"
        MissingBootWim = "El medio {0} no parece instalador Windows. Falta sources\boot.wim."
        MissingInstallImage = "El medio {0} no tiene sources\install.wim, sources\install.esd ni sources\install.swm."
        MediaNotFound = "No existe el medio indicado: {0}"
        MediaMustIso = "El medio debe ser una ISO o una letra ya montada."
        IsoMustBeInside = "La ISO debe estar dentro de {0}. Copiala ahi primero para mantener limpio el lab."
        MountingIso = "Montando ISO..."
        CannotGetIsoLetter = "No pude obtener la letra de la ISO montada."
        DismountingIso = "Desmontando ISO..."
        ImportImagesQuestion = "No hay install.wim listo en Trabajo\images. Copiar imagenes desde ISO/medio ahora?"
        ImportChoicePrompt = "Que quieres copiar? 1=install.*  2=boot.wim  3=ambos [3]"
        InvalidImportChoice = "Opcion de copia no valida."
        CopyInstallFromMedia = "Copiando install.* desde el medio a Trabajo\images..."
        CopyBootFromMedia = "Copiando boot.wim desde el medio a Trabajo\images..."
        ImportCopyDone = "Copiado: {0} [{1}]"
        ImportInstallRequired = "install.wim es necesario para continuar con este asistente."
        SwmMissing = "Hay SWM en {0}, pero falta install.swm. Deben estar install.swm, install2.swm, etc."
        MultipleInstallTypes = "Hay mas de un tipo de install.* en {0} ({1}). Deja solo WIM, solo ESD o solo SWM."
        NoInstallPayload = "No encuentro install.wim, install.esd ni install*.swm en {0}."
    }
    fr = @{
        ImageMissing = "L'image indiquee n'existe pas: {0}"
        ImageMustBeInside = "L'image doit etre dans {0}"
        NoInstallWim = "Je ne trouve pas install.wim dans {0}"
        ChooseInstallWim = "Choisir install.wim"
        OfflineNotEmpty = "Le dossier offline n'est pas vide: {0}"
        AlreadyMounted = "DISM a deja une image montee dans {0}"
        DismFailed = "DISM a echoue dans '{0}' avec le code {1}."
        DismConsoleLog = "Sortie console DISM"
        DismWorking = "DISM travaille. La sortie longue est masquee ici et enregistree dans le log."
        DismOk = "OK: {0}"
        DismErrorTail = "Dernieres lignes DISM avant l'erreur:"
        ImageInformation = "Informations de l'image"
        ViewInstallIndexes = "Voir les index de install.wim"
        MountIndexPrompt = "Index a monter"
        InvalidIndex = "Index invalide."
        InjectDriversQuestion = "Injecter {0} pilotes INF depuis Trabajo\Drivers?"
        InjectPackagesQuestion = "Injecter {0} packages depuis Trabajo\packages?"
        CleanupQuestion = "Executer StartComponentCleanup avant d'enregistrer? N'utilise pas ResetBase. Recommande: NON jusqu'a validation de l'image"
        Plan = "Plan"
        Image = "Image"
        Index = "Index"
        Mount = "Montage"
        Drivers = "Pilotes"
        Packages = "Packages"
        Cleanup = "Nettoyage"
        CleanupYes = "OUI, StartComponentCleanup sans ResetBase"
        StartNowQuestion = "Commencer maintenant?"
        MountInstall = "Monter install.wim"
        InjectDrivers = "Injecter les pilotes"
        InjectPackages = "Injecter les packages"
        CleanComponents = "Nettoyer les composants"
        Finish = "Terminer"
        FinalSave = "E = Enregistrer les changements et demonter"
        FinalDiscard = "D = Abandonner les changements et demonter"
        FinalMounted = "M = Laisser monte pour verification manuelle"
        SaveAndUnmount = "Enregistrer et demonter"
        DiscardAndUnmount = "Abandonner et demonter"
        LeftMounted = "Image laissee montee dans {0}"
        Completed = "Termine"
        MaybeMounted = "L'image peut encore etre montee dans {0}."
        ManualCommitDiscard = "Vous pouvez verifier puis utiliser Commit ou Discard depuis le menu de commandes."
        ManualPromptIntro = "Invite PowerShell manuel ouvert dans cette fenetre elevee."
        ManualPromptExit = "Tapez exit quand vous voulez fermer cette fenetre."
        BootWimMissing = "boot.wim introuvable dans {0}. Injection des pilotes dans boot.wim ignoree."
        BootNoDrivers = "Aucun pilote INF trouve, injection dans boot.wim ignoree."
        BootQuestion = "Injecter aussi les memes pilotes dans boot.wim pour setup/stockage/reseau?"
        BootInfo = "Informations de boot.wim"
        BootIndexPrompt = "Index boot.wim a monter [2]"
        InvalidBootIndex = "Index boot.wim invalide."
        MountBoot = "Monter boot.wim"
        InjectBootDrivers = "Injecter les pilotes dans boot.wim"
        SaveBoot = "Enregistrer et demonter boot.wim"
        BootDone = "Injection des pilotes dans boot.wim terminee."
        ReadOnlyCheck = "Verification de l'attribut lecture seule sur boot.* et install.*..."
        ReadOnlyCleared = "Lecture seule retiree: {0}"
        ReadOnlyClearFailed = "Impossible de retirer la lecture seule de {0}: {1}"
        NoLabel = "sans etiquette"
        MountedMediaText = "Utiliser ISO/media deja monte {0}  [{1}, {2}]"
        LabIsoText = "Monter ISO du lab {0}  [{1}]"
        InstallMediaAvailable = "Medias d'installation disponibles:"
        ManualMediaOption = "Saisir une lettre montee ou une ISO du lab manuellement"
        MountedIsoHint = "Si l'ISO est deja montee, choisissez l'option lecteur monte."
        MediaPrompt = "Numero, lettre montee (ex. I:) ou chemin ISO"
        MediaPromptFallback = "Lettre montee ou ISO dans {0}, exemple I: ou {0}\Win11.iso"
        MissingBootWim = "Le media {0} ne ressemble pas a un installateur Windows. sources\boot.wim manque."
        MissingInstallImage = "Le media {0} ne contient pas sources\install.wim, sources\install.esd ni sources\install.swm."
        MediaNotFound = "Media selectionne introuvable: {0}"
        MediaMustIso = "Le media doit etre une ISO ou une lettre deja montee."
        IsoMustBeInside = "L'ISO doit etre dans {0}. Copiez-la la d'abord pour garder le lab propre."
        MountingIso = "Montage de l'ISO..."
        CannotGetIsoLetter = "Impossible d'obtenir la lettre de l'ISO montee."
        DismountingIso = "Demontage de l'ISO..."
        ImportImagesQuestion = "Aucun install.wim pret dans Trabajo\images. Copier les images depuis ISO/media maintenant?"
        ImportChoicePrompt = "Que copier? 1=install.*  2=boot.wim  3=les deux [3]"
        InvalidImportChoice = "Option de copie invalide."
        CopyInstallFromMedia = "Copie de install.* depuis le media vers Trabajo\images..."
        CopyBootFromMedia = "Copie de boot.wim depuis le media vers Trabajo\images..."
        ImportCopyDone = "Copie: {0} [{1}]"
        ImportInstallRequired = "install.wim est necessaire pour continuer avec cet assistant."
        SwmMissing = "Il y a du SWM dans {0}, mais install.swm manque. Les fichiers doivent etre install.swm, install2.swm, etc."
        MultipleInstallTypes = "Il y a plusieurs types install.* dans {0} ({1}). Laissez seulement WIM, ESD ou SWM."
        NoInstallPayload = "Je ne trouve pas install.wim, install.esd ni install*.swm dans {0}."
    }
    ro = @{
        ImageMissing = "Imaginea indicata nu exista: {0}"
        ImageMustBeInside = "Imaginea trebuie sa fie in {0}"
        NoInstallWim = "Nu gasesc install.wim in {0}"
        ChooseInstallWim = "Alege install.wim"
        OfflineNotEmpty = "Folderul offline nu este gol: {0}"
        AlreadyMounted = "DISM are deja o imagine montata in {0}"
        DismFailed = "DISM a esuat in '{0}' cu codul {1}."
        DismConsoleLog = "Iesire consola DISM"
        DismWorking = "DISM lucreaza. Iesirea lunga este ascunsa aici si salvata in log."
        DismOk = "OK: {0}"
        DismErrorTail = "Ultimele linii DISM inainte de eroare:"
        ImageInformation = "Informatii imagine"
        ViewInstallIndexes = "Vezi indexurile install.wim"
        MountIndexPrompt = "Indexul de montat"
        InvalidIndex = "Index invalid."
        InjectDriversQuestion = "Injecteaza {0} drivere INF din Trabajo\Drivers?"
        InjectPackagesQuestion = "Injecteaza {0} packages din Trabajo\packages?"
        CleanupQuestion = "Ruleaza StartComponentCleanup inainte de salvare? Nu foloseste ResetBase. Recomandat: NU pana validezi imaginea"
        Plan = "Plan"
        Image = "Imagine"
        Index = "Index"
        Mount = "Montare"
        Drivers = "Drivere"
        Packages = "Packages"
        Cleanup = "Curatare"
        CleanupYes = "DA, StartComponentCleanup fara ResetBase"
        StartNowQuestion = "Incepi acum?"
        MountInstall = "Monteaza install.wim"
        InjectDrivers = "Injecteaza drivere"
        InjectPackages = "Injecteaza packages"
        CleanComponents = "Curata componentele"
        Finish = "Finalizare"
        FinalSave = "S = Salveaza modificarile si demonteaza"
        FinalDiscard = "D = Renunta la modificari si demonteaza"
        FinalMounted = "M = Lasa montat pentru verificare manuala"
        SaveAndUnmount = "Salveaza si demonteaza"
        DiscardAndUnmount = "Renunta si demonteaza"
        LeftMounted = "Imagine lasata montata in {0}"
        Completed = "Terminat"
        MaybeMounted = "Imaginea poate fi inca montata in {0}."
        ManualCommitDiscard = "Poti verifica si apoi folosi Commit sau Discard din meniul de comenzi."
        ManualPromptIntro = "Prompt PowerShell manual deschis in aceasta fereastra elevata."
        ManualPromptExit = "Tasteaza exit cand vrei sa inchizi fereastra."
        BootWimMissing = "boot.wim nu a fost gasit in {0}. Se omite injectarea driverelor in boot.wim."
        BootNoDrivers = "Nu s-au gasit drivere INF, deci se omite injectarea in boot.wim."
        BootQuestion = "Injectezi aceleasi drivere si in boot.wim pentru setup/stocare/retea?"
        BootInfo = "Informatii boot.wim"
        BootIndexPrompt = "Index boot.wim de montat [2]"
        InvalidBootIndex = "Index boot.wim invalid."
        MountBoot = "Monteaza boot.wim"
        InjectBootDrivers = "Injecteaza drivere in boot.wim"
        SaveBoot = "Salveaza si demonteaza boot.wim"
        BootDone = "Injectarea driverelor in boot.wim este finalizata."
        ReadOnlyCheck = "Verific atributul doar-citire pe boot.* si install.*..."
        ReadOnlyCleared = "Doar-citire eliminat: {0}"
        ReadOnlyClearFailed = "Nu am putut elimina doar-citire de pe {0}: {1}"
        NoLabel = "fara eticheta"
        MountedMediaText = "Foloseste ISO/media deja montat {0}  [{1}, {2}]"
        LabIsoText = "Monteaza ISO din lab {0}  [{1}]"
        InstallMediaAvailable = "Medii de instalare disponibile:"
        ManualMediaOption = "Tasteaza manual o litera montata sau un ISO din lab"
        MountedIsoHint = "Daca ISO este deja montat, alege optiunea de unitate montata."
        MediaPrompt = "Numar, litera montata (ex. I:) sau cale ISO"
        MediaPromptFallback = "Litera montata sau ISO in {0}, exemplu I: sau {0}\Win11.iso"
        MissingBootWim = "Mediul {0} nu pare instalator Windows. Lipseste sources\boot.wim."
        MissingInstallImage = "Mediul {0} nu contine sources\install.wim, sources\install.esd sau sources\install.swm."
        MediaNotFound = "Mediul selectat nu exista: {0}"
        MediaMustIso = "Mediul trebuie sa fie un ISO sau o litera deja montata."
        IsoMustBeInside = "ISO trebuie sa fie in {0}. Copiaza-l acolo mai intai pentru un lab curat."
        MountingIso = "Montez ISO..."
        CannotGetIsoLetter = "Nu am putut obtine litera ISO montat."
        DismountingIso = "Demontez ISO..."
        ImportImagesQuestion = "Nu exista install.wim pregatit in Trabajo\images. Copiezi imaginile din ISO/media acum?"
        ImportChoicePrompt = "Ce copiezi? 1=install.*  2=boot.wim  3=ambele [3]"
        InvalidImportChoice = "Optiune de copiere nevalida."
        CopyInstallFromMedia = "Copiez install.* din media in Trabajo\images..."
        CopyBootFromMedia = "Copiez boot.wim din media in Trabajo\images..."
        ImportCopyDone = "Copiat: {0} [{1}]"
        ImportInstallRequired = "install.wim este necesar pentru a continua cu acest asistent."
        SwmMissing = "Exista SWM in {0}, dar lipseste install.swm. Trebuie sa fie install.swm, install2.swm, etc."
        MultipleInstallTypes = "Exista mai multe tipuri install.* in {0} ({1}). Lasa doar WIM, doar ESD sau doar SWM."
        NoInstallPayload = "Nu gasesc install.wim, install.esd sau install*.swm in {0}."
    }
    de = @{
        ImageMissing = "Das angegebene Image existiert nicht: {0}"
        ImageMustBeInside = "Das Image muss in {0} liegen"
        NoInstallWim = "Ich finde install.wim nicht in {0}"
        ChooseInstallWim = "install.wim auswaehlen"
        OfflineNotEmpty = "Der Offline-Ordner ist nicht leer: {0}"
        AlreadyMounted = "DISM hat bereits ein Image in {0} gemountet"
        DismFailed = "DISM ist in '{0}' mit Code {1} fehlgeschlagen."
        DismConsoleLog = "DISM Konsolenausgabe"
        DismWorking = "DISM arbeitet. Lange Ausgabe wird hier ausgeblendet und im Log gespeichert."
        DismOk = "OK: {0}"
        DismErrorTail = "Letzte DISM-Zeilen vor dem Fehler:"
        ImageInformation = "Image-Informationen"
        ViewInstallIndexes = "Indexe von install.wim anzeigen"
        MountIndexPrompt = "Zu mountender Index"
        InvalidIndex = "Ungueltiger Index."
        InjectDriversQuestion = "{0} INF-Treiber aus Trabajo\Drivers injizieren?"
        InjectPackagesQuestion = "{0} Packages aus Trabajo\packages injizieren?"
        CleanupQuestion = "StartComponentCleanup vor dem Speichern ausfuehren? Nutzt kein ResetBase. Empfehlung: NEIN bis das Image validiert ist"
        Plan = "Plan"
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
        Finish = "Abschliessen"
        FinalSave = "S = Aenderungen speichern und unmounten"
        FinalDiscard = "D = Aenderungen verwerfen und unmounten"
        FinalMounted = "M = Gemountet lassen fuer manuelle Pruefung"
        SaveAndUnmount = "Speichern und unmounten"
        DiscardAndUnmount = "Verwerfen und unmounten"
        LeftMounted = "Image bleibt gemountet in {0}"
        Completed = "Fertig"
        MaybeMounted = "Das Image kann noch in {0} gemountet sein."
        ManualCommitDiscard = "Sie koennen es pruefen und dann Commit oder Discard aus dem Befehlsmenue verwenden."
        ManualPromptIntro = "Manuelle PowerShell-Eingabe in diesem erhoehten Fenster geoeffnet."
        ManualPromptExit = "Geben Sie exit ein, wenn Sie dieses Fenster schliessen wollen."
        BootWimMissing = "boot.wim wurde in {0} nicht gefunden. Treiberintegration in boot.wim wird uebersprungen."
        BootNoDrivers = "Keine INF-Treiber gefunden, daher wird boot.wim uebersprungen."
        BootQuestion = "Dieselben Treiber auch in boot.wim fuer Setup/Speicher/Netzwerk integrieren?"
        BootInfo = "boot.wim-Informationen"
        BootIndexPrompt = "Zu mountender boot.wim Index [2]"
        InvalidBootIndex = "Ungueltiger boot.wim Index."
        MountBoot = "boot.wim mounten"
        InjectBootDrivers = "Treiber in boot.wim injizieren"
        SaveBoot = "boot.wim speichern und unmounten"
        BootDone = "Treiberintegration in boot.wim abgeschlossen."
        ReadOnlyCheck = "Schreibschutz fuer boot.* und install.* wird geprueft..."
        ReadOnlyCleared = "Schreibschutz entfernt: {0}"
        ReadOnlyClearFailed = "Schreibschutz konnte nicht von {0} entfernt werden: {1}"
        NoLabel = "kein Label"
        MountedMediaText = "Bereits gemountete ISO/Medium verwenden {0}  [{1}, {2}]"
        LabIsoText = "Lab-ISO mounten {0}  [{1}]"
        InstallMediaAvailable = "Verfuegbare Installationsmedien:"
        ManualMediaOption = "Gemounteten Laufwerksbuchstaben oder Lab-ISO manuell eingeben"
        MountedIsoHint = "Wenn die ISO bereits gemountet ist, waehlen Sie die gemountete Laufwerksoption."
        MediaPrompt = "Nummer, gemounteter Buchstabe (z.B. I:) oder ISO-Pfad"
        MediaPromptFallback = "Gemounteter Buchstabe oder ISO in {0}, Beispiel I: oder {0}\Win11.iso"
        MissingBootWim = "Medium {0} sieht nicht wie Windows-Setup aus. sources\boot.wim fehlt."
        MissingInstallImage = "Medium {0} enthaelt weder sources\install.wim, sources\install.esd noch sources\install.swm."
        MediaNotFound = "Ausgewaehltes Medium existiert nicht: {0}"
        MediaMustIso = "Das Medium muss eine ISO oder ein bereits gemounteter Laufwerksbuchstabe sein."
        IsoMustBeInside = "Die ISO muss in {0} liegen. Kopieren Sie sie zuerst dorthin, damit das Lab sauber bleibt."
        MountingIso = "ISO wird gemountet..."
        CannotGetIsoLetter = "Der Laufwerksbuchstabe der gemounteten ISO konnte nicht ermittelt werden."
        DismountingIso = "ISO wird unmountet..."
        ImportImagesQuestion = "Kein install.wim in Trabajo\images bereit. Images jetzt aus ISO/Medium kopieren?"
        ImportChoicePrompt = "Was kopieren? 1=install.*  2=boot.wim  3=beides [3]"
        InvalidImportChoice = "Ungueltige Kopieroption."
        CopyInstallFromMedia = "install.* wird vom Medium nach Trabajo\images kopiert..."
        CopyBootFromMedia = "boot.wim wird vom Medium nach Trabajo\images kopiert..."
        ImportCopyDone = "Kopiert: {0} [{1}]"
        ImportInstallRequired = "install.wim ist erforderlich, um mit diesem Assistenten fortzufahren."
        SwmMissing = "In {0} gibt es SWM, aber install.swm fehlt. Dateien muessen install.swm, install2.swm usw. heissen."
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

function Write-Section {
    param([string]$Title)

    Write-LabSection -Title $Title
}

function Format-Bytes {
    param([UInt64]$Bytes)

    if ($Bytes -ge 1TB) { return "{0:N2} TB" -f ($Bytes / 1TB) }
    if ($Bytes -ge 1GB) { return "{0:N2} GB" -f ($Bytes / 1GB) }
    if ($Bytes -ge 1MB) { return "{0:N2} MB" -f ($Bytes / 1MB) }
    return "$Bytes bytes"
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
        Write-Host (LF "ReadOnlyCleared" $file.FullName) -ForegroundColor Yellow
    }
    catch {
        throw (LF "ReadOnlyClearFailed" $file.FullName $_.Exception.Message)
    }
}

function Clear-LabImageReadOnlyAttributes {
    if (-not (Test-Path -LiteralPath $ImagesRoot -PathType Container)) {
        return
    }

    Write-Section (L "ReadOnlyCheck")
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
    $options = New-Object System.Collections.Generic.List[object]
    foreach ($mounted in @(Get-MountedInstallMediaCandidates)) {
        $options.Add($mounted)
    }

    foreach ($iso in @(Get-IsoCandidates)) {
        $options.Add([pscustomobject]@{
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

    Write-Section (L "MountingIso")
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

    Write-Section (L "DismountingIso")
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
    Write-Host (LF "ImportCopyDone" $copied.FullName (Format-Bytes -Bytes ([UInt64]$copied.Length))) -ForegroundColor Green
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

function ConvertTo-NativeCommandLineArgument {
    param([string]$Argument)

    if ($Argument -notmatch '[\s"]') {
        return $Argument
    }

    return ('"{0}"' -f ($Argument -replace '"', '\"'))
}

function Update-DismProgressFromLine {
    param(
        [string]$Title,
        [string]$Line
    )

    if ($Line -match 'Installing\s+(\d+)\s+of\s+(\d+)') {
        $current = [int]$Matches[1]
        $total = [int]$Matches[2]
        if ($total -gt 0) {
            $percent = [int][Math]::Min(100, [Math]::Floor(($current * 100.0) / $total))
            Write-Progress -Activity $Title -Status ("Drivers {0}/{1}" -f $current, $total) -PercentComplete $percent
        }
        return
    }

    if ($Line -match '([0-9]{1,3}(?:\.[0-9]+)?)%') {
        $percent = [int][Math]::Min(100, [Math]::Floor([double]$Matches[1]))
        Write-Progress -Activity $Title -Status ("{0}%" -f $percent) -PercentComplete $percent
    }
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
        Add-Content -LiteralPath $script:DismConsoleLogPath -Value ""
        Add-Content -LiteralPath $script:DismConsoleLogPath -Value ("[{0}] {1}" -f (Get-Date -Format "yyyy-MM-dd HH:mm:ss"), $Title)
        Add-Content -LiteralPath $script:DismConsoleLogPath -Value $commandLine
    }

    if ($ShowOutput) {
        Write-Host $commandLine -ForegroundColor DarkGray
    }
    else {
        Write-Host (L "DismWorking") -ForegroundColor Yellow
    }

    $dismExe = Join-Path $env:SystemRoot "System32\dism.exe"
    if (-not (Test-Path -LiteralPath $dismExe -PathType Leaf)) {
        $dismExe = "dism.exe"
    }

    if ($ShowOutput) {
        & $dismExe @Arguments
        $exitCode = $LASTEXITCODE
        if ($exitCode -ne 0) {
            throw (LF "DismFailed" $Title $exitCode)
        }

        Write-Host (LF "DismOk" $Title) -ForegroundColor Green
        return
    }

    $stdoutPath = Join-Path $LogsRoot ("dism-console-{0}.out.txt" -f ([guid]::NewGuid().ToString("N")))
    $stderrPath = Join-Path $LogsRoot ("dism-console-{0}.err.txt" -f ([guid]::NewGuid().ToString("N")))
    $argumentLine = ($Arguments | ForEach-Object { ConvertTo-NativeCommandLineArgument $_ }) -join " "
    $cmdExe = Join-Path $env:SystemRoot "System32\cmd.exe"
    $cmdLine = "{0} {1} > `"{2}`" 2> `"{3}`"" -f $dismExe, $argumentLine, $stdoutPath, $stderrPath
    $startInfo = New-Object System.Diagnostics.ProcessStartInfo
    $startInfo.FileName = $cmdExe
    $startInfo.Arguments = "/d /c $cmdLine"
    $startInfo.UseShellExecute = $false
    $startInfo.CreateNoWindow = $true
    $process = New-Object System.Diagnostics.Process
    $process.StartInfo = $startInfo
    [void]$process.Start()
    $seenLines = 0

    while (-not $process.HasExited) {
        if (Test-Path -LiteralPath $stdoutPath) {
            $currentLines = @(Get-Content -LiteralPath $stdoutPath -Encoding OEM -ErrorAction SilentlyContinue)
            if ($currentLines.Count -gt $seenLines) {
                foreach ($line in @($currentLines | Select-Object -Skip $seenLines)) {
                    Update-DismProgressFromLine -Title $Title -Line $line
                }
                $seenLines = $currentLines.Count
            }
        }
        Start-Sleep -Milliseconds 500
    }
    $process.WaitForExit()
    Write-Progress -Activity $Title -Completed

    $outputLines = @()
    if (Test-Path -LiteralPath $stdoutPath) {
        $outputLines += @(Get-Content -LiteralPath $stdoutPath -Encoding OEM -ErrorAction SilentlyContinue)
    }
    if (Test-Path -LiteralPath $stderrPath) {
        $outputLines += @(Get-Content -LiteralPath $stderrPath -Encoding OEM -ErrorAction SilentlyContinue)
    }
    $exitCode = $process.ExitCode

    if ($script:DismConsoleLogPath) {
        Add-Content -LiteralPath $script:DismConsoleLogPath -Value $outputLines
    }

    if ($exitCode -ne 0) {
        if ($outputLines.Count -gt 0) {
            Write-Host (L "DismErrorTail") -ForegroundColor Yellow
            foreach ($line in @($outputLines | Select-Object -Last 14)) {
                Write-Host ("  {0}" -f $line) -ForegroundColor Yellow
            }
        }
        Remove-Item -LiteralPath $stdoutPath, $stderrPath -Force -ErrorAction SilentlyContinue
        throw (LF "DismFailed" $Title $exitCode)
    }

    Write-Host (LF "DismOk" $Title) -ForegroundColor Green

    Remove-Item -LiteralPath $stdoutPath, $stderrPath -Force -ErrorAction SilentlyContinue
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
        Write-Host ("{0,2}. {1} [{2}]" -f ($i + 1), $candidates[$i].FullName, (Format-Bytes -Bytes ([UInt64]$candidates[$i].Length)))
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

function Invoke-BootWimDriverFlow {
    param(
        [int]$DriverCount,
        [string]$LogPath
    )

    if ($DriverCount -le 0) {
        Write-Host (L "BootNoDrivers") -ForegroundColor Yellow
        return
    }

    $bootWim = Join-Path $ImagesRoot "boot.wim"
    if (-not (Test-Path -LiteralPath $bootWim -PathType Leaf)) {
        Write-Host (LF "BootWimMissing" $ImagesRoot) -ForegroundColor Yellow
        return
    }

    if (-not (Read-YesNo -Question (L "BootQuestion") -Default $true)) {
        return
    }

    Clear-ImageReadOnlyAttribute -Path $bootWim

    Invoke-DismStep -Title (L "BootInfo") -ShowOutput -Arguments @(
        "/Get-ImageInfo",
        "/ImageFile:$bootWim",
        "/LogPath:$LogPath",
        "/ScratchDir:$ScratchRoot"
    )

    $bootIndex = Read-BootIndex
    Assert-OfflineReady

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

    Invoke-DismStep -Title (L "InjectBootDrivers") -Arguments @(
        "/Image:$OfflineRoot",
        "/Add-Driver",
        "/Driver:$DriversRoot",
        "/Recurse",
        "/ForceUnsigned",
        "/LogPath:$LogPath",
        "/ScratchDir:$ScratchRoot"
    )

    Invoke-DismStep -Title (L "SaveBoot") -Arguments @(
        "/Unmount-Image",
        "/MountDir:$OfflineRoot",
        "/Commit",
        "/CheckIntegrity",
        "/LogPath:$LogPath",
        "/ScratchDir:$ScratchRoot"
    )
    $script:Mounted = $false

    Write-Host (L "BootDone") -ForegroundColor Green
}

$pauseBeforeExit = $true

try {
    foreach ($dir in @($ImagesRoot, $IsoRoot, $LogsRoot, $ScratchRoot)) {
        New-Item -ItemType Directory -Path $dir -Force | Out-Null
    }

    Clear-LabImageReadOnlyAttributes
    $importedImages = Ensure-InstallWimReady
    if ($importedImages) {
        Clear-LabImageReadOnlyAttributes
    }
    $selectedImage = Select-ImageFile
    Clear-ImageReadOnlyAttribute -Path $selectedImage
    $timestamp = Get-Date -Format "yyyyMMdd-HHmmss"
    $logPath = Join-Path $LogsRoot "Modificar-InstallWim-$timestamp.log"
    $script:DismConsoleLogPath = Join-Path $LogsRoot "Modificar-InstallWim-$timestamp.console.txt"
    Set-Content -LiteralPath $script:DismConsoleLogPath -Value ("DISM console output - {0}" -f (Get-Date -Format "yyyy-MM-dd HH:mm:ss")) -Encoding UTF8
    $driverCount = if (Test-Path -LiteralPath $DriversRoot -PathType Container) {
        @(Get-ChildItem -LiteralPath $DriversRoot -Recurse -File -Filter "*.inf" -ErrorAction SilentlyContinue).Count
    } else {
        0
    }
    $packageCount = if (Test-Path -LiteralPath $PackagesRoot -PathType Container) {
        @(Get-ChildItem -LiteralPath $PackagesRoot -Recurse -File -ErrorAction SilentlyContinue | Where-Object { $_.Extension -in @(".cab", ".msu") }).Count
    } else {
        0
    }

    Invoke-DismStep -Title (L "ViewInstallIndexes") -ShowOutput -Arguments @(
        "/Get-ImageInfo",
        "/ImageFile:$selectedImage",
        "/LogPath:$logPath",
        "/ScratchDir:$ScratchRoot"
    )

    if (-not $PSBoundParameters.ContainsKey("Index") -or $null -eq $Index) {
        while ($true) {
            $answer = Read-Host (L "MountIndexPrompt")
            $parsed = 0
            if ([int]::TryParse($answer, [ref]$parsed) -and $parsed -ge 1) {
                $Index = $parsed
                break
            }
            Write-Host (L "InvalidIndex") -ForegroundColor Yellow
        }
    }

    $doDrivers = (-not $SkipDrivers) -and $driverCount -gt 0 -and (Read-YesNo -Question (LF "InjectDriversQuestion" $driverCount) -Default $true)
    $doPackages = (-not $SkipPackages) -and $packageCount -gt 0 -and (Read-YesNo -Question (LF "InjectPackagesQuestion" $packageCount) -Default $true)
    $doCleanup = (-not $SkipCleanup) -and (Read-YesNo -Question (L "CleanupQuestion") -Default $false)

    Write-Section (L "Plan")
    Write-Host ("{0,-8}: {1}" -f (L "Image"), $selectedImage)
    Write-Host ("{0,-8}: {1}" -f (L "Index"), $Index)
    Write-Host ("{0,-8}: {1}" -f (L "Mount"), $OfflineRoot)
    Write-Host ("{0,-8}: {1}" -f (L "Drivers"), $(if ($doDrivers) { L "YesText" } else { L "NoText" }))
    Write-Host ("{0,-8}: {1}" -f (L "Packages"), $(if ($doPackages) { L "YesText" } else { L "NoText" }))
    Write-Host ("{0,-8}: {1}" -f (L "Cleanup"), $(if ($doCleanup) { L "CleanupYes" } else { L "NoText" }))
    Write-Host ("{0,-8}: {1}" -f (L "Log"), $logPath)
    Write-Host ("{0,-8}: {1}" -f (L "DismConsoleLog"), $script:DismConsoleLogPath)
    Write-Host ""

    if (-not (Read-YesNo -Question (L "StartNowQuestion") -Default $false)) {
        Write-Host (L "Cancelled") -ForegroundColor Yellow
        return
    }

    Assert-OfflineReady

    Invoke-DismStep -Title (L "MountInstall") -Arguments @(
        "/Mount-Image",
        "/ImageFile:$selectedImage",
        "/Index:$Index",
        "/MountDir:$OfflineRoot",
        "/CheckIntegrity",
        "/LogPath:$logPath",
        "/ScratchDir:$ScratchRoot"
    )
    $Mounted = $true

    if ($doDrivers) {
        Invoke-DismStep -Title (L "InjectDrivers") -Arguments @(
            "/Image:$OfflineRoot",
            "/Add-Driver",
            "/Driver:$DriversRoot",
            "/Recurse",
            "/ForceUnsigned",
            "/LogPath:$logPath",
            "/ScratchDir:$ScratchRoot"
        )
    }

    if ($doPackages) {
        Invoke-DismStep -Title (L "InjectPackages") -Arguments @(
            "/Image:$OfflineRoot",
            "/Add-Package",
            "/PackagePath:$PackagesRoot",
            "/LogPath:$logPath",
            "/ScratchDir:$ScratchRoot"
        )
    }

    if ($doCleanup) {
        Invoke-DismStep -Title (L "CleanComponents") -Arguments @(
            "/Image:$OfflineRoot",
            "/Cleanup-Image",
            "/StartComponentCleanup",
            "/LogPath:$logPath",
            "/ScratchDir:$ScratchRoot"
        )
    }

    Write-Section (L "Finish")
    $finalAction = $null
    if ($AutoCommit) {
        $finalAction = "SAVE"
    } else {
        Write-Host (L "FinalSave")
        Write-Host (L "FinalDiscard")
        Write-Host (L "FinalMounted")
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
            "/LogPath:$logPath",
            "/ScratchDir:$ScratchRoot"
        )
        $Mounted = $false
    } elseif ($finalAction -eq "DISCARD") {
        Invoke-DismStep -Title (L "DiscardAndUnmount") -Arguments @(
            "/Unmount-Image",
            "/MountDir:$OfflineRoot",
            "/Discard",
            "/LogPath:$logPath",
            "/ScratchDir:$ScratchRoot"
        )
        $Mounted = $false
    } else {
        Write-Host (LF "LeftMounted" $OfflineRoot) -ForegroundColor Yellow
    }

    Write-Section (L "Completed")
    Write-Host ("{0}: {1}" -f (L "Log"), $logPath)

    if ($finalAction -eq "SAVE") {
        Invoke-BootWimDriverFlow -DriverCount $driverCount -LogPath $logPath
        $pauseBeforeExit = $false
    } elseif ($finalAction -eq "MOUNTED") {
        Write-Host ""
        Write-Host (L "ManualPromptIntro") -ForegroundColor Yellow
        Write-Host (L "ManualCommitDiscard")
        Write-Host (L "ManualPromptExit") -ForegroundColor Yellow
        Write-Host ""
        $pauseBeforeExit = $false
        $host.EnterNestedPrompt()
    } else {
        $pauseBeforeExit = $false
    }
}
catch {
    Write-Host ""
    Write-Host $_.Exception.Message -ForegroundColor Red
    if ($Mounted) {
        Write-Host ""
        Write-Host (LF "MaybeMounted" $OfflineRoot) -ForegroundColor Yellow
        Write-Host (L "ManualCommitDiscard")
    }
}
finally {
    Dismount-LabIsoIfNeeded
}

if ($pauseBeforeExit) {
    Read-Host (L "PressEnterExit") | Out-Null
}
