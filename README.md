# Windows 11 Deployment Lab

Small Windows 11 deployment laboratory for servicing Windows images and preparing USB installation media.

The lab is designed to run from a single folder, for example:

```text
E:\Lab_Win11
```

Start it with:

```bat
start_lab.cmd
```

## What it does

- Shows a guided menu for common DISM tasks.
- Services `install.wim`, `install.esd`, split `install.swm` sets, and `boot.wim`.
- Injects drivers and packages.
- Mounts and unmounts Windows images.
- Creates a Windows 11 USB with a FAT32 boot partition and an exFAT installer partition.
- Includes an HTML command reference with copy buttons.
- Keeps work files separated from help and tools.

## Folder layout

```text
Ayuda\          Guides and HTML help.
Herramientas\   Scripts and helper files used by the lab.
Trabajo\        Local working area.
```

The `Trabajo` folder is intentionally empty in this public version. Put your local files there:

```text
Trabajo\ISOs\        Windows ISO files.
Trabajo\images\      boot.wim, install.wim, install.esd, install.swm files.
Trabajo\Drivers\     Driver folders.
Trabajo\packages\    CAB/MSU packages.
Trabajo\Logs\        Generated logs.
Trabajo\Scratch\     Temporary DISM scratch files.
Trabajo\offline\     Mounted images.
Trabajo\AnswerFiles\ Answer files.
```

## Important

- Run the lab on Windows with Windows PowerShell 5.1.
- Some DISM and disk operations need elevation.
- USB creation erases the selected USB disk.
- Do not publish ISO, WIM, ESD, SWM, driver packs, logs, or mounted image contents.

## Recommended use

1. Download or clone the repository.
2. Place it in a short path such as `E:\Lab_Win11`.
3. Add your ISO, image, driver, and package files inside `Trabajo`.
4. Launch `start_lab.cmd`.

