# 5. Strutture Condizionali

## 5.1 Il costrutto if-then-else

Le strutture condizionali sono fondamentali in qualsiasi linguaggio di programmazione, e Bash non fa eccezione. Il costrutto `if` permette di eseguire comandi in base al verificarsi di determinate condizioni.

### Sintassi di base

```bash
if condizione; then
    # comandi da eseguire se la condizione è vera
fi
```

La forma estesa con `else` permette di specificare comandi alternativi da eseguire quando la condizione non è vera:

```bash
if condizione; then
    # comandi da eseguire se la condizione è vera
else
    # comandi da eseguire se la condizione è falsa
fi
```

Per condizioni multiple, è possibile utilizzare `elif` (else if):

```bash
if condizione1; then
    # comandi da eseguire se condizione1 è vera
elif condizione2; then
    # comandi da eseguire se condizione1 è falsa e condizione2 è vera
else
    # comandi da eseguire se tutte le condizioni sono false
fi
```

Esempi di utilizzo del costrutto `if`:

```bash
#!/bin/bash

# Esempio semplice
eta=25

if [ $eta -ge 18 ]; then
    echo "Sei maggiorenne."
else
    echo "Sei minorenne."
fi

# Esempio con elif
punteggio=75

if [ $punteggio -ge 90 ]; then
    echo "Eccellente!"
elif [ $punteggio -ge 70 ]; then
    echo "Buono."
elif [ $punteggio -ge 50 ]; then
    echo "Sufficiente."
else
    echo "Insufficiente."
fi
```

## 5.2 Test e confronti

In Bash, il comando `test` (o la sua forma equivalente con parentesi quadre `[ ]`) viene utilizzato per valutare espressioni condizionali. È importante notare che in Bash, un valore di ritorno 0 indica successo (vero), mentre un valore diverso da 0 indica fallimento (falso).

### Operatori di confronto per numeri

```bash
[ n1 -eq n2 ]  # n1 è uguale a n2
[ n1 -ne n2 ]  # n1 non è uguale a n2
[ n1 -lt n2 ]  # n1 è minore di n2
[ n1 -le n2 ]  # n1 è minore o uguale a n2
[ n1 -gt n2 ]  # n1 è maggiore di n2
[ n1 -ge n2 ]  # n1 è maggiore o uguale a n2
```

Esempio di utilizzo degli operatori di confronto per numeri:

```bash
#!/bin/bash

x=10
y=20

if [ $x -lt $y ]; then
    echo "$x è minore di $y"
fi

if [ $x -ne $y ]; then
    echo "$x non è uguale a $y"
fi
```

## 5.3 Il comando test e le parentesi quadre

Il comando `test` e la notazione con parentesi quadre `[ ]` sono equivalenti. Entrambi valutano un'espressione e restituiscono un valore di ritorno che indica se l'espressione è vera o falsa.

```bash
# Questi due comandi sono equivalenti
if test -f "$file"; then
    echo "$file esiste ed è un file regolare."
fi

if [ -f "$file" ]; then
    echo "$file esiste ed è un file regolare."
fi
```

Bash offre anche una forma estesa di test con la sintassi `[[ ]]`, che fornisce funzionalità aggiuntive rispetto a `[ ]`:

```bash
# Utilizzo di [[ ]] per pattern matching
if [[ "$stringa" == *"pattern"* ]]; then
    echo "La stringa contiene 'pattern'."
fi

# Utilizzo di [[ ]] con operatori logici
if [[ $x -gt 5 && $x -lt 15 ]]; then
    echo "$x è compreso tra 5 e 15."
fi
```

## 5.4 Operatori di confronto per stringhe e numeri

### Operatori di confronto per stringhe

```bash
[ s1 = s2 ]    # s1 è uguale a s2
[ s1 != s2 ]   # s1 non è uguale a s2
[ s1 < s2 ]    # s1 è lessicograficamente minore di s2
[ s1 > s2 ]    # s1 è lessicograficamente maggiore di s2
[ -z s1 ]      # s1 ha lunghezza zero
[ -n s1 ]      # s1 ha lunghezza non zero
```

Esempio di utilizzo degli operatori di confronto per stringhe:

```bash
#!/bin/bash

nome1="Alice"
nome2="Bob"

if [ "$nome1" = "$nome2" ]; then
    echo "I nomi sono uguali."
else
    echo "I nomi sono diversi."
fi

stringa=""
if [ -z "$stringa" ]; then
    echo "La stringa è vuota."
fi

stringa="Hello"
if [ -n "$stringa" ]; then
    echo "La stringa non è vuota."
fi
```

### Test su file

Bash offre numerosi operatori per verificare attributi di file e directory:

```bash
[ -e file ]  # file esiste
[ -f file ]  # file esiste ed è un file regolare
[ -d file ]  # file esiste ed è una directory
[ -r file ]  # file esiste ed è leggibile
[ -w file ]  # file esiste ed è scrivibile
[ -x file ]  # file esiste ed è eseguibile
[ -s file ]  # file esiste e ha dimensione maggiore di zero
```

Esempio di utilizzo dei test su file:

