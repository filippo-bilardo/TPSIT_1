#!/bin/bash
# Salta l'iterazione corrente se il numero è dispari
echo "Salta l'iterazione corrente se il numero è dispari"
i=0
while [[ $i -lt 10 ]]; do
  ((i++))
  if [[ $((i % 2)) -ne 0 ]]; then
    continue
  fi
  echo "Number: $i"
done

# esempio di utilizzo di continue con livello 2 di annidamento
echo -e "\n"
echo "Esempio di utilizzo di continue con livello 2 di annidamento"

i=0
while [ $i -le 5 ]; do
  echo "Iterazione esterna nr. $i"
  i=$((i + 1))

  j=1
  while [ $j -le 5 ]; do
    echo "Ciclo interno nr. $j"
    if [ $j -eq 2 ]; then
      continue 2
    fi
    j=$((j + 1))
  done

  echo "Questa riga non verrà mai stampata"
done