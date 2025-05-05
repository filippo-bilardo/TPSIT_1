@echo off
set /a numero_segreto=%random% %% 100 + 1
set tentativi=0

echo Indovina il numero da 1 a 100!

:gioco
set /p guess=Inserisci il tuo tentativo: 
set /a tentativi+=1

if "%guess%"=="%numero_segreto%" (
    echo Hai vinto in %tentativi% tentativi!
    goto fine
)

if %tentativi% GEQ 10 (
    echo Hai finito i tentativi! Il numero era %numero_segreto%.
    goto fine
)

if %guess% GTR %numero_segreto% (
    echo Troppo alto!
) else (
    echo Troppo basso!
)

goto gioco

:fine
pause

