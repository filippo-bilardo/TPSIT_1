# Capitolo 4: Espansione aritmetica

## Introduzione

L'espansione aritmetica è una delle funzionalità più potenti di Bash, che consente di eseguire calcoli matematici direttamente negli script. Questa capacità trasforma Bash da un semplice linguaggio di scripting per l'automazione delle attività del sistema a uno strumento in grado di elaborare dati numerici ed eseguire algoritmi complessi.

In questo capitolo, esploreremo in dettaglio i meccanismi dell'espansione aritmetica in Bash, dalla sintassi di base alle operazioni avanzate. Vedremo come eseguire calcoli, utilizzare variabili in espressioni matematiche, e implementare logiche condizionali basate su valori numerici.

## Sintassi dell'espansione aritmetica

Bash offre diverse forme sintattiche per eseguire operazioni aritmetiche:

### Utilizzando la doppia parentesi (( ))

La forma più comune e leggibile per l'espansione aritmetica è l'uso delle doppie parentesi:

```bash
#!/bin/bash
# Sintassi con doppie parentesi

# Assegnazione di un valore calcolato a una variabile
risultato=$((5 + 3))
echo "5 + 3 = $risultato"

# Incremento di una variabile
contatore=1
((contatore++))
echo "Contatore dopo incremento: $contatore"

# Calcolo complesso
valore=$((10 * 2 + 5 / 2))
echo "10 * 2 + 5 / 2 = $valore"
```

### Utilizzando il comando let

Il comando `let` è un'alternativa alla doppia parentesi:

```bash
#!/bin/bash
# Sintassi con il comando let

# Assegnazione di un valore calcolato
let "risultato = 5 + 3"
echo "5 + 3 = $risultato"

# Incremento di una variabile
contatore=1
let "contatore++"
echo "Contatore dopo incremento: $contatore"

# Calcolo complesso
let "valore = 10 * 2 + 5 / 2"
echo "10 * 2 + 5 / 2 = $valore"
```

### Utilizzando la notazione $[ ]

Una forma meno comune (e considerata obsoleta in Bash moderno) è la notazione `$[ ]`:

```bash
#!/bin/bash
# Sintassi con parentesi quadre (obsoleta)

risultato=$[5 + 3]
echo "5 + 3 = $risultato"
```

È consigliabile evitare questa sintassi a favore della doppia parentesi per garantire la compatibilità con le versioni future di Bash.

## Operatori aritmetici

Bash supporta una vasta gamma di operatori aritmetici, molti dei quali sono familiari se hai esperienza con linguaggi di programmazione come C o Java.

### Operatori di base

```bash
#!/bin/bash
# Operatori aritmetici di base

echo "Addizione: $((5 + 3)) = 8"
echo "Sottrazione: $((10 - 4)) = 6"
echo "Moltiplicazione: $((6 * 7)) = 42"
echo "Divisione (intera): $((20 / 3)) = 6"  # Nota: divisione intera!
echo "Modulo (resto): $((20 % 3)) = 2"

# Operatori di assegnazione composta
numero=10
((numero += 5))  # Equivalente a numero = numero + 5
echo "Dopo += 5: $numero"

((numero -= 3))  # Equivalente a numero = numero - 3
echo "Dopo -= 3: $numero"

((numero *= 2))  # Equivalente a numero = numero * 2
echo "Dopo *= 2: $numero"

((numero /= 4))  # Equivalente a numero = numero / 4
echo "Dopo /= 4: $numero"

((numero %= 3))  # Equivalente a numero = numero % 3
echo "Dopo %= 3: $numero"
```

### Operatori di incremento e decremento

```bash
#!/bin/bash
# Operatori di incremento e decremento

contatore=5

# Pre-incremento
((++contatore))  # Incrementa prima di usare il valore
echo "Pre-incremento: $contatore"

# Post-incremento
valore=$((contatore++))  # Usa il valore, poi incrementa
echo "Post-incremento: valore=$valore, contatore=$contatore"

# Pre-decremento
((--contatore))  # Decrementa prima di usare il valore
echo "Pre-decremento: $contatore"

# Post-decremento
valore=$((contatore--))  # Usa il valore, poi decrementa
echo "Post-decremento: valore=$valore, contatore=$contatore"
```

### Operatori bitwise

Bash supporta anche operazioni a livello di bit, utili per manipolare dati binari:

