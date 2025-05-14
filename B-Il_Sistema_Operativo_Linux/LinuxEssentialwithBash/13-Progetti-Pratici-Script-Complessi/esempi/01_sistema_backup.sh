#!/bin/bash

# Sistema di Backup Automatizzato
# Questo script implementa un sistema completo di backup automatizzato
# che dimostra l'uso di tecniche avanzate di scripting Bash

# Configurazione
DIR_ORIGINE="$HOME/documenti"
DIR_BACKUP="$HOME/backup"
PREFISSO_BACKUP="backup_"
MAX_BACKUP=5  # Numero massimo di backup da mantenere
LOG_FILE="$HOME/backup_log.txt"

# Colori per output
ROSSO="\033[0;31m"
VERDE="\033[0;32m"
GIALLO="\033[0;33m"
BLU="\033[0;34m"
NC="\033[0m" # No Color

# Funzione per il logging
log() {
    local livello=$1
    local messaggio=$2
    local timestamp=$(date "+%Y-%m-%d %H:%M:%S")
    local colore=$NC
    
    case $livello in
        "INFO") colore=$BLU ;;
        "SUCCESS") colore=$VERDE ;;
        "WARNING") colore=$GIALLO ;;
        "ERROR") colore=$ROSSO ;;
    esac
    
    echo -e "${colore}[${timestamp}] [${livello}] ${messaggio}${NC}"
    echo "[${timestamp}] [${livello}] ${messaggio}" >> "$LOG_FILE"
}

# Funzione per verificare prerequisiti
verifica_prerequisiti() {
    log "INFO" "Verifica dei prerequisiti..."
    
    # Verifica che la directory di origine esista
    if [ ! -d "$DIR_ORIGINE" ]; then
        log "ERROR" "La directory di origine '$DIR_ORIGINE' non esiste."
        return 1
    fi
    
    # Verifica che la directory di backup esista o creala
    if [ ! -d "$DIR_BACKUP" ]; then
        log "WARNING" "La directory di backup '$DIR_BACKUP' non esiste. Creazione..."
        mkdir -p "$DIR_BACKUP" || {
            log "ERROR" "Impossibile creare la directory di backup '$DIR_BACKUP'."
            return 1
        }
        log "SUCCESS" "Directory di backup creata con successo."
    fi
    
    # Verifica spazio disponibile
    local spazio_origine=$(du -s "$DIR_ORIGINE" | awk '{print $1}')
    local spazio_disponibile=$(df -k "$DIR_BACKUP" | tail -1 | awk '{print $4}')
    
    if [ $spazio_disponibile -lt $spazio_origine ]; then
        log "ERROR" "Spazio insufficiente per il backup. Necessario: ${spazio_origine}KB, Disponibile: ${spazio_disponibile}KB."
        return 1
    fi
    
    log "SUCCESS" "Tutti i prerequisiti soddisfatti."
    return 0
}

# Funzione per creare il backup
crea_backup() {
    log "INFO" "Avvio del processo di backup..."
    
    local data_ora=$(date "+%Y%m%d_%H%M%S")
    local nome_backup="${PREFISSO_BACKUP}${data_ora}.tar.gz"
    local percorso_backup="$DIR_BACKUP/$nome_backup"
    
    log "INFO" "Creazione del backup '$nome_backup'..."
    
    # Creazione del backup
    tar -czf "$percorso_backup" -C "$(dirname "$DIR_ORIGINE")" "$(basename "$DIR_ORIGINE")" 2>/dev/null
    
    if [ $? -eq 0 ]; then
        local dimensione=$(du -h "$percorso_backup" | awk '{print $1}')
        log "SUCCESS" "Backup completato con successo. Dimensione: $dimensione."
        return 0
    else
        log "ERROR" "Errore durante la creazione del backup."
        return 1
    fi
}

# Funzione per gestire la rotazione dei backup
gestisci_rotazione() {
    log "INFO" "Gestione della rotazione dei backup..."
    
    local num_backup=$(ls -1 "$DIR_BACKUP/${PREFISSO_BACKUP}"* 2>/dev/null | wc -l)
    
    if [ $num_backup -gt $MAX_BACKUP ]; then
        log "INFO" "Numero di backup ($num_backup) superiore al massimo consentito ($MAX_BACKUP). Eliminazione dei backup più vecchi..."
        
        local backup_da_eliminare=$((num_backup - MAX_BACKUP))
        local backup_vecchi=$(ls -1t "$DIR_BACKUP/${PREFISSO_BACKUP}"* | tail -$backup_da_eliminare)
        
        for backup in $backup_vecchi; do
            log "INFO" "Eliminazione del backup vecchio: $(basename "$backup")"
            rm "$backup" || log "WARNING" "Impossibile eliminare il backup: $backup"
        done
        
        log "SUCCESS" "Rotazione dei backup completata. Eliminati $backup_da_eliminare backup vecchi."
    else
        log "INFO" "Nessuna rotazione necessaria. Backup attuali: $num_backup, Massimo: $MAX_BACKUP."
    fi
}

