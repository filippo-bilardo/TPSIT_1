#!/bin/bash

# ================================================================
# Script Avanzato di Esempio - Tecniche Utili per Apprendimento Futuro
# ================================================================

# Questo script dimostra alcune tecniche avanzate di Bash che possono
# essere utili per il vostro percorso di apprendimento futuro.

# -----------------------------
# 1. Logging avanzato con livelli
# -----------------------------

LOG_FILE="/tmp/script_log.txt"
DEBUG=0
INFO=1
WARNING=2
ERROR=3
CRITICAL=4

log_level_names=("DEBUG" "INFO" "WARNING" "ERROR" "CRITICAL")
CURRENT_LOG_LEVEL=$INFO

log() {
    local level=$1
    local message=$2
    
    if [[ $level -ge $CURRENT_LOG_LEVEL ]]; then
        local timestamp=$(date +"%Y-%m-%d %H:%M:%S")
        local log_message="[$timestamp] [${log_level_names[$level]}] $message"
        echo "$log_message"
        echo "$log_message" >> "$LOG_FILE"
    fi
}

# -----------------------------
# 2. Gestione avanzata degli errori
# -----------------------------

# Trap per catturare errori e pulire prima di uscire
cleanup() {
    log $INFO "Pulizia delle risorse temporanee..."
    rm -f /tmp/temp_file_$$.txt 2>/dev/null
    log $INFO "Pulizia completata"
}

# Imposta trap per vari segnali
trap cleanup EXIT INT TERM

# Funzione per gestire errori
handle_error() {
    local exit_code=$1
    local line_number=$2
    local command=$3
    
    log $ERROR "Errore (codice $exit_code) durante l'esecuzione del comando '$command' alla linea $line_number"
    exit $exit_code
}

# Imposta trap per errori
trap 'handle_error $? $LINENO "$BASH_COMMAND"' ERR

# -----------------------------
# 3. Parsing avanzato degli argomenti
# -----------------------------

show_help() {
    cat << EOF
Utilizzo: $0 [opzioni]

Opzioni:
  -h, --help           Mostra questo messaggio di aiuto
  -v, --verbose        Aumenta la verbosità (può essere usato più volte)
  -q, --quiet          Riduce la verbosità
  -f, --file FILENAME  Specifica un file da processare
  -n, --number NUMBER  Specifica un numero da utilizzare

Esempio:
  $0 --verbose --file dati.txt --number 42
EOF
    exit 0
}

# Valori predefiniti
VERBOSITY=$INFO
FILE=""
NUMBER=0

# Parsing degli argomenti
while [[ $# -gt 0 ]]; do
    case $1 in
        -h|--help)
            show_help
            ;;
        -v|--verbose)
            ((VERBOSITY--))
            if [[ $VERBOSITY -lt 0 ]]; then
                VERBOSITY=0
            fi
            shift
            ;;
        -q|--quiet)
            ((VERBOSITY++))
            if [[ $VERBOSITY -gt 4 ]]; then
                VERBOSITY=4
            fi
            shift
            ;;
        -f|--file)
            if [[ -z "$2" || "$2" == -* ]]; then
                log $ERROR "L'opzione --file richiede un argomento"
                exit 1
            fi
            FILE="$2"
            shift 2
            ;;
        -n|--number)
            if [[ -z "$2" || "$2" == -* ]]; then
                log $ERROR "L'opzione --number richiede un argomento"
                exit 1
            fi
            if ! [[ "$2" =~ ^[0-9]+$ ]]; then
                log $ERROR "L'argomento di --number deve essere un numero"
                exit 1
            fi
            NUMBER="$2"
            shift 2
            ;;
        -*)
            log $ERROR "Opzione sconosciuta: $1"
            exit 1
            ;;
        *)
            log $ERROR "Argomento non riconosciuto: $1"
            exit 1
            ;;
    esac
done

CURRENT_LOG_LEVEL=$VERBOSITY

# -----------------------------
# 4. Utilizzo di array associativi (richiede Bash 4+)
# -----------------------------

# Verifica la versione di Bash
if ((BASH_VERSINFO[0] >= 4)); then
    log $INFO "Utilizzo di array associativi (Bash 4+)"
    
    # Dichiarazione di un array associativo
    declare -A config
    
    # Popolamento dell'array
    config[database_host]="localhost"
    config[database_port]="3306"
    config[database_user]="utente"
    config[database_pass]="password"
    config[app_name]="MyApp"
    config[debug_mode]="true"
    
    # Iterazione sulle chiavi dell'array
    log $DEBUG "Configurazione:"
    for key in "${!config[@]}"; do
        log $DEBUG "  $key = ${config[$key]}"
    done
else
    log $WARNING "La versione di Bash ($BASH_VERSION) non supporta gli array associativi"
    
    # Alternativa per versioni precedenti di Bash
    config_keys=("database_host" "database_port" "database_user" "database_pass" "app_name" "debug_mode")
    config_values=("localhost" "3306" "utente" "password" "MyApp" "true")
    
    log $DEBUG "Configurazione (alternativa):"
    for i in "${!config_keys[@]}"; do
        log $DEBUG "  ${config_keys[$i]} = ${config_values[$i]}"
    done
