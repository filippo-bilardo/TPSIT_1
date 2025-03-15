# 3. Variabili e Tipi di Dati

## 3.1 Dichiarazione e assegnazione di variabili

In Bash, le variabili vengono dichiarate e assegnate senza necessità di specificare un tipo. La sintassi di base è:

```bash
nome_variabile=valore
```

Punti importanti da ricordare:
- **Nessuno spazio** intorno al segno di uguale
- I nomi delle variabili sono **case-sensitive**
- Possono contenere lettere, numeri e underscore, ma non possono iniziare con un numero

Esempi di dichiarazione di variabili:

```bash
# Dichiarazione di variabili semplici
nome="Mario"
cognome="Rossi"
età=30

# Utilizzo delle variabili
echo "Ciao, $nome $cognome!"
echo "Hai $età anni."

# Concatenazione di stringhe
messaggio="Benvenuto, $nome!"
echo $messaggio

# Utilizzo delle parentesi graffe per delimitare il nome della variabile
echo "Il file è ${nome}_${cognome}.txt"
```

### Dichiarazione esplicita con declare

Bash offre il comando `declare` per dichiarare variabili con attributi specifici:

```bash
declare -i numero=10    # Dichiara una variabile intera
declare -r COSTANTE=42  # Dichiara una variabile di sola lettura (readonly)
declare -a array        # Dichiara un array
declare -A mappa        # Dichiara un array associativo (Bash 4.0+)
declare -x VAR=valore   # Dichiara e esporta una variabile d'ambiente
```

## 3.2 Tipi di dati in Bash

Bash ha un sistema di tipi molto semplice. Internamente, tutte le variabili sono memorizzate come stringhe, ma possono essere trattate come diversi tipi a seconda del contesto.

### Stringhe

Le stringhe sono il tipo di dato principale in Bash:

```bash
# Stringhe con apici singoli (nessuna espansione di variabili)
frase='Ciao, $nome'  # Stamperà letteralmente: Ciao, $nome

# Stringhe con apici doppi (con espansione di variabili)
nome="Mario"
frase="Ciao, $nome"  # Stamperà: Ciao, Mario

# Stringhe multilinea
messaggio="Prima riga
Seconda riga
Terza riga"
echo -e "$messaggio"  # -e abilita l'interpretazione dei caratteri di escape

# Lunghezza di una stringa
echo ${#nome}  # Stamperà: 5
```

### Numeri

Bash supporta operazioni aritmetiche su numeri interi:

```bash
# Operazioni aritmetiche
a=5
b=3

# Utilizzo della sintassi $(( ))
somma=$((a + b))
sottrazione=$((a - b))
moltiplicazione=$((a * b))
divisione=$((a / b))  # Divisione intera
modulo=$((a % b))

echo "Somma: $somma"
echo "Sottrazione: $sottrazione"
echo "Moltiplicazione: $moltiplicazione"
echo "Divisione: $divisione"
echo "Modulo: $modulo"

# Incremento e decremento
((a++))
echo "a dopo incremento: $a"
((b--))
echo "b dopo decremento: $b"
```

### Array

Bash supporta array indicizzati e, a partire dalla versione 4.0, anche array associativi:

```bash
# Array indicizzati
frutta=("mela" "banana" "arancia" "kiwi")

# Accesso agli elementi
echo "Primo frutto: ${frutta[0]}"
echo "Terzo frutto: ${frutta[2]}"

# Numero di elementi
echo "Numero di frutti: ${#frutta[@]}"

# Tutti gli elementi
echo "Tutti i frutti: ${frutta[@]}"

# Aggiungere elementi
frutta+=("pera" "ananas")

# Rimuovere elementi
unset frutta[1]  # Rimuove "banana"

# Array associativi (Bash 4.0+)
declare -A persona
persona[nome]="Mario"
persona[cognome]="Rossi"
persona[età]="30"

# Accesso agli elementi
echo "Nome: ${persona[nome]}"

# Tutte le chiavi
echo "Chiavi: ${!persona[@]}"

# Tutti i valori
echo "Valori: ${persona[@]}"
```

### Booleani

Bash non ha un tipo booleano nativo, ma utilizza i codici di uscita dei comandi (0 per successo, diverso da 0 per fallimento) per rappresentare valori di verità:

```bash
# Utilizzo di true e false
if true; then
    echo "Condizione vera"
fi

if ! false; then
    echo "Condizione negata falsa (quindi vera)"
fi

# Utilizzo dei codici di uscita
comando_esistente
if [ $? -eq 0 ]; then
    echo "Il comando ha avuto successo"
fi
```

## 3.3 Variabili d'ambiente

Le variabili d'ambiente sono variabili accessibili a tutti i processi avviati dalla shell. Sono utilizzate per configurare il comportamento del sistema e delle applicazioni.

### Visualizzare le variabili d'ambiente

```bash
# Visualizzare tutte le variabili d'ambiente
env
printenv

# Visualizzare una specifica variabile d'ambiente
echo $HOME
echo $PATH
```

### Creare e esportare variabili d'ambiente

```bash
# Creare una variabile locale
colore="blu"

# Esportare una variabile come variabile d'ambiente
export COLORE_PREFERITO="verde"

# Dichiarare e esportare in un unico comando
export EDITOR="nano"

# Aggiungere un percorso a PATH
export PATH="$PATH:/nuova/directory"
```

### Variabili d'ambiente comuni

- `HOME`: Directory home dell'utente
- `PATH`: Elenco di directory in cui cercare i comandi
- `USER`: Nome utente corrente
- `SHELL`: Shell predefinita
- `LANG`: Impostazioni di lingua e localizzazione
- `PWD`: Directory di lavoro corrente
- `OLDPWD`: Directory di lavoro precedente
- `TERM`: Tipo di terminale

