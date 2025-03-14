@echo off
REM Script 06: Espansione ritardata delle variabili

REM Abilitazione dell'espansione ritardata
SETLOCAL EnableDelayedExpansion

REM Esempio senza espansione ritardata
SET contatore=1
echo Valore iniziale: %contatore%

FOR %%i IN (1 2 3) DO (
    SET contatore=%contatore%%%i
    echo Senza espansione ritardata: %contatore%
)

REM Reset del contatore
SET contatore=1
echo Valore iniziale: !contatore!

FOR %%i IN (1 2 3) DO (
    SET contatore=!contatore!%%i
    echo Con espansione ritardata: !contatore!
)

REM Pausa per visualizzare i risultati
PAUSE