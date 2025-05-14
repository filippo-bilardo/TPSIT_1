# Guida: Comandi di Base per la Gestione di File e Directory

Questo modulo esplora i comandi fondamentali per interagire con il file system in Linux. La capacità di creare, visualizzare, modificare, copiare, spostare ed eliminare file e directory è cruciale per qualsiasi utente Linux.

## 1. Visualizzare il Contenuto delle Directory: `ls`

Il comando `ls` (list) è usato per elencare il contenuto di una directory.

*   **Sintassi base:** `ls [OPZIONI] [PERCORSO]`
*   Se non viene specificato un `PERCORSO`, `ls` elenca il contenuto della directory corrente.

**Opzioni comuni di `ls`:**

*   `-l`: Formato lungo (long). Mostra dettagli come permessi, proprietario, gruppo, dimensione, data di modifica.
    ```bash
    ls -l
    ```
*   `-a`: Mostra tutti i file, inclusi quelli nascosti (che iniziano con un `.`).
    ```bash
    ls -a
    ```
*   `-h`: Formato leggibile (human-readable). Usato con `-l`, mostra le dimensioni in formati come K (kilobyte), M (megabyte), G (gigabyte).
    ```bash
    ls -lh
    ```
*   `-t`: Ordina per data di modifica (i più recenti prima).
    ```bash
    ls -lt
    ```
*   `-r`: Inverte l'ordine di visualizzazione (reverse).
    ```bash
    ls -ltr # Utile per vedere i file modificati meno di recente per ultimi
    ```
*   `-R`: Ricorsivo. Elenca il contenuto di tutte le sottodirectory.
    ```bash
    ls -R
    ```
*   `-d`: Mostra le informazioni sulla directory stessa invece del suo contenuto (utile con `-l` per vedere i dettagli di una directory specifica).
    ```bash
    ls -ld nome_directory
    ```

**Esempi pratici:**

```bash
ls -lah # Elenca tutti i file, in formato lungo e leggibile
ls -l /etc # Elenca il contenuto della directory /etc in formato lungo
```

## 2. Cambiare Directory: `cd`

Il comando `cd` (change directory) permette di spostarsi tra le directory.

*   **Sintassi base:** `cd [PERCORSO_DIRECTORY]`

**Utilizzi comuni di `cd`:**

*   `cd nome_directory`: Entra nella sottodirectory specificata.
*   `cd ..`: Risale alla directory genitore.
*   `cd ../..`: Risale di due livelli.
*   `cd ~` o `cd`: Torna alla directory home dell'utente corrente.
*   `cd /`: Va alla directory root del sistema.
*   `cd -`: Torna alla directory precedente in cui ci si trovava.

**Esempi pratici:**

```bash
cd /var/log # Spostati nella directory /var/log
pwd          # Verifica la nuova posizione
cd ..        # Torna a /var
pwd
cd           # Torna alla home directory
pwd
```

## 3. Mostrare la Directory Corrente: `pwd`

Il comando `pwd` (print working directory) stampa il percorso assoluto della directory corrente.

*   **Sintassi base:** `pwd`

```bash
cd /usr/local/bin
pwd # Output: /usr/local/bin
```

## 4. Creare Directory: `mkdir`

Il comando `mkdir` (make directory) crea nuove directory.

*   **Sintassi base:** `mkdir [OPZIONI] NOME_DIRECTORY_1 [NOME_DIRECTORY_2 ...]`

**Opzioni comuni di `mkdir`:**

*   `-p`: Crea le directory genitore se non esistono (parents). Molto utile per creare strutture di directory annidate in un solo comando.
    ```bash
    mkdir -p progetti/web/assets/css
    ```

**Esempi pratici:**

```bash
mkdir documenti immagini video # Crea tre directory
mkdir -p backup/2023/12       # Crea la struttura backup/2023/12
```

## 5. Rimuovere Directory Vuote: `rmdir`

Il comando `rmdir` (remove directory) rimuove directory **vuote**.

*   **Sintassi base:** `rmdir NOME_DIRECTORY_1 [NOME_DIRECTORY_2 ...]`

**Esempio:**

```bash
mkdir temp_dir
rmdir temp_dir # Rimuove la directory vuota
```
Se la directory non è vuota, `rmdir` darà un errore.

## 6. Copiare File e Directory: `cp`

Il comando `cp` (copy) copia file o directory.

*   **Sintassi base per file:** `cp [OPZIONI] SORGENTE DESTINAZIONE`
*   **Sintassi base per directory:** `cp [OPZIONI] -r SORGENTE_DIR DESTINAZIONE_DIR` (o `-R`)

**Opzioni comuni di `cp`:**

*   `-r` o `-R` o `--recursive`: Copia le directory ricorsivamente (necessario per copiare directory).
*   `-i`: Interattivo. Chiede conferma prima di sovrascrivere un file esistente.
*   `-v`: Verboso. Mostra i file mentre vengono copiati.
*   `-p`: Preserva attributi come data di modifica, proprietario e permessi.
*   `-u`: Aggiorna (update). Copia solo se il file sorgente è più recente del file di destinazione o se il file di destinazione non esiste.

