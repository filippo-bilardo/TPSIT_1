@echo off
REM Script 04: Manipolazione delle stringhe

chcp 65001 > nul

REM Dichiarazione di una stringa
SET frase=Questa è una prova di manipolazione

REM Estrazione di sottostringhe
echo Stringa originale: %frase%
echo Primi 6 caratteri: %frase:~0,6%
echo Caratteri dalla posizione 11 alla 14: %frase:~11,4%
echo Ultimi 13 caratteri: %frase:~-13%

REM Sostituzione di caratteri
SET nuova_frase=%frase:prova=esempio%
echo Stringa con sostituzione: %nuova_frase%

REM Rimozione di parti della stringa
SET rimozione=%frase:una =%
echo Stringa con rimozione: %rimozione%

REM Pausa per visualizzare i risultati
PAUSE