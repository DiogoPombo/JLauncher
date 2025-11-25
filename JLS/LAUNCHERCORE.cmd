::--------------------------------------------::
:: JLauncher - Unified launcher for Java apps ::
::  Author: Diogo Santos Pombo - \Õ/ - @2025  ::
::--------------------------------------------::

@echo off
setlocal enabledelayedexpansion

set "APPNM=JLauncher"

for /f "tokens=* delims=" %%a in ('chcp') do (
    for %%b in (%%a) do set "original_cp=%%b"
)

chcp 65001 > nul

set MODE=%1
shift


goto :main


:pause_zero
if "%MODE%"=="-win11" (
    timeout /t 0 /nobreak >nul
) else (
    ping -n 1 127.0.0.1 >nul
)
goto :eof

:main
for /f "tokens=3" %%I in ('reg query "HKEY_CURRENT_USER\Control Panel\International" /v LocaleName') do set "LANGUAGE=%%I"
set "LANG_PREFIX=%LANGUAGE:~0,2%"
if /i "%LANG_PREFIX%"=="pt" (
    set "IDIOMA=PT"
) else (
    set "IDIOMA=EN"
)

if "%IDIOMA%"=="PT" (
    set "MSG_CANCELLED=Usuário cancelou a seleção."
    set "MSG_FILE_CHOSEN=Arquivo escolhido: "
    set "MSG_NO_URL=URL não fornecida."
    set "MSG_SKIP_URL=Pulando configuração de URL."
    set "MSG_NEEDS_URL=Essa aplicação precisa de uma URL para abrir no navegador?"
    set "MSG_NEEDS_URL_TITLE=Configuração"
    set "MSG_URL_PROMPT=Digite a URL:"
    set "MSG_URL_TITLE=URL"
    set "MSG_DEFAULT_URL=http://localhost:8080"
    set "MSG_ERROR_FILE_NOT_FOUND=[ERRO] Arquivo Java não encontrado: "
    set "MSG_LOG_RUNNING=[%date% %time%] Executando: "
    set "MSG_ANOTHER_LAUNCH=Deseja selecionar outro arquivo?"
    set "prompt=Insira uma URL"
    set "MSG_DELAY_PROMPT=Quantos segundos leva para a aplicação subir?"
    set "MSG_DELAY_TITLE=Tempo de Inicialização"
    set "MSG_DELAY_DEFAULT=10"
    set "MSG_INVALID_DELAY=Entrada inválida. Digite apenas um número inteiro."
    set "MSG_INVALID_DELAY_TITLE=Erro de Validação"
    set "MSG_WELCOME=Bem-vindo ao JLauncher, seu launcher simplificado para aplicações Java."
    set "MSG_PLS_SELECT=Por favor, selecione um arquivo .jar."
) else (
    set "MSG_CANCELLED=User canceled the selection."
    set "MSG_FILE_CHOSEN=File chosen: "
    set "MSG_NO_URL=No URL provided."
    set "MSG_SKIP_URL=Skipping URL configuration."
    set "MSG_NEEDS_URL=Does this application need a URL to open in the browser?"
    set "MSG_NEEDS_URL_TITLE=Configuration"
    set "MSG_URL_PROMPT=Type URL:"
    set "MSG_URL_TITLE=URL"
    set "MSG_DEFAULT_URL=http://localhost:8080"
    set "MSG_ERROR_FILE_NOT_FOUND=[ERROR] Java file not found: "
    set "MSG_LOG_RUNNING=[%date% %time%] Running: "
    set "MSG_ANOTHER_LAUNCH=Do you want to select another file?"
    set "prompt=Insert URL"
    set "MSG_DELAY_PROMPT=How many seconds does it take for the application to start?"
    set "MSG_DELAY_TITLE=Startup Time"
    set "MSG_DELAY_DEFAULT=10"
    set "MSG_INVALID_DELAY=Invalid input. Please enter an integer number only."
    set "MSG_INVALID_DELAY_TITLE=Validation Error"
    set "MSG_WELCOME=Welcome to JLauncher, your simplified launcher for Java applications."
    set "MSG_PLS_SELECT=Please select a .jar file."
)

:start
@title %APPNM%

set "DELAY_SECONDS=10"
set "DELAY_FILE=delay_seconds.txt"
set "BASE=%~dp0"
set "SOM=%BASE%play.vbs"
set "SOM2=%BASE%play2.vbs"
set "ps1script=%BASE%filelocation.ps1"
set "APP_URL="
set "CONFIG_FILE=arquivo_selecionado.txt"
set "NAME_FILE=nome_jar.txt"
set "URL_FILE=url_config.txt"
set "SPACE= "

if exist "%CONFIG_FILE%" (
    set /p JAVA_FILE_PATH=<"%CONFIG_FILE%"
    if exist "%URL_FILE%" (
        set /p APP_URL=<"%URL_FILE%"
    )
    goto run
) else (
    call :SelecionarArquivo
)

