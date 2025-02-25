# Parametri posizionali e argomenti da riga di comando

## Introduzione

Quando lavoriamo con script Bash, la capacità di passare e gestire argomenti da riga di comando è fondamentale per creare strumenti flessibili e riutilizzabili. Gli argomenti permettono di modificare il comportamento di uno script senza dover modificare il codice, rendendo i nostri script più versatili e potenti.

In questo capitolo, esploreremo come gli script Bash possono ricevere, interpretare e utilizzare gli argomenti forniti dall'utente. Vedremo le variabili speciali che Bash mette a disposizione per gestire gli argomenti, come elaborare opzioni con e senza valori, e come implementare comportamenti avanzati come l'aiuto integrato e la validazione degli input.

## Le variabili degli argomenti

Bash assegna automaticamente gli argomenti passati a uno script a variabili speciali numerate. Queste variabili sono accessibili all'interno dello script e rappresentano i valori inseriti dopo il nome dello script nella riga di comando.

### Variabili posizionali

- `$0`: Nome dello script stesso
- `$1`: Primo argomento
- `$2`: Secondo argomento
- `$n`: Ennesimo argomento

### Variabili speciali per gli argomenti

- `$#`: Numero totale di argomenti passati
- `$@`: Tutti gli argomenti come elementi separati (utile nei cicli)
- `$*`: Tutti gli argomenti come una singola stringa

### Esempio di base

Vediamo un esempio semplice che mostra come accedere agli argomenti:

```bash
#!/bin/bash
# Script: argomenti_base.sh
# Descrizione: Dimostra l'uso base degli argomenti da riga di comando

echo "Nome dello script: $0"
echo "Primo argomento: $1"
echo "Secondo argomento: $2"
echo "Numero totale di argomenti: $#"
echo "Tutti gli argomenti: $@"
```

Se eseguiamo questo script con:
```
./argomenti_base.sh uno due tre
```

L'output sarà:
```
Nome dello script: ./argomenti_base.sh
Primo argomento: uno
Secondo argomento: due
Numero totale di argomenti: 3
Tutti gli argomenti: uno due tre
```

## Shift: spostare gli argomenti

Il comando `shift` è uno strumento potente per elaborare gli argomenti in sequenza. Questo comando sposta gli argomenti a sinistra, facendo diventare `$2` il nuovo `$1`, `$3` il nuovo `$2`, e così via. 

```bash
#!/bin/bash
# Script: shift_esempio.sh
# Descrizione: Dimostra l'uso del comando shift

echo "Argomenti iniziali: $@"
echo "Primo argomento: $1"

# Sposta gli argomenti di una posizione
shift
echo "Dopo shift, gli argomenti sono: $@"
echo "Nuovo primo argomento: $1"

# Sposta gli argomenti di 2 posizioni
shift 2
echo "Dopo shift 2, gli argomenti sono: $@"
echo "Nuovo primo argomento: $1"
```

Eseguendo:
```
./shift_esempio.sh a b c d e
```

Otterremo:
```
Argomenti iniziali: a b c d e
Primo argomento: a
Dopo shift, gli argomenti sono: b c d e
Nuovo primo argomento: b
Dopo shift 2, gli argomenti sono: d e
Nuovo primo argomento: d
```

## Iterare sugli argomenti

Spesso è necessario elaborare tutti gli argomenti uno per uno. Ecco come farlo:

```bash
#!/bin/bash
# Script: itera_argomenti.sh
# Descrizione: Mostra come iterare su tutti gli argomenti

echo "Elaborazione di $# argomenti"

# Metodo 1: usando $@
for argomento in "$@"
do
    echo "Elaboro l'argomento: $argomento"
done

# Metodo 2: usando un contatore
echo "Metodo alternativo:"
i=1
while [ $i -le $# ]
do
    eval arg=\${$i}  # Questo assegna il valore della variabile $i a arg
    echo "Argomento $i: $arg"
    i=$((i+1))
done
```

## Gestire argomenti opzionali

Nella maggior parte degli script professionali, si utilizzano opzioni con trattini (come `-h` o `--help`) per controllare il comportamento dello script. Vediamo come implementare questo schema.

### Gestione di opzioni semplici

