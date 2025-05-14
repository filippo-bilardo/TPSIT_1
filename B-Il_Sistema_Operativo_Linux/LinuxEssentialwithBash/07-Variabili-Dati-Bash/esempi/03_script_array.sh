#!/bin/bash

# Esempio: Utilizzo degli Array in Bash

echo "--- Array Indicizzati (Numerici) ---"

# Dichiarazione di un array indicizzato
frutti=("Mela" "Pera" "Banana" "Arancia" "Kiwi")

# Altro modo per dichiarare e assegnare elementi
# numeri[0]=10
# numeri[1]=20
# numeri[2]=30

echo "Array 'frutti': ${frutti[@]}"

# Accesso a un elemento specifico (indice 0-based)
echo "Primo frutto (indice 0): ${frutti[0]}"
_secondo_frutto=${frutti[1]}
echo "Secondo frutto (indice 1): ${_secondo_frutto}"

# Numero di elementi nell'array
num_elementi=${#frutti[@]}
echo "Numero di frutti nell'array: $num_elementi"

# Aggiungere un elemento all'array
frutti+=("Mango")
echo "Array 'frutti' dopo aver aggiunto 'Mango': ${frutti[@]}"
echo "Nuovo numero di frutti: ${#frutti[@]}"

# Modificare un elemento esistente
frutti[1]="Pesca" # Sostituisce 'Pera' con 'Pesca'
echo "Array 'frutti' dopo aver modificato l'elemento all'indice 1: ${frutti[@]}"

# Iterare su tutti gli elementi di un array indicizzato
echo "Iterazione sull'array 'frutti':"
for frutto in "${frutti[@]}"; do
  echo "  - $frutto"
done

# Ottenere gli indici dell'array
echo "Indici dell'array 'frutti': ${!frutti[@]}"

# Rimuovere un elemento (usando unset - questo può creare "buchi" negli indici)
# unset frutti[2] # Rimuove 'Banana'
# echo "Array 'frutti' dopo unset frutti[2]: ${frutti[@]}"
# echo "Indici dopo unset: ${!frutti[@]}"
# echo "Numero elementi dopo unset: ${#frutti[@]}" # Attenzione: ${#frutti[@]} conta ancora gli elementi non nulli

# Slicing di array (estrarre una porzione)
# ${array[@]:offset:lunghezza}
sotto_array=${frutti[@]:1:3} # Elementi dall'indice 1 (incluso) per 3 elementi
echo "Sotto-array (elementi da indice 1 per 3 elementi): ${sotto_array[@]}"

echo "\n--- Array Associativi (Bash 4.0+) ---"

# Gli array associativi devono essere dichiarati esplicitamente con declare -A
declare -A capitali

# Assegnazione di elementi (chiave-valore)
capitali["Italia"]="Roma"
capitali["Francia"]="Parigi"
capitali["Germania"]="Berlino"
capitali["Spagna"]="Madrid"

echo "Array associativo 'capitali' (valori): ${capitali[@]}"

# Accesso a un valore tramite la sua chiave
echo "Capitale della Francia: ${capitali[Francia]}"

# Numero di elementi in un array associativo
echo "Numero di nazioni/capitali: ${#capitali[@]}"

# Ottenere tutte le chiavi (indici)
echo "Nazioni (chiavi) nell'array 'capitali': ${!capitali[@]}"

# Aggiungere un nuovo elemento
capitali["Regno Unito"]="Londra"
echo "Array 'capitali' dopo aver aggiunto 'Regno Unito': ${capitali[@]}"

# Modificare un valore esistente
capitali["Germania"]="Berlino (Capitale)"
echo "Valore per 'Germania' modificato: ${capitali[Germania]}"

# Iterare su un array associativo (chiavi e valori)
echo "Iterazione sull'array 'capitali' (Nazione - Capitale):"
for nazione in "${!capitali[@]}"; do
  echo "  - La capitale di $nazione è ${capitali[$nazione]}."
done

# Rimuovere un elemento da un array associativo
unset capitali["Spagna"]
echo "Array 'capitali' dopo aver rimosso 'Spagna': ${capitali[@]}"
echo "Chiavi dopo rimozione: ${!capitali[@]}"

# Verificare se una chiave esiste
paese_test="Italia"
if [[ -v capitali[$paese_test] ]]; then
    echo "La chiave '$paese_test' esiste nell'array 'capitali'. Valore: ${capitali[$paese_test]}"
else
    echo "La chiave '$paese_test' NON esiste nell'array 'capitali'."
fi

paese_test_non_esistente="Giappone"
if [[ -v capitali[$paese_test_non_esistente] ]]; then
    echo "La chiave '$paese_test_non_esistente' esiste."
else
    echo "La chiave '$paese_test_non_esistente' NON esiste."
fi

echo "\nScript terminato."