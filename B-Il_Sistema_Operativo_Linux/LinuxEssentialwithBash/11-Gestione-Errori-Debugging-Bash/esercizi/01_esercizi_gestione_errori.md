# Esercizi: Gestione degli Errori e Debugging in Bash

Questi esercizi ti aiuteranno a praticare e consolidare le tue conoscenze sulla gestione degli errori e il debugging negli script Bash. Completa ogni esercizio creando uno script separato e testalo nel tuo ambiente Linux.

## Esercizio 1: Controllo dei Codici di Uscita

Crea uno script che:
1. Tenti di accedere a tre file diversi: uno esistente (crealo tu) e due inesistenti
2. Per ogni file, controlli il codice di uscita del comando e mostri un messaggio appropriato
3. Alla fine, mostri un riepilogo: quanti file sono stati trovati e quanti erano mancanti

**Suggerimento:** Usa la variabile `$?` per controllare il codice di uscita dell'ultimo comando eseguito.

## Esercizio 2: Gestione degli Errori con trap

Crea uno script che:
1. Crei alcuni file temporanei durante l'esecuzione
2. Utilizzi `trap` per assicurarsi che questi file vengano eliminati sia in caso di completamento normale che in caso di interruzione (SIGINT) o errore
3. Simuli diverse situazioni: completamento normale, interruzione con Ctrl+C, e un errore (ad esempio, tentando di accedere a un file inesistente)

**Suggerimento:** Usa `trap cleanup EXIT SIGINT ERR` per registrare una funzione di pulizia.

## Esercizio 3: Debug con set -x

Crea uno script che:
1. Contenga un ciclo che elabori alcuni dati (ad esempio, numeri da 1 a 5)
2. Attivi la modalità di debug (`set -x`) solo per una parte specifica dello script
3. Includa commenti che spieghino cosa sta succedendo durante l'esecuzione

Esegui lo script e osserva l'output di debug. Poi modifica lo script per correggere eventuali problemi identificati.

## Esercizio 4: Gestione delle Variabili non Definite

Crea uno script che:
1. Attivi l'opzione `set -u` per rilevare variabili non definite
2. Tenti di utilizzare alcune variabili, alcune definite e altre no
3. Implementi un meccanismo per fornire valori predefiniti alle variabili non definite usando `${VAR:-default}`

Esegui lo script con e senza `set -u` e osserva le differenze.

## Esercizio 5: Logging degli Errori

Crea uno script che:
1. Definisca funzioni per diversi livelli di log: `log_info`, `log_warning`, `log_error`
2. Ogni funzione dovrebbe scrivere messaggi formattati sia su stdout che in un file di log
3. Implementi una funzione `assert` che verifichi una condizione e registri un errore se la condizione è falsa
4. Utilizzi queste funzioni in uno script che esegua diverse operazioni, alcune delle quali potrebbero fallire

**Esempio di formato di log:** `[2023-05-20 15:30:45] [ERROR] Impossibile aprire il file: file.txt`

## Sfida Avanzata: Script Robusto di Backup

Crea uno script di backup che:
1. Accetti parametri da riga di comando per specificare la directory di origine e quella di destinazione
2. Verifichi che entrambe le directory esistano e siano accessibili
3. Crei un archivio tar.gz della directory di origine nella directory di destinazione
4. Implementi una gestione completa degli errori per ogni fase
5. Utilizzi `set -e` per terminare in caso di errori, ma gestisca correttamente la pulizia
6. Registri tutte le operazioni in un file di log
7. Alla fine, verifichi che il backup sia stato creato correttamente e abbia una dimensione ragionevole

Lo script dovrebbe essere robusto e in grado di gestire situazioni come: spazio insufficiente, permessi mancanti, interruzioni dell'utente, ecc.