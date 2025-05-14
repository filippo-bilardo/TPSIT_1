#!/bin/bash

# Esempio: Espansione Variabili, Sostituzione Comandi e Aritmetica

echo "--- Espansione Avanzata delle Variabili ---"

# Valori di default
# unset utente_prova
echo "Utente (default se non impostato): ${utente_prova:-'ospite'}"
echo "Valore di utente_prova dopo :- : ${utente_prova}" # Non dovrebbe essere impostata

echo "Utente (default e assegna se non impostato): ${utente_prova:='visitatore'}"
echo "Valore di utente_prova dopo := : ${utente_prova}" # Ora dovrebbe essere 'visitatore'

# Controllo se una variabile è impostata, altrimenti errore
# unset variabile_critica
# echo "Variabile critica: ${variabile_critica:?'ERRORE: variabile_critica non è impostata!'}" # Questo causerebbe l'uscita dallo script

# Lunghezza di una stringa
stringa_test="Hello Bash"
echo "Stringa: '$stringa_test'"
echo "Lunghezza della stringa (\${#stringa_test}): ${#stringa_test}"

# Rimozione di pattern
file_completo="/home/utente/documenti/mio_file.tar.gz"
echo "File completo: $file_completo"
echo "Nome file (rimuovi percorso più lungo ##*/): ${file_completo##*/}" # mio_file.tar.gz
echo "Percorso (rimuovi nome file più corto %/*): ${file_completo%/*}"   # /home/utente/documenti
echo "Senza estensione .gz (%%*.gz): ${file_completo%%.gz}" # /home/utente/documenti/mio_file.tar
echo "Senza estensione .tar.gz (%%*.tar.gz): ${file_completo%%.tar.gz}" # /home/utente/documenti/mio_file

# Sostituzione di pattern
url="https://www.esempio.com/pagina?query=test"
echo "URL originale: $url"
echo "Sostituisci 'https' con 'http' (prima occorrenza): ${url/https/http}"

frase_ripetuta="uno due tre uno quattro uno"
echo "Frase: $frase_ripetuta"
echo "Sostituisci tutti 'uno' con 'ZERO' (//): ${frase_ripetuta//uno/ZERO}"

echo "\n--- Sostituzione di Comandi ---"

data_ora_corrente=$(date +"%Y-%m-%d %H:%M:%S")
echo "Data e ora correnti (usando \$(date)): $data_ora_corrente"

# Esempio con backticks (sintassi legacy)
kernel_version=`uname -r`
echo "Versione del kernel (usando \\`uname -r\\`): $kernel_version"

# Utilizzo dell'output di un comando in un altro
num_file_corrente=$(ls -1 | wc -l) # Conta i file nella directory corrente
echo "Numero di file/directory nella directory corrente: $num_file_corrente"

echo "\n--- Operazioni Aritmetiche ---"

num1=25
num2=7

echo "Numero 1: $num1, Numero 2: $num2"

# Usando \$(( )) - preferito
somma=$((num1 + num2))
prodotto=$((num1 * num2))
divisione_intera=$((num1 / num2))
resto=$((num1 % num2))
potenza=$((num2 ** 3)) # 7 elevato alla 3

echo "Somma (\$((num1 + num2))): $somma"
echo "Prodotto (\$((num1 * num2))): $prodotto"
echo "Divisione Intera (\$((num1 / num2))): $divisione_intera"
echo "Resto (\$((num1 % num2))): $resto"
echo "Potenza (\$((num2 ** 3))): $potenza"

# Incremento e decremento
contatore=5
echo "Contatore iniziale: $contatore"
((contatore++)) # Incrementa di 1
echo "Contatore dopo ++: $contatore"
((contatore += 5)) # Incrementa di 5
echo "Contatore dopo += 5: $contatore"

# Usando 'let'
let diff=num1-num2
echo "Differenza (usando let): $diff"

let num1*=2 # Moltiplica num1 per 2 e assegna
echo "num1 dopo let num1*=2 : $num1"

# Nota: Bash gestisce nativamente solo aritmetica intera.
# Per numeri in virgola mobile, si usano utility come 'bc'.
echo "Calcolo con bc (10.5 / 2.5): $(echo "10.5 / 2.5" | bc)"

echo "\nScript terminato."