# 10. Manipolazione di File e Directory

## 10.1 Operazioni su file e directory

Bash offre numerosi comandi per manipolare file e directory. Questi comandi sono essenziali per automatizzare operazioni di gestione dei file nei tuoi script.

### Creazione di file e directory

```bash
# Creazione di file
touch file.txt              # Crea un file vuoto o aggiorna il timestamp
echo "contenuto" > file.txt  # Crea un file con contenuto
cat > file.txt << EOF       # Crea un file con contenuto multilinea
Linea 1
Linea 2
Linea 3
EOF

# Creazione di directory
mkdir directory             # Crea una directory
mkdir -p path/to/directory  # Crea directory e sottodirectory se non esistono
```

### Copia, spostamento e rinomina

```bash
# Copia
cp file.txt copia.txt                # Copia un file
cp -r directory/ directory_backup/   # Copia una directory e il suo contenuto

# Spostamento e rinomina
mv file.txt nuovo_nome.txt           # Rinomina un file
mv file.txt /path/to/destination/    # Sposta un file
mv directory/ /path/to/destination/  # Sposta una directory
```

### Eliminazione

```bash
# Eliminazione di file
rm file.txt        # Elimina un file
rm -f file.txt     # Forza l'eliminazione senza conferma

# Eliminazione di directory
rmdir directory    # Elimina una directory vuota
rm -r directory/   # Elimina una directory e il suo contenuto
rm -rf directory/  # Forza l'eliminazione ricorsiva senza conferma
```

### Esempi di script per operazioni su file

```bash
#!/bin/bash

# Script per creare una struttura di directory per un progetto

PROJECT_NAME="$1"

if [ -z "$PROJECT_NAME" ]; then
    echo "Errore: Specificare il nome del progetto."
    echo "Uso: $0 <nome_progetto>"
    exit 1
fi

# Crea la directory principale del progetto
mkdir -p "$PROJECT_NAME"

# Crea la struttura di directory
mkdir -p "$PROJECT_NAME/src"
mkdir -p "$PROJECT_NAME/docs"
mkdir -p "$PROJECT_NAME/tests"

# Crea file di base
touch "$PROJECT_NAME/README.md"
touch "$PROJECT_NAME/src/main.sh"

# Rendi eseguibile lo script principale
chmod +x "$PROJECT_NAME/src/main.sh"

echo "Struttura del progetto '$PROJECT_NAME' creata con successo."
```

## 10.2 Test su file

Bash fornisce numerosi operatori per verificare attributi di file e directory. Questi operatori sono particolarmente utili nei costrutti condizionali.

### Operatori di test su file

```bash
[ -e file ]  # file esiste
[ -f file ]  # file esiste ed è un file regolare
[ -d file ]  # file esiste ed è una directory
[ -h file ]  # file esiste ed è un link simbolico
[ -L file ]  # file esiste ed è un link simbolico (sinonimo di -h)
[ -r file ]  # file esiste ed è leggibile
[ -w file ]  # file esiste ed è scrivibile
[ -x file ]  # file esiste ed è eseguibile
[ -s file ]  # file esiste e ha dimensione maggiore di zero
[ -b file ]  # file esiste ed è un dispositivo a blocchi
[ -c file ]  # file esiste ed è un dispositivo a caratteri
[ -p file ]  # file esiste ed è una named pipe (FIFO)
[ -S file ]  # file esiste ed è un socket
[ -t fd ]    # fd è un descrittore di file aperto su un terminale
```

### Operatori di confronto tra file

```bash
[ file1 -nt file2 ]  # file1 è più recente di file2
[ file1 -ot file2 ]  # file1 è più vecchio di file2
[ file1 -ef file2 ]  # file1 e file2 sono lo stesso file (stessi inode)
```

### Esempi di utilizzo dei test su file

```bash
#!/bin/bash

# Verifica se un file esiste e crea un backup se necessario

FILE="$1"

if [ -z "$FILE" ]; then
    echo "Errore: Specificare un file."
    echo "Uso: $0 <file>"
    exit 1
fi

if [ -f "$FILE" ]; then
    echo "Il file '$FILE' esiste."
    
    # Verifica se il file è leggibile
    if [ -r "$FILE" ]; then
        echo "Il file è leggibile."
    else
        echo "Attenzione: Il file non è leggibile."
        exit 1
    fi
    
    # Crea un backup se il file ha contenuto
    if [ -s "$FILE" ]; then
        BACKUP="${FILE}.bak"
        echo "Creazione del backup in '$BACKUP'..."
        cp "$FILE" "$BACKUP"
        echo "Backup completato."
    else
        echo "Il file è vuoto, nessun backup necessario."
    fi
else
    echo "Il file '$FILE' non esiste."
    
    # Verifica se è una directory
    if [ -d "$FILE" ]; then
        echo "'$FILE' è una directory, non un file."
    else
        echo "Creazione del file '$FILE'..."
        touch "$FILE"
        echo "File creato."
    fi
fi
```

## 10.3 Permessi e proprietà

In Unix/Linux, ogni file e directory ha associati permessi e proprietà che determinano chi può accedervi e come.

### Visualizzazione di permessi e proprietà

```bash
ls -l file.txt    # Visualizza permessi, proprietario, gruppo, dimensione, ecc.
stat file.txt     # Visualizza informazioni dettagliate sul file
id                # Visualizza UID, GID e gruppi dell'utente corrente
```

### Modifica dei permessi

