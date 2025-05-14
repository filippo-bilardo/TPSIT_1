#!/bin/bash
# 04_funzione_cattura_output.sh

echo "Esempio di Cattura dell'Output di una Funzione"

# Funzione che produce un output (stringa)
genera_saluto_completo() {
  local NOME="$1"
  local COGNOME="$2"
  local TITOLO="Sig."

  if [ -z "$NOME" ] || [ -z "$COGNOME" ]; then
    # Invia un messaggio di errore a stderr, non all'output catturabile
    echo "Errore: Nome e cognome sono richiesti." >&2
    return 1
  fi

  # L'output che vogliamo catturare viene inviato a stdout
  echo "$TITOLO $NOME $COGNOME, benvenuto!"
}

# Chiamata della funzione e cattura del suo output standard
echo "Chiamo la funzione e catturo l'output:"
SALUTO_FORMATTATO=$(genera_saluto_completo "Mario" "Rossi")
STATUS_ULTIMO_COMANDO=$?

if [ $STATUS_ULTIMO_COMANDO -eq 0 ]; then
  echo "Output catturato: '$SALUTO_FORMATTATO'"
else
  echo "La funzione ha restituito un errore, output non significativo."
fi

echo "
Chiamo la funzione con input mancante per testare l'errore:"
OUTPUT_ERRORE=$(genera_saluto_completo "Luigi")
STATUS_ERRORE=$?

if [ $STATUS_ERRORE -ne 0 ]; then
  echo "La funzione ha segnalato un errore come previsto."
  echo "L'output catturato in caso di errore potrebbe essere vuoto o non desiderato: '$OUTPUT_ERRORE'"
fi

# Altro esempio: funzione che calcola qualcosa
calcola_quadrato() {
  local NUMERO=$1
  if ! [[ "$NUMERO" =~ ^[0-9]+$ ]]; then
    echo "Errore: input non numerico" >&2
    return 1
  fi
  echo $((NUMERO * NUMERO))
}

VALORE=5
QUADRATO_DI_VALORE=$(calcola_quadrato $VALORE)
if [ $? -eq 0 ]; then
  echo "
Il quadrato di $VALORE è $QUADRATO_DI_VALORE."
else
  echo "
Errore nel calcolo del quadrato."
fi

OUTPUT_NON_VALIDO=$(calcola_quadrato "abc")
if [ $? -ne 0 ]; then
  echo "Chiamata a calcola_quadrato con 'abc' ha fallito come atteso."
fi

echo "
Script terminato."
