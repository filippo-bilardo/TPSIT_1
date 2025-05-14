#!/bin/bash
# 07_break_continue_esempio.sh

echo "Esempio di Uso di 'break' e 'continue' nei Cicli"

# Esempio con 'break'
echo "Esempio con 'break': Trova il primo numero divisibile per 7 in un range."
for i in {1..20}; do
  if [ $((i % 7)) -eq 0 ]; then
    echo "Trovato! $i è divisibile per 7."
    break # Esce dal ciclo for
  fi
  echo "Controllo $i..."
done
echo "Dopo il ciclo con break."

echo ""

# Esempio con 'continue'
echo "Esempio con 'continue': Stampa solo i numeri dispari in un range."
for num in {1..10}; do
  if [ $((num % 2)) -eq 0 ]; then
    # Se il numero è pari, salta il resto del corpo del ciclo e passa all'iterazione successiva
    continue
  fi
  echo "Numero dispari: $num"
done
echo "Dopo il ciclo con continue."

echo ""

# Esempio combinato in un ciclo while
echo "Esempio combinato in un ciclo while (simula l'elaborazione di input):"
COUNT=0
while [ $COUNT -lt 10 ]; do
  COUNT=$((COUNT + 1))
  if [ $COUNT -eq 3 ]; then
    echo "Iterazione $COUNT: Saltata con 'continue'."
    continue
  fi
  if [ $COUNT -eq 7 ]; then
    echo "Iterazione $COUNT: Interrotta con 'break'."
    break
  fi
  echo "Iterazione $COUNT: Elaborata."
done
echo "Valore finale di COUNT: $COUNT"


echo "
Script terminato."
