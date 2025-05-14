#!/bin/bash

# Esempio di utilizzo del costrutto if-else in Bash
# Questo script dimostra vari tipi di controlli condizionali

# 1. Controllo numerico semplice
echo "=== Esempio 1: Controllo numerico semplice ==="
eta=20

if [ $eta -ge 18 ]; then
    echo "Sei maggiorenne (hai $eta anni)."
else
    echo "Sei minorenne (hai $eta anni)."
fi

# 2. Controllo con elif (else if)
echo -e "\n=== Esempio 2: Controllo con elif ==="
voto=75

if [ $voto -ge 90 ]; then
    echo "Eccellente! Hai ottenuto un voto A."
elif [ $voto -ge 80 ]; then
    echo "Molto bene! Hai ottenuto un voto B."
elif [ $voto -ge 70 ]; then
    echo "Bene! Hai ottenuto un voto C."
elif [ $voto -ge 60 ]; then
    echo "Sufficiente. Hai ottenuto un voto D."
else
    echo "Insufficiente. Hai ottenuto un voto F."
fi

# 3. Controllo di stringhe
echo -e "\n=== Esempio 3: Controllo di stringhe ==="
nome="Mario"

if [ -z "$nome" ]; then
    echo "La variabile nome è vuota."
elif [ "$nome" = "Mario" ]; then
    echo "Ciao Mario!"
else
    echo "Tu non sei Mario, sei $nome."
fi

# 4. Controllo di file
echo -e "\n=== Esempio 4: Controllo di file ==="
file="/etc/passwd"
file_inesistente="/percorso/inesistente/file.txt"

if [ -f "$file" ]; then
    echo "$file esiste ed è un file regolare."
    
    # Controllo annidato
    if [ -r "$file" ]; then
        echo "$file è anche leggibile."
    else
        echo "$file esiste ma non è leggibile."
    fi
else
    echo "$file non esiste o non è un file regolare."
fi

# Controllo di un file inesistente
if [ ! -e "$file_inesistente" ]; then
    echo "$file_inesistente non esiste."
fi

# 5. Operatori logici
echo -e "\n=== Esempio 5: Operatori logici ==="
giorno="Domenica"
piove=true

# Utilizzo di AND logico (&&)
if [ "$giorno" = "Domenica" ] && [ "$piove" = true ]; then
    echo "È domenica e piove, resta a casa e guarda un film."
fi

# Utilizzo di OR logico (||)
if [ "$giorno" = "Sabato" ] || [ "$giorno" = "Domenica" ]; then
    echo "È weekend! Puoi rilassarti."
fi

# 6. Utilizzo di [[ ]] (estensione Bash)
echo -e "\n=== Esempio 6: Utilizzo di [[ ]] ==="
frase="Il gatto è sul tavolo"

# Ricerca di pattern con =~
if [[ "$frase" =~ gatto ]]; then
    echo "La frase contiene la parola 'gatto'."
fi

# Confronto alfabetico senza escape
if [[ "apple" < "banana" ]]; then
    echo "'apple' viene prima di 'banana' alfabeticamente."
fi

# 7. Controllo del valore di ritorno di un comando
echo -e "\n=== Esempio 7: Controllo del valore di ritorno ==="

# Il comando grep cerca un pattern in un file
grep -q "root" /etc/passwd

# $? contiene il valore di ritorno dell'ultimo comando eseguito
if [ $? -eq 0 ]; then
    echo "L'utente 'root' è presente nel file /etc/passwd."
else
    echo "L'utente 'root' non è stato trovato."
fi

echo -e "\nEsempi completati!"