**Esempi pratici:**

```bash
cp file1.txt file_copia.txt      # Copia file1.txt in file_copia.txt
cp -i appunti.txt documenti/     # Copia appunti.txt nella directory documenti, chiedendo conferma se esiste
cp -v *.txt backup/              # Copia tutti i file .txt nella directory backup, mostrando l'operazione
cp -r progetto/ progetto_backup/ # Copia ricorsivamente la directory progetto in progetto_backup
```

## 7. Spostare o Rinominare File e Directory: `mv`

Il comando `mv` (move) sposta file o directory, oppure li rinomina.

*   **Sintassi base:** `mv [OPZIONI] SORGENTE DESTINAZIONE`

**Funzionamento:**

*   Se `DESTINAZIONE` è una directory esistente, `SORGENTE` viene spostato all'interno di essa.
*   Se `DESTINAZIONE` è un nome di file (o non esiste), `SORGENTE` viene rinominato in `DESTINAZIONE`.
*   Se `SORGENTE` e `DESTINAZIONE` sono nella stessa directory e `DESTINAZIONE` non esiste, `SORGENTE` viene rinominato.

**Opzioni comuni di `mv`:**

*   `-i`: Interattivo. Chiede conferma prima di sovrascrivere.
*   `-v`: Verboso. Mostra cosa viene spostato/rinominato.
*   `-u`: Aggiorna. Sposta solo se il file sorgente è più recente del file di destinazione o se il file di destinazione non esiste.

**Esempi pratici:**

```bash
mv vecchio_nome.txt nuovo_nome.txt # Rinomina file
mv report.doc documenti/           # Sposta report.doc nella directory documenti
mv appunti/ note/                  # Rinomina la directory appunti in note
mv -i file_importante.dat /backup/ # Sposta con richiesta di conferma
```

## 8. Rimuovere File e Directory: `rm`

Il comando `rm` (remove) rimuove file e directory. **Attenzione: `rm` è un comando potente e i file rimossi sono generalmente difficili da recuperare. Usare con cautela.**

*   **Sintassi base:** `rm [OPZIONI] FILE_O_DIRECTORY_1 [FILE_O_DIRECTORY_2 ...]`

**Opzioni comuni di `rm`:**

*   `-r` o `-R` o `--recursive`: Rimuove le directory e il loro contenuto ricorsivamente (necessario per rimuovere directory non vuote).
*   `-f` o `--force`: Forza la rimozione senza chiedere conferme (ignora file non esistenti, non chiede mai). **Usare con estrema cautela!**
*   `-i`: Interattivo. Chiede conferma prima di ogni rimozione.
*   `-v`: Verboso. Mostra i file mentre vengono rimossi.

**Esempi pratici:**

```bash
rm file_inutile.txt              # Rimuove un file
rm -i *.tmp                      # Rimuove tutti i file .tmp chiedendo conferma per ognuno
rm -r vecchia_directory/         # Rimuove la directory e tutto il suo contenuto
rm -rf dati_da_cancellare/       # Rimuove forzatamente la directory e il suo contenuto (PERICOLOSO!)
```

**Consiglio di sicurezza:** Molti utenti creano un alias per `rm` come `rm -i` nel loro file `~/.bashrc` per avere sempre una richiesta di conferma, riducendo il rischio di cancellazioni accidentali.

## 9. Visualizzare il Tipo di File: `file`

Il comando `file` determina il tipo di un file.

*   **Sintassi base:** `file NOME_FILE`

```bash
file script.sh    # Output: Bourne-Again shell script, ASCII text executable
file immagine.jpg # Output: JPEG image data, JFIF standard 1.01
file archivio.tar.gz # Output: gzip compressed data, was "archivio.tar", last modified: ...
file /dev/sda     # Output: block special
```

## 10. Creare File Vuoti o Aggiornare Timestamp: `touch`

Il comando `touch` ha due scopi principali:
1.  Creare un file vuoto se non esiste.
2.  Aggiornare i timestamp (data di accesso e modifica) di un file esistente alla data e ora correnti.

*   **Sintassi base:** `touch [OPZIONI] NOME_FILE_1 [NOME_FILE_2 ...]`

**Opzioni comuni di `touch`:**

*   `-a`: Cambia solo il tempo di accesso.
*   `-m`: Cambia solo il tempo di modifica.
*   `-c`: Non creare alcun file se non esiste.
*   `-d STRINGA_DATA`: Usa `STRINGA_DATA` invece dell'ora corrente (es. `touch -d "2023-01-01" file.txt`).

**Esempi pratici:**

```bash
touch nuovo_file.txt             # Crea nuovo_file.txt se non esiste, altrimenti aggiorna i timestamp
touch -c file_esistente.log    # Aggiorna i timestamp di file_esistente.log solo se esiste
ls -l nuovo_file.txt           # Per vedere i timestamp aggiornati
```

Questi comandi costituiscono la base per la gestione del file system da riga di comando in Linux. Padroneggiarli è fondamentale per un uso efficiente del sistema.