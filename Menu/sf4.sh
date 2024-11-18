#!/bin/bash

# Codici ANSI per i colori di foreground chiari
FG_BRIGHT_BLACK="\033[90m"
FG_BRIGHT_RED="\033[91m"
FG_BRIGHT_GREEN="\033[92m"
FG_BRIGHT_YELLOW="\033[93m"
FG_BRIGHT_BLUE="\033[94m"
FG_BRIGHT_MAGENTA="\033[95m"
FG_BRIGHT_CYAN="\033[96m"
FG_BRIGHT_WHITE="\033[97m"

# Codici ANSI per i colori di background chiari
BG_BRIGHT_BLACK="\033[100m"
BG_BRIGHT_RED="\033[101m"
BG_BRIGHT_GREEN="\033[102m"
BG_BRIGHT_YELLOW="\033[103m"
BG_BRIGHT_BLUE="\033[104m"
BG_BRIGHT_MAGENTA="\033[105m"
BG_BRIGHT_CYAN="\033[106m"
BG_BRIGHT_WHITE="\033[107m"

# Codici ANSI per gli effetti
EFFECT_BOLD="\033[1m"
EFFECT_DIM="\033[2m"
EFFECT_UNDERLINE="\033[4m"
EFFECT_BLINK="\033[5m"
EFFECT_REVERSED="\033[7m"
EFFECT_HIDDEN="\033[8m"

# Codice ANSI per resettare
RESET="\033[0m"

# Esempio di utilizzo per i colori chiari
echo -e "${FG_BRIGHT_BLACK}Testo nero chiaro${RESET}"
echo -e "${FG_BRIGHT_RED}Testo rosso chiaro${RESET}"
echo -e "${FG_BRIGHT_GREEN}Testo verde chiaro${RESET}"
echo -e "${FG_BRIGHT_YELLOW}Testo giallo chiaro${RESET}"
echo -e "${FG_BRIGHT_BLUE}Testo blu chiaro${RESET}"
echo -e "${FG_BRIGHT_MAGENTA}Testo magenta chiaro${RESET}"
echo -e "${FG_BRIGHT_CYAN}Testo ciano chiaro${RESET}"
echo -e "${FG_BRIGHT_WHITE}Testo bianco chiaro${RESET}"

echo -e "${BG_BRIGHT_BLACK}Sfondo nero chiaro${RESET}"
echo -e "${BG_BRIGHT_RED}Sfondo rosso chiaro${RESET}"
echo -e "${BG_BRIGHT_GREEN}Sfondo verde chiaro${RESET}"
echo -e "${BG_BRIGHT_YELLOW}Sfondo giallo chiaro${RESET}"
echo -e "${BG_BRIGHT_BLUE}Sfondo blu chiaro${RESET}"
echo -e "${BG_BRIGHT_MAGENTA}Sfondo magenta chiaro${RESET}"
echo -e "${BG_BRIGHT_CYAN}Sfondo ciano chiaro${RESET}"
echo -e "${BG_BRIGHT_WHITE}Sfondo bianco chiaro${RESET}"

# Combinazioni di colori chiari ed effetti
echo -e "${EFFECT_BOLD}${FG_BRIGHT_BLUE}${BG_BRIGHT_YELLOW}Testo blu chiaro in grassetto su sfondo giallo chiaro${RESET}"
echo -e "${EFFECT_UNDERLINE}${FG_BRIGHT_MAGENTA}${BG_BRIGHT_CYAN}Testo magenta chiaro sottolineato su sfondo ciano chiaro${RESET}"
echo -e "${EFFECT_REVERSED}${FG_BRIGHT_WHITE}${BG_BRIGHT_RED}Testo bianco chiaro invertito su sfondo rosso chiaro${RESET}"