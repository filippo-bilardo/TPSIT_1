#!/bin/bash

# ================================================================
# Gestore Avanzato di File
# ================================================================
# Questo script implementa un sistema completo per la gestione dei file
# che integra diverse tecniche di scripting Bash apprese durante il corso.
# Funzionalità: organizzazione, ricerca, analisi e trasformazione di file.

# Configurazione
# ==============
DIR_BASE="$HOME/gestione_file"
DIR_ARCHIVIO="$DIR_BASE/archivio"
DIR_TEMP="$DIR_BASE/temp"
DIR_LOG="$DIR_BASE/logs"
FILE_CONFIG="$DIR_BASE/config.cfg"
FILE_LOG="$DIR_LOG/gestore_$(date +%Y%m%d).log"

# Colori per output
ROSSO="\033[0;31m"
VERDE="\033[0;32m"
GIALLO="\033[0;33m"
BLU="\033[0;34m"
MAGENTA="\033[0;35m"
CYAN="\033[0;36m"
NC="\033[0m" # No Color

# Funzioni
# ========

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
    
    # Assicurati che la directory di log esista
    mkdir -p "$DIR_LOG"
    echo "[${timestamp}] [${livello}] ${messaggio}" >> "$FILE_LOG"
}

# Funzione per inizializzare l'ambiente
inizializza_ambiente() {
    log "INFO" "Inizializzazione dell'ambiente..."
    
    # Crea le directory necessarie
    mkdir -p "$DIR_ARCHIVIO"{/documenti,/immagini,/audio,/video,/altro}
    mkdir -p "$DIR_TEMP"
    mkdir -p "$DIR_LOG"
    
    # Crea il file di configurazione se non esiste
    if [ ! -f "$FILE_CONFIG" ]; then
        cat > "$FILE_CONFIG" << EOF
# Configurazione del Gestore File

# Estensioni per categoria
EXT_DOCUMENTI=("pdf" "doc" "docx" "txt" "odt" "rtf" "md")
EXT_IMMAGINI=("jpg" "jpeg" "png" "gif" "bmp" "svg" "tiff")
EXT_AUDIO=("mp3" "wav" "ogg" "flac" "aac" "m4a")
EXT_VIDEO=("mp4" "avi" "mkv" "mov" "wmv" "flv" "webm")

# Impostazioni di archiviazione
MAX_DIMENSIONE_ARCHIVIO=10000000000  # 10GB in byte
MAX_FILE_PER_CATEGORIA=1000

# Impostazioni di backup
BACKUP_ATTIVO=true
BACKUP_INTERVALLO=7  # giorni
BACKUP_DESTINAZIONE="$HOME/backup_gestione_file"

# Impostazioni di compressione
COMPRESSIONE_ATTIVA=true
COMPRESSIONE_LIVELLO=6  # da 1 a 9
EOF
        log "INFO" "Creato file di configurazione predefinito"
    fi
    
    # Carica la configurazione
    source "$FILE_CONFIG"
    
    log "SUCCESS" "Ambiente inizializzato con successo"
}

