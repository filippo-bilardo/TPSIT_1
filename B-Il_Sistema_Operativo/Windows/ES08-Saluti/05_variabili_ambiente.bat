@echo off
REM Script 05: Utilizzo delle variabili d'ambiente

REM Visualizzazione delle variabili d'ambiente predefinite
echo Nome utente: %USERNAME%
echo Directory home: %USERPROFILE%
echo Directory di sistema: %SYSTEMROOT%
echo Directory temporanea: %TEMP%
echo Percorso di ricerca: %PATH:~0,50%... (troncato)

REM Creazione di una variabile d'ambiente personalizzata
SETX APP_VERSION "1.0.0" 2>nul
echo Variabile d'ambiente personalizzata: %APP_VERSION%

REM Pausa per visualizzare i risultati
PAUSE