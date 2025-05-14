#!/bin/bash

# Esempio: Variabili Speciali e Parametri Posizionali

echo "--- Informazioni sullo Script e Argomenti ---"
echo "Nome dello script (\$0): $0"
echo "Numero di argomenti passati (\$#): $#"

# Controlla se sono stati passati argomenti
if [ "$#" -eq 0 ]; then
  echo "Nessun argomento passato allo script."
else
  echo "Primo argomento (\$1): $1"
  echo "Secondo argomento (\$2): $2"
  echo "Tutti gli argomenti come stringa unica (\$*): $*"
  echo "Tutti gli argomenti come parole separate (\$@): $@"

  echo "Iterazione sugli argomenti usando \"\$@\":"
  for arg in "$@"; do
    echo "  Argomento: $arg"
  done
fi

echo "\n--- Variabili Speciali di Stato e Processo ---"
# Eseguiamo un comando che ha successo e uno che fallisce per vedere $?
ls / > /dev/null
echo "Exit status dell'ultimo comando (ls /) (\$?): $?" # Dovrebbe essere 0

ls /non_esiste_sicuramente > /dev/null 2>&1
echo "Exit status dell'ultimo comando (ls /non_esiste_sicuramente) (\$?): $?" # Dovrebbe essere diverso da 0

echo "PID dello script corrente (\$$): $$"

# Esempio con un comando in background (semplice sleep)
echo "Avvio 'sleep 2' in background..."
sleep 2 &
pid_background=$!
echo "PID dell'ultimo comando in background (\$!): $pid_background"

echo "Attendo il completamento del comando in background..."
wait $pid_background
echo "Comando in background terminato."

# $_ (ultimo argomento del comando precedente)
# Per vederlo in azione, eseguiamo un comando e poi lo stampiamo
echo "Test per \$_"
ls -l /tmp > /dev/null
echo "Ultimo argomento del comando precedente (ls -l /tmp) (\$_): $_" # Dovrebbe essere /tmp

echo "\n--- Altre Variabili Speciali ---"
echo "Numero di riga corrente (\$LINENO): $LINENO"

mostra_nome_funzione() {
  echo "Nome della funzione corrente (\$FUNCNAME): $FUNCNAME"
  echo "Numero di riga corrente dentro la funzione (\$LINENO): $LINENO"
}

mostra_nome_funzione

echo "\nScript terminato."

# Per testare questo script, eseguilo con alcuni argomenti, ad esempio:
# ./01_script_variabili_speciali_e_parametri.sh primo "secondo argomento con spazi" terzo