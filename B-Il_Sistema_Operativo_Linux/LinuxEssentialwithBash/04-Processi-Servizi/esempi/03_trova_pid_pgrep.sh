#!/bin/bash
# 03_trova_pid_pgrep.sh

# Avvia un processo fittizio in background per avere qualcosa da cercare
echo "Avvio 'sleep 120 &' come processo di test..."
sleep 120 &
SLEEP_PID=$!
echo "Processo 'sleep 120' avviato con PID: $SLEEP_PID"

echo ""
echo "Cerco processi con nome 'sleep' usando 'pgrep sleep':"
pgrep sleep

echo ""
echo "Cerco processi con nome 'sleep' avviati dall'utente corrente (`whoami`) usando 'pgrep -u $(whoami) sleep':"
pgrep -u $(whoami) sleep

echo ""
echo "Cerco il processo 'sleep' più vecchio usando 'pgrep -o sleep':"
pgrep -o sleep

echo ""
echo "Cerco il processo 'sleep' più recente usando 'pgrep -n sleep':"
pgrep -n sleep

echo ""
echo "Per terminare il processo di test (PID: $SLEEP_PID), puoi usare: kill $SLEEP_PID"

# Lascia il tempo di vedere l'output prima di terminare lo script e potenzialmente il processo sleep se non è demone
# Nota: lo script 'sleep' continuerà a girare in background se non terminato manualmente.