# Funzione per verificare l'integrità del backup
verifica_backup() {
    log "INFO" "Verifica dell'integrità dell'ultimo backup..."
    
    local ultimo_backup=$(ls -1t "$DIR_BACKUP/${PREFISSO_BACKUP}"* | head -1)
    
    if [ -z "$ultimo_backup" ]; then
        log "ERROR" "Nessun backup trovato per la verifica."
        return 1
    fi
    
    log "INFO" "Verifica del backup: $(basename "$ultimo_backup")"
    
    # Verifica dell'integrità dell'archivio
    tar -tzf "$ultimo_backup" >/dev/null 2>&1
    
    if [ $? -eq 0 ]; then
        log "SUCCESS" "Il backup è integro."
        return 0
    else
        log "ERROR" "Il backup è corrotto o incompleto."
        return 1
    fi
}

# Funzione per generare un report
genera_report() {
    log "INFO" "Generazione del report di backup..."
    
    local report_file="$DIR_BACKUP/report_backup.txt"
    local data_ora=$(date "+%Y-%m-%d %H:%M:%S")
    local num_backup=$(ls -1 "$DIR_BACKUP/${PREFISSO_BACKUP}"* 2>/dev/null | wc -l)
    local ultimo_backup=$(ls -1t "$DIR_BACKUP/${PREFISSO_BACKUP}"* 2>/dev/null | head -1)
    local dimensione_totale=$(du -sh "$DIR_BACKUP" 2>/dev/null | awk '{print $1}')
    
    # Creazione del report
    cat > "$report_file" << EOF
REPORT DI BACKUP
===============

Data e ora: $data_ora
Directory di origine: $DIR_ORIGINE
Directory di backup: $DIR_BACKUP

Statistiche:
- Numero totale di backup: $num_backup
- Backup più recente: $(basename "$ultimo_backup" 2>/dev/null)
- Dimensione totale dei backup: $dimensione_totale

Ultimi 5 backup:
$(ls -lht "$DIR_BACKUP/${PREFISSO_BACKUP}"* 2>/dev/null | head -5 | awk '{print "- " $9 " (" $5 ") - " $6 " " $7 " " $8}')

Log degli ultimi eventi:
$(tail -10 "$LOG_FILE" 2>/dev/null)
EOF
    
    log "SUCCESS" "Report generato con successo: $report_file"
}

# Funzione principale
main() {
    log "INFO" "Avvio del sistema di backup automatizzato"
    
    # Gestione dei parametri
    while getopts ":o:b:m:vh" opt; do
        case $opt in
            o) DIR_ORIGINE="$OPTARG" ;;
            b) DIR_BACKUP="$OPTARG" ;;
            m) MAX_BACKUP="$OPTARG" ;;
            v) set -x ;; # Modalità verbose
            h) 
                echo "Utilizzo: $0 [-o dir_origine] [-b dir_backup] [-m max_backup] [-v] [-h]"
                echo "  -o: Directory di origine (default: $DIR_ORIGINE)"
                echo "  -b: Directory di backup (default: $DIR_BACKUP)"
                echo "  -m: Numero massimo di backup da mantenere (default: $MAX_BACKUP)"
                echo "  -v: Modalità verbose"
                echo "  -h: Mostra questo help"
                exit 0
                ;;
            \?) log "ERROR" "Opzione non valida: -$OPTARG"; exit 1 ;;
            :) log "ERROR" "L'opzione -$OPTARG richiede un argomento"; exit 1 ;;
        esac
    done
    
    # Registrazione del gestore di pulizia
    cleanup() {
        log "WARNING" "Interruzione rilevata. Pulizia in corso..."
        # Pulizia di eventuali file temporanei
        rm -f /tmp/backup_temp_* 2>/dev/null
        log "INFO" "Pulizia completata. Uscita."
        exit 1
    }
    trap cleanup SIGINT SIGTERM
    
    # Attivazione della gestione degli errori
    set -e
    
    # Esecuzione delle fasi di backup
    verifica_prerequisiti || {
        log "ERROR" "Verifica dei prerequisiti fallita. Uscita."
        exit 1
    }
    
    crea_backup || {
        log "ERROR" "Creazione del backup fallita. Uscita."
        exit 1
    }
    
    gestisci_rotazione
    
    verifica_backup || {
        log "WARNING" "Verifica del backup fallita. Il backup potrebbe essere corrotto."
        # Non usciamo qui, continuiamo con il report
    }
    
    genera_report
    
    log "SUCCESS" "Processo di backup completato con successo."
    return 0
}

# Esecuzione dello script
main "$@"