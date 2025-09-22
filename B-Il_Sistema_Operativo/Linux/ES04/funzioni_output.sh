#!bin/bash

function mia_funzione {
    echo "Valore restituito"
}

# Chiamata alla funzione e cattura dell'output
risultato=$(mia_funzione)
echo $risultato #stamperà Valore restituito
exit 0