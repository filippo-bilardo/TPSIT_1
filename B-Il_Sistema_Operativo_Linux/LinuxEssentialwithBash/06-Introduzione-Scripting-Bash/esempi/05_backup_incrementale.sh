#!/bin/bash
# ==============================================
# Script di esempio: Utility di backup incrementale
# Autore: Corso Linux Essential with Bash
# ==============================================

# Definizione di colori per output più leggibile
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
BOLD='\033[1m'
RESET='\033[0m'

# Mostra intestazione
echo -e "${BOLD}${BLUE}=========================================${RESET}"
echo -e "${BOLD}${BLUE}    UTILITY DI BACKUP INCREMENTALE       ${RESET}"
echo -e "${BOLD}${BLUE}=========================================${RESET}"
echo

# Funzione per mostrare l'aiuto
show_help() {
    echo -e "${BOLD}Utilizzo:${RESET}"
    echo -e "  $0 [opzioni]"
    echo
    echo -e "${BOLD}Descrizione:${RESET}"
    echo -e "  Questo script crea un backup incrementale della directory specificata."
    echo -e "  Il backup viene salvato come file tar.gz con data e ora nel nome."
    echo
    echo -e "${BOLD}Opzioni:${RESET}"
    echo -e "  -s, --source DIR    Directory sorgente da cui eseguire il backup (obbligatorio)"
    echo -e "  -d, --dest DIR      Directory di destinazione dove salvare il backup (obbligatorio)"
    echo -e "  -n, --name NAME     Nome base per il backup (default: 'backup')"
    echo -e "  -e, --exclude PAT   Pattern da escludere (può essere specificato più volte)"
    echo -e "  -h, --help          Mostra questo messaggio di aiuto"
    echo
    echo -e "${BOLD}Esempio:${RESET}"
    echo -e "  $0 -s ~/documenti -d /media/usb/backups -n documenti -e '*.tmp' -e '*.log'"
    echo
}

# Inizializza variabili
SOURCE_DIR=""
DEST_DIR=""
BACKUP_NAME="backup"
EXCLUDE_PATTERNS=()
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")

# Se non ci sono argomenti, mostra l'aiuto
if [ $# -eq 0 ]; then
    show_help
    exit 1
fi

# Elabora gli argomenti
while [[ $# -gt 0 ]]; do
    case $1 in
        -h|--help)
            show_help
            exit 0
            ;;
        -s|--source)
            SOURCE_DIR="$2"
            shift 2
            ;;
        -d|--dest)
            DEST_DIR="$2"
            shift 2
            ;;
        -n|--name)
            BACKUP_NAME="$2"
            shift 2
            ;;
        -e|--exclude)
            EXCLUDE_PATTERNS+=("$2")
            shift 2
            ;;
        *)
            echo -e "${RED}Opzione non riconosciuta: $1${RESET}"
            show_help
            exit 1
            ;;
    esac
done

# Verifica che le directory necessarie siano specificate
if [ -z "$SOURCE_DIR" ]; then
    echo -e "${RED}Errore: Directory sorgente non specificata.${RESET}"
    show_help
    exit 1
fi

if [ -z "$DEST_DIR" ]; then
    echo -e "${RED}Errore: Directory di destinazione non specificata.${RESET}"
    show_help
    exit 1
fi

# Verifica che la directory sorgente esista
if [ ! -d "$SOURCE_DIR" ]; then
    echo -e "${RED}Errore: La directory sorgente '$SOURCE_DIR' non esiste.${RESET}"
    exit 1
fi

# Verifica/crea la directory di destinazione
if [ ! -d "$DEST_DIR" ]; then
    echo -e "${YELLOW}La directory di destinazione non esiste. Tentativo di creazione...${RESET}"
    mkdir -p "$DEST_DIR"
    
    if [ $? -ne 0 ]; then
        echo -e "${RED}Errore: Impossibile creare la directory di destinazione.${RESET}"
        exit 1
    fi
    
    echo -e "${GREEN}Directory di destinazione creata con successo.${RESET}"
fi

# Costruisci il nome del file di backup
BACKUP_FILE="${DEST_DIR}/${BACKUP_NAME}_${TIMESTAMP}.tar.gz"

# Costruisci il file di registro delle modifiche
CHANGES_FILE="${DEST_DIR}/${BACKUP_NAME}_${TIMESTAMP}_changes.log"

