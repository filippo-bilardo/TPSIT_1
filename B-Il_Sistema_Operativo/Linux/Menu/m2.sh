#!/bin/bash

# Definizione delle costanti per i codici ANSI
RESET="\033[0m"
GREEN="\033[1;32m"
BLUE="\033[1;34m"
RED="\033[1;31m"
YELLOW="\033[1;33m"

# Codici ANSI per spostare il cursore
CURSOR_UP="\033[A"
CURSOR_DOWN="\033[B"
CURSOR_RIGHT="\033[C"
CURSOR_LEFT="\033[D"
CURSOR_POSITION="\033[%d;%dH"

# Funzione per stampare il menu
print_menu() {
    clear
    echo -e "${GREEN}========================="
    echo "       MENU PRINCIPALE   "
    echo -e "=========================${RESET}"
    echo -e "${BLUE}1. Opzione 1${RESET}"
    echo -e "${BLUE}2. Opzione 2${RESET}"
    echo -e "${BLUE}3. Opzione 3${RESET}"
    echo -e "${RED}4. Esci${RESET}"
    echo -e "${GREEN}=========================${RESET}"
}

# Funzione per gestire la selezione del menu
menu_selection() {
    read -p "Seleziona un'opzione: " choice
    case $choice in
        1)
            echo -e "${YELLOW}Hai selezionato l'opzione 1${RESET}"
            ;;
        2)
            echo -e "${YELLOW}Hai selezionato l'opzione 2${RESET}"
            ;;
        3)
            echo -e "${YELLOW}Hai selezionato l'opzione 3${RESET}"
            ;;
        4)
            echo -e "${RED}Uscita...${RESET}"
            exit 0
            ;;
        *)
            echo -e "${RED}Scelta non valida!${RESET}"
            ;;
    esac
}

# Funzione per spostare il cursore
move_cursor() {
    printf "$CURSOR_POSITION" "$1" "$2"
}

# Ciclo principale del menu
while true; do
    print_menu
    menu_selection
    echo -e "${YELLOW}Premi un tasto per continuare...${RESET}"
    read -n 1
    # Esempio di utilizzo del movimento del cursore
    move_cursor 3 2
    echo -e "${GREEN}Cursore spostato a (10, 5)${RESET}"
    read -n 1
done