#!/bin/bash
# 02_menu_utente.sh

echo "Menu Utente Semplice"

echo "Scegli un'opzione:"
echo "1. Mostra data e ora"
echo "2. Lista file nella directory corrente"
echo "3. Mostra utilizzo disco (df -h)"
echo "q. Esci"

read -p "La tua scelta: " SCELTA

case "$SCELTA" in
  1)
    echo "Data e ora correnti:"
    date
    ;;
  2)
    echo "File nella directory corrente:"
    ls -l
    ;;
  3)
    echo "Utilizzo del disco:"
    df -h . # Mostra per la partizione corrente
    ;;
  q | Q)
    echo "Uscita dal menu."
    ;;
  *)
    echo "Scelta non valida. Riprova."
    ;;
esac

echo "Script terminato."
