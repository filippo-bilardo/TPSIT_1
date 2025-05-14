#!/bin/bash
# 06_mia_libreria.sh
# Questo file contiene funzioni che possono essere "importate" in altri script.

# Funzione per stampare un messaggio di log con timestamp
log_messaggio() {
  local TIPO_LOG="INFO"
  if [ -n "$1" ]; then
    TIPO_LOG="$1"
  fi
  shift # Rimuove il primo argomento (tipo_log) se presente
  local MESSAGGIO="$@"
  echo "[$(date +'%Y-%m-%d %H:%M:%S')] [$TIPO_LOG] $MESSAGGIO"
}

# Funzione per verificare se un comando esiste
comando_esiste() {
  if [ "$#" -ne 1 ]; then
    log_messaggio "ERROR" "Funzione comando_esiste richiede un argomento (nome comando)."
    return 1
  fi
  command -v "$1" >/dev/null 2>&1
}

# Funzione per creare una directory se non esiste
crea_dir_se_non_esiste() {
  if [ "$#" -ne 1 ]; then
    log_messaggio "ERROR" "Funzione crea_dir_se_non_esiste richiede un argomento (percorso directory)."
    return 1
  fi
  local DIR_PATH="$1"
  if [ ! -d "$DIR_PATH" ]; then
    log_messaggio "INFO" "La directory '$DIR_PATH' non esiste. La creo..."
    mkdir -p "$DIR_PATH"
    if [ $? -eq 0 ]; then
      log_messaggio "SUCCESS" "Directory '$DIR_PATH' creata."
      return 0
    else
      log_messaggio "ERROR" "Impossibile creare la directory '$DIR_PATH'."
      return 1
    fi
  else
    log_messaggio "INFO" "La directory '$DIR_PATH' esiste già."
    return 0
  fi
}

# Questo blocco viene eseguito solo se lo script è eseguito direttamente,
# non quando viene "sourcato". Utile per testare la libreria.
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
  echo "Questo è 06_mia_libreria.sh, eseguito direttamente per test."
  log_messaggio "TEST" "Test della funzione log_messaggio."
  comando_esiste "ls"
  if [ $? -eq 0 ]; then
    log_messaggio "TEST" "Il comando 'ls' esiste."
  fi
  comando_esiste "comando_che_non_esiste"
  if [ $? -ne 0 ]; then
    log_messaggio "TEST" "'comando_che_non_esiste' non trovato, come atteso."
  fi
  crea_dir_se_non_esiste "./temp_dir_libreria"
  rmdir "./temp_dir_libreria" # Pulizia
fi
