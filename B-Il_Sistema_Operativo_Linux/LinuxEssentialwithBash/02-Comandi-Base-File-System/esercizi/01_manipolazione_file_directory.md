# Esercizio: Manipolazione di File e Directory

**Obiettivo:** Mettere in pratica i comandi `cp`, `mv`, `rm`, `mkdir`, `rmdir`, `touch` e `file` per gestire file e directory.

**Preparazione:**

1.  Apri il terminale.
2.  Vai alla tua directory home: `cd ~`
3.  Crea una directory di lavoro per questo esercizio:
    ```bash
    mkdir esercizi_fs
    cd esercizi_fs
    ```
    Tutti i comandi seguenti dovrebbero essere eseguiti all'interno della directory `esercizi_fs`, a meno che non sia specificato diversamente.

## Parte 1: Creazione di File e Directory

1.  **Creare directory:**
    *   Crea tre directory chiamate `documenti`, `immagini` e `temporanei`.
    *   All'interno della directory `documenti`, crea una sottodirectory chiamata `report`.
    *   Verifica la struttura creata con `ls` e `ls documenti`.
2.  **Creare file vuoti:**
    *   Spostati nella directory `documenti/report`.
    *   Crea due file vuoti chiamati `report_annuale.txt` e `bozza_report.md` usando `touch`.
    *   Spostati nella directory `immagini`.
    *   Crea tre file vuoti: `logo.png`, `foto_vacanza.jpg`, `icona.svg`.
    *   Verifica con `ls` in ciascuna directory.

## Parte 2: Copiare File e Directory

1.  **Copiare un file:**
    *   Assicurati di essere in `esercizi_fs`.
    *   Copia `documenti/report/report_annuale.txt` nella directory `temporanei`.
    *   Verifica che il file sia stato copiato in `temporanei`.
2.  **Copiare un file rinominandolo:**
    *   Copia `documenti/report/bozza_report.md` nella directory `temporanei`, nominandolo `report_da_revisionare.md`.
    *   Verifica.
3.  **Copiare una directory:**
    *   Copia l'intera directory `documenti` (con il suo contenuto) in una nuova directory chiamata `documenti_backup` (che verrà creata all'interno di `esercizi_fs`).
    *   Usa l'opzione appropriata per la copia ricorsiva.
    *   Verifica il contenuto di `documenti_backup` e delle sue sottodirectory.

## Parte 3: Spostare e Rinominare File e Directory

1.  **Rinominare un file:**
    *   Spostati nella directory `temporanei`.
    *   Rinomina `report_annuale.txt` in `report_finale_2023.txt`.
    *   Verifica.
2.  **Spostare un file:**
    *   Sposta `report_da_revisionare.md` dalla directory `temporanei` alla directory `documenti/report`.
    *   Verifica che il file non sia più in `temporanei` e sia presente in `documenti/report`.
3.  **Spostare e rinominare una directory:**
    *   Assicurati di essere in `esercizi_fs`.
    *   Rinomina la directory `immagini` in `grafica`.
    *   Verifica con `ls`.

## Parte 4: Rimuovere File e Directory

1.  **Rimuovere un file:**
    *   Spostati nella directory `temporanei`.
    *   Rimuovi il file `report_finale_2023.txt`.
    *   Prova a rimuoverlo usando l'opzione interattiva (`-i`).
2.  **Rimuovere una directory vuota:**
    *   Assicurati che la directory `temporanei` sia vuota (se hai seguito i passaggi, dovrebbe esserlo).
    *   Spostati in `esercizi_fs`.
    *   Rimuovi la directory `temporanei` usando `rmdir`.
3.  **Rimuovere una directory non vuota:**
    *   Crea una directory `da_cancellare` e mettici dentro un file fittizio:
        ```bash
        mkdir da_cancellare
        touch da_cancellare/file_inutile.txt
        ```
    *   Prova a rimuovere `da_cancellare` con `rmdir`. Cosa succede?
    *   Rimuovi la directory `da_cancellare` e il suo contenuto usando `rm` con l'opzione appropriata.
    *   **Fai molta attenzione quando usi `rm -r` o `rm -rf`!**

## Parte 5: Verificare il Tipo di File

1.  **Usare il comando `file`:**
    *   Spostati in `esercizi_fs/documenti_backup/report`.
    *   Usa il comando `file` su `report_annuale.txt` e `bozza_report.md`.
    *   Spostati in `esercizi_fs/grafica`.
    *   Usa il comando `file` su `logo.png` e `foto_vacanza.jpg`.
    *   Cosa osservi riguardo all'output del comando `file`?

## Domande di Riflessione

*   Qual è la differenza tra `cp miofile nuovadirectory/` e `cp miofile nuovadirectory/nuovonome`?
*   Cosa succede se provi a usare `mv` per spostare un file su un file esistente senza l'opzione `-i`?
*   Perché `rmdir` funziona solo con directory vuote? Quale comando si usa per directory non vuote e perché è più "pericoloso"?
*   Quando useresti `touch` su un file esistente invece che per crearne uno nuovo?
*   Come potresti copiare tutti i file con estensione `.txt` da una directory all'altra in un solo comando?

## Obiettivi di Apprendimento

Al termine di questo esercizio, dovresti essere in grado di:

*   Creare file e directory (`touch`, `mkdir`).
*   Copiare file e directory, anche ricorsivamente (`cp`).
*   Spostare e rinominare file e directory (`mv`).
*   Rimuovere file e directory, comprendendo la differenza tra `rmdir` e `rm -r` (`rm`, `rmdir`).
*   Utilizzare opzioni comuni come `-i` (interattivo), `-r` (ricorsivo), `-v` (verboso).
*   Determinare il tipo di un file (`file`).
*   Lavorare con maggiore confidenza nella gestione quotidiana di file e directory da riga di comando.