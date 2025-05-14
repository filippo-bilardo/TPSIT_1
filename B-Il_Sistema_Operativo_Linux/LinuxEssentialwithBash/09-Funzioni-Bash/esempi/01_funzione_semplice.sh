#!/bin/bash
# 01_funzione_semplice.sh

echo "Esempio di Funzione Semplice"

# Definizione della funzione usando la sintassi nome_funzione() { ... }
saluta() {
  echo "Ciao dal mondo delle funzioni Bash!"
}

# Definizione di un'altra funzione usando la sintassi function nome_funzione { ... }
function mostra_data {
  echo "La data e l'ora correnti sono:"
  date
}

# Chiamata delle funzioni
echo "Chiamo la funzione 'saluta':"
saluta

echo "
Chiamo la funzione 'mostra_data':"
mostra_data

echo "
Script terminato."
