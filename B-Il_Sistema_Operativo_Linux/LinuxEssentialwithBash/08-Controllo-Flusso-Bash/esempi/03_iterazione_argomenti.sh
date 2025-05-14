#!/bin/bash
# 03_iterazione_argomenti.sh

echo "Iterazione sugli Argomenti della Riga di Comando"

if [ "$#" -eq 0 ]; then
  echo "Nessun argomento fornito."
  echo "Uso: $0 <arg1> <arg2> ... <argN>"
  exit 1
fi

echo "Numero di argomenti: $#"
echo "Tutti gli argomenti (\$@): $@"
echo "Tutti gli argomenti (\$*): $*"
echo ""

echo "Iterazione con 'for arg in \"\$@\"':"
COUNT=1
for arg in "$@"; do
  echo "Argomento $COUNT: $arg"
  COUNT=$((COUNT + 1))
done
echo ""

echo "Iterazione con 'for arg in \$* (senza virgolette)':"
# Nota: questo può comportarsi diversamente se gli argomenti contengono spazi
COUNT=1
for arg in $#; do # Errore comune, dovrebbe essere $@ o $*
  echo "Argomento $COUNT: $arg" # Questo stamperà solo il numero di argomenti
  COUNT=$((COUNT + 1))
done
echo "Correzione: Iterazione con 'for arg in \$*':"
COUNT=1
for arg in $*; do
  echo "Argomento $COUNT: $arg"
  COUNT=$((COUNT + 1))
done


echo "\nScript terminato."
