# Guida Completa ai Comandi di Base del File System in Linux

## Panoramica del Filesystem Linux

Il filesystem Linux è organizzato in una struttura gerarchica ad albero, con la directory root (`/`) alla base. I file e le directory sono organizzati secondo uno standard chiamato Filesystem Hierarchy Standard (FHS).

### Directory Principali:

- **/** (root): La directory principale da cui si dirama tutto il filesystem
- **/bin**: Contiene i comandi binari essenziali per tutti gli utenti
- **/boot**: Contiene i file necessari per l'avvio del sistema
- **/dev**: Contiene file di dispositivo che rappresentano hardware
- **/etc**: Contiene file di configurazione del sistema
- **/home**: Contiene le directory personali degli utenti
- **/lib**: Contiene le librerie condivise essenziali
- **/media**: Punto di mount per dispositivi rimovibili
- **/mnt**: Punto di mount temporaneo
- **/opt**: Contiene software applicativi opzionali
- **/proc**: Filesystem virtuale che fornisce informazioni sul sistema
- **/root**: Directory home dell'utente root
- **/sbin**: Contiene comandi binari per l'amministrazione del sistema
- **/tmp**: Directory per file temporanei
- **/usr**: Contiene la maggior parte dei programmi e dati
- **/var**: Contiene file variabili come log e spooling

## Navigazione nel Filesystem

### pwd (Print Working Directory)
Mostra il percorso completo della directory corrente.

```bash
pwd
# Output: /home/utente/documenti
```

### cd (Change Directory)
Cambia la directory corrente.

```bash
cd /home/utente/documenti   # Percorso assoluto
cd documenti                # Percorso relativo
cd ..                       # Directory superiore
cd ~                        # Directory home dell'utente
cd -                        # Directory precedente
```

### ls (List)
Elenca file e directory.

```bash
ls                  # Elenca file e directory nella directory corrente
ls -l               # Formato lungo (mostra dettagli)
ls -a               # Mostra anche i file nascosti (che iniziano con .)
ls -la              # Combinazione di -l e -a
ls -lh              # Formato lungo con dimensioni leggibili (KB, MB, GB)
ls -R               # Ricorsivo (include sottodirectory)
ls -lt              # Ordina per data di modifica (più recenti prima)
ls -lS              # Ordina per dimensione (più grandi prima)
ls /var/log         # Elenca contenuti di una directory specifica
```

#### Comprendere l'output di ls -l

```
-rwxr-xr-x 1 utente gruppo 5369 Apr 23 10:25 script.sh
```

- Prima colonna (`-rwxr-xr-x`): Permessi del file
  - Primo carattere: tipo di file (`-` = file regolare, `d` = directory, `l` = link simbolico)
  - Seguenti 9 caratteri: permessi per proprietario, gruppo e altri (r=lettura, w=scrittura, x=esecuzione)
- `1`: Numero di hard link
- `utente`: Proprietario del file
- `gruppo`: Gruppo proprietario
- `5369`: Dimensione in byte
- `Apr 23 10:25`: Data e ora di ultima modifica
- `script.sh`: Nome del file

## Creazione e Rimozione di File e Directory

### touch
Crea un file vuoto o aggiorna timestamp di un file esistente.

```bash
touch file.txt           # Crea file.txt o aggiorna timestamp se esiste
touch -d "2023-01-01" file.txt   # Imposta una data specifica
touch file1.txt file2.txt        # Crea/aggiorna più file
```

### mkdir (Make Directory)
Crea directory.

```bash
mkdir directory                  # Crea una directory
mkdir -p dir1/dir2/dir3          # Crea struttura completa (parent)
mkdir -m 755 directory           # Crea con permessi specifici
mkdir dir1 dir2 dir3             # Crea più directory
```

### rm (Remove)
Rimuove file e directory.

```bash
rm file.txt               # Rimuove un file
rm -i file.txt            # Chiede conferma prima di rimuovere
rm -f file.txt            # Forza rimozione senza chiedere
rm -r directory           # Rimuove directory e contenuto ricorsivamente
rm -rf directory          # Rimuove ricorsivamente senza chiedere
```

**ATTENZIONE**: `rm -rf` è molto potente e può causare la perdita permanente di dati. Usare con cautela!

### rmdir (Remove Directory)
Rimuove directory vuote.

```bash
rmdir directory           # Rimuove una directory (solo se vuota)
rmdir -p dir1/dir2/dir3   # Rimuove struttura completa (se vuota)
```

## Copia e Spostamento di File e Directory

