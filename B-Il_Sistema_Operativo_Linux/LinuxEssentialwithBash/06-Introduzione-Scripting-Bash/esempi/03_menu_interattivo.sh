#!/bin/bash
# ==============================================
# Script di esempio: Implementazione di un menu interattivo
# Autore: Corso Linux Essential with Bash
# ==============================================

# Definizione di colori per output più leggibile
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
BOLD='\033[1m'
RESET='\033[0m'

# Funzione per mostrare l'intestazione
show_header() {
    clear
    echo -e "${BOLD}${BLUE}=========================================${RESET}"
    echo -e "${BOLD}${BLUE}       MENU INTERATTIVO BASH            ${RESET}"
    echo -e "${BOLD}${BLUE}=========================================${RESET}"
    echo ""
}

# Funzione per il menu principale
show_menu() {
    echo -e "${BOLD}Scegli un'opzione:${RESET}"
    echo -e "1) ${GREEN}Informazioni sul sistema${RESET}"
    echo -e "2) ${GREEN}Gestione file${RESET}"
    echo -e "3) ${GREEN}Operazioni utente${RESET}"
    echo -e "4) ${GREEN}Strumenti di rete${RESET}"
    echo -e "5) ${RED}Uscita${RESET}"
    echo ""
    read -p "Inserisci la tua scelta [1-5]: " choice
}

# Funzione per il menu Informazioni sul sistema
system_info_menu() {
    while true; do
        show_header
        echo -e "${BOLD}${YELLOW}MENU: INFORMAZIONI SUL SISTEMA${RESET}"
        echo ""
        echo -e "1) ${GREEN}Mostra data e ora${RESET}"
        echo -e "2) ${GREEN}Informazioni sul sistema operativo${RESET}"
        echo -e "3) ${GREEN}Statistiche CPU${RESET}"
        echo -e "4) ${GREEN}Informazioni sulla memoria${RESET}"
        echo -e "5) ${GREEN}Spazio su disco${RESET}"
        echo -e "6) ${RED}Torna al menu principale${RESET}"
        echo ""
        read -p "Inserisci la tua scelta [1-6]: " subchoice
        
        case $subchoice in
            1)
                echo ""
                echo -e "${BOLD}Data e ora attuali:${RESET}"
                date
                read -p "Premi Enter per continuare..."
                ;;
            2)
                echo ""
                echo -e "${BOLD}Informazioni sul sistema operativo:${RESET}"
                if [ -f /etc/os-release ]; then
                    cat /etc/os-release | grep -E "^(NAME|VERSION)="
                else
                    uname -a
                fi
                read -p "Premi Enter per continuare..."
                ;;
            3)
                echo ""
                echo -e "${BOLD}Statistiche CPU:${RESET}"
                if command -v lscpu &> /dev/null; then
                    lscpu | head -15
                else
                    cat /proc/cpuinfo | grep -E "model name|cpu MHz" | head -4
                fi
                read -p "Premi Enter per continuare..."
                ;;
            4)
                echo ""
                echo -e "${BOLD}Informazioni sulla memoria:${RESET}"
                free -h
                read -p "Premi Enter per continuare..."
                ;;
            5)
                echo ""
                echo -e "${BOLD}Spazio su disco:${RESET}"
                df -h
                read -p "Premi Enter per continuare..."
                ;;
            6)
                return
                ;;
            *)
                echo -e "${RED}Scelta non valida!${RESET}"
                read -p "Premi Enter per continuare..."
                ;;
        esac
    done
}

# Funzione per il menu Gestione file
file_management_menu() {
    while true; do
        show_header
        echo -e "${BOLD}${YELLOW}MENU: GESTIONE FILE${RESET}"
        echo ""
        echo -e "1) ${GREEN}Visualizza directory corrente${RESET}"
        echo -e "2) ${GREEN}Elenca i file${RESET}"
        echo -e "3) ${GREEN}Cerca un file${RESET}"
        echo -e "4) ${GREEN}Mostra i file più grandi${RESET}"
        echo -e "5) ${GREEN}Mostra file modificati recentemente${RESET}"
        echo -e "6) ${RED}Torna al menu principale${RESET}"
        echo ""
        read -p "Inserisci la tua scelta [1-6]: " subchoice
        
        case $subchoice in
            1)
                echo ""
                echo -e "${BOLD}Directory corrente:${RESET}"
                pwd
                read -p "Premi Enter per continuare..."
                ;;
            2)
                echo ""
                echo -e "${BOLD}Elenco dei file (con dettagli):${RESET}"
                ls -lah
                read -p "Premi Enter per continuare..."
                ;;
            3)
                echo ""
                read -p "Inserisci il nome del file da cercare: " filename
                echo -e "${BOLD}Risultati della ricerca per '$filename':${RESET}"
                find . -name "*$filename*" -type f 2>/dev/null | head -15
                read -p "Premi Enter per continuare..."
                ;;
            4)
                echo ""
                echo -e "${BOLD}I 10 file più grandi nella directory corrente:${RESET}"
                find . -type f -exec du -sh {} \; 2>/dev/null | sort -rh | head -10
                read -p "Premi Enter per continuare..."
                ;;
            5)
                echo ""
                echo -e "${BOLD}File modificati nelle ultime 24 ore:${RESET}"
                find . -type f -mtime -1 2>/dev/null | head -15
                read -p "Premi Enter per continuare..."
                ;;
            6)
                return
                ;;
            *)
                echo -e "${RED}Scelta non valida!${RESET}"
                read -p "Premi Enter per continuare..."
                ;;
        esac
    done
}