:SelecionarArquivo
cls
set "APPNM=JLauncher"
COLOR 0B
echo.
echo.
echo %SPACE%%SPACE%%SPACE%**************************%SPACE%%APPNM%%SPACE%**************************
echo.
echo %SPACE%%MSG_WELCOME%
echo.
echo %SPACE%%MSG_PLS_SELECT%
echo.
powershell.exe -ExecutionPolicy Bypass -NoLogo -NoProfile -STA -File "%ps1script%"
if not exist "%CONFIG_FILE%" (
    echo %MSG_CANCELLED%
    :: Pergunta se quer tentar novamente
    for /f "tokens=* usebackq" %%i in (`powershell -Command "Add-Type -AssemblyName System.Windows.Forms; $result = [System.Windows.Forms.MessageBox]::Show('%MSG_ANOTHER_LAUNCH%', '%APPNM%', [System.Windows.Forms.MessageBoxButtons]::YesNo, [System.Windows.Forms.MessageBoxIcon]::Question); Write-Output ([int]$result)"`) do set "RETRY=%%i"
    if "!RETRY!"=="6" (
        del "%CONFIG_FILE%" 2>nul
        del "%URL_FILE%" 2>nul
        goto start
    ) else (
        goto :end
    )
)

set /p ARQUIVO=<"%CONFIG_FILE%"
echo %MSG_FILE_CHOSEN%!ARQUIVO!

for /f "tokens=* usebackq" %%i in (`powershell -Command "Add-Type -AssemblyName System.Windows.Forms; $result = [System.Windows.Forms.MessageBox]::Show('%MSG_NEEDS_URL%', '%MSG_NEEDS_URL_TITLE%', [System.Windows.Forms.MessageBoxButtons]::YesNo, [System.Windows.Forms.MessageBoxIcon]::Question); if ($result -eq [System.Windows.Forms.DialogResult]::Yes) { 'True' } else { 'False' }"`) do set "NEEDS_URL=%%i"

if /I "!NEEDS_URL!"=="True" (
    set "prompt=%MSG_URL_PROMPT%"
    for /f "tokens=* usebackq" %%i in (`powershell -Command "Add-Type -AssemblyName Microsoft.VisualBasic; [Microsoft.VisualBasic.Interaction]::InputBox('%prompt%', '%MSG_URL_TITLE%', '%MSG_DEFAULT_URL%')"`) do set "APP_URL=%%i"

    if "!APP_URL!"=="" (
        echo %MSG_NO_URL%
        del "%CONFIG_FILE%" 2>nul
        del "%URL_FILE%" 2>nul
        del "%DELAY_FILE%" 2>nul
        goto :end
    ) else (
        echo !APP_URL! > "%URL_FILE%"
        :: Configurar delay se URL foi definida
        call :ConfigurarDelay
    )
) else (
    echo %MSG_SKIP_URL%
    set "APP_URL="
    del "%URL_FILE%" 2>nul
    del "%DELAY_FILE%" 2>nul
)

cls
goto start

:ConfigurarDelay
:loop_delay
for /f "tokens=* usebackq" %%i in (`powershell -Command "Add-Type -AssemblyName Microsoft.VisualBasic; [Microsoft.VisualBasic.Interaction]::InputBox('%MSG_DELAY_PROMPT%', '%MSG_DELAY_TITLE%', '%MSG_DELAY_DEFAULT%')"`) do set "INPUT_DELAY=%%i"
if "!INPUT_DELAY!"=="" (
    echo %MSG_NO_URL%
    del "%CONFIG_FILE%" 2>nul
    del "%URL_FILE%" 2>nul
    del "%DELAY_FILE%" 2>nul
    goto :end
)
for /f "tokens=* usebackq" %%i in (`powershell -Command "if ('!INPUT_DELAY!' -match '^\d+$') { 'Valid' } else { 'Invalid' } "`) do set "VALID_DELAY=%%i"
if /I "!VALID_DELAY!"=="Invalid" (
    for /f "tokens=* usebackq" %%i in (`powershell -Command "Add-Type -AssemblyName System.Windows.Forms; [System.Windows.Forms.MessageBox]::Show('%MSG_INVALID_DELAY%', '%MSG_INVALID_DELAY_TITLE%', [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Warning); Write-Output 1"`) do set "DUMMY=%%i"
    goto loop_delay
)
set /a DELAY_SECONDS=!INPUT_DELAY! 2>nul
if !DELAY_SECONDS! LEQ 0 (
    set "DELAY_SECONDS=10"
)
echo !DELAY_SECONDS! > "%DELAY_FILE%"
goto :eof

:run
for %%F in ("%JAVA_FILE_PATH%") do (
    set CURRENT_NAME=%%~nxF
    set CURRENT_BASENAME=%%~nF
)

