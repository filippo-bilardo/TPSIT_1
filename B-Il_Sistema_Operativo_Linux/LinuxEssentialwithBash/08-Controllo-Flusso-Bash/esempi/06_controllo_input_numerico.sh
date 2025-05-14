#!/bin/bash
# 06_controllo_input_numerico.sh

echo "Controllo Input Numerico con Ciclo Until"

NUMERO_VALIDO=false # Flag per controllare la validità

until $NUMERO_VALIDO ; do
  read -p "Inserisci un numero intero positivo: " INPUT_UTENTE

  # Controlla se l'input è un numero intero positivo
  if [[ "$INPUT_UTENTE" =~ ^[1-9][0-9]*$ ]]; then
    echo "Hai inserito un numero valido: $INPUT_UTENTE"
    NUMERO_VALIDO=true
  elif [[ "$INPUT_UTENTE" =~ ^0$ ]]; then # Consideriamo 0 come non positivo in questo contesto
    echo "Hai inserito zero. Per favore, inserisci un numero positivo maggiore di zero."
  elif [[ "$INPUT_UTENTE" =~ ^-?[0-9]+$ ]]; then
    echo "Hai inserito un numero negativo o zero. Per favore, inserisci un numero positivo."
  else
    echo "Input non valido: '$INPUT_UTENTE'. Devi inserire solo cifre per un numero intero positivo."
  fi
  echo "---"
done

echo "Grazie per aver inserito il numero $INPUT_UTENTE."
echo "Script terminato."
