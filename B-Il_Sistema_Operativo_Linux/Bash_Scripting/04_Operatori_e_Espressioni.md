# 4. Operatori e Espressioni

## 4.1 Operatori aritmetici

Bash supporta vari operatori aritmetici per eseguire calcoli matematici. Questi operatori possono essere utilizzati all'interno della sintassi di espansione aritmetica `$(( ))` o con il comando `let`.

### Operatori aritmetici di base

```bash
a=10
b=3

# Addizione
echo $((a + b))  # Output: 13

# Sottrazione
echo $((a - b))  # Output: 7

# Moltiplicazione
echo $((a * b))  # Output: 30

# Divisione (intera)
echo $((a / b))  # Output: 3

# Modulo (resto della divisione)
echo $((a % b))  # Output: 1

# Potenza (Bash 4.2+)
echo $((a ** b))  # Output: 1000
```

### Operatori di assegnazione

```bash
c=5

# Assegnazione semplice
c=$((c + 3))  # Equivalente a c=c+3
echo $c  # Output: 8

# Operatori di assegnazione composti
c+=5  # Equivalente a c=c+5
echo $c  # Output: 13

c-=2  # Equivalente a c=c-2
echo $c  # Output: 11

c*=3  # Equivalente a c=c*3
echo $c  # Output: 33

c/=3  # Equivalente a c=c/3
echo $c  # Output: 11

c%=5  # Equivalente a c=c%5
echo $c  # Output: 1
```

### Operatori di incremento e decremento

```bash
d=7

# Incremento
((d++))  # Post-incremento
echo $d  # Output: 8

((++d))  # Pre-incremento
echo $d  # Output: 9

# Decremento
((d--))  # Post-decremento
echo $d  # Output: 8

((--d))  # Pre-decremento
echo $d  # Output: 7
```

### Operazioni bit a bit

```bash
x=5   # In binario: 101
y=3   # In binario: 011

# AND bit a bit
echo $((x & y))  # Output: 1 (001 in binario)

# OR bit a bit
echo $((x | y))  # Output: 7 (111 in binario)

# XOR bit a bit
echo $((x ^ y))  # Output: 6 (110 in binario)

# NOT bit a bit (complemento a uno)
echo $(( ~x ))  # Output: -6 (dipende dalla rappresentazione interna)

# Shift a sinistra
echo $((x << 1))  # Output: 10 (1010 in binario)

# Shift a destra
echo $((x >> 1))  # Output: 2 (10 in binario)
```

## 4.2 Operatori di confronto

Gli operatori di confronto sono utilizzati per confrontare valori e restituire un valore booleano (vero o falso). In Bash, questi operatori possono essere utilizzati all'interno di costrutti condizionali come `if`, `while`, ecc.

### Operatori di confronto per numeri

```bash
a=10
b=20

# Utilizzo con il comando test o [ ]
if [ $a -eq $b ]; then echo "a è uguale a b"; fi
if [ $a -ne $b ]; then echo "a è diverso da b"; fi
if [ $a -lt $b ]; then echo "a è minore di b"; fi
if [ $a -le $b ]; then echo "a è minore o uguale a b"; fi
if [ $a -gt $b ]; then echo "a è maggiore di b"; fi
if [ $a -ge $b ]; then echo "a è maggiore o uguale a b"; fi

# Utilizzo con (( )) (più intuitivo per operazioni aritmetiche)
if (( a == b )); then echo "a è uguale a b"; fi
if (( a != b )); then echo "a è diverso da b"; fi
if (( a < b )); then echo "a è minore di b"; fi
if (( a <= b )); then echo "a è minore o uguale a b"; fi
if (( a > b )); then echo "a è maggiore di b"; fi
if (( a >= b )); then echo "a è maggiore o uguale a b"; fi
```

### Operatori di confronto per stringhe

```bash
str1="hello"
str2="world"

# Uguaglianza
if [ "$str1" = "$str2" ]; then echo "Le stringhe sono uguali"; fi
if [ "$str1" == "$str2" ]; then echo "Le stringhe sono uguali (alternativo)"; fi

# Disuguaglianza
if [ "$str1" != "$str2" ]; then echo "Le stringhe sono diverse"; fi

# Confronto lessicografico (ordine alfabetico)
if [[ "$str1" < "$str2" ]]; then echo "str1 viene prima di str2"; fi
if [[ "$str1" > "$str2" ]]; then echo "str1 viene dopo str2"; fi

# Verifica se una stringa è vuota o non vuota
if [ -z "$str1" ]; then echo "str1 è vuota"; fi
if [ -n "$str1" ]; then echo "str1 non è vuota"; fi
```

