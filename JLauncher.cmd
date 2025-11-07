::
::Author: Diogo Santos Pombo - \Õ/ - @2025
::

@echo off

setlocal

set "BASESCRIPTFILE=%~dp0\product\"

cd %BASESCRIPTFILE%

call %BASESCRIPTFILE%LAUNCHER.cmd

endlocal

exit