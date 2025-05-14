#!/bin/bash
# ==============================================
# Script di esempio: Variabili e Tipi di Dati in Bash
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
echo -e "${BOLD}${BLUE}    DIMOSTRAZIONE VARIABILI E TIPI DATI    ${RESET}"
echo -e "${BOLD}${BLUE}=========================================${RESET}"
echo

# Funzione per mostrare una sezione
show_section() {
    echo -e "\n${BOLD}${YELLOW}$1${RESET}"
    echo -e "${YELLOW}$(printf '=%.0s' $(seq 1 ${#1}))${RESET}\n"
}

# -------------------------
# PARTE 1: VARIABILI SEMPLICI
# -------------------------
show_section "1. Variabili Semplici"

# Assegnazione di variabili base
nome="Mario"
cognome='Rossi'
eta=42
pi=3.14159

# Visualizzazione variabili
echo -e "Nome: ${BOLD}$nome${RESET}"
echo -e "Cognome: ${BOLD}$cognome${RESET}"
echo -e "Età: ${BOLD}$eta${RESET}"
echo -e "Pi greco: ${BOLD}$pi${RESET}"

# Dimostrazione della differenza tra virgolette singole e doppie
echo -e "\n${BOLD}Differenza tra virgolette:${RESET}"
echo -e "Doppie: ${GREEN}\"Ciao $nome\"${RESET} → ${BOLD}Ciao $nome${RESET}"
echo -e "Singole: ${RED}'Ciao $nome'${RESET} → ${BOLD}Ciao $nome${RESET}"

# Dimostrazione di concatenazione
nome_completo="$nome $cognome"
echo -e "\n${BOLD}Concatenazione:${RESET}"
echo -e "Nome completo: ${BOLD}$nome_completo${RESET}"

# -------------------------
# PARTE 2: VARIABILI SPECIALI
# -------------------------
show_section "2. Variabili Speciali"

echo -e "Nome script: ${BOLD}$0${RESET}"
echo -e "PID del processo: ${BOLD}$$${RESET}"
echo -e "Numero argomenti: ${BOLD}$#${RESET}"
echo -e "Tutti gli argomenti: ${BOLD}$@${RESET}"
echo -e "Exit status dell'ultimo comando: ${BOLD}$?${RESET}"

# Esempio con comando fallito
non_esiste_comando 2>/dev/null
echo -e "Exit status dopo comando fallito: ${BOLD}$?${RESET}"

# -------------------------
# PARTE 3: ESPANSIONE VARIABILI
# -------------------------
show_section "3. Espansione delle Variabili"

# Valori predefiniti
echo -e "${BOLD}Valori predefiniti:${RESET}"
var_non_definita=""
echo -e "Normale: \${var_non_definita} → ${BOLD}${var_non_definita}${RESET} (vuota)"
echo -e "Con default: \${var_non_definita:-\"valore predefinito\"} → ${BOLD}${var_non_definita:-"valore predefinito"}${RESET}"

# Assegnazione con default
echo -e "\n${BOLD}Assegnazione con default:${RESET}"
echo -e "Prima: \$var_non_definita = ${BOLD}${var_non_definita}${RESET} (vuota)"
echo -e "Usando :=: \${var_non_definita:=\"nuovo valore\"} → ${BOLD}${var_non_definita:="nuovo valore"}${RESET}"
echo -e "Dopo: \$var_non_definita = ${BOLD}${var_non_definita}${RESET}"

# Lunghezza stringa
stringa="Ciao Mondo"
echo -e "\n${BOLD}Lunghezza stringa:${RESET}"
echo -e "Stringa: \"$stringa\""
echo -e "Lunghezza: \${#stringa} → ${BOLD}${#stringa}${RESET} caratteri"

# Sottostringa
echo -e "\n${BOLD}Sottostringa:${RESET}"
echo -e "Stringa: \"$stringa\""
echo -e "Primi 4 caratteri: \${stringa:0:4} → ${BOLD}${stringa:0:4}${RESET}"
echo -e "Dal carattere 5 alla fine: \${stringa:5} → ${BOLD}${stringa:5}${RESET}"

# Sostituzione di pattern
echo -e "\n${BOLD}Sostituzione di pattern:${RESET}"
frase="Il gatto nero e il gatto bianco"
echo -e "Frase originale: \"$frase\""
echo -e "Prima sostituzione: \${frase/gatto/cane} → ${BOLD}${frase/gatto/cane}${RESET}"
echo -e "Sostituisci tutte: \${frase//gatto/cane} → ${BOLD}${frase//gatto/cane}${RESET}"