# Funzione per organizzare i file per tipo
organizza_file() {
    local dir_origine=$1
    
    if [ -z "$dir_origine" ] || [ ! -d "$dir_origine" ]; then
        log "ERROR" "Directory di origine non valida: $dir_origine"
        return 1
    fi
    
    log "INFO" "Organizzazione dei file da: $dir_origine"
    
    # Contatori
    local count_doc=0
    local count_img=0
    local count_audio=0
    local count_video=0
    local count_altro=0
    local count_totale=0
    
    # Itera su tutti i file nella directory di origine
    find "$dir_origine" -type f | while read -r file; do
        # Estrai l'estensione del file
        local filename=$(basename "$file")
        local extension="${filename##*.}"
        extension=$(echo "$extension" | tr '[:upper:]' '[:lower:]')
        
        # Determina la categoria in base all'estensione
        local categoria="altro"
        local trovato=false
        
        # Controlla se l'estensione è nella lista dei documenti
        for ext in "${EXT_DOCUMENTI[@]}"; do
            if [ "$extension" = "$ext" ]; then
                categoria="documenti"
                ((count_doc++))
                trovato=true
                break
            fi
        done
        
        # Se non è un documento, controlla se è un'immagine
        if [ "$trovato" = false ]; then
            for ext in "${EXT_IMMAGINI[@]}"; do
                if [ "$extension" = "$ext" ]; then
                    categoria="immagini"
                    ((count_img++))
                    trovato=true
                    break
                fi
            done
        fi
        
        # Se non è un'immagine, controlla se è un file audio
        if [ "$trovato" = false ]; then
            for ext in "${EXT_AUDIO[@]}"; do
                if [ "$extension" = "$ext" ]; then
                    categoria="audio"
                    ((count_audio++))
                    trovato=true
                    break
                fi
            done
        fi
        
        # Se non è un file audio, controlla se è un video
        if [ "$trovato" = false ]; then
            for ext in "${EXT_VIDEO[@]}"; do
                if [ "$extension" = "$ext" ]; then
                    categoria="video"
                    ((count_video++))
                    trovato=true
                    break
                fi
            done
        fi
        
        # Se non è stato trovato in nessuna categoria, è "altro"
        if [ "$trovato" = false ]; then
            ((count_altro++))
        fi
        
        # Crea la directory di destinazione
        local dir_dest="$DIR_ARCHIVIO/$categoria"
        
        # Copia il file nella directory appropriata
        cp "$file" "$dir_dest/" && log "INFO" "File copiato: $filename -> $categoria"
        
        ((count_totale++))
    done
    
    log "SUCCESS" "Organizzazione completata. Totale file: $count_totale (Documenti: $count_doc, Immagini: $count_img, Audio: $count_audio, Video: $count_video, Altro: $count_altro)"
}

# Funzione per cercare file
cerca_file() {
    local pattern=$1
    local categoria=$2
    
    if [ -z "$pattern" ]; then
        log "ERROR" "Pattern di ricerca non specificato"
        return 1
    fi
    
    local dir_ricerca="$DIR_ARCHIVIO"
    if [ -n "$categoria" ] && [ -d "$DIR_ARCHIVIO/$categoria" ]; then
        dir_ricerca="$DIR_ARCHIVIO/$categoria"
    fi
    
    log "INFO" "Ricerca di file con pattern '$pattern' in: $dir_ricerca"
    
    # Esegui la ricerca
    local risultati=$(find "$dir_ricerca" -type f -name "*${pattern}*" | sort)
    local count=$(echo "$risultati" | grep -v '^$' | wc -l)
    
    if [ $count -eq 0 ]; then
        log "WARNING" "Nessun file trovato con il pattern: $pattern"
    else
        log "SUCCESS" "Trovati $count file con il pattern: $pattern"
        echo -e "\n${CYAN}Risultati della ricerca:${NC}"
        echo "$risultati" | while read -r file; do
            if [ -n "$file" ]; then
                local size=$(du -h "$file" | cut -f1)
                local mod_time=$(stat -c "%y" "$file" | cut -d. -f1)
                echo -e "${MAGENTA}$(basename "$file")${NC} - Dimensione: $size, Ultima modifica: $mod_time"
                echo "  Percorso: $file"
            fi
        done
    fi
}