```bash
#!/bin/bash
# Script: opzioni_semplici.sh
# Descrizione: Dimostra la gestione di opzioni semplici

verbose=0
output_file=""

while [ $# -gt 0 ]
do
    case "$1" in
        -v|--verbose)
            verbose=1
            ;;
        -o|--output)
            if [ -n "$2" ]; then
                output_file="$2"
                shift  # Consuma l'argomento successivo
            else
                echo "Errore: -o richiede un nome file" >&2
                exit 1
            fi
            ;;
        -h|--help)
            echo "Uso: $0 [-v|--verbose] [-o|--output file] file..."
            echo "Opzioni:"
            echo "  -v, --verbose    Mostra informazioni dettagliate"
            echo "  -o, --output     Specifica il file di output"
            echo "  -h, --help       Mostra questo messaggio di aiuto"
            exit 0
            ;;
        -*)
            echo "Errore: Opzione sconosciuta: $1" >&2
            exit 1
            ;;
        *)
            # Non è un'opzione, quindi è un argomento regolare
            echo "Elaboro il file: $1"
            ;;
    esac
    shift  # Passa all'argomento successivo
done

if [ $verbose -eq 1 ]; then
    echo "Modalità verbose attivata"
fi

if [ -n "$output_file" ]; then
    echo "Output sarà scritto in: $output_file"
fi
```

### Utilizzo di getopts

Bash fornisce anche il comando `getopts` per semplificare la gestione delle opzioni. Questo è particolarmente utile per opzioni singolo carattere:

```bash
#!/bin/bash
# Script: getopts_esempio.sh
# Descrizione: Dimostra l'uso di getopts

# Inizializza le variabili
verbose=0
output_file=""

# Funzione di utilizzo
show_usage() {
    echo "Uso: $0 [-v] [-o file] file..."
    echo "Opzioni:"
    echo "  -v    Modalità verbose"
    echo "  -o    Specifica file di output"
    echo "  -h    Mostra questo messaggio di aiuto"
}

# Elabora le opzioni
while getopts "vo:h" opt; do
    case "$opt" in
        v)  verbose=1
            ;;
        o)  output_file="$OPTARG"
            ;;
        h)  show_usage
            exit 0
            ;;
        \?) echo "Opzione non valida: -$OPTARG" >&2
            show_usage
            exit 1
            ;;
        :)  echo "L'opzione -$OPTARG richiede un argomento." >&2
            show_usage
            exit 1
            ;;
    esac
done

# Salta le opzioni elaborate e lascia solo i file come argomenti
shift $((OPTIND-1))

# Controlla se ci sono argomenti rimanenti
if [ $# -eq 0 ]; then
    echo "Errore: Nessun file specificato" >&2
    show_usage
    exit 1
fi

# Mostra le impostazioni
if [ $verbose -eq 1 ]; then
    echo "Modalità verbose attivata"
fi

if [ -n "$output_file" ]; then
    echo "Output sarà scritto in: $output_file"
fi

# Elabora i file rimanenti
for file in "$@"; do
    echo "Elaboro il file: $file"
done
```

Note sul comando `getopts`:
- La stringa `"vo:h"` definisce le opzioni: `v` e `h` senza argomenti, `o` con argomento obbligatorio (indicato dai due punti)
- La variabile `$OPTARG` contiene il valore dell'argomento per opzioni che lo richiedono
- `$OPTIND` tiene traccia dell'indice del prossimo argomento da elaborare

## Argomenti con valori predefiniti

È una buona pratica definire valori predefiniti per gli argomenti opzionali:

```bash
#!/bin/bash
# Script: valori_predefiniti.sh
# Descrizione: Mostra come impostare valori predefiniti per gli argomenti

# Valori predefiniti
numero_iterazioni=5
messaggio="Messaggio predefinito"
modalita="normale"

# Verifica se sono stati forniti argomenti
if [ $# -ge 1 ]; then
    numero_iterazioni=$1
fi

if [ $# -ge 2 ]; then
    messaggio=$2
fi

if [ $# -ge 3 ]; then
    modalita=$3
fi

echo "Numero di iterazioni: $numero_iterazioni"
echo "Messaggio: $messaggio"
echo "Modalità: $modalita"

for (( i=1; i<=$numero_iterazioni; i++ ))
do
    echo "Iterazione $i: $messaggio (modalità: $modalita)"
done
```

## Convalida degli argomenti

Un buono script dovrebbe sempre validare gli argomenti ricevuti:

```bash
#!/bin/bash
# Script: validazione_argomenti.sh
# Descrizione: Dimostra la validazione degli argomenti

# Verifica numero argomenti
if [ $# -lt 2 ]; then
    echo "Errore: Sono richiesti almeno 2 argomenti" >&2
    echo "Uso: $0 numero file" >&2
    exit 1
fi

# Verifica che il primo argomento sia un numero
if ! [[ $1 =~ ^[0-9]+$ ]]; then
    echo "Errore: Il primo argomento deve essere un numero" >&2
    exit 2
fi

# Verifica che il file esista
if [ ! -f "$2" ]; then
    echo "Errore: Il file '$2' non esiste" >&2
    exit 3
fi

# Verifica permessi di lettura
if [ ! -r "$2" ]; then
    echo "Errore: Non hai i permessi per leggere il file '$2'" >&2
    exit 4
fi

echo "Tutti i controlli passati. Elaboro il file '$2' con parametro $1"
```

