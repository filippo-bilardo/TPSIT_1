@echo off
setlocal enabledelayedexpansion

:: Configurazione del gioco
set /a numero_segreto=%random% %% 100 + 1
set /a tentativi_massimi=10
set /a tentativi=0

:: Logica del gioco
:inizio
set /a tentativi+=1
set /p tentativo=Indovina il numero (tra 1 e 100):

if !tentativo! gtr !numero_segreto! (
    echo Troppo alto.
) else if !tentativo! lss !numero_segreto! (
    echo Troppo basso.
) else (
    echo Indovinato! Hai indovinato il numero in !tentativi! tentativi.
    goto fine
)

if !tentativi! geq !tentativi_massimi! (
    echo Hai esaurito i tentativi. Il numero segreto era !numero_segreto!.
    goto fine
)

goto inizio

:fine
endlocal
pause
