#!/bin/bash

#esempi del comando test con le stringhe

mionome="pippo"

read -p "Indovina come mi chiamo: " nomeinserito

if test $mionome = $nomeinserito
then
    echo "Hai indovinato!"
else
    echo "Mi dispiace, hai sbagliato"
fi