# Funzione per analizzare i file di testo
analizza_testo() {
    local file=$1
    
    if [ -z "$file" ] || [ ! -f "$file" ]; then
        log "ERROR" "File non valido: $file"
        return 1
    fi
    
    log "INFO" "Analisi del file di testo: $file"
    
    # Verifica che sia un file di testo
    if ! file "$file" | grep -q "text"; then
        log "ERROR" "Il file non sembra essere un file di testo: $file"
        return 1
    fi
    
    # Statistiche di base
    local num_righe=$(wc -l < "$file")
    local num_parole=$(wc -w < "$file")
    local num_caratteri=$(wc -m < "$file")
    
    echo -e "\n${CYAN}Statistiche per il file: $(basename "$file")${NC}"
    echo "Numero di righe: $num_righe"
    echo "Numero di parole: $num_parole"
    echo "Numero di caratteri: $num_caratteri"
    
    # Parole più frequenti
    echo -e "\n${CYAN}Le 10 parole più frequenti:${NC}"
    tr -s '[:space:]' '\n' < "$file" | tr '[:upper:]' '[:lower:]' | \
    grep -v "^$" | sort | uniq -c | sort -nr | head -10 | \
    awk '{printf "%4d occorrenze: %s\n", $1, $2}'
    
    # Lunghezza media delle parole
    local lunghezza_media=$(tr -s '[:space:]' '\n' < "$file" | grep -v "^$" | \
    awk '{ sum += length($0); n++ } END { if (n > 0) printf "%.2f", sum / n; else print "0" }')
    
    echo -e "\nLunghezza media delle parole: $lunghezza_media caratteri"
    
    log "SUCCESS" "Analisi del file di testo completata"
}

# Funzione per comprimere file
comprimi_file() {
    local file=$1
    local metodo=${2:-"gzip"}  # gzip è il metodo predefinito
    
    if [ -z "$file" ] || [ ! -f "$file" ]; then
        log "ERROR" "File non valido: $file"
        return 1
    fi
    
    log "INFO" "Compressione del file: $file con metodo $metodo"
    
    local file_output
    local comando
    
    case $metodo in
        "gzip")
            file_output="${file}.gz"
            comando="gzip -c${COMPRESSIONE_LIVELLO} '$file' > '$file_output'"
            ;;
        "bzip2")
            file_output="${file}.bz2"
            comando="bzip2 -c${COMPRESSIONE_LIVELLO} '$file' > '$file_output'"
            ;;
        "xz")
            file_output="${file}.xz"
            comando="xz -c${COMPRESSIONE_LIVELLO} '$file' > '$file_output'"
            ;;
        "zip")
            file_output="${file}.zip"
            comando="zip -${COMPRESSIONE_LIVELLO} '$file_output' '$file'"
            ;;
        *)
            log "ERROR" "Metodo di compressione non supportato: $metodo"
            return 1
            ;;
    esac
    
    # Esegui il comando di compressione
    eval $comando
    
    if [ $? -eq 0 ] && [ -f "$file_output" ]; then
        local size_originale=$(du -b "$file" | cut -f1)
        local size_compresso=$(du -b "$file_output" | cut -f1)
        local rapporto=$((100 - (size_compresso * 100 / size_originale)))
        
        log "SUCCESS" "File compresso con successo: $file_output (Riduzione: $rapporto%)"
        echo -e "\n${VERDE}Compressione completata:${NC}"
        echo "File originale: $file ($(du -h "$file" | cut -f1))"
        echo "File compresso: $file_output ($(du -h "$file_output" | cut -f1))"
        echo "Rapporto di compressione: $rapporto%"
    else
        log "ERROR" "Errore durante la compressione del file"
        return 1
    fi
}

