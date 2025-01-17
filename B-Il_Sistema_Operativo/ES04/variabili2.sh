#!/bin/bash

mia_variabile="valore esterno"

function mia_funzione {
    mia_variabile="nuovo valore"
}

echo "Prima della chiamata: $mia_variabile"
mia_funzione
echo "Dopo la chiamata: $mia_variabile"
exit 0