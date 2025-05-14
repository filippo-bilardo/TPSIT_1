#!/bin/bash
# 06_libreria_funzioni_main.sh
# Script principale che utilizza funzioni da 06_mia_libreria.sh

echo "Esempio di Utilizzo di una Libreria di Funzioni"

# Determina il percorso dello script corrente e della libreria
# Utile se lo script può essere chiamato da diverse directory
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
LIBRERIA_PATH="$SCRIPT_DIR/06_mia_libreria.sh"

# Controlla se il file della libreria esiste
if [ ! -f "$LIBRERIA_PATH" ]; then
  echo "Errore: File libreria '$LIBRERIA_PATH' non trovato!" >&2
  exit 1
fi

# Includi (source) il file della libreria.
# Il punto '.' è un alias per il comando 'source'.
# Dopo questo comando, tutte le funzioni definite in 06_mia_libreria.sh
# sono disponibili in questo script.
source "$LIBRERIA_PATH"
# Alternativa: . "$LIBRERIA_PATH"

# Ora possiamo usare le funzioni dalla libreria
log_messaggio "INFO" "Script principale avviato."
log_messaggio "DEBUG" "Questo è un messaggio di debug dallo script principale."

COMANDO_DA_VERIFICARE="git"
if comando_esiste "$COMANDO_DA_VERIFICARE"; then
  log_messaggio "INFO" "Il comando '$COMANDO_DA_VERIFICARE' è installato."
else
  log_messaggio "WARNING" "Il comando '$COMANDO_DA_VERIFICARE' NON è installato."
fi

COMANDO_FANTASMA="uncomandoqualsiasi123"
if ! comando_esiste "$COMANDO_FANTASMA"; then
  log_messaggio "INFO" "Il comando '$COMANDO_FANTASMA' non esiste, come previsto."
fi

NUOVA_CARTELLA="./my_app_data"
log_messaggio "INFO" "Tento di creare la cartella '$NUOVA_CARTELLA'."
crea_dir_se_non_esiste "$NUOVA_CARTELLA"

# Verifica se la cartella è stata creata (per questo script di esempio)
if [ -d "$NUOVA_CARTELLA" ]; then
  log_messaggio "SUCCESS" "La cartella '$NUOVA_CARTELLA' ora esiste."
  # Potremmo volerla rimuovere per pulizia in un esempio
  # rm -r "$NUOVA_CARTELLA"
  # log_messaggio "INFO" "Cartella di test '$NUOVA_CARTELLA' rimossa."
else
  log_messaggio "ERROR" "Qualcosa è andato storto, la cartella '$NUOVA_CARTELLA' non è stata creata."
fi

log_messaggio "INFO" "Script principale terminato."

echo "
Script terminato."