## Esempio pratico completo

Mettiamo insieme tutto quello che abbiamo imparato in un esempio completo:

```bash
#!/bin/bash
# Script: processa_file.sh
# Descrizione: Script di esempio che elabora file con varie opzioni
# Autore: Nome Autore
# Data: Data Creazione

# Funzione di aiuto
show_help() {
    echo "Uso: $0 [OPZIONI] file1 [file2 ...]"
    echo
    echo "Elabora uno o più file secondo le opzioni specificate."
    echo
    echo "Opzioni:"
    echo "  -o, --output FILE     Salva l'output in FILE anziché visualizzarlo"
    echo "  -v, --verbose         Mostra informazioni dettagliate durante l'elaborazione"
    echo "  -r, --recursive       Elabora le directory ricorsivamente"
    echo "  -f, --force           Sovrascrive i file esistenti senza chiedere"
    echo "  -p, --prefix STRINGA  Aggiunge STRINGA come prefisso alle righe"
    echo "  -c, --count           Mostra solo il conteggio delle righe elaborate"
    echo "  -h, --help            Mostra questo messaggio di aiuto"
    echo
    echo "Esempi:"
    echo "  $0 -v file.txt                 Elabora file.txt in modalità verbose"
    echo "  $0 -o output.txt file1 file2   Elabora file1 e file2 salvando in output.txt"
    echo "  $0 -r -p \"# \" directory        Elabora tutti i file in directory ricorsivamente"
    echo "                                 aggiungendo '# ' all'inizio di ogni riga"
}

# Inizializza le variabili
output_file=""
verbose=0
recursive=0
force=0
prefix=""
count_only=0
files_processed=0
lines_processed=0

# Funzione per elaborare un file
process_file() {
    local file="$1"
    
    if [ ! -r "$file" ]; then
        echo "Errore: Impossibile leggere '$file'. Saltato." >&2
        return 1
    fi
    
    if [ $verbose -eq 1 ]; then
        echo "Elaborazione di '$file'..." >&2
    fi
    
    local count=0
    
    # Se dobbiamo solo contare le righe
    if [ $count_only -eq 1 ]; then
        count=$(wc -l < "$file")
        lines_processed=$((lines_processed + count))
    else
        # Altrimenti elaboriamo effettivamente il file
        while IFS= read -r line; do
            if [ -n "$output_file" ]; then
                echo "${prefix}${line}" >> "$output_file"
            else
                echo "${prefix}${line}"
            fi
            count=$((count + 1))
        done < "$file"
        lines_processed=$((lines_processed + count))
    fi
    
    files_processed=$((files_processed + 1))
    
    if [ $verbose -eq 1 ]; then
        echo "Elaborate $count righe di '$file'" >&2
    fi
}

# Funzione per elaborare una directory ricorsivamente
process_directory() {
    local dir="$1"
    
    if [ ! -d "$dir" ] || [ ! -x "$dir" ]; then
        echo "Errore: Impossibile accedere alla directory '$dir'. Saltata." >&2
        return 1
    fi
    
    if [ $verbose -eq 1 ]; then
        echo "Esplorazione della directory '$dir'..." >&2
    fi
    
    # Per ogni elemento nella directory
    for item in "$dir"/*; do
        if [ -f "$item" ]; then
            process_file "$item"
        elif [ -d "$item" ] && [ $recursive -eq 1 ]; then
            process_directory "$item"
        fi
    done
}

# Verifica se ci sono argomenti
if [ $# -eq 0 ]; then
    echo "Errore: Nessun argomento specificato" >&2
    show_help
    exit 1
fi

# Elabora le opzioni
while [ $# -gt 0 ]; do
    case "$1" in
        -o|--output)
            if [ -n "$2" ]; then
                # Controlla se il file esiste e se dobbiamo sovrascriverlo
                if [ -e "$2" ] && [ $force -eq 0 ]; then
                    read -p "Il file '$2' esiste già. Sovrascrivere? (s/n) " answer
                    if [[ "$answer" != [Ss]* ]]; then
                        echo "Operazione annullata." >&2
                        exit 0
                    fi
                fi
                output_file="$2"
                # Se il file di output esiste, lo svuota
                > "$output_file"
                shift
            else
                echo "Errore: L'opzione -o richiede un argomento" >&2
                exit 1
            fi
            ;;
        -v|--verbose)
            verbose=1
            ;;
        -r|--recursive)
            recursive=1
            ;;
        -f|--force)
            force=1
            ;;
        -p|--prefix)
            if [ -n "$2" ]; then
                prefix="$2"
                shift
            else
                echo "Errore: L'opzione -p richiede un argomento" >&2
                exit 1
            fi
            ;;
        -c|--count)
            count_only=1
            ;;
        -h|--help)
            show_help
            exit 0
            ;;
        -*)
            echo "Errore: Opzione non riconosciuta: $1" >&2
            show_help
            exit 1
            ;;
        *)
            # Non è un'opzione, quindi elaboriamo il file o directory
            if [ -f "$1" ]; then
                process_file "$1"
            elif [ -d "$1" ]; then
                if [ $recursive -eq 1 ]; then
                    process_directory "$1"
                else
                    echo "Avviso: '$1' è una directory. Usa -r per l'elaborazione ricorsiva." >&2
                fi
            else
                echo "Errore: '$1' non è un file o una directory valida" >&2
            fi
            ;;
    esac
    shift
done

# Mostra il riepilogo se richiesto
if [ $verbose -eq 1 ] || [ $count_only -eq 1 ]; then
    echo "Riepilogo:" >&2
    echo "File elaborati: $files_processed" >&2
    echo "Righe elaborate: $lines_processed" >&2
fi

exit 0

```

