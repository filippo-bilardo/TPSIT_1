# Guida al Comando IF

Il comando `IF` è uno degli strumenti più potenti negli script batch di Windows, permettendo di eseguire operazioni condizionali. Questa guida esplora tutte le sue funzionalità e utilizzi.

## Sintassi Base

```batch
IF [NOT] condizione comando_da_eseguire
```

L'opzione `NOT` inverte il risultato della condizione.

## Tipi di Condizioni

### 1. Confronto di Stringhe

```batch
IF [NOT] string1==string2 comando_da_eseguire
```

Esempio:
```batch
IF "%username%"=="Admin" echo Benvenuto Amministratore
```

Note:
- Il confronto è case-sensitive (distingue tra maiuscole e minuscole)
- È consigliabile racchiudere le stringhe tra virgolette per evitare errori con spazi

### 2. Confronto di Numeri

```batch
IF [NOT] %variabile% operatore valore comando_da_eseguire
```

Operatori disponibili:
- EQU: Uguale a (Equal)
- NEQ: Diverso da (Not Equal)
- LSS: Minore di (Less Than)
- LEQ: Minore o uguale a (Less or Equal)
- GTR: Maggiore di (Greater Than)
- GEQ: Maggiore o uguale a (Greater or Equal)

Esempio:
```batch
IF %età% GEQ 18 echo Sei maggiorenne
```

### 3. Verifica Esistenza File

```batch
IF [NOT] EXIST percorso_file comando_da_eseguire
```

Esempio:
```batch
IF EXIST "c:\temp\log.txt" echo Il file di log esiste
```

### 4. Controllo Errorlevel

```batch
IF [NOT] ERRORLEVEL numero comando_da_eseguire
```

Verifica se il codice di errore dell'ultimo comando è maggiore o uguale al numero specificato.

Esempio:
```batch
ping 127.0.0.1
IF ERRORLEVEL 1 echo Errore durante il ping
```

## Clausola ELSE

Puoi utilizzare la clausola `ELSE` per eseguire un comando quando la condizione è falsa:

```batch
IF condizione (
    comando_se_vero
) ELSE (
    comando_se_falso
)
```

Esempio:
```batch
IF EXIST "report.txt" (
    echo Il report esiste
) ELSE (
    echo Il report non esiste
    echo Creazione nuovo report...
)
```

Nota: Le parentesi sono necessarie quando si usa ELSE o quando si eseguono più comandi.

## Condizioni Composte

### Operatore AND logico (entrambe le condizioni devono essere vere)

```batch
IF condizione1 (
    IF condizione2 (
        comando_da_eseguire
    )
)
```

Esempio:
```batch
IF EXIST "config.ini" (
    IF %livello% GEQ 5 (
        echo Configurazione valida e livello sufficiente
    )
)
```

### Operatore OR logico (almeno una condizione deve essere vera)

```batch
IF condizione1 (
    comando_da_eseguire
) ELSE (
    IF condizione2 (
        comando_da_eseguire
    )
)
```

Esempio:
```batch
IF EXIST "backup1.zip" (
    echo Backup trovato
) ELSE (
    IF EXIST "backup2.zip" (
        echo Backup alternativo trovato
    ) ELSE (
        echo Nessun backup disponibile
    )
)
```

## Esempi Pratici

### Esempio 1: Verifica input utente

```batch
@echo off
set /p nome=Inserisci il tuo nome: 

IF "%nome%"=="" (
    echo Non hai inserito alcun nome
) ELSE (
    echo Ciao %nome%!
)
```

### Esempio 2: Controllo età con messaggi multipli

```batch
@echo off
set /p età=Quanti anni hai? 

IF %età% LSS 18 (
    echo Sei minorenne
    echo Non puoi accedere a questa sezione
) ELSE (
    IF %età% GEQ 65 (
        echo Sei un senior
    ) ELSE (
        echo Sei un adulto
    )
    echo Accesso consentito
)
```

### Esempio 3: Verifica giorno della settimana

```batch
@echo off
FOR /F "tokens=1" %%i IN ('date /t') DO set giorno=%%i

IF "%giorno%"=="lun" (
    echo Oggi è lunedì, inizio settimana
) ELSE IF "%giorno%"=="ven" (
    echo Oggi è venerdì, fine settimana lavorativa
) ELSE IF "%giorno%"=="sab" (
    echo Buon weekend!
) ELSE IF "%giorno%"=="dom" (
    echo Buon weekend!
) ELSE (
    echo Giorno lavorativo normale
)
```

## Considerazioni Finali

- Usa le parentesi per raggruppare comandi multipli
- Fai attenzione agli spazi nelle stringhe
- Ricorda che ERRORLEVEL verifica se il valore è maggiore o uguale
- Per condizioni complesse, considera l'uso di etichette e GOTO
- Nei confronti di stringhe, usa sempre le virgolette per evitare problemi con spazi o caratteri speciali