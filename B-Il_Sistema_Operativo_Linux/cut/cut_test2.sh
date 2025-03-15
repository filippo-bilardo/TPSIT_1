#!/bin/bash
#estrazione di dati dal file di testo dati2.txt
#Nome    Cognome     Età     Città
#Mario   Rossi       35      Roma
#Luca    Bianchi     28      Napoli
#Anna    Verdi       42      Milano

#dove i campi sono incolonnati su posizioni specifiche

echo "Estrazione del secondo campo che si trova tra colonne 9 e 15"
cut -c 9-20 dati2.txt
echo "Estrazione del TERZO campo che si trova tra colonne 30 e 40"
cut -c 21-28 dati2.txt

