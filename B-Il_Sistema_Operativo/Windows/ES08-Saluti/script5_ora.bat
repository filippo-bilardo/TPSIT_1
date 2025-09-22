@echo off

SET frase=Questa è una prova di manipolazione
echo Stringa originale: %frase%
echo Primi 6 caratteri: %frase:~0,6%

set ora=%time%
set ora=%ora:~0,2%
echo "Orario attuale %ora:~0,2%
echo "Var = %ora%


pause