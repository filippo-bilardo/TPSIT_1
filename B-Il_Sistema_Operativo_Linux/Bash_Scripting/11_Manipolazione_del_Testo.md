# 11. Manipolazione del Testo

## 11.1 Utilizzo di grep

Il comando `grep` (Global Regular Expression Print) è uno strumento potente per la ricerca di pattern all'interno di file di testo. È uno dei comandi più utilizzati per l'elaborazione del testo in ambiente Unix/Linux.

### Sintassi di base

```bash
grep [opzioni] pattern [file...]
```

Esempi di utilizzo di base:

```bash
# Cerca la parola "errore" in un file
grep "errore" log.txt

# Cerca in più file
grep "utente" /var/log/*.log

# Cerca ricorsivamente in una directory
grep -r "password" /etc/
```

### Opzioni comuni di grep

```bash
-i    # Ignora maiuscole/minuscole
-v    # Inverte la corrispondenza (mostra le righe che NON corrispondono)
-n    # Mostra i numeri di riga
-l    # Mostra solo i nomi dei file che contengono corrispondenze
-c    # Conta le righe corrispondenti
-r    # Ricerca ricorsiva nelle directory
-w    # Cerca solo parole intere
-A n   # Mostra n righe dopo la corrispondenza
-B n   # Mostra n righe prima della corrispondenza
-C n   # Mostra n righe prima e dopo la corrispondenza
-E    # Utilizza espressioni regolari estese
```

Esempi di utilizzo delle opzioni:

```bash
# Ignora maiuscole/minuscole
grep -i "errore" log.txt

# Mostra le righe che NON contengono "success"
grep -v "success" log.txt

# Mostra i numeri di riga
grep -n "warning" log.txt

# Mostra solo i nomi dei file
grep -l "password" /etc/*

# Conta le occorrenze
grep -c "404" access.log

# Mostra il contesto (3 righe prima e dopo)
grep -C 3 "critical error" system.log
```

### Utilizzo di espressioni regolari con grep

```bash
# Cerca righe che iniziano con "Error"
grep "^Error" log.txt

# Cerca righe che terminano con "failed"
grep "failed$" log.txt

# Cerca numeri di telefono (pattern semplice)
grep -E "[0-9]{3}-[0-9]{3}-[0-9]{4}" contatti.txt

# Cerca indirizzi email (pattern semplificato)
grep -E "[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}" email.txt
```

### Esempi di script con grep

```bash
#!/bin/bash

# Script per analizzare un file di log e estrarre errori

LOG_FILE="$1"

if [ -z "$LOG_FILE" ] || [ ! -f "$LOG_FILE" ]; then
    echo "Errore: Specificare un file di log valido."
    echo "Uso: $0 <file_log>"
    exit 1
fi

echo "Analisi del file $LOG_FILE..."

# Conta e visualizza i tipi di errori
echo "\nTipi di errori trovati:"
grep -i "error\|warning\|critical\|fatal" "$LOG_FILE" | \
    grep -o -E "(ERROR|WARNING|CRITICAL|FATAL)" | \
    sort | uniq -c | sort -nr

# Estrai gli errori più recenti
echo "\nUltimi 5 errori:"
grep -i "error" "$LOG_FILE" | tail -n 5

# Cerca errori specifici
echo "\nErrori di connessione:"
grep -i "connection\|timeout\|refused" "$LOG_FILE" | grep -i "error"

echo "\nAnalisi completata."
```

## 11.2 Utilizzo di sed

`sed` (Stream EDitor) è un potente editor di flusso che permette di eseguire trasformazioni di base sul testo.

### Sintassi di base

```bash
sed [opzioni] 'comando' [file...]
```

Il comando più comune è la sostituzione (`s`):

```bash
sed 's/pattern/sostituzione/flag' file
```

Dove le flag possono essere:
- `g`: sostituzione globale (tutte le occorrenze nella riga)
- `i`: ignora maiuscole/minuscole
- `n`: sostituisce solo la n-esima occorrenza

Esempi di sostituzione:

```bash
# Sostituisce la prima occorrenza di "vecchio" con "nuovo" in ogni riga
sed 's/vecchio/nuovo/' file.txt

# Sostituisce tutte le occorrenze
sed 's/vecchio/nuovo/g' file.txt

# Ignora maiuscole/minuscole
sed 's/errore/ERRORE/gi' log.txt

# Sostituisce solo la seconda occorrenza in ogni riga
sed 's/vecchio/nuovo/2' file.txt
```

### Altre operazioni comuni con sed

```bash
# Stampa solo le righe specificate (dalla 10 alla 20)
sed -n '10,20p' file.txt

# Elimina le righe specificate
sed '10,20d' file.txt

# Elimina le righe vuote
sed '/^$/d' file.txt

# Elimina i commenti (righe che iniziano con #)
sed '/^#/d' file.txt

# Aggiunge testo dopo una riga che corrisponde a un pattern
sed '/pattern/a\Testo da aggiungere' file.txt

# Aggiunge testo prima di una riga che corrisponde a un pattern
sed '/pattern/i\Testo da aggiungere' file.txt

# Sostituisce l'intera riga che corrisponde a un pattern
sed '/pattern/c\Nuova riga' file.txt
```

### Utilizzo di più comandi

```bash
# Esegue più comandi in sequenza
sed -e 's/vecchio/nuovo/g' -e '/pattern/d' file.txt

# Equivalente con punto e virgola
sed 's/vecchio/nuovo/g; /pattern/d' file.txt
```

### Esempi di script con sed

