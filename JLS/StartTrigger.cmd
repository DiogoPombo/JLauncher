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



:: Configurações
set "BASE=%~dp0"
set "JAVA_FILE_PATH=%BASE%..\target\Caixa-0.0.1-SNAPSHOT.jar"
set "APP_URL=http://localhost:55555/"

start "" javaw -jar "%JAVA_FILE_PATH%"

endlocal
exit