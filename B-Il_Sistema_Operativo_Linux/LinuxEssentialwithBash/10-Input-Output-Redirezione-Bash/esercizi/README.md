# Esercizi del Modulo 10: Input, Output e Redirezione in Bash

Questa cartella conterrà esercizi pratici per applicare le tue conoscenze sulla gestione dell'input, dell'output e delle redirezioni in Bash.

## Contenuti Previsti:

Gli esercizi richiederanno di:

*   **Redirigere l'output standard (stdout) e l'errore standard (stderr)** di comandi verso file, sia sovrascrivendo che appendendo.
*   **Utilizzare `/dev/null`** per scartare output indesiderato.
*   **Redirigere l'input standard (stdin)** da file verso comandi.
*   **Creare e utilizzare Here Documents e Here Strings** per fornire input multi-riga o stringhe singole ai comandi.
*   **Costruire pipeline di comandi utilizzando il pipe (`|`)** per processare dati in sequenza.
*   **Utilizzare il comando `tee`** per duplicare l'output su schermo e su file.
*   **Sperimentare con `exec`** per impostare redirezioni persistenti all'interno di uno script.
*   **Esplorare la Process Substitution** (`>(comando)` e `<(comando)`) per scenari più avanzati.

## Come Svolgere gli Esercizi:

Una volta che gli esercizi specifici saranno dettagliati (ad esempio in un file `01_esercizi_io_redirezione.md`):

1.  Leggi attentamente la descrizione di ogni esercizio.
2.  Crea un nuovo file `.sh` per ogni script che scrivi (es. `esercizio_io_01.sh`).
3.  Inizia ogni script con lo shebang `#!/bin/bash`.
4.  Scrivi i comandi Bash e le redirezioni necessarie per risolvere l'esercizio.
5.  Rendi lo script eseguibile con `chmod +x nome_tuo_script.sh`.
6.  Esegui lo script con `./nome_tuo_script.sh`.
7.  Verifica che i file vengano creati/modificati come previsto e che l'output (se presente) sia corretto.

## Suggerimenti:

*   **File Descriptors:** Ricorda i numeri: 0 (stdin), 1 (stdout), 2 (stderr).
*   **Differenza tra `>` e `>>`:** `>` sovrascrive, `>>` appende.
*   **Combinare stdout e stderr:** `&>` o `comando > file 2>&1`.
*   **`tee -a`:** Per appendere con `tee` invece di sovrascrivere.
*   **Testa con comandi semplici:** Prima di costruire pipeline complesse, testa ogni parte.
    *   Usa `echo`, `ls`, `cat`, `grep`, `sort`, `wc`, `head`, `tail` per generare e processare dati.
*   **Consulta la guida:** Rivedi `../guide/01_guida_input_output_redirezione.md` e gli script di esempio (nella cartella `../esempi/`) per rinfrescare i concetti.

Buon lavoro con la manipolazione dell'I/O in Bash!
