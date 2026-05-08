[CmdletBinding()]
param(
    [string]$LabRoot,
    [ValidateSet("en", "es", "fr", "ro", "de")]
    [string]$Language = $env:LAB_WIN11_LANG
)

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

. (Join-Path $PSScriptRoot "Lab-Idioma.ps1")
Initialize-LabLanguage -Language $Language | Out-Null

Add-LabTranslations @{
    en = @{
        CopyConsoleTitle = "ESSENTIAL COMMANDS - WIN11 LAB"
        ViewCommand = "View command"
        WhatItDoes = "What it does"
        Risk = "Risk"
        Command = "Command"
        CopyBackLine = "C = Copy    0 = Back"
        Cmd01Title = "01 View active mounts"
        Cmd01Desc = "First step before mounting anything: checks whether DISM already has a mounted image."
        Cmd02Title = "02 Info install.wim"
        Cmd02Desc = "Shows indexes, names and editions available inside install.wim. Choose the right index before mounting."
        Cmd03Title = "03 Info install.esd"
        Cmd03Desc = "Shows indexes, names and editions available inside install.esd. Useful before converting ESD to WIM."
        Cmd04Title = "04 Info boot.wim"
        Cmd04Desc = "Shows the boot.wim indexes; index 2 is usually Windows Setup."
        Cmd05Title = "05 Mount install.wim index 1"
        Cmd05Desc = "Mounts install.wim in Trabajo\offline so you can service it. Change /Index:1 if the edition is on another index."
        Cmd06Title = "06 Mount install.wim Windows 11 Pro"
        Cmd06Desc = "Name-based alternative: mounts Windows 11 Pro if that exact name exists."
        Cmd07Title = "07 Mount boot.wim index 2"
        Cmd07Desc = "Mounts the Windows setup environment to inject storage or network drivers."
        Cmd08Title = "08 Inject drivers"
        Cmd08Desc = "Integrates all INF drivers found inside Trabajo\Drivers recursively. Run it with an image already mounted."
        Cmd09Title = "09 View integrated drivers"
        Cmd09Desc = "Lists drivers in the mounted image so you can confirm the injection worked."
        Cmd10Title = "10 Inject packages"
        Cmd10Desc = "Integrates .cab or .msu packages from Trabajo\packages into the mounted image."
        Cmd11Title = "11 View integrated packages"
        Cmd11Desc = "Lists packages installed in the mounted image."
        Cmd12Title = "12 StartComponentCleanup"
        Cmd12Desc = "Cleans superseded components to reduce size after integrating packages. It does not use ResetBase."
        Cmd13Title = "13 Save and unmount"
        Cmd13Desc = "Closes the mount and writes every change into the WIM. Use it when everything is correct."
        Cmd14Title = "14 Discard and unmount"
        Cmd14Desc = "Closes the mount and discards the changes made during this session. Use it if something went wrong."
        Cmd15Title = "15 Recover mount"
        Cmd15Desc = "Tries to recover a mount left by DISM in an inconsistent state. Use it before rough cleanup."
        Cmd16Title = "16 Clean broken mounts"
        Cmd16Desc = "Cleans damaged or abandoned DISM mount leftovers. Use it when Get-MountedImageInfo shows problems."
        Cmd17Title = "17 ESD to WIM"
        Cmd17Desc = "Converts install.esd to install.wim so it can be mounted and serviced comfortably."
        Cmd18Title = "18 WIM to ESD"
        Cmd18Desc = "Converts install.wim to install.esd to save space."
        Cmd19Title = "19 Optimize WIM"
        Cmd19Desc = "Exports install.wim into a new compressed WIM; useful to compact and remove internal leftovers."
        Cmd20Title = "20 Split install.wim to SWM"
        Cmd20Desc = "Splits install.wim into install.swm/install2.swm for media with FAT32 limits. SWM files stay in images because they are install.*."
        Cmd21Title = "21 Mount Win11 ISO"
        Cmd21Desc = "Mounts the ISO stored in Trabajo\ISOs so it can be used as source."
        Cmd22Title = "22 Unmount Win11 ISO"
        Cmd22Desc = "Unmounts Win11.iso from the system."
        Cmd23Title = "23 View disks and volumes"
        Cmd23Desc = "Shows physical disks and volume letters to identify USB drives and mounted media."
        Cmd24Title = "24 Open DISM log"
        Cmd24Desc = "Opens the main DISM log in Notepad."
        Cmd25Title = "25 Mount install.wim with lab log"
        Cmd25Desc = "Mounts install.wim while keeping log and scratch files inside the lab. Useful for diagnostics."
        Cmd26Title = "26 Open network in OOBE"
        Cmd26Desc = "Opens network connections during setup after Shift+F10."
    }
    es = @{
        CopyConsoleTitle = "COMANDOS IMPRESCINDIBLES - LAB WIN11"
        ViewCommand = "Ver comando"
        WhatItDoes = "Que hace"
        Risk = "Riesgo"
        Command = "Comando"
        CopyBackLine = "C = Copiar    0 = Volver"
        Cmd01Title = "01 Ver montajes activos"
        Cmd01Desc = "Primer paso antes de montar nada: comprueba si DISM ya tiene una imagen montada."
        Cmd02Title = "02 Info install.wim"
        Cmd02Desc = "Muestra indices, nombres y ediciones disponibles dentro de install.wim. Elige el indice correcto antes de montar."
        Cmd03Title = "03 Info install.esd"
        Cmd03Desc = "Muestra indices, nombres y ediciones disponibles dentro de install.esd. Util antes de convertir ESD a WIM."
        Cmd04Title = "04 Info boot.wim"
        Cmd04Desc = "Muestra los indices de boot.wim; el indice 2 suele ser Windows Setup."
        Cmd05Title = "05 Montar install.wim indice 1"
        Cmd05Desc = "Monta install.wim en Trabajo\offline para modificarlo. Cambia /Index:1 si la edicion que quieres esta en otro indice."
        Cmd06Title = "06 Montar install.wim Windows 11 Pro"
        Cmd06Desc = "Alternativa al indice: monta por nombre Windows 11 Pro, si existe exactamente con ese nombre."
        Cmd07Title = "07 Montar boot.wim indice 2"
        Cmd07Desc = "Monta el entorno de instalacion de Windows para inyectar drivers de almacenamiento o red."
        Cmd08Title = "08 Injectar drivers"
        Cmd08Desc = "Integra todos los drivers INF encontrados dentro de Trabajo\Drivers, de forma recursiva. Ejecutalo con una imagen ya montada."
        Cmd09Title = "09 Ver drivers integrados"
        Cmd09Desc = "Lista los drivers presentes en la imagen montada para comprobar que la inyeccion entro."
        Cmd10Title = "10 Injectar packages"
        Cmd10Desc = "Integra paquetes .cab o .msu desde Trabajo\packages en la imagen montada."
        Cmd11Title = "11 Ver packages integrados"
        Cmd11Desc = "Lista los paquetes instalados en la imagen montada."
        Cmd12Title = "12 StartComponentCleanup"
        Cmd12Desc = "Limpia componentes reemplazados para reducir peso tras integrar paquetes. No usa ResetBase."
        Cmd13Title = "13 Guardar y desmontar"
        Cmd13Desc = "Cierra el montaje y escribe todos los cambios en la imagen WIM. Usalo cuando todo este correcto."
        Cmd14Title = "14 Descartar y desmontar"
        Cmd14Desc = "Cierra el montaje descartando los cambios hechos durante esta sesion. Usalo si algo salio mal."
        Cmd15Title = "15 Recuperar montaje"
        Cmd15Desc = "Intenta recuperar un montaje que DISM dejo en estado inconsistente. Usalo antes de limpiar a lo bruto."
        Cmd16Title = "16 Limpiar montajes rotos"
        Cmd16Desc = "Limpia restos de montajes danados o abandonados por DISM. Usalo cuando Get-MountedImageInfo muestre problemas."
        Cmd17Title = "17 ESD a WIM"
        Cmd17Desc = "Convierte install.esd en install.wim para poder montarlo y modificarlo con comodidad."
        Cmd18Title = "18 WIM a ESD"
        Cmd18Desc = "Convierte install.wim a install.esd para ahorrar espacio."
        Cmd19Title = "19 Optimizar WIM"
        Cmd19Desc = "Exporta install.wim a un WIM nuevo comprimido; util para compactar y limpiar residuos internos."
        Cmd20Title = "20 Partir install.wim a SWM"
        Cmd20Desc = "Divide install.wim en install.swm/install2.swm para medios con limite FAT32. Los SWM quedan en images porque son install.*."
        Cmd21Title = "21 Montar ISO Win11"
        Cmd21Desc = "Monta la ISO guardada en Trabajo\ISOs para usarla como origen."
        Cmd22Title = "22 Desmontar ISO Win11"
        Cmd22Desc = "Desmonta la ISO Win11.iso del sistema."
        Cmd23Title = "23 Ver discos y volumenes"
        Cmd23Desc = "Muestra discos fisicos y letras de volumen para identificar USBs y medios montados."
        Cmd24Title = "24 Abrir log DISM"
        Cmd24Desc = "Abre el log principal de DISM en Notepad."
        Cmd25Title = "25 Montar install.wim con log del lab"
        Cmd25Desc = "Monta install.wim guardando log y scratch dentro del laboratorio. Util para diagnosticar errores."
        Cmd26Title = "26 Abrir red en OOBE"
        Cmd26Desc = "Abre conexiones de red durante la instalacion al usar Shift+F10."
    }
    fr = @{
        CopyConsoleTitle = "COMMANDES ESSENTIELLES - LAB WIN11"
        ViewCommand = "Voir la commande"
        WhatItDoes = "Ce que ca fait"
        Risk = "Risque"
        Command = "Commande"
        CopyBackLine = "C = Copier    0 = Retour"
        Cmd01Title = "01 Voir les montages actifs"
        Cmd01Desc = "Premiere etape avant de monter quoi que ce soit: verifie si DISM a deja une image montee."
        Cmd02Title = "02 Info install.wim"
        Cmd02Desc = "Affiche les index, noms et editions disponibles dans install.wim. Choisissez le bon index avant de monter."
        Cmd03Title = "03 Info install.esd"
        Cmd03Desc = "Affiche les index, noms et editions disponibles dans install.esd. Utile avant de convertir ESD en WIM."
        Cmd04Title = "04 Info boot.wim"
        Cmd04Desc = "Affiche les index de boot.wim; l'index 2 est souvent Windows Setup."
        Cmd05Title = "05 Monter install.wim index 1"
        Cmd05Desc = "Monte install.wim dans Trabajo\offline pour le modifier. Changez /Index:1 si l'edition est sur un autre index."
        Cmd06Title = "06 Monter install.wim Windows 11 Pro"
        Cmd06Desc = "Alternative par nom: monte Windows 11 Pro si ce nom exact existe."
        Cmd07Title = "07 Monter boot.wim index 2"
        Cmd07Desc = "Monte l'environnement d'installation Windows pour injecter des pilotes stockage ou reseau."
        Cmd08Title = "08 Injecter des pilotes"
        Cmd08Desc = "Integre recursivement tous les pilotes INF trouves dans Trabajo\Drivers. A executer avec une image deja montee."
        Cmd09Title = "09 Voir les pilotes integres"
        Cmd09Desc = "Liste les pilotes presents dans l'image montee pour confirmer l'injection."
        Cmd10Title = "10 Injecter des packages"
        Cmd10Desc = "Integre les packages .cab ou .msu depuis Trabajo\packages dans l'image montee."
        Cmd11Title = "11 Voir les packages integres"
        Cmd11Desc = "Liste les packages installes dans l'image montee."
        Cmd12Title = "12 StartComponentCleanup"
        Cmd12Desc = "Nettoie les composants remplaces pour reduire la taille apres integration de packages. N'utilise pas ResetBase."
        Cmd13Title = "13 Enregistrer et demonter"
        Cmd13Desc = "Ferme le montage et ecrit tous les changements dans le WIM. A utiliser quand tout est correct."
        Cmd14Title = "14 Abandonner et demonter"
        Cmd14Desc = "Ferme le montage en abandonnant les changements de cette session. A utiliser si quelque chose a mal tourne."
        Cmd15Title = "15 Recuperer le montage"
        Cmd15Desc = "Essaie de recuperer un montage laisse par DISM dans un etat incoherent. A utiliser avant un nettoyage plus dur."
        Cmd16Title = "16 Nettoyer les montages casses"
        Cmd16Desc = "Nettoie les restes de montages DISM endommages ou abandonnes."
        Cmd17Title = "17 ESD vers WIM"
        Cmd17Desc = "Convertit install.esd en install.wim pour pouvoir le monter et le modifier facilement."
        Cmd18Title = "18 WIM vers ESD"
        Cmd18Desc = "Convertit install.wim en install.esd pour gagner de l'espace."
        Cmd19Title = "19 Optimiser WIM"
        Cmd19Desc = "Exporte install.wim vers un nouveau WIM compresse pour compacter et retirer les restes internes."
        Cmd20Title = "20 Diviser install.wim en SWM"
        Cmd20Desc = "Divise install.wim en install.swm/install2.swm pour les supports limites par FAT32. Les SWM restent dans images car ce sont des install.*."
        Cmd21Title = "21 Monter ISO Win11"
        Cmd21Desc = "Monte l'ISO stockee dans Trabajo\ISOs pour l'utiliser comme source."
        Cmd22Title = "22 Demonter ISO Win11"
        Cmd22Desc = "Demonte Win11.iso du systeme."
        Cmd23Title = "23 Voir disques et volumes"
        Cmd23Desc = "Affiche les disques physiques et lettres de volumes pour identifier USB et medias montes."
        Cmd24Title = "24 Ouvrir le journal DISM"
        Cmd24Desc = "Ouvre le journal principal de DISM dans Notepad."
        Cmd25Title = "25 Monter install.wim avec journal du lab"
        Cmd25Desc = "Monte install.wim avec journal et scratch dans le laboratoire. Utile pour diagnostiquer."
        Cmd26Title = "26 Ouvrir le reseau dans OOBE"
        Cmd26Desc = "Ouvre les connexions reseau pendant l'installation apres Shift+F10."
    }
    ro = @{
        CopyConsoleTitle = "COMENZI ESENTIALE - LAB WIN11"
        ViewCommand = "Vezi comanda"
        WhatItDoes = "Ce face"
        Risk = "Risc"
        Command = "Comanda"
        CopyBackLine = "C = Copiaza    0 = Inapoi"
        Cmd01Title = "01 Vezi montarile active"
        Cmd01Desc = "Primul pas inainte de orice montare: verifica daca DISM are deja o imagine montata."
        Cmd02Title = "02 Info install.wim"
        Cmd02Desc = "Arata indexurile, numele si editiile disponibile in install.wim. Alege indexul corect inainte de montare."
        Cmd03Title = "03 Info install.esd"
        Cmd03Desc = "Arata indexurile, numele si editiile disponibile in install.esd. Util inainte de conversia ESD in WIM."
        Cmd04Title = "04 Info boot.wim"
        Cmd04Desc = "Arata indexurile din boot.wim; indexul 2 este de obicei Windows Setup."
        Cmd05Title = "05 Monteaza install.wim index 1"
        Cmd05Desc = "Monteaza install.wim in Trabajo\offline pentru modificare. Schimba /Index:1 daca editia este in alt index."
        Cmd06Title = "06 Monteaza install.wim Windows 11 Pro"
        Cmd06Desc = "Alternativa dupa nume: monteaza Windows 11 Pro daca numele exact exista."
        Cmd07Title = "07 Monteaza boot.wim index 2"
        Cmd07Desc = "Monteaza mediul de instalare Windows pentru injectarea driverelor de stocare sau retea."
        Cmd08Title = "08 Injecteaza drivere"
        Cmd08Desc = "Integreaza recursiv toate driverele INF gasite in Trabajo\Drivers. Ruleaza cu o imagine deja montata."
        Cmd09Title = "09 Vezi drivere integrate"
        Cmd09Desc = "Listeaza driverele din imaginea montata pentru confirmarea injectarii."
        Cmd10Title = "10 Injecteaza packages"
        Cmd10Desc = "Integreaza pachete .cab sau .msu din Trabajo\packages in imaginea montata."
        Cmd11Title = "11 Vezi packages integrate"
        Cmd11Desc = "Listeaza pachetele instalate in imaginea montata."
        Cmd12Title = "12 StartComponentCleanup"
        Cmd12Desc = "Curata componentele inlocuite pentru a reduce dimensiunea dupa integrarea pachetelor. Nu foloseste ResetBase."
        Cmd13Title = "13 Salveaza si demonteaza"
        Cmd13Desc = "Inchide montarea si scrie toate modificarile in WIM. Foloseste cand totul este corect."
        Cmd14Title = "14 Renunta si demonteaza"
        Cmd14Desc = "Inchide montarea si renunta la modificarile acestei sesiuni. Foloseste daca ceva a mers prost."
        Cmd15Title = "15 Recupereaza montarea"
        Cmd15Desc = "Incearca recuperarea unei montari lasate de DISM intr-o stare inconsistenta."
        Cmd16Title = "16 Curata montarile defecte"
        Cmd16Desc = "Curata resturi de montari DISM deteriorate sau abandonate."
        Cmd17Title = "17 ESD in WIM"
        Cmd17Desc = "Converteste install.esd in install.wim pentru montare si modificare usoara."
        Cmd18Title = "18 WIM in ESD"
        Cmd18Desc = "Converteste install.wim in install.esd pentru economie de spatiu."
        Cmd19Title = "19 Optimizeaza WIM"
        Cmd19Desc = "Exporta install.wim intr-un WIM nou comprimat pentru compactare si curatare interna."
        Cmd20Title = "20 Imparte install.wim in SWM"
        Cmd20Desc = "Imparte install.wim in install.swm/install2.swm pentru medii cu limita FAT32. SWM ramane in images deoarece este install.*."
        Cmd21Title = "21 Monteaza ISO Win11"
        Cmd21Desc = "Monteaza ISO-ul din Trabajo\ISOs pentru folosire ca sursa."
        Cmd22Title = "22 Demonteaza ISO Win11"
        Cmd22Desc = "Demonteaza Win11.iso din sistem."
        Cmd23Title = "23 Vezi discuri si volume"
        Cmd23Desc = "Arata discuri fizice si litere de volum pentru identificarea USB-urilor si mediilor montate."
        Cmd24Title = "24 Deschide logul DISM"
        Cmd24Desc = "Deschide logul principal DISM in Notepad."
        Cmd25Title = "25 Monteaza install.wim cu log de lab"
        Cmd25Desc = "Monteaza install.wim cu log si scratch in laborator. Util pentru diagnostic."
        Cmd26Title = "26 Deschide reteaua in OOBE"
        Cmd26Desc = "Deschide conexiunile de retea in timpul instalarii dupa Shift+F10."
    }
    de = @{
        CopyConsoleTitle = "WICHTIGE BEFEHLE - WIN11 LAB"
        ViewCommand = "Befehl anzeigen"
        WhatItDoes = "Was es macht"
        Risk = "Risiko"
        Command = "Befehl"
        CopyBackLine = "C = Kopieren    0 = Zurueck"
        Cmd01Title = "01 Aktive Mounts anzeigen"
        Cmd01Desc = "Erster Schritt vor jedem Mount: prueft, ob DISM bereits ein Image gemountet hat."
        Cmd02Title = "02 Info install.wim"
        Cmd02Desc = "Zeigt Indexe, Namen und Editionen in install.wim. Waehlen Sie vor dem Mount den richtigen Index."
        Cmd03Title = "03 Info install.esd"
        Cmd03Desc = "Zeigt Indexe, Namen und Editionen in install.esd. Nuetzlich vor der Konvertierung von ESD zu WIM."
        Cmd04Title = "04 Info boot.wim"
        Cmd04Desc = "Zeigt die Indexe von boot.wim; Index 2 ist meistens Windows Setup."
        Cmd05Title = "05 install.wim Index 1 mounten"
        Cmd05Desc = "Mountet install.wim nach Trabajo\offline zur Bearbeitung. Aendern Sie /Index:1, wenn die Edition woanders liegt."
        Cmd06Title = "06 install.wim Windows 11 Pro mounten"
        Cmd06Desc = "Alternative per Name: mountet Windows 11 Pro, wenn dieser exakte Name existiert."
        Cmd07Title = "07 boot.wim Index 2 mounten"
        Cmd07Desc = "Mountet die Windows-Setup-Umgebung, um Speicher- oder Netzwerktreiber zu integrieren."
        Cmd08Title = "08 Treiber injizieren"
        Cmd08Desc = "Integriert rekursiv alle INF-Treiber aus Trabajo\Drivers. Mit bereits gemountetem Image ausfuehren."
        Cmd09Title = "09 Integrierte Treiber anzeigen"
        Cmd09Desc = "Listet Treiber im gemounteten Image, um die Integration zu pruefen."
        Cmd10Title = "10 Packages injizieren"
        Cmd10Desc = "Integriert .cab- oder .msu-Pakete aus Trabajo\packages in das gemountete Image."
        Cmd11Title = "11 Integrierte Packages anzeigen"
        Cmd11Desc = "Listet installierte Pakete im gemounteten Image."
        Cmd12Title = "12 StartComponentCleanup"
        Cmd12Desc = "Bereinigt ersetzte Komponenten nach Paketintegration zur Groessenreduzierung. Nutzt kein ResetBase."
        Cmd13Title = "13 Speichern und unmounten"
        Cmd13Desc = "Schliesst den Mount und schreibt alle Aenderungen ins WIM. Nutzen, wenn alles stimmt."
        Cmd14Title = "14 Verwerfen und unmounten"
        Cmd14Desc = "Schliesst den Mount und verwirft die Aenderungen dieser Sitzung. Nutzen, wenn etwas schiefging."
        Cmd15Title = "15 Mount wiederherstellen"
        Cmd15Desc = "Versucht einen von DISM inkonsistent hinterlassenen Mount wiederherzustellen."
        Cmd16Title = "16 Defekte Mounts bereinigen"
        Cmd16Desc = "Bereinigt beschaedigte oder verlassene DISM-Mount-Reste."
        Cmd17Title = "17 ESD zu WIM"
        Cmd17Desc = "Konvertiert install.esd zu install.wim, damit es bequem gemountet und bearbeitet werden kann."
        Cmd18Title = "18 WIM zu ESD"
        Cmd18Desc = "Konvertiert install.wim zu install.esd, um Platz zu sparen."
        Cmd19Title = "19 WIM optimieren"
        Cmd19Desc = "Exportiert install.wim in ein neues komprimiertes WIM, um zu verdichten und interne Reste zu entfernen."
        Cmd20Title = "20 install.wim in SWM teilen"
        Cmd20Desc = "Teilt install.wim in install.swm/install2.swm fuer Medien mit FAT32-Grenze. SWM bleibt in images, weil es install.* ist."
        Cmd21Title = "21 Win11 ISO mounten"
        Cmd21Desc = "Mountet die ISO aus Trabajo\ISOs zur Nutzung als Quelle."
        Cmd22Title = "22 Win11 ISO unmounten"
        Cmd22Desc = "Unmountet Win11.iso vom System."
        Cmd23Title = "23 Datentraeger und Volumes anzeigen"
        Cmd23Desc = "Zeigt physische Datentraeger und Volume-Buchstaben zur Identifikation von USB und gemounteten Medien."
        Cmd24Title = "24 DISM-Protokoll oeffnen"
        Cmd24Desc = "Oeffnet das Hauptprotokoll von DISM in Notepad."
        Cmd25Title = "25 install.wim mit Lab-Protokoll mounten"
        Cmd25Desc = "Mountet install.wim mit Protokoll und Scratch im Labor. Nuetzlich zur Diagnose."
        Cmd26Title = "26 Netzwerk in OOBE oeffnen"
        Cmd26Desc = "Oeffnet Netzwerkverbindungen waehrend Setup nach Shift+F10."
    }
}

