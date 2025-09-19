#!/bin/bash
# Interrompe il ciclo `while` più interno
echo "Interrompe il ciclo while più interno"
i=1
while [ $i -le 5 ]; do
  echo "Iterazione esterna nr. $i"
  
  j=1
  while true; do
    echo "Ciclo interno nr. $j"
    if [ $j -eq 2 ]; then
      break
    fi
    j=$((j + 1))
  done

  i=$((i + 1))
done

