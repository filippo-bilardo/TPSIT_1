#!/bin/bash

mia_variabile="valore esterno"

function mia_funzione {
    local mia_variabile="valore interno"
    echo "Dentro la funzione: $mia_variabile"
}

mia_funzione
echo "Fuori dalla funzione: $mia_variabile"

exit 0