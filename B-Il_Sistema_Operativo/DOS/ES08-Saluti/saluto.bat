@echo off
REM Script per visualizzare un saluto personalizzato in base all'orario
title Saluto Personalizzato

REM Richiesta del nome all'utente
set /p nome=Inserisci il tuo nome: 

REM Ottieni l'ora corrente dal sistema
for /f "tokens=1,2 delims=:" %%a in ("%time%") do (
    set ora=%%a
)

REM Rimuovi eventuali spazi iniziali dall'ora
set ora=%ora: =%

REM Verifica la fascia oraria e visualizza il saluto appropriato
if %ora% LEQ 18 (
    echo Buongiorno %nome%!
) else (
    echo Buonasera %nome%!
)

pause