```bash
#!/bin/bash

file="/etc/passwd"

if [ -e "$file" ]; then
    echo "$file esiste."
    
    if [ -f "$file" ]; then
        echo "$file è un file regolare."
    fi
    
    if [ -r "$file" ]; then
        echo "$file è leggibile."
    fi
else
    echo "$file non esiste."
fi

directory="/tmp"
if [ -d "$directory" ]; then
    echo "$directory è una directory."
fi
```

## 5.5 Il costrutto case

Il costrutto `case` in Bash permette di confrontare una variabile con diversi pattern e eseguire comandi in base al pattern che corrisponde. È particolarmente utile quando si hanno molte condizioni alternative.

### Sintassi di base

```bash
case espressione in
    pattern1)
        # comandi da eseguire se espressione corrisponde a pattern1
        ;;
    pattern2)
        # comandi da eseguire se espressione corrisponde a pattern2
        ;;
    pattern3|pattern4)
        # comandi da eseguire se espressione corrisponde a pattern3 o pattern4
        ;;
    *)
        # comandi da eseguire se nessun pattern corrisponde (default)
        ;;
esac
```

Esempi di utilizzo del costrutto `case`:

```bash
#!/bin/bash

frutto="mela"

case "$frutto" in
    "mela")
        echo "Hai scelto una mela."
        ;;
    "banana")
        echo "Hai scelto una banana."
        ;;
    "arancia")
        echo "Hai scelto un'arancia."
        ;;
    *)
        echo "Frutto non riconosciuto."
        ;;
esac
```

Il costrutto `case` è particolarmente utile per gestire gli argomenti da riga di comando:

```bash
#!/bin/bash

case "$1" in
    "start")
        echo "Avvio del servizio..."
        # comandi per avviare il servizio
        ;;
    "stop")
        echo "Arresto del servizio..."
        # comandi per arrestare il servizio
        ;;
    "restart")
        echo "Riavvio del servizio..."
        # comandi per riavviare il servizio
        ;;
    "status")
        echo "Stato del servizio:"
        # comandi per mostrare lo stato del servizio
        ;;
    *)
        echo "Uso: $0 {start|stop|restart|status}"
        exit 1
        ;;
esac
```

## 5.6 Operatori logici

Bash supporta operatori logici per combinare condizioni multiple:

```bash
# Utilizzando [ ]
[ condizione1 ] && [ condizione2 ]  # AND logico
[ condizione1 ] || [ condizione2 ]  # OR logico
! [ condizione ]                    # NOT logico

# Utilizzando [[ ]]
[[ condizione1 && condizione2 ]]    # AND logico
[[ condizione1 || condizione2 ]]    # OR logico
[[ ! condizione ]]                  # NOT logico
```

Esempi di utilizzo degli operatori logici:

```bash
#!/bin/bash

eta=25
patente=true

# Utilizzando [ ]
if [ $eta -ge 18 ] && [ "$patente" = true ]; then
    echo "Puoi guidare."
else
    echo "Non puoi guidare."
fi

# Utilizzando [[ ]]
if [[ $eta -ge 18 && "$patente" = true ]]; then
    echo "Puoi guidare."
else
    echo "Non puoi guidare."
fi

# Esempio con OR logico
if [ $eta -lt 18 ] || [ "$patente" != true ]; then
    echo "Non puoi guidare."
fi

# Esempio con NOT logico
if ! [ $eta -ge 18 ]; then
    echo "Sei minorenne."
fi
```

## 5.7 Best Practices

1. **Usa le doppie parentesi quadre quando possibile**: `[[ ]]` offre più funzionalità e meno problemi rispetto a `[ ]`.

2. **Metti sempre le variabili tra virgolette**: Questo evita problemi con spazi e caratteri speciali.
   ```bash
   if [ -f "$file" ]; then
       # ...
   fi
   ```

3. **Usa indentazione coerente**: Rende il codice più leggibile.

4. **Evita di annidare troppi if**: Usa `elif` o `case` quando appropriato.

5. **Verifica sempre l'esistenza dei file prima di operare su di essi**:
   ```bash
   if [ -f "$file" ]; then
       # operazioni sul file
   else
       echo "Errore: $file non esiste."
       exit 1
   fi
   ```

## 5.8 Esercizi

1. Scrivi uno script che accetti un numero come argomento e stampi se è positivo, negativo o zero.

2. Scrivi uno script che verifichi se un file esiste. Se esiste, controlla se è una directory o un file regolare e stampa un messaggio appropriato.

3. Scrivi uno script che accetti un giorno della settimana come argomento (es. "lunedì") e stampi un messaggio diverso per ogni giorno. Usa il costrutto `case`.

4. Scrivi uno script che confronti due numeri forniti come argomenti e stampi quale è il maggiore, o se sono uguali.

5. Scrivi uno script che verifichi se l'utente che lo esegue è root (UID 0). Se non è root, stampa un messaggio di errore e termina lo script.

## 5.9 Conclusioni

Le strutture condizionali sono uno strumento fondamentale nella programmazione Bash. Il costrutto `if` e le sue varianti, insieme al costrutto `case`, permettono di creare script che prendono decisioni in base a varie condizioni. La padronanza di queste strutture è essenziale per scrivere script Bash efficaci e robusti.

Nel prossimo capitolo, esploreremo i cicli in Bash, che permettono di eseguire comandi ripetutamente in base a determinate condizioni.