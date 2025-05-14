#!/bin/bash
# 01_verifica_file.sh

echo "Verifica Esistenza e Permessi File"

if [ "$#" -ne 1 ]; then
  echo "Uso: $0 <nome_file>"
  exit 1
fi

FILE=$1

echo "Controllo il file: $FILE"

# Controlla se il file esiste
if [ -e "$FILE" ]; then
  echo "Il file '$FILE' esiste."

  # Controlla se è un file regolare
  if [ -f "$FILE" ]; then
    echo "È un file regolare."
  elif [ -d "$FILE" ]; then
    echo "È una directory."
  else
    echo "È un tipo di file speciale (non regolare né directory)."
  fi

  # Controlla i permessi
  if [ -r "$FILE" ]; then
    echo "Hai il permesso di lettura."
  else
    echo "NON hai il permesso di lettura."
  fi

  if [ -w "$FILE" ]; then
    echo "Hai il permesso di scrittura."
  else
    echo "NON hai il permesso di scrittura."
  fi

  if [ -x "$FILE" ]; then
    echo "Hai il permesso di esecuzione."
  else
    echo "NON hai il permesso di esecuzione."
  fi

else
  echo "Errore: Il file '$FILE' non esiste."
fi

echo "Script terminato."