# Funzione per creare un backup dell'archivio
crea_backup() {
    if [ "$BACKUP_ATTIVO" != "true" ]; then
        log "INFO" "Backup non attivo nelle impostazioni"
        return 0
    fi
    
    log "INFO" "Creazione del backup dell'archivio..."
    
    # Crea la directory di backup se non esiste
    mkdir -p "$BACKUP_DESTINAZIONE"
    
    # Nome del file di backup
    local data=$(date +%Y%m%d_%H%M%S)
    local backup_file="$BACKUP_DESTINAZIONE/backup_archivio_$data.tar.gz"
    
    # Crea il backup
    tar -czf "$backup_file" -C "$(dirname "$DIR_ARCHIVIO")" "$(basename "$DIR_ARCHIVIO")"
    
    if [ $? -eq 0 ] && [ -f "$backup_file" ]; then
        local size=$(du -h "$backup_file" | cut -f1)
        log "SUCCESS" "Backup creato con successo: $backup_file (Dimensione: $size)"
    else
        log "ERROR" "Errore durante la creazione del backup"
        return 1
    fi
    
    # Elimina backup vecchi
    log "INFO" "Pulizia dei backup vecchi..."
    find "$BACKUP_DESTINAZIONE" -name "backup_archivio_*.tar.gz" -type f -mtime +"$BACKUP_INTERVALLO" -delete
    log "INFO" "Pulizia completata"
}

# Funzione per generare report sull'archivio
genera_report() {
    log "INFO" "Generazione del report sull'archivio..."
    
    local report_file="$DIR_LOG/report_$(date +%Y%m%d).txt"
    
    # Intestazione del report
    cat > "$report_file" << EOF
=============================================
  REPORT DELL'ARCHIVIO - $(date +"%d/%m/%Y %H:%M:%S")
=============================================

Riepilogo per categoria:

EOF
    
    # Statistiche per categoria
    for categoria in "documenti" "immagini" "audio" "video" "altro"; do
        local dir_cat="$DIR_ARCHIVIO/$categoria"
        local num_file=$(find "$dir_cat" -type f | wc -l)
        local dimensione=$(du -sh "$dir_cat" | cut -f1)
        
        echo "$categoria: $num_file file ($dimensione)" >> "$report_file"
        
        # Dettagli sui tipi di file
        echo "  Tipi di file:" >> "$report_file"
        find "$dir_cat" -type f | grep -v "^$" | while read -r file; do
            local ext="${file##*.}"
            echo "$ext" >> "$DIR_TEMP/extensions_$categoria.txt"
        done
        
        if [ -f "$DIR_TEMP/extensions_$categoria.txt" ]; then
            sort "$DIR_TEMP/extensions_$categoria.txt" | uniq -c | sort -nr | \
            head -5 | awk '{printf "    %s: %d file\n", $2, $1}' >> "$report_file"
            rm "$DIR_TEMP/extensions_$categoria.txt"
        fi
    done
    
    # Statistiche generali
    echo -e "\nStatistiche generali:" >> "$report_file"
    echo "Numero totale di file: $(find "$DIR_ARCHIVIO" -type f | wc -l)" >> "$report_file"
    echo "Dimensione totale dell'archivio: $(du -sh "$DIR_ARCHIVIO" | cut -f1)" >> "$report_file"
    echo "Ultimo backup: $(find "$BACKUP_DESTINAZIONE" -name "backup_archivio_*.tar.gz" -type f | sort | tail -1)" >> "$report_file"
    
    # File più grandi
    echo -e "\nI 10 file più grandi:" >> "$report_file"
    find "$DIR_ARCHIVIO" -type f -exec du -h {} \; | sort -hr | head -10 >> "$report_file"
    
    # File più recenti
    echo -e "\nI 10 file più recenti:" >> "$report_file"
    find "$DIR_ARCHIVIO" -type f -printf "%T+ %p\n" | sort -r | head -10 | \
    awk '{print $1 " " $2}' >> "$report_file"
    
    log "SUCCESS" "Report generato: $report_file"
    echo -e "\n${VERDE}Report generato: $report_file${NC}"
    
    # Mostra il report
    cat "$report_file"
}

