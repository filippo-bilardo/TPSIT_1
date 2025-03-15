# 9. Gestione dell'Output

## 9.1 Redirezione standard (stdout, stderr)

La redirezione dell'output è una delle funzionalità più potenti della shell Bash, permettendo di controllare dove viene inviato l'output dei comandi. In Unix/Linux, ogni processo ha tre stream standard:

- **Standard input (stdin)**: canale di input, file descriptor 0
- **Standard output (stdout)**: canale di output normale, file descriptor 1
- **Standard error (stderr)**: canale di output per gli errori, file descriptor 2

### Redirezione dell'output standard (stdout)

```bash
comando > file       # Redirige stdout a file (sovrascrive)
comando >> file      # Redirige stdout a file (appende)
```

Esempi:

```bash
# Salvare l'elenco dei file in un file
ls -la > elenco_file.txt

# Aggiungere l'output di un comando a un file esistente
echo "Nuova riga" >> log.txt
```

### Redirezione dell'errore standard (stderr)

```bash
comando 2> file      # Redirige stderr a file (sovrascrive)
comando 2>> file     # Redirige stderr a file (appende)
```

Esempi:

```bash
# Salvare solo gli errori in un file
find / -name "*.txt" 2> errori.log

# Aggiungere gli errori a un file di log
script.sh 2>> errori.log
```

### Redirezione combinata

```bash
comando > file 2>&1  # Redirige sia stdout che stderr allo stesso file
comando &> file      # Sintassi abbreviata (Bash 4+)
comando > file1 2> file2  # Redirige stdout e stderr a file diversi
```

Esempi:

```bash
# Salvare sia l'output normale che gli errori nello stesso file
script.sh > tutto.log 2>&1

# Sintassi abbreviata (Bash 4+)
script.sh &> tutto.log

# Separare output normale ed errori
script.sh > output.log 2> errori.log
```

### Scartare l'output

```bash
comando > /dev/null  # Scarta stdout
comando 2> /dev/null # Scarta stderr
comando &> /dev/null # Scarta sia stdout che stderr
```

Esempio:

```bash
# Eseguire un comando senza visualizzare alcun output
script.sh &> /dev/null
```

## 9.2 Pipe e filtri

Le pipe (`|`) permettono di collegare l'output di un comando all'input di un altro, creando pipeline di elaborazione dati.

### Sintassi di base

```bash
comando1 | comando2 | comando3
```

Esempi di utilizzo delle pipe:

```bash
# Contare il numero di file in una directory
ls -la | wc -l

# Trovare i processi di un utente specifico
ps aux | grep "username"

# Ordinare e visualizzare solo le righe uniche
cat file.txt | sort | uniq

# Visualizzare solo le prime 10 righe di un file ordinato
cat file.txt | sort | head -n 10
```

### Comandi filtro comuni

Bash offre numerosi comandi progettati per funzionare come filtri nelle pipeline:

```bash
grep    # Filtra le righe in base a un pattern
sort    # Ordina le righe
uniq    # Rimuove le righe duplicate
head    # Mostra le prime righe
tail    # Mostra le ultime righe
wc      # Conta caratteri, parole e righe
cut     # Estrae colonne da un file
tr      # Traduce o elimina caratteri
sed     # Editor di stream per trasformazioni di testo
awk     # Linguaggio di elaborazione di pattern
```

Esempi di utilizzo dei filtri:

```bash
# Estrarre la terza colonna da un file CSV
cat dati.csv | cut -d',' -f3

# Convertire testo in maiuscolo
echo "hello world" | tr '[:lower:]' '[:upper:]'

# Sostituire tutte le occorrenze di una parola
cat file.txt | sed 's/vecchia/nuova/g'

# Sommare i valori di una colonna
cat numeri.txt | awk '{sum += $1} END {print sum}'
```

### tee: salvare e visualizzare l'output

Il comando `tee` permette di salvare l'output in un file e contemporaneamente visualizzarlo sullo schermo:

```bash
comando | tee file       # Salva e visualizza (sovrascrive)
comando | tee -a file    # Salva e visualizza (appende)
```

Esempio:

```bash
# Visualizzare l'output e salvarlo in un file
ls -la | tee elenco_file.txt

# Aggiungere l'output a un file esistente
echo "Nuova riga" | tee -a log.txt
```

## 9.3 Formattazione dell'output con printf

