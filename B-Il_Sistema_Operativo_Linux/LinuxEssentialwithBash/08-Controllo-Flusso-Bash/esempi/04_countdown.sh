#!/bin/bash
# 04_countdown.sh

echo "Countdown Script"

if [ "$#" -ne 1 ]; then
  echo "Uso: $0 <secondi>"
  echo "Esempio: $0 5"
  exit 1
fi

# Verifica se l'input è un numero intero positivo
if ! [[ "$1" =~ ^[0-9]+$ ]] || [ "$1" -le 0 ]; then
  echo "Errore: Devi fornire un numero intero positivo per i secondi."
  exit 1
fi

SECONDI=$1

echo "Countdown da $SECONDI secondi..."

# Countdown usando un ciclo while
echo "Usando 'while':"
i=$SECONDI
while [ "$i" -ge 0 ]; do
  echo "$i..."
  sleep 1 # Attende 1 secondo
  i=$((i - 1))
done
echo "Via!"

echo ""
echo "Countdown da $SECONDI secondi (usando for stile C):"
# Countdown usando un ciclo for stile C
for (( c=$SECONDI; c>=0; c-- )); do
  echo "$c..."
  sleep 1
done
echo "Fatto!"

echo "
Script terminato."
