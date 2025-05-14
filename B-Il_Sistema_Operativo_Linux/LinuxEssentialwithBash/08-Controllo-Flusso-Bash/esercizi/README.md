# Esercizi del Modulo 8: Controllo del Flusso in Bash

Questa cartella conterrà esercizi pratici per applicare le strutture di controllo del flusso in Bash.

## Contenuti Previsti:

Gli esercizi richiederanno di scrivere script che utilizzino:

*   **Costrutti `if`, `elif`, `else`:** Per prendere decisioni basate su diverse condizioni (es. verificare l'esistenza di un file, confrontare numeri, controllare l'input dell'utente).
*   **Costrutto `case`:** Per gestire input utente a scelta multipla o per eseguire azioni diverse in base al valore di una variabile.
*   **Cicli `for`:** Per iterare su collezioni di dati (es. file in una directory, righe in un file, liste di nomi) o per eseguire un blocco di codice un numero fisso di volte.
*   **Cicli `while` e `until`:** Per creare loop che continuano finché una condizione è (o diventa) vera, utili per script interattivi o per processare dati fino a un certo punto.
*   **Comandi `break` e `continue`:** Per affinare il comportamento dei cicli, interrompendoli o saltando iterazioni specifiche.

## Come Svolgere gli Esercizi:

Una volta che gli esercizi specifici saranno dettagliati (ad esempio in un file `01_esercizi_controllo_flusso.md`):

1.  Leggi attentamente la descrizione di ogni esercizio.
2.  Crea un nuovo file `.sh` per ogni script che scrivi (es. `esercizio_01.sh`).
3.  Inizia ogni script con lo shebang `#!/bin/bash`.
4.  Scrivi il codice Bash per risolvere l'esercizio, implementando le logiche di controllo del flusso richieste.
5.  Rendi lo script eseguibile con `chmod +x nome_tuo_script.sh`.
6.  Esegui lo script con `./nome_tuo_script.sh` (e con eventuali argomenti se richiesto).
7.  Verifica che l'output sia quello atteso e che lo script si comporti come descritto.

## Suggerimenti:

*   **Pianifica la logica:** Prima di scrivere, pensa a come le condizioni e i cicli dovrebbero funzionare.
*   **Testa le condizioni:** Usa `echo` per verificare i valori delle variabili e il risultato dei test `[ ]` o `[[ ]]`.
*   **Indentazione:** Indenta correttamente il codice all'interno dei blocchi `if`, `for`, `while`, ecc., per migliorare la leggibilità.
*   **Commenti:** Aggiungi commenti per spiegare le parti complesse della tua logica.
*   **Consulta la guida:** Rivedi `../guide/01_guida_controllo_flusso.md` e gli script di esempio (nella cartella `../esempi/`) per rinfrescare i concetti.

Buon lavoro con la programmazione del controllo del flusso in Bash!