Il comando `printf` offre un controllo preciso sulla formattazione dell'output, simile alla funzione printf in C.

### Sintassi di base

```bash
printf "formato" [argomenti...]
```

Esempi di utilizzo di `printf`:

```bash
# Formattazione di base
printf "Nome: %s, Età: %d\n" "Mario" 30

# Allineamento e larghezza fissa
printf "%-10s %5d\n" "Nome" "Età"
printf "%-10s %5d\n" "Mario" 30
printf "%-10s %5d\n" "Luigi" 28

# Numeri con precisione fissa
printf "Pi greco: %.4f\n" 3.14159265

# Formattazione di date
printf "Data: %02d/%02d/%04d\n" 15 3 2023
```

### Specificatori di formato comuni

```bash
%s    # Stringa
%d    # Numero intero
%f    # Numero in virgola mobile
%c    # Carattere
%x    # Numero esadecimale
%o    # Numero ottale
%e    # Notazione scientifica
%b    # Interpreta sequenze di escape
```

Opzioni di formattazione:

```bash
%-10s  # Allineamento a sinistra, larghezza 10
%10s   # Allineamento a destra, larghezza 10
%03d   # Riempimento con zeri, larghezza 3
%.2f   # Precisione di 2 decimali
```

## 9.4 Colori e stili ANSI

Le sequenze di escape ANSI permettono di colorare e formattare il testo nel terminale.

### Codici di colore di base

```bash
# Colori di testo
\e[30m    # Nero
\e[31m    # Rosso
\e[32m    # Verde
\e[33m    # Giallo
\e[34m    # Blu
\e[35m    # Magenta
\e[36m    # Ciano
\e[37m    # Bianco
\e[0m     # Reset (torna al colore predefinito)

# Colori di sfondo
\e[40m    # Sfondo nero
\e[41m    # Sfondo rosso
\e[42m    # Sfondo verde
\e[43m    # Sfondo giallo
\e[44m    # Sfondo blu
\e[45m    # Sfondo magenta
\e[46m    # Sfondo ciano
\e[47m    # Sfondo bianco
```

Nota: In alcuni sistemi, `\e` può essere sostituito con `\033` o `\x1b`.

### Stili di testo

```bash
\e[1m     # Grassetto
\e[2m     # Tenue
\e[3m     # Corsivo
\e[4m     # Sottolineato
\e[5m     # Lampeggiante
\e[7m     # Invertito (scambia colore testo e sfondo)
\e[9m     # Barrato
```

Esempi di utilizzo dei colori:

```bash
#!/bin/bash

# Definizione di variabili per i colori
ROSSO="\e[31m"
VERDE="\e[32m"
GIALLO="\e[33m"
RESET="\e[0m"
GRASSETTO="\e[1m"

# Utilizzo dei colori
echo -e "${ROSSO}Questo testo è rosso${RESET}"
echo -e "${VERDE}Questo testo è verde${RESET}"
echo -e "${GIALLO}${GRASSETTO}Questo testo è giallo e in grassetto${RESET}"

# Combinazione di colori e stili
echo -e "\e[1;33;44mTesto in grassetto, giallo su sfondo blu\e[0m"
```

Nota: L'opzione `-e` del comando `echo` è necessaria per interpretare le sequenze di escape.

### Funzioni per semplificare l'uso dei colori

```bash
#!/bin/bash

# Funzione per colorare il testo
colora() {
    local colore=$1
    local testo=$2
    local reset="\e[0m"
    
    case $colore in
        "rosso")    echo -e "\e[31m$testo$reset" ;;
        "verde")    echo -e "\e[32m$testo$reset" ;;
        "giallo")   echo -e "\e[33m$testo$reset" ;;
        "blu")      echo -e "\e[34m$testo$reset" ;;
        "magenta")  echo -e "\e[35m$testo$reset" ;;
        "ciano")    echo -e "\e[36m$testo$reset" ;;
        *)          echo "$testo" ;;
    esac
}

# Utilizzo della funzione
colora "rosso" "Messaggio di errore"
colora "verde" "Operazione completata con successo"
colora "giallo" "Attenzione: operazione in corso"
```

## 9.5 Logging

Il logging è essenziale per monitorare l'esecuzione degli script e diagnosticare problemi.

### Funzioni di logging di base

