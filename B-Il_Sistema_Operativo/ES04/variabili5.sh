#!/bin/bash

funzione_test() {
    # Definizione di variabile locale
    local variabile_locale="Valore locale"

    # Stampare il valore della variabile locale
    echo "Variabile locale all'interno della funzione: $variabile_locale"
}

# Chiamata alla funzione
funzione_test

# Tentativo di accedere alla variabile locale al di fuori della funzione
echo "Variabile locale al di fuori della funzione: $variabile_locale"


exit 0