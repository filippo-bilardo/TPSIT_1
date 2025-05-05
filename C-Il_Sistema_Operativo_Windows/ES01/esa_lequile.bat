@echo off
REM Controllo se mancano i parametri per errori 
IF "%1"=="" GOTO errorr 
IF "%2"=="" GOTO error

REM Salvataggio dei parametri di nome utente e ora 
SET nome=%1 
SET ora=%2

REM Controllo ora 
IF %ora% LEQ 18 ( 
    ECHO Buongiorno!! %nome%! 
) ELSE (
    ECHO Buonasera!! %nome%!
) 
GOTO fine

: errore
ECHO filea.bat [nome] [orario tra 0 e 24]

: fine
PAUSE