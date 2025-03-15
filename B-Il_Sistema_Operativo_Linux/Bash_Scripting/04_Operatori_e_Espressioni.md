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
echo "Hello" | grep "l\*"          # Trova zero o più "l