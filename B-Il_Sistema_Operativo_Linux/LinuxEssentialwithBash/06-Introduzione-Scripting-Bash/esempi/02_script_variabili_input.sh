#!/bin/bash

# Script di esempio per variabili e input dell'utente

# Definizione di una variabile
saluto="Benvenuto"

# Chiedere all'utente il suo nome
echo "Ciao! Come ti chiami?"
read nome_utente

# Utilizzare la variabile e l'input dell'utente
echo "$saluto, $nome_utente!"

# Chiedere all'utente la sua città preferita
read -p "Qual è la tua città preferita? " citta_preferita

echo "Capisco, $citta_preferita è una bella città!"

# Esempio con variabili numeriche e un semplice calcolo
read -p "Inserisci un numero: " num1
read -p "Inserisci un altro numero: " num2

somma=$((num1 + num2))

echo "La somma di $num1 e $num2 è: $somma"

echo "Script terminato."