fi

# -----------------------------
# 5. Utilizzo di processi in background e gestione dei job
# -----------------------------

log $INFO "Avvio di processi in background"

# Funzione che simula un processo lungo
simulate_long_process() {
    local id=$1
    local duration=$2
    
    for ((i=1; i<=duration; i++)); do
        echo "Processo $id: $i/$duration completato"
        sleep 1
    done
}

# Avvio di processi in background
simulate_long_process 1 3 > /tmp/process_1_$$.log 2>&1 &
PID1=$!

simulate_long_process 2 5 > /tmp/process_2_$$.log 2>&1 &
PID2=$!

log $INFO "Processi avviati con PID $PID1 e $PID2"

# Attesa che tutti i processi terminino
wait $PID1
STATUS1=$?
log $INFO "Processo 1 terminato con stato $STATUS1"

wait $PID2
STATUS2=$?
log $INFO "Processo 2 terminato con stato $STATUS2"

# -----------------------------
# 6. Utilizzo di file temporanei sicuri
# -----------------------------

# Creazione di un file temporaneo sicuro
TEMP_FILE=$(mktemp /tmp/secure_temp_XXXXXX)
log $INFO "File temporaneo creato: $TEMP_FILE"

# Assicurarsi che il file venga eliminato all'uscita
trap "rm -f '$TEMP_FILE'" EXIT

# Utilizzo del file temporaneo
echo "Dati sensibili" > "$TEMP_FILE"
log $DEBUG "Dati scritti nel file temporaneo"

# -----------------------------
# 7. Utilizzo di funzioni avanzate
# -----------------------------

# Funzione che restituisce un valore
get_system_info() {
    local info_type=$1
    
    case "$info_type" in
        cpu)
            echo "$(grep -m 1 'model name' /proc/cpuinfo | cut -d ':' -f 2 | sed 's/^\s*//')"
            ;;
        memory)
            echo "$(free -h | grep Mem | awk '{print $2}')"
            ;;
        disk)
            echo "$(df -h / | tail -n 1 | awk '{print $2}')"
            ;;
        os)
            echo "$(grep PRETTY_NAME /etc/os-release | cut -d '"' -f 2)"
            ;;
        *)
            echo "Tipo di informazione non valido: $info_type"
            return 1
            ;;
    esac
    
    return 0
}

# Utilizzo della funzione
CPU_INFO=$(get_system_info cpu)
if [[ $? -eq 0 ]]; then
    log $INFO "CPU: $CPU_INFO"
fi

MEMORY_INFO=$(get_system_info memory)
if [[ $? -eq 0 ]]; then
    log $INFO "Memoria: $MEMORY_INFO"
fi

# -----------------------------
# 8. Utilizzo di espressioni regolari avanzate
# -----------------------------

log $INFO "Dimostrazione di espressioni regolari avanzate"

# Validazione di un indirizzo email
validate_email() {
    local email=$1
    local regex="^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$"
    
    if [[ $email =~ $regex ]]; then
        return 0
    else
        return 1
    fi
}

# Test della funzione
email_addresses=("user@example.com" "invalid-email" "another.user@sub.domain.co.uk")

for email in "${email_addresses[@]}"; do
    if validate_email "$email"; then
        log $INFO "'$email' è un indirizzo email valido"
    else
        log $WARNING "'$email' NON è un indirizzo email valido"
    fi
done

# -----------------------------
# 9. Utilizzo di comandi esterni in modo efficiente
# -----------------------------

log $INFO "Dimostrazione di utilizzo efficiente di comandi esterni"

# Inefficiente: chiamate multiple a comandi esterni in un ciclo
log $DEBUG "Metodo inefficiente:"
start_time=$(date +%s.%N)

for i in {1..10}; do
    files_count=$(ls -1 /etc | wc -l)
    log $DEBUG "  Iterazione $i: $files_count file trovati"
done

end_time=$(date +%s.%N)
duration=$(echo "$end_time - $start_time" | bc)
log $INFO "Tempo impiegato (inefficiente): $duration secondi"

# Efficiente: memorizzazione del risultato e riutilizzo
log $DEBUG "Metodo efficiente:"
start_time=$(date +%s.%N)

files_list=$(ls -1 /etc)
files_count=$(echo "$files_list" | wc -l)

for i in {1..10}; do
    log $DEBUG "  Iterazione $i: $files_count file trovati"
done

end_time=$(date +%s.%N)
duration=$(echo "$end_time - $start_time" | bc)
log $INFO "Tempo impiegato (efficiente): $duration secondi"

# -----------------------------
# 10. Conclusione
# -----------------------------

log $INFO "Script completato con successo"

# Nota: il cleanup verrà eseguito automaticamente grazie al trap EXIT

exit 0