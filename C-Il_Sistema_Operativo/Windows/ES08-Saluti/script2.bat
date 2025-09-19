:: secondo script
@echo off

:: Imposta la codifica UTF-8 per visualizzare correttamente i caratteri accentati
chcp 65001 > nul

SET nome="Mario Rossi"
ECHO Il primo parametro è %1
ECHO Ciao %nome% sono le %1
pause