#!/bin/bash
# 03_funzione_status_ritorno.sh

echo "Esempio di Funzione con Status di Ritorno"

# Funzione che verifica se un file esiste e ritorna uno status code
# Ritorna 0 se il file esiste, 1 altrimenti.
verifica_file_esiste() {
  if [ "$#" -ne 1 ]; then
    echo "Errore (interno funzione): specificare un nome file."
    return 2 # Status di ritorno per errore di utilizzo della funzione
  fi

  local FILE_DA_VERIFICARE=$1
  if [ -f "$FILE_DA_VERIFICARE" ]; then
    echo "Funzione: Il file '$FILE_DA_VERIFICARE' esiste."
    return 0 # Successo
  else
    echo "Funzione: Il file '$FILE_DA_VERIFICARE' NON esiste."
    return 1 # Fallimento
  fi
}

# Creiamo un file di test
TEST_FILE="./test_file_per_status.txt"
echo "Contenuto di test" > "$TEST_FILE"

echo "Chiamo verifica_file_esiste per un file esistente ('$TEST_FILE'):"
verifica_file_esiste "$TEST_FILE"
STATUS_RITORNO=$? # Cattura lo status di ritorno dell'ultimo comando eseguito

echo "Status di ritorno della funzione: $STATUS_RITORNO"
if [ "$STATUS_RITORNO" -eq 0 ]; then
  echo "L'operazione è riuscita (file trovato)."
elif [ "$STATUS_RITORNO" -eq 1 ]; then
  echo "L'operazione è fallita (file non trovato)."
else
  echo "Errore nell'uso della funzione (status: $STATUS_RITORNO)."
fi

echo "
Chiamo verifica_file_esiste per un file NON esistente ('file_inesistente.txt'):"
verifica_file_esiste "file_inesistente.txt"
STATUS_RITORNO=$?
echo "Status di ritorno della funzione: $STATUS_RITORNO"
if [ "$STATUS_RITORNO" -eq 0 ]; then
  echo "L'operazione è riuscita (file trovato)."
elif [ "$STATUS_RITORNO" -eq 1 ]; then
  echo "L'operazione è fallita (file non trovato)."
else
  echo "Errore nell'uso della funzione (status: $STATUS_RITORNO)."
fi

# Pulizia
rm "$TEST_FILE"

echo "
Script terminato."
