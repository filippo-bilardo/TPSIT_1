# 8. Gestione dell'Input

## 8.1 Il comando read

Il comando `read` è uno strumento fondamentale in Bash per acquisire input dall'utente o da altre fonti. Permette di leggere dati dalla standard input (tastiera) o da file e assegnarli a variabili.

### Sintassi di base

```bash
read [opzioni] [variabile1 variabile2 ...]
```

Se non viene specificata alcuna variabile, l'input viene memorizzato nella variabile predefinita `REPLY`.

Esempi di utilizzo del comando `read`:

```bash
#!/bin/bash

# Lettura di una singola variabile
echo "Come ti chiami?"
read nome
echo "Ciao, $nome!"

# Lettura di più variabili
echo "Inserisci nome e cognome:"
read nome cognome
echo "Ciao, $nome $cognome!"

# Utilizzo della variabile REPLY
echo "Inserisci la tua età:"
read
echo "Hai $REPLY anni."
```

### Opzioni utili del comando read

```bash
read -p "Prompt: "  # Visualizza un prompt
read -t 10         # Timeout dopo 10 secondi
read -s            # Modalità silenziosa (utile per password)
read -n 5          # Legge solo 5 caratteri
read -r            # Modalità raw (non interpreta backslash)
```

Esempi di utilizzo delle opzioni:

```bash
#!/bin/bash

# Utilizzo di -p per il prompt
read -p "Inserisci il tuo nome: " nome
echo "Ciao, $nome!"

# Utilizzo di -s per input nascosto (password)
read -p "Inserisci la password: " -s password
echo # Aggiunge una nuova riga
echo "Password salvata."

# Utilizzo di -n per limitare i caratteri
read -p "Inserisci un carattere: " -n 1 carattere
echo "\nHai inserito: $carattere"

# Utilizzo di -t per timeout
echo "Hai 5 secondi per rispondere:"
if read -t 5 risposta; then
    echo "Hai risposto: $risposta"
else
    echo "\nTempo scaduto!"
fi
```

## 8.2 Lettura da file

Bash offre diversi modi per leggere dati da file.

### Lettura riga per riga

```bash
#!/bin/bash

# Metodo 1: Redirezione dell'input
while read linea; do
    echo "Linea: $linea"
done < file.txt

# Metodo 2: Pipe con cat
cat file.txt | while read linea; do
    echo "Linea: $linea"
done

# Metodo 3: Utilizzo di process substitution
while read linea; do
    echo "Linea: $linea"
done < <(cat file.txt)
```

### Gestione di file con campi delimitati (CSV, TSV)

```bash
#!/bin/bash

# Lettura di un file CSV
while IFS="," read -r nome cognome email; do
    echo "Nome: $nome, Cognome: $cognome, Email: $email"
done < dati.csv

# Lettura di un file con delimitatore personalizzato
while IFS=":" read -r username password uid gid info home shell; do
    echo "Utente: $username, Shell: $shell"
done < /etc/passwd
```

### Lettura di file binari

```bash
#!/bin/bash

# Lettura di un file binario byte per byte
xxd -p file.bin | while read -n 2 byte; do
    echo "Byte: $byte"
done
```

## 8.3 Argomenti da riga di comando

Gli script Bash possono ricevere argomenti dalla riga di comando, che sono accessibili tramite variabili speciali.

### Variabili per gli argomenti

```bash
$0    # Nome dello script
$1    # Primo argomento
$2    # Secondo argomento
$@    # Tutti gli argomenti (come lista)
$*    # Tutti gli argomenti (come stringa)
$#    # Numero di argomenti
```

Esempio di utilizzo degli argomenti:

```bash
#!/bin/bash

echo "Nome dello script: $0"
echo "Primo argomento: $1"
echo "Secondo argomento: $2"
echo "Tutti gli argomenti: $@"
echo "Numero di argomenti: $#"

# Iterazione su tutti gli argomenti
for arg in "$@"; do
    echo "Argomento: $arg"
done
```

### Controllo degli argomenti

```bash
#!/bin/bash

# Verifica se sono stati forniti argomenti
if [ $# -eq 0 ]; then
    echo "Errore: Nessun argomento fornito."
    echo "Uso: $0 <argomento1> [argomento2] ..."
    exit 1
fi

# Verifica se il primo argomento è un file esistente
if [ ! -f "$1" ]; then
    echo "Errore: Il file '$1' non esiste."
    exit 1
fi

# Elaborazione del file
echo "Elaborazione del file: $1"
# ... comandi per elaborare il file ...
```

## 8.4 Parametri posizionali

I parametri posizionali sono variabili speciali che contengono gli argomenti passati a uno script o a una funzione.

### Manipolazione dei parametri posizionali

```bash
shift       # Elimina il primo argomento e sposta tutti gli altri
shift 2     # Elimina i primi due argomenti
```

Esempio di utilizzo di `shift`:

```bash
#!/bin/bash

echo "Argomenti iniziali: $@"

# Elabora il primo argomento
echo "Primo argomento: $1"

# Rimuove il primo argomento
shift

echo "Argomenti dopo shift: $@"
echo "Nuovo primo argomento: $1"

# Elaborazione di tutti gli argomenti rimanenti
while [ $# -gt 0 ]; do
    echo "Elaborazione di: $1"
    shift
done
```

### Utilizzo in funzioni

```bash
#!/bin/bash

# Definizione di una funzione che utilizza parametri posizionali
saluta() {
    echo "Ciao, $1!"
    echo "Hai $2 anni."
    echo "Tutti i parametri: $@"
    echo "Numero di parametri: $#"
}

# Chiamata della funzione con parametri
saluta "Mario" 30 "altro parametro"
```

