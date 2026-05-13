LAB WIN11 - GITHUB PUBLISH COPY
================================

This folder is only for GitHub publishing.
Do not use it as your production deployment lab.

Production lab:
  C:\Lab_Win11

GitHub publishing copy:
  F:\Aplicatii\Lab_Win11\GitHub

Normal workflow:
  1. Work normally in C:\Lab_Win11.
  2. When you want to publish changes, run:

       F:\Aplicatii\Lab_Win11\GitHub\Sync-GitHub-Lab.cmd

  3. Open F:\Aplicatii\Lab_Win11\GitHub in GitHub Desktop.
  4. Review changed files.
  5. Commit and push.

What gets published:
  Ayuda
  Herramientas
  Trabajo folder skeleton
  start_lab.cmd
  LEEME.txt
  README.md

What does NOT get published:
  Real ISOs
  WIM/ESD/SWM images
  drivers/packages/logs/mount folders
  shortcut files

Reason:
  Keep C:\Lab_Win11 clean and fast.
  Keep GitHub files away from the production lab.