# Funzione per mostrare il menu interattivo
menu_interattivo() {
    while true; do
        clear
        echo -e "${CYAN}===== GESTORE AVANZATO DI FILE =====${NC}"
        echo -e "${CYAN}1.${NC} Organizza file"
        echo -e "${CYAN}2.${NC} Cerca file"
        echo -e "${CYAN}3.${NC} Analizza file di testo"
        echo -e "${CYAN}4.${NC} Comprimi file"
        echo -e "${CYAN}5.${NC} Crea backup dell'archivio"
        echo -e "${CYAN}6.${NC} Genera report"
        echo -e "${CYAN}0.${NC} Esci"
        echo -e "${CYAN}===================================${NC}"
        echo -n "Seleziona un'opzione: "
        read scelta
        
        case $scelta in
            1)
                echo -n "Inserisci la directory di origine: "
                read dir_origine
                organizza_file "$dir_origine"
                echo -e "\nPremi un tasto per continuare..."
                read -n 1
                ;;
            2)
                echo -n "Inserisci il pattern di ricerca: "
                read pattern
                echo -n "Inserisci la categoria (lascia vuoto per tutte): "
                read categoria
                cerca_file "$pattern" "$categoria"
                echo -e "\nPremi un tasto per continuare..."
                read -n 1
                ;;
            3)
                echo -n "Inserisci il percorso del file di testo: "
                read file_testo
                analizza_testo "$file_testo"
                echo -e "\nPremi un tasto per continuare..."
                read -n 1
                ;;
            4)
                echo -n "Inserisci il percorso del file da comprimere: "
                read file_comp
                echo -n "Inserisci il metodo di compressione (gzip, bzip2, xz, zip): "
                read metodo
                comprimere_file "$file_comp" "$metodo"
                echo -e "\nPremi un tasto per continuare..."
                read -n 1
                ;;
            5)
                crea_backup
                echo -e "\nPremi un tasto per continuare..."
                read -n 1
                ;;
            6)
                genera_report
                echo -e "\nPremi un tasto per continuare..."
                read -n 1
                ;;
            0)
                echo "Arrivederci!"
                exit 0
                ;;
            *)
                echo -e "${ROSSO}Opzione non valida!${NC}"
                sleep 2
                ;;
        esac
    done
}

# Funzione principale
main() {
    # Inizializza l'ambiente
    inizializza_ambiente
    
    # Gestione degli argomenti
    case "$1" in
        --organizza|-o)
            if [ -z "$2" ]; then
                log "ERROR" "Directory di origine non specificata"
                exit 1
            fi
            organizza_file "$2"
            ;;
        --cerca|-c)
            if [ -z "$2" ]; then
                log "ERROR" "Pattern di ricerca non specificato"
                exit 1
            fi
            cerca_file "$2" "$3"
            ;;
        --analizza|-a)
            if [ -z "$2" ]; then
                log "ERROR" "File non specificato"
                exit 1
            fi
            analizza_testo "$2"
            ;;
        --comprimi|-z)
            if [ -z "$2" ]; then
                log "ERROR" "File non specificato"
                exit 1
            fi
            comprimere_file "$2" "$3"
            ;;
        --backup|-b)
            crea_backup
            ;;
        --report|-r)
            genera_report
            ;;
        --help|-h)
            echo "Utilizzo: $0 [OPZIONE] [PARAMETRI]"
            echo "Opzioni:"
            echo "  --organizza, -o DIR      Organizza i file dalla directory specificata"
            echo "  --cerca, -c PATTERN [CAT] Cerca file con il pattern specificato (opzionalmente in una categoria)"
            echo "  --analizza, -a FILE      Analizza il file di testo specificato"
            echo "  --comprimi, -z FILE [MET] Comprimi il file specificato (metodo opzionale)"
            echo "  --backup, -b             Crea un backup dell'archivio"
            echo "  --report, -r             Genera un report sull'archivio"
            echo "  --interactive, -i        Avvia la modalità interattiva"
            echo "  --help, -h               Mostra questo messaggio di aiuto"
            exit 0
            ;;
        --interactive|-i)
            menu_interattivo
            ;;
        *)
            log "INFO" "Nessuna opzione specificata, avvio della modalità interattiva"
            menu_interattivo
            ;;
    esac
}

# Avvio dello script
main "$@"