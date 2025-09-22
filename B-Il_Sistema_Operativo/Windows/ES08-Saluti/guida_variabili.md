# Guida alle Variabili in Batch

Le variabili sono elementi fondamentali negli script batch di Windows, permettendo di memorizzare e manipolare dati. Questa guida esplora tutte le funzionalità e gli utilizzi delle variabili.

## Dichiarazione e Assegnazione

### Sintassi Base

```batch
SET variabile=valore
```

Esempio:
```batch
SET nome=Mario
echo Il nome è %nome%
```

Note:
- Non ci devono essere spazi prima e dopo il segno di uguale
- Per accedere al valore della variabile, si usa la sintassi `%variabile%`
- I nomi delle variabili non sono case-sensitive (`nome` e `NOME` sono la stessa variabile)

## Input Utente

Per richiedere input dall'utente:

```batch
SET /P variabile=messaggio
```

Esempio:
```batch
SET /P età=Inserisci la tua età: 
echo Hai %età% anni
```

## Variabili d'Ambiente

Windows ha molte variabili d'ambiente predefinite:

```batch
echo Nome utente: %USERNAME%
echo Directory home: %USERPROFILE%
echo Directory di sistema: %SYSTEMROOT%
echo Directory temporanea: %TEMP%
echo Percorso di ricerca: %PATH%
```

## Operazioni Aritmetiche

Per eseguire calcoli matematici:

```batch
SET /A variabile=espressione
```

Esempio:
```batch
SET /A somma=5+3
SET /A prodotto=4*2
SET /A divisione=10/2
SET /A resto=10%%3  REM %% per rappresentare l'operatore modulo
SET /A incremento=5+1
```

Operatori disponibili:
- `+` Addizione
- `-` Sottrazione
- `*` Moltiplicazione
- `/` Divisione
- `%%` Modulo (resto della divisione)
- `(` e `)` Parentesi per raggruppare operazioni

## Manipolazione di Stringhe

### Estrazione di Sottostringhe

```batch
SET stringa=Questa è una prova
echo %stringa:~6,2%  REM Estrae 2 caratteri a partire dalla posizione 6
```

Output: `è`

### Sostituzione di Caratteri

```batch
SET frase=Oggi piove molto
echo %frase:piove=splende%
```

Output: `Oggi splende molto`

### Rimozione di Caratteri

```batch
SET testo=abcXYZabc
echo %testo:abc=%  REM Rimuove tutte le occorrenze di "abc"
```

Output: `XYZ`

## Variabili Locali e Globali

### Variabili Locali (all'interno di un blocco)

```batch
SETLOCAL
SET locale=valore
REM La variabile "locale" esiste solo all'interno di questo blocco
ENDLOCAL
```

### Abilitare Estensioni di Comando

```batch
SETLOCAL EnableExtensions  REM Abilita funzionalità estese
SETLOCAL EnableDelayedExpansion  REM Abilita l'espansione ritardata delle variabili
```

## Espansione Ritardata delle Variabili

Quando si modifica una variabile all'interno di un blocco e si vuole usare il nuovo valore immediatamente:

```batch
SETLOCAL EnableDelayedExpansion
SET contatore=1

FOR %%i IN (1 2 3) DO (
    SET contatore=!contatore!%%i
    echo !contatore!
)
```

Nota: Con l'espansione ritardata, si usano `!variabile!` invece di `%variabile%`

## Verifica dell'Esistenza di Variabili

```batch
IF DEFINED variabile (
    echo La variabile esiste
) ELSE (
    echo La variabile non esiste
)
```

## Esempi Pratici

### Esempio 1: Calcolatrice semplice

```batch
@echo off
SETLOCAL EnableDelayedExpansion

SET /P num1=Inserisci il primo numero: 
SET /P num2=Inserisci il secondo numero: 
SET /P operazione=Inserisci l'operazione (+, -, *, /): 

IF "%operazione%"="+" SET /A risultato=%num1%+%num2%
IF "%operazione%"="-" SET /A risultato=%num1%-%num2%
IF "%operazione%"="*" SET /A risultato=%num1%*%num2%
IF "%operazione%"="/" SET /A risultato=%num1%/%num2%

echo Il risultato di %num1% %operazione% %num2% è: %risultato%
PAUSE
```

### Esempio 2: Contatore di file in una directory

```batch
@echo off
SETLOCAL EnableDelayedExpansion

SET contatore=0

FOR %%f IN (*.txt) DO (
    SET /A contatore+=1
)

echo Ci sono %contatore% file .txt nella directory corrente
PAUSE
```

### Esempio 3: Generazione di backup con timestamp

```batch
@echo off
SETLOCAL

REM Ottiene data e ora corrente
FOR /F "tokens=1-4 delims=/ " %%a IN ('date /t') DO SET data=%%a%%b%%c
FOR /F "tokens=1-2 delims=: " %%a IN ('time /t') DO SET ora=%%a%%b

SET nome_backup=backup_%data%_%ora%.zip

echo Creazione del backup: %nome_backup%
REM Qui inserire il comando per creare effettivamente il backup

echo Backup completato!
PAUSE
```

## Considerazioni Finali

- Evita spazi intorno al segno di uguale nelle assegnazioni
- Usa le virgolette quando lavori con stringhe che potrebbero contenere spazi
- Ricorda che le variabili sono case-insensitive
- Usa SETLOCAL e ENDLOCAL per limitare la portata delle variabili
- Utilizza EnableDelayedExpansion quando modifichi variabili all'interno di cicli
- Le variabili numeriche in batch sono limitate a numeri interi
- I nomi delle variabili possono contenere lettere, numeri e underscore, ma non caratteri speciali