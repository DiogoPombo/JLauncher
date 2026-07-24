@echo off
chcp 1252 >nul
setlocal

java -version >nul 2>&1
if not %errorlevel%==0 (
    COLOR 0C
    echo ============================================================
    echo [ERROR] Java not found.
    echo Please install Java before running JLauncher.
    echo ============================================================
    powershell -NoProfile -Command "(New-Object -ComObject WScript.Shell).Popup('Plataforma Java não detectada! É nescessário instalar o Java para executar este aplicativo!', 0, 'Livro Caixa', 48)"
    timeout /t 5 /nobreak >nul
    goto end
)

:MAIN
:: Configurações
set "BASE=%~dp0"
set "JAVA_FILE_PATH=%BASE%..\target\Caixa-0.0.1-SNAPSHOT.jar"
set "APP_URL=http://localhost:55555/"

netstat -ano | findstr /R /C:":55555 .*LISTENING" >nul 2>&1

if %errorlevel% equ 0 (
    goto :OPEN_BROWSER
) else (
    goto :SHOW_ALERT
)

:OPEN_BROWSER
:: Verifica a existência do Edge no Registro para aplicar o Modo APP ou usar o Fallback
reg query "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\App Paths\msedge.exe" >nul 2>&1
if %errorlevel% equ 0 (
    :: Abre o Edge em modo APP
    start msedge --app=%APP_URL%
) else (
    :: Fallback para o navegador padrão do sistema
    start %APP_URL%
)
goto :END

:SHOW_ALERT
:: Comando 1: Executa exclusivamente o efeito sonoro de exclamação do Windows
::powershell -NoProfile -Command "[System.Media.SystemSounds]::Exclamation.Play()"

:: Comando 2: Executa exclusivamente a caixa de diálogo (via objeto COM para evitar erros de tipo)
powershell -NoProfile -Command "(New-Object -ComObject WScript.Shell).Popup('LIVRO CAIXA ainda não está pronto, tente novamente em alguns instantes!', 0, 'Livro Caixa', 48)"

start "" javaw -jar "%JAVA_FILE_PATH%"

:END
exit /b