### cp (Copy)
Copia file e directory.

```bash
cp file.txt copia.txt             # Copia file
cp -i file.txt copia.txt          # Chiede conferma se sovrascrive
cp -r directory/ directory_copia/ # Copia ricorsivamente una directory
cp -p file.txt copia.txt          # Preserva permessi e timestamp
cp -v file.txt copia.txt          # Verbose (mostra cosa fa)
cp file1.txt file2.txt directory/ # Copia più file in una directory
```

### mv (Move)
Sposta o rinomina file e directory.

```bash
mv file.txt nuovo_nome.txt        # Rinomina file
mv file.txt directory/            # Sposta file in directory
mv -i file.txt directory/         # Chiede conferma se sovrascrive
mv -v directory1/ directory2/     # Sposta/rinomina directory (verbose)
mv file1.txt file2.txt directory/ # Sposta più file in una directory
```

## Visualizzazione del Contenuto dei File

### cat (Concatenate)
Visualizza il contenuto completo di uno o più file.

```bash
cat file.txt                      # Mostra contenuto
cat file1.txt file2.txt           # Concatena e mostra più file
cat -n file.txt                   # Numera le righe
cat > file.txt                    # Crea file e aspetta input (Ctrl+D per terminare)
cat >> file.txt                   # Appende a file esistente
```

### less
Visualizza file con possibilità di scorrimento avanti/indietro.

```bash
less file.txt
```

Comandi utili in less:
- Spazio/f: Pagina successiva
- b: Pagina precedente
- g: Vai all'inizio del file
- G: Vai alla fine del file
- /testo: Cerca "testo"
- n: Prossima occorrenza
- q: Esci

### more
Visualizza file una schermata alla volta (solo avanti).

```bash
more file.txt
```

### head
Visualizza le prime righe di un file.

```bash
head file.txt           # Mostra prime 10 righe
head -n 20 file.txt     # Mostra prime 20 righe
head -c 100 file.txt    # Mostra primi 100 byte
```

### tail
Visualizza le ultime righe di un file.

```bash
tail file.txt           # Mostra ultime 10 righe
tail -n 20 file.txt     # Mostra ultime 20 righe
tail -f file.txt        # Segue il file in tempo reale (utile per log)
tail -f -n 100 file.txt # Mostra ultime 100 righe e continua a seguire
```

## Ricerca di File

### find
Ricerca file e directory in base a vari criteri.

```bash
find /home -name "*.txt"          # Trova file .txt in /home
find . -type f -mtime -7          # File modificati negli ultimi 7 giorni
find . -type d -name "progetto*"  # Directory che iniziano con "progetto"
find . -size +10M                 # File più grandi di 10MB
find . -perm 644                  # File con permessi specifici
find . -user username             # File di proprietà di un utente

# Azioni su file trovati
find . -name "*.tmp" -delete      # Elimina file .tmp
find . -name "*.log" -exec ls -l {} \;  # Esegue ls -l su ogni file trovato
```

### locate
Ricerca file nel database del sistema (più veloce di find).

```bash
locate file.txt        # Trova file.txt in tutto il sistema
locate -i file.txt     # Ignora maiuscole/minuscole
sudo updatedb          # Aggiorna il database di locate
```

### which
Trova la posizione di un eseguibile nel PATH.

```bash
which bash            # Trova posizione dell'eseguibile bash
which -a python       # Trova tutte le occorrenze
```

### whereis
Trova binari, sorgenti e pagine man di un comando.

```bash
whereis grep          # Trova le posizioni relative a grep
```

## Archiviazione e Compressione

### tar (Tape Archive)
Crea, visualizza e estrae archivi.

```bash
# Creazione archivi
tar -cvf archivio.tar directory/   # Crea archivio
tar -czvf archivio.tar.gz dir/     # Crea archivio compresso con gzip
tar -cjvf archivio.tar.bz2 dir/    # Crea archivio compresso con bzip2
tar -cJvf archivio.tar.xz dir/     # Crea archivio compresso con xz

# Visualizzazione contenuto
tar -tvf archivio.tar              # Visualizza contenuto
tar -tzvf archivio.tar.gz          # Visualizza contenuto (gzip)

# Estrazione
tar -xvf archivio.tar              # Estrae archivio
tar -xzvf archivio.tar.gz          # Estrae archivio gzip
tar -xvf archivio.tar -C /destinazione/  # Estrae in directory specifica
```

