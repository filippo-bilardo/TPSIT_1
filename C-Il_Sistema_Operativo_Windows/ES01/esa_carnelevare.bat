@echo off

:: Controlla se è stato passato un parametro (il nome)
if "%~1"=="" (
    echo utilizzo: esercizio_windows.bat [Nome]
    goto :EOF
)

:: Imposta la variabile NOME con il valore del primo parametro
set NOME=%~1

:: Chiede all'utente di inserire l'orario
set /p ORA=inserisci l'ora:

:: Controlla la validità dell'orario
if %ORA% LSS 0 (
    echo orario non valido.
    goto :EOF
)

if %ORA% GTR 24 (
    echo orario non valido.
    goto :EOF
)

:: Controlla se l'orario è uguale a 18
if %ORA% EQU 18 (
    echo buongiorno %NOME%!
) else (
    echo buonasera %NOME%!
)

:: Termina lo script
endlocal
