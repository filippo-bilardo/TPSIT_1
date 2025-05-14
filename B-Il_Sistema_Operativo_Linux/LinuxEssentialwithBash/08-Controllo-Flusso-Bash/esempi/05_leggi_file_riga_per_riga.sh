#!/bin/bash
# 05_leggi_file_riga_per_riga.sh

echo "Lettura di un File Riga per Riga"

if [ "$#" -ne 1 ]; then
  echo "Uso: $0 <nome_file_input>"
  exit 1
fi

INPUT_FILE=$1

if [ ! -f "$INPUT_FILE" ]; then
  echo "Errore: Il file '$INPUT_FILE' non è stato trovato."
  exit 1
fi

if [ ! -r "$INPUT_FILE" ]; then
  echo "Errore: Non hai i permessi per leggere il file '$INPUT_FILE'."
  exit 1
fi

echo "Contenuto del file '$INPUT_FILE':"
NUM_RIGA=1
while IFS= read -r RIGA || [[ -n "$RIGA" ]]; do
  # IFS= previene la rimozione di spazi bianchi iniziali/finali
  # -r previene l'interpretazione dei backslash
  # || [[ -n "$RIGA" ]] gestisce l'ultima riga se non termina con un newline
  echo "Riga $NUM_RIGA: $RIGA"
  NUM_RIGA=$((NUM_RIGA + 1))
done < "$INPUT_FILE"

echo "
Lettura del file completata."
echo "Script terminato."