```bash
#!/bin/bash
# Operatori bitwise

a=42   # 101010 in binario
b=27   # 011011 in binario

echo "AND bitwise: $((a & b)) = 10"  # 001010 in binario
echo "OR bitwise: $((a | b)) = 59"   # 111011 in binario
echo "XOR bitwise: $((a ^ b)) = 49"  # 110001 in binario
echo "NOT bitwise di a: $(( ~a ))"    # Negazione bit a bit
echo "Shift left di a: $((a << 1)) = 84"   # Sposta di 1 bit a sinistra
echo "Shift right di a: $((a >> 1)) = 21"  # Sposta di 1 bit a destra
```

### Operatori logici e di confronto

All'interno dell'espansione aritmetica, gli operatori di confronto restituiscono 1 per vero e 0 per falso:

```bash
#!/bin/bash
# Operatori di confronto e logici

a=10
b=20

echo "a == b: $((a == b))"  # 0 (falso)
echo "a != b: $((a != b))"  # 1 (vero)
echo "a < b: $((a < b))"    # 1 (vero)
echo "a <= b: $((a <= b))"  # 1 (vero)
echo "a > b: $((a > b))"    # 0 (falso)
echo "a >= b: $((a >= b))"  # 0 (falso)

# Operatori logici
echo "a < 5 E b > 15: $(( (a < 5) && (b > 15) ))"  # 0 (falso)
echo "a < 5 O b > 15: $(( (a < 5) || (b > 15) ))"  # 1 (vero)
echo "NOT (a < 5): $(( !(a < 5) ))"                # 1 (vero)
```

## Limiti dell'aritmetica in Bash

È importante comprendere che l'aritmetica in Bash ha alcuni limiti significativi:

### Precisione intera

Bash lavora solo con numeri interi. Non c'è supporto nativo per numeri a virgola mobile o decimali:

```bash
#!/bin/bash
# Limitazioni con numeri decimali

# Questo non funziona come previsto in Bash
risultato=$((10 / 3))
echo "10 / 3 = $risultato"  # Output: 3 (la parte decimale viene troncata)

# Workaround con il comando bc per calcoli decimali
if command -v bc &>/dev/null; then
    risultato_decimale=$(echo "scale=2; 10 / 3" | bc)
    echo "10 / 3 = $risultato_decimale (usando bc)"  # Output: 3.33
fi
```

### Intervallo di numeri

Bash può gestire numeri fino a un certo limite, che dipende dalla piattaforma (generalmente 64 bit nelle installazioni moderne):

```bash
#!/bin/bash
# Limiti dell'intervallo numerico

# Mostra il valore massimo intero
max_int=$((2**63 - 1))  # Su sistemi a 64 bit
echo "Massimo intero rappresentabile: $max_int"

# Overflow
echo "Tentativo di overflow: $((max_int + 1))"
```

## Variabili in espressioni aritmetiche

Una delle caratteristiche più utili dell'espansione aritmetica è la facilità con cui è possibile utilizzare variabili nelle espressioni:

```bash
#!/bin/bash
# Utilizzo di variabili in espressioni aritmetiche

base=10
altezza=5

# Calcolo area rettangolo
area=$((base * altezza))
echo "Area del rettangolo: $area"

# Calcolo perimetro rettangolo
perimetro=$((2 * (base + altezza)))
echo "Perimetro del rettangolo: $perimetro"

# Utilizzo di variabili calcolate
lato_maggiore=$((base > altezza ? base : altezza))
echo "Lato maggiore: $lato_maggiore"
```

### Accesso a sotto-stringhe e array

L'espansione aritmetica può essere utilizzata anche per calcolare indici di array o posizioni in stringhe:

```bash
#!/bin/bash
# Utilizzo dell'aritmetica per accedere ad array e stringhe

# Array
numeri=(10 20 30 40 50)
indice=$((2 + 1))
echo "numeri[$indice] = ${numeri[$indice]}"  # Output: 40

# Stringhe
stringa="Bash è potente"
inizio=0
lunghezza=$((5 + 3))
echo "Sottostringa: ${stringa:$inizio:$lunghezza}"  # Output: Bash è p
```

## Espressioni aritmetiche nelle strutture di controllo

Le espressioni aritmetiche sono particolarmente utili nelle strutture di controllo come cicli e condizioni.

### In condizioni if

```bash
#!/bin/bash
# Espressioni aritmetiche in condizioni if

eta=25

if (( eta >= 18 )); then
    echo "Sei maggiorenne"
else
    echo "Sei minorenne"
fi

# Condizioni più complesse
punteggio=85
if (( punteggio >= 90 )); then
    echo "Voto: A"
elif (( punteggio >= 80 )); then
    echo "Voto: B"
elif (( punteggio >= 70 )); then
    echo "Voto: C"
else
    echo "Voto: D"
fi
```

