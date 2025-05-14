#!/bin/bash
# 04_manipola_path.sh

echo "Questo script scompone la variabile d'ambiente PATH e stampa ogni percorso su una nuova riga."

# Salva il delimitatore originale (IFS - Internal Field Separator)
OLD_IFS="$IFS"

# Imposta IFS a ':' per dividere la stringa PATH
IFS=':'

# Leggi la variabile PATH in un array (Bash specifico)
read -ra PERCORSI_PATH <<< "$PATH"

# Ripristina IFS al suo valore originale
IFS="$OLD_IFS"

echo "
I percorsi individuali nella variabile PATH sono:"
for percorso in "${PERCORSI_PATH[@]}"; do
  echo "  $percorso"
done

echo "
Script terminato."
