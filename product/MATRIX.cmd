:: -----------------------------------------::
:: Author: Diogo Santos Pombo - \Õ/ - @2025 ::
:: -----------------------------------------::

@echo off
setlocal
set "SPACE= "
for /f "tokens=2 delims=:" %%a in ('chcp') do set "original_cp=%%a"
chcp 65001 > nul
COLOR 0A
cls

for /f "tokens=3" %%I in ('reg query "HKEY_CURRENT_USER\Control Panel\International" /v LocaleName') do set "LANGUAGE=%%I"
set "LANG_PREFIX=%LANGUAGE:~0,2%"
if /i "%LANG_PREFIX%"=="pt" (
    set "IDIOMA=PT"
) else (
    set "IDIOMA=EN"
)


if "%IDIOMA%"=="PT" (
    set "MSGM=Modo MATRIX ativado."
    set "MSGEASTER=Parabéns, você achou meu pequeno easter egg. \Õ/"
) else (
    set "MSGM=MATRIX mode activated."
    set "MSGEASTER=Congratulations, you found my little easter egg. \Õ/"
)

echo.
echo %SPACE%%random%%random%%random%%random%%random%%random%%SPACE%%random%%random%%random%%random%%random%%random%%SPACE%%SPACE%%SPACE%%SPACE%%SPACE%%SPACE%%SPACE%%SPACE%%random%%random%%random%%SPACE%%SPACE%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%SPACE%%SPACE%%SPACE%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%SPACE%%SPACE%%SPACE%%SPACE%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%
echo.
	timeout /t 0 >nul
echo %SPACE%%random%%random%%random%%random%%random%%random%%SPACE%%random%%random%%random%%random%%random%%random%%random%%random%%random%%SPACE%%SPACE%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%SPACE%%SPACE%%SPACE%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%SPACE%%SPACE%%SPACE%%SPACE%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%
	timeout /t 0 >nul
echo.
echo %SPACE%%random%%random%%random%%random%%random%%random%%SPACE%%random%%random%%random%%random%%random%%random%%SPACE%%SPACE%%SPACE%%SPACE%%SPACE%%SPACE%%SPACE%%SPACE%%SPACE%%SPACE%%random%%random%%random%%SPACE%%SPACE%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%SPACE%%SPACE%%SPACE%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%SPACE%%SPACE%%SPACE%%SPACE%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%
echo.
	timeout /t 0 >nul
echo %SPACE%%random%%random%%random%%random%%random%%random%%SPACE%%random%%random%%random%%random%%random%%random%%random%%random%%random%%SPACE%%SPACE%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%SPACE%%SPACE%%SPACE%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%SPACE%%SPACE%%SPACE%%SPACE%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%
	timeout /t 0 >nul

	

cls
echo.
echo.
echo %SPACE%%MSGM%
echo.
echo.
echo %SPACE%%MSGEASTER%
timeout /t 0 >nul
timeout /t 5 >nul

cls
echo.
echo.
chcp %original_cp% >nul
endlocal
exit /b