### Operatori di confronto per file

```bash
file="/etc/passwd"
dir="/etc"

# Verifica esistenza
if [ -e "$file" ]; then echo "Il file esiste"; fi

# Verifica tipo
if [ -f "$file" ]; then echo "È un file regolare"; fi
if [ -d "$dir" ]; then echo "È una directory"; fi
if [ -L "$file" ]; then echo "È un link simbolico"; fi

# Verifica permessi
if [ -r "$file" ]; then echo "Il file è leggibile"; fi
if [ -w "$file" ]; then echo "Il file è scrivibile"; fi
if [ -x "$file" ]; then echo "Il file è eseguibile"; fi

# Verifica dimensione
if [ -s "$file" ]; then echo "Il file non è vuoto"; fi

# Confronto tra file
if [ "$file1" -nt "$file2" ]; then echo "file1 è più recente di file2"; fi
if [ "$file1" -ot "$file2" ]; then echo "file1 è più vecchio di file2"; fi
if [ "$file1" -ef "$file2" ]; then echo "file1 e file2 sono lo stesso file"; fi
```

## 4.3 Operatori logici

Gli operatori logici permettono di combinare più condizioni in un'unica espressione.

### Operatori logici con test o [ ]

```bash
a=10
b=20

# AND logico
if [ $a -lt 20 -a $b -gt 15 ]; then echo "Entrambe le condizioni sono vere"; fi

# OR logico
if [ $a -lt 5 -o $b -gt 15 ]; then echo "Almeno una condizione è vera"; fi

# NOT logico
if [ ! $a -eq $b ]; then echo "a non è uguale a b"; fi
```

### Operatori logici con [[ ]]

```bash
# AND logico (&&)
if [[ $a -lt 20 && $b -gt 15 ]]; then echo "Entrambe le condizioni sono vere"; fi

# OR logico (||)
if [[ $a -lt 5 || $b -gt 15 ]]; then echo "Almeno una condizione è vera"; fi

# NOT logico (!)
if [[ ! $a -eq $b ]]; then echo "a non è uguale a b"; fi
```

### Operatori logici con (( ))

```bash
# AND logico (&&)
if (( a < 20 && b > 15 )); then echo "Entrambe le condizioni sono vere"; fi

# OR logico (||)
if (( a < 5 || b > 15 )); then echo "Almeno una condizione è vera"; fi

# NOT logico (!)
if (( !(a == b) )); then echo "a non è uguale a b"; fi
```

### Operatori logici a livello di comandi

```bash
# Esegui cmd2 solo se cmd1 ha successo (AND)
cmd1 && cmd2

# Esegui cmd2 solo se cmd1 fallisce (OR)
cmd1 || cmd2

# Combinazione di AND e OR
cmd1 && cmd2 || cmd3  # Se cmd1 ha successo, esegui cmd2, altrimenti esegui cmd3

# Negazione di un comando
! cmd1  # Inverte il codice di uscita di cmd1
```

## 4.4 Espressioni regolari

Le espressioni regolari (regex) sono pattern utilizzati per trovare corrispondenze all'interno di stringhe. In Bash, possono essere utilizzate con il comando `grep`, con l'operatore `=~` all'interno di `[[ ]]`, o con altri comandi come `sed` e `awk`.

### Sintassi di base delle espressioni regolari

```bash
# Caratteri letterali
echo "Hello World" | grep "Hello"  # Trova la parola "Hello"

# Metacaratteri
echo "Hello World" | grep "^H"     # Trova le righe che iniziano con "H"
echo "Hello World" | grep "d$"     # Trova le righe che terminano con "d"
echo "Hello World" | grep "."      # Trova qualsiasi carattere
echo "Hello World" | grep "H.*d"   # Trova "H" seguito da qualsiasi numero di caratteri e poi "d"

# Classi di caratteri
echo "Hello 123" | grep "[0-9]"    # Trova qualsiasi cifra
echo "Hello 123" | grep "[a-zA-Z]" # Trova qualsiasi lettera
echo "Hello 123" | grep "[^0-9]"   # Trova qualsiasi carattere che non è una cifra

# Quantificatori
echo "Hello" | grep "l\+"          # Trova una o più "l"
echo "Hello" | grep "l\?"          # Trova zero o una "l"
echo "Hello" | grep "l\*"          # Trova zero o più "l"
echo "Hello" | grep "l\{2\}"       # Trova esattamente 2 "l"
echo "Hello" | grep "l\{1,3\}"     # Trova da 1 a 3 "l"
```