### In cicli for e while

```bash
#!/bin/bash
# Espressioni aritmetiche nei cicli

# Ciclo for con contatore
echo "Ciclo for aritmetico:"
for (( i=1; i<=5; i++ )); do
    echo "Iterazione $i"
done

# Ciclo while aritmetico
echo "Ciclo while aritmetico:"
contatore=5
while (( contatore > 0 )); do
    echo "Conto alla rovescia: $contatore"
    (( contatore-- ))
done
```

## Operatore ternario

Bash supporta anche l'operatore ternario `?:` per espressioni condizionali compatte:

```bash
#!/bin/bash
# Operatore ternario

temperatura=25
messaggio=$((temperatura > 30 ? "fa caldo" : "temperatura gradevole"))
echo "Oggi $messaggio"

# Può essere nidificato
punteggio=75
voto=$((punteggio >= 90 ? "A" : (punteggio >= 80 ? "B" : (punteggio >= 70 ? "C" : "D"))))
echo "Il tuo voto è $voto"
```

## Esempio pratico: Calcolatrice da riga di comando

Vediamo ora un esempio concreto che utilizza l'espansione aritmetica per creare una semplice calcolatrice da riga di comando:

```bash
#!/bin/bash
# calcolatrice.sh - Una semplice calcolatrice da riga di comando

# Funzione per mostrare l'uso
mostra_aiuto() {
    echo "Uso: $0 [opzioni] operando1 operatore operando2"
    echo "Esempio: $0 5 + 3"
    echo "Operatori supportati: +, -, *, /, %, ^(potenza)"
    echo "Opzioni:"
    echo "  -h, --help    Mostra questo messaggio di aiuto"
    echo "  -v, --verbose Mostra i passaggi intermedi del calcolo"
}

# Verifica che ci siano almeno 3 argomenti
if [ $# -lt 3 ]; then
    echo "Errore: Argomenti insufficienti" >&2
    mostra_aiuto
    exit 1
fi

verbose=0
# Elabora le opzioni
while [ "${1:0:1}" = "-" ]; do
    case "$1" in
        -h|--help)
            mostra_aiuto
            exit 0
            ;;
        -v|--verbose)
            verbose=1
            shift
            ;;
        *)
            echo "Errore: Opzione non riconosciuta: $1" >&2
            mostra_aiuto
            exit 1
            ;;
    esac
done

# Ora $1 è il primo operando, $2 è l'operatore, $3 è il secondo operando
if [ $# -ne 3 ]; then
    echo "Errore: Formato non valido" >&2
    mostra_aiuto
    exit 1
fi

operando1="$1"
operatore="$2"
operando2="$3"

# Verifica che gli operandi siano numeri validi
if ! [[ "$operando1" =~ ^-?[0-9]+$ ]]; then
    echo "Errore: '$operando1' non è un numero intero valido" >&2
    exit 2
fi

if ! [[ "$operando2" =~ ^-?[0-9]+$ ]]; then
    echo "Errore: '$operando2' non è un numero intero valido" >&2
    exit 2
fi

# Esegui il calcolo
case "$operatore" in
    +)
        if [ $verbose -eq 1 ]; then
            echo "Addizione: $operando1 + $operando2"
        fi
        risultato=$((operando1 + operando2))
        ;;
    -)
        if [ $verbose -eq 1 ]; then
            echo "Sottrazione: $operando1 - $operando2"
        fi
        risultato=$((operando1 - operando2))
        ;;
    \*)
        if [ $verbose -eq 1 ]; then
            echo "Moltiplicazione: $operando1 * $operando2"
        fi
        risultato=$((operando1 * operando2))
        ;;
    /)
        if [ $verbose -eq 1 ]; then
            echo "Divisione: $operando1 / $operando2"
        fi
        if [ "$operando2" -eq 0 ]; then
            echo "Errore: Divisione per zero" >&2
            exit 3
        fi
        risultato=$((operando1 / operando2))
        ;;
    %)
        if [ $verbose -eq 1 ]; then
            echo "Modulo: $operando1 % $operando2"
        fi
        if [ "$operando2" -eq 0 ]; then
            echo "Errore: Modulo per zero" >&2
            exit 3
        fi
        risultato=$((operando1 % operando2))
        ;;
    ^)
        if [ $verbose -eq 1 ]; then
            echo "Potenza: $operando1 ^ $operando2"
        fi
        risultato=$((operando1 ** operando2))
        ;;
    *)
        echo "Errore: Operatore '$operatore' non supportato" >&2
        mostra_aiuto
        exit 1
        ;;
esac

echo "$operando1 $operatore $operando2 = $risultato"
exit 0
```

