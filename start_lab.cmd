@echo off
setlocal EnableExtensions

set "LABROOT=%~dp0"
set "STARTER=%LABROOT%Herramientas\Start-Lab.ps1"
set "POWERSHELL=%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe"

if not exist "%STARTER%" (
    echo Lab starter not found:
    echo %STARTER%
    pause
    exit /b 1
)

if not exist "%POWERSHELL%" (
    echo Windows PowerShell not found:
    echo %POWERSHELL%
    pause
    exit /b 1
)

"%POWERSHELL%" -NoProfile -ExecutionPolicy RemoteSigned -Command "Get-ChildItem -LiteralPath '%LABROOT%' -Recurse -File -Include *.ps1,*.cmd,*.html,*.txt | Unblock-File -ErrorAction SilentlyContinue" >nul 2>&1

"%POWERSHELL%" -NoProfile -ExecutionPolicy RemoteSigned -File "%STARTER%"
set "LAB_EXIT=%ERRORLEVEL%"

if not "%LAB_EXIT%"=="0" (
    echo.
    echo The lab finished with errors. Exit code: %LAB_EXIT%
    pause
)

exit /b %LAB_EXIT%
