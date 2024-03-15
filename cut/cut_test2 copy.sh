#!/bin/bash
echo "===== Test del comando cut ====="

echo "Estrazione del primo campo, i nomi:"
cut -d ',' -f 1 dati.txt
echo "Estrazione delle età, terzo campo:"
cut -d ',' -f 3 dati.txt
echo "Estrarre i nomi e le città:"
cut -d ',' -f 1,4 dati.txt
echo "Estrarre tutte le colonne tranne la seconda:"
cut -d ',' -f 1,3,4 dati.txt
echo

echo "===== Test del comando cut con opzioni estese ====="

echo "Estrarre i nomi e le città:"
cut --delimiter=',' --fields=1,4 dati.txt
echo "Estrarre tutte le colonne tranne la seconda:"
cut --delimiter=',' --fields=1,3,4 dati.txt
echo

echo "===== Test del comando cut con opzioni estese e output personalizzato ====="

echo "Estrarre i nomi e le città:"
cut --delimiter=',' --fields=1,4 --output-delimiter=' - ' dati.txt
echo "Estrarre tutte le colonne tranne la seconda:"
cut --delimiter=',' --fields=1,3,4 --output-delimiter=' - ' dati.txt
echo

echo "===== Test del comando cut con opzioni estese e output personalizzato con opzione estesa ====="

echo "Estrarre i nomi e le città:"
cut --delimiter=',' --fields=1,4 --output-delimiter=' - ' --output-delimiter=' -> ' dati.txt
echo "Estrarre tutte le colonne tranne la seconda:"
cut --delimiter=',' --fields=1,3,4 --output-delimiter=' - ' --output-delimiter=' -> ' dati.txt
echo


