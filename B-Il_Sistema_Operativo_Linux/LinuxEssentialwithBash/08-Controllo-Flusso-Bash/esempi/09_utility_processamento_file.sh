#!/bin/bash
# 09_utility_processamento_file.sh
# Utility che dimostra come elaborare file con strutture di controllo

# Definizione colori
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Funzione per mostrare l'aiuto
show_help() {
    echo -e "${YELLOW}Utility di Processamento File${NC}"
    echo
    echo "Utilizzo: $0 COMANDO [OPZIONI]"
    echo
    echo "Comandi disponibili:"
    echo "  search PATTERN [DIRECTORY] - Cerca file contenenti il pattern"
    echo "  count [DIRECTORY]          - Conta file per tipo di estensione"
    echo "  rename PREFIX [DIRECTORY]  - Rinomina file aggiungendo un prefisso"
    echo "  stats [DIRECTORY]          - Mostra statistiche sui file"
    echo "  help                       - Mostra questo messaggio"
    echo
    echo "Esempi:"
    echo "  $0 search \"testo da cercare\" /percorso/directory"
    echo "  $0 count"
    echo "  $0 rename \"nuovo_\" /percorso/directory"
    echo "  $0 stats /percorso/directory"
    echo
}

# Funzione per cercare file contenenti un pattern
search_files() {
    local pattern="$1"
    local directory="${2:-.}"
    
    if [ -z "$pattern" ]; then
        echo -e "${RED}Errore: Pattern di ricerca mancante${NC}"
        echo "Utilizzo: $0 search PATTERN [DIRECTORY]"
        return 1
    fi
    
    if [ ! -d "$directory" ]; then
        echo -e "${RED}Errore: La directory '$directory' non esiste${NC}"
        return 1
    fi
    
    echo -e "${YELLOW}Ricerca di file contenenti \"$pattern\" in $directory...${NC}"
    
    # Variabile per contare i risultati
    local count=0
    
    # Cerca file di testo e conta le occorrenze
    while IFS= read -r -d '' file; do
        if file "$file" | grep -q "text"; then
            # Conta occorrenze nel file
            local occurrences=$(grep -c "$pattern" "$file" 2>/dev/null)
            
            if [ "$occurrences" -gt 0 ]; then
                echo -e "${GREEN}File:${NC} $file"
                echo -e "${BLUE}Occorrenze:${NC} $occurrences"
                
                # Mostra le prime 3 occorrenze con contesto
                echo -e "${YELLOW}Prime occorrenze:${NC}"
                grep -n --color=always -m3 "$pattern" "$file" 2>/dev/null
                echo
                
                ((count++))
            fi
        fi
    done < <(find "$directory" -type f -print0)
    
    if [ "$count" -eq 0 ]; then
        echo -e "${YELLOW}Nessun file contenente \"$pattern\" trovato.${NC}"
    else
        echo -e "${GREEN}Totale file trovati:${NC} $count"
    fi
}

