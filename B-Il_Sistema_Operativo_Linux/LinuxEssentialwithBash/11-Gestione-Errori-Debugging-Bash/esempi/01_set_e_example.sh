#!/bin/bash
# Esempio di utilizzo di set -e

echo "Questo script dimostra l'effetto di 'set -e'."
echo "Se un comando fallisce, lo script terminerà immediatamente."
echo ""

# Abilita l'uscita immediata in caso di errore
set -e

echo "Eseguo un comando che avrà successo (ls):"
ls -l nome_file_inesistente_prima.txt # Questo comando non esiste nel file system, ma ls esce con codice > 0 se il file non esiste
echo "Questo messaggio NON verrà visualizzato se 'ls' fallisce e set -e è attivo."
echo ""

echo "Provo ad accedere a un file che non esiste..."
cat file_che_non_esiste.txt # Questo comando fallirà

# Le seguenti righe non verranno eseguite a causa di 'set -e'
echo "Comando 'cat' fallito. Lo script sta per terminare."
echo "Fine dello script."

# Nota: Per vedere l'effetto completo, crea uno script e rendilo eseguibile.
# Se commenti 'set -e', vedrai che lo script continua anche dopo il fallimento di 'cat'.
