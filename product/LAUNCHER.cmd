::
::Author: Diogo Santos Pombo - \Õ/ - @2025
::

@echo off
setlocal enabledelayedexpansion

set "APPNM=APPNAME"
@title %APPNM%

set "SPACE= "
set "BASE=%~dp0"
set "PS=%BASE%javaapp.jar"
set "SOM=%BASE%play.vbs"

wscript.exe "%SOM%"

set colors2=F7 F8 F0
set colors=00 80 70 F0

timeout /t 2 /nobreak >nul
for %%c in (%colors%) do (
    color %%c
    timeout /t 0 /nobreak >nul
)

for /f "tokens=2 delims=:" %%a in ('mode con ^| find "Colunas"') do set COLS=%%a
for /f "tokens=2 delims=:" %%a in ('mode con ^| find "Linhas"') do set LINS=%%a
set COLS=%COLS: =%
set LINS=%LINS: =%

set "L1=***************************************************************************"
set "L2=*                                                                         *"
set "L3=*                                 %APPNM%                                 *"
set "L4=*                                                                         *"

set /a LEN=75
set /a ALT=5

set /a PAD=(COLS - LEN) / 2
set "SPACES="
for /l %%i in (1,1,%PAD%) do set "SPACES=!SPACES! "

set /a PADV=(LINS - ALT) / 2

timeout /t 0 /nobreak >nul
for %%c in (%colors2%) do (
    color %%c
    cls

    for /l %%i in (1,1,%PADV%) do echo.

    echo !SPACES!!L1!
    echo !SPACES!!L2!
    echo !SPACES!!L3!
    echo !SPACES!!L4!
    echo !SPACES!!L1!

    timeout /t 0 /nobreak >nul
)

timeout /t 5 /nobreak >nul
timeout /t 0 /nobreak >nul
timeout /t 0 /nobreak >nul
timeout /t 0 /nobreak >nul
color 0A
timeout /t 0 /nobreak >nul
color 0B
timeout /t 0 /nobreak >nul
color 0F
cls
timeout /t 0 /nobreak >nul
timeout /t 0 /nobreak >nul
timeout /t 0 /nobreak >nul
color 07
echo.


set "LINE=************************** %APPNM% **************************"


set "LENLINE=0"
for /l %%i in (0,1,200) do (
    if "!LINE:~%%i,1!"=="" (
        set /a LENLINE=%%i
        goto :lenFound2
    )
)
:lenFound2


set /a PAD2=(COLS - LENLINE) / 2
set "SPACES2="
for /l %%i in (1,1,%PAD2%) do set "SPACES2=!SPACES2! "


echo !SPACES2!!LINE!


timeout /t 0 /nobreak >nul
timeout /t 0 /nobreak >nul
start "" /b java -jar "%PS%"
timeout /t 10 /nobreak >nul

::start "" /b http://localhost:8080
start "" /b http://localhost:8080/h2-console

:end
echo.
echo.
endlocal
exit