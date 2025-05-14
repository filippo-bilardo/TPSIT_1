#!/bin/bash

# Esempio di funzioni base in Bash
# Questo script dimostra come definire e utilizzare funzioni in Bash

# Definizione di una funzione semplice
saluta() {
    echo "Ciao a tutti!"
}

# Funzione con parametri
saluta_persona() {
    echo "Ciao, $1! Benvenuto."
}

# Funzione con valore di ritorno (usando echo)
calcola_somma() {
    local num1=$1
    local num2=$2
    local risultato=$((num1 + num2))
    echo $risultato
}

# Funzione con valore di ritorno (usando variabile globale)
calcola_prodotto() {
    local num1=$1
    local num2=$2
    RISULTATO=$((num1 * num2))
}

# Funzione con variabili locali
dimostra_scope() {
    local var_locale="Questa è una variabile locale"
    echo "All'interno della funzione: $var_locale"
    echo "All'interno della funzione, var_globale: $var_globale"
}

# Definizione di una variabile globale
var_globale="Questa è una variabile globale"

# Chiamata della funzione semplice
echo "=== Chiamata di una funzione semplice ==="
saluta

# Chiamata della funzione con parametri
echo "\n=== Chiamata di una funzione con parametri ==="
saluta_persona "Mario"
saluta_persona "Luigi"

# Chiamata della funzione con valore di ritorno (usando echo)
echo "\n=== Funzione con valore di ritorno (usando echo) ==="
risultato_somma=$(calcola_somma 5 3)
echo "La somma di 5 e 3 è: $risultato_somma"

# Chiamata della funzione con valore di ritorno (usando variabile globale)
echo "\n=== Funzione con valore di ritorno (usando variabile globale) ==="
calcola_prodotto 4 7
echo "Il prodotto di 4 e 7 è: $RISULTATO"

# Dimostrazione dello scope delle variabili
echo "\n=== Dimostrazione dello scope delle variabili ==="
dimostra_scope
echo "All'esterno della funzione, var_globale: $var_globale"
echo "All'esterno della funzione, var_locale: $var_locale" # Questa sarà vuota

# Esempio di funzione ricorsiva
echo "\n=== Funzione ricorsiva (calcolo del fattoriale) ==="
fattoriale() {
    local num=$1
    if [ $num -eq 0 ] || [ $num -eq 1 ]; then
        echo 1
    else
        local subfact=$(fattoriale $((num - 1)))
        echo $((num * subfact))
    fi
}

echo "Fattoriale di 5: $(fattoriale 5)"