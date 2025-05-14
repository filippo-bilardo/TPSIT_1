# Esempi del Modulo 6: Introduzione allo Scripting Bash

Questa cartella contiene script di esempio che introducono i concetti fondamentali dello scripting Bash, inclusa la struttura di base, le variabili, l'input/output e i parametri posizionali.

## Script di Esempio:

1.  **`01_script_base.sh`**:
    *   **Scopo:** Mostra la struttura più elementare di uno script Bash, incluso lo shebang (`#!/bin/bash`) e l'uso del comando `echo` per stampare testo.
    *   **Come eseguirlo:** `bash 01_script_base.sh` o prima renderlo eseguibile con `chmod +x 01_script_base.sh` e poi `./01_script_base.sh`.

2.  **`02_script_variabili_input.sh`**:
    *   **Scopo:** Introduce la dichiarazione e l'uso delle variabili, e come leggere l'input dell'utente usando il comando `read`.
    *   **Come eseguirlo:** `bash 02_script_variabili_input.sh`. Lo script chiederà un input.

3.  **`03_parametri_posizionali.sh`**:
    *   **Scopo:** Dimostra come accedere ai parametri passati a uno script dalla riga di comando (`$1`, `$2`, ecc.), come visualizzare tutti i parametri (`$@`, `$*`) e il numero di parametri (`$#`).
    *   **Come eseguirlo:** `bash 03_parametri_posizionali.sh arg1 "secondo arg" arg3`.

4.  **`04_sostituzione_comando.sh`**:
    *   **Scopo:** Illustra l'uso della sostituzione di comando ( `$(comando)` o ``` `comando` ``` ) per catturare l'output di un comando e assegnarlo a una variabile o usarlo direttamente.
    *   **Come eseguirlo:** `bash 04_sostituzione_comando.sh`.

5.  **`05_saluto_interattivo.sh`**:
    *   **Scopo:** Un semplice script interattivo che chiede all'utente il proprio nome e poi stampa un messaggio di saluto personalizzato.
    *   **Come eseguirlo:** `bash 05_saluto_interattivo.sh`.

## Utilizzo

*   Analizzare il codice sorgente di ogni script per comprenderne la logica.
*   Eseguire gli script per osservarne il comportamento e l'output.
*   Provare a modificarli: cambiare i messaggi, aggiungere più variabili, sperimentare con diversi tipi di input o parametri.
