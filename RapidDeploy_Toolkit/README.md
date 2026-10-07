# RapidDeploy Toolkit

Portable, optional tools for Windows OOBE diagnostics and enterprise provisioning.

## English (EN)

This toolkit is **100% optional**. It is intended for enterprise Windows Autopilot, Microsoft Intune, and Microsoft Entra ID deployments. It can capture the Autopilot hardware hash through `MDM_DevDetail_Ext01`, add a preset or custom Group Tag to the CSV, display local Autopilot/Enrollment Status Page diagnostics, resynchronize time through Windows Time/NTP, and trigger a manual MDM check-in with `DeviceEnroller.exe`. It also includes disk and network utilities and a WIM image manager.

If you only prepare a standard Windows 11 ISO or USB for personal or home use, you can ignore this toolkit completely.

### Start from OOBE

1. Copy the **entire contents** of `RapidDeploy_Toolkit` to the root of the USB installation partition (exFAT/NTFS) (or another partition accessible from OOBE). `menu.cmd` must be at that root.
2. At the Windows first-setup screen, press **Shift + F10** to open Command Prompt.
3. Change to the drive containing the toolkit (for example, `E:`), then run `menu.cmd`.
4. Use the menu for hash capture and Group Tags, diagnostics, time synchronization, MDM check-in, or other deployment tasks.

The hash CSV is written under `HardwareIDs` beside the toolkit. It contains a device serial number and hardware hash; handle it as sensitive provisioning data.

### Disk erase warning

The quick and confirmed wipe actions both target **Disk 0** from `scripts\clean_disk0.txt`. The quick action has no confirmation; the safer menu action asks you to type `ERASE`. Both run DiskPart `clean` and convert Disk 0 to GPT. `clean` removes partition information; it is **not** a secure data-overwrite or media-sanitization operation. Before either action, verify that Disk 0 is the intended disposable drive and that required data is backed up. The confirmation does not change the target disk.

The toolkit is designed for Windows OOBE. Hash capture requires Windows/OOBE and may not work in bare WinPE. The time and MDM actions need the appropriate network, Windows services, and enrollment context.

## Español (ES)

Este toolkit es **100 % opcional** y está pensado para aprovisionamiento empresarial de Windows con Autopilot, Microsoft Intune y Microsoft Entra ID. Permite capturar el hash de hardware de Autopilot mediante `MDM_DevDetail_Ext01`, añadir al CSV una Group Tag predefinida o personalizada, mostrar diagnósticos locales de Autopilot y de la página de estado de inscripción, resincronizar la hora mediante el servicio de hora de Windows/NTP y solicitar una sincronización MDM manual con `DeviceEnroller.exe`. También incluye utilidades de disco y red y un administrador de imágenes WIM.

Si solo preparas una ISO o un USB estándar de Windows 11 para uso personal o doméstico, puedes ignorarlo por completo.

### Inicio desde OOBE

1. Copia el **contenido íntegro** de `RapidDeploy_Toolkit` a la raíz de la partición de instalación USB (exFAT/NTFS) (o a otra partición accesible desde OOBE). `menu.cmd` debe quedar en esa raíz.
2. En la pantalla de configuración inicial de Windows, pulsa **Mayús + F10** para abrir la consola de comandos.
3. Cambia a la unidad del toolkit (por ejemplo, `E:`) y ejecuta `menu.cmd`.
4. Usa el menú para capturar el hash y asignar Group Tags, consultar diagnósticos, resincronizar la hora, solicitar la sincronización MDM u otras tareas de despliegue.

El CSV del hash se guarda en `HardwareIDs`, junto al toolkit. Contiene el número de serie y el hash de hardware del dispositivo; trátalo como información sensible de aprovisionamiento.

### Advertencia sobre el borrado de disco

Las opciones de borrado rápido y con confirmación actúan ambas sobre el **Disco 0**, según `scripts\clean_disk0.txt`. La opción rápida no pide confirmación; la opción más segura del menú exige escribir `ERASE`. Ambas ejecutan DiskPart `clean` y convierten el Disco 0 a GPT. `clean` elimina la información de particiones, pero **no sobrescribe de forma segura los datos ni sanitiza el soporte**. Antes de usar cualquiera, verifica que el Disco 0 sea la unidad prescindible correcta y que los datos necesarios estén respaldados. La confirmación no cambia el disco de destino.

