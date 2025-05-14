#!/bin/bash
# 06_gestisci_lista_spesa.sh

echo "Gestore Lista della Spesa Semplice"

# Inizializza un array vuoto per la lista della spesa
LISTA_SPESA=()

# Funzione per visualizzare la lista della spesa
visualizza_lista() {
  echo "
--- La Tua Lista della Spesa ---"
  if [ ${#LISTA_SPESA[@]} -eq 0 ]; then
    echo "La lista è vuota!"
  else
    for i in "${!LISTA_SPESA[@]}"; do
      echo "$((i+1)). ${LISTA_SPESA[$i]}"
    done
  fi
  echo "------------------------------"
}

# Funzione per aggiungere un elemento alla lista
aggiungi_elemento() {
  read -p "Cosa vuoi aggiungere alla lista? " elemento
  if [ -n "$elemento" ]; then
    LISTA_SPESA+=("$elemento")
    echo "'$elemento' aggiunto alla lista."
  else
    echo "Nessun elemento inserito."
  fi
}

# Loop principale del menu
while true; do
  echo "
Scegli un'opzione:"
  echo "1. Visualizza lista"
  echo "2. Aggiungi elemento"
  echo "3. Esci"
  read -p "Opzione: " scelta

  case $scelta in
    1)
      visualizza_lista
      ;;
    2)
      aggiungi_elemento
      ;;
    3)
      echo "Grazie per aver usato il Gestore Lista della Spesa. Arrivederci!"
      break
      ;;
    *)
      echo "Opzione non valida. Riprova."
      ;;
  esac
done

echo "
Script terminato."