```bash
#!/bin/bash

# Script per formattare un file di configurazione

FILE="$1"
OUTPUT="${FILE}.formatted"

if [ -z "$FILE" ] || [ ! -f "$FILE" ]; then
    echo "Errore: Specificare un file valido."
    echo "Uso: $0 <file>"
    exit 1
fi

echo "Formattazione del file $FILE..."

# Crea una copia formattata del file
sed -e '/^#/!s/#.*//'      `# Rimuove i commenti a fine riga` \
    -e '/^$/d'             `# Rimuove le righe vuote` \
    -e 's/^[ \t]*//'        `# Rimuove gli spazi iniziali` \
    -e 's/[ \t]*$//'        `# Rimuove gli spazi finali` \
    -e 's/=[ \t]*/=/'       `# Standardizza lo spazio intorno al segno =` \
    -e 's/[ \t]*=/=/'       `# Standardizza lo spazio intorno al segno =` \
    "$FILE" > "$OUTPUT"

echo "File formattato salvato come $OUTPUT."
```

## 11.3 Utilizzo di awk

`awk` è un potente linguaggio di programmazione progettato per l'elaborazione di testo e l'estrazione di dati. È particolarmente utile per lavorare con dati tabulari.

### Sintassi di base

```bash
awk [opzioni] 'pattern {azione}' [file...]
```

Esempi di utilizzo di base:

```bash
# Stampa la prima colonna di un file
awk '{print $1}' file.txt

# Stampa la prima e la terza colonna
awk '{print $1, $3}' file.txt

# Utilizza un delimitatore diverso (due punti)
awk -F: '{print $1, $3}' /etc/passwd
```

### Variabili speciali in awk

```bash
$0     # L'intera riga corrente
$1, $2 # Il primo, secondo, ecc. campo della riga
NF     # Numero di campi nella riga corrente
NR     # Numero della riga corrente
FS     # Separatore di campo (default: spazio)
OFS    # Separatore di campo per l'output (default: spazio)
```

Esempi di utilizzo delle variabili speciali:

```bash
# Stampa il numero di riga e l'intera riga
awk '{print NR, $0}' file.txt

# Stampa l'ultimo campo di ogni riga
awk '{print $NF}' file.txt

# Cambia il separatore di output
awk -F: '{OFS=","; print $1, $3}' /etc/passwd
```

### Pattern e condizioni

```bash
# Elabora solo le righe che corrispondono a un pattern
awk '/pattern/ {print $0}' file.txt

# Elabora solo le righe in cui il primo campo è maggiore di 100
awk '$1 > 100 {print $0}' numeri.txt

# Elabora solo le righe tra 10 e 20
awk 'NR >= 10 && NR <= 20 {print $0}' file.txt
```

### Blocchi BEGIN e END

```bash
# Esegue azioni prima di elaborare il file (BEGIN) e dopo (END)
awk 'BEGIN {print "Inizio elaborazione"} \
     {print $1} \
     END {print "Fine elaborazione"}' file.txt
```

### Operazioni aritmetiche e funzioni

```bash
# Calcola la somma di una colonna
awk '{sum += $1} END {print "Somma:", sum}' numeri.txt

# Calcola la media di una colonna
awk '{sum += $1; count++} END {print "Media:", sum/count}' numeri.txt

# Trova il valore massimo in una colonna
awk 'BEGIN {max = 0} $1 > max {max = $1} END {print "Massimo:", max}' numeri.txt
```

### Esempi di script con awk

```bash
#!/bin/bash

# Script per analizzare un file CSV e generare statistiche

FILE="$1"

if [ -z "$FILE" ] || [ ! -f "$FILE" ]; then
    echo "Errore: Specificare un file CSV valido."
    echo "Uso: $0 <file_csv>"
    exit 1
fi

echo "Analisi del file $FILE..."

# Estrai le intestazioni
headers=$(head -n 1 "$FILE")
echo "Intestazioni: $headers"

# Conta il numero di righe (esclusa l'intestazione)
num_records=$(wc -l < "$FILE")
num_records=$((num_records - 1))
echo "Numero di record: $num_records"

# Calcola statistiche sulla terza colonna (assumendo che sia numerica)
echo "\nStatistiche sulla terza colonna:"
awk -F, 'NR > 1 { sum += $3; if(min == "" || $3 < min) min = $3; if(max == "" || $3 > max) max = $3 } \
     END { print "Somma: " sum; \
           print "Media: " sum/(NR-1); \
           print "Minimo: " min; \
           print "Massimo: " max }' "$FILE"

# Conta i valori unici nella seconda colonna
echo "\nValori unici nella seconda colonna:"
awk -F, 'NR > 1 { count[$2]++ } \
     END { for (val in count) print val ": " count[val] }' "$FILE" | sort

echo "\nAnalisi completata."
```

## 11.4 Elaborazione di CSV e dati strutturati

L'elaborazione di file CSV (Comma-Separated Values) e altri dati strutturati è un'operazione comune negli script Bash.

### Lettura di file CSV

```bash
#!/bin/bash

# Lettura di un file CSV con intestazione
FILE="dati.csv"

# Leggi l'intestazione
IFS=, read -r header < "$FILE"
echo "Intestazione: $header"

# Leggi i dati riga per riga, saltando l'intestazione
tail -n +2 "$FILE" | while IFS=, read -r col1 col2 col3 resto; do
    echo "Colonna 1: $col1, Colonna 2: $col2, Colonna 3: $col3"
    # Elabora i dati...
done
```

### Conversione tra formati

```bash
#!/bin/bash

# Converti da CSV a formato tabulare
FILE="dati.csv"
OUTPUT="dati.txt"

# Converti le virgole in tabulazioni
sed 's/,/\t/g' "$FILE" > "$OUTPUT"
echo "File convertito in formato tabulare: $OUTPUT"