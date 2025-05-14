# Esempi del Modulo 10: Input, Output e Redirezione in Bash

Questa cartella conterrà script di esempio che illustrano la gestione dell'input/output standard e le tecniche di redirezione in Bash.

## Contenuti Previsti:

Gli script di esempio dimostreranno:

*   **File Descriptor Standard:**
    *   Standard Input (stdin, file descriptor 0)
    *   Standard Output (stdout, file descriptor 1)
    *   Standard Error (stderr, file descriptor 2)
*   **Redirezione dell'Output:**
    *   `>`: Redirige stdout a un file (sovrascrive).
    *   `>>`: Redirige stdout a un file (appende).
    *   `2>`: Redirige stderr a un file (sovrascrive).
    *   `2>>`: Redirige stderr a un file (appende).
    *   `&>` o `>&`: Redirige sia stdout che stderr a un file (sovrascrive).
    *   `&>>`: Redirige sia stdout che stderr a un file (appende).
    *   Redirigere a `/dev/null` per scartare l'output.
*   **Redirezione dell'Input:**
    *   `<`: Redirige il contenuto di un file a stdin di un comando.
*   **Here Documents:**
    *   `<<DELIMITER ... DELIMITER`: Fornisce input multi-riga a un comando.
    *   `<<-DELIMITER`: Simile a Here Document, ma i tab iniziali vengono rimossi.
*   **Here Strings:**
    *   `<<< "stringa"`: Fornisce una singola stringa come input a un comando.
*   **Pipe (`|`):**
    *   Collega stdout di un comando a stdin di un altro comando.
    *   Creazione di pipeline di comandi.
*   **Comando `tee`:**
    *   Legge da stdin e scrive su stdout e contemporaneamente su uno o più file.
    *   Utile per visualizzare l'output e salvarlo allo stesso tempo.
*   **Comando `exec` per Redirezione Persistente:**
    *   `exec > file_log.txt`: Redirige permanentemente stdout dello script (o della shell corrente) a `file_log.txt`.
    *   `exec 2> file_errori.txt`: Redirige permanentemente stderr.
    *   `exec < file_input.txt`: Redirige permanentemente stdin.
*   **Process Substitution:**
    *   `>(comando)` e `<(comando)`: Tratta l'output o l'input di un comando come se fosse un file.
    *   Utile per inviare l'output di un comando come argomento file a un altro, o per confrontare output di comandi.

## Come Utilizzare gli Esempi:

Una volta aggiunti, ogni script `.sh` in questa cartella:

1.  Può essere esaminato per comprendere le diverse tecniche di I/O e redirezione.
2.  Dovrebbe essere reso eseguibile con `chmod +x nome_script.sh`.
3.  Può essere eseguito con `./nome_script.sh` per osservarne il comportamento e gli effetti sui file (se creati).

Consultare la guida teorica (`../guide/01_guida_input_output_redirezione.md`) per una spiegazione dettagliata dei concetti.