El toolkit está pensado para OOBE de Windows. La captura del hash requiere Windows/OOBE y puede no funcionar en WinPE básico. Las funciones de hora y MDM necesitan red, servicios de Windows y el contexto de inscripción correspondiente.

## Français (FR)

Cette boîte à outils est **100 % facultative**. Elle vise le provisionnement d’entreprise avec Windows Autopilot, Microsoft Intune et Microsoft Entra ID. Elle peut capturer le hash matériel Autopilot via `MDM_DevDetail_Ext01`, ajouter au CSV un Group Tag prédéfini ou personnalisé, afficher les diagnostics locaux Autopilot/ESP, resynchroniser l’heure avec le service Windows Time/NTP et déclencher une synchronisation MDM manuelle avec `DeviceEnroller.exe`. Elle comprend aussi des utilitaires de disque et de réseau ainsi qu’un gestionnaire d’images WIM.

Si vous préparez uniquement une ISO ou une clé USB Windows 11 standard pour un usage personnel ou familial, vous pouvez ignorer complètement cet outil.

### Lancement depuis OOBE

1. Copiez **tout le contenu** de `RapidDeploy_Toolkit` à la racine de la partition d’installation USB (exFAT/NTFS) (ou d’une autre partition accessible depuis OOBE). `menu.cmd` doit se trouver à cette racine.
2. À l’écran de première configuration de Windows, appuyez sur **Maj + F10** pour ouvrir l’invite de commandes.
3. Passez sur le lecteur du toolkit (par exemple `E:`), puis lancez `menu.cmd`.
4. Utilisez le menu pour capturer le hash et définir des Group Tags, consulter les diagnostics, resynchroniser l’heure ou déclencher le contrôle MDM.

Le CSV du hash est enregistré dans `HardwareIDs`, à côté du toolkit. Il contient le numéro de série et le hash matériel de l’appareil : protégez-le comme une donnée sensible de provisionnement.

### Avertissement concernant l’effacement du disque

Les deux options d’effacement ciblent le **Disque 0**, comme indiqué dans `scripts\clean_disk0.txt`. L’effacement rapide ne demande aucune confirmation ; l’option avec confirmation exige de saisir `ERASE`. Les deux exécutent DiskPart `clean` puis convertissent le Disque 0 en GPT. `clean` supprime les informations de partition ; il **n’effectue pas d’écrasement sécurisé des données ni de sanitisation du support**. Vérifiez que le Disque 0 est bien le disque destiné à être effacé et sauvegardez les données nécessaires. La confirmation ne change pas le disque ciblé.

L’outil est prévu pour OOBE Windows. La capture du hash nécessite Windows/OOBE et peut échouer dans un WinPE minimal. Les fonctions d’heure et de MDM nécessitent le réseau, les services Windows et un contexte d’inscription adapté.

## Română (RO)

Acest toolkit este **100% opțional** și este destinat aprovizionării enterprise Windows cu Autopilot, Microsoft Intune și Microsoft Entra ID. Poate captura hash-ul hardware Autopilot prin `MDM_DevDetail_Ext01`, poate adăuga în CSV un Group Tag presetat sau personalizat, poate afișa diagnostice locale Autopilot/ESP, poate resincroniza ora prin serviciul Windows Time/NTP și poate declanșa o sincronizare MDM manuală cu `DeviceEnroller.exe`. Include și utilitare pentru discuri și rețea, precum și un manager de imagini WIM.

Dacă pregătești doar un ISO sau un USB Windows 11 standard pentru uz personal sau casnic, poți ignora complet acest toolkit.

### Pornire din OOBE

1. Copiază **întregul conținut** al folderului `RapidDeploy_Toolkit` direct în rădăcina partiției USB de instalare (exFAT/NTFS) (sau a unei alte partiții accesibile din OOBE). `menu.cmd` trebuie să fie în acea rădăcină.
2. În ecranul de configurare inițială Windows, apasă **Shift + F10** pentru a deschide Command Prompt.
3. Schimbă pe unitatea toolkitului (de exemplu `E:`), apoi rulează `menu.cmd`.
4. Folosește meniul pentru capturarea hash-ului și Group Tags, diagnosticare, resincronizarea orei, sincronizarea MDM sau alte sarcini de deployment.

