# Esempi del Modulo 3: Gestione di Utenti e Permessi

Questa cartella contiene script di esempio relativi alla gestione degli utenti, dei gruppi e dei permessi dei file in Linux.

## Script di Esempio:

1.  **`01_visualizza_utenti.sh`**:
    *   **Scopo:** Dimostra come utilizzare comandi come `whoami`, `id`, `who`, `w`, e come ispezionare il file `/etc/passwd` (in modo sicuro, ad esempio con `getent passwd`) per visualizzare informazioni sugli utenti correnti e quelli definiti nel sistema.
    *   **Come eseguirlo:** Aprire un terminale, navigare nella cartella `esempi/` del modulo 3 e digitare `bash 01_visualizza_utenti.sh`.

## Suggerimenti per Ulteriori Esempi:

Questa sezione potrebbe essere arricchita con script che dimostrano:

*   **Modifica dei permessi:**
    *   `cambia_permessi_file.sh`: Script che accetta un nome di file e una stringa di permessi (es. `755` o `u+x,g-w,o=r`) e applica `chmod`.
    *   `resetta_permessi_directory.sh`: Script che imposta permessi specifici (es. `770` per directory, `660` per file) ricorsivamente per una directory data, magari escludendo certi tipi di file.
*   **Modifica della proprietà:**
    *   `cambia_proprietario_gruppo.sh`: Script che accetta un nome di file/directory, un nuovo utente e un nuovo gruppo e applica `chown` e `chgrp`.
*   **Verifica dei permessi (simulazione):**
    *   `test_accesso_file.sh`: Uno script che crea un file con permessi specifici, poi tenta di accedervi (lettura/scrittura/esecuzione) come un utente diverso (usando `sudo -u <altro_utente> comando`) per dimostrare come funzionano i permessi.
*   **Gestione utenti e gruppi (con cautela e privilegi):**
    *   `crea_utente_limitato.sh`: (Richiede privilegi di root) Script che mostra i comandi per creare un utente, impostare la sua password, e magari aggiungerlo a un gruppo specifico. **Nota:** Questo tipo di script è più per dimostrazione dei comandi che per esecuzione diretta in ambienti non controllati.

## Utilizzo

*   Esaminare il codice degli script.
*   Eseguirli (alcuni potrebbero richiedere `sudo` o modifiche per funzionare correttamente a seconda dei privilegi dell'utente) in un ambiente di test per comprenderne l'effetto.
*   Sperimentare modificando gli script per esplorare diverse opzioni dei comandi relativi a utenti e permessi.
