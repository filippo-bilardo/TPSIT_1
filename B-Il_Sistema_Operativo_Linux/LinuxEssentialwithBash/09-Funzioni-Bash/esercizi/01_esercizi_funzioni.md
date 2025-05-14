<<<<<<< HEAD
# Esercizi: Funzioni in Bash

Questi esercizi ti aiuteranno a praticare e consolidare le tue conoscenze sulle funzioni in Bash. Completa ogni esercizio creando uno script separato e testalo nel tuo ambiente Linux.

## Esercizio 1: Funzione di Saluto Personalizzato

Crea uno script con una funzione chiamata `saluto_personalizzato` che accetti due parametri: un nome e un'ora del giorno (mattina, pomeriggio, sera). La funzione dovrebbe restituire un saluto appropriato in base all'ora.

**Esempio di output:**
```
Buongiorno, Mario! Come stai questa mattina?
Buon pomeriggio, Luigi! Come stai questo pomeriggio?
Buonasera, Giovanna! Come stai questa sera?
```

## Esercizio 2: Calcolatrice Semplice

Crea uno script con quattro funzioni: `addizione`, `sottrazione`, `moltiplicazione` e `divisione`. Ogni funzione dovrebbe accettare due numeri come parametri e restituire il risultato dell'operazione. Implementa anche una funzione `calcolatrice` che accetti tre parametri: due numeri e un'operazione (+, -, *, /) e chiami la funzione appropriata.

**Esempio di utilizzo:**
```bash
risultato=$(calcolatrice 10 5 "+")
echo "10 + 5 = $risultato"

risultato=$(calcolatrice 10 5 "-")
echo "10 - 5 = $risultato"
```

## Esercizio 3: Validazione Input

Crea una funzione chiamata `valida_numero` che verifichi se un input è un numero valido. La funzione dovrebbe restituire 0 (vero in Bash) se l'input è un numero, e 1 (falso in Bash) altrimenti. Usa questa funzione in uno script che chiede all'utente di inserire un numero e continua a chiedere finché non viene inserito un valore valido.

**Suggerimento:** Usa l'espressione regolare `^[0-9]+$` per verificare se una stringa contiene solo cifre.

## Esercizio 4: Libreria di Funzioni

Crea un file chiamato `funzioni_utili.sh` che contenga diverse funzioni utili:
- `converti_maiuscolo`: converte una stringa in maiuscolo
- `converti_minuscolo`: converte una stringa in minuscolo
- `conta_caratteri`: conta il numero di caratteri in una stringa
- `inverti_stringa`: inverte l'ordine dei caratteri in una stringa

Poi crea un secondo script che importi queste funzioni usando `source` e le utilizzi.

## Esercizio 5: Gestione File con Funzioni

Crea uno script che utilizzi funzioni per gestire file:
- `crea_file`: crea un nuovo file con il contenuto specificato
- `leggi_file`: mostra il contenuto di un file
- `aggiungi_a_file`: aggiunge testo alla fine di un file
- `elimina_file`: elimina un file dopo aver chiesto conferma

Lo script dovrebbe presentare un menu all'utente che gli permetta di scegliere quale operazione eseguire.

## Sfida Avanzata: Gestione Contatti

Crea un'applicazione a riga di comando per gestire una rubrica di contatti usando funzioni Bash. L'applicazione dovrebbe permettere di:
- Aggiungere un nuovo contatto (nome, telefono, email)
- Cercare un contatto per nome
- Visualizzare tutti i contatti
- Eliminare un contatto
- Modificare un contatto esistente

Utilizza un file di testo come database e implementa funzioni separate per ogni operazione. Assicurati di gestire correttamente gli errori e di validare gli input dell'utente.
======= 
# Esercizi del Modulo 9: Funzioni in Bash

Applica la tua conoscenza delle funzioni Bash per risolvere i seguenti esercizi. Crea un nuovo file script `.sh` per ogni esercizio o gruppo di esercizi correlati.

## Esercizio 1: Funzioni Matematiche di Base

**Obiettivo:** Creare un set di funzioni per eseguire operazioni matematiche di base.

**Requisiti:**
1.  Definisci le seguenti funzioni:
    *   `somma()`: Accetta due numeri come argomenti e stampa la loro somma.
    *   `sottrazione()`: Accetta due numeri come argomenti e stampa la loro differenza.
    *   `moltiplicazione()`: Accetta due numeri come argomenti e stampa il loro prodotto.
    *   `divisione()`: Accetta due numeri come argomenti e stampa il risultato della divisione (quoziente intero). Deve anche gestire la divisione per zero stampando un messaggio di errore e restituendo uno status code di 1.
2.  Ogni funzione deve verificare se riceve esattamente due argomenti. Se non li riceve, deve stampare un messaggio di errore sull'uso e restituire uno status code di 2.
3.  Ogni funzione deve verificare se entrambi gli argomenti sono numeri interi. Se non lo sono, deve stampare un messaggio di errore e restituire uno status code di 3.
4.  Scrivi una parte principale dello script che dimostri l'uso di ciascuna funzione con input validi e non validi (per testare la gestione degli errori).
    *   Cattura e stampa lo status di ritorno dopo ogni chiamata di funzione problematica.

**Suggerimenti:**
*   Usa `local` per le variabili all'interno delle funzioni.
*   Usa `$#` per il numero di argomenti.
*   Usa espressioni regolari `[[ "$VAR" =~ ^-?[0-9]+$ ]]` per validare i numeri interi.
*   Usa `return <numero>` per lo status code.
*   Usa `$?` per controllare lo status code dopo una chiamata di funzione.

