#!/bin/bash
echo "Salta l'iterazione corrente se il numero è dispari"
i=0
while [[ $i -lt 10 ]]; do
  ((i++))
  if [[ $((i % 2)) -ne 0 ]]; then
    continue
  fi
  echo "Number: $i"
done