# Funzione per il menu Operazioni utente
user_operations_menu() {
    while true; do
        show_header
        echo -e "${BOLD}${YELLOW}MENU: OPERAZIONI UTENTE${RESET}"
        echo ""
        echo -e "1) ${GREEN}Informazioni sull'utente corrente${RESET}"
        echo -e "2) ${GREEN}Utenti connessi al sistema${RESET}"
        echo -e "3) ${GREEN}Ultimi accessi al sistema${RESET}"
        echo -e "4) ${GREEN}Processi dell'utente${RESET}"
        echo -e "5) ${RED}Torna al menu principale${RESET}"
        echo ""
        read -p "Inserisci la tua scelta [1-5]: " subchoice
        
        case $subchoice in
            1)
                echo ""
                echo -e "${BOLD}Informazioni sull'utente corrente:${RESET}"
                id
                echo -e "\n${BOLD}Home directory:${RESET} $HOME"
                echo -e "${BOLD}Shell:${RESET} $SHELL"
                read -p "Premi Enter per continuare..."
                ;;
            2)
                echo ""
                echo -e "${BOLD}Utenti connessi al sistema:${RESET}"
                who
                read -p "Premi Enter per continuare..."
                ;;
            3)
                echo ""
                echo -e "${BOLD}Ultimi accessi al sistema:${RESET}"
                last | head -10
                read -p "Premi Enter per continuare..."
                ;;
            4)
                echo ""
                echo -e "${BOLD}Processi dell'utente corrente:${RESET}"
                ps -u $USER --forest
                read -p "Premi Enter per continuare..."
                ;;
            5)
                return
                ;;
            *)
                echo -e "${RED}Scelta non valida!${RESET}"
                read -p "Premi Enter per continuare..."
                ;;
        esac
    done
}

# Funzione per il menu Strumenti di rete
network_tools_menu() {
    while true; do
        show_header
        echo -e "${BOLD}${YELLOW}MENU: STRUMENTI DI RETE${RESET}"
        echo ""
        echo -e "1) ${GREEN}Mostra configurazione di rete${RESET}"
        echo -e "2) ${GREEN}Test connessione (ping)${RESET}"
        echo -e "3) ${GREEN}Informazioni DNS di un dominio${RESET}"
        echo -e "4) ${GREEN}Controllo porte aperte${RESET}"
        echo -e "5) ${RED}Torna al menu principale${RESET}"
        echo ""
        read -p "Inserisci la tua scelta [1-5]: " subchoice
        
        case $subchoice in
            1)
                echo ""
                echo -e "${BOLD}Configurazione di rete:${RESET}"
                
                if command -v ip &> /dev/null; then
                    echo -e "\n${BOLD}Indirizzi IP:${RESET}"
                    ip -br addr
                    
                    echo -e "\n${BOLD}Tabella di routing:${RESET}"
                    ip -br route
                else
                    ifconfig
                fi
                read -p "Premi Enter per continuare..."
                ;;
            2)
                echo ""
                read -p "Inserisci l'host da pingare (es. google.com): " host
                echo -e "${BOLD}Test di connessione a $host:${RESET}"
                ping -c 4 $host
                read -p "Premi Enter per continuare..."
                ;;
            3)
                echo ""
                read -p "Inserisci il dominio da controllare: " domain
                echo -e "${BOLD}Informazioni DNS per $domain:${RESET}"
                
                if command -v dig &> /dev/null; then
                    dig +short $domain
                    echo -e "\n${BOLD}Record MX:${RESET}"
                    dig +short $domain MX
                else
                    host $domain
                fi
                read -p "Premi Enter per continuare..."
                ;;
            4)
                echo ""
                if command -v ss &> /dev/null; then
                    echo -e "${BOLD}Porte in ascolto:${RESET}"
                    ss -tuln
                elif command -v netstat &> /dev/null; then
                    echo -e "${BOLD}Porte in ascolto:${RESET}"
                    netstat -tuln
                else
                    echo -e "${RED}Nessuno strumento disponibile per controllare le porte.${RESET}"
                fi
                read -p "Premi Enter per continuare..."
                ;;
            5)
                return
                ;;
            *)
                echo -e "${RED}Scelta non valida!${RESET}"
                read -p "Premi Enter per continuare..."
                ;;
        esac
    done
}

# Loop principale del programma
while true; do
    show_header
    show_menu
    
    case $choice in
        1)
            system_info_menu
            ;;
        2)
            file_management_menu
            ;;
        3)
            user_operations_menu
            ;;
        4)
            network_tools_menu
            ;;
        5)
            echo -e "\n${GREEN}Grazie per aver usato il Menu Interattivo Bash. Arrivederci!${RESET}"
            exit 0
            ;;
        *)
            echo -e "${RED}Scelta non valida!${RESET}"
            read -p "Premi Enter per continuare..."
            ;;
    esac
done
