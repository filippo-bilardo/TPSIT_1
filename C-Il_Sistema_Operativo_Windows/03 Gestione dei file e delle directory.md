### Capitolo 2: Gestione dei file e delle directory

La gestione dei file e delle directory è una delle funzioni principali del Prompt dei comandi. Questo capitolo ti guiderà attraverso i comandi e le tecniche necessarie per navigare, creare, copiare, spostare e cancellare file e directory.

#### Comandi per la navigazione delle directory

- **`cd` (Change Directory)**: Questo comando ti permette di cambiare la directory corrente. Ad esempio, `cd Documenti` ti porta nella cartella `Documenti`.
  - `cd ..`: Torna alla directory padre.
  - `cd \`: Va alla radice della directory corrente.

- **`dir`**: Elenca i file e le directory nella directory corrente. Può essere usato con diverse opzioni per visualizzare ulteriori dettagli.
  - `dir /p`: Mostra i risultati una pagina alla volta.
  - `dir /w`: Visualizza i risultati in formato ampio.

#### Creazione, copia, spostamento e cancellazione di file e directory

- **Creazione**:
  - `mkdir`: Crea una nuova directory. Ad esempio, `mkdir NuovaCartella`.
  - `echo testo > nomefile.txt`: Crea un nuovo file di testo con il contenuto specificato.

- **Copia**:
  - `copy`: Copia file da una posizione a un'altra. Ad esempio, `copy file.txt C:\Destinazione`.
  - `xcopy`: Copia directory e il loro contenuto. Ad esempio, `xcopy C:\Sorgente C:\Destinazione /E /I`.

- **Spostamento**:
  - `move`: Sposta file o directory in una nuova posizione. Ad esempio, `move file.txt C:\NuovaPosizione`.

- **Cancellazione**:
  - `del`: Cancella uno o più file. Ad esempio, `del file.txt`.
  - `rmdir`: Rimuove una directory vuota. Ad esempio, `rmdir VecchiaCartella`.
  - `rmdir /s`: Rimuove una directory e tutto il suo contenuto.

#### Attributi dei file e permessi

- **`attrib`**: Visualizza o modifica gli attributi di un file. Ad esempio, `attrib +r file.txt` imposta il file come di sola lettura.
  - `+h`: Nasconde il file.
  - `-h`: Rimuove l'attributo nascosto.
  - `+s`: Imposta il file come file di sistema.

- **Permessi**: Sebbene il Prompt dei comandi non gestisca direttamente i permessi come i sistemi Unix, puoi usare `icacls` per visualizzare o modificare le autorizzazioni su file e directory.

#### Esempi pratici di gestione dei file

1. **Creare una struttura di directory**:
   ```shell
   mkdir Progetto
   cd Progetto
   mkdir Documenti Immagini
   ```

2. **Copiare file in una nuova directory**:
   ```shell
   copy C:\Sorgente\file.txt C:\Progetto\Documenti
   ```

3. **Spostare una directory**:
   ```shell
   move C:\Progetto\Immagini C:\Archivio
   ```

#### Best practice per la gestione dei file

- **Backup**: Prima di eseguire operazioni di cancellazione o spostamento, assicurati di avere un backup dei file importanti.
- **Verifica dei comandi**: Controlla sempre il comando prima di eseguirlo, specialmente quando usi opzioni che modificano o cancellano file.
- **Uso delle virgolette**: Quando i percorsi contengono spazi, racchiudili tra virgolette. Ad esempio, `cd "C:\Nuova Cartella"`.

#### Domande di autovalutazione

1. Quale comando viene utilizzato per cambiare la directory corrente?
   a) `move`
   b) `cd`
   c) `dir`
   d) `copy`

2. Come si cancella una directory e tutto il suo contenuto?
   a) `del`
   b) `rmdir /s`
   c) `remove`
   d) `erase`

3. Quale comando elenca i file e le directory nella posizione corrente?
   a) `list`
   b) `dir`
   c) `show`
   d) `view`

#### Esercizi pratici

1. Crea una directory chiamata `Esercizi` nella tua directory `Documenti`.
2. All'interno della directory `Esercizi`, crea due sottodirectory chiamate `Testo` e `Immagini`.
3. Copia un file di testo dalla tua scrivania alla directory `Testo`.
4. Sposta la directory `Immagini` in una nuova posizione, ad esempio `C:\Temp`.
5. Elenca i file nella directory `Testo` e poi cancella il file che hai copiato.

Questi esercizi ti aiuteranno a familiarizzare con la gestione dei file e delle directory nel Prompt dei comandi, migliorando la tua efficienza e competenza. Buon lavoro!