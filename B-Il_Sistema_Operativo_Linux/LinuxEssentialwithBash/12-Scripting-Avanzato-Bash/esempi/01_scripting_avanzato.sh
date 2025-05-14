#!/bin/bash

# Esempio di tecniche avanzate di scripting Bash
# Questo script dimostra varie funzionalità avanzate di Bash

# 1. Array in Bash
echo "=== Array in Bash ==="
# Dichiarazione di un array
frutta=("mela" "banana" "arancia" "kiwi" "uva")

# Accesso agli elementi dell'array
echo "Primo frutto: ${frutta[0]}"
echo "Terzo frutto: ${frutta[2]}"

# Tutti gli elementi dell'array
echo "Tutti i frutti: ${frutta[@]}"

# Numero di elementi nell'array
echo "Numero di frutti: ${#frutta[@]}"

# Slice di array (sottoinsieme)
echo "Sottoinsieme di frutti: ${frutta[@]:1:3}"

# Aggiungere elementi all'array
frutta+=("pera" "ananas")
echo "Array aggiornato: ${frutta[@]}"

# 2. Array associativi (dizionari)
echo "\n=== Array associativi (dizionari) ==="
# Dichiarazione di un array associativo
declare -A capitali

# Assegnazione di valori
capitali["Italia"]="Roma"
capitali["Francia"]="Parigi"
capitali["Germania"]="Berlino"
capitali["Spagna"]="Madrid"

# Accesso ai valori
echo "La capitale dell'Italia è: ${capitali["Italia"]}"

# Tutte le chiavi
echo "Paesi: ${!capitali[@]}"

# Tutti i valori
echo "Capitali: ${capitali[@]}"

# 3. Espressioni regolari
echo "\n=== Espressioni regolari ==="
testo="Questo è un esempio di testo con numeri come 12345 e indirizzi email come esempio@dominio.com"

# Verifica se una stringa contiene un pattern
if [[ $texto =~ [0-9]+ ]]; then
    echo "Trovato un numero: ${BASH_REMATCH[0]}"
fi

# Estrazione di un indirizzo email
if [[ $testo =~ [a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,} ]]; then
    echo "Trovato un indirizzo email: ${BASH_REMATCH[0]}"
fi

# 4. Manipolazione avanzata delle stringhe
echo "\n=== Manipolazione avanzata delle stringhe ==="
frase="Bash è un potente linguaggio di scripting"

# Lunghezza della stringa
echo "Lunghezza della frase: ${#frase}"

# Sostituzione
echo "Sostituzione: ${frase/Bash/Shell}"

# Sostituzione globale
echo "Sostituzione globale: ${frase//i/I}"

# Sottostringa
echo "Sottostringa: ${frase:5:10}"

# Rimozione di prefisso
echo "Rimozione prefisso: ${frase#Bash}"

# Rimozione di suffisso
echo "Rimozione suffisso: ${frase%scripting}"

# 5. Parametri con valori predefiniti
echo "\n=== Parametri con valori predefiniti ==="
# Parametro non definito con valore predefinito
echo "Valore di VAR_INDEFINITA o predefinito: ${VAR_INDEFINITA:-"valore predefinito"}"

# Assegnazione se non definito
echo "Assegnazione se non definito: ${VAR_ASSEGNATA:="nuovo valore"}"
echo "Ora VAR_ASSEGNATA è: $VAR_ASSEGNATA"

# Errore se non definito
# echo "Questo genererebbe un errore: ${VAR_ERRORE:?"Variabile non definita"}"

# Valore alternativo se definito
VAR_DEFINITA="valore originale"
echo "Valore alternativo se definito: ${VAR_DEFINITA:+"valore alternativo"}"

# 6. Aritmetica avanzata
echo "\n=== Aritmetica avanzata ==="

# Operazioni aritmetiche
echo "Addizione: $((10 + 5))"
echo "Sottrazione: $((10 - 5))"
echo "Moltiplicazione: $((10 * 5))"
echo "Divisione: $((10 / 3))"
echo "Modulo: $((10 % 3))"
echo "Potenza: $((2 ** 3))"

# Incremento e decremento
x=5
echo "x prima: $x"
((x++))
echo "x dopo incremento: $x"
((x--))
echo "x dopo decremento: $x"

# Operazioni di assegnazione
x=10
((x += 5))
echo "x += 5: $x"
((x *= 2))
echo "x *= 2: $x"

# 7. Processi in background e gestione dei job
echo "\n=== Processi in background e gestione dei job ==="

# Esecuzione di un comando in background
sleep 2 &
echo "Processo sleep avviato in background con PID: $!"

# Attesa di tutti i processi in background
echo "Attesa del completamento di tutti i processi in background..."
wait
echo "Tutti i processi in background sono terminati"

# 8. Opzioni getopts per parametri da riga di comando
echo "\n=== Opzioni getopts per parametri da riga di comando ==="
echo "Esempio di utilizzo: ./script.sh -a valore1 -b -c valore2"

mostra_getopts() {
    local OPTIND opt a b c
    while getopts ":a:bc:" opt; do
        case $opt in
            a) echo "Opzione -a con valore: $OPTARG" ;;
            b) echo "Opzione -b attivata" ;;
            c) echo "Opzione -c con valore: $OPTARG" ;;
            \?) echo "Opzione non valida: -$OPTARG" ;;
            :) echo "L'opzione -$OPTARG richiede un argomento" ;;
        esac
    done
}

# Esempio di chiamata con parametri
echo "Chiamata di esempio:"
mostra_getopts -a "test" -b -c "altro"

echo "\n=== Esempio completato! ==="