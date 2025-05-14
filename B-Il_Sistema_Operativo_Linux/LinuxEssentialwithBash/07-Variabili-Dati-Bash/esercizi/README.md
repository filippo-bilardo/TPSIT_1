# Esercizi del Modulo 7: Variabili e Tipi di Dati in Bash

Questa cartella contiene esercizi pratici per approfondire la tua conoscenza delle variabili Bash, delle espansioni di parametri, dell'aritmetica e degli array.

## Riferimento agli Esercizi:

Tutti gli esercizi specifici per questo modulo sono dettagliati nel file:

*   **`01_esercizi_variabili_dati_avanzati.md`**

Questo file Markdown ti guiderà attraverso esercizi che coprono:
*   L'uso e la visualizzazione delle variabili d'ambiente.
*   Le variabili speciali della shell (es. `$?`, `$$`, `$!`).
*   L'espansione avanzata dei parametri per la manipolazione di stringhe (es. default, rimozione di prefissi/suffissi, lunghezza).
*   L'esecuzione di operazioni aritmetiche.
*   La creazione, la manipolazione e l'iterazione su array indicizzati.

## Come Svolgere gli Esercizi:

1.  Apri il file `01_esercizi_variabili_dati_avanzati.md`.
2.  Leggi attentamente la descrizione di ogni esercizio.
3.  Crea un nuovo file `.sh` per ogni script che scrivi.
4.  Inizia ogni script con lo shebang `#!/bin/bash`.
5.  Scrivi il codice Bash per risolvere l'esercizio, applicando i concetti appresi.
6.  Rendi lo script eseguibile con `chmod +x nome_tuo_script.sh`.
7.  Esegui lo script con `./nome_tuo_script.sh` (e con eventuali argomenti se richiesto).
8.  Verifica che l'output sia quello atteso e che lo script si comporti come descritto.

## Suggerimenti Aggiuntivi:

*   **Consulta le guide:** Se hai dubbi, rileggi la guida del modulo (`01_guida_variabili_dati.md`) o gli script di esempio.
*   **`man bash`:** La pagina di manuale di Bash è una risorsa completa. Cerca sezioni come "Parameter Expansion", "Shell Variables", "Arithmetic Evaluation", "Arrays".
*   **Sperimenta con le espansioni:** L'espansione dei parametri è molto potente. Prova diverse combinazioni per vedere come funzionano.
    *   Esempio: `NOME_FILE="documento.txt"`, prova `echo ${NOME_FILE%.*}` e `echo ${NOME_FILE#*.}`.
*   **Aritmetica:** Ricorda che `$(( ))` è generalmente preferito per l'aritmetica.
*   **Array:** Fai pratica con l'aggiunta di elementi, la rimozione (usando `unset`), l'ottenimento di sotto-sezioni (slicing) e la verifica dell'esistenza di un indice.

Buon lavoro con questi esercizi più avanzati sulle variabili e i dati in Bash!