Fișierul CSV cu hash-ul este salvat în `HardwareIDs`, lângă toolkit. Conține numărul de serie și hash-ul hardware al dispozitivului; păstrează-l ca dată sensibilă de aprovizionare.

### Avertisment privind ștergerea discului

Ambele opțiuni de ștergere vizează **Discul 0**, conform `scripts\clean_disk0.txt`. Ștergerea rapidă nu cere confirmare; opțiunea cu confirmare cere să tastezi `ERASE`. Ambele rulează DiskPart `clean` și convertesc Discul 0 la GPT. `clean` elimină informațiile despre partiții; **nu suprascrie în mod securizat datele și nu sanitizează suportul**. Verifică înainte că Discul 0 este unitatea care trebuie ștearsă și salvează datele necesare. Confirmarea nu schimbă discul țintă.

Toolkitul este destinat OOBE Windows. Capturarea hash-ului necesită Windows/OOBE și poate să nu funcționeze în WinPE simplu. Funcțiile de oră și MDM necesită rețea, serviciile Windows și contextul de înscriere corespunzător.

## Deutsch (DE)

Dieses Toolkit ist **zu 100 % optional**. Es ist für die Unternehmensbereitstellung mit Windows Autopilot, Microsoft Intune und Microsoft Entra ID vorgesehen. Es kann den Autopilot-Hardwarehash über `MDM_DevDetail_Ext01` erfassen, einen voreingestellten oder benutzerdefinierten Group Tag in die CSV-Datei aufnehmen, lokale Autopilot-/ESP-Diagnosen anzeigen, die Uhrzeit über Windows Time/NTP neu synchronisieren und mit `DeviceEnroller.exe` eine manuelle MDM-Synchronisierung anstoßen. Zusätzlich enthält es Festplatten- und Netzwerkwerkzeuge sowie einen WIM-Image-Manager.

Wenn Sie nur eine normale Windows-11-ISO oder einen USB-Stick für den privaten Gebrauch erstellen, können Sie dieses Toolkit vollständig ignorieren.

### Start aus OOBE

1. Kopieren Sie den **gesamten Inhalt** von `RapidDeploy_Toolkit` direkt in das Stammverzeichnis der USB-Installationspartition (exFAT/NTFS) (oder einer anderen in OOBE erreichbaren Partition). `menu.cmd` muss dort direkt liegen.
2. Drücken Sie am Windows-Ersteinrichtungsbildschirm **Umschalt + F10**, um die Eingabeaufforderung zu öffnen.
3. Wechseln Sie zum Laufwerk des Toolkits (zum Beispiel `E:`) und starten Sie `menu.cmd`.
4. Nutzen Sie das Menü für Hash-Erfassung und Group Tags, Diagnosen, Zeitsynchronisierung, MDM-Abgleich und weitere Bereitstellungsaufgaben.

Die Hash-CSV wird im Ordner `HardwareIDs` neben dem Toolkit gespeichert. Sie enthält Seriennummer und Hardwarehash des Geräts und ist als vertrauliche Bereitstellungsinformation zu behandeln.

### Warnung zum Löschen des Datenträgers

Beide Löschfunktionen zielen auf **Datenträger 0**, wie in `scripts\clean_disk0.txt` festgelegt. Die schnelle Löschfunktion fragt nicht nach; die bestätigte Variante verlangt die Eingabe von `ERASE`. Beide führen DiskPart `clean` aus und konvertieren Datenträger 0 zu GPT. `clean` entfernt die Partitionsinformationen; es **überschreibt die Daten nicht sicher und löscht den Datenträger nicht gemäß einem Sanitization-Verfahren**. Prüfen Sie vorab, dass Datenträger 0 tatsächlich gelöscht werden darf, und sichern Sie benötigte Daten. Die Bestätigung ändert das Ziel nicht.

Das Toolkit ist für Windows-OOBE vorgesehen. Die Hash-Erfassung benötigt Windows/OOBE und funktioniert möglicherweise nicht in einer einfachen WinPE-Umgebung. Zeit- und MDM-Funktionen benötigen Netzwerkzugriff, Windows-Dienste und einen passenden Registrierungsstatus.

## Zero-Copy model image switching

