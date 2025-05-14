# Esercizi: Scripting Avanzato in Bash

Questi esercizi ti aiuteranno a praticare e consolidare le tue conoscenze sulle tecniche avanzate di scripting in Bash. Completa ogni esercizio creando uno script separato e testalo nel tuo ambiente Linux.

## Esercizio 1: Gestione Avanzata degli Array

Crea uno script che:
1. Definisca un array di numeri interi
2. Implementi funzioni per:
   - Calcolare la somma di tutti gli elementi
   - Trovare il valore massimo e minimo
   - Ordinare l'array in ordine crescente
   - Filtrare solo i numeri pari
3. Mostri i risultati di ogni operazione

**Suggerimento:** Utilizza le operazioni aritmetiche di Bash e i costrutti di ciclo per manipolare gli array.

## Esercizio 2: Analizzatore di Log con Espressioni Regolari

Crea uno script che:
1. Accetti un file di log come input (crea un file di esempio con vari tipi di messaggi)
2. Utilizzi espressioni regolari per estrarre informazioni specifiche come:
   - Indirizzi IP
   - Timestamp
   - Messaggi di errore
   - URL
3. Generi un report con statistiche sui dati estratti

**Suggerimento:** Utilizza `[[ $stringa =~ $regex ]]` e `${BASH_REMATCH[0]}` per lavorare con le espressioni regolari.

## Esercizio 3: Gestione Avanzata dei Parametri

Crea uno script di utilità che:
1. Accetti vari parametri da riga di comando usando `getopts`
2. Supporti opzioni come:
   - `-f file`: specifica un file di input
   - `-o file`: specifica un file di output
   - `-v`: attiva la modalità verbose
   - `-h`: mostra l'help
   - `-n numero`: specifica un numero di iterazioni
3. Implementi la validazione dei parametri e mostri messaggi di errore appropriati
4. Esegua un'operazione semplice (a tua scelta) utilizzando i parametri forniti

**Suggerimento:** Usa `getopts` in un ciclo while per processare le opzioni.

## Esercizio 4: Manipolazione Avanzata di Stringhe

Crea uno script che:
1. Chieda all'utente di inserire una frase
2. Implementi funzioni per:
   - Convertire la frase in maiuscolo/minuscolo
   - Invertire l'ordine delle parole
   - Sostituire tutte le occorrenze di una parola con un'altra
   - Contare le occorrenze di ogni parola
   - Estrarre tutte le parole che iniziano con una lettera specifica
3. Mostri i risultati di ogni operazione

**Suggerimento:** Utilizza le operazioni di manipolazione delle stringhe di Bash come `${string^^}`, `${string,,}`, `${string/pattern/replacement}`, ecc.

## Esercizio 5: Monitoraggio di Sistema

Crea uno script che:
1. Raccolga informazioni sul sistema ogni 5 secondi, come:
   - Utilizzo della CPU
   - Utilizzo della memoria
   - Spazio disco disponibile
   - Processi attivi
2. Salvi queste informazioni in un file di log con timestamp
3. Implementi un meccanismo per rilevare quando l'utilizzo delle risorse supera una soglia specificata
4. Mostri un avviso quando viene rilevato un problema

**Suggerimento:** Utilizza comandi come `top`, `free`, `df` e `ps` per raccogliere le informazioni di sistema.

## Sfida Avanzata: Gioco Interattivo

Crea un semplice gioco interattivo in Bash, come indovinare un numero o un gioco di quiz. Lo script dovrebbe:
1. Utilizzare array per memorizzare domande, risposte o altri dati di gioco
2. Implementare un'interfaccia utente interattiva usando `read`
3. Tenere traccia del punteggio del giocatore
4. Utilizzare funzioni per organizzare il codice
5. Implementare una gestione avanzata degli errori
6. Salvare i punteggi migliori in un file

Sii creativo e cerca di utilizzare il maggior numero possibile di tecniche avanzate di Bash viste nel modulo.