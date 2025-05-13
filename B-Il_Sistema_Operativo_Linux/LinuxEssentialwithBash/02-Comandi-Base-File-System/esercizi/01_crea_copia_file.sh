#!/bin/bash
# Esercizio: crea una copia di un file specificato dall'utente

echo "Inserisci il nome del file da copiare:"
read file
cp "$file" "$file.bak"
echo "Copia creata: $file.bak"