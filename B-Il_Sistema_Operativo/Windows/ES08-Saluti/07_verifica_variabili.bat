@echo off
REM Script 07: Verifica dell'esistenza delle variabili

REM Dichiarazione di una variabile
SET var_test=Valore di test

REM Verifica dell'esistenza di una variabile
IF DEFINED var_test (
    echo La variabile var_test esiste e il suo valore è: %var_test%
) ELSE (
    echo La variabile var_test non esiste
)

REM Verifica di una variabile non definita
IF DEFINED var_non_esistente (
    echo La variabile var_non_esistente esiste
) ELSE (
    echo La variabile var_non_esistente non esiste
)

REM Pausa per visualizzare i risultati
PAUSE