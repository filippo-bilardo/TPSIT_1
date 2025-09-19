#!/bin/bash

# Numero totale di argomenti
numero_argomenti=$#

echo "Il numero totale di argomenti è: $numero_argomenti"
echo "nome del file $0"
echo "Primo argomento: $1"
echo "Secondo argomento: $2"
echo "Terzo argomento: $3"
echo "Quarto argomento: $4"
echo "Quinto argomento: $5"
echo
while [ $# -gt 0 ]; do
    echo "Argomento: $1"
    shift
done
echo
echo "Il numero totale di argomenti è: $numero_argomenti"
echo "nome del file $0"
echo "Primo argomento: $1"
echo "Secondo argomento: $2"
echo "Terzo argomento: $3"
echo "Quarto argomento: $4"
echo "Quinto argomento: $5"

