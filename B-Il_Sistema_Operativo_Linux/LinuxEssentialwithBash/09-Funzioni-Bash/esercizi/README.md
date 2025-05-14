# Esercizi del Modulo 9: Funzioni in Bash

Questa cartella conterrà esercizi pratici per aiutarti a padroneggiare la creazione e l'utilizzo delle funzioni negli script Bash.

## Contenuti Previsti:

Gli esercizi richiederanno di:

*   **Definire e chiamare funzioni semplici:** Per eseguire compiti specifici e ripetitivi.
*   **Passare argomenti alle funzioni:** Per renderle più flessibili e riutilizzabili.
*   **Gestire i valori di ritorno (status code):** Per indicare il successo o il fallimento di un'operazione all'interno di una funzione.
*   **Catturare l'output delle funzioni:** Per utilizzare i risultati prodotti da una funzione in altre parti dello script.
*   **Comprendere e utilizzare lo scope delle variabili:** Distinguendo tra variabili globali e locali (`local`) per scrivere codice più robusto.
*   **Creare piccole "librerie" di funzioni:** Organizzando funzioni utili in file separati e includendole (`source`) in script principali.
*   **Riscrivere script precedenti utilizzando funzioni:** Per migliorare la loro struttura e leggibilità.

## Come Svolgere gli Esercizi:

Una volta che gli esercizi specifici saranno dettagliati (ad esempio in un file `01_esercizi_funzioni.md`):

1.  Leggi attentamente la descrizione di ogni esercizio.
2.  Crea un nuovo file `.sh` per ogni script che scrivi (es. `esercizio_funzione_01.sh`).
3.  Inizia ogni script con lo shebang `#!/bin/bash`.
4.  Definisci le funzioni come richiesto, prestando attenzione agli argomenti, ai valori di ritorno e allo scope delle variabili.
5.  Scrivi la parte principale dello script che chiama le tue funzioni.
6.  Rendi lo script eseguibile con `chmod +x nome_tuo_script.sh`.
7.  Esegui lo script con `./nome_tuo_script.sh` (e con eventuali argomenti se richiesto).
8.  Verifica che l'output sia quello atteso e che le funzioni si comportino come descritto.

## Suggerimenti:

*   **Modularità:** Pensa alle funzioni come blocchi di costruzione. Ogni funzione dovrebbe idealmente fare una cosa specifica e farla bene.
*   **Nomi Significativi:** Dai nomi chiari e descrittivi alle tue funzioni e variabili.
*   **Commenti:** Commenta le tue funzioni, specialmente se accettano argomenti o hanno un comportamento complesso.
*   **Testa Individualmente:** Se possibile, testa le tue funzioni separatamente prima di integrarle in script più grandi.
*   **`local` è tuo amico:** Usa `local` per le variabili all'interno delle funzioni per evitare di modificare accidentalmente variabili globali.
*   **Consulta la guida:** Rivedi `../guide/01_guida_funzioni_bash.md` e gli script di esempio (nella cartella `../esempi/`) per rinfrescare i concetti.

Buon lavoro con la creazione di script Bash più strutturati e riutilizzabili grazie alle funzioni!
