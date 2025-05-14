#!/bin/bash
# 08_gestione_flusso_avanzata.sh
# Dimostrazione di controllo del flusso avanzato in Bash

# Funzione per mostrare un'intestazione
show_header() {
    echo
    echo "=== $1 ==="
    echo
}

# Definizione colori per output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# 1. Cicli Annidati con break e continue personalizzati
show_header "Cicli Annidati con Break livelli multipli"

echo -e "${YELLOW}Esempio break con livelli:${NC}"
echo "Questo esempio mostra come uscire da cicli annidati usando 'break N'"
echo

for ((i=1; i<=5; i++)); do
    echo -e "${BLUE}Ciclo esterno: $i${NC}"
    
    for ((j=1; j<=5; j++)); do
        echo -n "  Ciclo interno: $j "
        
        # Uscire da entrambi i cicli quando i=3 e j=3
        if [ $i -eq 3 ] && [ $j -eq 3 ]; then
            echo -e "${RED}BREAK 2 - Uscita da entrambi i cicli!${NC}"
            break 2
        elif [ $j -eq 4 ]; then
            echo -e "${YELLOW}BREAK 1 - Uscita dal ciclo interno!${NC}"
            break
        else
            echo
        fi
    done
done

# 2. Pattern avanzato - Uso del ciclo for con sostituzione di comandi
show_header "Ciclo for con sostituzione di comandi"

echo -e "${YELLOW}Esempio di ciclo for per cercare file:${NC}"
echo "Cerca file .txt più grandi di 1KB"

for file in $(find . -name "*.sh" -size +1k 2>/dev/null); do
    echo -e "${GREEN}File trovato:${NC} $file ($(du -h "$file" | cut -f1))"
done

# 3. Esempio di case con pattern matching avanzato
show_header "Pattern matching con case"

check_file_type() {
    local filename="$1"
    
    case "$filename" in
        *.txt|*.md|*.log)
            echo -e "File di ${GREEN}testo${NC}: $filename"
            ;;
        *.jpg|*.png|*.gif|*.svg)
            echo -e "File ${BLUE}immagine${NC}: $filename"
            ;;
        *.mp3|*.wav|*.ogg)
            echo -e "File ${YELLOW}audio${NC}: $filename"
            ;;
        *.mp4|*.avi|*.mkv)
            echo -e "File ${RED}video${NC}: $filename"
            ;;
        *.)
            echo -e "File ${RED}senza estensione${NC}: $filename"
            ;;
        *[0-9]*)
            echo -e "File con ${BLUE}numeri${NC} nel nome: $filename"
            ;;
        *)
            echo "Tipo di file non riconosciuto: $filename"
            ;;
    esac
}

# Test della funzione su alcuni file
file_list=("documento.txt" "immagine.jpg" "canzone.mp3" "video.mp4" "file" "script01.sh")
for file in "${file_list[@]}"; do
    check_file_type "$file"
done

# 4. Esecuzione condizionale di comandi
show_header "Esecuzione condizionale con && e ||"

echo -e "${YELLOW}Test di comandi concatenati:${NC}"

# AND logico tra comandi (&&)
echo -e "\n${BLUE}Esempio con &&:${NC} mkdir -p test && echo 'Directory creata' || echo 'Errore'"
mkdir -p test && echo -e "${GREEN}Directory creata${NC}" || echo -e "${RED}Errore${NC}"

# OR logico tra comandi (||)
echo -e "\n${BLUE}Esempio con ||:${NC} [ -d '/dir/non/esistente' ] || echo 'Directory non trovata'"
[ -d "/dir/non/esistente" ] || echo -e "${YELLOW}Directory non trovata${NC}"

# Combinazione di AND e OR
echo -e "\n${BLUE}Combinazione AND e OR:${NC}"
[ -d "test" ] && {
    echo -e "${GREEN}La directory test esiste. Creiamo un file...${NC}"
    touch test/test_file.txt && echo -e "${GREEN}File creato${NC}" || echo -e "${RED}Errore nella creazione${NC}"
} || {
    echo -e "${RED}La directory test non esiste${NC}"
}

# 5. Uso del while + read per processare input
show_header "Processare righe da un file/input"

# Creiamo un file temporaneo di esempio
cat > test/dati.csv << EOF
nome,età,città
Mario,30,Roma
Luigi,25,Milano
Anna,28,Napoli
EOF

echo -e "${YELLOW}Leggiamo un file CSV:${NC}"
echo "File: test/dati.csv"
echo

# Leggi il file CSV e formatta l'output
while IFS="," read -r nome eta citta; do
    # Salta l'intestazione
    if [ "$nome" != "nome" ]; then
        echo -e "${GREEN}Nome:${NC} $nome, ${BLUE}Età:${NC} $eta, ${YELLOW}Città:${NC} $citta"
    fi
done < test/dati.csv

# 6. Selezione interattiva con select
show_header "Menu Interattivo con select"

echo -e "${YELLOW}Seleziona un'opzione:${NC}"

# Personalizza il prompt
PS3="Scegli un'opzione (1-4): "

select opzione in "Mostra ora" "Mostra data" "Mostra calendario" "Esci"; do
    case $opzione in
        "Mostra ora")
            echo -e "${GREEN}Ora attuale:${NC} $(date +%H:%M:%S)"
            ;;
        "Mostra data")
            echo -e "${GREEN}Data attuale:${NC} $(date +%d/%m/%Y)"
            ;;
        "Mostra calendario")
            echo -e "${GREEN}Calendario del mese:${NC}"
            cal
            ;;
        "Esci")
            echo -e "${YELLOW}Arrivederci!${NC}"
            break
            ;;
        *)
            echo -e "${RED}Opzione non valida${NC}"
            ;;
    esac
done

# 7. Espressioni regolari con [[ =~ ]]
show_header "Espressioni Regolari con [[ =~ ]]"

validate_email() {
    local email="$1"
    # Pattern semplificato per email
    local pattern="^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$"
    
    if [[ "$email" =~ $pattern ]]; then
        echo -e "${GREEN}✓ Email valida:${NC} $email"
        return 0
    else
        echo -e "${RED}✗ Email non valida:${NC} $email"
        return 1
    fi
}

# Test con alcuni indirizzi email
email_samples=("utente@dominio.com" "test.email@example.org" "invalido@" "senza.chiocciola.com" "user@domain")

for email in "${email_samples[@]}"; do
    validate_email "$email"
done

# 8. Pulizia
rm -rf test

echo -e "\n${GREEN}Dimostrazione completata!${NC}"
