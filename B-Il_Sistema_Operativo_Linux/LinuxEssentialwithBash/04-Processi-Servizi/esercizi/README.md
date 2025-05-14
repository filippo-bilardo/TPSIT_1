# Esercizi del Modulo 4: Processi e Servizi

Questa cartella contiene esercizi pratici relativi alla gestione dei processi e dei servizi in Linux.

## Elenco degli Esercizi e Script:

1.  **`01_termina_processo.sh`**:
    *   **Scopo:** Questo script è probabilmente un esercizio che richiede di identificare un processo specifico (magari avviato dallo script stesso o manualmente) e terminarlo utilizzando comandi come `pgrep`, `pkill`, o `kill`.
    *   **Possibile Contenuto dello Script (se è un esercizio guidato):
        ```bash
        #!/bin/bash
        # 01_termina_processo.sh (Esercizio)

        echo "Avvio un processo 'sleep 300' in background..."
        sleep 300 &
        SLEEP_PID=$!
        echo "Processo 'sleep 300' avviato con PID: $SLEEP_PID."

        echo ""
        echo "ESERCIZIO:"
        echo "1. Identifica il PID del processo 'sleep 300' usando 'ps', 'pgrep' o 'jobs'."
        echo "2. Termina il processo usando il comando 'kill <PID_TROVATO>'."
        echo "3. Verifica che il processo sia stato terminato."
        echo ""
        echo "(Questo script non terminerà il processo per te. Devi farlo manualmente in un altro terminale o dopo che lo script è terminato)."
        # Potresti aggiungere qui comandi per permettere all'utente di inserire il PID e tentare di killarlo, per renderlo più interattivo.
        ```
    *   **Come Svolgerlo:** 
        1.  Eseguire lo script: `bash 01_termina_processo.sh`.
        2.  Aprire un altro terminale (o usare lo stesso dopo che lo script ha stampato le istruzioni).
        3.  Usare `ps aux | grep sleep`, `pgrep sleep`, o `jobs` per trovare il PID del processo `sleep 300`.
        4.  Usare `kill <PID>` per terminare il processo.
        5.  Verificare con `ps` o `pgrep` che il processo non sia più in esecuzione.

## Suggerimenti per Esercizi Aggiuntivi (da creare come file `.md`):

*   **Esercizio su `top` e `htop`:**
    *   "Apri `top` (o `htop`). Identifica:
        *   Il processo con il PID più alto.
        *   I 3 processi che consumano più CPU.
        *   I 3 processi che consumano più memoria.
        *   Come ordinare i processi per CPU, memoria, PID.
        *   Come inviare un segnale (es. SIGTERM) a un processo da dentro `top`/`htop`."
*   **Esercizio su Processi Foreground/Background:**
    *   "Avvia lo script `05_loop_script.sh` dalla cartella `esempi` in foreground. Come lo interrompi?"
    *   "Avvia lo script `05_loop_script.sh` in background. Come lo porti in foreground? Come lo rimandi in background? Come lo termini mentre è in background?"
    *   "Cosa fa il comando `nohup`? Prova ad avviare `nohup ./05_loop_script.sh &` e poi chiudi il terminale. Il processo continua a girare? (Verifica con `ps aux | grep 05_loop_script`)."
*   **Esercizio sui Segnali:**
    *   "Scrivi un semplice script Bash che entra in un loop e stampa un messaggio ogni secondo. Modifica lo script in modo che intercetti il segnale `SIGINT` (Ctrl+C) e, invece di terminare immediatamente, stampi un messaggio 'SIGINT ricevuto, termino...' e poi esca."
    *   "Qual è la differenza tra `SIGTERM` e `SIGKILL`? Quando useresti l'uno o l'altro?"
*   **Esercizio su `systemctl` (per sistemi con systemd):**
    *   "Scegli un servizio installato sul tuo sistema (es. `cups` per la stampa, `sshd` se hai un server SSH, o `NetworkManager`).
        1.  Controlla il suo stato (`status`).
        2.  Verifica se è abilitato all'avvio (`is-enabled`).
        3.  Se è in esecuzione, fermalo (`sudo systemctl stop nome_servizio`). Verifica che si sia fermato.
        4.  Avvialo di nuovo (`sudo systemctl start nome_servizio`). Verifica che sia partito.
        5.  Riavvia il servizio (`sudo systemctl restart nome_servizio`)."
*   **Esercizio su `journalctl` (per sistemi con systemd):**
    *   "Visualizza gli ultimi 20 messaggi di log del sistema."
    *   "Visualizza tutti i messaggi di log relativi a un servizio specifico (es. `sshd`) dall'ultimo riavvio."
    *   "Visualizza i messaggi di log in tempo reale (`-f`)."

## Ambiente di Lavoro

*   Fai attenzione quando termini processi, specialmente se non sei sicuro di cosa facciano. Evita di terminare processi di sistema critici.
*   I comandi per la gestione dei servizi (`systemctl`, `service`) spesso richiedono privilegi di `sudo`.

Buona sperimentazione!