# Rimozione di pattern
echo -e "\n${BOLD}Rimozione di pattern:${RESET}"
file="documento.report.txt.bak"
echo -e "Nome file: \"$file\""
echo -e "Rimuovi prefisso corto: \${file#*.} → ${BOLD}${file#*.}${RESET}"
echo -e "Rimuovi prefisso lungo: \${file##*.} → ${BOLD}${file##*.}${RESET}"
echo -e "Rimuovi suffisso corto: \${file%.*} → ${BOLD}${file%.*}${RESET}"
echo -e "Rimuovi suffisso lungo: \${file%%.*} → ${BOLD}${file%%.*}${RESET}"

# -------------------------
# PARTE 4: OPERAZIONI ARITMETICHE
# -------------------------
show_section "4. Operazioni Aritmetiche"

# Aritmetica base
a=5
b=3
echo -e "Variabili: a=$a, b=$b"
echo -e "\n${BOLD}Operazioni base:${RESET}"
echo -e "Addizione: \$((a + b)) → ${BOLD}$((a + b))${RESET}"
echo -e "Sottrazione: \$((a - b)) → ${BOLD}$((a - b))${RESET}"
echo -e "Moltiplicazione: \$((a * b)) → ${BOLD}$((a * b))${RESET}"
echo -e "Divisione: \$((a / b)) → ${BOLD}$((a / b))${RESET} (divisione intera)"
echo -e "Modulo: \$((a % b)) → ${BOLD}$((a % b))${RESET}"
echo -e "Potenza: \$((a ** 2)) → ${BOLD}$((a ** 2))${RESET}"

# Incremento e decremento
echo -e "\n${BOLD}Incremento e decremento:${RESET}"
echo -e "Pre-incremento: \$((++a)) → ${BOLD}$((++a))${RESET}, ora a = $a"
echo -e "Post-decremento: \$((b--)) → ${BOLD}$((b--))${RESET}, ora b = $b"

# Operatori di confronto
echo -e "\n${BOLD}Confronti:${RESET}"
echo -e "Maggiore: \$((a > b)) → ${BOLD}$((a > b))${RESET} (1 = vero)"
echo -e "Uguale: \$((a == 6)) → ${BOLD}$((a == 6))${RESET} (0 = falso)"
echo -e "Diverso: \$((a != 6)) → ${BOLD}$((a != 6))${RESET} (1 = vero)"

# -------------------------
# PARTE 5: SOSTITUZIONE DI COMANDI
# -------------------------
show_section "5. Sostituzione di Comandi"

# Usando $()
echo -e "${BOLD}Usando \$(comando):${RESET}"
echo -e "Data e ora: \$(date) → ${BOLD}$(date)${RESET}"
echo -e "Directory attuale: \$(pwd) → ${BOLD}$(pwd)${RESET}"
echo -e "Nome sistema: \$(uname -n) → ${BOLD}$(uname -n)${RESET}"

# Usando `comando` (backticks)
echo -e "\n${BOLD}Usando \`comando\` (backticks):${RESET}"
echo -e "Nome utente: \`whoami\` → ${BOLD}`whoami`${RESET}"

# Comando annidato
echo -e "\n${BOLD}Comando annidato:${RESET}"
echo -e "File più grande: \$(du -h \$(find . -type f -name \"*.sh\" | head -1)) → ${BOLD}$(du -h $(find . -type f -name "*.sh" | head -1) 2>/dev/null)${RESET}"

# -------------------------
# PARTE 6: ARRAY
# -------------------------
show_section "6. Array"

# Array indicizzati
echo -e "${BOLD}Array indicizzati:${RESET}"
frutti=("mela" "banana" "arancia" "kiwi" "uva")

echo -e "Primo elemento: \${frutti[0]} → ${BOLD}${frutti[0]}${RESET}"
echo -e "Terzo elemento: \${frutti[2]} → ${BOLD}${frutti[2]}${RESET}"
echo -e "Tutti gli elementi: \${frutti[@]} → ${BOLD}${frutti[@]}${RESET}"
echo -e "Numero di elementi: \${#frutti[@]} → ${BOLD}${#frutti[@]}${RESET}"
echo -e "Indici utilizzati: \${!frutti[@]} → ${BOLD}${!frutti[@]}${RESET}"
echo -e "Elementi 1-3: \${frutti[@]:1:3} → ${BOLD}${frutti[@]:1:3}${RESET}"