if ([string]::IsNullOrWhiteSpace($LabRoot)) {
    $LabRoot = Split-Path -Parent $PSScriptRoot
}

$LabRoot = (Resolve-Path -LiteralPath $LabRoot).Path.TrimEnd("\")
$WorkRoot = Join-Path $LabRoot "Trabajo"

function Join-Work {
    param([string]$RelativePath)
    return (Join-Path $WorkRoot $RelativePath)
}

function Copy-TextToClipboard {
    param([string]$Text)

    try {
        Set-Clipboard -Value $Text -ErrorAction Stop
    }
    catch {
        $Text | clip.exe
    }
}

function Clear-LabHost {
    try { Clear-Host } catch { Write-Host "" }
}

$images = Join-Work "images"
$installWim = Join-Work "images\install.wim"
$installEsd = Join-Work "images\install.esd"
$bootWim = Join-Work "images\boot.wim"
$offline = Join-Work "offline"
$drivers = Join-Work "Drivers"
$packages = Join-Work "packages"
$isos = Join-Work "ISOs"
$logs = Join-Work "Logs"
$scratch = Join-Work "Scratch"

$commands = @(
    [pscustomobject]@{ Key = "Cmd01"; Risk = "Low"; Text = "Dism /Get-MountedImageInfo" },
    [pscustomobject]@{ Key = "Cmd02"; Risk = "Low"; Text = "Dism /Get-ImageInfo /ImageFile:`"$installWim`"" },
    [pscustomobject]@{ Key = "Cmd03"; Risk = "Low"; Text = "Dism /Get-ImageInfo /ImageFile:`"$installEsd`"" },
    [pscustomobject]@{ Key = "Cmd04"; Risk = "Low"; Text = "Dism /Get-ImageInfo /ImageFile:`"$bootWim`"" },
    [pscustomobject]@{ Key = "Cmd05"; Risk = "Medium"; Text = "Dism /Mount-Image /ImageFile:`"$installWim`" /Index:1 /MountDir:`"$offline`" /CheckIntegrity" },
    [pscustomobject]@{ Key = "Cmd06"; Risk = "Medium"; Text = "Dism /Mount-Image /ImageFile:`"$installWim`" /Name:`"Windows 11 Pro`" /MountDir:`"$offline`"" },
    [pscustomobject]@{ Key = "Cmd07"; Risk = "Medium"; Text = "DISM /Mount-Wim /WimFile:`"$bootWim`" /Index:2 /MountDir:`"$offline`"" },
    [pscustomobject]@{ Key = "Cmd08"; Risk = "Medium"; Text = "Dism /Image:`"$offline`" /Add-Driver /Driver:`"$drivers`" /Recurse /ForceUnsigned" },
    [pscustomobject]@{ Key = "Cmd09"; Risk = "Low"; Text = "Dism /Image:`"$offline`" /Get-Drivers /All /Format:Table" },
    [pscustomobject]@{ Key = "Cmd10"; Risk = "Medium"; Text = "Dism /Image:`"$offline`" /Add-Package /PackagePath:`"$packages`"" },
    [pscustomobject]@{ Key = "Cmd11"; Risk = "Low"; Text = "Dism /Image:`"$offline`" /Get-Packages /Format:Table" },
    [pscustomobject]@{ Key = "Cmd12"; Risk = "Medium"; Text = "Dism /Image:`"$offline`" /Cleanup-Image /StartComponentCleanup" },
    [pscustomobject]@{ Key = "Cmd13"; Risk = "High"; Text = "Dism /Unmount-Image /MountDir:`"$offline`" /Commit /CheckIntegrity" },
    [pscustomobject]@{ Key = "Cmd14"; Risk = "High"; Text = "Dism /Unmount-Image /MountDir:`"$offline`" /Discard" },
    [pscustomobject]@{ Key = "Cmd15"; Risk = "Medium"; Text = "Dism /Remount-Image /MountDir:`"$offline`"" },
    [pscustomobject]@{ Key = "Cmd16"; Risk = "Medium"; Text = "Dism /Cleanup-Mountpoints" },
    [pscustomobject]@{ Key = "Cmd17"; Risk = "Medium"; Text = "Dism /Export-Image /SourceImageFile:`"$installEsd`" /SourceIndex:1 /DestinationImageFile:`"$installWim`" /Compress:max /CheckIntegrity" },
    [pscustomobject]@{ Key = "Cmd18"; Risk = "Medium"; Text = "Dism /Export-Image /SourceImageFile:`"$installWim`" /SourceIndex:1 /DestinationImageFile:`"$installEsd`" /Compress:recovery /CheckIntegrity" },
    [pscustomobject]@{ Key = "Cmd19"; Risk = "Medium"; Text = "Dism /Export-Image /SourceImageFile:`"$installWim`" /SourceIndex:1 /DestinationImageFile:`"$images\install_optimizado.wim`" /Compress:max /CheckIntegrity" },
    [pscustomobject]@{ Key = "Cmd20"; Risk = "Medium"; Text = "Dism /Split-Image /ImageFile:`"$installWim`" /SWMFile:`"$images\install.swm`" /FileSize:4000" },
    [pscustomobject]@{ Key = "Cmd21"; Risk = "Low"; Text = "Mount-DiskImage -ImagePath `"$isos\Win11.iso`"" },
    [pscustomobject]@{ Key = "Cmd22"; Risk = "Low"; Text = "Dismount-DiskImage -ImagePath `"$isos\Win11.iso`"" },
    [pscustomobject]@{ Key = "Cmd23"; Risk = "Low"; Text = @"
Get-Disk | Sort-Object Number | Format-Table Number,FriendlyName,BusType,Size,PartitionStyle,IsBoot,IsSystem -AutoSize
Get-Volume | Sort-Object DriveLetter | Format-Table DriveLetter,FileSystemLabel,FileSystem,DriveType,SizeRemaining,Size -AutoSize
"@ },
    [pscustomobject]@{ Key = "Cmd24"; Risk = "Low"; Text = 'notepad "$env:WINDIR\Logs\DISM\dism.log"' },
    [pscustomobject]@{ Key = "Cmd25"; Risk = "Medium"; Text = "Dism /Mount-Image /ImageFile:`"$installWim`" /Index:1 /MountDir:`"$offline`" /LogPath:`"$logs\mount.log`" /ScratchDir:`"$scratch`"" },
    [pscustomobject]@{ Key = "Cmd26"; Risk = "Low"; Text = "ncpa.cpl" }
)

while ($true) {
    Clear-LabHost
    Write-LabSection (L "CopyConsoleTitle")

    for ($i = 0; $i -lt $commands.Count; $i++) {
        Write-Host ("{0,2}. {1}" -f ($i + 1), (L "$($commands[$i].Key)Title"))
    }
    Write-Host (" 0. {0}" -f (L "Back"))
    Write-Host ""

    $rawAnswer = Read-Host (L "ViewCommand")
    if ($null -eq $rawAnswer) { return }
    $answer = $rawAnswer.Trim()
    if ([Console]::IsInputRedirected -and [string]::IsNullOrWhiteSpace($answer)) {
        return
    }
    if ($answer -eq "0") { return }

    $number = 0
    if (-not [int]::TryParse($answer, [ref]$number) -or $number -lt 1 -or $number -gt $commands.Count) {
        Write-Host (L "InvalidNumber") -ForegroundColor Yellow
        Start-Sleep -Seconds 1
        continue
    }

    $selected = $commands[$number - 1]

    while ($true) {
        $titleText = L "$($selected.Key)Title"
        Clear-LabHost
        Write-LabSection $titleText
        Write-LabSubsection ((L "WhatItDoes") + ":") Yellow
        Write-Host (L "$($selected.Key)Desc")
        Write-LabSubsection ((L "Risk") + ":") Yellow
        Write-Host (L $selected.Risk)
        Write-LabSubsection ((L "Command") + ":") Yellow
        Write-Host $selected.Text.Trim()
        Write-Host ""
        Write-Host (L "CopyBackLine")
        $rawAction = Read-Host (L "Option")
        if ($null -eq $rawAction) { return }
        $action = $rawAction.Trim()
        if ([Console]::IsInputRedirected -and [string]::IsNullOrWhiteSpace($action)) {
            return
        }

        if ($action -match '^[cC]$') {
            Copy-TextToClipboard -Text $selected.Text.Trim()
            Write-Host ""
            Write-Host (L "CopiedClipboard") -ForegroundColor Green
            Start-Sleep -Seconds 1
            break
        }

        if ($action -match '^[0vVbBrRzZ]$') {
            break
        }
    }
}
