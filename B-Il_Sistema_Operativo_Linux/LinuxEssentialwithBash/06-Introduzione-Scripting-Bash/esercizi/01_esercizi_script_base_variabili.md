# Esercizi: Introduzione allo Scripting Bash, Variabili e I/O

Questi esercizi sono pensati per aiutarti a consolidare la comprensione dei concetti base dello scripting Bash, incluse la creazione di script, l'uso di variabili, il comando `echo` per l'output e il comando `read` per l'input.

## Esercizio 1: Il Tuo Primo Script

1.  **Obiettivo**: Creare, rendere eseguibile ed eseguire un semplice script Bash.
2.  **Istruzioni**:
    a.  Crea un nuovo file chiamato `saluto_script.sh`.
    b.  Aggiungi la shebang `#!/bin/bash` all'inizio del file.
    c.  Aggiungi un commento che descriva brevemente cosa fa lo script (es. "Script che stampa un messaggio di saluto").
    d.  Usa il comando `echo` per stampare il messaggio: "Benvenuto nel mondo dello scripting Bash!"
    e.  Salva il file.
    f.  Rendi lo script eseguibile usando il comando `chmod +x saluto_script.sh`.
    g.  Esegui lo script dalla riga di comando usando `./saluto_script.sh`.
3.  **Verifica**: Lo script dovrebbe stampare il messaggio specificato nel terminale.

## Esercizio 2: Informazioni di Sistema Semplici

1.  **Obiettivo**: Scrivere uno script che mostri alcune informazioni di sistema utilizzando `echo` e comandi di sistema.
2.  **Istruzioni**:
    a.  Crea un nuovo file chiamato `info_sistema.sh`.
    b.  Aggiungi la shebang e un commento descrittivo.
    c.  Usa `echo` per stampare le seguenti informazioni, ognuna su una nuova riga:
        -   Un messaggio introduttivo, es: "Ecco alcune informazioni sul sistema:"
        -   La data e l'ora correnti (suggerimento: usa il comando `date`).
        -   L'utente corrente (suggerimento: usa il comando `whoami` o la variabile `$USER`).
        -   La directory di lavoro corrente (suggerimento: usa il comando `pwd`).
    d.  Salva, rendi eseguibile ed esegui lo script.
3.  **Verifica**: Lo script dovrebbe visualizzare correttamente le informazioni richieste.

## Esercizio 3: Utilizzo delle Variabili

1.  **Obiettivo**: Praticare l'assegnazione e l'utilizzo di variabili.
2.  **Istruzioni**:
    a.  Crea un file `presentazione_variabili.sh`.
    b.  All'interno dello script:
        -   Definisci una variabile chiamata `NOME` e assegnale il tuo nome come valore (stringa).
        -   Definisci una variabile chiamata `CITTA_PREFERITA` e assegnale il nome della tua città preferita.
        -   Definisci una variabile numerica `ANNO_NASCITA` e assegnale il tuo anno di nascita.
        -   Usa `echo` per stampare una frase di presentazione che includa queste variabili. Ad esempio: "Ciao, il mio nome è [NOME], sono nato nel [ANNO_NASCITA] e la mia città preferita è [CITTA_PREFERITA]."
    c.  Salva, rendi eseguibile ed esegui lo script.
3.  **Verifica**: L'output dovrebbe mostrare la frase di presentazione con i valori delle variabili correttamente inseriti.

## Esercizio 4: Script Interattivo con `read`

1.  **Obiettivo**: Creare uno script che interagisca con l'utente usando `read`.
2.  **Istruzioni**:
    a.  Crea un file `dialogo_utente.sh`.
    b.  Lo script dovrebbe:
        -   Chiedere all'utente il suo nome usando `read -p "Come ti chiami? " nome_utente`.
        -   Salutare l'utente con il nome fornito, es: `echo "Ciao, $nome_utente!"`.
        -   Chiedere all'utente qual è il suo linguaggio di programmazione preferito usando `read -p "Qual è il tuo linguaggio di programmazione preferito? " linguaggio_preferito`.
        -   Stampare un messaggio che commenti la scelta, es: `echo "Interessante! $linguaggio_preferito è un linguaggio potente."`.
    c.  Salva, rendi eseguibile ed esegui lo script. Prova a inserire input diversi.
3.  **Verifica**: Lo script dovrebbe porre le domande, leggere l'input e visualizzare i messaggi personalizzati.

## Esercizio 5: Calcolatrice Semplice (Bonus)

1.  **Obiettivo**: Creare uno script che prenda due numeri in input e ne stampi la somma.
2.  **Istruzioni**:
    a.  Crea un file `calcolatrice_somma.sh`.
    b.  Lo script dovrebbe:
        -   Chiedere all'utente di inserire il primo numero: `read -p "Inserisci il primo numero: " num1`.
        -   Chiedere all'utente di inserire il secondo numero: `read -p "Inserisci il secondo numero: " num2`.
        -   Calcolare la somma dei due numeri. Ricorda che per le operazioni aritmetiche in Bash puoi usare la sintassi `$((espressione))`. Ad esempio: `somma=$((num1 + num2))`.
        -   Stampare il risultato: `echo "La somma di $num1 e $num2 è: $somma"`.
    c.  Salva, rendi eseguibile ed esegui lo script.
3.  **Verifica**: Inserendo due numeri, lo script dovrebbe calcolare e visualizzare correttamente la loro somma.

Buon lavoro con gli esercizi! Ricorda di sperimentare e consultare le guide se hai dubbi.