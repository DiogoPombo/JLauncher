:: -----------------------------------------::
:: Author: Diogo Santos Pombo - \Õ/ - @2025 ::
:: -----------------------------------------::

@echo off

setlocal

set "BASESCRIPTFILE=%~dp0\product\"

cd %BASESCRIPTFILE%

if "%1"=="-m" (
    call %BASESCRIPTFILE%LAUNCHER.cmd %1
) else if "%1"=="-M" (
    call %BASESCRIPTFILE%LAUNCHER.cmd %1
)

call %BASESCRIPTFILE%LAUNCHER.cmd

endlocal

exit