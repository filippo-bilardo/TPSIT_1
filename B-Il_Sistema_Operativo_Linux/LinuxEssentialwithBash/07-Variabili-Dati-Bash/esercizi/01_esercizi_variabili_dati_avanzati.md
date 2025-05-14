# Esercizi: Variabili Avanzate, Manipolazione Dati e Array in Bash

Questi esercizi sono progettati per consolidare la tua comprensione delle variabili (scope, speciali, parametri posizionali), dell'espansione delle variabili, della sostituzione dei comandi, delle operazioni aritmetiche, della manipolazione di stringhe e dell'uso degli array in Bash.

## Esercizio 1: Script Multifunzione con Parametri Posizionali

1.  **Obiettivo**: Creare uno script che accetti parametri posizionali e utilizzi variabili speciali.
2.  **Istruzioni**:
    a.  Crea un file chiamato `analizzatore_argomenti.sh`.
    b.  Lo script deve:
        -   Stampare il nome dello script (`$0`).
        -   Stampare il numero totale di argomenti passati (`$#`).
        -   Se vengono passati almeno due argomenti, stampare il primo (`$1`) e il secondo (`$2`).
        -   Stampare tutti gli argomenti come una singola stringa (`$*`).
        -   Iterare su tutti gli argomenti (usando `"$@"`) e stampare ogni argomento preceduto da "Argomento:".
        -   Eseguire un comando (es. `date`) e stampare il suo codice di uscita (`$?`).
    c.  Salva, rendi eseguibile ed esegui lo script con diversi argomenti (es. `./analizzatore_argomenti.sh uno "due tre" quattro`).
3.  **Verifica**: Controlla che l'output corrisponda al comportamento atteso delle variabili speciali e dei parametri posizionali.

## Esercizio 2: Manipolazione di Stringhe con Espansione

1.  **Obiettivo**: Utilizzare l'espansione delle variabili per manipolare stringhe.
2.  **Istruzioni**:
    a.  Crea un file `manipola_stringhe.sh`.
    b.  All'interno dello script:
        -   Definisci una variabile `URL="https://www.miosito.com/cartella/pagina.html?param1=valore1"`.
        -   Usando l'espansione delle variabili, estrai e stampa:
            -   Il protocollo (es. "https"). (Suggerimento: `${URL%%:/*}`)
            -   Il nome del dominio (es. "www.miosito.com"). (Suggerimento: rimuovi protocollo e poi il primo `/`)
            -   Il nome del file (es. "pagina.html"). (Suggerimento: `${URL##*/}` e poi rimuovi query string)
            -   La query string (es. "param1=valore1"). (Suggerimento: `${URL#*?}`)
        -   Definisci una variabile `FRASE="il    mio     script   bash   è   utile"`.
        -   Sostituisci tutti gli spazi multipli con uno spazio singolo. (Potrebbe richiedere più passaggi o comandi esterni come `tr -s ' '` dentro una sostituzione di comando, o esplorare `${FRASE//  / }` ripetutamente se necessario, anche se `tr` è più diretto per questo caso specifico).
        -   Stampa la lunghezza della `FRASE` originale e di quella modificata.
    c.  Salva, rendi eseguibile ed esegui.
3.  **Verifica**: L'output deve mostrare le parti estratte dell'URL e la frase con spazi normalizzati.

## Esercizio 3: Calcolatrice con Operazioni Aritmetiche

1.  **Obiettivo**: Praticare le operazioni aritmetiche e la sostituzione di comandi.
2.  **Istruzioni**:
    a.  Crea un file `calcolatrice_avanzata.sh`.
    b.  Lo script deve:
        -   Prendere due numeri come argomenti posizionali (`$1` e `$2`). Controlla se sono stati forniti esattamente due argomenti, altrimenti stampa un messaggio di errore ed esci (usa `exit 1`).
        -   Calcolare e stampare: somma, differenza, prodotto, quoziente intero e resto della divisione tra i due numeri usando `$(( ))`.
        -   Chiedere all'utente di inserire un terzo numero usando `read -p`.
        -   Calcolare la media dei tre numeri (i due argomenti e quello inserito). Poiché Bash fa aritmetica intera, il risultato sarà intero. Per una media più precisa con decimali, dovresti usare `bc`. Mostra come faresti con `bc` (es. `echo "scale=2; ($1 + $2 + $terzo_numero) / 3" | bc`).
    c.  Salva, rendi eseguibile ed esegui con due numeri come argomenti.
3.  **Verifica**: Lo script deve eseguire i calcoli correttamente e gestire l'input dell'utente.

## Esercizio 4: Gestione di un Elenco con Array Indicizzato

1.  **Obiettivo**: Lavorare con array indicizzati.
2.  **Istruzioni**:
    a.  Crea un file `gestione_lista_spesa.sh`.
    b.  Nello script:
        -   Inizializza un array chiamato `lista_spesa` con alcuni articoli (es. "Latte", "Pane", "Uova").
        -   Stampa l'elenco completo degli articoli.
        -   Aggiungi un nuovo articolo alla lista (es. "Frutta") letto da input utente.
        -   Stampa il numero totale di articoli nella lista.
        -   Chiedi all'utente l'indice di un articolo da rimuovere (ricorda che gli indici partono da 0). Rimuovi l'articolo (se l'indice è valido). (Suggerimento: per rimuovere e ricreare l'array senza "buchi" potresti dover creare un nuovo array filtrando quello vecchio, oppure usare `unset` e accettare i buchi se la logica successiva lo permette, o ancora `lista_spesa=("${lista_spesa[@]:0:indice_da_rimuovere}" "${lista_spesa[@]:indice_da_rimuovere+1}")` )
        -   Stampa la lista aggiornata.
    c.  Salva, rendi eseguibile ed esegui.
3.  **Verifica**: Lo script deve permettere di visualizzare, aggiungere e rimuovere articoli dalla lista.

## Esercizio 5: Rubrica Semplice con Array Associativo (Bash 4.0+)

1.  **Obiettivo**: Utilizzare array associativi per creare una semplice rubrica.
2.  **Istruzioni**:
    a.  Crea un file `rubrica_associativa.sh`.
    b.  Nello script:
        -   Dichiara un array associativo `rubrica` con `declare -A rubrica`.
        -   Aggiungi alcune voci alla rubrica, dove la chiave è il nome e il valore è il numero di telefono (es. `rubrica["Mario Rossi"]="123-456789"`, `rubrica["Luisa Bianchi"]="987-654321"`).
        -   Chiedi all'utente il nome di una persona da cercare.
        -   Se il nome esiste nella rubrica, stampa il numero di telefono. Altrimenti, stampa "Contatto non trovato". (Suggerimento: `[[ -v rubrica["$nome_cercato"] ]]` per verificare l'esistenza della chiave).
        -   Stampa tutte le voci della rubrica (nome e numero).
    c.  Salva, rendi eseguibile ed esegui.
3.  **Verifica**: Lo script deve cercare e visualizzare correttamente i contatti.

Buon lavoro! Questi esercizi ti aiuteranno a prendere confidenza con aspetti più avanzati della gestione dei dati in Bash.