#!/bin/bash
# 04_invia_segnali.sh

echo "Avvio un processo fittizio (un loop che scrive su un file) per testare i segnali."
echo "Il processo scriverà ogni secondo nel file ./loop_output.txt"

# File di output per il loop
OUTPUT_FILE="./loop_output.txt"

# Pulisce il file di output se esiste
> $OUTPUT_FILE

# Avvia il loop in background
(
  trap "echo Loop interrotto da un segnale; exit" SIGINT SIGTERM SIGHUP
  i=0
  while true; do
    echo "Loop iteration $i at $(date)" >> $OUTPUT_FILE
    i=$((i+1))
    sleep 1
  done
) &

LOOP_PID=$!
echo "Processo loop avviato in background con PID: $LOOP_PID"
echo "Controlla il file $OUTPUT_FILE per vedere l'output."

echo ""
sleep 3 # Lascia che il loop scriva qualcosa

echo "Tentativo di inviare SIGHUP (segnale 1) al processo $LOOP_PID (spesso usato per rileggere la configurazione)"
kill -SIGHUP $LOOP_PID
sleep 3 # Dai tempo al processo di reagire (se gestisce il segnale)

echo ""
echo "Tentativo di inviare SIGTERM (segnale 15) al processo $LOOP_PID (richiesta di terminazione pulita)"
kill -SIGTERM $LOOP_PID
sleep 3 # Dai tempo al processo di terminare

# Controlla se il processo è ancora attivo
if ps -p $LOOP_PID > /dev/null; then
  echo ""
  echo "Il processo $LOOP_PID è ancora attivo. Tentativo con SIGKILL (segnale 9 - terminazione forzata)."
  kill -SIGKILL $LOOP_PID
  sleep 1
  if ps -p $LOOP_PID > /dev/null; then
    echo "Il processo $LOOP_PID non è stato terminato nemmeno con SIGKILL. Qualcosa non va."
  else
    echo "Processo $LOOP_PID terminato con SIGKILL."
  fi
else
  echo "Processo $LOOP_PID terminato con SIGTERM o SIGHUP."
fi

echo ""
echo "Contenuto finale di $OUTPUT_FILE (se il processo ha scritto qualcosa prima di terminare):"
cat $OUTPUT_FILE

echo ""
echo "Script 04_invia_segnali.sh completato."
