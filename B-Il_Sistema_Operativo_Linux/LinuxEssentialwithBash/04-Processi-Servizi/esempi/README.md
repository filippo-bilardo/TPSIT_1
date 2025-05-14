# Esempi del Modulo 4: Processi e Servizi

Questa cartella contiene script di esempio che illustrano la gestione dei processi e dei servizi in Linux.

## Script di Esempio:

1.  **`01_lista_processi.sh`**:
    *   **Scopo:** Mostra come utilizzare comandi come `ps aux`, `ps -ef`, `top` (in modo non interattivo per uno snapshot), e `pgrep` per visualizzare i processi in esecuzione.
    *   **Come eseguirlo:** Aprire un terminale, navigare nella cartella `esempi/` del modulo 4 e digitare `bash 01_lista_processi.sh`.

2.  **`02_processo_background.sh`**:
    *   **Scopo:** Dimostra come avviare un processo in background utilizzando l'operatore `&` e come visualizzare i job in background con `jobs`.
    *   **Come eseguirlo:** `bash 02_processo_background.sh`. Lo script avvierà un comando `sleep` in background.

3.  **`03_trova_pid_pgrep.sh`**:
    *   **Scopo:** Illustra l'uso di `pgrep` per trovare il Process ID (PID) di un processo basandosi sul suo nome o altri criteri.
    *   **Come eseguirlo:** `bash 03_trova_pid_pgrep.sh`. Potrebbe essere necessario avviare prima un processo specifico (es. `sleep 100 &`) affinché `pgrep` lo trovi.

4.  **`04_invia_segnali.sh`**:
    *   **Scopo:** Mostra come inviare segnali ai processi utilizzando il comando `kill`. Introduce segnali comuni come `SIGTERM`, `SIGKILL`, `SIGHUP`.
    *   **Come eseguirlo:** `bash 04_invia_segnali.sh`. Lo script avvierà un processo fittizio e poi tenterà di terminarlo con diversi segnali (fare attenzione con `SIGKILL`).

5.  **`05_loop_script.sh`**:
    *   **Scopo:** Un semplice script che esegue un loop infinito, utile per sperimentare con la gestione dei processi (avvio in background, visualizzazione, invio di segnali, ecc.).
    *   **Come eseguirlo:** `bash 05_loop_script.sh`. Per terminarlo, sarà necessario identificarne il PID e usare `kill` da un altro terminale, o usare `Ctrl+C` se eseguito in foreground.

6.  **`06_systemctl_esempio.sh`**:
    *   **Scopo:** Fornisce esempi base per interagire con `systemd` per la gestione dei servizi, come controllare lo stato, avviare, fermare e riavviare un servizio. **Nota:** Questo script è pensato per sistemi che usano `systemd`.
    *   **Come eseguirlo:** Analizzare lo script. I comandi al suo interno (come `systemctl status sshd`) possono essere eseguiti direttamente nel terminale. Alcuni comandi potrebbero richiedere privilegi `sudo`.

## Utilizzo

*   Analizzare il codice sorgente di ogni script.
*   Eseguire gli script in un ambiente di test per osservarne il comportamento.
*   Modificare gli script per sperimentare con diverse opzioni dei comandi e scenari.
