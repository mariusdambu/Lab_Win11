# Lab Win11

Windows 11 deployment lab for preparing install images and USB media.

Official repository: `https://github.com/mariusdambu/Lab_Win11`

## First Use

1. Download the ZIP from the official GitHub repository.
2. Extract the ZIP to a local folder, for example `C:\Lab_Win11`.
3. Open the extracted folder.
4. Right-click `start_lab.cmd` and choose **Run as administrator**.
5. Accept the Windows UAC prompt.
6. Choose your language.
7. Put your working files under `Trabajo`:
   - `Trabajo\ISOs` for Windows ISO files
   - `Trabajo\images` for `boot.wim`, `install.wim`, `install.esd` or `install*.swm`
   - `Trabajo\Drivers` for extracted INF drivers
   - `Trabajo\packages` for CAB/MSU packages

The lab uses Windows PowerShell 5.1, DISM and standard Windows deployment tools.
`start_lab.cmd` calls `Bootstrap-Lab.ps1`, which handles the initial elevation and then launches the lab menu.

During the first startup, the lab validates its structure, checks required Windows tools and unblocks the lab files that Windows may have marked as downloaded from the Internet.

If Windows Smart App Control or SmartScreen shows a warning, verify that the ZIP came from the official GitHub repository before continuing. Do not disable Smart App Control, Defender or SmartScreen to use this lab.

## Important

Real deployment payload is intentionally ignored by Git:

- ISO files
- WIM/ESD/SWM images
- driver packs
- packages
- logs
- temporary mount contents
- private local sync helpers

The repository contains the lab, not your private deployment payload.

## Location

Use this lab from:

```text
folder where the ZIP was extracted
```

## Optional enterprise OOBE toolkit

`RapidDeploy_Toolkit` is a portable, **100% optional** set of OOBE tools for enterprise Windows Autopilot, Intune and Entra ID provisioning. It supports hardware-hash capture with Group Tags, local diagnostics, time resynchronization and a manual MDM check-in. Copy its contents to the root of an OOBE-accessible USB/partition and run `menu.cmd` from Command Prompt opened with **Shift + F10**. Personal/home Windows 11 ISO or USB preparation does not require it.

Read [`RapidDeploy_Toolkit/README.md`](RapidDeploy_Toolkit/README.md) before use. Its disk-wipe actions are destructive and always target Disk 0; the confirmation prompt does not change the target.

## Project map (EN)

