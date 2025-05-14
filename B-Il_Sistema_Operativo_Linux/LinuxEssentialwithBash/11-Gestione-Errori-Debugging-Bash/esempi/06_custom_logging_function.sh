#!/bin/bash
# Esempio di una funzione di logging semplice

# Livelli di log (semplificati)
LOG_LEVEL_INFO="INFO"
LOG_LEVEL_WARNING="WARNING"
LOG_LEVEL_ERROR="ERROR"

# File di log (opzionale, potrebbe essere stdout)
LOG_FILE="/tmp/my_script.log"

# Funzione di logging
log_message() {
    local level="$1"
    local message="$2"
    local timestamp=$(date +"%Y-%m-%d %H:%M:%S")

    # Formatta il messaggio di log
    local formatted_message="[$timestamp] [$level] - $message"

    # Stampa a stdout (e/o stderr per errori)
    if [ "$level" == "$LOG_LEVEL_ERROR" ]; then
        echo -e "\033[0;31m$formatted_message\033[0m" >&2 # Rosso per errori a stderr
    elif [ "$level" == "$LOG_LEVEL_WARNING" ]; then
        echo -e "\033[0;33m$formatted_message\033[0m" # Giallo per warning a stdout
    else
        echo -e "\033[0;32m$formatted_message\033[0m" # Verde per info a stdout
    fi

    # Scrivi anche nel file di log (se definito)
    if [ -n "$LOG_FILE" ]; then
        echo "$formatted_message" >> "$LOG_FILE"
    fi
}

# Funzioni wrapper per i livelli di log
log_info() {
    log_message "$LOG_LEVEL_INFO" "$1"
}

log_warning() {
    log_message "$LOG_LEVEL_WARNING" "$1"
}

log_error() {
    log_message "$LOG_LEVEL_ERROR" "$1"
}

# --- Esempio di utilizzo della funzione di logging ---
echo "Esempio di logging. I messaggi verranno stampati a console e scritti in $LOG_FILE"
echo ""

log_info "Script avviato."

# Simulazione di un'operazione
log_info "Inizio operazione X..."
# ... fai qualcosa ...
sleep 1
log_info "Operazione X completata."

# Simulazione di un avviso
USER_INPUT=""
if [ -z "$USER_INPUT" ]; then
    log_warning "Input utente non fornito. Utilizzo valore predefinito."
    USER_INPUT="default_value"
fi
log_info "Valore utilizzato: $USER_INPUT"

# Simulazione di un errore
FILE_DA_PROCESSARE="/path/inesistente/dati.txt"
if [ ! -f "$FILE_DA_PROCESSARE" ]; then
    log_error "File $FILE_DA_PROCESSARE non trovato. Impossibile continuare."
    # In uno script reale, qui potresti voler uscire
    # exit 1
else
    log_info "Processamento file $FILE_DA_PROCESSARE..."
fi

log_info "Script terminato."

echo ""
echo "Controlla il file di log: $LOG_FILE"
