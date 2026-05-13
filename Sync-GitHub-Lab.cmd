@echo off
setlocal EnableExtensions

set "ROOT=%~dp0"
set "POWERSHELL=%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe"
set "SCRIPT=%ROOT%Sync-GitHub-Lab.ps1"

if not exist "%POWERSHELL%" (
    echo Windows PowerShell not found:
    echo %POWERSHELL%
    pause
    exit /b 1
)

if not exist "%SCRIPT%" (
    echo Sync script not found:
    echo %SCRIPT%
    pause
    exit /b 1
)

"%POWERSHELL%" -NoProfile -ExecutionPolicy RemoteSigned -Command "Get-ChildItem -LiteralPath '%ROOT%' -Recurse -File -Include *.ps1,*.cmd,*.txt | Unblock-File -ErrorAction SilentlyContinue" >nul 2>&1
"%POWERSHELL%" -NoProfile -ExecutionPolicy RemoteSigned -File "%SCRIPT%"
set "RC=%ERRORLEVEL%"

if not "%RC%"=="0" (
    echo.
    echo Sync failed. Exit code: %RC%
    pause
)

exit /b %RC%
