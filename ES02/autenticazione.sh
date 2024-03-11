#!/bin/bash
# Scrivere uno script bash che simula un sistema di accesso richiedendo all'utente di inserire 
# un nome utente e una password. Il sistema deve verificare se le credenziali inserite 
# corrispondono a un set predefinito e stampare un messaggio appropriato.

# Definisco le credenziali
USERNAME="admin"
PASSWORD="admin"

# Chiedo all'utente di inserire le credenziali
echo "Inserisci il nome utente:"
read username
echo "Inserisci la password:"
# Nascondo la password
# -s: silent, non stampa i caratteri inseriti
read -s password

# Verifico se le credenziali inserite corrispondono a quelle predefinite
if [ $username == $USERNAME ] && [ $password == $PASSWORD ]; then
    echo "Accesso consentito"
else
    echo "Accesso negato"
fi