- `00_MENU_LAB_WINDOWS11.ps1` — multilingual interactive lab control panel.
- `Herramientas\Modificar-InstallWim.ps1` — DISM servicing workflow for `install.wim` and `boot.wim`, including driver injection from `Trabajo\Drivers\install` and `Trabajo\Drivers\boot`, package integration and optimized export.
- `Herramientas\WINDOWS_USBPowerShell.PS1` — creates a hybrid UEFI/GPT USB with a FAT32 boot partition and an exFAT/NTFS installation partition for large files.
- `Herramientas\Crear-ISO-Windows11.ps1` — builds customized bootable Windows ISOs with `oscdimg`.
- `Herramientas\copiar_install_wim.ps1` / `Herramientas\copiar_boot_wim.ps1` — copy install/boot images directly to USB targets, including SWM splitting for FAT32.
- `RapidDeploy_Toolkit\` — **100% optional** OOBE (`Shift + F10`) toolkit for corporate Autopilot/Intune/Entra ID provisioning, hardware-hash capture, NTP resynchronization, diagnostics, MDM check-in and multi-model Zero-Copy WIM switching.

## Mapa del proyecto (ES)

- `00_MENU_LAB_WINDOWS11.ps1` — panel interactivo multilingüe del laboratorio.
- `Herramientas\Modificar-InstallWim.ps1` — flujo DISM para `install.wim` y `boot.wim`, inyección de controladores desde `Trabajo\Drivers\install` y `Trabajo\Drivers\boot`, integración de paquetes y exportación optimizada.
- `Herramientas\WINDOWS_USBPowerShell.PS1` — crea un USB híbrido UEFI/GPT con partición de arranque FAT32 y partición de instalación exFAT/NTFS para archivos grandes.
- `Herramientas\Crear-ISO-Windows11.ps1` — genera ISO de Windows personalizadas y arrancables con `oscdimg`.
- `Herramientas\copiar_install_wim.ps1` / `Herramientas\copiar_boot_wim.ps1` — copian imágenes install/boot directamente a USB, con división SWM para FAT32.
- `RapidDeploy_Toolkit\` — módulo **100 % opcional** de OOBE (`Mayús + F10`) para Autopilot/Intune/Entra ID, captura de hash, resincronización NTP, diagnóstico, sincronización MDM y cambio Zero-Copy de WIM por modelo.

## Présentation du projet (FR)

- `00_MENU_LAB_WINDOWS11.ps1` — panneau de contrôle interactif multilingue du laboratoire.
- `Herramientas\Modificar-InstallWim.ps1` — flux DISM pour `install.wim` et `boot.wim`, injection de pilotes depuis `Trabajo\Drivers\install` et `Trabajo\Drivers\boot`, intégration de paquets et export optimisé.
- `Herramientas\WINDOWS_USBPowerShell.PS1` — crée une clé UEFI/GPT hybride avec une partition de démarrage FAT32 et une partition d’installation exFAT/NTFS pour les gros fichiers.
- `Herramientas\Crear-ISO-Windows11.ps1` — crée des ISO Windows personnalisées et amorçables avec `oscdimg`.
- `Herramientas\copiar_install_wim.ps1` / `Herramientas\copiar_boot_wim.ps1` — copient les images install/boot directement vers une clé USB, avec fractionnement SWM pour FAT32.
- `RapidDeploy_Toolkit\` — module OOBE (`Maj + F10`) **100 % facultatif** pour Autopilot/Intune/Entra ID, capture du hash, synchronisation NTP, diagnostics, synchronisation MDM et échange Zero-Copy des WIM par modèle.

## Structura proiectului (RO)

- `00_MENU_LAB_WINDOWS11.ps1` — panoul interactiv multilingv al laboratorului.
- `Herramientas\Modificar-InstallWim.ps1` — flux DISM pentru `install.wim` și `boot.wim`, injectarea driverelor din `Trabajo\Drivers\install` și `Trabajo\Drivers\boot`, integrarea pachetelor și exportul optimizat.
- `Herramientas\WINDOWS_USBPowerShell.PS1` — creează un USB hibrid UEFI/GPT cu partiție de pornire FAT32 și partiție de instalare exFAT/NTFS pentru fișiere mari.
- `Herramientas\Crear-ISO-Windows11.ps1` — creează imagini ISO Windows personalizate și bootabile cu `oscdimg`.
- `Herramientas\copiar_install_wim.ps1` / `Herramientas\copiar_boot_wim.ps1` — copiază imaginile install/boot direct pe USB, cu împărțire SWM pentru FAT32.
- `RapidDeploy_Toolkit\` — modul OOBE (`Shift + F10`) **100% opțional** pentru Autopilot/Intune/Entra ID, capturarea hash-ului, resincronizare NTP, diagnosticare, sincronizare MDM și schimbarea Zero-Copy a imaginilor WIM după model.

## Projektübersicht (DE)

- `00_MENU_LAB_WINDOWS11.ps1` — mehrsprachiges interaktives Steuerungsmenü des Labors.
- `Herramientas\Modificar-InstallWim.ps1` — DISM-Ablauf für `install.wim` und `boot.wim` mit Treiberintegration aus `Trabajo\Drivers\install` und `Trabajo\Drivers\boot`, Paketintegration und optimiertem Export.
- `Herramientas\WINDOWS_USBPowerShell.PS1` — erstellt einen hybriden UEFI/GPT-USB-Datenträger mit FAT32-Startpartition und exFAT-/NTFS-Installationspartition für große Dateien.
- `Herramientas\Crear-ISO-Windows11.ps1` — erstellt angepasste, startfähige Windows-ISOs mit `oscdimg`.
- `Herramientas\copiar_install_wim.ps1` / `Herramientas\copiar_boot_wim.ps1` — kopieren Installations-/Startabbilder direkt auf USB, einschließlich SWM-Aufteilung für FAT32.
- `RapidDeploy_Toolkit\` — **100 % optionales** OOBE-Toolkit (Umschalt + F10) für Autopilot/Intune/Entra ID, Hardwarehash-Erfassung, NTP-Zeitsynchronisierung, Diagnose, MDM-Abgleich und Zero-Copy-WIM-Wechsel nach Modell.

## Zero-Copy WIM model switching (EN)

Windows Setup reads the active image from `sources\install.wim`, while each hardware model may require a different customized WIM. `RapidDeploy_Toolkit\SelectModel.cmd` returns the active WIM to its model folder and moves the chosen model's WIM into `sources` using Windows `move`. Both paths stay on the same USB volume, so the filesystem changes the directory entry instead of copying the multi-gigabyte image. The model folder is empty while that model is active. Keep all paths on one volume; FAT32 cannot store a single file larger than 4 GiB.

## Cambio Zero-Copy de WIM por modelo (ES)

Windows Setup lee la imagen activa desde `sources\install.wim`, aunque cada modelo puede necesitar un WIM personalizado distinto. `RapidDeploy_Toolkit\SelectModel.cmd` devuelve el WIM activo a su carpeta de modelo y mueve el WIM elegido a `sources` mediante `move`. Como ambas rutas están en el mismo volumen USB, el sistema de archivos actualiza la entrada sin copiar la imagen de varios GB. La carpeta del modelo queda vacía mientras ese modelo está activo. Mantén las rutas en un mismo volumen; FAT32 no admite un archivo individual superior a 4 GiB.

## Échange Zero-Copy des WIM par modèle (FR)

Windows Setup lit l’image active dans `sources\install.wim`, alors que chaque modèle peut nécessiter un WIM personnalisé différent. `RapidDeploy_Toolkit\SelectModel.cmd` remet le WIM actif dans son dossier de modèle et déplace le WIM choisi vers `sources` avec `move`. Les deux chemins étant sur le même volume USB, le système de fichiers met à jour l’entrée sans recopier l’image de plusieurs Go. Le dossier du modèle reste vide tant que ce modèle est actif. Gardez tous les chemins sur un seul volume ; FAT32 ne peut pas stocker un fichier unique de plus de 4 Gio.

## Schimbarea Zero-Copy a imaginilor WIM după model (RO)

Windows Setup citește imaginea activă din `sources\install.wim`, iar fiecare model poate necesita un WIM personalizat diferit. `RapidDeploy_Toolkit\SelectModel.cmd` mută WIM-ul activ înapoi în folderul modelului și mută WIM-ul ales în `sources` folosind `move`. Ambele căi fiind pe același volum USB, sistemul de fișiere actualizează intrarea fără să copieze imaginea de mai mulți GB. Folderul modelului rămâne gol cât timp modelul este activ. Păstrează toate căile pe același volum; FAT32 nu poate stoca un singur fișier mai mare de 4 GiB.

## Zero-Copy-WIM-Wechsel nach Modell (DE)

Windows Setup liest das aktive Abbild aus `sources\install.wim`, während jedes Hardwaremodell ein eigenes angepasstes WIM benötigen kann. `RapidDeploy_Toolkit\SelectModel.cmd` legt das aktive WIM in seinen Modellordner zurück und verschiebt das ausgewählte WIM mit `move` nach `sources`. Da beide Pfade auf demselben USB-Volume liegen, ändert das Dateisystem den Verzeichniseintrag, statt das mehrere Gigabyte große Abbild zu kopieren. Der Ordner des aktiven Modells bleibt leer. Alle Pfade müssen auf demselben Volume liegen; FAT32 kann keine einzelne Datei über 4 GiB speichern.
