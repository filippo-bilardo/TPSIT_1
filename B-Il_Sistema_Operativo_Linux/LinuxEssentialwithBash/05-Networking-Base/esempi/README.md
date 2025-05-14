# Esempi del Modulo 5: Networking di Base

Questa cartella contiene script di esempio che illustrano l'uso dei comandi di base per il networking in Linux.

## Script di Esempio:

1.  **`01_comandi_diagnosi_rete.sh`**:
    *   **Scopo:** Mostra una panoramica di comandi utili come `ip addr`, `ping`, `traceroute`, `ss -tulnp`, `host` per una diagnosi di rete iniziale.
    *   **Come eseguirlo:** Aprire un terminale, navigare nella cartella `esempi/` del modulo 5 e digitare `bash 01_comandi_diagnosi_rete.sh`. Alcuni comandi interni potrebbero richiedere `sudo` per output completi (es. `ss -p`).

2.  **`02_mostra_ip.sh`**:
    *   **Scopo:** Dimostra come visualizzare gli indirizzi IP delle interfacce di rete attive utilizzando `ip addr show` e filtrando l'output.
    *   **Come eseguirlo:** `bash 02_mostra_ip.sh`.

3.  **`03_test_connettivita.sh`**:
    *   **Scopo:** Illustra come usare `ping` per testare la connettività verso un host specifico, controllando il numero di pacchetti da inviare e l'esito.
    *   **Come eseguirlo:** `bash 03_test_connettivita.sh google.com` (o sostituire `google.com` con un altro host).

4.  **`04_traccia_percorso.sh`**:
    *   **Scopo:** Mostra come usare `traceroute` (o `tracepath`) per visualizzare il percorso di rete verso un host di destinazione.
    *   **Come eseguirlo:** `bash 04_traccia_percorso.sh google.com` (o sostituire `google.com` con un altro host). Potrebbe richiedere `sudo` per `traceroute` su alcuni sistemi.

5.  **`05_risolvi_dns.sh`**:
    *   **Scopo:** Dimostra l'utilizzo dei comandi `host` e `dig` per effettuare query DNS e risolvere nomi di dominio in indirizzi IP (e viceversa).
    *   **Come eseguirlo:** `bash 05_risolvi_dns.sh wikipedia.org`.

6.  **`06_scarica_file_curl.sh`**:
    *   **Scopo:** Illustra come scaricare il contenuto di un URL usando `curl` e come salvare l'output in un file o visualizzarlo.
    *   **Come eseguirlo:** `bash 06_scarica_file_curl.sh https://example.com`.

## Utilizzo

*   Analizzare il codice sorgente di ogni script.
*   Eseguire gli script per osservarne il comportamento e l'output.
*   Modificare gli script per sperimentare con diverse opzioni dei comandi e differenti host o URL.
*   Alcuni comandi (es. `traceroute`, `ss -p`) potrebbero fornire output più dettagliati o richiedere privilegi `sudo` per funzionare correttamente.
