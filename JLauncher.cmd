::------------------------------------------::
:: Author: Diogo Santos Pombo - \Õ/ - @2025 ::
::------------------------------------------::

@echo off

setlocal

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

cd %BASESCRIPTFILE%

if "%1"=="-m" (
    call "%BASESCRIPTFILE%LAUNCHER.cmd" %1
) else if "%1"=="-M" (
    call "%BASESCRIPTFILE%LAUNCHER.cmd" %1
) else if "%1"=="-b" (
    call "%BASESCRIPTFILE%LAUNCHER.cmd" %1
) else if "%1"=="-B" (
    call "%BASESCRIPTFILE%LAUNCHER.cmd" %1
)

call "%BASESCRIPTFILE%LAUNCHER.cmd"

:end
endlocal

exit