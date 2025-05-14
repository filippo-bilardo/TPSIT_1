# Esercizio: Esplorazione di Base del Filesystem

**Obiettivo:** Imparare a navigare la struttura del file system di Linux, comprendere i percorsi assoluti e relativi, e utilizzare comandi per esplorare directory e file.

## Parte 1: Navigazione Essenziale

1.  **Apri il terminale.**
2.  **Directory Corrente:**
    *   Usa `pwd` per identificare la tua directory di lavoro corrente.
3.  **Contenuto della Directory:**
    *   Usa `ls` per elencare i file e le directory nella posizione corrente.
    *   Usa `ls -l` per una visualizzazione dettagliata (formato lungo). Osserva le informazioni mostrate (permessi, proprietario, dimensione, data).
    *   Usa `ls -a` per mostrare anche i file e le directory nascosti (quelli che iniziano con un punto `.`).
    *   Prova a combinare le opzioni: `ls -la` o `ls -al`.
4.  **Cambiare Directory (`cd`):
    *   Vai alla tua directory home: `cd ~` (o semplicemente `cd` senza argomenti).
    *   Verifica con `pwd`.
    *   Spostati nella directory root del sistema: `cd /`.
    *   Verifica con `pwd` e usa `ls` per vedere il contenuto della root.
    *   Torna alla directory home: `cd`.
    *   Crea una struttura di directory per l'esercizio:
        ```bash
        mkdir -p ~/esplorazione/documenti ~/esplorazione/immagini ~/esplorazione/musica
        touch ~/esplorazione/documenti/report.txt ~/esplorazione/immagini/foto.jpg
        ```
        Il comando `mkdir -p` crea le directory genitore se non esistono.
    *   Spostati in `~/esplorazione/documenti`.
    *   Torna alla directory `~/esplorazione` usando `cd ..` (directory genitore).
    *   Spostati direttamente in `~/esplorazione/immagini` da `~/esplorazione` usando `cd immagini`.
    *   Torna alla tua home directory da qualsiasi posizione usando `cd ~`.

## Parte 2: Percorsi Assoluti e Relativi

1.  **Percorso Assoluto:** Un percorso che inizia dalla directory root (`/`).
    *   Dalla tua directory home, spostati in `/usr/bin` usando il percorso assoluto: `cd /usr/bin`.
    *   Verifica con `pwd`.
    *   Elenca alcuni file in questa directory con `ls | head` (mostra solo le prime righe).
2.  **Percorso Relativo:** Un percorso che parte dalla directory corrente.
    *   Torna alla tua directory home: `cd`.
    *   Spostati nella directory `esplorazione/musica` che hai creato prima, usando un percorso relativo: `cd esplorazione/musica`.
    *   Verifica con `pwd`.
    *   Dalla directory `~/esplorazione/musica`, come ti sposteresti in `~/esplorazione/documenti` usando un percorso relativo? (Suggerimento: `cd ../documenti`)

## Parte 3: Trovare File e Directory (`find` e `locate` - introduzione)

1.  **Trovare file con `find` (base):**
    *   Vai alla tua directory `~/esplorazione`: `cd ~/esplorazione`.
    *   Trova tutti i file chiamati `report.txt` all'interno di `~/esplorazione` e delle sue sottodirectory:
        ```bash
        find . -name report.txt
        ```
        (`.` rappresenta la directory corrente).
    *   Trova tutte le directory chiamate `immagini`:
        ```bash
        find . -type d -name immagini
        ```
        (`-type d` specifica di cercare solo directory).
2.  **Visualizzare il tipo di file (`file`):**
    *   Usa il comando `file` per determinare il tipo di un file:
        ```bash
        file ~/esplorazione/documenti/report.txt
        file ~/esplorazione/immagini/foto.jpg
        file /bin/bash
        ```

## Domande di Riflessione

*   Qual è il vantaggio di usare `ls -a`?
*   Quando è preferibile usare un percorso assoluto e quando uno relativo?
*   Cosa rappresenta `.` in un percorso? E `..`?
*   Se sei in `/home/utente/documenti`, qual è il percorso relativo per `/home/utente/immagini`?
*   Come potresti usare `find` per cercare tutti i file `.txt` nella tua home directory?

## Obiettivi di Apprendimento

Al termine di questo esercizio, dovresti essere in grado di:

*   Utilizzare `pwd`, `ls` (con opzioni comuni come `-l`, `-a`) e `cd` per navigare il filesystem.
*   Comprendere e utilizzare percorsi assoluti e relativi.
*   Creare directory con `mkdir` (anche con l'opzione `-p`).
*   Creare file vuoti con `touch`.
*   Utilizzare `find` per una ricerca base di file e directory per nome e tipo.
*   Utilizzare il comando `file` per identificare il tipo di un file.