## Esercizi proposti

1. **Esercizio base**: Scrivi uno script che accetti tre argomenti: un nome file, una parola da cercare, e una parola con cui sostituirla. Lo script dovrebbe leggere il file e sostituire tutte le occorrenze della parola cercata con quella nuova.

2. **Esercizio intermedio**: Crea uno script che accetti un numero variabile di file come argomenti e generi statistiche per ciascuno: numero di righe, numero di parole, numero di caratteri. Lo script dovrebbe accettare un'opzione `-s` per ordinare i risultati in base a una delle statistiche.

3. **Esercizio avanzato**: Implementa uno script che simuli il comando `find` con le opzioni principali `-name`, `-type`, `-size` e `-exec`. Lo script dovrebbe accettare una directory come argomento e cercare file che corrispondono ai criteri specificati.

4. **Sfida**: Crea uno script di backup che accetti le seguenti opzioni:
   - `-s` o `--source`: Directory da copiare (obbligatorio)
   - `-d` o `--destination`: Directory di destinazione (obbligatorio)
   - `-t` o `--type`: Tipo di backup (`full`, `incremental`, o `differential`, predefinito: `full`)
   - `-c` o `--compress`: Comprime i file copiati
   - `-e` o `--exclude`: Pattern di file da escludere (può essere specificato più volte)
   - `-v` o `--verbose`: Mostra informazioni dettagliate
   
   Lo script dovrebbe validare gli argomenti, creare un log delle operazioni, e gestire correttamente gli errori.

## Best Practices

1. **Documentazione**: Inizia sempre lo script con un blocco di commenti che descrive lo scopo, l'utilizzo e gli argomenti accettati.

2. **Aiuto integrato**: Includi sempre un'opzione `-h` o `--help` che mostra le istruzioni per l'uso dello script.

3. **Validazione**: Verifica sempre che gli argomenti siano del tipo corretto e in numero sufficiente.

4. **Valori predefiniti**: Fornisci valori predefiniti sensati per gli argomenti opzionali.

5. **Gestione degli errori**: Prevedi situazioni di errore e fornisci messaggi significativi all'utente.

6. **Convenzioni**: Segui le convenzioni standard per le opzioni:
   - Opzioni brevi con un trattino (es. `-v`)
   - Opzioni lunghe con due trattini (es. `--verbose`)
   - Le opzioni con argomento dovrebbero accettare il valore subito dopo l'opzione

7. **Esci con codici di errore**: Usa codici di uscita diversi per differenti tipi di errore, per facilitare il debug.

8. **Verbosità controllata**: Implementa un'opzione di verbosità che permetta all'utente di decidere quante informazioni lo script deve mostrare.

## Conclusione

La gestione degli argomenti da riga di comando è un aspetto fondamentale della programmazione Bash che rende i tuoi script più flessibili e professionali. Padroneggiando le tecniche presentate in questo capitolo, potrai creare script robusti e intuitivi che seguono le convenzioni standard dei comandi Unix/Linux.

Nel prossimo capitolo, esploreremo come gestire l'input/output e le redirezioni nei tuoi script Bash, permettendoti di manipolare i flussi di dati in modi ancora più potenti.