# Aggiunta e rimozione di elementi
echo -e "\n${BOLD}Manipolazione array:${RESET}"
echo -e "Aggiungi un elemento: frutti+=(\"pesca\")"
frutti+=("pesca")
echo -e "Nuovo array: ${BOLD}${frutti[@]}${RESET}"

echo -e "Rimuovi elemento 2: unset frutti[2]"
unset frutti[2]
echo -e "Nuovo array: ${BOLD}${frutti[@]}${RESET}"
echo -e "Indici rimasti: \${!frutti[@]} → ${BOLD}${!frutti[@]}${RESET}"

# Array associativi
echo -e "\n${BOLD}Array associativi:${RESET}"
declare -A capitali
capitali["Italia"]="Roma"
capitali["Francia"]="Parigi"
capitali["Germania"]="Berlino"
capitali["Spagna"]="Madrid"

echo -e "Capitale dell'Italia: \${capitali[Italia]} → ${BOLD}${capitali[Italia]}${RESET}"
echo -e "Tutte le chiavi: \${!capitali[@]} → ${BOLD}${!capitali[@]}${RESET}"
echo -e "Tutte i valori: \${capitali[@]} → ${BOLD}${capitali[@]}${RESET}"

# -------------------------
# PARTE 7: TIPIZZAZIONE CON DECLARE
# -------------------------
show_section "7. Tipizzazione con declare"

# Integer
echo -e "${BOLD}Integer (declare -i):${RESET}"
declare -i numero=42
echo -e "Valore iniziale: $numero"
echo -e "Assegnazione: numero=\"10+5\""
numero="10+5"
echo -e "Nuovo valore: ${BOLD}$numero${RESET} (valutato come espressione)"

# Readonly
echo -e "\n${BOLD}Readonly (declare -r):${RESET}"
declare -r COSTANTE="valore immutabile"
echo -e "Valore: $COSTANTE"
echo -e "Tentativo di modifica fallirà: ${RED}COSTANTE=\"nuovo valore\"${RESET}"

# Maiuscole/minuscole
echo -e "\n${BOLD}Conversione maiuscole/minuscole:${RESET}"
declare -u maiuscolo="Questo è un Testo Misto"
declare -l minuscolo="Questo è un Testo Misto"
echo -e "Maiuscolo (-u): ${BOLD}$maiuscolo${RESET}"
echo -e "Minuscolo (-l): ${BOLD}$minuscolo${RESET}"

# -------------------------
# PARTE 8: ESEMPI PRATICI
# -------------------------
show_section "8. Esempio Pratico: Elaborazione Parametri"

# Funzione per dimostrare l'elaborazione dei parametri
demo_parametri() {
    local p1=${1:-"[parametro1 mancante]"}
    local p2=${2:-"[parametro2 mancante]"}
    local p3=${3:-"[parametro3 mancante]"}
    
    echo -e "${BOLD}Elaborazione parametri della funzione:${RESET}"
    echo -e "Param 1: ${BOLD}$p1${RESET}"
    echo -e "Param 2: ${BOLD}$p2${RESET}"
    echo -e "Param 3: ${BOLD}$p3${RESET}"
    echo -e "Tutti: ${BOLD}$@${RESET}"
    echo -e "Numero: ${BOLD}$#${RESET}"
}

# Chiamata con diversi numeri di parametri
echo -e "${BOLD}Chiamata senza parametri:${RESET}"
demo_parametri

echo -e "\n${BOLD}Chiamata con 2 parametri:${RESET}"
demo_parametri "primo" "secondo"

# Esempio di elaborazione di una stringa CSV
echo -e "\n${BOLD}Elaborazione stringa CSV:${RESET}"
csv_data="Mario,Rossi,42,Roma,Programmatore"

# Estrai campi
IFS=","
read -r nome cognome eta citta professione <<< "$csv_data"
echo -e "Nome: ${BOLD}$nome${RESET}"
echo -e "Cognome: ${BOLD}$cognome${RESET}"
echo -e "Età: ${BOLD}$eta${RESET}"
echo -e "Città: ${BOLD}$citta${RESET}"
echo -e "Professione: ${BOLD}$professione${RESET}"

# Conclusione
echo -e "\n${BOLD}${GREEN}Dimostrazione completata!${RESET}"
echo -e "${BOLD}${BLUE}=========================================${RESET}"
