# Lab Win11

Windows 11 deployment lab for preparing install images and USB media.

## Quick Start

1. Download or clone this repository.
2. Run `start_lab.cmd`.
3. Choose your language.
4. Put your working files under `Trabajo`:
   - `Trabajo\ISOs` for Windows ISO files
   - `Trabajo\images` for `boot.wim`, `install.wim`, `install.esd` or `install*.swm`
   - `Trabajo\Drivers` for extracted INF drivers
   - `Trabajo\packages` for CAB/MSU packages

The lab uses Windows PowerShell 5.1 and DISM.

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
folder where this repository is cloned
```