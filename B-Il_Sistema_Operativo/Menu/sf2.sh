#!/bin/bash

# Codici ANSI per i colori di foreground
FG_RED="\033[31m"
FG_GREEN="\033[32m"
FG_YELLOW="\033[33m"
FG_BLUE="\033[34m"
FG_MAGENTA="\033[35m"
FG_CYAN="\033[36m"
FG_WHITE="\033[37m"

# Codici ANSI per i colori di background
BG_RED="\033[41m"
BG_GREEN="\033[42m"
BG_YELLOW="\033[43m"
BG_BLUE="\033[44m"
BG_MAGENTA="\033[45m"
BG_CYAN="\033[46m"
BG_WHITE="\033[47m"

# Codici ANSI per gli effetti
EFFECT_BOLD="\033[1m"
EFFECT_UNDERLINE="\033[4m"
EFFECT_REVERSED="\033[7m"

# Codice ANSI per resettare
RESET="\033[0m"

# Esempio di utilizzo con combinazioni
echo -e "${FG_RED}${BG_WHITE}Testo rosso su sfondo bianco${RESET}"
echo -e "${FG_GREEN}${BG_BLUE}Testo verde su sfondo blu${RESET}"
echo -e "${FG_YELLOW}${BG_MAGENTA}Testo giallo su sfondo magenta${RESET}"
echo -e "${FG_CYAN}${BG_RED}Testo ciano su sfondo rosso${RESET}"
echo -e "${FG_BLUE}${BG_YELLOW}Testo blu su sfondo giallo${RESET}"
echo -e "${FG_MAGENTA}${BG_GREEN}Testo magenta su sfondo verde${RESET}"
echo -e "${FG_WHITE}${BG_CYAN}Testo bianco su sfondo ciano${RESET}"

# Esempio di utilizzo con effetti
echo -e "${EFFECT_BOLD}${FG_RED}Testo rosso in grassetto${RESET}"
echo -e "${EFFECT_UNDERLINE}${FG_GREEN}Testo verde sottolineato${RESET}"
echo -e "${EFFECT_REVERSED}${FG_YELLOW}Testo giallo invertito${RESET}"

# Combinazioni di colori ed effetti
echo -e "${EFFECT_BOLD}${FG_BLUE}${BG_YELLOW}Testo blu in grassetto su sfondo giallo${RESET}"
echo -e "${EFFECT_UNDERLINE}${FG_MAGENTA}${BG_CYAN}Testo magenta sottolineato su sfondo ciano${RESET}"
echo -e "${EFFECT_REVERSED}${FG_WHITE}${BG_RED}Testo bianco invertito su sfondo rosso${RESET}"