#!/bin/bash

#esempi del comando test con i numeri

mionumero=10

read -p "Indovina il numero: " tuonumero

# -eq = uguale
# -ne = diverso
# -lt = minore
# -le = minore o uguale
# -gt = maggiore
# -ge = maggiore o uguale


if test $tuonumero -eq $mionumero
then
    echo "Hai indovinato!"
else
    echo "Mi dispiace, il numero era $mionumero"
fi