if exist "%NAME_FILE%" (
    set /p OLD_NAME=<"%NAME_FILE%"
    if /I "!CURRENT_NAME!"=="!OLD_NAME!" (
        REM Nome igual, prossegue
    ) else (
        del "%CONFIG_FILE%" 2>nul
        del "%NAME_FILE%" 2>nul
        del "%URL_FILE%" 2>nul
        set "APP_URL="
        call :SelecionarArquivo
        REM Atualiza o caminho do arquivo Java após nova seleção
        set /p JAVA_FILE_PATH=<"%CONFIG_FILE%"
        for %%F in ("%JAVA_FILE_PATH%") do (
            set CURRENT_NAME=%%~nxF
            set CURRENT_BASENAME=%%~nF
        )
    )
)

echo !CURRENT_NAME!>"%NAME_FILE%"

set "javaapp=!CURRENT_BASENAME!"
set "APPNM=!javaapp!"

if not exist "%JAVA_FILE_PATH%" (
    color 0C
    echo %MSG_ERROR_FILE_NOT_FOUND%"%JAVA_FILE_PATH%"
    del "%CONFIG_FILE%" 2>nul
    del "%NAME_FILE%" 2>nul
    del "%URL_FILE%" 2>nul
    timeout /t 5 /nobreak >nul
    call :SelecionarArquivo
    goto start
)

echo %MSG_LOG_RUNNING%!CURRENT_NAME! >> launcher.log

if "%1"=="-s" (
    goto silent) else if "%1"=="-S" (
    goto silent)

@title %APPNM%
wscript.exe "%SOM%"


set colors2=F0
set colors=00 80 70 F0

timeout /t 0 /nobreak >nul
for %%c in (%colors%) do (
    color %%c
    call :pause_zero
)

:: Language-independent parsing for console dimensions using PowerShell
for /f %%a in ('powershell -command "$Host.UI.RawUI.WindowSize.Width"') do set COLS=%%a
for /f %%a in ('powershell -command "$Host.UI.RawUI.WindowSize.Height"') do set LINS=%%a

set /a LEN=75
set /a ALT=5

set /a PAD=(COLS - LEN) / 2
set "SPACES="
for /l %%i in (1,1,%PAD%) do set "SPACES=!SPACES! "

set /a PADV=(LINS - ALT) / 2
if "%MODE%"=="-win10" if %PADV% GTR 20 set /a PADV=20

set "L1=*****************************************************************************"
set "L2=*                                                                           *"

set "APPNAME=%APPNM%"

set /a NAMELEN=0
for /l %%i in (0,1,200) do (
    if "!APPNAME:~%%i,1!"=="" (
        set /a NAMELEN=%%i
        goto :lenFoundName
    )
)
:lenFoundName

set /a INNER=LEN-2
set /a PADNAME=(INNER - NAMELEN) / 2

set "SPACESNAME="
for /l %%i in (1,1,%PADNAME%) do set "SPACESNAME=!SPACESNAME! "

set "L3=*  %SPACESNAME%%APPNAME%"
set /a REMSP=INNER - (PADNAME + NAMELEN)
set "SPACESRIGHT="
for /l %%i in (1,1,%REMSP%) do set "SPACESRIGHT=!SPACESRIGHT! "
set "L3=!L3!!SPACESRIGHT!*"

set "L4=*                                                                           *"

call :pause_zero
for %%c in (%colors2%) do (
    color %%c
    cls

    for /l %%i in (1,1,%PADV%) do echo.

    echo !SPACES!!L1!
    echo !SPACES!!L2!
    echo !SPACES!!L3!
    echo !SPACES!!L4!
    echo !SPACES!!L1!

    call :pause_zero
)


if "%MODE%"=="-win11" (
    timeout /t 4 /nobreak >nul
) else (
    timeout /t 5 /nobreak >nul
)

call :pause_zero
call :pause_zero
call :pause_zero
call :pause_zero
wscript.exe "%SOM2%"
color 0A
call :pause_zero
color 0B
call :pause_zero
color 0F
cls
call :pause_zero
call :pause_zero
call :pause_zero
color 07
echo.

if "%1"=="-m" (
    COLOR 0A
) else if "%1"=="-M" (
    COLOR 0A
) else if "%1"=="-b" (
    COLOR 0B
) else if "%1"=="-B" (
    COLOR 0B
)

set "LINE=**************************%SPACE%%APPNM%%SPACE%**************************"
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
:silent
@title %APPNM%
chcp %original_cp% >nul
start "" /b java -jar "%JAVA_FILE_PATH%"
timeout /t %DELAY_SECONDS% /nobreak >nul

if not "!APP_URL!"=="" (
    start "" "!APP_URL!"
)

:end
echo.
endlocal
exit