#!/bin/bash
# 05_calcolatrice_semplice.sh

echo "Calcolatrice Semplice da Riga di Comando"

if [ "$#" -ne 3 ]; then
  echo "Errore: Numero di argomenti non valido."
  echo "Uso: $0 <numero1> <operatore> <numero2>"
  echo "Operatori supportati: +, -, *, /"
  echo "Esempio: $0 10 + 5"
  echo "Per la moltiplicazione, usare \"*\" o '*' : $0 10 \"*\" 3"
  exit 1
fi

NUM1=$1
OPERATORE=$2
NUM2=$3
RISULTATO=0

# Verifica se NUM1 e NUM2 sono numeri interi
if ! [[ "$NUM1" =~ ^-?[0-9]+$ && "$NUM2" =~ ^-?[0-9]+$ ]]; then
  echo "Errore: Gli operandi devono essere numeri interi."
  exit 1
fi

echo "Calcolo: $NUM1 $OPERATORE $NUM2"

case "$OPERATORE" in
  "+")
    RISULTATO=$((NUM1 + NUM2))
    ;;
  "-")
    RISULTATO=$((NUM1 - NUM2))
    ;;
  "*") # L'asterisco deve essere quotato o escapato sulla riga di comando
    RISULTATO=$((NUM1 * NUM2))
    ;;
  "/")
    if [ "$NUM2" -eq 0 ]; then
      echo "Errore: Divisione per zero non permessa."
      exit 1
    fi
    RISULTATO=$((NUM1 / NUM2))
    RESTO=$((NUM1 % NUM2))
    echo "(Nota: Questa è una divisione intera)"
    ;;
  *)
    echo "Errore: Operatore '$OPERATORE' non valido."
    echo "Operatori supportati: +, -, *, /"
    exit 1
    ;;
esac

echo "Risultato: $RISULTATO"
if [ "$OPERATORE" == "/" ] && [ "$NUM2" -ne 0 ]; then
  echo "Resto: $RESTO"
fi

echo "
Script terminato."
