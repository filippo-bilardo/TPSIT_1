#!/bin/bash
echo "Esempio di utilizzo di continue con livello 2 di annidamento"
i=0
while [ $i -le 3 ]; do
  echo "Iterazione esterna nr. $i"
  i=$((i + 1))

  j=1
  while [ $j -le 3 ]; do
    echo "Ciclo interno nr. $j"
    if [ $j -eq 2 ]; then
      continue 2
    fi
    j=$((j + 1))
  done

  echo "Questa riga non verrà mai stampata"
done