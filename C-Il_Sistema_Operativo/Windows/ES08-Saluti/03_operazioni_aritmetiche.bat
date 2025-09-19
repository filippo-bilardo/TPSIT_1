@echo off
REM Script 03: Operazioni aritmetiche con le variabili

REM Dichiarazione di variabili numeriche
SET /A num1=10
SET /A num2=5

REM Esecuzione di operazioni aritmetiche
SET /A somma=num1+num2
SET /A differenza=num1-num2
SET /A prodotto=num1*num2
SET /A divisione=num1/num2
SET /A resto=num1%%num2

REM Visualizzazione dei risultati
echo Primo numero: %num1%
echo Secondo numero: %num2%
echo Somma: %somma%
echo Differenza: %differenza%
echo Prodotto: %prodotto%
echo Divisione: %divisione%
echo Resto della divisione: %resto%

REM Pausa per visualizzare i risultati
PAUSE