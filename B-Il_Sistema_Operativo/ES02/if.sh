#!/bin/bash
# Esempi di if-then-else-fi

# Esempio 1 - if-then-fi
# se i comandi sono eseguiti con successo, allora esegui il comando successivo
echo "-----------------------------------"
echo "Esempio 1 - if comando1; comando2; comando3; then "; echo
if ls; ps; pwd; then
    # Comandi da eseguire se tutte le condizioni sono soddisfatte
    echo "Tutti i comandi sono stati eseguiti con successo"
else
    # Comandi da eseguire se almeno una condizione non è soddisfatta
    echo "Almeno uno dei comandi non è stato eseguito con successo"
fi

echo
echo "Fine esempio 1"
echo "-----------------------------------"
# Esempio 2 - if-then-else-fi
# if con un'espressione condizionale con [ ]
echo "Esempio 2 - if [ espressione ]; then "; echo
if [ 1 -eq 1 ]; then
    # Comandi da eseguire se tutte le condizioni sono soddisfatte
    echo "1 è uguale a 1"
else
    # Comandi da eseguire se almeno una condizione non è soddisfatta
    echo "1 non è uguale a 1"
fi

echo
echo "Fine esempio 2"
echo "-----------------------------------"