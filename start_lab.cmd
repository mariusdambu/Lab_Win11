@echo off
color 07
setlocal EnableExtensions

set "LABROOT=%~dp0"
set "BOOTSTRAP=%LABROOT%Bootstrap-Lab.ps1"
set "POWERSHELL=%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe"

if not exist "%BOOTSTRAP%" (
    echo Lab bootstrap not found:
    echo %BOOTSTRAP%
    pause
    exit /b 1
)

if not exist "%POWERSHELL%" (
    echo Windows PowerShell not found:
    echo %POWERSHELL%
    pause
    exit /b 1
)

"%POWERSHELL%" -NoProfile -ExecutionPolicy RemoteSigned -Command "Unblock-File -LiteralPath '%BOOTSTRAP%' -ErrorAction SilentlyContinue" >nul 2>&1

"%POWERSHELL%" -NoProfile -ExecutionPolicy RemoteSigned -File "%BOOTSTRAP%"
set "LAB_EXIT=%ERRORLEVEL%"

if not "%LAB_EXIT%"=="0" (
    echo.
    echo The lab finished with errors. Exit code: %LAB_EXIT%
    pause
)

exit /b %LAB_EXIT%