```bash
# Utilizzo di chmod con notazione simbolica
chmod u+x file.sh         # Aggiunge permesso di esecuzione per l'utente
chmod g+w file.txt        # Aggiunge permesso di scrittura per il gruppo
chmod o-r file.txt        # Rimuove permesso di lettura per gli altri
chmod a+r file.txt        # Aggiunge permesso di lettura per tutti
chmod u+rwx,g+rx,o+r file # Imposta permessi combinati

# Utilizzo di chmod con notazione ottale
chmod 755 file.sh         # rwxr-xr-x (eseguibile)
chmod 644 file.txt        # rw-r--r-- (file di testo)
chmod 600 private.key     # rw------- (file privato)
```

### Modifica di proprietario e gruppo

```bash
chown utente file.txt             # Cambia il proprietario
chown utente:gruppo file.txt      # Cambia proprietario e gruppo
chgrp gruppo file.txt             # Cambia solo il gruppo
chown -R utente:gruppo directory/ # Cambia ricorsivamente per una directory
```

### Permessi speciali

```bash
chmod u+s file      # Set UID bit
chmod g+s directory # Set GID bit
chmod +t directory  # Sticky bit
```

### Esempi di script per gestire permessi

```bash
#!/bin/bash

# Script per impostare permessi corretti su una struttura di directory

DIR="$1"

if [ -z "$DIR" ]; then
    echo "Errore: Specificare una directory."
    echo "Uso: $0 <directory>"
    exit 1
fi

if [ ! -d "$DIR" ]; then
    echo "Errore: '$DIR' non è una directory o non esiste."
    exit 1
fi

echo "Impostazione permessi per la directory '$DIR'..."

# Imposta permessi di base sulla directory principale
chmod 755 "$DIR"

# Imposta permessi sui file e sottodirectory
find "$DIR" -type d -exec chmod 755 {} \;
find "$DIR" -type f -name "*.sh" -exec chmod 755 {} \;
find "$DIR" -type f ! -name "*.sh" -exec chmod 644 {} \;

echo "Permessi impostati correttamente."
```

## 10.4 Ricerca di file con find

Il comando `find` è uno strumento potente per cercare file e directory in base a vari criteri.

### Sintassi di base

```bash
find [percorso] [opzioni] [espressione]
```

### Ricerca per nome

```bash
find . -name "*.txt"           # Trova file con estensione .txt
find . -iname "*.txt"          # Come sopra, ma case-insensitive
find . -name "file?.txt"       # Utilizza ? come carattere jolly per un singolo carattere
find /home -name "documento*"  # Cerca in /home file che iniziano con "documento"
```

### Ricerca per tipo

```bash
find . -type f  # Trova solo file regolari
find . -type d  # Trova solo directory
find . -type l  # Trova solo link simbolici
```

### Ricerca per dimensione

```bash
find . -size 0                # Trova file vuoti
find . -size +1M              # Trova file più grandi di 1 MB
find . -size -1M              # Trova file più piccoli di 1 MB
find . -size +10M -size -100M # Trova file tra 10 MB e 100 MB
```

### Ricerca per tempo

```bash
find . -mtime -7              # Modificati negli ultimi 7 giorni
find . -mtime +30             # Modificati più di 30 giorni fa
find . -mmin -60              # Modificati negli ultimi 60 minuti
find . -newer reference_file  # Più recenti di reference_file
```

### Ricerca per permessi

```bash
find . -perm 644              # Esattamente con permessi 644
find . -perm -644             # Con almeno permessi 644
find . -perm /u+x             # Con permesso di esecuzione per l'utente
```

### Esecuzione di comandi sui file trovati

```bash
# Utilizzo di -exec
find . -name "*.log" -exec rm {} \;        # Elimina tutti i file .log
find . -type f -exec chmod 644 {} \;       # Imposta permessi 644 su tutti i file

# Utilizzo di -exec con conferma
find . -name "*.tmp" -exec rm -i {} \;     # Chiede conferma prima di eliminare

# Utilizzo di xargs
find . -name "*.jpg" | xargs -I{} cp {} /backup/  # Copia tutti i file .jpg in /backup/
```

### Esempi di script con find

```bash
#!/bin/bash

# Script per trovare e comprimere file vecchi

DIR="$1"
DAYS="$2"

if [ -z "$DIR" ] || [ -z "$DAYS" ]; then
    echo "Errore: Parametri mancanti."
    echo "Uso: $0 <directory> <giorni>"
    exit 1
fi

if [ ! -d "$DIR" ]; then
    echo "Errore: '$DIR' non è una directory o non esiste."
    exit 1
fi

echo "Ricerca di file più vecchi di $DAYS giorni in '$DIR'..."

# Crea directory per l'archivio se non esiste
ARCHIVE_DIR="$DIR/archive"
mkdir -p "$ARCHIVE_DIR"

# Trova e comprime i file vecchi
count=0
while IFS= read -r file; do
    filename=$(basename "$file")
    gzip -c "$file" > "$ARCHIVE_DIR/$filename.gz"
    rm "$file"
    ((count++))
done < <(find "$DIR" -type f -mtime +"$DAYS" -not -path "$ARCHIVE_DIR/*")

echo "$count file compressi e spostati in '$ARCHIVE_DIR'."
```

## 10.5 Archivi e compressione

Bash offre vari comandi per creare, estrarre e manipolare archivi compressi.

### Compressione con gzip, bzip2 e xz

```bash
# gzip (più veloce, compressione moderata)
gzip file.txt                # Comprime file.txt in file.txt.gz
gzip -d file.txt.gz          # Decomprime file.txt.gz
gzip -c file.txt > file.gz   # Comprime mantenendo l'originale

# bzip2 (più lento, migliore compressione)
bzip2 file.txt               # Comprime file.txt in file.txt.bz2
bzip2 -d file.txt.bz2        # Decomprime file.txt.bz2

# xz (molto lento, compressione ottima)
xz file.txt                  # Comprime file.txt in file.txt.xz
xz -d file.txt.xz            # Decomprime file.txt.xz
```

### Creazione e estrazione di archivi