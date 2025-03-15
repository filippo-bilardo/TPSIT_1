#!/bin/bash

# script che eleva a potenza il numero passato come argomento
# il secondo argomento è l'esponente
# stampa il risultato
# esempio di utilizzo: ./es3.sh 2 3 -> 2^3 = 8
# esempio di utilizzo: ./es3.sh 10 5 -> 10^5 = 100000

echo "Script che eleva a potenza il numero passato come argomento"

# Numero totale di argomenti
numero_argomenti=$#

risultato=$(( $1 ** $2 ))

echo "il risultato di $1 elevato alla $2 è: $risultato"