[ English ](#english) | [ Español ](#español) | [ Français ](#français) | [ Română ](#română) | [ Deutsch ](#deutsch)

## English

# Lab Win11

Lab Win11 is a modular PowerShell suite for Windows 11 image servicing, hybrid UEFI/GPT USB partitioning, and deployment-media creation.

Official repository: [mariusdambu/Lab_Win11](https://github.com/mariusdambu/Lab_Win11)

### The lab at a glance

- Service Windows installation images with DISM and model-specific drivers or packages.
- Create hybrid UEFI/GPT USB media with a FAT32 boot partition and an exFAT/NTFS installation partition for large files.
- Build customized bootable Windows 11 ISOs and copy installation or boot images directly to USB, including SWM splitting for FAT32.

### Project map

- `00_MENU_LAB_WINDOWS11.ps1` — multilingual interactive control panel for the lab.
- `Herramientas/Modificar-InstallWim.ps1` — DISM workflow for `install.wim` and `boot.wim`; supports drivers in `Trabajo/Drivers/install` and `Trabajo/Drivers/boot`, package integration, and optimized export.
- `Herramientas/WINDOWS_USBPowerShell.PS1` — creates hybrid UEFI/GPT USB media with FAT32 boot and exFAT/NTFS installation partitions.
- `Herramientas/Crear-ISO-Windows11.ps1` — creates customized bootable ISOs with `oscdimg`.
- `Herramientas/copiar_install_wim.ps1` — copies installation images to USB targets and splits WIM files to SWM when required by FAT32.
- `Herramientas/copiar_boot_wim.ps1` — copies boot images to USB targets.
- `RapidDeploy_Toolkit/` — optional OOBE utilities for corporate Autopilot, Intune, and Entra ID provisioning.
- `Ayuda/` — quick guides and copy-ready commands.
- `Trabajo/` — local workspace for ISOs, images, drivers, packages, mount data, and logs.

### RapidDeploy Toolkit: optional corporate OOBE tools

`RapidDeploy_Toolkit` is **100% optional**. It is intended for corporate provisioning at the Windows first-run setup screen (OOBE), opened with **Shift + F10**, especially in Windows Autopilot and Microsoft Intune/Entra ID scenarios. Its tools include Autopilot hardware-hash capture through `MDM_DevDetail_Ext01`, Group Tag handling, enrollment diagnostics, NTP time resynchronization, manual MDM check-in with `DeviceEnroller.exe`, disk utilities, and model-based WIM selection.

If you only prepare a standard Windows 11 ISO or USB for personal or home use, you can ignore the toolkit completely. To use it, copy the entire contents of `RapidDeploy_Toolkit` to the root of the USB drive or another partition accessible from OOBE. Open Command Prompt with **Shift + F10**, switch to that drive, and run `menu.cmd`.

The toolkit's disk-wipe actions target **Disk 0**. DiskPart `clean` removes partition information; it does not securely overwrite or sanitize the drive. Verify the target and back up any required data before using those actions.

### SelectModel.cmd: Zero-Copy WIM switching

Windows Setup looks for its active installation image at `sources\install.wim`. In a mixed corporate fleet, each hardware model—such as an HP EliteBook, Lenovo ThinkPad, or Dell Latitude—may need a different WIM containing its own drivers and configuration.

`RapidDeploy_Toolkit\SelectModel.cmd` switches the image Windows Setup will use without copying the WIM payload. It uses the native Windows `move` command to return the current `sources\install.wim` to that image's model folder, then moves the selected model's `install.wim` into `sources\install.wim`. Since both locations are on the same USB volume, the filesystem updates directory metadata instead of copying the contents of a 10–15 GB file. This is normally completed in under a second, though exact timing depends on the USB device and filesystem. The folder for the active model is empty while its image is in `sources`.

Keep `sources` and every model folder on the same volume. FAT32 cannot store a single file larger than 4 GiB. Use the lab's exFAT/NTFS installation partition for a full-size WIM, or split the image if FAT32 is required.

### USB partitions and execution stages

USB media created by `Herramientas/WINDOWS_USBPowerShell.PS1` has two GPT partitions: FAT32 for UEFI boot files, and exFAT or NTFS for Windows installation files. Keep `sources\install.wim`, all model folders, and `SelectModel.cmd` on the **installation partition**. Run `SelectModel.cmd` from that partition so `move` stays within one volume; do not place model WIMs on the FAT32 boot partition.

```text
USB (GPT)
├── Partition 1 — FAT32 (boot): EFI\, sources\boot.wim
└── Partition 2 — exFAT/NTFS (installation): sources\install.wim, model folders, SelectModel.cmd, menu.cmd
```

Use `SelectModel.cmd` in **WinPE**, during initial Windows Setup and before installing Windows, to switch the installation image. Use `menu.cmd` in **OOBE**, after Windows is installed: press **Shift + F10** to open Command Prompt, then run the menu from the USB installation partition. OOBE tools include Autopilot hardware-hash capture through `Get-AutopilotHash.ps1`, NTP time synchronization, network commands, and diagnostics.

Do not leave `sources\install.wim` empty when you intend to start the standard assisted Windows installer. Setup must find its base image there; return or select the intended WIM before starting the installation wizard.
Contents of the installation partition root: (the active model's folder is empty while its WIM is in `sources`):

```text
INSTALL_PARTITION_ROOT:\
├── sources\
│   └── install.wim                 # Active image used by Windows Setup
├── HP_EliteBook_840_G10\
│   └── install.wim                 # Image ready to select
├── Lenovo_ThinkPad_T14\
│                                    # Empty while this model is active
├── scripts\                        # Toolkit utilities
├── SelectModel.cmd                 # Model image manager
└── menu.cmd                        # OOBE toolkit launcher (Shift + F10)
```

### Requirements and first use

- Windows 10 or Windows 11, Windows PowerShell 5.1, and administrator rights for the lab's disk and image operations.
- DISM is included with Windows. `oscdimg` must be available to create customized ISOs.
- Download the ZIP from this repository, extract it to a local folder, and run `start_lab.cmd` as administrator. Choose a language in the launcher.
- Put working files under `Trabajo`: ISOs in `Trabajo/ISOs`, images in `Trabajo/images`, extracted INF drivers in `Trabajo/Drivers`, and CAB/MSU packages in `Trabajo/packages`.
- The repository contains tools and documentation, not private deployment payloads. ISO/WIM/ESD/SWM files, driver packs, packages, logs, and temporary mount contents are excluded from Git.

---

## Español

# Lab Win11

Lab Win11 es una suite modular de PowerShell para modificar imágenes de Windows 11, crear particiones híbridas USB UEFI/GPT y preparar medios de despliegue.

Repositorio oficial: [mariusdambu/Lab_Win11](https://github.com/mariusdambu/Lab_Win11)

### El laboratorio de un vistazo

- Modifica imágenes de instalación de Windows con DISM e integra controladores y paquetes por modelo.
- Crea memorias USB híbridas UEFI/GPT con una partición de arranque FAT32 y otra de instalación exFAT/NTFS para archivos grandes.
- Genera ISO personalizadas arrancables de Windows 11 y copia imágenes de instalación o arranque directamente a USB, incluida la división SWM cuando FAT32 lo requiere.

### Mapa del proyecto

- `00_MENU_LAB_WINDOWS11.ps1` — panel interactivo multilingüe del laboratorio.
- `Herramientas/Modificar-InstallWim.ps1` — flujo DISM para `install.wim` y `boot.wim`; admite controladores en `Trabajo/Drivers/install` y `Trabajo/Drivers/boot`, integración de paquetes y exportación optimizada.
- `Herramientas/WINDOWS_USBPowerShell.PS1` — crea memorias USB híbridas UEFI/GPT con particiones de arranque FAT32 e instalación exFAT/NTFS.
- `Herramientas/Crear-ISO-Windows11.ps1` — genera ISO personalizadas arrancables con `oscdimg`.
- `Herramientas/copiar_install_wim.ps1` — copia imágenes de instalación a USB y divide los archivos WIM en SWM cuando FAT32 lo requiere.
- `Herramientas/copiar_boot_wim.ps1` — copia imágenes de arranque a memorias USB.
- `RapidDeploy_Toolkit/` — utilidades opcionales de OOBE para aprovisionamiento empresarial con Autopilot, Intune y Entra ID.
- `Ayuda/` — guías rápidas y comandos listos para copiar.
- `Trabajo/` — espacio local para ISO, imágenes, controladores, paquetes, montajes y registros.

### RapidDeploy_Toolkit: módulo opcional para OOBE empresarial

`RapidDeploy_Toolkit` es **100 % opcional**. Está pensado para el aprovisionamiento empresarial en la pantalla de configuración inicial de Windows (OOBE), que se abre con **Mayús + F10**, especialmente en escenarios con Windows Autopilot y Microsoft Intune/Entra ID. Incluye captura del hash de hardware de Autopilot mediante `MDM_DevDetail_Ext01`, gestión de etiquetas de grupo, diagnósticos de inscripción, resincronización horaria NTP, solicitud manual de sincronización MDM con `DeviceEnroller.exe`, utilidades de disco y selección de WIM por modelo.

Si solo preparas una ISO o una memoria USB estándar de Windows 11 para uso personal o doméstico, puedes ignorar el módulo por completo. Para utilizarlo, copia el contenido íntegro de `RapidDeploy_Toolkit` a la raíz del USB o a otra partición accesible desde OOBE. Abre la consola de comandos de Windows con **Mayús + F10**, cambia a esa unidad y ejecuta `menu.cmd`.

Las funciones de borrado del módulo actúan sobre el **Disco 0**. DiskPart `clean` elimina la información de particiones, pero no sobrescribe ni sanitiza de forma segura la unidad. Verifica el destino y respalda los datos necesarios antes de usar esas funciones.

### SelectModel.cmd: cambio de WIM sin copiar datos

El instalador de Windows busca la imagen activa en `sources\install.wim`. En una flota empresarial con distintos equipos, cada modelo —por ejemplo, HP EliteBook, Lenovo ThinkPad o Dell Latitude— puede necesitar un WIM diferente con sus propios controladores y configuración.

`RapidDeploy_Toolkit\SelectModel.cmd` cambia la imagen que utilizará el instalador sin copiar el contenido del WIM. Usa el comando nativo de Windows `move` para devolver el `sources\install.wim` actual a la carpeta de su modelo y después mueve el `install.wim` del modelo elegido a `sources\install.wim`. Como ambas ubicaciones están en el mismo volumen USB, el sistema de archivos actualiza los metadatos del directorio en vez de copiar los datos de un archivo de 10–15 GB. Normalmente termina en menos de un segundo, aunque el tiempo exacto depende del USB y del sistema de archivos. La carpeta del modelo activo queda vacía mientras su imagen está en `sources`.

Mantén `sources` y todas las carpetas de modelo en el mismo volumen. FAT32 no admite un archivo individual superior a 4 GiB. Usa la partición de instalación exFAT/NTFS del laboratorio para un WIM completo o divide la imagen si necesitas FAT32.

### Particiones USB y fases de uso

Los medios creados con `Herramientas/WINDOWS_USBPowerShell.PS1` tienen dos particiones GPT: FAT32 para los archivos de arranque UEFI y exFAT o NTFS para los archivos de instalación de Windows. Mantén `sources\install.wim`, todas las carpetas de modelo y `SelectModel.cmd` en la **partición de instalación**. Ejecuta `SelectModel.cmd` desde esa partición para que `move` opere dentro de un solo volumen; no guardes los WIM de modelo en la partición FAT32 de arranque.

```text
USB (GPT)
├── Partición 1 — FAT32 (arranque): EFI\, sources\boot.wim
└── Partición 2 — exFAT/NTFS (instalación): sources\install.wim, carpetas de modelo, SelectModel.cmd, menu.cmd
```

Usa `SelectModel.cmd` en **WinPE**, durante el inicio del instalador de Windows y antes de instalar Windows, para cambiar la imagen de instalación. Usa `menu.cmd` en **OOBE**, después de instalar Windows: pulsa **Mayús + F10** para abrir la consola de comandos y ejecuta el menú desde la partición de instalación USB. Las herramientas de OOBE incluyen captura del hash de hardware de Autopilot con `Get-AutopilotHash.ps1`, sincronización horaria NTP, comandos de red y diagnósticos.

No dejes vacío `sources\install.wim` si vas a iniciar el instalador asistido estándar de Windows. El instalador debe encontrar allí la imagen base; devuelve o selecciona el WIM deseado antes de iniciar el asistente de instalación.
Contenido de la raíz de la partición de instalación: (la carpeta del modelo activo queda vacía mientras su WIM está en `sources`):

```text
INSTALL_PARTITION_ROOT:\
├── sources\
│   └── install.wim                 # Imagen activa del instalador de Windows
├── HP_EliteBook_840_G10\
│   └── install.wim                 # Imagen lista para seleccionar
├── Lenovo_ThinkPad_T14\
│                                    # Vacía mientras este modelo está activo
├── scripts\                        # Herramientas del módulo
├── SelectModel.cmd                 # Gestor de imágenes por modelo
└── menu.cmd                        # Inicio OOBE (Mayús + F10)
```

### Requisitos y primeros pasos

- Windows 10 o Windows 11, Windows PowerShell 5.1 y permisos de administrador para las operaciones de disco e imágenes del laboratorio.
- DISM viene incluido en Windows. Para generar ISO personalizadas, `oscdimg` debe estar disponible.
- Descarga el ZIP de este repositorio, extráelo en una carpeta local y ejecuta `start_lab.cmd` como administrador. Elige el idioma en el lanzador.
- Coloca los archivos de trabajo en `Trabajo`: las ISO en `Trabajo/ISOs`, las imágenes en `Trabajo/images`, los controladores INF extraídos en `Trabajo/Drivers` y los paquetes CAB/MSU en `Trabajo/packages`.
- El repositorio contiene herramientas y documentación, no archivos privados de instalación. Las ISO, imágenes WIM/ESD/SWM, paquetes de controladores, paquetes de instalación, registros y montajes temporales están excluidos de Git.

---

## Français

# Lab Win11

Lab Win11 est une suite modulaire PowerShell destinée à la maintenance des images Windows 11, au partitionnement hybride de clés USB UEFI/GPT et à la création de supports de déploiement.

Dépôt officiel : [mariusdambu/Lab_Win11](https://github.com/mariusdambu/Lab_Win11)

### Le laboratoire en bref

- Maintenir les images d’installation Windows avec DISM et intégrer des pilotes ou des paquets adaptés à chaque modèle.
- Créer des clés USB hybrides UEFI/GPT avec une partition de démarrage FAT32 et une partition d’installation exFAT/NTFS pour les gros fichiers.
- Créer des ISO Windows 11 personnalisées et amorçables, et copier directement les images d’installation ou de démarrage sur USB, avec fractionnement SWM si FAT32 l’exige.

### Présentation du projet

- `00_MENU_LAB_WINDOWS11.ps1` — panneau de contrôle interactif multilingue du laboratoire.
- `Herramientas/Modificar-InstallWim.ps1` — flux DISM pour `install.wim` et `boot.wim` ; prend en charge les pilotes dans `Trabajo/Drivers/install` et `Trabajo/Drivers/boot`, l’intégration de paquets et l’export optimisé.
- `Herramientas/WINDOWS_USBPowerShell.PS1` — crée des clés UEFI/GPT hybrides avec partitions de démarrage FAT32 et d’installation exFAT/NTFS.
- `Herramientas/Crear-ISO-Windows11.ps1` — crée des ISO personnalisées et amorçables avec `oscdimg`.
- `Herramientas/copiar_install_wim.ps1` — copie les images d’installation vers des clés USB et fractionne les WIM en fichiers SWM lorsque FAT32 l’exige.
- `Herramientas/copiar_boot_wim.ps1` — copie les images de démarrage vers des clés USB.
- `RapidDeploy_Toolkit/` — outils OOBE facultatifs pour le provisionnement d’entreprise avec Autopilot, Intune et Entra ID.
- `Ayuda/` — guides rapides et commandes prêtes à copier.
- `Trabajo/` — espace de travail local pour les ISO, images, pilotes, paquets, montages et journaux.

### RapidDeploy_Toolkit : outils OOBE facultatifs pour l’entreprise

`RapidDeploy_Toolkit` est **entièrement facultatif**. Il est conçu pour le provisionnement d’entreprise pendant la première configuration de Windows (OOBE), accessible avec **Maj + F10**, notamment avec Windows Autopilot et Microsoft Intune/Entra ID. Il comprend la capture du hash matériel Autopilot par `MDM_DevDetail_Ext01`, la gestion des étiquettes de groupe, les diagnostics d’inscription, la resynchronisation de l’heure par NTP, une demande de synchronisation MDM manuelle avec `DeviceEnroller.exe`, des outils de disque et la sélection d’un WIM par modèle.

Si vous préparez uniquement une ISO ou une clé USB Windows 11 standard pour un usage personnel ou familial, vous pouvez ignorer complètement cet outil. Pour l’utiliser, copiez tout le contenu de `RapidDeploy_Toolkit` à la racine de la clé USB ou d’une autre partition accessible depuis OOBE. Ouvrez l’invite de commandes avec **Maj + F10**, passez sur ce lecteur et lancez `menu.cmd`.

Les fonctions d’effacement de cette boîte à outils ciblent le **Disque 0**. DiskPart `clean` supprime les informations de partition, mais n’écrase pas les données de façon sécurisée et ne procède pas à la sanitisation du support. Vérifiez la cible et sauvegardez les données nécessaires avant d’utiliser ces fonctions.

### SelectModel.cmd : échange des WIM sans copie

Le programme d’installation Windows recherche l’image active dans `sources\install.wim`. Dans un parc d’entreprise hétérogène, chaque modèle — HP EliteBook, Lenovo ThinkPad ou Dell Latitude, par exemple — peut nécessiter un WIM différent avec ses propres pilotes et réglages.

`RapidDeploy_Toolkit\SelectModel.cmd` change l’image utilisée par le programme d’installation sans recopier le contenu du WIM. La commande Windows native `move` remet le `sources\install.wim` actif dans le dossier de son modèle, puis déplace le `install.wim` du modèle choisi vers `sources\install.wim`. Les deux emplacements étant sur le même volume USB, le système de fichiers met à jour les métadonnées du répertoire au lieu de recopier les données d’un fichier de 10 à 15 Go. L’opération prend généralement moins d’une seconde, selon la clé USB et le système de fichiers. Le dossier du modèle actif reste vide tant que son image se trouve dans `sources`.

Conservez `sources` et tous les dossiers de modèles sur le même volume. FAT32 ne peut pas stocker un fichier unique de plus de 4 Gio. Pour un WIM complet, utilisez la partition d’installation exFAT/NTFS du laboratoire ou fractionnez l’image si FAT32 est nécessaire.

### Partitions USB et phases d’utilisation

Les supports créés avec `Herramientas/WINDOWS_USBPowerShell.PS1` comportent deux partitions GPT : FAT32 pour les fichiers de démarrage UEFI, et exFAT ou NTFS pour les fichiers d’installation Windows. Gardez `sources\install.wim`, tous les dossiers de modèles et `SelectModel.cmd` sur la **partition d’installation**. Lancez `SelectModel.cmd` depuis cette partition afin que `move` reste sur le même volume ; ne placez pas les WIM des modèles sur la partition de démarrage FAT32.

```text
Clé USB (GPT)
├── Partition 1 — FAT32 (démarrage) : EFI\, sources\boot.wim
└── Partition 2 — exFAT/NTFS (installation) : sources\install.wim, dossiers de modèles, SelectModel.cmd, menu.cmd
```

Utilisez `SelectModel.cmd` dans **WinPE**, pendant le démarrage initial du programme d’installation Windows et avant l’installation de Windows, pour changer l’image d’installation. Utilisez `menu.cmd` dans **OOBE**, après l’installation de Windows : appuyez sur **Maj + F10** pour ouvrir l’invite de commandes, puis lancez le menu depuis la partition d’installation USB. Les outils OOBE comprennent la capture du hash matériel Autopilot avec `Get-AutopilotHash.ps1`, la synchronisation horaire NTP, des commandes réseau et des diagnostics.

Ne laissez pas `sources\install.wim` vide si vous comptez lancer l’assistant d’installation Windows standard. L’assistant Windows doit y trouver l’image de base ; remettez ou sélectionnez le WIM voulu avant de démarrer l’assistant.
Contenu de la racine de la partition d’installation : (le dossier du modèle actif est vide tant que son WIM se trouve dans `sources`) :

```text
INSTALL_PARTITION_ROOT:\
├── sources\
│   └── install.wim                 # Image active utilisée par le programme d’installation Windows
├── HP_EliteBook_840_G10\
│   └── install.wim                 # Image prête à être sélectionnée
├── Lenovo_ThinkPad_T14\
│                                    # Vide lorsque ce modèle est actif
├── scripts\                        # Outils de la boîte à outils
├── SelectModel.cmd                 # Gestionnaire des images par modèle
└── menu.cmd                        # Lanceur OOBE (Maj + F10)
```

### Prérequis et première utilisation

- Windows 10 ou Windows 11, Windows PowerShell 5.1 et des droits administrateur pour les opérations sur les disques et les images.
- DISM est inclus dans Windows. `oscdimg` doit être disponible pour créer des ISO personnalisées.
- Téléchargez l’archive ZIP de ce dépôt, extrayez-la dans un dossier local et lancez `start_lab.cmd` en tant qu’administrateur. Choisissez la langue dans le lanceur.
- Placez les fichiers de travail dans `Trabajo` : ISO dans `Trabajo/ISOs`, images dans `Trabajo/images`, pilotes INF extraits dans `Trabajo/Drivers` et paquets CAB/MSU dans `Trabajo/packages`.
- Le dépôt contient les outils et la documentation, pas les données privées de déploiement. Les ISO, images WIM/ESD/SWM, packs de pilotes, paquets, journaux et montages temporaires sont exclus de Git.

---

## Română

# Lab Win11

Lab Win11 este o suită modulară PowerShell pentru întreținerea imaginilor Windows 11, partiționarea hibridă USB UEFI/GPT și crearea mediilor de implementare.

Depozitul oficial: [mariusdambu/Lab_Win11](https://github.com/mariusdambu/Lab_Win11)

### Laboratorul pe scurt

- Întreține imaginile de instalare Windows cu DISM și integrează drivere sau pachete specifice fiecărui model.
- Creează medii USB hibride UEFI/GPT cu o partiție de pornire FAT32 și o partiție de instalare exFAT/NTFS pentru fișiere mari.
- Creează imagini ISO Windows 11 personalizate și bootabile și copiază direct imaginile de instalare sau pornire pe USB, cu împărțire SWM când FAT32 o impune.

### Structura proiectului

- `00_MENU_LAB_WINDOWS11.ps1` — panoul interactiv multilingv al laboratorului.
- `Herramientas/Modificar-InstallWim.ps1` — flux DISM pentru `install.wim` și `boot.wim`; acceptă drivere în `Trabajo/Drivers/install` și `Trabajo/Drivers/boot`, integrarea pachetelor și exportul optimizat.
- `Herramientas/WINDOWS_USBPowerShell.PS1` — creează medii USB hibride UEFI/GPT cu partiții de pornire FAT32 și de instalare exFAT/NTFS.
- `Herramientas/Crear-ISO-Windows11.ps1` — creează imagini ISO personalizate și bootabile cu `oscdimg`.
- `Herramientas/copiar_install_wim.ps1` — copiază imaginile de instalare pe USB și împarte fișierele WIM în SWM când FAT32 impune acest lucru.
- `Herramientas/copiar_boot_wim.ps1` — copiază imaginile de pornire pe memorii USB.
- `RapidDeploy_Toolkit/` — utilitare OOBE opționale pentru aprovizionarea companiilor cu Autopilot, Intune și Entra ID.
- `Ayuda/` — ghiduri rapide și comenzi gata de copiat.
- `Trabajo/` — spațiu local pentru imagini ISO, imagini Windows, drivere, pachete, montări și jurnale.

### RapidDeploy_Toolkit: utilitare OOBE opționale pentru companii

`RapidDeploy_Toolkit` este **100% opțional**. Este destinat aprovizionării în companii, în ecranul de configurare inițială Windows (OOBE), deschis cu **Shift + F10**, în special pentru scenarii Windows Autopilot și Microsoft Intune/Entra ID. Include capturarea hash-ului hardware Autopilot prin `MDM_DevDetail_Ext01`, gestionarea etichetelor de grup, diagnosticarea înrolării, resincronizarea orei prin NTP, solicitarea unei sincronizări MDM manuale cu `DeviceEnroller.exe`, utilitare pentru discuri și selectarea imaginilor WIM după model.

Dacă pregătești doar un ISO sau un stick USB Windows 11 standard pentru uz personal ori casnic, poți ignora complet acest pachet de instrumente. Pentru utilizare, copiază întregul conținut al folderului `RapidDeploy_Toolkit` în rădăcina stickului USB sau pe o altă partiție accesibilă din OOBE. Deschide linia de comandă Windows cu **Shift + F10**, schimbă pe acea unitate și rulează `menu.cmd`.

Funcțiile de ștergere ale pachetului de instrumente vizează **Discul 0**. DiskPart `clean` elimină informațiile despre partiții, dar nu suprascrie securizat datele și nu sanitizează unitatea. Verifică destinația și salvează datele necesare înainte de folosirea acestor funcții.

### SelectModel.cmd: schimbarea imaginilor WIM fără copiere

Programul de instalare Windows caută imaginea activă la `sources\install.wim`. Într-o flotă de companie cu modele diferite, fiecare model — de exemplu HP EliteBook, Lenovo ThinkPad sau Dell Latitude — poate avea nevoie de un WIM propriu, cu driverele și configurația necesare.

`RapidDeploy_Toolkit\SelectModel.cmd` schimbă imaginea folosită de programul de instalare fără să copieze conținutul WIM-ului. Folosește comanda Windows `move` pentru a muta imaginea activă `sources\install.wim` în folderul modelului respectiv, apoi mută `install.wim` al modelului ales în `sources\install.wim`. Deoarece ambele locații sunt pe același volum USB, sistemul de fișiere actualizează metadatele directorului în loc să copieze datele unui fișier de 10–15 GB. De regulă, operația durează sub o secundă, dar timpul exact depinde de dispozitivul USB și de sistemul de fișiere. Folderul modelului activ este gol cât timp imaginea lui se află în `sources`.

Păstrează `sources` și toate folderele modelelor pe același volum. FAT32 nu poate stoca un singur fișier mai mare de 4 GiB. Pentru un WIM complet, folosește partiția de instalare exFAT/NTFS a laboratorului sau împarte imaginea dacă ai nevoie de FAT32.

### Partiții USB și etapele de utilizare

Mediile create cu `Herramientas/WINDOWS_USBPowerShell.PS1` au două partiții GPT: FAT32 pentru fișierele de pornire UEFI și exFAT sau NTFS pentru fișierele de instalare Windows. Păstrează `sources\install.wim`, toate folderele modelelor și `SelectModel.cmd` pe **partiția de instalare**. Rulează `SelectModel.cmd` de pe această partiție pentru ca `move` să rămână pe același volum; nu păstra WIM-urile modelelor pe partiția FAT32 de pornire.

```text
USB (GPT)
├── Partiția 1 — FAT32 (pornire): EFI\, sources\boot.wim
└── Partiția 2 — exFAT/NTFS (instalare): sources\install.wim, folderele modelelor, SelectModel.cmd, menu.cmd
```

Folosește `SelectModel.cmd` în **WinPE**, la pornirea inițială a programului de instalare Windows și înainte de instalarea Windows, pentru a schimba imaginea de instalare. Folosește `menu.cmd` în **OOBE**, după instalarea Windows: apasă **Shift + F10** pentru a deschide linia de comandă, apoi pornește meniul de pe partiția USB de instalare. Instrumentele OOBE includ capturarea hash-ului hardware Autopilot cu `Get-AutopilotHash.ps1`, resincronizarea orei prin NTP, comenzi de rețea și diagnosticare.

Nu lăsa `sources\install.wim` gol dacă vrei să pornești programul standard de instalare asistată a Windows. Programul de instalare trebuie să găsească acolo imaginea de bază; readu sau selectează WIM-ul dorit înainte de a porni expertul de instalare.
Conținutul rădăcinii partiției de instalare: (folderul modelului activ este gol cât timp WIM-ul său se află în `sources`):

```text
INSTALL_PARTITION_ROOT:\
├── sources\
│   └── install.wim                 # Imaginea activă folosită de programul de instalare Windows
├── HP_EliteBook_840_G10\
│   └── install.wim                 # Imagine pregătită pentru selectare
├── Lenovo_ThinkPad_T14\
│                                    # Gol cât timp acest model este activ
├── scripts\                        # Instrumente ale pachetului
├── SelectModel.cmd                 # Gestionarea imaginilor după model
└── menu.cmd                        # Pornire OOBE (Shift + F10)
```

### Cerințe și primii pași

- Windows 10 sau Windows 11, Windows PowerShell 5.1 și drepturi de administrator pentru operațiile de disc și imagini ale laboratorului.
- DISM este inclus în Windows. `oscdimg` trebuie să fie disponibil pentru crearea imaginilor ISO personalizate.
- Descarcă arhiva ZIP din acest depozit, extrage-o într-un folder local și pornește `start_lab.cmd` ca administrator. Alege limba din lansator.
- Pune fișierele de lucru în `Trabajo`: fișierele ISO în `Trabajo/ISOs`, imaginile în `Trabajo/images`, driverele INF extrase în `Trabajo/Drivers` și pachetele CAB/MSU în `Trabajo/packages`.
- Depozitul conține utilitarele și documentația, nu fișierele private de implementare. Fișierele ISO, WIM/ESD/SWM, pachetele de drivere, pachetele de instalare, jurnalele și montările temporare sunt excluse din Git.

---

## Deutsch

# Lab Win11

Lab Win11 ist eine modulare PowerShell-Suite für die Wartung von Windows-11-Abbildern, hybride UEFI/GPT-USB-Partitionierung und die Erstellung von Installationsmedien.

Offizielles Repository: [mariusdambu/Lab_Win11](https://github.com/mariusdambu/Lab_Win11)

### Das Labor auf einen Blick

- Windows-Installationsabbilder mit DISM warten und modellbezogene Treiber oder Pakete integrieren.
- Hybride UEFI/GPT-USB-Medien mit FAT32-Startpartition und exFAT-/NTFS-Installationspartition für große Dateien erstellen.
- Angepasste, startfähige Windows-11-ISOs erstellen und Installations- oder Startabbilder direkt auf USB kopieren; bei FAT32 einschließlich SWM-Aufteilung.

### Projektübersicht

- `00_MENU_LAB_WINDOWS11.ps1` — mehrsprachiges interaktives Steuerungsmenü des Labors.
- `Herramientas/Modificar-InstallWim.ps1` — DISM-Ablauf für `install.wim` und `boot.wim`; unterstützt Treiber unter `Trabajo/Drivers/install` und `Trabajo/Drivers/boot`, Paketintegration und optimierten Export.
- `Herramientas/WINDOWS_USBPowerShell.PS1` — erstellt hybride UEFI/GPT-USB-Medien mit FAT32-Start- und exFAT-/NTFS-Installationspartition.
- `Herramientas/Crear-ISO-Windows11.ps1` — erstellt angepasste, startfähige ISOs mit `oscdimg`.
- `Herramientas/copiar_install_wim.ps1` — kopiert Installationsabbilder auf USB-Ziele und teilt WIM-Dateien bei Bedarf für FAT32 in SWM-Dateien auf.
- `Herramientas/copiar_boot_wim.ps1` — kopiert Startabbilder auf USB-Datenträger.
- `RapidDeploy_Toolkit/` — optionale OOBE-Werkzeuge für die Unternehmensbereitstellung mit Autopilot, Intune und Entra ID.
- `Ayuda/` — Kurzanleitungen und kopierfertige Befehle.
- `Trabajo/` — lokaler Arbeitsbereich für ISOs, Abbilder, Treiber, Pakete, Einbindungen und Protokolle.

### RapidDeploy_Toolkit: optionale OOBE-Werkzeuge für Unternehmen

`RapidDeploy_Toolkit` ist **zu 100 % optional**. Es ist für die Unternehmensbereitstellung während der Windows-Ersteinrichtung (OOBE) gedacht, die mit **Umschalt + F10** geöffnet wird, insbesondere für Windows-Autopilot- und Microsoft-Intune/Entra-ID-Szenarien. Die Werkzeuge erfassen den Autopilot-Hardwarehash über `MDM_DevDetail_Ext01`, verwalten Gruppenzuordnungen, zeigen Registrierungsdiagnosen an, synchronisieren die Uhrzeit erneut über NTP, fordern mit `DeviceEnroller.exe` einen manuellen MDM-Abgleich an und bieten Datenträgerwerkzeuge sowie eine modellbezogene WIM-Auswahl.

Wenn Sie nur eine normale Windows-11-ISO oder einen USB-Datenträger für den privaten Gebrauch erstellen, können Sie die Werkzeugsammlung vollständig ignorieren. Zur Verwendung kopieren Sie den gesamten Inhalt von `RapidDeploy_Toolkit` in das Stammverzeichnis des USB-Datenträgers oder auf eine andere in OOBE erreichbare Partition. Öffnen Sie mit **Umschalt + F10** die Eingabeaufforderung, wechseln Sie zu diesem Laufwerk und starten Sie `menu.cmd`.

Die Löschfunktionen dieser Werkzeugsammlung zielen auf **Datenträger 0**. DiskPart `clean` entfernt die Partitionsinformationen, überschreibt die Daten aber nicht sicher und führt keine sicheres Löschverfahren durch. Prüfen Sie das Ziel und sichern Sie benötigte Daten, bevor Sie diese Funktionen verwenden.

### SelectModel.cmd: WIM-Abbilder ohne Kopieren wechseln

Windows-Installationsprogramm erwartet das aktive Installationsabbild unter `sources\install.wim`. In einer heterogenen Unternehmensflotte benötigt jedes Modell — etwa HP EliteBook, Lenovo ThinkPad oder Dell Latitude — möglicherweise ein eigenes WIM mit passenden Treibern und Einstellungen.

`RapidDeploy_Toolkit\SelectModel.cmd` wechselt das von Windows-Installationsprogramm verwendete Abbild, ohne den WIM-Inhalt zu kopieren. Der native Windows-Befehl `move` legt zuerst das aktive `sources\install.wim` in seinem Modellordner ab und verschiebt danach das `install.wim` des gewählten Modells nach `sources\install.wim`. Da beide Speicherorte auf demselben USB-Volume liegen, aktualisiert das Dateisystem die Verzeichnismetadaten, statt die Daten einer 10–15 GB großen Datei zu kopieren. Normalerweise dauert der Vorgang weniger als eine Sekunde; die genaue Zeit hängt jedoch vom USB-Gerät und Dateisystem ab. Der Ordner des aktiven Modells ist leer, solange sein Abbild in `sources` liegt.

`sources` und alle Modellordner müssen auf demselben Volume liegen. FAT32 kann keine einzelne Datei über 4 GiB speichern. Verwenden Sie für ein vollständiges WIM die exFAT-/NTFS-Installationspartition des Labors oder teilen Sie das Abbild, wenn FAT32 erforderlich ist.

### USB-Partitionen und Einsatzphasen

Mit `Herramientas/WINDOWS_USBPowerShell.PS1` erstellte Medien besitzen zwei GPT-Partitionen: FAT32 für UEFI-Startdateien und exFAT oder NTFS für Windows-Installationsdateien. Bewahren Sie `sources\install.wim`, alle Modellordner und `SelectModel.cmd` auf der **Installationspartition** auf. Starten Sie `SelectModel.cmd` von dieser Partition, damit `move` auf demselben Volume bleibt; speichern Sie die Modell-WIMs nicht auf der FAT32-Startpartition.

```text
USB (GPT)
├── Partition 1 — FAT32 (Start): EFI\, sources\boot.wim
└── Partition 2 — exFAT/NTFS (Installation): sources\install.wim, Modellordner, SelectModel.cmd, menu.cmd
```

Verwenden Sie `SelectModel.cmd` in **WinPE** während des anfänglichen Starts des Windows-Installationsprogramms und vor der Windows-Installation, um das Installationsabbild zu wechseln. Verwenden Sie `menu.cmd` in **OOBE** nach der Windows-Installation: Öffnen Sie mit **Umschalt + F10** die Eingabeaufforderung und starten Sie das Menü von der USB-Installationspartition. Zu den OOBE-Werkzeugen gehören die Autopilot-Hardwarehash-Erfassung mit `Get-AutopilotHash.ps1`, NTP-Zeitsynchronisierung, Netzwerkbefehle und Diagnosen.

Lassen Sie `sources\install.wim` nicht leer, wenn Sie das normale geführte Windows-Installationsprogramm starten möchten. Das Installationsprogramm muss dort das Basisabbild finden; legen Sie das gewünschte WIM zurück oder wählen Sie es aus, bevor Sie den Installationsassistenten starten.
Inhalt des Stammverzeichnisses der Installationspartition: (der Ordner des aktiven Modells ist leer, solange sein WIM in `sources` liegt):

```text
INSTALL_PARTITION_ROOT:\
├── sources\
│   └── install.wim                 # Aktives Abbild für das Windows-Installationsprogramm
├── HP_EliteBook_840_G10\
│   └── install.wim                 # Zur Auswahl bereitstehendes Abbild
├── Lenovo_ThinkPad_T14\
│                                    # Leer, solange dieses Modell aktiv ist
├── scripts\                        # Werkzeuge der Sammlung
├── SelectModel.cmd                 # Verwaltung der Abbilder nach Modell
└── menu.cmd                        # OOBE-Start (Umschalt + F10)
```

### Voraussetzungen und erste Schritte

- Windows 10 oder Windows 11, Windows PowerShell 5.1 und Administratorrechte für die Datenträger- und Abbildvorgänge des Labors.
- DISM ist in Windows enthalten. Für angepasste ISO-Dateien muss `oscdimg` verfügbar sein.
- Laden Sie das ZIP-Archiv aus diesem Repository herunter, entpacken Sie es in einen lokalen Ordner und starten Sie `start_lab.cmd` als Administrator. Wählen Sie die Sprache im Startprogramm.
- Legen Sie Arbeitsdateien unter `Trabajo` ab: ISOs in `Trabajo/ISOs`, Abbilder in `Trabajo/images`, entpackte INF-Treiber in `Trabajo/Drivers` und CAB/MSU-Pakete in `Trabajo/packages`.
- Das Repository enthält Werkzeuge und Dokumentation, keine privaten Bereitstellungsdaten. ISO-, WIM-/ESD-/SWM-Dateien, Treiberpakete, Installationspakete, Protokolle und temporäre Einbindungen sind von Git ausgeschlossen.