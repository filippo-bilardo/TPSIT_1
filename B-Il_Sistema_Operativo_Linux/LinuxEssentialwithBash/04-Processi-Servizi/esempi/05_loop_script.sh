#!/bin/bash
# 05_loop_script.sh

echo "Questo script avvia un loop infinito che stampa un messaggio ogni 2 secondi."
echo "PID di questo script: $$"
echo "Per terminarlo, usa Ctrl+C se è in foreground."
echo "Se lo avvii in background (es. './05_loop_script.sh &'),"
echo "dovrai trovare il suo PID (es. con 'pgrep 05_loop_script.sh' o 'jobs -l')"
echo "e poi usare 'kill <PID>' per terminarlo."

i=0
while true
do
  echo "Loop iteration $i at $(date) - PID: $$"
  i=$((i+1))
  sleep 2
done
