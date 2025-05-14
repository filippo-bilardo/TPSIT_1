#!/bin/bash
# ==============================================
# Script di esempio: Elaborazione di file e directory
# Autore: Corso Linux Essential with Bash
# ==============================================

# Definizione di variabili per la formattazione dell'output
BOLD=$(tput bold)
RESET=$(tput sgr0)
RED=$(tput setaf 1)
GREEN=$(tput setaf 2)
YELLOW=$(tput setaf 3)
BLUE=$(tput setaf 4)

# Mostra intestazione
echo "${BOLD}${BLUE}=========================================${RESET}"
echo "${BOLD}${BLUE}    UTILITY DI GESTIONE FILE E DIRECTORY    ${RESET}"
echo "${BOLD}${BLUE}=========================================${RESET}"
echo

# Verifica se è stato fornito un percorso come argomento
if [ $# -eq 0 ]; then
    # Nessun percorso fornito, usiamo la directory corrente
    TARGET_DIR="."
    echo "${YELLOW}Nessun percorso specificato. Utilizzo della directory corrente.${RESET}"
else
    # Usa il percorso fornito come argomento
    TARGET_DIR="$1"
    
    # Verifica che esista e sia una directory
    if [ ! -d "$TARGET_DIR" ]; then
        echo "${RED}Errore: Il percorso specificato non esiste o non è una directory.${RESET}"
        exit 1
    fi
    
    echo "${GREEN}Analisi della directory: ${BOLD}$TARGET_DIR${RESET}"
fi

echo

# Funzione per formattare la dimensione in un formato leggibile
format_size() {
    local size=$1
    local units=("B" "KB" "MB" "GB" "TB")
    local unit=0
    
    while [ $size -ge 1024 ] && [ $unit -lt 4 ]; do
        size=$(($size / 1024))
        unit=$((unit + 1))
    done
    
    echo "$size ${units[$unit]}"
}

# Funzione per ottenere il tipo di file
get_file_type() {
    local file=$1
    
    if [ -L "$file" ]; then
        echo "link simbolico"
    elif [ -d "$file" ]; then
        echo "directory"
    elif [ -x "$file" ]; then
        echo "eseguibile"
    elif [ -f "$file" ]; then
        # Determina il tipo di file in base all'estensione
        local ext="${file##*.}"
        case "$ext" in
            txt|md|log|conf|ini)
                echo "file di testo"
                ;;
            jpg|jpeg|png|gif|bmp|svg)
                echo "immagine"
                ;;
            mp3|wav|ogg|flac)
                echo "audio"
                ;;
            mp4|avi|mkv|mov)
                echo "video"
                ;;
            zip|tar|gz|bz2|xz|rar)
                echo "archivio"
                ;;
            sh|bash)
                echo "script bash"
                ;;
            py)
                echo "script python"
                ;;
            js)
                echo "script javascript"
                ;;
            html|htm)
                echo "pagina web"
                ;;
            *)
                echo "file generico"
                ;;
        esac
    else
        echo "tipo sconosciuto"
    fi
}

# Statistiche di base
echo "${BOLD}STATISTICHE GENERALI:${RESET}"
echo "-----------------------"

TOTAL_FILES=$(find "$TARGET_DIR" -type f | wc -l)
TOTAL_DIRS=$(find "$TARGET_DIR" -type d | wc -l)
TOTAL_LINKS=$(find "$TARGET_DIR" -type l | wc -l)
TOTAL_SIZE=$(du -sb "$TARGET_DIR" | cut -f1)
READABLE_SIZE=$(format_size $TOTAL_SIZE)

echo "File totali: $TOTAL_FILES"
echo "Directory totali: $TOTAL_DIRS"
echo "Link simbolici: $TOTAL_LINKS"
echo "Dimensione totale: $READABLE_SIZE"
echo

# File più recenti
echo "${BOLD}FILE MODIFICATI RECENTEMENTE:${RESET}"
echo "-----------------------------"
find "$TARGET_DIR" -type f -mtime -7 -exec ls -la {} \; | sort -k6,8 -r | head -5 | while read line; do
    echo "$line"
done
echo

# File più grandi
echo "${BOLD}FILE PIÙ GRANDI:${RESET}"
echo "----------------"
find "$TARGET_DIR" -type f -exec du -b {} \; | sort -nr | head -5 | while read size path; do
    readable_size=$(format_size $size)
    filename=$(basename "$path")
    filetype=$(get_file_type "$path")
    echo "$filename ($readable_size) - $filetype"
done
echo

# Tipi di file
echo "${BOLD}DISTRIBUZIONE PER TIPO DI FILE:${RESET}"
echo "------------------------------"

# Array per contare i tipi di file
declare -A file_types

while IFS= read -r file; do
    type=$(get_file_type "$file")
    if [[ -n "${file_types[$type]}" ]]; then
        file_types[$type]=$((${file_types[$type]} + 1))
    else
        file_types[$type]=1
    fi
done < <(find "$TARGET_DIR" -type f -o -type l -o -type d)

# Stampa la distribuzione
for type in "${!file_types[@]}"; do
    count=${file_types[$type]}
    percentage=$(echo "scale=2; $count * 100 / ($TOTAL_FILES + $TOTAL_DIRS + $TOTAL_LINKS)" | bc)
    printf "%-20s: %4d (%5.1f%%)\n" "$type" "$count" "$percentage"
done | sort -rn -k2
echo

# Verifica permessi
echo "${BOLD}VERIFICA PERMESSI:${RESET}"
echo "------------------"
echo "File leggibili da tutti: $(find "$TARGET_DIR" -type f -perm -o=r | wc -l)"
echo "File scrivibili da tutti: $(find "$TARGET_DIR" -type f -perm -o=w | wc -l)"
echo "File eseguibili da tutti: $(find "$TARGET_DIR" -type f -perm -o=x | wc -l)"
echo

# Stampa una riga di conclusione
echo "${BOLD}${GREEN}Analisi completata con successo.${RESET}"