## Esempio avanzato: Implementazione del Crivello di Eratostene

Vediamo ora un esempio più complesso che utilizza l'espansione aritmetica per implementare un algoritmo matematico, il Crivello di Eratostene per la generazione di numeri primi:

```bash
#!/bin/bash
# crivello_eratostene.sh - Implementazione del Crivello di Eratostene
# Questo script trova tutti i numeri primi fino a un limite specificato

# Funzione per mostrare l'aiuto
mostra_aiuto() {
    echo "Uso: $0 [opzioni] limite"
    echo "Genera tutti i numeri primi fino al limite specificato usando il Crivello di Eratostene."
    echo "Opzioni:"
    echo "  -h, --help      Mostra questo messaggio di aiuto"
    echo "  -v, --verbose   Mostra dettagli sull'elaborazione"
    echo "  -c, --count     Mostra solo il conteggio dei numeri primi trovati"
    echo "  -s, --sum       Calcola la somma dei numeri primi trovati"
    echo "Esempio: $0 100   # Trova tutti i numeri primi fino a 100"
}

# Inizializza le variabili
verbose=0
count_only=0
calculate_sum=0

# Elabora le opzioni
while [ "${1:0:1}" = "-" ]; do
    case "$1" in
        -h|--help)
            mostra_aiuto
            exit 0
            ;;
        -v|--verbose)
            verbose=1
            shift
            ;;
        -c|--count)
            count_only=1
            shift
            ;;
        -s|--sum)
            calculate_sum=1
            shift
            ;;
        *)
            echo "Errore: Opzione non riconosciuta: $1" >&2
            mostra_aiuto
            exit 1
            ;;
    esac
done

# Verifica che sia stato fornito il limite
if [ $# -ne 1 ]; then
    echo "Errore: È richiesto esattamente un argomento (il limite)" >&2
    mostra_aiuto
    exit 1
fi

limite="$1"

# Verifica che il limite sia un numero valido
if ! [[ "$limite" =~ ^[0-9]+$ ]]; then
    echo "Errore: '$limite' non è un numero intero positivo valido" >&2
    exit 2
fi

if (( limite < 2 )); then
    echo "Errore: Il limite deve essere almeno 2" >&2
    exit 2
fi

# Inizializza l'array per il crivello
# In Bash, possiamo usare un array associativo per rappresentare quali numeri sono primi
declare -a is_prime
for (( i=2; i<=limite; i++ )); do
    is_prime[$i]=1  # Inizialmente considera tutti i numeri come primi
done

if [ $verbose -eq 1 ]; then
    echo "Inizializzazione completata. Applicazione del crivello..."
fi

# Applica il Crivello di Eratostene
for (( p=2; p*p<=limite; p++ )); do
    # Se p è ancora marcato come primo, elimina tutti i suoi multipli
    if (( is_prime[p] == 1 )); then
        if [ $verbose -eq 1 ]; then
            echo "Trovato primo $p, eliminando i suoi multipli..."
        fi
        
        # Elimina i multipli di p
        for (( i=p*p; i<=limite; i+=p )); do
            is_prime[$i]=0
        done
    fi
done

# Raccoglie e visualizza i risultati
primi=()
for (( i=2; i<=limite; i++ )); do
    if (( is_prime[i] == 1 )); then
        primi+=($i)
    fi
done

num_primi=${#primi[@]}

if [ $count_only -eq 1 ]; then
    echo "Totale numeri primi trovati fino a $limite: $num_primi"
else
    if [ $calculate_sum -eq 1 ]; then
        sum=0
        for primo in "${primi[@]}"; do
            ((sum += primo))
        done
        echo "Numeri primi fino a $limite: ${primi[@]}"
        echo "Totale: $num_primi"
        echo "Somma: $sum"
    else
        echo "Numeri primi fino a $limite: ${primi[@]}"
        echo "Totale: $num_primi"
    fi
fi

exit 0

```

## Uso delle funzioni matematiche avanzate

Bash non dispone di funzioni matematiche avanzate integrate. Tuttavia, possiamo utilizzare comandi esterni come `bc` per calcoli più complessi:

