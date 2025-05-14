# Modulo 7: Variabili e Tipi di Dati in Bash

Benvenuti al settimo modulo del corso "Linux Essential with Bash"! Questo modulo approfondisce come Bash gestisce i dati attraverso le variabili, esplorando il loro scope, i tipi (seppur flessibili), le operazioni comuni e costrutti potenti come gli array.

## Argomenti Trattati

Questo modulo copre in dettaglio i seguenti argomenti:

-   **Dichiarazione e Assegnazione**: Come creare variabili e assegnare loro valori, con attenzione alle virgolette.
-   **Scope delle Variabili**: Differenza tra variabili locali (all'interno di funzioni con `local`) e globali/d'ambiente (con `export` per i sottoprocessi).
-   **Tipi di Dati**: La natura intrinsecamente testuale delle variabili Bash e come vengono interpretate numericamente.
-   **Parametri Posizionali**: Accesso agli argomenti passati a uno script (`$0`, `$1`, `$2`, ..., `${10}`).
-   **Variabili Speciali di Bash**: Significato e utilizzo di variabili come `$?` (exit status), `$#` (numero argomenti), `$*` e `$@` (tutti gli argomenti), `$$` (PID), `$!` (PID ultimo background), `$_` (ultimo argomento comando precedente).
-   **Espansione delle Variabili (`${variabile}`):** Tecniche avanzate come valori di default (`:-`, `:=`), messaggi di errore (`:?`), lunghezza (`${#var}`), rimozione di pattern (prefissi/suffissi con `#`, `##`, `%`, `%%`), e sostituzione di pattern (`/`, `//`).
-   **Sostituzione di Comandi**: Catturare l'output di comandi con `$(comando)` (preferito) o `` `comando` ``.
-   **Operazioni Aritmetiche**: Eseguire calcoli interi con `$((espressione))` (preferito), `let` ed `expr`.
-   **Stringhe**: Concatenazione, calcolo della lunghezza (`${#stringa}`), estrazione di sottostringhe (`${stringa:offset:lunghezza}`).
-   **Array**: Introduzione agli array indicizzati (accesso con `[indice]`, tutti gli elementi con `[@]`, lunghezza con `${#array[@]}`) e array associativi (dichiarazione con `declare -A`, accesso con `[chiave_stringa]`, chiavi con `${!array[@]}`).

## Guide Dettagliate

Per una comprensione completa, fai riferimento alla guida aggiornata nella cartella `guide/`:

-   [Guida Approfondita: Variabili e Tipi di Dati in Bash](./guide/01_guida_variabili_dati.md): Una trattazione estesa di tutti gli argomenti sopra elencati, con esempi chiari.

## Esempi Pratici

La cartella `esempi/` contiene script che dimostrano l'applicazione pratica dei concetti del modulo:

-   [`01_script_variabili_speciali_e_parametri.sh`](./esempi/01_script_variabili_speciali_e_parametri.sh): Illustra l'uso dei parametri posizionali e delle principali variabili speciali di Bash.
-   [`02_script_espansione_sostituzione_aritmetica.sh`](./esempi/02_script_espansione_sostituzione_aritmetica.sh): Mostra esempi di espansione avanzata delle variabili, sostituzione di comandi e diverse forme di operazioni aritmetiche.
-   [`03_script_array.sh`](./esempi/03_script_array.sh): Dimostra la dichiarazione, manipolazione e iterazione di array sia indicizzati che associativi.

Analizza ed esegui questi script per vedere i concetti in azione.

## Esercizi per Consolidare

Verifica la tua comprensione e metti alla prova le tue abilità con gli esercizi forniti. Trovi il file degli esercizi nella cartella `esercizi/`:

-   [`01_esercizi_variabili_dati_avanzati.md`](./esercizi/01_esercizi_variabili_dati_avanzati.md): Una serie di problemi pratici che coprono parametri posizionali, manipolazione di stringhe, calcoli, array indicizzati e associativi.

Completare questi esercizi è fondamentale per padroneggiare la gestione dei dati negli script Bash.