# Costruisci i parametri di esclusione per tar
EXCLUDE_PARAMS=""
for pattern in "${EXCLUDE_PATTERNS[@]}"; do
    EXCLUDE_PARAMS="$EXCLUDE_PARAMS --exclude='$pattern'"
done

# Trova l'ultimo backup (se esiste)
LAST_BACKUP=$(find "$DEST_DIR" -name "${BACKUP_NAME}_*.tar.gz" | sort -r | head -n 1)

echo -e "${BOLD}Informazioni di backup:${RESET}"
echo -e "Directory sorgente: ${BOLD}$SOURCE_DIR${RESET}"
echo -e "Directory destinazione: ${BOLD}$DEST_DIR${RESET}"
echo -e "Nome file di backup: ${BOLD}$(basename "$BACKUP_FILE")${RESET}"

# Se esiste un backup precedente, crea un backup incrementale
if [ -n "$LAST_BACKUP" ]; then
    LAST_BACKUP_NAME=$(basename "$LAST_BACKUP")
    echo -e "Ultimo backup trovato: ${BOLD}$LAST_BACKUP_NAME${RESET}"
    echo -e "Creazione backup incrementale..."
    
    # Estrai la data dell'ultimo backup per confrontare i file modificati
    LAST_BACKUP_DATE=$(echo "$LAST_BACKUP_NAME" | grep -oP '\d{8}_\d{6}')
    
    # Converti in formato per il comando find
    LAST_BACKUP_FIND_DATE=$(date -d "$(echo $LAST_BACKUP_DATE | sed 's/\([0-9]\{4\}\)\([0-9]\{2\}\)\([0-9]\{2\}\)_\([0-9]\{2\}\)\([0-9]\{2\}\)\([0-9]\{2\}\)/\1-\2-\3 \4:\5:\6/')" +"%Y-%m-%d %H:%M:%S")
    
    # Trova file modificati dopo l'ultimo backup
    echo -e "${YELLOW}Cercando file modificati dal $LAST_BACKUP_DATE...${RESET}"
    
    # Crea il file di registro delle modifiche
    echo "File modificati dopo $LAST_BACKUP_DATE:" > "$CHANGES_FILE"
    find "$SOURCE_DIR" -type f -newermt "$LAST_BACKUP_FIND_DATE" >> "$CHANGES_FILE"
    
    # Conta i file modificati
    MODIFIED_FILES=$(grep -c "" "$CHANGES_FILE")
    echo -e "${GREEN}Trovati $MODIFIED_FILES file modificati dal backup precedente.${RESET}"
else
    echo -e "${YELLOW}Nessun backup precedente trovato. Creazione backup completo...${RESET}"
    echo "Backup completo - $(date)" > "$CHANGES_FILE"
fi

# Crea il backup
echo -e "${BOLD}Avvio del processo di backup...${RESET}"

# Utilizzo la valutazione per consentire l'espansione dei parametri di esclusione
eval "tar -czf '$BACKUP_FILE' -C '$(dirname "$SOURCE_DIR")' '$(basename "$SOURCE_DIR")' $EXCLUDE_PARAMS"

if [ $? -eq 0 ]; then
    # Calcola la dimensione del backup
    BACKUP_SIZE=$(du -h "$BACKUP_FILE" | cut -f1)
    
    echo -e "${GREEN}${BOLD}Backup completato con successo!${RESET}"
    echo -e "File di backup: ${BOLD}$BACKUP_FILE${RESET}"
    echo -e "Dimensione: ${BOLD}$BACKUP_SIZE${RESET}"
    echo -e "Registro delle modifiche: ${BOLD}$CHANGES_FILE${RESET}"
    
    # Mostra i file più recenti nel backup (limitato a 5)
    echo
    echo -e "${BOLD}File più recenti nel backup:${RESET}"
    find "$SOURCE_DIR" -type f -printf '%T+ %p\n' | sort -r | head -n 5 | while read datetime filepath; do
        relative_path=${filepath#$SOURCE_DIR/}
        echo -e "- $relative_path ($(date -d "${datetime%.*}" "+%Y-%m-%d %H:%M:%S"))"
    done
else
    echo -e "${RED}${BOLD}Errore durante la creazione del backup!${RESET}"
    echo -e "Controlla i permessi e lo spazio disponibile."
    exit 1
fi

# Fine dello script
echo
echo -e "${BOLD}${BLUE}=========================================${RESET}"
echo -e "${BOLD}${GREEN}Processo di backup terminato.${RESET}"
echo -e "${BOLD}${BLUE}=========================================${RESET}"
