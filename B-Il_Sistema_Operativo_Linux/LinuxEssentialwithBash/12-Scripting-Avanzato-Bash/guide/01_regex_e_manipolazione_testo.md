# Guida alle Espressioni Regolari e Manipolazione Avanzata di Testo

## Introduzione

Le espressioni regolari (regex) e gli strumenti di manipolazione del testo sono componenti fondamentali per l'elaborazione avanzata dei dati in ambiente Linux. Questa guida esplora in dettaglio questi potenti strumenti e come utilizzarli efficacemente in Bash.

## 1. Espressioni Regolari (Regex)

### 1.1 Cos'è un'Espressione Regolare?

Un'espressione regolare è una sequenza di caratteri che definisce un modello di ricerca. Viene utilizzata per trovare, estrarre o manipolare testo in base a modelli specifici.

### 1.2 Tipi di Espressioni Regolari

- **Espressioni Regolari Base (BRE)**: Supportate da strumenti come `grep` (senza l'opzione `-E`)
- **Espressioni Regolari Estese (ERE)**: Supportate da strumenti come `grep -E`, `egrep`, `sed -E`, `awk`
- **Espressioni Regolari Perl-Compatible (PCRE)**: Supportate da strumenti come `grep -P`

### 1.3 Metacaratteri Fondamentali

| Metacarattere | Descrizione | Esempio |
|--------------|-------------|--------|
| `.` | Corrisponde a qualsiasi carattere singolo | `a.c` corrisponde a "abc", "adc", ecc. |
| `^` | Corrisponde all'inizio della riga | `^Linux` corrisponde a righe che iniziano con "Linux" |
| `$` | Corrisponde alla fine della riga | `bash$` corrisponde a righe che terminano con "bash" |
| `*` | Corrisponde a zero o più occorrenze del carattere precedente | `a*b` corrisponde a "b", "ab", "aab", ecc. |
| `+` | Corrisponde a una o più occorrenze del carattere precedente (ERE) | `a+b` corrisponde a "ab", "aab", ma non a "b" |
| `?` | Corrisponde a zero o una occorrenza del carattere precedente (ERE) | `a?b` corrisponde a "b" o "ab" |
| `[]` | Classe di caratteri: corrisponde a qualsiasi carattere all'interno delle parentesi | `[abc]` corrisponde a "a", "b" o "c" |
| `[^]` | Classe di caratteri negata: corrisponde a qualsiasi carattere non all'interno delle parentesi | `[^abc]` corrisponde a qualsiasi carattere tranne "a", "b" o "c" |
| `\` | Carattere di escape: tratta il carattere speciale successivo come letterale | `\.` corrisponde a un punto letterale |

### 1.4 Intervalli e Classi Predefinite

- `[a-z]`: Corrisponde a qualsiasi lettera minuscola
- `[A-Z]`: Corrisponde a qualsiasi lettera maiuscola
- `[0-9]`: Corrisponde a qualsiasi cifra
- `[a-zA-Z0-9]`: Corrisponde a qualsiasi carattere alfanumerico
- `\w`: Equivalente a `[a-zA-Z0-9_]` (caratteri di parola)
- `\d`: Equivalente a `[0-9]` (cifre)
- `\s`: Spazi bianchi (spazio, tab, newline)

### 1.5 Quantificatori

- `{n}`: Esattamente n occorrenze
- `{n,}`: Almeno n occorrenze
- `{n,m}`: Da n a m occorrenze

### 1.6 Raggruppamento e Alternative

- `()`: Raggruppa espressioni e cattura corrispondenze
- `|`: Alternativa (OR logico)

### 1.7 Esempi Pratici di Regex

#### Validazione di un indirizzo email
```regex
[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}
```

#### Validazione di un numero di telefono italiano
```regex
(\+39)?[ ]?[0-9]{3}[ .-]?[0-9]{3}[ .-]?[0-9]{4}
```

#### Estrazione di tag HTML
```regex
<([a-z]+)[^>]*>(.*?)</\1>
```

## 2. Strumenti di Manipolazione del Testo

### 2.1 grep, egrep e fgrep

`grep` è uno strumento potente per la ricerca di pattern all'interno di file.

#### Opzioni comuni di grep

- `-E`: Utilizza espressioni regolari estese (ERE)
- `-i`: Ignora la distinzione tra maiuscole e minuscole
- `-v`: Inverte la corrispondenza (seleziona le righe che non corrispondono)
- `-r` o `-R`: Ricerca ricorsiva nelle directory
- `-l`: Mostra solo i nomi dei file con corrispondenze
- `-n`: Mostra i numeri di riga
- `-o`: Mostra solo la parte corrispondente
- `-c`: Conta le righe corrispondenti

#### Esempi di utilizzo di grep

```bash
# Cerca "error" in un file di log
grep "error" /var/log/syslog

# Cerca righe che iniziano con "user" ignorando maiuscole/minuscole
grep -i "^user" /etc/passwd

# Estrai tutti gli indirizzi IP da un file
grep -E -o "([0-9]{1,3}\.){3}[0-9]{1,3}" file.txt

# Trova tutti i file .py che contengono la parola "import"
grep -l "import" *.py
```

### 2.2 sed (Stream Editor)

`sed` è un potente editor di flusso per filtrare e trasformare il testo.

#### Comandi base di sed

- `s/pattern/replacement/`: Sostituzione
- `d`: Elimina le righe corrispondenti
- `p`: Stampa le righe corrispondenti (usato con `-n`)
- `i`: Inserisce testo prima della riga corrente
- `a`: Aggiunge testo dopo la riga corrente
- `c`: Cambia la riga corrente con un nuovo testo

#### Opzioni comuni di sed

- `-n`: Sopprime l'output predefinito
- `-i`: Modifica i file in-place
- `-E`: Utilizza espressioni regolari estese

#### Esempi di utilizzo di sed

```bash
# Sostituisci "foo" con "bar" in un file
sed 's/foo/bar/g' file.txt

# Elimina le righe vuote
sed '/^$/d' file.txt

# Estrai le righe dalla 10 alla 20
sed -n '10,20p' file.txt

# Aggiungi un prefisso a ogni riga
sed 's/^/PREFIX: /' file.txt

# Modifica un file in-place
sed -i 's/vecchio/nuovo/g' file.txt

# Estrai testo tra tag HTML
sed -n 's/.*<h1>\(.*\)<\/h1>.*/\1/p' file.html
```

### 2.3 awk

`awk` è un potente linguaggio di programmazione per l'elaborazione di testo e dati.

#### Struttura base di awk

```
awk 'pattern {azione}' file
```

#### Variabili predefinite in awk

- `$0`: L'intera riga corrente
- `$1`, `$2`, ...: Il primo campo, il secondo campo, ecc.
- `NF`: Numero di campi nella riga corrente
- `NR`: Numero della riga corrente
- `FS`: Separatore di campo (default: spazio)
- `RS`: Separatore di record (default: newline)
- `OFS`: Separatore di campo di output (default: spazio)
- `ORS`: Separatore di record di output (default: newline)

#### Esempi di utilizzo di awk

```bash
# Stampa il primo e il terzo campo di ogni riga
awk '{print $1, $3}' file.txt

# Somma i valori nella terza colonna
awk '{sum += $3} END {print sum}' file.txt

# Filtra le righe dove il secondo campo è maggiore di 10
awk '$2 > 10' file.txt

# Utilizza un separatore di campo personalizzato
awk -F':' '{print $1, $3}' /etc/passwd

# Calcola la media dei valori nella seconda colonna
awk '{sum += $2; count++} END {print sum/count}' file.txt

# Formatta l'output come una tabella
awk '{printf "%-10s %5d\n", $1, $2}' file.txt
```

## 3. Tecniche Avanzate di Manipolazione delle Stringhe in Bash

### 3.1 Operatori di Manipolazione delle Stringhe

#### Lunghezza della stringa
```bash
stringa="Hello World"
echo ${#stringa}  # Output: 11
```

#### Estrazione di sottostringhe
```bash
stringa="Hello World"
echo ${stringa:6}     # Output: World
echo ${stringa:0:5}   # Output: Hello
echo ${stringa: -5}   # Output: World (notare lo spazio prima del -)
```

#### Sostituzione di pattern
```bash
stringa="Hello World"
echo ${stringa/World/Bash}  # Sostituzione singola: Hello Bash
echo ${stringa//l/L}        # Sostituzione globale: HeLLo WorLd
```

#### Rimozione di pattern (dall'inizio)
```bash
file="script.sh.bak"
echo ${file#*.}     # Output: sh.bak (rimuove il pattern più corto dall'inizio)
echo ${file##*.}    # Output: bak (rimuove il pattern più lungo dall'inizio)
```

#### Rimozione di pattern (dalla fine)
```bash
file="script.sh.bak"
echo ${file%.*}     # Output: script.sh (rimuove il pattern più corto dalla fine)
echo ${file%%.*}    # Output: script (rimuove il pattern più lungo dalla fine)
```

#### Maiuscolo e minuscolo
```bash
stringa="Hello World"
echo ${stringa^^}    # Output: HELLO WORLD (tutto maiuscolo)
echo ${stringa,,}    # Output: hello world (tutto minuscolo)
```

### 3.2 Parametri con Valori Predefiniti

#### Utilizzo di valori predefiniti
```bash
# ${var:-default} - Usa default se var non è definita o è vuota
echo ${NOME:-"Utente"}

# ${var:=default} - Assegna default a var se non è definita o è vuota
echo ${NOME:="Utente"}
echo $NOME  # Ora NOME contiene "Utente"

# ${var:?messaggio} - Mostra un errore se var non è definita o è vuota
echo ${NOME:?"Nome non definito"}

# ${var:+alternative} - Usa alternative se var è definita e non vuota
echo ${NOME:+"Nome definito: $NOME"}
```

## 4. Combinazione di Tecniche

La vera potenza della manipolazione del testo in Linux deriva dalla combinazione di questi strumenti attraverso pipeline.

### 4.1 Esempi di Pipeline Complesse

#### Estrazione e formattazione di dati da un file CSV
```bash
cat dati.csv | \
grep -v "^#" | \
awk -F',' '{print $1, $3}' | \
sort | \
uniq -c | \
sed 's/^[ \t]*//' | \
awk '{printf "%-20s %5d\n", $2, $1}'
```

#### Analisi di file di log
```bash
cat /var/log/apache2/access.log | \
grep -E "POST|PUT" | \
grep -v "127\.0\.0\.1" | \
awk '{print $1, $7}' | \
sort | \
uniq -c | \
sort -nr | \
head -10
```

#### Generazione di report da dati strutturati
```bash
cat dati.txt | \
grep "RECORD" | \
sed 's/RECORD: \([^,]*\), ID=\([^,]*\), VAL=\([^,]*\)/\1|\2|\3/' | \
awk -F'|' '{sum[$1] += $3; count[$1]++} END {for (i in sum) printf "%-10s: %5d (avg: %.2f)\n", i, sum[i], sum[i]/count[i]}' | \
sort -k3nr
```

## 5. Risorse Aggiuntive

- [Documentazione ufficiale di grep](https://www.gnu.org/software/grep/manual/)
- [Documentazione ufficiale di sed](https://www.gnu.org/software/sed/manual/)
- [Documentazione ufficiale di awk](https://www.gnu.org/software/gawk/manual/)
- [Regex101](https://regex101.com/) - Tester online per espressioni regolari
- [The AWK Programming Language](https://ia802309.us.archive.org/25/items/pdfy-MgN0H1joIoDVoIC7/The_AWK_Programming_Language.pdf) - Libro di riferimento su AWK

## Conclusione

Le espressioni regolari e gli strumenti di manipolazione del testo sono componenti essenziali nel toolkit di ogni amministratore di sistema Linux e sviluppatore. Padroneggiare questi strumenti consente di automatizzare attività complesse di elaborazione del testo e analisi dei dati in modo efficiente ed elegante.