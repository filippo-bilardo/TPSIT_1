# Esercizi su Gestione Errori e Debugging in Bash

Questi esercizi sono pensati per aiutarti a migliorare la robustezza e l'affidabilità dei tuoi script Bash, imparando a gestire gli errori e a utilizzare tecniche di debugging.

## Esercizio 1: Script Robusto per la Copia di File

**Obiettivo:** Scrivere uno script che copi un file sorgente in una destinazione, gestendo vari possibili errori.

**Requisiti:**
1.  Lo script deve accettare due argomenti: il percorso del file sorgente e il percorso della directory di destinazione.
2.  **Controllo Argomenti:**
    *   Verificare che siano stati forniti esattamente due argomenti. Se non è così, stampare un messaggio di errore e uscire con codice 1.
3.  **Controllo File Sorgente:**
    *   Verificare che il file sorgente esista e sia un file regolare. Se non lo è, stampare un messaggio di errore ed uscire con codice 2.
    *   Verificare che il file sorgente sia leggibile. Se non lo è, stampare un messaggio di errore ed uscire con codice 3.
4.  **Controllo Directory Destinazione:**
    *   Verificare che la destinazione esista e sia una directory. Se non lo è, stampare un messaggio di errore ed uscire con codice 4.
    *   Verificare che la directory di destinazione sia scrivibile. Se non lo è, stampare un messaggio di errore ed uscire con codice 5.
5.  **Operazione di Copia:**
    *   Utilizzare `cp` per copiare il file. Abilitare `set -e` prima del comando `cp` per assicurarsi che lo script esca se `cp` fallisce per qualche motivo non previsto (es. disco pieno).
    *   Se la copia ha successo, stampare un messaggio di conferma.
6.  **Logging (Opzionale):**
    *   Implementare una semplice funzione di logging (come vista negli esempi) per registrare i passaggi chiave e gli errori.

**Suggerimenti:**
*   Usa i test di condizione di Bash (`[ ]` o `[[ ]]`) per le verifiche.
*   Ricorda gli operatori `-f` (file regolare), `-d` (directory), `-r` (leggibile), `-w` (scrivibile), `-z` (stringa vuota), `$#` (numero di argomenti).
*   Usa `echo` per i messaggi e `exit <codice>` per terminare lo script.

## Esercizio 2: Debug di uno Script Esistente

**Obiettivo:** Ti viene fornito uno script con dei bug. Utilizza `set -x`, `echo` strategici, e la tua conoscenza di Bash per identificare e correggere i problemi.

**Script da Debuggare (`buggy_script.sh`):**
```bash
#!/bin/bash

# Questo script dovrebbe contare i file in una directory fornita
# e stampare un messaggio amichevole.

DIRECTORY=$1
UTENTE="$(whoami)"

echo "Ciao $UTENTE, sto per contare i file in $DIRECTORY"

if [ -d $DIRECTORY ]
  NUM_FILES=$(ls $DIRECTORY | wc -l)
  echo "La directory '$DIRECTORY' contiene $NUM_FILES file."
else
  echo "Errore: La directory $DIRECTORY non esiste."
  exit 1
fi

echo "Conteggio completato!"
```

**Problemi Potenziali da Cercare:**
1.  Cosa succede se `DIRECTORY` contiene spazi?
2.  Cosa succede se `DIRECTORY` non viene fornita?
3.  L'assegnazione di `NUM_FILES` è corretta e avviene nel posto giusto?
4.  La logica `if/else` è strutturata correttamente?

**Compiti:**
1.  Esegui lo script con diversi input (nessun input, una directory valida, una directory con spazi nel nome, un file invece di una directory, una directory inesistente) per osservare il comportamento.
2.  Usa `set -x` all'inizio dello script (o solo attorno alle sezioni problematiche) per vedere l'espansione dei comandi.
3.  Aggiungi comandi `echo` per stampare i valori delle variabili in punti critici.
4.  Correggi lo script in modo che:
    *   Gestisca correttamente i nomi di directory con spazi.
    *   Verifichi se l'argomento `DIRECTORY` è stato fornito.
    *   Conteggi correttamente i file.
    *   Abbia una struttura `if/then/else/fi` corretta.

## Esercizio 3: Utilizzo di `trap`

**Obiettivo:** Scrivere uno script che esegua un'operazione potenzialmente lunga (simulata con `sleep`) e che pulisca le risorse temporanee (un file fittizio) sia in caso di completamento normale, sia in caso di interruzione (Ctrl+C) o errore.

**Requisiti:**
1.  All'inizio, lo script deve creare un file temporaneo (es. `/tmp/mioprocesso_${$}.tmp`).
2.  Implementare una funzione `cleanup` che:
    *   Stampa un messaggio "Pulizia in corso...".
    *   Elimina il file temporaneo creato.
    *   Stampa un messaggio "File temporaneo eliminato.".
3.  Usare `trap` per chiamare la funzione `cleanup` quando lo script esce (segnale `EXIT`).
4.  Usare `trap` per chiamare la funzione `cleanup` (e magari stampare un messaggio specifico) quando lo script riceve un segnale `SIGINT` (Ctrl+C) o `SIGTERM`.
5.  Simulare un lavoro lungo con un ciclo `for` e `sleep 1` per alcuni secondi.
6.  (Opzionale) Introdurre un comando che potrebbe fallire (es. `ls /directory_inesistente`) dopo il lavoro simulato e usare `set -e` per vedere se la `trap EXIT` viene comunque eseguita.

**Test:**
*   Esegui lo script e lascialo completare normalmente. Verifica che il file temporaneo sia stato creato e poi eliminato.
*   Esegui lo script e interrompilo con Ctrl+C durante la simulazione del lavoro. Verifica che la pulizia avvenga.
*   (Se hai implementato la parte opzionale) Verifica che la pulizia avvenga anche se lo script termina a causa di un errore.

Buon lavoro con il debugging e la gestione degli errori!