```bash
#!/bin/bash
# Utilizzo di bc per calcoli avanzati

# Calcolo di radice quadrata
numero=16
radice=$(echo "sqrt($numero)" | bc -l)
echo "La radice quadrata di $numero è $radice"

# Calcolo trigonometrico
angolo=45
seno=$(echo "s($angolo * 3.14159 / 180)" | bc -l)
echo "Il seno di $angolo gradi è $seno"

# Logaritmo
valore=1000
logaritmo=$(echo "l($valore)" | bc -l)
echo "Il logaritmo naturale di $valore è $logaritmo"
```

## Confronto con altri strumenti aritmetici

Oltre all'espansione aritmetica integrata, Bash può sfruttare diversi strumenti esterni per calcoli più complessi:

```bash
#!/bin/bash
# Confronto tra strumenti aritmetici

espressione="3.14159 * 2^2"
echo "Calcolo di $espressione con diversi strumenti:"

# Usando bc (Basic Calculator)
risultato_bc=$(echo "$espressione" | bc -l)
echo "  bc: $risultato_bc"

# Usando expr (solo per interi)
if [[ "$espressione" =~ ^[0-9\ \+\-\*\/\%]+$ ]]; then
    risultato_expr=$(expr "$espressione")
    echo "  expr: $risultato_expr"
else
    echo "  expr: Non supporta questa espressione"
fi

# Usando awk
risultato_awk=$(awk "BEGIN {print $espressione}")
echo "  awk: $risultato_awk"

# Usando python (se disponibile)
if command -v python &>/dev/null; then
    # Sostituisce ^ con ** per la potenza in Python
    espressione_py=$(echo "$espressione" | sed 's/\^/**/g')
    risultato_py=$(python -c "import math; print($espressione_py)")
    echo "  python: $risultato_py"
fi
```

## Esercizi proposti

1. **Esercizio base**: Scrivi uno script che calcoli il fattoriale di un numero fornito come argomento.

2. **Esercizio intermedio**: Implementa uno script che generi i primi N numeri della sequenza di Fibonacci, dove N è specificato dall'utente.

3. **Esercizio avanzato**: Crea una calcolatrice che supporti operazioni in notazione postfissa (notazione polacca inversa). Ad esempio, l'input "3 4 + 5 *" dovrebbe calcolare (3+4)*5 = 35.

4. **Sfida**: Implementa un convertitore di basi che accetti un numero, la sua base originale e la base di destinazione, e mostri il numero convertito. Supporta basi da 2 a 36.

## Best Practices

1. **Preferisci la sintassi (( ))**: Utilizza la sintassi con le doppie parentesi per l'espansione aritmetica, è più leggibile e moderna.

2. **Gestisci gli errori**: Verifica sempre la validità dei dati di input prima di eseguire calcoli.

3. **Attenzione alla divisione per zero**: Implementa controlli per evitare errori di divisione per zero.

4. **Consapevolezza dei limiti**: Ricorda che Bash lavora solo con numeri interi, usa strumenti esterni come `bc` per calcoli decimali.

5. **Documenta le espressioni complesse**: Aggiungi commenti per spiegare le espressioni aritmetiche complesse.

6. **Usa variabili per i valori intermedi**: Migliora la leggibilità utilizzando variabili per memorizzare risultati intermedi in calcoli complessi.

7. **Testa i limiti**: Assicurati che i tuoi script gestiscano correttamente valori ai limiti dell'intervallo intero supportato.

8. **Semplifica con funzioni**: Per calcoli ripetuti, definisci funzioni che incapsulano la logica e migliorano la leggibilità.

## Conclusione

L'espansione aritmetica in Bash è uno strumento potente che consente di eseguire calcoli direttamente nei tuoi script, senza la necessità di ricorrere a programmi esterni. Sebbene abbia limiti intrinseci, come il supporto solo per l'aritmetica intera, copre un'ampia gamma di operazioni utili per l'automazione di sistema e l'elaborazione dei dati.

La padronanza dell'espansione aritmetica ti permetterà di creare script più potenti, flessibili ed efficienti. Combinandola con altre funzionalità di Bash, come i cicli, le condizioni e le funzioni, potrai sviluppare soluzioni eleganti per problemi complessi direttamente dalla riga di comando.

Nel prossimo capitolo, esploreremo un'altra funzionalità fondamentale di Bash: la manipolazione delle stringhe e le espressioni regolari, che ti permetteranno di elaborare e trasformare dati testuali nei tuoi script.