@echo off
IF "%~1"=="" (
    ECHO Utilizzo: benvenuto.bat [nome]
    PAUSE
    EXIT /B 1
)
REM Ottieni solo le prime due cifre cioe le ore es: 17,25,35 prende solo 17
SET ORA=%TIME:~0,2%
REM Rimuove spazi iniziali serve se es: 09 non funziona quindi rimuovo il primo se =0
SET ORA=%ORA: =%


IF %ORA% LSS 19 (
    ECHO Buongiorno %1!
) ELSE (
    ECHO Buonasera %1!
)
PAUSE
