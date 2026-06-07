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