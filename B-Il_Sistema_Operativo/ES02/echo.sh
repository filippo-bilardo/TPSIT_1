#!/bin/bash
# Esempi di echo

#Stampare un semplice messaggio:
echo "Ciao, mondo!"

#Stampare il valore di una variabile:
nome="Mario"
echo "Il mio nome è $nome"

#Stampare senza nuova riga:
echo -n "Inserisci un numero: "
read numero
echo "Il numero inserito è: $numero"

#Interpretare le sequenze di escape:
echo -e "Testo\tcon\ttabulazione e\nnuova riga e \"virgolette\""

#Scrivere l'output in un file:
echo "Contenuto del file" > file.txt
cat file.txt

#Aggiungere l'output a un file esistente:
echo "Altra riga" >> file.txt
cat file.txt

#Stampare l'output di un comando:
echo "Data e ora corrente: $(date)"