```bash
#!/bin/bash

# Definizione dei livelli di log
LOG_ERROR=0
LOG_WARNING=1
LOG_INFO=2
LOG_DEBUG=3

# Livello di log corrente (modifica questo valore per filtrare i messaggi)
LOG_LEVEL=$LOG_INFO

# Funzione di logging
log() {
    local level=$1
    local message=$2
    local timestamp=$(date "+%Y-%m-%d %H:%M:%S")
    
    # Controlla se il messaggio deve essere visualizzato in base al livello di log
    if [ $level -le $LOG_LEVEL ]; then
        case $level in
            $LOG_ERROR)
                echo -e "\e[31m[ERROR]\e[0m [$timestamp] $message" >&2
                ;;
            $LOG_WARNING)
                echo -e "\e[33m[WARNING]\e[0m [$timestamp] $message" >&2
                ;;
            $LOG_INFO)
                echo -e "\e[32m[INFO]\e[0m [$timestamp] $message"
                ;;
            $LOG_DEBUG)
                echo -e "\e[36m[DEBUG]\e[0m [$timestamp] $message"
                ;;
        esac
    fi
}

# Funzioni di utilità
error() { log $LOG_ERROR "$1"; }
warning() { log $LOG_WARNING "$1"; }
info() { log $LOG_INFO "$1"; }
debug() { log $LOG_DEBUG "$1"; }

# Esempio di utilizzo
info "Script avviato"
debug "Variabile x = 10"
warning "File di configurazione non trovato, uso valori predefiniti"
error "Impossibile connettersi al server"
```

### Logging su file

```bash
#!/bin/bash

# File di log
LOG_FILE="script.log"

# Funzione per scrivere nel file di log
log_to_file() {
    local message=$1
    local timestamp=$(date "+%Y-%m-%d %H:%M:%S")
    echo "[$timestamp] $message" >> "$LOG_FILE"
}

# Esempio di utilizzo
log_to_file "Script avviato"

# Esecuzione di un comando con logging dell'output
echo "Esecuzione del comando..."
output=$(ls -la)
status=$?

if [ $status -eq 0 ]; then
    log_to_file "Comando eseguito con successo"
    log_to_file "Output: $output"
else
    log_to_file "Errore nell'esecuzione del comando (codice: $status)"
fi

log_to_file "Script terminato"
```

### Rotazione dei file di log

```bash
#!/bin/bash

# Configurazione
LOG_FILE="script.log"
MAX_SIZE=1048576  # 1MB in byte
BACKUP_COUNT=5    # Numero di file di backup da mantenere

# Funzione per ruotare il file di log
rotate_log() {
    # Controlla se il file di log esiste
    if [ ! -f "$LOG_FILE" ]; then
        return 0
    fi
    
    # Ottiene la dimensione del file in byte
    local size=$(stat -c %s "$LOG_FILE" 2>/dev/null || stat -f %z "$LOG_FILE")
    
    # Se il file è più piccolo della dimensione massima, non fare nulla
    if [ $size -lt $MAX_SIZE ]; then
        return 0
    fi
    
    # Ruota i file di backup
    for (( i=$BACKUP_COUNT; i>0; i-- )); do
        local j=$((i-1))
        if [ $j -eq 0 ]; then
            # Rinomina il file di log originale
            if [ -f "$LOG_FILE" ]; then
                mv "$LOG_FILE" "${LOG_FILE}.1"
            fi
        else
            # Sposta i file di backup
            if [ -f "${LOG_FILE}.$j" ]; then
                mv "${LOG_FILE}.$j" "${LOG_FILE}.$i"
            fi
        fi
    done
    
    # Crea un nuovo file di log vuoto
    touch "$LOG_FILE"
    
    # Registra l'evento di rotazione
    log_to_file "File di log ruotato per dimensione ($size byte)"
    
    return 0
}

# Esempio di utilizzo con rotazione automatica
log_to_file "Inizio script con rotazione automatica dei log"

# Funzione per controllare e ruotare il log prima di ogni scrittura
log_with_rotation() {
    local message=$1
    
    # Controlla e ruota il log se necessario
    rotate_log
    
    # Scrive il messaggio nel log
    log_to_file "$message"
}

# Esempio di utilizzo
log_with_rotation "Questo messaggio verrà scritto dopo aver controllato la dimensione del log"

# Simulazione di scrittura di molti log
for i in {1..10}; do
    log_with_rotation "Messaggio di log numero $i"
done

log_with_rotation "Script terminato"