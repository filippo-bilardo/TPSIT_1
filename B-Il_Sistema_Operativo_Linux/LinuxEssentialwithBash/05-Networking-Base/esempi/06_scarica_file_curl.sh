#!/bin/bash
# 06_scarica_file_curl.sh

URL_TO_DOWNLOAD="${1:-https://example.com}" # Usa il primo argomento o example.com come default
OUTPUT_FILE="downloaded_content.html"

echo "Tentativo di scaricare contenuto da: $URL_TO_DOWNLOAD"

# Scarica e mostra a schermo (output standard)
echo "
--- Contenuto dell'URL (mostrato a schermo): ---"
curl -s $URL_TO_DOWNLOAD # -s per silent mode (non mostra progress bar)

# Scarica e salva in un file
echo "

--- Download e salvataggio in $OUTPUT_FILE --- (sovrascrive se esiste)"
curl -s -o $OUTPUT_FILE $URL_TO_DOWNLOAD

if [ $? -eq 0 ]; then
  echo "Contenuto scaricato e salvato in $OUTPUT_FILE."
  echo "Prime 10 righe di $OUTPUT_FILE:"
  head -n 10 $OUTPUT_FILE
else
  echo "Errore durante il download da $URL_TO_DOWNLOAD."
fi

# Scarica solo gli header HTTP
echo "

--- Solo headers HTTP da $URL_TO_DOWNLOAD --- (comando: curl -I)"
curl -I $URL_TO_DOWNLOAD
