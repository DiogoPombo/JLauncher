::------------------------------------------::
:: Author: Diogo Santos Pombo - \Õ/ - @2025 ::
::------------------------------------------::

@echo off

setlocal enabledelayedexpansion

java -version >nul 2>&1
if not %errorlevel%==0 (
    COLOR 0C
    echo ============================================================
    echo [ERROR] Java not found.
    echo Please install Java before running JLauncher!
    echo ============================================================
    timeout /t 5 /nobreak >nul
    goto end
)

set "BASESCRIPTFILE=%~dp0\JLS\"

if not exist "%BASESCRIPTFILE%" (
    echo [ERROR] Folder JLS not found: %BASESCRIPTFILE%
    timeout /t 5 /nobreak >nul
    goto end
)

cd /d "%BASESCRIPTFILE%"


set "ORIGINAL_LAUNCHER=%BASESCRIPTFILE%LAUNCHER.cmd"
set "CORRECTED_LAUNCHER=%BASESCRIPTFILE%LAUNCHERW10.cmd"


if not exist "%ORIGINAL_LAUNCHER%" (
    echo [ERROR] LAUNCHER.cmd not found at: %ORIGINAL_LAUNCHER%
    timeout /t 5 /nobreak >nul
    goto end
)
if not exist "%CORRECTED_LAUNCHER%" (
    echo [ERROR] LAUNCHERW10.cmd not found at: %CORRECTED_LAUNCHER%
    timeout /t 5 /nobreak >nul
    goto end
)



for /f "tokens=2 delims==" %%i in ('wmic os get BuildNumber /value 2^>nul ^| findstr /b /c:"BuildNumber="') do set "BUILD=%%i"
set "BUILD=%BUILD: =%"
if "%BUILD%"=="" set "BUILD=0"
set "WINDOWS_VERSION=Win10"

if %BUILD% GEQ 22000 (
    set "WINDOWS_VERSION=Win11+"
    set "LAUNCHER_PATH=%ORIGINAL_LAUNCHER%"
) else (
    set "WINDOWS_VERSION=Win10-"
    set "LAUNCHER_PATH=%CORRECTED_LAUNCHER%"
)


if "%1"=="-m" (
    call "%LAUNCHER_PATH%" %1
) else if "%1"=="-M" (
    call "%LAUNCHER_PATH%" %1
) else if "%1"=="-b" (
    call "%LAUNCHER_PATH%" %1
) else if "%1"=="-B" (
    call "%LAUNCHER_PATH%" %1
) else (
    call "%LAUNCHER_PATH%"
)

:end
endlocal

exit