# Esempi del Modulo 8: Controllo del Flusso in Bash

Questa cartella conterrà script di esempio che illustrano le strutture di controllo del flusso in Bash.

## Contenuti Previsti:

Gli script di esempio dimostreranno:

*   **Costrutto `if`:**
    *   `if...then...fi`
    *   `if...then...else...fi`
    *   `if...then...elif...else...fi`
    *   Test con condizioni singole e multiple (operatori `-a`, `-o`, `&&`, `||`).
    *   Uso del comando `test` (o `[ ]`) e di `[[ ]]` per le espressioni condizionali.
    *   Esempi di test su stringhe, numeri e file.
*   **Costrutto `case`:**
    *   `case...in...esac`
    *   Pattern matching per diverse opzioni.
*   **Ciclo `for`:**
    *   Iterazione su liste di stringhe.
    *   Iterazione su sequenze numeriche (es. `for i in {1..5}`).
    *   Iterazione sull'output di un comando.
    *   Iterazione sugli argomenti passati allo script (`$@`).
    *   Stile C: `for (( i=0; i<5; i++ ))`.
*   **Ciclo `while`:**
    *   Esecuzione di comandi finché una condizione è vera.
    *   Creazione di loop interattivi (es. menu).
    *   Lettura di file riga per riga.
*   **Ciclo `until`:**
    *   Esecuzione di comandi finché una condizione diventa vera.
*   **Comandi `break` e `continue`:**
    *   Interruzione anticipata di un ciclo (`break`).
    *   Salto all'iterazione successiva di un ciclo (`continue`).

## Come Utilizzare gli Esempi:

Una volta aggiunti, ogni script `.sh` in questa cartella:

1.  Può essere esaminato per comprendere la logica del controllo del flusso.
2.  Dovrebbe essere reso eseguibile con `chmod +x nome_script.sh`.
3.  Può essere eseguito con `./nome_script.sh` per osservarne il comportamento.

Consultare la guida teorica (`../guide/01_guida_controllo_flusso.md`) per una spiegazione dettagliata dei concetti.
