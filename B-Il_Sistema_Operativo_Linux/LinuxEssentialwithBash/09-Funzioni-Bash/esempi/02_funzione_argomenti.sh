#!/bin/bash
# 02_funzione_argomenti.sh

echo "Esempio di Funzione con Argomenti"

# Funzione che accetta argomenti
# $1 è il primo argomento, $2 il secondo, ecc.
# $@ contiene tutti gli argomenti come parole separate
# $# contiene il numero di argomenti passati
stampa_info_utente() {
  if [ "$#" -lt 2 ]; then
    echo "Errore nella funzione: Servono almeno nome e cognome."
    echo "Uso interno: stampa_info_utente <nome> <cognome> [eta]"
    return 1 # Indica un errore
  fi

  local NOME=$1
  local COGNOME=$2
  local ETA="non specificata"

  if [ -n "$3" ]; then # Se il terzo argomento esiste
    ETA="$3 anni"
  fi

  echo "--- Informazioni Utente ---"
  echo "Nome: $NOME"
  echo "Cognome: $COGNOME"
  echo "Età: $ETA"
  echo "Numero di argomenti ricevuti dalla funzione: $#"
  echo "Tutti gli argomenti ricevuti (\$@): $@"
  echo "---------------------------"
  return 0 # Indica successo
}

# Chiamata della funzione con argomenti
echo "Chiamata 1 (con nome e cognome):"
stampa_info_utente "Mario" "Rossi"

echo "
Chiamata 2 (con nome, cognome ed età):"
stampa_info_utente "Luisa" "Verdi" 30

echo "
Chiamata 3 (con pochi argomenti per testare l'errore):"
stampa_info_utente "SoloNome"

echo "
Script terminato."