Windows Setup expects its active operating-system image at `\sources\install.wim`. In a corporate fleet, different hardware models (for example, HP EliteBook, Lenovo ThinkPad, and Dell Latitude) may need separate WIM images with model-specific drivers and configuration.

`SelectModel.cmd` keeps each model image in a folder at the USB root and uses the native Windows `move` command to exchange it with `sources\install.wim`. When a different model is selected, the current image is returned to its model folder and the selected image is moved into `sources`. Because both paths are on the same USB volume, this is a filesystem move/rename: it does not copy the 8–15 GB image contents. The change is normally near-instant, although actual timing depends on the filesystem and device. Keep the model folders and `sources` on the same volume. FAT32 cannot hold a single file larger than 4 GiB; use the lab's exFAT/NTFS installation partition for full-size WIM files, or split the image when FAT32 is required.

Example layout (the active model's folder is empty while its WIM is in `sources`):

```text
USB_ROOT:\
├── sources\
│   └── install.wim          # Active image consumed by Windows Setup
├── HP_EliteBook_840_G10\
│   └── install.wim          # Image waiting for selection
├── Lenovo_ThinkPad_T14\
│                            # Empty while this model is active
├── scripts\                 # Toolkit utilities
└── menu.cmd                 # OOBE launcher (Shift + F10)
```

The model-selection menu returns the currently active WIM to its model folder before placing the selected WIM at the standard Setup path. It switches which image Setup sees; it does not duplicate images.

## Sélection des images par modèle sans copie

Le programme d’installation Windows attend l’image active à l’emplacement `\sources\install.wim`. Dans un parc d’entreprise, chaque modèle (HP EliteBook, Lenovo ThinkPad, Dell Latitude, etc.) peut nécessiter une image WIM avec ses propres pilotes et réglages.

`SelectModel.cmd` conserve les images dans des dossiers de modèles à la racine de la clé et utilise la commande Windows native `move` pour échanger l’image avec `sources\install.wim`. Lorsqu’un autre modèle est choisi, l’image active retourne dans son dossier, puis l’image choisie est déplacée vers `sources`. Comme les deux chemins se trouvent sur le même volume USB, le système de fichiers déplace/renomme l’entrée sans recopier les 8 à 15 Go de données. L’opération est généralement presque instantanée, selon le système de fichiers et le périphérique. Les dossiers des modèles et `sources` doivent rester sur le même volume. FAT32 ne peut pas contenir un fichier unique de plus de 4 Gio ; utilisez la partition d’installation exFAT/NTFS du laboratoire pour les grands fichiers WIM, ou fractionnez l’image si FAT32 est nécessaire.

Exemple d’organisation (le dossier du modèle actif est vide tant que son WIM se trouve dans `sources`) :

```text
USB_ROOT:\
├── sources\
│   └── install.wim          # Image active utilisée par Windows Setup
├── HP_EliteBook_840_G10\
│   └── install.wim          # Image en attente de sélection
├── Lenovo_ThinkPad_T14\
│                            # Vide lorsque ce modèle est actif
├── scripts\                 # Outils du toolkit
└── menu.cmd                 # Lanceur OOBE (Maj + F10)
```

Le menu remet d’abord l’image active dans son dossier de modèle, puis place l’image choisie à l’emplacement standard de Windows Setup. Il change l’image visible par le programme d’installation sans la dupliquer.

## Cambio de imagen por modelo sin copiar datos

El instalador de Windows busca la imagen activa en `\sources\install.wim`. En una flota empresarial, cada modelo (HP EliteBook, Lenovo ThinkPad, Dell Latitude, etc.) puede necesitar una imagen WIM con sus propios controladores y ajustes.

`SelectModel.cmd` guarda las imágenes en carpetas por modelo en la raíz del USB y usa el comando nativo de Windows `move` para intercambiarla con `sources\install.wim`. Al elegir otro modelo, devuelve la imagen activa a su carpeta y mueve la seleccionada a `sources`. Como ambas rutas están en el mismo volumen USB, el sistema de archivos cambia la ubicación/nombre sin copiar los 8–15 GB de contenido. Normalmente es casi instantáneo, aunque depende del sistema de archivos y del dispositivo. Las carpetas de modelos y `sources` deben estar en el mismo volumen. FAT32 no admite un archivo individual superior a 4 GiB; para WIM grandes usa la partición de instalación exFAT/NTFS del laboratorio o divide la imagen si necesitas FAT32.

Ejemplo (la carpeta del modelo activo queda vacía mientras su WIM está en `sources`):

```text
USB_ROOT:\
├── sources\
│   └── install.wim          # Imagen activa que usa Windows Setup
├── HP_EliteBook_840_G10\
│   └── install.wim          # Imagen pendiente de selección
├── Lenovo_ThinkPad_T14\
│                            # Vacía mientras este modelo está activo
├── scripts\                 # Utilidades del toolkit
└── menu.cmd                 # Lanzador de OOBE (Mayús + F10)
```

El menú devuelve la imagen activa a su carpeta y mueve la elegida a la ruta estándar del instalador. Así cambia la imagen que verá Setup sin duplicar archivos.

## Selectarea imaginii după model fără copiere

Programul de instalare Windows caută imaginea activă la `\sources\install.wim`. Într-o flotă de companie, fiecare model (HP EliteBook, Lenovo ThinkPad, Dell Latitude etc.) poate avea nevoie de o imagine WIM cu drivere și setări proprii.

`SelectModel.cmd` păstrează imaginile în folderele modelelor de la rădăcina stickului și folosește comanda Windows `move` pentru a le schimba cu `sources\install.wim`. La selectarea altui model, imaginea activă revine în folderul ei, iar imaginea selectată este mutată în `sources`. Deoarece ambele căi sunt pe același volum USB, sistemul de fișiere mută sau redenumește intrarea fără să copieze cei 8–15 GB de date. Operația este de obicei aproape instantanee, în funcție de sistemul de fișiere și dispozitiv. Folderele modelelor și `sources` trebuie să rămână pe același volum. FAT32 nu poate stoca un fișier individual mai mare de 4 GiB; folosește partiția de instalare exFAT/NTFS a laboratorului pentru WIM-uri mari sau împarte imaginea dacă este necesar FAT32.

Exemplu (folderul modelului activ este gol cât timp WIM-ul său se află în `sources`):

```text
USB_ROOT:\
├── sources\
│   └── install.wim          # Imaginea activă folosită de Windows Setup
├── HP_EliteBook_840_G10\
│   └── install.wim          # Imaginea care așteaptă selecția
├── Lenovo_ThinkPad_T14\
│                            # Gol cât timp acest model este activ
├── scripts\                 # Utilitare toolkit
└── menu.cmd                 # Lansator OOBE (Shift + F10)
```

Meniul mută imaginea activă în folderul modelului, apoi mută imaginea selectată la calea standard Windows Setup. Schimbă imaginea folosită de programul de instalare fără să creeze o copie.

## Zero-Copy-Auswahl des Modellabbilds

Windows Setup erwartet das aktive Abbild unter `\sources\install.wim`. In einer heterogenen Unternehmensflotte benötigt jedes Modell (HP EliteBook, Lenovo ThinkPad, Dell Latitude usw.) möglicherweise ein eigenes WIM mit passenden Treibern und Einstellungen.

`SelectModel.cmd` speichert die Abbilder in Modellordnern im Stammverzeichnis des USB-Laufwerks und verwendet den nativen Windows-Befehl `move`, um ein Abbild mit `sources\install.wim` auszutauschen. Bei der Auswahl eines anderen Modells wird das aktive Abbild in seinen Modellordner zurückgelegt und das ausgewählte Abbild nach `sources` verschoben. Da beide Pfade auf demselben USB-Datenträger liegen, verschiebt bzw. benennt das Dateisystem den Eintrag um, ohne die 8–15 GB zu kopieren. Das geht normalerweise nahezu sofort; Dateisystem und Gerät beeinflussen die Dauer. Modellordner und `sources` müssen auf demselben Volume liegen. FAT32 unterstützt keine einzelne Datei über 4 GiB. Verwenden Sie für große WIM-Dateien die exFAT-/NTFS-Installationspartition des Labors oder teilen Sie das Abbild, wenn FAT32 erforderlich ist.

Beispiel (der Ordner des aktiven Modells ist leer, solange dessen WIM in `sources` liegt):

```text
USB_ROOT:\
├── sources\
│   └── install.wim          # Aktives Abbild für Windows Setup
├── HP_EliteBook_840_G10\
│   └── install.wim          # Noch nicht ausgewähltes Abbild
├── Lenovo_ThinkPad_T14\
│                            # Leer, solange dieses Modell aktiv ist
├── scripts\                 # Toolkit-Werkzeuge
└── menu.cmd                 # OOBE-Starter (Umschalt + F10)
```

Das Menü legt zuerst das aktive Abbild in seinen Modellordner zurück und verschiebt anschließend das gewählte Abbild an den Standardpfad von Windows Setup. So wird das für Setup sichtbare Abbild gewechselt, ohne es zu duplizieren.

## WinPE and OOBE are separate stages (EN)

The lab-created USB has two GPT partitions: FAT32 for UEFI boot files and exFAT/NTFS for installation files. Store `sources\install.wim`, model folders and `SelectModel.cmd` on the exFAT/NTFS installation partition, and run the switcher there. Use `SelectModel.cmd` in WinPE before installing Windows. After installation, use `menu.cmd` in OOBE with Shift + F10 for Autopilot hash capture (`Get-AutopilotHash.ps1`), NTP synchronization, network commands and diagnostics. Do not start standard assisted Setup while `sources\install.wim` is empty.

## WinPE y OOBE son fases distintas (ES)

El USB creado por el laboratorio tiene dos particiones GPT: FAT32 para el arranque UEFI y exFAT/NTFS para los archivos de instalación. Guarda `sources\install.wim`, las carpetas de modelo y `SelectModel.cmd` en la partición de instalación exFAT/NTFS y ejecuta allí el selector. Usa `SelectModel.cmd` en WinPE antes de instalar Windows. Tras la instalación, usa `menu.cmd` en OOBE con Mayús + F10 para capturar el hash de Autopilot (`Get-AutopilotHash.ps1`), sincronizar la hora NTP, ejecutar comandos de red y consultar diagnósticos. No inicies el instalador asistido estándar si `sources\install.wim` está vacío.

## WinPE et OOBE sont deux phases distinctes (FR)

La clé créée par le laboratoire comporte deux partitions GPT : FAT32 pour le démarrage UEFI et exFAT/NTFS pour les fichiers d’installation. Placez `sources\install.wim`, les dossiers de modèles et `SelectModel.cmd` sur la partition d’installation exFAT/NTFS et lancez le sélecteur depuis celle-ci. Utilisez `SelectModel.cmd` dans WinPE avant d’installer Windows. Après l’installation, utilisez `menu.cmd` dans OOBE avec Maj + F10 pour capturer le hash Autopilot (`Get-AutopilotHash.ps1`), synchroniser l’heure par NTP, exécuter des commandes réseau et consulter les diagnostics. Ne lancez pas l’installation guidée standard si `sources\install.wim` est vide.

## WinPE și OOBE sunt etape diferite (RO)

Stickul creat de laborator are două partiții GPT: FAT32 pentru pornirea UEFI și exFAT/NTFS pentru fișierele de instalare. Păstrează `sources\install.wim`, folderele modelelor și `SelectModel.cmd` pe partiția exFAT/NTFS și rulează selectorul de acolo. Folosește `SelectModel.cmd` în WinPE înainte de instalarea Windows. După instalare, folosește `menu.cmd` în OOBE cu Shift + F10 pentru capturarea hash-ului Autopilot (`Get-AutopilotHash.ps1`), resincronizarea orei prin NTP, comenzi de rețea și diagnosticare. Nu porni instalarea standard asistată dacă `sources\install.wim` este gol.

## WinPE und OOBE sind getrennte Phasen (DE)

Der vom Labor erstellte USB-Datenträger besitzt zwei GPT-Partitionen: FAT32 für den UEFI-Start und exFAT/NTFS für die Installationsdateien. Speichern Sie `sources\install.wim`, die Modellordner und `SelectModel.cmd` auf der exFAT-/NTFS-Installationspartition und starten Sie den Auswahlbefehl dort. Verwenden Sie `SelectModel.cmd` in WinPE vor der Windows-Installation. Nach der Installation verwenden Sie `menu.cmd` in OOBE mit Umschalt + F10, um den Autopilot-Hash zu erfassen (`Get-AutopilotHash.ps1`), die Zeit per NTP abzugleichen, Netzwerkbefehle auszuführen und Diagnosen abzurufen. Starten Sie die normale geführte Installation nicht, solange `sources\install.wim` leer ist.
