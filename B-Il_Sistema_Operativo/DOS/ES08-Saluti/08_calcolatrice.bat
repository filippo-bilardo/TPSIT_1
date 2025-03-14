@echo off
REM Script 08: Esempio pratico di calcolatrice semplice
SETLOCAL EnableDelayedExpansion

REM Richiesta di input all'utente
SET /P num1=Inserisci il primo numero: 
SET /P num2=Inserisci il secondo numero: 
SET /P operazione=Inserisci l'operazione (+, -, *, /): 

REM Esecuzione dell'operazione richiesta
IF "%operazione%"="+" SET /A risultato=%num1%+%num2%
IF "%operazione%"="-" SET /A risultato=%num1%-%num2%
IF "%operazione%"="*" SET /A risultato=%num1%*%num2%
IF "%operazione%"="/" SET /A risultato=%num1%/%num2%

REM Visualizzazione del risultato
echo Il risultato di %num1% %operazione% %num2% è: %risultato%

REM Pausa per visualizzare i risultati
PAUSE