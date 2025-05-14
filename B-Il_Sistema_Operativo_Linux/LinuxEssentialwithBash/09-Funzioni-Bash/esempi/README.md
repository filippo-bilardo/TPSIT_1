# Esempi del Modulo 9: Funzioni in Bash

Questa cartella conterrà script di esempio che illustrano la definizione e l'uso delle funzioni in Bash.

## Contenuti Previsti:

Gli script di esempio dimostreranno:

*   **Definizione di Funzioni:**
    *   Sintassi: `nome_funzione() { comandi; }`
    *   Sintassi alternativa: `function nome_funzione { comandi; }`
*   **Chiamata di Funzioni:**
    *   Come invocare una funzione definita nello script.
*   **Passaggio di Argomenti alle Funzioni:**
    *   Utilizzo di `$1`, `$2`, ..., `$@`, `$#` all'interno delle funzioni per accedere agli argomenti passati.
*   **Valori di Ritorno (Status Code):**
    *   Uso del comando `return` per restituire uno status code (un intero tra 0 e 255).
    *   Verifica dello status code di una funzione tramite `$?`.
*   **Ottenere Output da Funzioni (Cattura dell'Output):**
    *   Uso della sostituzione di comando (es. `risultato=$(nome_funzione)`) per catturare l'output standard della funzione.
*   **Scope delle Variabili:**
    *   Variabili globali (default).
    *   Variabili locali (definite con `local` all'interno di una funzione) e la loro importanza per evitare conflitti.
*   **Funzioni Ricorsive (Esempio Semplice):**
    *   Un esempio base di una funzione che chiama se stessa.
*   **Organizzazione del Codice:**
    *   Come le funzioni aiutano a modularizzare e rendere più leggibile uno script.
*   **Librerie di Funzioni (Sourcing):**
    *   Come definire funzioni in un file separato e includerle in altri script usando il comando `source` (o `.`).

## Come Utilizzare gli Esempi:

Una volta aggiunti, ogni script `.sh` in questa cartella:

1.  Può essere esaminato per comprendere come definire e utilizzare le funzioni.
2.  Dovrebbe essere reso eseguibile con `chmod +x nome_script.sh`.
3.  Può essere eseguito con `./nome_script.sh` per osservarne il comportamento.

Consultare la guida teorica (`../guide/01_guida_funzioni_bash.md`) per una spiegazione dettagliata dei concetti.
