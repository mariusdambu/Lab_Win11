[ English ](#english) | [ Español ](#español)

## English

# Lab Win11

A Windows 11 deployment lab for servicing installation images, creating bootable USB media and building customized ISOs.

Official repository: [mariusdambu/Lab_Win11](https://github.com/mariusdambu/Lab_Win11)

### The lab at a glance

- Create hybrid UEFI/GPT USB media with a FAT32 boot partition and an exFAT/NTFS installation partition for large files.
- Service `install.wim` and `boot.wim` with DISM, including model-specific drivers, packages and optimized image export.
- Create customized bootable Windows 11 ISOs and copy images directly to USB, including SWM splitting for FAT32 targets.
- Optionally use the portable `RapidDeploy_Toolkit` during corporate OOBE provisioning.

### Project map

- `00_MENU_LAB_WINDOWS11.ps1` — multilingual interactive control panel for the lab.
- `Herramientas/Modificar-InstallWim.ps1` — DISM servicing workflow for `install.wim` and `boot.wim`; supports drivers in `Trabajo/Drivers/install` and `Trabajo/Drivers/boot`, package integration and optimized export.
- `Herramientas/WINDOWS_USBPowerShell.PS1` — creates hybrid UEFI/GPT USB media with a FAT32 boot partition and an exFAT/NTFS installation partition.
- `Herramientas/Crear-ISO-Windows11.ps1` — creates customized bootable ISOs with `oscdimg`.
- `Herramientas/copiar_install_wim.ps1` and `Herramientas/copiar_boot_wim.ps1` — copy installation and boot images to USB targets, with SWM splitting when FAT32 requires it.
- `RapidDeploy_Toolkit/` — a **100% optional** OOBE toolkit for corporate Windows Autopilot, Microsoft Intune and Microsoft Entra ID deployments. It includes diagnostics, Autopilot hardware-hash capture, time resynchronization, manual MDM check-in, disk utilities and model-based WIM selection.
- `Ayuda/` — quick guides and copy-ready commands.
- `Trabajo/` — local workspace for ISOs, images, drivers, packages, mount data and logs. Deployment payloads and temporary files are excluded from Git.

### RapidDeploy Toolkit: optional OOBE tools

The toolkit is intended for corporate provisioning at the Windows first-run setup screen (OOBE), opened with **Shift + F10**. It can capture the Autopilot hardware hash through `MDM_DevDetail_Ext01`, save it with a Group Tag, show enrollment diagnostics, resynchronize time through NTP and request an MDM check-in with `DeviceEnroller.exe`.

It is **100% optional**. If you only prepare a standard Windows 11 ISO or USB for personal or home use, you can ignore it completely. To use it, copy the entire contents of `RapidDeploy_Toolkit` to the root of the USB drive or another partition accessible in OOBE, open Command Prompt with **Shift + F10**, switch to that drive and run `menu.cmd`.

The toolkit's disk wipe actions target **Disk 0**. DiskPart `clean` removes partition information; it does not securely overwrite or sanitize the drive. Verify the target and back up any required data before using those actions.

### SelectModel.cmd: Zero-Copy WIM switching

Windows Setup expects its active installation image at `sources\install.wim`. In a mixed corporate fleet, each hardware model—such as an HP EliteBook, Lenovo ThinkPad or Dell Latitude—may need its own WIM with the appropriate drivers and configuration.

`RapidDeploy_Toolkit\SelectModel.cmd` switches which model image Windows Setup sees without copying the image data. It uses the native Windows `move` command to return the current `sources\install.wim` to that model's folder, then moves the selected model's `install.wim` into `sources\install.wim`. Both locations are on the same USB volume, so this is a filesystem move/rename that updates directory metadata rather than copying a 10–15 GB file. It is normally completed in under a second, although the exact time depends on the USB device and filesystem. The folder for the active model is empty while its image is in `sources`.

Keep `sources` and all model folders on the same volume. FAT32 cannot store a single file larger than 4 GiB; use the lab's exFAT/NTFS installation partition for a full-size WIM, or split the image if FAT32 is required.

Example USB layout (the active model's folder is empty while its WIM is in `sources`):

```text
USB_ROOT:\
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

- Windows 10 or Windows 11, Windows PowerShell 5.1 and administrator rights for the lab's disk and image operations.
- DISM is included with Windows. `oscdimg` must be available to create customized ISO files.
- Download the ZIP from this repository, extract it to a local folder and run `start_lab.cmd` as administrator. Choose a language in the launcher.
- Place working files under `Trabajo`: ISO files in `Trabajo/ISOs`, image files in `Trabajo/images`, extracted INF drivers in `Trabajo/Drivers`, and CAB/MSU packages in `Trabajo/packages`.
- The repository contains the tools and documentation, not private deployment payloads. ISO/WIM/ESD/SWM files, driver packs, packages, logs and temporary mount contents are excluded from Git.

---

## Español

# Lab Win11

Laboratorio de despliegue de Windows 11 para preparar imágenes de instalación, crear memorias USB arrancables y generar ISO personalizadas.

Repositorio oficial: [mariusdambu/Lab_Win11](https://github.com/mariusdambu/Lab_Win11)

### El laboratorio de un vistazo

- Crea memorias USB híbridas UEFI/GPT con una partición de arranque FAT32 y otra de instalación exFAT/NTFS para archivos grandes.
- Modifica `install.wim` y `boot.wim` mediante DISM, con controladores por modelo, integración de paquetes y exportación optimizada.
- Genera ISO personalizadas arrancables de Windows 11 y copia imágenes directamente a USB, incluida la división SWM cuando FAT32 lo requiere.
- Permite usar de forma opcional el módulo portátil `RapidDeploy_Toolkit` durante el aprovisionamiento empresarial en OOBE.

### Mapa del proyecto

- `00_MENU_LAB_WINDOWS11.ps1` — panel interactivo multilingüe del laboratorio.
- `Herramientas/Modificar-InstallWim.ps1` — flujo DISM para `install.wim` y `boot.wim`; admite controladores en `Trabajo/Drivers/install` y `Trabajo/Drivers/boot`, integración de paquetes y exportación optimizada.
- `Herramientas/WINDOWS_USBPowerShell.PS1` — crea memorias USB híbridas UEFI/GPT con partición de arranque FAT32 y partición de instalación exFAT/NTFS.
- `Herramientas/Crear-ISO-Windows11.ps1` — genera ISO personalizadas arrancables con `oscdimg`.
- `Herramientas/copiar_install_wim.ps1` y `Herramientas/copiar_boot_wim.ps1` — copian imágenes de instalación y arranque a USB, con división SWM si el destino FAT32 la necesita.
- `RapidDeploy_Toolkit/` — módulo **100 % opcional** para OOBE empresarial con Windows Autopilot, Microsoft Intune y Microsoft Entra ID. Incluye diagnóstico, captura del hash de hardware de Autopilot, resincronización horaria, solicitud manual de sincronización MDM, utilidades de disco y selección de WIM por modelo.
- `Ayuda/` — guías rápidas y comandos listos para copiar.
- `Trabajo/` — espacio local para ISO, imágenes, controladores, paquetes, montajes y registros. Los archivos de despliegue y temporales están excluidos de Git.

### RapidDeploy Toolkit: módulo opcional para OOBE

El módulo está pensado para el aprovisionamiento corporativo durante la configuración inicial de Windows (OOBE), que se abre con **Mayús + F10**. Puede capturar el hash de hardware de Autopilot mediante `MDM_DevDetail_Ext01`, guardarlo con una etiqueta de grupo, mostrar diagnósticos de inscripción, resincronizar la hora mediante NTP y solicitar una sincronización MDM con `DeviceEnroller.exe`.

Es **100 % opcional**. Si solo preparas una ISO o una memoria USB estándar de Windows 11 para uso personal o doméstico, puedes ignorarlo por completo. Para utilizarlo, copia el contenido íntegro de `RapidDeploy_Toolkit` a la raíz del USB o a otra partición accesible desde OOBE, abre la consola con **Mayús + F10**, cambia a esa unidad y ejecuta `menu.cmd`.

Las funciones de borrado del módulo siempre actúan sobre el **Disco 0**. DiskPart `clean` elimina la información de particiones; no sobrescribe ni sanitiza de forma segura la unidad. Verifica el destino y respalda los datos necesarios antes de usar esas funciones.

### SelectModel.cmd: cambio de WIM sin copiar datos

El instalador de Windows espera encontrar la imagen activa en `sources\install.wim`. En una flota empresarial con distintos equipos, cada modelo —por ejemplo, HP EliteBook, Lenovo ThinkPad o Dell Latitude— puede necesitar su propio WIM con los controladores y la configuración correspondientes.

`RapidDeploy_Toolkit\SelectModel.cmd` cambia la imagen que utilizará el instalador sin copiar sus datos. Usa el comando nativo de Windows `move` para devolver el `sources\install.wim` actual a la carpeta de su modelo y después mueve el `install.wim` del modelo elegido a `sources\install.wim`. Como ambas ubicaciones están en el mismo volumen USB, el sistema de archivos actualiza los metadatos de directorio en vez de copiar un archivo de 10–15 GB. Normalmente termina en menos de un segundo, aunque el tiempo exacto depende del USB y del sistema de archivos. La carpeta del modelo activo queda vacía mientras su imagen está en `sources`.

Mantén `sources` y todas las carpetas de modelo en el mismo volumen. FAT32 no admite un archivo individual superior a 4 GiB; usa la partición de instalación exFAT/NTFS del laboratorio para un WIM completo o divide la imagen si necesitas FAT32.

Ejemplo de estructura USB (la carpeta del modelo activo queda vacía mientras su WIM está en `sources`):

```text
USB_ROOT:\
├── sources\
│   └── install.wim                 # Imagen activa que utiliza Windows Setup
├── HP_EliteBook_840_G10\
│   └── install.wim                 # Imagen lista para seleccionar
├── Lenovo_ThinkPad_T14\
│                                    # Vacía mientras este modelo está activo
├── scripts\                        # Utilidades del módulo
├── SelectModel.cmd                 # Administrador de imágenes por modelo
└── menu.cmd                        # Lanzador OOBE (Mayús + F10)
```

### Requisitos y primeros pasos

- Windows 10 o Windows 11, Windows PowerShell 5.1 y permisos de administrador para las operaciones de disco e imágenes del laboratorio.
- DISM viene incluido en Windows. Para generar ISO personalizadas, `oscdimg` debe estar disponible.
- Descarga el ZIP de este repositorio, extráelo en una carpeta local y ejecuta `start_lab.cmd` como administrador. Elige el idioma en el lanzador.
- Coloca los archivos de trabajo en `Trabajo`: las ISO en `Trabajo/ISOs`, las imágenes en `Trabajo/images`, los controladores INF extraídos en `Trabajo/Drivers` y los paquetes CAB/MSU en `Trabajo/packages`.
- El repositorio contiene las herramientas y la documentación, no los archivos privados de despliegue. Las ISO, imágenes WIM/ESD/SWM, paquetes de controladores, paquetes de instalación, registros y montajes temporales están excluidos de Git.