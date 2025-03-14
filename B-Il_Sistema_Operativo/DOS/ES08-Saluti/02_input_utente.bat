@echo off
REM Script 02: Acquisizione di input dall'utente

REM Imposta la codifica UTF-8 per visualizzare correttamente i caratteri accentati
chcp 65001 > nul

REM Richiesta di input all'utente
SET /P nome=Inserisci il tuo nome: 
SET /P eta=Inserisci la tua età: 

REM Visualizzazione dei dati inseriti
echo Ciao %nome%, hai %eta% anni!

REM Pausa per visualizzare i risultati
PAUSE