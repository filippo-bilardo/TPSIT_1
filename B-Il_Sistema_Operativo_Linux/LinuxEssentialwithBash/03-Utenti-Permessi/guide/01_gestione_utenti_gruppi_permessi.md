# Guida Teorica: Gestione di Utenti e Permessi

Questa guida spiega i concetti fondamentali relativi agli utenti, ai gruppi e ai permessi in Linux.

## Utenti e Gruppi

In Linux, ogni entità che può eseguire processi o possedere file è un **utente**. Ogni utente è identificato univocamente da un **User ID (UID)**, un numero intero. Gli utenti sono anche organizzati in **gruppi**, ognuno identificato da un **Group ID (GID)**. Un utente può appartenere a un gruppo primario e a più gruppi secondari.

### File Chiave

*   **/etc/passwd**: Contiene le informazioni sugli account utente. Ogni riga rappresenta un utente e i campi sono separati da due punti (`:`). I campi tipici includono:
    1.  Nome utente (login name)
    2.  Password (solitamente una 'x' che indica che la password cifrata è in `/etc/shadow`)
    3.  User ID (UID)
    4.  Group ID (GID) del gruppo primario
    5.  GECOS (informazioni aggiuntive come nome completo, numero di telefono, ecc.)
    6.  Directory home dell'utente
    7.  Shell di login predefinita
    *Esempio di riga (semplificato): `nomeutente:x:1000:1000:Nome Cognome:/home/nomeutente:/bin/bash`*

*   **/etc/shadow**: Contiene le password cifrate degli utenti e informazioni sulla scadenza delle password. Accessibile solo dall'utente root per motivi di sicurezza.

*   **/etc/group**: Contiene le informazioni sui gruppi. Ogni riga rappresenta un gruppo e i campi sono separati da due punti (`:`):
    1.  Nome del gruppo
    2.  Password del gruppo (raramente usata, solitamente 'x')
    3.  Group ID (GID)
    4.  Elenco degli utenti membri del gruppo (separati da virgola)
    *Esempio di riga: `nomedigruppo:x:1001:utente1,utente2`*

## Comandi Principali per la Gestione di Utenti e Gruppi

*   **`whoami`**: Mostra il nome dell'utente attualmente loggato.
    ```bash
    $ whoami
    nomeutente
    ```
*   **`id`**: Visualizza l'UID, il GID primario e tutti i gruppi (primario e secondari) a cui l'utente corrente appartiene.
    ```bash
    $ id
    uid=1000(nomeutente) gid=1000(nomeutente) groups=1000(nomeutente),27(sudo),100(users)
    ```
    Puoi anche usarlo per un utente specifico (se hai i permessi):
    ```bash
    $ id altroutente
    ```
*   **`groups`**: Elenca i nomi dei gruppi a cui l'utente corrente (o un utente specificato) appartiene.
    ```bash
    $ groups
    nomeutente sudo users
    $ groups altroutente
    ```
*   **`useradd`** (o `adduser`): Crea un nuovo account utente. Richiede privilegi di root.
    ```bash
    $ sudo useradd nuovoutente
    $ sudo adduser nuovoutente # Spesso più interattivo e user-friendly
    ```
*   **`usermod`**: Modifica le proprietà di un account utente esistente (es. cambiare la shell, aggiungere a gruppi, etc.). Richiede privilegi di root.
    ```bash
    $ sudo usermod -aG sudo nuovoutente # Aggiunge nuovoutente al gruppo sudo
    ```
*   **`userdel`**: Elimina un account utente. Richiede privilegi di root.
    ```bash
    $ sudo userdel nuovoutente
    $ sudo userdel -r nuovoutente # Rimuove anche la home directory dell'utente
    ```
*   **`groupadd`**: Crea un nuovo gruppo. Richiede privilegi di root.
    ```bash
    $ sudo groupadd nuovogruppo
    ```
*   **`groupmod`**: Modifica le proprietà di un gruppo esistente. Richiede privilegi di root.
    ```bash
    $ sudo groupmod -n nomecorretto nuovogruppo # Rinomina il gruppo
    ```
*   **`groupdel`**: Elimina un gruppo. Richiede privilegi di root.
    ```bash
    $ sudo groupdel nuovogruppo
    ```
*   **`passwd`**: Permette di cambiare la password. Un utente normale può cambiare solo la propria password. Root può cambiare la password di qualsiasi utente.
    ```bash
    $ passwd # Cambia la password dell'utente corrente
    $ sudo passwd nomeutente # Root cambia la password di nomeutente
    ```

