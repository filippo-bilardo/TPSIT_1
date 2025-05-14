#!/bin/bash
# 02_processo_background.sh

echo "Avvio un comando 'sleep 60' in background."

sleep 60 &

# Salva il PID dell'ultimo processo avviato in background
BG_PID=$!

echo "Comando avviato in background con PID: $BG_PID"
echo "Puoi usare 'jobs' per vedere i processi in background da questo terminale."
echo "Puoi usare 'ps aux | grep sleep' o 'pgrep sleep' per trovarlo da un altro terminale."
echo "Per terminarlo, usa 'kill $BG_PID' o 'fg' per portarlo in foreground e poi Ctrl+C."

# Attendi qualche secondo per dare tempo all'utente di vedere i messaggi
sleep 5

echo "Script 02_processo_background.sh terminato."
