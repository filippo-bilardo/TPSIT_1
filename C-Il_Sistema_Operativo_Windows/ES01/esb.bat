@echo off 

:: Permetto la visualizzazione di caratteri speciali
chcp 65001 > nul

:: Inizializzo le variabili 
set somma=0 
set i=1

:: Ciclo per sommare i numeri passati come argomenti
: loop
if "%1"=="" goto fine 
set /a somma=%somma% + %1 
shift 
goto loop
: fine
echo La somma totale è: %somma% 

:: Pausa per mantenere aperto il terminale
pause