## Comandi per la Gestione dei Permessi

*   **`chmod`**: Modifica i permessi di accesso a file e directory.
*   **`chown`**: Cambia il proprietario (utente) di file e directory. Richiede privilegi di root (a meno che tu non sia il proprietario e stia cedendo la proprietà, ma questo è raro e dipende dalla configurazione del sistema).
*   **`chgrp`**: Cambia il gruppo proprietario di file e directory. Richiede privilegi di root o essere il proprietario del file e membro del gruppo di destinazione.

## Permessi dei File e delle Directory

I permessi in Linux controllano chi può leggere, scrivere o eseguire un file, e chi può accedere, elencare o creare file all'interno di una directory.

### Visualizzare i Permessi

Il comando `ls -l` mostra i permessi in dettaglio:

```bash
$ ls -l miofile.txt
-rw-r--r-- 1 utente gruppo 1024 Jan 15 10:30 miofile.txt

$ ls -ld miadirectory
drwxr-xr-x 2 utente gruppo 4096 Jan 15 10:32 miadirectory
```

La prima colonna (es. `-rw-r--r--` o `drwxr-xr-x`) rappresenta il tipo di file e i permessi.

*   **Primo carattere**: Tipo di file
    *   `-`: File regolare
    *   `d`: Directory
    *   `l`: Link simbolico
    *   Altri (es. `c` per character device, `b` per block device)

*   **Successivi 9 caratteri**: Permessi, divisi in tre terzetti:
    1.  **Proprietario (User - u)**: Primi 3 caratteri (es. `rw-`)
    2.  **Gruppo (Group - g)**: Successivi 3 caratteri (es. `r--`)
    3.  **Altri (Others - o)**: Ultimi 3 caratteri (es. `r--`)

### Tipi di Permesso

Ogni terzetto può contenere i seguenti permessi:

*   **`r` (Read - Lettura)**:
    *   Per i file: Permette di visualizzare il contenuto del file.
    *   Per le directory: Permette di elencare il contenuto della directory (es. con `ls`).
*   **`w` (Write - Scrittura)**:
    *   Per i file: Permette di modificare o eliminare il contenuto del file.
    *   Per le directory: Permette di creare, eliminare o rinominare file all'interno della directory (richiede anche il permesso di esecuzione `x`).
*   **`x` (Execute - Esecuzione)**:
    *   Per i file: Permette di eseguire il file (se è uno script o un programma compilato).
    *   Per le directory: Permette di accedere alla directory (es. con `cd`) e ai suoi metadati.
*   **`-`**: Indica l'assenza del permesso.

### Modificare i Permessi con `chmod`

Il comando `chmod` (change mode) modifica i permessi. Può essere usato in due modi:

1.  **Notazione Simbolica (Consigliata per chiarezza)**:
    *   Soggetti: `u` (utente/proprietario), `g` (gruppo), `o` (altri), `a` (tutti - user, group, others).
    *   Operatori: `+` (aggiunge permesso), `-` (rimuove permesso), `=` (imposta esattamente i permessi).
    *   Permessi: `r`, `w`, `x`.

    *Esempi:*
    ```bash
    chmod u+x miofile.sh         # Aggiunge permesso di esecuzione per il proprietario
    chmod g-w documento.txt      # Rimuove permesso di scrittura per il gruppo
    chmod o=r report.doc         # Imposta solo permesso di lettura per gli altri
    chmod ug+rw,o-rw dati.csv    # Aggiunge r/w per utente e gruppo, rimuove r/w per altri
    chmod a+r pubblico.txt       # Tutti possono leggere
    chmod -R g+w progetti/       # Aggiunge ricorsivamente (-R) il permesso di scrittura al gruppo per la directory 'progetti' e il suo contenuto
    ```

2.  **Notazione Numerica (Ottale)**:
    Ogni permesso ha un valore numerico:
    *   `r` = 4
    *   `w` = 2
    *   `x` = 1

    I permessi per ogni soggetto (utente, gruppo, altri) sono la somma dei valori dei permessi concessi. Ad esempio:
    *   `rwx` = 4 + 2 + 1 = 7
    *   `rw-` = 4 + 2 + 0 = 6
    *   `r-x` = 4 + 0 + 1 = 5
    *   `r--` = 4 + 0 + 0 = 4

    Si specifica un numero di tre cifre: la prima per il proprietario, la seconda per il gruppo, la terza per gli altri.

    *Esempi:*
    ```bash
    chmod 755 script.sh        # rwxr-xr-x (proprietario: rwx, gruppo: r-x, altri: r-x)
    chmod 644 filetesto.txt    # rw-r--r-- (proprietario: rw-, gruppo: r--, altri: r--)
    chmod 600 chiavesegreta.key # rw------- (proprietario: rw-, gruppo: ---, altri: ---)
    chmod 777 cartellacondivisa/ # rwxrwxrwx (tutti i permessi per tutti - usare con cautela!)
    ```