## 3.4 Variabili speciali

Bash fornisce diverse variabili speciali per accedere a informazioni sul processo della shell e sugli script:

### Variabili relative allo script

- `$0`: Nome dello script
- `$1`, `$2`, ...: Parametri posizionali (argomenti passati allo script)
- `$#`: Numero di parametri posizionali
- `$@`: Tutti i parametri posizionali (come parole separate)
- `$*`: Tutti i parametri posizionali (come una singola parola)
- `$?`: Codice di uscita dell'ultimo comando eseguito
- `$$`: PID (Process ID) del processo shell corrente
- `$!`: PID dell'ultimo processo in background
- `$_`: Ultimo argomento del comando precedente

Esempio di utilizzo:

```bash
#!/bin/bash

echo "Nome dello script: $0"
echo "Primo argomento: $1"
echo "Secondo argomento: $2"
echo "Numero di argomenti: $#"
echo "Tutti gli argomenti: $@"
echo "PID della shell: $$"

ls -la
echo "Codice di uscita di ls: $?"
echo "Ultimo argomento del comando precedente: $_"

sleep 10 &
echo "PID dell'ultimo processo in background: $!"
```

## 3.5 Espansione delle variabili

L'espansione delle variabili in Bash permette di manipolare il valore delle variabili in vari modi:

### Espansione base

```bash
nome="Mario"
echo "Ciao, $nome"     # Espansione semplice
echo "Ciao, ${nome}"  # Espansione con parentesi graffe (equivalente)
```

### Espansione con valori predefiniti

```bash
# ${variabile:-valore}  # Usa 'valore' se 'variabile' è vuota o non definita
echo "Ciao, ${nome:-Ospite}"  # Se $nome è vuoto, usa "Ospite"

# ${variabile:=valore}  # Assegna 'valore' a 'variabile' se è vuota o non definita
${colore:=blu}  # Se $colore non è definito, lo imposta a "blu"

# ${variabile:+valore}  # Usa 'valore' se 'variabile' NON è vuota
echo "Colore: ${nome:+definito}"  # Se $nome è definito, stampa "definito"

# ${variabile:?messaggio}  # Stampa 'messaggio' ed esce se 'variabile' è vuota o non definita
echo "${username:?"Username non definito"}"  # Esce con errore se $username non è definito
```

### Manipolazione di stringhe

```bash
testo="Hello, World!"

# Lunghezza della stringa
echo ${#testo}  # Stampa: 13

# Sottostringa (offset, lunghezza)
echo ${testo:7:5}  # Stampa: World

# Rimozione di prefisso (pattern più corto)
echo ${testo#*,}  # Stampa: World!

# Rimozione di prefisso (pattern più lungo)
echo ${testo##*o}  # Stampa: rld!

# Rimozione di suffisso (pattern più corto)
echo ${testo%o*}  # Stampa: Hello, W

# Rimozione di suffisso (pattern più lungo)
echo ${testo%%o*}  # Stampa: Hell

# Sostituzione (prima occorrenza)
echo ${testo/o/O}  # Stampa: HellO, World!

# Sostituzione (tutte le occorrenze)
echo ${testo//o/O}  # Stampa: HellO, WOrld!

# Maiuscolo/minuscolo (Bash 4.0+)
echo ${testo^}    # Prima lettera maiuscola
echo ${testo^^}   # Tutto maiuscolo
echo ${testo,}    # Prima lettera minuscola
echo ${testo,,}   # Tutto minuscolo
```

## Best Practices

1. **Utilizzare nomi di variabili descrittivi** che riflettano il loro scopo
2. **Racchiudere le variabili tra virgolette doppie** per evitare problemi con spazi e caratteri speciali
3. **Utilizzare le parentesi graffe** per delimitare chiaramente i nomi delle variabili
4. **Dichiarare le variabili locali nelle funzioni** con `local` per evitare conflitti
5. **Utilizzare readonly o declare -r** per le costanti
6. **Evitare variabili globali** quando possibile
7. **Inizializzare le variabili** prima di utilizzarle
8. **Utilizzare nomi in MAIUSCOLO** per le costanti e le variabili d'ambiente

## Tips and Tricks

1. **Verificare se una variabile è definita**:
   ```bash
   if [ -z "${variabile+x}" ]; then
     echo "variabile non è definita"
   else
     echo "variabile è definita"
   fi
   ```

2. **Swap di variabili senza una terza variabile**:
   ```bash
   a=5; b=10
   a=$((a+b)); b=$((a-b)); a=$((a-b))
   echo "a=$a, b=$b"  # Stampa: a=10, b=5
   ```

3. **Generare una stringa casuale**:
   ```bash
   random_string=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 10 | head -n 1)
   ```

4. **Convertire una stringa in array**:
   ```bash
   IFS=', ' read -r -a array <<< "elemento1, elemento2, elemento3"
   ```

5. **Utilizzare variabili indirette (nameref in Bash 4.3+)**:
   ```bash
   declare -n ref=variabile
   ref="nuovo valore"  # Modifica il valore di 'variabile'
   ```

## Domande di Autovalutazione

1. **Quale delle seguenti è la sintassi corretta per assegnare un valore a una variabile in Bash?**
   - A) var = valore
   - B) var=valore
   - C) $var=valore
   - D) set var=valore

2. **Quale comando si utilizza per esportare una variabile nell'ambiente?**
   - A) env
   - B) set
   - C) export
   - D) declare

3. **Come si accede al terzo argomento passato a uno script Bash?**
   - A) $0
   - B) $3
   - C) $2
   - D) ${3}

4. **Quale delle seguenti espressioni restituisce la lunghezza di una stringa memorizzata