### Utilizzo dell'operatore =~ in Bash

Bash fornisce l'operatore `=~` all'interno del costrutto `[[ ]]` per verificare se una stringa corrisponde a un'espressione regolare.

```bash
string="Hello 123 World"

# Verifica se la stringa contiene numeri
if [[ $string =~ [0-9]+ ]]; then
    echo "La stringa contiene numeri"
fi

# Estrazione di parti della stringa con gruppi di cattura
if [[ "user123@example.com" =~ ([a-zA-Z0-9_]+)@([a-zA-Z0-9._]+) ]]; then
    echo "Username: ${BASH_REMATCH[1]}"
    echo "Domain: ${BASH_REMATCH[2]}"
fi
```

### Esempi pratici con grep, sed e awk

```bash
# Trovare tutte le righe in un file che contengono indirizzi email
grep -E "[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}" file.txt

# Sostituire tutte le occorrenze di "apple" con "orange" in un file
sed 's/apple/orange/g' file.txt

# Estrarre tutti i numeri di telefono in formato XXX-XXX-XXXX da un file
grep -E "[0-9]{3}-[0-9]{3}-[0-9]{4}" file.txt

# Contare le occorrenze di una parola in un file
grep -o "word" file.txt | wc -l
```

## 4.5 Espansioni e sostituzioni

Bash offre vari tipi di espansioni e sostituzioni che permettono di manipolare stringhe, variabili e comandi in modo potente e flessibile.

### Espansione di variabili

```bash
name="John"

# Espansione semplice
echo $name       # Output: John
echo ${name}     # Output: John (forma esplicita)

# Espansione con valore predefinito
echo ${unset_var:-"Valore predefinito"}  # Usa "Valore predefinito" se unset_var non è impostata

# Assegnazione con valore predefinito
echo ${unset_var:="Nuovo valore"}      # Assegna "Nuovo valore" a unset_var se non è impostata

# Messaggio di errore se non impostata
# ${unset_var:?"Errore: variabile non impostata"}

# Usa valore alternativo se impostata
echo ${name:+"Nome impostato a $name"}  # Usa la stringa se name è impostata
```

### Espansione di sottostringa

```bash
text="Hello World"

# Estrazione di sottostringa (offset, lunghezza)
echo ${text:6}      # Output: World (caratteri dall'offset 6 fino alla fine)
echo ${text:0:5}    # Output: Hello (5 caratteri dall'offset 0)
echo ${text: -5}    # Output: World (ultimi 5 caratteri, nota lo spazio dopo :)
echo ${text: -5:2}  # Output: Wo (2 caratteri a partire dal quinto carattere dalla fine)
```

### Sostituzione di pattern

```bash
filename="document.txt.bak"

# Rimozione di pattern dall'inizio
echo ${filename#*.}      # Output: txt.bak (rimuove il pattern più corto dall'inizio)
echo ${filename##*.}     # Output: bak (rimuove il pattern più lungo dall'inizio)

# Rimozione di pattern dalla fine
echo ${filename%.*}      # Output: document.txt (rimuove il pattern più corto dalla fine)
echo ${filename%%.*}     # Output: document (rimuove il pattern più lungo dalla fine)

# Sostituzione di pattern
echo ${filename/txt/html}  # Output: document.html.bak (sostituisce la prima occorrenza)
echo ${filename//t/T}      # Output: documenT.TxT.bak (sostituisce tutte le occorrenze)
echo ${filename/#doc/DOC}  # Output: DOCument.txt.bak (sostituisce all'inizio)
echo ${filename/%bak/BAK}  # Output: document.txt.BAK (sostituisce alla fine)
```

### Espansione di comando

```bash
# Sintassi con backtick (obsoleta ma ancora supportata)
echo `date`

# Sintassi con $() (preferita)
echo $(date)

# Espansione nidificata
echo $(echo $(hostname))

# Espansione aritmetica
echo $((5 + 3 * 2))  # Output: 11

# Espansione di processo
cat <(ls) <(echo "---") <(ls -l)  # Concatena l'output di più comandi
```

### Espansione di brace