## Esercizio 2: Gestore di Stringhe

**Obiettivo:** Creare funzioni per manipolare stringhe.

**Requisiti:**
1.  Definisci le seguenti funzioni:
    *   `lunghezza_stringa()`: Accetta una stringa come argomento e stampa la sua lunghezza.
    *   `maiuscolo()`: Accetta una stringa come argomento e stampa la stringa convertita in maiuscolo.
    *   `minuscolo()`: Accetta una stringa come argomento e stampa la stringa convertita in minuscolo.
    *   `contiene_sottostringa()`: Accetta due stringhe come argomenti (la stringa principale e la sottostringa da cercare). Stampa "Vero" se la sottostringa è contenuta nella stringa principale, altrimenti "Falso". Restituisce 0 se trovata, 1 altrimenti.
2.  Ogni funzione (eccetto `contiene_sottostringa` che ne richiede due) deve verificare di ricevere almeno un argomento stringa.
3.  Scrivi una parte principale dello script per testare ogni funzione.

**Suggerimenti:**
*   Per la lunghezza: `${#stringa}`.
*   Per maiuscolo/minuscolo: `${stringa^^}` e `${stringa,,}` (Bash 4.0+).
    *   Se usi una versione di Bash più vecchia, puoi usare `tr 'a-z' 'A-Z'` e `tr 'A-Z' 'a-z'`.
    *   Esempio: `echo "$stringa" | tr 'a-z' 'A-Z'`
*   Per cercare sottostringhe: `[[ "$stringa_principale" == *"$sottostringa"* ]]`.

## Esercizio 3: Refactoring Script di Backup con Funzioni

**Obiettivo:** Riscrivere lo script di backup dell'Esercizio 1 del Modulo 8 ("Controllo del Flusso") utilizzando le funzioni per migliorare la struttura e la leggibilità.

**Requisiti:**
1.  Identifica le diverse operazioni logiche nello script di backup originale (es. validazione argomenti, controllo esistenza file sorgente, controllo/creazione directory destinazione, generazione nome backup, copia file).
2.  Crea una funzione separata per ciascuna di queste operazioni logiche.
    *   Esempio di funzioni:
        *   `valida_argomenti_backup(numero_args, arg1, arg2)`
        *   `verifica_sorgente(percorso_sorgente)`
        *   `prepara_destinazione(percorso_destinazione)`
        *   `genera_nome_backup(nome_file_originale)` (restituisce il nome generato)
        *   `esegui_copia(sorgente, destinazione_con_nome_timestamp)`
3.  Le funzioni dovrebbero usare `return` per indicare successo/fallimento e stampare messaggi di errore appropriati.
4.  La parte principale dello script dovrebbe ora consistere principalmente in chiamate a queste funzioni, gestendo la logica di flusso basata sui loro status di ritorno.

**Suggerimenti:**
*   Pensa a quali informazioni ogni funzione necessita come input (argomenti) e cosa dovrebbe produrre (output catturabile o status code).
*   Usa `local` per le variabili all'interno delle funzioni.
*   Assicurati che lo script finale abbia lo stesso comportamento funzionale dell'originale.

## Esercizio 4: Libreria di Utility per File System

**Obiettivo:** Creare un file libreria (`filesystem_utils.sh`) con funzioni utili per operazioni comuni sul file system e uno script principale che le utilizzi.

**Requisiti per `filesystem_utils.sh`:**
1.  `conta_file_in_dir(directory_path)`: Stampa il numero di file (non directory) in una data directory.
2.  `spazio_disco_usato_dir(directory_path)`: Stampa lo spazio disco usato da una directory (formato human-readable, es. `du -sh`).
3.  `trova_file_per_nome(directory_ricerca, nome_file_pattern)`: Trova e stampa i percorsi dei file che corrispondono a un pattern di nome (es. `*.txt`) all'interno di una directory e delle sue sottodirectory. Usa `find`.
4.  `log_operazione(messaggio)`: Una semplice funzione di logging che stampa un messaggio preceduto da un timestamp (simile a quella vista negli esempi).

**Requisiti per lo script principale (`main_fs_script.sh`):**
1.  Includere (`source`) il file `filesystem_utils.sh`.
2.  Chiedere all'utente di inserire un percorso di directory.
3.  Validare che la directory esista.
4.  Usare le funzioni dalla libreria per:
    *   Loggare l'inizio delle operazioni.
    *   Contare e stampare il numero di file nella directory data.
    *   Stampare lo spazio disco usato dalla directory.
    *   Chiedere all'utente un pattern di nome file (es. `*.log`) e trovare i file corrispondenti.
    *   Loggare la fine delle operazioni.

**Suggerimenti:**
*   Per `conta_file_in_dir`: `find "$directory_path" -maxdepth 1 -type f -print | wc -l`
*   Per `spazio_disco_usato_dir`: `du -sh "$directory_path" | cut -f1` (per ottenere solo la dimensione).
*   Per `trova_file_per_nome`: `find "$directory_ricerca" -type f -name "$nome_file_pattern"`
*   Ricorda di rendere eseguibile `main_fs_script.sh`.

Buon lavoro con le funzioni Bash!
>>>>>>> 50c2cd923b72fc8a1424682b4dd9d2bfe965f265