Opzioni principali:
- `c`: Create (crea)
- `x`: Extract (estrai)
- `t`: Test/list (visualizza)
- `v`: Verbose (mostra dettagli)
- `f`: File (specifica il file)
- `z`: Gzip
- `j`: Bzip2
- `J`: XZ

### gzip/gunzip
Comprime/decomprime file con l'algoritmo gzip.

```bash
gzip file.txt                 # Comprime (crea file.txt.gz e rimuove l'originale)
gzip -k file.txt              # Mantiene l'originale
gzip -9 file.txt              # Massima compressione
gunzip file.txt.gz            # Decomprime
gzip -d file.txt.gz           # Decomprime (equivalente a gunzip)
gzip -l file.txt.gz           # Lista informazioni sul file compresso
```

### bzip2/bunzip2
Simile a gzip ma con compressione migliore (più lenta).

```bash
bzip2 file.txt                # Comprime (crea file.txt.bz2)
bunzip2 file.txt.bz2          # Decomprime
```

### zip/unzip
Crea/estrae archivi compatibili con il formato ZIP.

```bash
zip archivio.zip file1 file2      # Crea archivio
zip -r archivio.zip directory/    # Crea archivio ricorsivo
unzip archivio.zip                # Estrae
unzip -l archivio.zip             # Lista contenuto
unzip archivio.zip -d /destinazione/  # Estrae in directory specifica
```

## Link (Collegamenti)

### ln
Crea link tra file.

```bash
# Hard link (stesso inode, deve essere sullo stesso filesystem)
ln file.txt hardlink.txt

# Soft/Symbolic link (punta al path, può essere su filesystem diverso)
ln -s file.txt symlink.txt
ln -s /percorso/assoluto/file.txt symlink2.txt
ln -s directory/ link_a_directory
```

## Comandi Utili per il Filesystem

### du (Disk Usage)
Mostra l'utilizzo del disco.

```bash
du file.txt                   # Mostra dimensione file
du -h directory/              # Dimensione directory in formato leggibile
du -sh directory/             # Solo sommario (summary)
du -h --max-depth=1 /home     # Solo primo livello di directory
```

### df (Disk Free)
Mostra spazio libero sui filesystem montati.

```bash
df                            # Mostra tutti i filesystem
df -h                         # In formato leggibile (KB, MB, GB)
df -h /home                   # Solo filesystem specifico
```

### mount/umount
Monta/smonta filesystem.

```bash
mount                         # Mostra filesystem montati
sudo mount /dev/sdb1 /mnt     # Monta una partizione
sudo umount /mnt              # Smonta
```

### chmod (Change Mode)
Cambia permessi di file e directory.

```bash
chmod 755 file.sh             # Notazione ottale (rwx r-x r-x)
chmod u+x file.sh             # Aggiunge esecuzione per utente
chmod go-w file.txt           # Rimuove scrittura per gruppo e altri
chmod -R 644 directory/       # Cambia ricorsivamente
```

### chown (Change Owner)
Cambia proprietario di file e directory.

```bash
sudo chown utente file.txt              # Cambia proprietario
sudo chown utente:gruppo file.txt       # Cambia proprietario e gruppo
sudo chown -R utente:gruppo directory/  # Cambia ricorsivamente
```

## Tecniche Avanzate

### Redirezione Input/Output

```bash
comando > file.txt            # Redirige output a file (sovrascrive)
comando >> file.txt           # Append output a file
comando < file.txt            # Legge input da file
comando 2> errori.txt         # Redirige errori a file
comando > output.txt 2>&1     # Redirige sia output che errori
```

### Pipeline
Concatena comandi inviando l'output di uno come input al successivo.

```bash
ls -la | grep .txt            # Filtra risultati di ls
cat file.txt | sort | uniq     # Ordina e rimuove duplicati
ps aux | grep firefox          # Cerca processi specifici
df -h | grep /dev/sda          # Filtra informazioni del disco
```

### Espressioni regolari nel filesystem
Utilizzate con comandi come grep, find, etc.

```bash
ls *.txt                       # Tutti i file .txt
ls progetto_[12].txt           # progetto_1.txt e progetto_2.txt
ls immagine_{1..5}.jpg         # immagine_1.jpg fino a immagine_5.jpg
find . -regex ".*\.txt$"       # Trova file .txt con regex completa
```

## Conclusione

La padronanza dei comandi del filesystem Linux è fondamentale per lavorare efficacemente in un ambiente Linux. Con la pratica, diventerà naturale navigare, manipolare file e utilizzare strumenti avanzati per automatizzare compiti ripetitivi attraverso script Bash.
