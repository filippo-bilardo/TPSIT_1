#!/bin/bash
# 05_saluto_interattivo.sh

echo "Questo script chiede il tuo nome e ti saluta."

# Chiedi all'utente di inserire il nome
read -p "Ciao! Come ti chiami? " NOME_UTENTE

# Saluta l'utente
if [ -n "$NOME_UTENTE" ]; then
  echo "Piacere di conoscerti, $NOME_UTENTE! Benvenuto/a."
else
  echo "Non hai inserito un nome, ma benvenuto/a comunque!"
fi

echo "
Script terminato."
