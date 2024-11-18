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

# Esempio di utilizzo
echo -e "${FG_RED}Questo è un testo rosso${RESET}"
echo -e "${FG_GREEN}Questo è un testo verde${RESET}"
echo -e "${BG_BLUE}${FG_WHITE}Questo è un testo bianco su sfondo blu${RESET}"
echo -e "${EFFECT_BOLD}Questo è un testo in grassetto${RESET}"
echo -e "${EFFECT_UNDERLINE}Questo è un testo sottolineato${RESET}"
echo -e "${EFFECT_REVERSED}Questo è un testo invertito${RESET}"