```bash
# Generazione di sequenze
echo {1..5}      # Output: 1 2 3 4 5
echo {a..e}      # Output: a b c d e
echo {1..10..2}  # Output: 1 3 5 7 9 (con incremento)

# Combinazioni
echo file{1,2,3}.txt  # Output: file1.txt file2.txt file3.txt
echo {jpg,png,gif}    # Output: jpg png gif

# Combinazioni nidificate
echo {a,b}{1,2}      # Output: a1 a2 b1 b2

# Applicazioni pratiche
mkdir -p backup/{data,config,logs}/{current,archive}  # Crea una struttura di directory
cp file.txt{,.bak}  # Equivalente a: cp file.txt file.txt.bak
```

## 4.6 Valutazione di espressioni

Bash offre diversi modi per valutare espressioni, sia aritmetiche che condizionali.

### Valutazione di espressioni aritmetiche

```bash
# Utilizzo di $(())
result=$((10 + 5 * 2))
echo $result  # Output: 20

# Utilizzo del comando let
let "x = 10"
let "y = x + 5"
echo $y  # Output: 15

# Utilizzo del comando expr (più lento, ma compatibile con sh)
z=$(expr 10 + 5)
echo $z  # Output: 15

# Operazioni con numeri decimali (usando bc)
result=$(echo "scale=2; 10/3" | bc)
echo $result  # Output: 3.33
```

### Valutazione di espressioni condizionali

```bash
# Utilizzo di test o [ ]
if test -f "file.txt"; then echo "Il file esiste"; fi
if [ -f "file.txt" ]; then echo "Il file esiste"; fi

# Utilizzo di [[ ]] (più potente, specifico di Bash)
if [[ -f "file.txt" && $(wc -l < "file.txt") -gt 10 ]]; then
    echo "Il file esiste ed ha più di 10 righe"
fi

# Valutazione di espressioni aritmetiche in condizioni
if (( x > 5 && y < 20 )); then
    echo "Condizione verificata"
fi
```

### Valutazione di comandi

```bash
# Utilizzo del codice di uscita
if grep -q "pattern" file.txt; then
    echo "Pattern trovato"
fi

# Cattura dell'output di un comando
output=$(ls -l)
echo "Output del comando: $output"

# Valutazione di comandi in condizioni
if command -v python3 >/dev/null 2>&1; then
    echo "Python 3 è installato"
fi
```

## 4.7 Precedenza degli operatori

Come in altri linguaggi di programmazione, Bash ha una gerarchia di precedenza per gli operatori che determina l'ordine di valutazione delle espressioni.

### Precedenza degli operatori aritmetici

Dal più alto al più basso:

1. `()` - Parentesi (raggruppamento)
2. `++`, `--` - Incremento e decremento
3. `**` - Potenza
4. `+`, `-` - Unario più e meno
5. `!`, `~` - Negazione logica e bit a bit
6. `*`, `/`, `%` - Moltiplicazione, divisione, modulo
7. `+`, `-` - Addizione, sottrazione
8. `<<`, `>>` - Shift a sinistra e a destra
9. `<`, `<=`, `>`, `>=` - Confronto
10. `==`, `!=` - Uguaglianza, disuguaglianza
11. `&` - AND bit a bit
12. `^` - XOR bit a bit
13. `|` - OR bit a bit
14. `&&` - AND logico
15. `||` - OR logico
16. `?:` - Operatore ternario
17. `=`, `+=`, `-=`, ecc. - Assegnazione

### Esempi di precedenza

```bash
# Precedenza degli operatori aritmetici
echo $((5 + 3 * 2))     # Output: 11 (3*2 viene valutato prima di 5+6)
echo $(((5 + 3) * 2))   # Output: 16 (le parentesi cambiano la precedenza)

# Precedenza degli operatori logici
if [[ $a -gt 5 && $b -lt 10 || $c -eq 15 ]]; then
    echo "Condizione verificata"
    # Equivalente a: if [[ ($a -gt 5 && $b -lt 10) || $c -eq 15 ]]
fi

# Utilizzo esplicito delle parentesi per chiarezza
if [[ ($a -gt 5 && $b -lt 10) || $c -eq 15 ]]; then
    echo "Condizione verificata con parentesi esplicite"
fi
```

Ricorda che, in caso di dubbio sulla precedenza degli operatori, è sempre consigliabile utilizzare le parentesi per rendere esplicito l'ordine di valutazione desiderato. Questo rende il codice più leggibile e meno soggetto a errori.