# Funzione per contare i file per tipo di estensione
count_file_types() {
    local directory="${1:-.}"
    
    if [ ! -d "$directory" ]; then
        echo -e "${RED}Errore: La directory '$directory' non esiste${NC}"
        return 1
    fi
    
    echo -e "${YELLOW}Conteggio dei file per tipo di estensione in $directory...${NC}"
    
    # Array associativo per contare le estensioni
    declare -A extensions
    
    # Inizializza contatori
    local total_files=0
    local no_extension=0
    
    # Conta file per estensione
    while IFS= read -r -d '' file; do
        # Ignoriamo le directory
        if [ -f "$file" ]; then
            ((total_files++))
            
            # Estrai l'estensione
            local filename=$(basename "$file")
            local ext="${filename##*.}"
            
            # Se il filename e l'estensione sono uguali, non c'è estensione
            if [ "$filename" = "$ext" ]; then
                ((no_extension++))
            else
                # Incrementa il contatore per questa estensione
                extensions["$ext"]=$((${extensions["$ext"]} + 1))
            fi
        fi
    done < <(find "$directory" -type f -print0)
    
    # Mostra risultati
    echo -e "${GREEN}Statistiche delle estensioni:${NC}"
    echo -e "${BLUE}Totale file:${NC} $total_files"
    
    if [ "$no_extension" -gt 0 ]; then
        echo -e "${BLUE}File senza estensione:${NC} $no_extension"
    fi
    
    # Stampa le estensioni in ordine per conteggio (dal più alto al più basso)
    if [ ${#extensions[@]} -gt 0 ]; then
        echo
        echo -e "${YELLOW}Conteggio per estensione:${NC}"
        
        # Creazione di un array temporaneo per ordinare
        for ext in "${!extensions[@]}"; do
            echo "${extensions[$ext]} $ext"
        done | sort -rn | while read -r count ext; do
            printf "${BLUE}%-10s${NC} %3d file\n" ".$ext:" "$count"
        done
    else
        echo -e "${YELLOW}Nessuna estensione trovata.${NC}"
    fi
}

# Funzione per rinominare file aggiungendo un prefisso
rename_files() {
    local prefix="$1"
    local directory="${2:-.}"
    
    if [ -z "$prefix" ]; then
        echo -e "${RED}Errore: Prefisso mancante${NC}"
        echo "Utilizzo: $0 rename PREFIX [DIRECTORY]"
        return 1
    fi
    
    if [ ! -d "$directory" ]; then
        echo -e "${RED}Errore: La directory '$directory' non esiste${NC}"
        return 1
    fi
    
    echo -e "${YELLOW}Rinomina file con prefisso \"$prefix\" in $directory...${NC}"
    
    # Chiediamo conferma
    read -p "Sei sicuro di voler rinominare i file? (s/n): " confirm
    if [[ ! "$confirm" =~ ^[Ss]$ ]]; then
        echo -e "${BLUE}Operazione annullata.${NC}"
        return 0
    fi
    
    # Contatori
    local renamed=0
    local failed=0
    
    # Rinomina i file
    find "$directory" -maxdepth 1 -type f | while read -r file; do
        local filename=$(basename "$file")
        local dirname=$(dirname "$file")
        local new_name="$dirname/$prefix$filename"
        
        # Verifichiamo che il file non abbia già il prefisso
        if [[ "$filename" != "$prefix"* ]]; then
            if mv "$file" "$new_name"; then
                echo -e "${GREEN}Rinominato:${NC} $filename → $prefix$filename"
                ((renamed++))
            else
                echo -e "${RED}Errore rinominando:${NC} $filename"
                ((failed++))
            fi
        else
            echo -e "${YELLOW}Saltato (ha già il prefisso):${NC} $filename"
        fi
    done
    
    echo
    echo -e "${GREEN}Operazione completata:${NC}"
    echo -e "${BLUE}File rinominati:${NC} $renamed"
    if [ "$failed" -gt 0 ]; then
        echo -e "${RED}Errori:${NC} $failed"
    fi
}

# Funzione per mostrare statistiche sui file
file_stats() {
    local directory="${1:-.}"
    
    if [ ! -d "$directory" ]; then
        echo -e "${RED}Errore: La directory '$directory' non esiste${NC}"
        return 1
    fi
    
    echo -e "${YELLOW}Analisi dei file in $directory...${NC}"
    
    # Statistiche
    local total_files=$(find "$directory" -type f | wc -l)
    local total_dirs=$(find "$directory" -type d | wc -l)
    local total_size=$(du -sh "$directory" | cut -f1)
    local largest_file=$(find "$directory" -type f -exec du -h {} \; | sort -hr | head -n1)
    local newest_file=$(find "$directory" -type f -printf '%T+ %p\n' | sort -r | head -n1)
    local oldest_file=$(find "$directory" -type f -printf '%T+ %p\n' | sort | head -n1)
    
    # Calcola la dimensione media dei file (in byte per semplificare)
    local avg_size=0
    if [ "$total_files" -gt 0 ]; then
        local total_bytes=$(find "$directory" -type f -printf '%s\n' | awk '{sum+=$1} END {print sum}')
        avg_size=$(( total_bytes / total_files ))
    fi
    
    # Mostra risultati
    echo -e "${GREEN}Statistiche della directory:${NC}"
    echo -e "${BLUE}Dimensione totale:${NC} $total_size"
    echo -e "${BLUE}Numero di file:${NC} $total_files"
    echo -e "${BLUE}Numero di directory:${NC} $total_dirs"
    echo -e "${BLUE}Dimensione media file:${NC} $avg_size byte"
    
    if [ -n "$largest_file" ]; then
        echo -e "${BLUE}File più grande:${NC} $largest_file"
    fi
    
    if [ -n "$newest_file" ]; then
        echo -e "${BLUE}File più recente:${NC} $newest_file"
    fi
    
    if [ -n "$oldest_file" ]; then
        echo -e "${BLUE}File più vecchio:${NC} $oldest_file"
    fi
    
    # Tipi di file per MIME type
    echo
    echo -e "${YELLOW}Tipi di file (top 5):${NC}"
    find "$directory" -type f -exec file --mime-type {} \; | awk -F': ' '{print $2}' | sort | uniq -c | sort -nr | head -5 | while read count mime; do
        printf "${BLUE}%-30s${NC} %3d file\n" "$mime" "$count"
    done
}

# Funzione principale
main() {
    # Controlla se abbiamo almeno un comando
    if [ $# -lt 1 ]; then
        show_help
        exit 1
    fi
    
    # Estrai il comando
    command="$1"
    shift
    
    # Esegui il comando appropriato
    case "$command" in
        search)
            search_files "$@"
            ;;
        count)
            count_file_types "$@"
            ;;
        rename)
            rename_files "$@"
            ;;
        stats)
            file_stats "$@"
            ;;
        help|--help|-h)
            show_help
            ;;
        *)
            echo -e "${RED}Errore: Comando sconosciuto: $command${NC}"
            show_help
            exit 1
            ;;
    esac
}

# Esecuzione
main "$@"