### Modificare Proprietario e Gruppo

*   **`chown` (change owner)**: Cambia il proprietario (utente) e opzionalmente il gruppo di un file o directory.
    ```bash
    sudo chown nuovoutente miofile.txt             # Cambia proprietario a 'nuovoutente'
    sudo chown nuovoutente:nuovogruppo miofile.txt # Cambia proprietario e gruppo
    sudo chown :nuovogruppo miofile.txt           # Cambia solo il gruppo (come chgrp)
    sudo chown -R utente:gruppo miadirectory/     # Cambia ricorsivamente proprietario e gruppo
    ```
    Generalmente, solo root può cambiare il proprietario di un file.

*   **`chgrp` (change group)**: Cambia il gruppo proprietario di un file o directory.
    ```bash
    sudo chgrp nuovogruppo miofile.txt
    sudo chgrp -R nuovogruppo miadirectory/
    ```
    L'utente deve essere il proprietario del file e membro del gruppo di destinazione, oppure essere root.

## `umask`

Il comando `umask` (user file-creation mode mask) definisce i permessi predefiniti per i nuovi file e directory creati. La maschera specifica quali permessi *non* devono essere concessi. È un valore ottale che viene sottratto dai permessi massimi (666 per i file, 777 per le directory).

*Esempio:*
Un `umask` comune è `022`.
*   Per i file: `666 - 022 = 644` (rw-r--r--)
*   Per le directory: `777 - 022 = 755` (rwxr-xr-x)

Puoi visualizzare l'umask corrente con `umask` e impostarlo con `umask VALORE` (es. `umask 027`).

## Permessi Speciali

Esistono permessi speciali che modificano il comportamento standard:

*   **SUID (Set User ID)**: Se impostato su un file eseguibile, il processo viene eseguito con i privilegi del proprietario del file, non dell'utente che lo esegue. Pericoloso se applicato a script o programmi non sicuri. `ls -l` lo mostra come `s` al posto della `x` del proprietario (es. `-rwsr-xr-x`). Ottale: `4000`.
    *Esempio: `chmod u+s /usr/bin/programma` o `chmod 4755 /usr/bin/programma`*

*   **SGID (Set Group ID)**:
    *   Se impostato su un file eseguibile: il processo viene eseguito con i privilegi del gruppo proprietario del file. `ls -l` lo mostra come `s` al posto della `x` del gruppo (es. `-rwxr-sr-x`). Ottale: `2000`.
    *   Se impostato su una directory: i nuovi file e sottodirectory creati all'interno ereditano il gruppo della directory padre, invece del gruppo primario dell'utente creatore. Molto utile per directory condivise. `ls -l` lo mostra come `s` al posto della `x` del gruppo (es. `drwxrwsr-x`).
    *Esempio: `chmod g+s /srv/shared_folder` o `chmod 2775 /srv/shared_folder`*

*   **Sticky Bit**: Se impostato su una directory, permette solo al proprietario del file, al proprietario della directory o a root di eliminare o rinominare i file al suo interno, anche se altri utenti hanno i permessi di scrittura sulla directory. Utile per directory come `/tmp`. `ls -l` lo mostra come `t` al posto della `x` degli altri (es. `drwxrwxrwt`). Ottale: `1000`.
    *Esempio: `chmod +t /tmp` o `chmod 1777 /tmp`*

## `sudo` e Privilegi di Root

L'utente **root** (UID 0) è l'superutente in Linux, con accesso illimitato al sistema. Operare costantemente come root è rischioso.

Il comando **`sudo` (superuser do)** permette agli utenti autorizzati (configurati nel file `/etc/sudoers`, gestito con `visudo`) di eseguire comandi specifici come root o come un altro utente.

*Esempio:*
```bash
$ sudo apt update  # Esegue 'apt update' con i privilegi di root
```
L'uso di `sudo` è preferibile al login diretto come root per la maggior parte delle attività amministrative, poiché fornisce un audit trail (registrazione di chi ha eseguito cosa) e permette un controllo più granulare dei privilegi.

Questi concetti sono fondamentali per la sicurezza, l'integrità dei dati e la gestione multiutente di un sistema Linux.