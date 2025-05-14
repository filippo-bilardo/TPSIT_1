# Esercizio: Navigazione Avanzata nel Filesystem e Alias

**Obiettivo:** Padroneggiare tecniche di navigazione più efficienti, comprendere meglio la struttura del filesystem di Linux e imparare a creare alias per comandi usati frequentemente.

## Parte 1: Esplorazione di Directory di Sistema Importanti

1.  **Apri il terminale.**
2.  **Directory `/bin` e `/sbin`:**
    *   Spostati in `/bin`: `cd /bin`.
    *   Usa `ls` per elencare alcuni dei comandi essenziali disponibili per tutti gli utenti (es. `ls`, `cp`, `mv`, `cat`).
    *   Spostati in `/sbin`: `cd /sbin`.
    *   Usa `ls` per elencare alcuni comandi di amministrazione di sistema (es. `ifconfig`, `fdisk`, `reboot` - attenzione a non eseguirli!).
    *   Qual è la differenza principale tra i comandi in `/bin` e `/sbin`?
3.  **Directory `/etc`:**
    *   Spostati in `/etc`: `cd /etc`.
    *   Questa directory contiene i file di configurazione del sistema.
    *   Elenca il contenuto: `ls`.
    *   Prova a visualizzare (senza modificare!) il contenuto di un file di configurazione, ad esempio `cat /etc/passwd` (mostra informazioni sugli utenti) o `cat /etc/fstab` (configurazione dei filesystem montati). Usa `less` se l'output è lungo: `less /etc/passwd`.
4.  **Directory `/var`:**
    *   Spostati in `/var`: `cd /var`.
    *   Questa directory contiene file variabili, come log, code di stampa, file temporanei delle email.
    *   Esplora la sottodirectory `/var/log`: `cd /var/log` e poi `ls`.
    *   Prova a visualizzare un file di log (es. `sudo less syslog` o `sudo less messages` - potrebbe richiedere `sudo` per l'accesso). **Attenzione:** usa `sudo` con cautela.
5.  **Directory `/tmp`:**
    *   Spostati in `/tmp`: `cd /tmp`.
    *   Questa directory è usata per file temporanei. Il suo contenuto viene spesso cancellato al riavvio del sistema.
    *   Crea un file temporaneo: `touch mio_file_temp.txt` e verificalo con `ls`.
6.  **Directory Utente (`/home/nomeutente` o `~`):**
    *   Torna alla tua directory home: `cd ~`.
    *   Questa è la tua area personale dove puoi creare file e directory.

## Parte 2: Comandi `pushd`, `popd`, `dirs` per la Navigazione

Questi comandi permettono di gestire una "pila" (stack) di directory, utile per passare rapidamente tra diverse posizioni.

1.  **Prepara le directory:**
    *   Assicurati di essere nella tua home: `cd ~`
    *   Crea alcune directory di prova se non esistono: `mkdir -p ~/progetti/web ~/progetti/script ~/documenti_importanti`
2.  **Usare `pushd`:**
    *   Spostati in `~/progetti/web` e aggiungilo alla pila: `pushd ~/progetti/web`.
    *   Visualizza la pila: `dirs -v` (l'opzione `-v` mostra la pila numerata).
    *   Spostati in `~/documenti_importanti` e aggiungilo alla pila: `pushd ~/documenti_importanti`.
    *   Visualizza di nuovo la pila: `dirs -v`.
    *   Spostati in `~/progetti/script` e aggiungilo: `pushd ~/progetti/script`.
    *   Visualizza la pila: `dirs -v`.
3.  **Usare `popd`:**
    *   Rimuovi la directory in cima alla pila e spostati lì: `popd`.
    *   Verifica la directory corrente con `pwd` e la pila con `dirs -v`.
    *   Esegui `popd` altre due volte, osservando come cambi la directory corrente e la pila.
4.  **Navigare nella pila con `pushd +n`:**
    *   Ricostruisci la pila (o parte di essa) usando `pushd`.
    *   Visualizza la pila con `dirs -v`.
    *   Se la pila è `0 ~/progetti/script`, `1 ~/documenti_importanti`, `2 ~/progetti/web`, puoi passare a `~/documenti_importanti` (indice 1) con `pushd +1`.
    *   Questo comando ruota la pila e ti sposta nella directory specificata.

## Parte 3: Creare Alias Semplici

Un alias è una scorciatoia per un comando o una serie di comandi.

1.  **Definire un alias temporaneo:**
    *   Digita: `alias ll='ls -alhF'`
    *   Ora, quando digiti `ll` e premi Invio, verrà eseguito `ls -alhF`.
    *   Prova `ll` in diverse directory.
    *   Questo alias è temporaneo e scomparirà alla chiusura della sessione della shell.
2.  **Visualizzare gli alias definiti:**
    *   Digita `alias` senza argomenti per vedere tutti gli alias correnti.
3.  **Rimuovere un alias:**
    *   Digita `unalias ll` per rimuovere l'alias `ll`.
    *   Verifica che `ll` non funzioni più come prima.
4.  **Rendere un alias permanente (cenni):**
    *   Per rendere gli alias permanenti, devono essere aggiunti al file di configurazione della tua shell (es. `~/.bashrc` per Bash).
    *   Apri `~/.bashrc` con un editor di testo (es. `nano ~/.bashrc`).
    *   Aggiungi la riga `alias ll='ls -alhF'` alla fine del file.
    *   Salva il file e chiudi l'editor.
    *   Per applicare le modifiche senza fare logout/login, esegui: `source ~/.bashrc`.
    *   Ora l'alias `ll` dovrebbe essere permanente.

## Domande di Riflessione

*   Perché è importante conoscere la funzione delle principali directory di sistema come `/etc`, `/bin`, `/var`?
*   In quali scenari i comandi `pushd` e `popd` potrebbero essere particolarmente utili?
*   Pensa ad almeno due comandi lunghi o che usi spesso per i quali potresti creare un alias.
*   Quali sono i rischi nel modificare file in directory di sistema come `/etc` senza sapere cosa si sta facendo?

## Obiettivi di Apprendimento

Al termine di questo esercizio, dovresti essere in grado di:

*   Identificare e descrivere lo scopo di importanti directory del filesystem Linux.
*   Utilizzare `pushd`, `popd` e `dirs` per una navigazione efficiente tra più directory.
*   Creare, visualizzare e rimuovere alias temporanei per comandi.
*   Comprendere come rendere un alias permanente modificando `~/.bashrc`.