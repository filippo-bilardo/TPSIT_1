#!/bin/bash

# Genera un numero casuale tra 1 e 10
numero_casuale=$(( (RANDOM % 10) + 1 ))

# Inizializza una variabile per il tentativo dell'utente
tentativo=0

# Mostra un messaggio di benvenuto
echo "Benvenuto nel gioco 'Indovina il numero'!"
echo "Ho scelto un numero casuale tra 1 e 10. Prova a indovinarlo!"

# Ciclo while per chiedere all'utente di indovinare il numero
while [[ $tentativo -ne $numero_casuale ]]
do
    # Chiedi all'utente di inserire un numero
    read -p "Inserisci il tuo tentativo: " tentativo

    # Verifica se l'input è un numero valido
    if ! [[ "$tentativo" =~ ^[0-9]+$ ]]; then
        echo "Errore: Devi inserire un numero intero."
        continue
    fi

    # Controlla se il numero è troppo alto o troppo basso
    if [[ $tentativo -lt $numero_casuale ]]; then
        echo "Il numero è più grande!"
    elif [[ $tentativo -gt $numero_casuale ]]; then
        echo "Il numero è più piccolo!"
    else
        echo "Bravo! Hai indovinato il numero!"
    fi
done