## 8.5 Opzioni e getopt

Per gestire opzioni in stile GNU (come `-h`, `--help`), Bash fornisce il comando `getopts`.

### Utilizzo di getopts

```bash
#!/bin/bash

# Definizione delle opzioni supportate
usage() {
    echo "Uso: $0 [-h] [-v] [-f file] [-o output] argomento"
    echo "Opzioni:"
    echo "  -h, --help     Mostra questo messaggio di aiuto"
    echo "  -v, --verbose  Attiva la modalità verbose"
    echo "  -f, --file     Specifica un file di input"
    echo "  -o, --output   Specifica un file di output"
    exit 1
}

# Inizializzazione delle variabili
verbose=false
input_file=""
output_file=""

# Parsing delle opzioni
while getopts ":hvf:o:" opt; do
    case $opt in
        h)
            usage
            ;;
        v)
            verbose=true
            ;;
        f)
            input_file="$OPTARG"
            ;;
        o)
            output_file="$OPTARG"
            ;;
        \?)
            echo "Opzione non valida: -$OPTARG"
            usage
            ;;
        :)
            echo "L'opzione -$OPTARG richiede un argomento."
            usage
            ;;
    esac
done

# Sposta l'indice dei parametri posizionali
shift $((OPTIND-1))

# Verifica se è stato fornito l'argomento richiesto
if [ $# -eq 0 ]; then
    echo "Errore: Argomento mancante."
    usage
fi

# Visualizza le impostazioni
echo "Modalità verbose: $verbose"
echo "File di input: $input_file"
echo "File di output: $output_file"
echo "Argomento: $1"

# Esecuzione dello script con le opzioni specificate
if [ "$verbose" = true ]; then
    echo "Esecuzione in modalità verbose..."
fi

# ... resto dello script ...
```

### Gestione di opzioni lunghe

Per gestire opzioni lunghe (come `--help`), è possibile utilizzare un approccio manuale:

```bash
#!/bin/bash

# Inizializzazione delle variabili
verbose=false
input_file=""
output_file=""

# Parsing delle opzioni
while [ $# -gt 0 ]; do
    case "$1" in
        -h|--help)
            echo "Uso: $0 [opzioni] argomento"
            echo "Opzioni:"
            echo "  -h, --help             Mostra questo messaggio di aiuto"
            echo "  -v, --verbose          Attiva la modalità verbose"
            echo "  -f, --file FILE        Specifica un file di input"
            echo "  -o, --output FILE      Specifica un file di output"
            exit 0
            ;;
        -v|--verbose)
            verbose=true
            shift
            ;;
        -f|--file)
            if [ -z "$2" ] || [ "${2:0:1}" = "-" ]; then
                echo "Errore: L'opzione $1 richiede un argomento."
                exit 1
            fi
            input_file="$2"
            shift 2
            ;;
        -o|--output)
            if [ -z "$2" ] || [ "${2:0:1}" = "-" ]; then
                echo "Errore: L'opzione $1 richiede un argomento."
                exit 1
            fi
            output_file="$2"
            shift 2
            ;;
        --)
            shift
            break
            ;;
        -*)
            echo "Errore: Opzione sconosciuta: $1"
            exit 1
            ;;
        *)
            break
            ;;
    esac
done

# Verifica se è stato fornito l'argomento richiesto
if [ $# -eq 0 ]; then
    echo "Errore: Argomento mancante."
    exit 1
fi

# Visualizza le impostazioni
echo "Modalità verbose: $verbose"
echo "File di input: $input_file"
echo "File di output: $output_file"
echo "Argomento: $1"

# ... resto dello script ...
```

## 8.6 Best Practices

1. **Validare sempre gli input**: Non fidarti mai degli input dell'utente, verifica sempre che siano validi prima di utilizzarli.

2. **Fornire valori predefiniti**: Quando possibile, fornisci valori predefiniti per gli input opzionali.
   ```bash
   input_file=${1:-"default.txt"}
   ```

3. **Gestire gli errori**: Fornisci messaggi di errore chiari quando l'input non è valido.

4. **Documentare l'uso**: Includi sempre un'opzione `-h` o `--help` che mostri come utilizzare lo script.

5. **Utilizzare IFS con cautela**: Quando leggi file con delimitatori personalizzati, ricorda di ripristinare il valore originale di IFS dopo l'uso.
   ```bash
   old_IFS="$IFS"
   IFS=","
   # ... operazioni con IFS modificato ...
   IFS="$old_IFS"
   ```

6. **Utilizzare -r con read**: L'opzione `-r` impedisce l'interpretazione dei backslash, rendendo la lettura più sicura.

7. **Gestire spazi nei nomi dei file**: Usa le virgolette attorno alle variabili che potrebbero contenere spazi.
   ```bash
   while read -r linea; do
       echo "Linea: $linea"
   done < "$file"
   ```

## 8.7 Esercizi

1. Scrivi uno script che chieda all'utente di inserire il suo nome e la sua età, quindi stampi un messaggio personalizzato.

2. Scrivi uno script che legga un file CSV contenente nomi e email, e stampi ogni record in un formato leggibile.

3. Scrivi uno script che accetti opzioni da riga di comando per specificare un file di input, un file di output e una modalità di elaborazione (es. `-m copy`, `-m convert`).

4. Scrivi uno script che legga un file riga per riga, conti il numero di parole in ogni riga e stampi il risultato.

5. Scrivi uno script che chieda all'utente di inserire una password, verificando che sia lunga almeno 8 caratteri e contenga almeno un numero.

## 8.8 Conclusioni

La gestione