#!/bin/bash
# Script di esempio per mostrare i processi attivi utilizzando il comando ps.

echo "-----------------------------------------------------"
echo "Esempio 1: Mostra tutti i processi (stile BSD)"
echo "Comando: ps aux"
echo "-----------------------------------------------------"
ps aux
echo "
Spiegazione:
  a: mostra i processi di tutti gli utenti.
  u: mostra l'utente proprietario e altri dettagli.
  x: mostra anche i processi non associati a un terminale.
"

echo "-----------------------------------------------------"
echo "Esempio 2: Mostra tutti i processi (stile System V)"
echo "Comando: ps -ef"
echo "-----------------------------------------------------"
ps -ef
echo "
Spiegazione:
  -e: seleziona tutti i processi.
  -f: formato 'full', mostra più dettagli come UID, PID, PPID, C (CPU usage), STIME (start time).
"

echo "-----------------------------------------------------"
echo "Esempio 3: Mostra i processi in formato gerarchico (albero)"
echo "Comando: ps -ejH"
echo "Oppure: ps axjf (stile BSD)"
echo "-----------------------------------------------------"
ps -ejH
# ps axjf # Alternativa
echo "
Spiegazione:
  -j: formato jobs.
  H: mostra la gerarchia dei processi (albero).
  axjf: un'altra opzione per visualizzare l'albero dei processi.
"

echo "-----------------------------------------------------"
echo "Esempio 4: Mostra campi specifici e ordina per utilizzo CPU"
echo "Comando: ps -eo pid,ppid,user,%cpu,%mem,args --sort=-%cpu | head -n 10"
echo "-----------------------------------------------------"
ps -eo pid,ppid,user,%cpu,%mem,args --sort=-%cpu | head -n 10
echo "
Spiegazione:
  -e: tutti i processi.
  -o: formato definito dall'utente. Specifica le colonne da visualizzare.
  --sort=-%cpu: ordina i processi in base all'utilizzo della CPU in ordine decrescente.
  | head -n 10: mostra solo i primi 10 processi.
"

echo "-----------------------------------------------------"
echo "Esempio 5: Filtrare i processi per nome (usando grep)"
echo "Comando: ps aux | grep 'nome_processo'"
echo "(Sostituisci 'nome_processo' con un nome reale, es. 'bash' o 'systemd')"
echo "-----------------------------------------------------"
# Esempio con 'bash'. Potrebbe restituire anche il processo grep stesso.
ps aux | grep 'bash'
echo "
Spiegazione:
  L'output di 'ps aux' viene passato a 'grep', che filtra le righe contenenti 'nome_processo'.
  Attenzione: 'grep' stesso potrebbe apparire nei risultati.
  Per evitarlo: ps aux | grep '[b]ash' (esempio per 'bash')
"

echo "Per esplorare ulteriormente, prova i comandi 'top' e 'htop' nel tuo terminale."
echo "'top' e 'htop' forniscono una visualizzazione dinamica e interattiva dei processi."