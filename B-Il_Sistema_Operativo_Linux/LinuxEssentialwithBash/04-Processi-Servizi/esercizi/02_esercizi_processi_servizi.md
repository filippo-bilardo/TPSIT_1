# Esercizi Pratici sui Processi e Servizi in Linux

Questa serie di esercizi è progettata per farti acquisire familiarità con la gestione dei processi e dei servizi in Linux. Completa ogni esercizio nell'ordine indicato.

## Esercizio 1: Visualizzazione e Analisi dei Processi

1. Apri un terminale
2. Elenca tutti i processi in esecuzione sul sistema con il formato completo:
   ```bash
   ps aux
   ```
3. Identifica i processi che utilizzano più CPU e memoria:
   ```bash
   ps aux --sort=-%cpu | head -n 10
   ps aux --sort=-%mem | head -n 10
   ```
4. Visualizza i processi in formato albero:
   ```bash
   ps axjf
   ```
5. Identifica il processo con PID 1 (il processo init/systemd):
   ```bash
   ps -p 1 -f
   ```
6. Filtra i processi per nome (ad esempio firefox, bash o altro software installato):
   ```bash
   ps aux | grep firefox
   ```
7. Visualizza solo i processi dell'utente corrente:
   ```bash
   ps -u $USER
   ```

## Esercizio 2: Monitoraggio in Tempo Reale

1. Avvia il comando `top` per monitorare i processi in tempo reale:
   ```bash
   top
   ```
2. Mentre `top` è in esecuzione, prova i seguenti comandi interattivi:
   - Premi `P` per ordinare per utilizzo CPU
   - Premi `M` per ordinare per utilizzo memoria
   - Premi `T` per ordinare per tempo di esecuzione
   - Premi `u` seguito dal nome utente per filtrare per utente
   - Premi `k` seguito da un PID per inviare un segnale a un processo
   - Premi `h` per visualizzare l'help
   - Premi `q` per uscire
3. Se è installato, prova ad usare `htop` per una visualizzazione più user-friendly:
   ```bash
   htop
   ```

## Esercizio 3: Processi in Foreground e Background

1. Avvia un processo lungo in foreground:
   ```bash
   sleep 100
   ```
2. Mentre il processo è in esecuzione, premi `Ctrl+Z` per sospenderlo
3. Verifica lo stato dei job:
   ```bash
   jobs
   ```
4. Metti il processo in background:
   ```bash
   bg
   ```
5. Verifica nuovamente lo stato dei job
6. Avvia un altro processo direttamente in background:
   ```bash
   sleep 200 &
   ```
7. Riporta il primo processo in foreground:
   ```bash
   fg %1
   ```
8. Interrompi il processo con `Ctrl+C`

## Esercizio 4: Gestione dei Segnali

1. Avvia un processo in background:
   ```bash
   sleep 300 &
   ```
2. Identifica il PID del processo:
   ```bash
   echo $!  # Mostra il PID dell'ultimo processo in background
   jobs -l  # Mostra tutti i job con PID
   ```
3. Invia un segnale di terminazione al processo:
   ```bash
   kill -15 <PID>  # SIGTERM
   ```
4. Verifica se il processo è terminato:
   ```bash
   ps -p <PID>
   ```
5. Avvia un altro processo in background:
   ```bash
   sleep 300 &
   ```
6. Questa volta terminalo con SIGKILL:
   ```bash
   kill -9 <PID>  # SIGKILL
   ```
7. Avvia più processi sleep in background e termina tutti in una volta:
   ```bash
   sleep 100 & sleep 200 & sleep 300 &
   killall sleep
   ```

## Esercizio 5: Script con Gestione Processi

1. Crea uno script chiamato `process_manager.sh`:
   ```bash
   #!/bin/bash
   # Script per dimostrare la gestione dei processi

   echo "PID di questo script: $$"
   
   # Funzione per la pulizia alla terminazione
   cleanup() {
       echo "Pulizia prima della terminazione..."
       for pid in "${child_pids[@]}"; do
           echo "Terminazione processo figlio $pid..."
           kill $pid 2>/dev/null
       done
       echo "Pulizia completata"
       exit 0
   }
   
   # Registra la funzione di cleanup per i segnali SIGINT e SIGTERM
   trap cleanup SIGINT SIGTERM
   
   # Array per tenere traccia dei PID figli
   child_pids=()
   
   # Avvia tre processi in background
   echo "Avvio processi in background..."
   
   for i in {1..3}; do
       (
           echo "Processo $i (PID: $$) avviato"
           count=0
           while true; do
               echo "Processo $i: ciclo $count"
               count=$((count+1))
               sleep 5
           done
       ) &
       child_pid=$!
       child_pids+=($child_pid)
       echo "Processo $i avviato con PID: $child_pid"
   done
   
   echo "Tutti i processi sono stati avviati"
   echo "Premi Enter per terminare lo script e tutti i processi figli..."
   
   read
   
   cleanup
   ```

2. Rendi lo script eseguibile:
   ```bash
   chmod +x process_manager.sh
   ```

3. Esegui lo script:
   ```bash
   ./process_manager.sh
   ```

4. Mentre lo script è in esecuzione, apri un altro terminale e osserva i processi:
   ```bash
   ps -f --forest  # Mostra l'albero dei processi
   ```

5. Torna al primo terminale e premi Enter per terminare lo script

## Esercizio 6: Priorità dei Processi

1. Avvia un processo CPU-intensive con priorità normale:
   ```bash
   # Crea un file di script temporaneo
   cat > cpu_intensive.sh << 'EOF'
   #!/bin/bash
   # Script CPU-intensive
   echo "PID: $$"
   echo "Priorità iniziale: $(nice)"
   i=0
   while [ $i -lt 100000000 ]; do
       i=$((i+1))
       if [ $((i % 1000000)) -eq 0 ]; then
           echo "Conteggio: $i"
       fi
   done
   EOF
   
   chmod +x cpu_intensive.sh
   ./cpu_intensive.sh &
   ```

2. Osserva la priorità del processo:
   ```bash
   ps -o pid,ppid,ni,cmd -p <PID>
   ```

3. Avvia lo stesso processo con priorità più bassa (nice più alto):
   ```bash
   nice -n 10 ./cpu_intensive.sh &
   ```

4. Avvia un altro processo e cambia la sua priorità mentre è in esecuzione:
   ```bash
   ./cpu_intensive.sh &
   pid=$!
   sudo renice -n 15 -p $pid
   ps -o pid,ppid,ni,cmd -p $pid
   ```

5. Termina tutti i processi CPU-intensive:
   ```bash
   killall cpu_intensive.sh
   ```

## Esercizio 7: Scheduling con Cron

1. Visualizza il tuo crontab attuale:
   ```bash
   crontab -l
   ```

2. Modifica il tuo crontab per aggiungere un job:
   ```bash
   crontab -e
   ```

3. Aggiungi la seguente riga per eseguire un comando ogni minuto (scrive la data e ora in un file):
   ```
   * * * * * date >> $HOME/cron_test.log
   ```

4. Attendi 1-2 minuti, poi verifica il file di log:
   ```bash
   cat $HOME/cron_test.log
   ```

5. Modifica nuovamente il crontab e rimuovi la riga aggiunta:
   ```bash
   crontab -e
   ```

## Esercizio 8: Gestione dei Servizi (systemd)

1. Elenca tutti i servizi attivi:
   ```bash
   systemctl list-units --type=service --state=active
   ```

2. Verifica lo stato di un servizio importante (ad esempio, ssh, apache2, nginx):
   ```bash
   systemctl status ssh  # Sostituisci con un servizio disponibile sul tuo sistema
   ```

3. Visualizza i log di un servizio:
   ```bash
   journalctl -u ssh --no-pager | tail -n 20
   ```

4. Se hai i privilegi sudo, prova a riavviare un servizio (se appropriato per il tuo ambiente):
   ```bash
   sudo systemctl restart ssh  # Sostituisci con un servizio appropriato
   ```

5. Verifica quando il servizio è stato avviato l'ultima volta:
   ```bash
   systemctl show ssh --property=ActiveEnterTimestamp
   ```

## Esercizio 9: Monitoraggio Utilizzo Risorse

1. Visualizza le statistiche di memoria:
   ```bash
   free -h
   ```

2. Visualizza le statistiche di utilizzo del disco:
   ```bash
   df -h
   ```

3. Monitora l'I/O del disco:
   ```bash
   iostat -d -x 2 5  # Richiede il pacchetto sysstat
   ```

4. Monitora le statistiche della CPU:
   ```bash
   mpstat -P ALL 1 5  # Richiede il pacchetto sysstat
   ```

5. Visualizza i file aperti nel sistema:
   ```bash
   lsof | head -n 20
   ```

6. Visualizza i file aperti da un processo specifico:
   ```bash
   lsof -p 1  # Visualizza i file aperti dal processo con PID 1
   ```

## Esercizio 10: Creazione di un Servizio Systemd Personalizzato

1. Crea uno script di servizio chiamato `my_service.sh`:
   ```bash
   #!/bin/bash
   # Script di esempio per un servizio systemd
   
   log_file="$HOME/my_service.log"
   
   echo "$(date) - Servizio avviato con PID: $$" >> $log_file
   
   # Funzione di pulizia
   cleanup() {
       echo "$(date) - Servizio terminato" >> $log_file
       exit 0
   }
   
   # Registra la funzione di cleanup per i segnali
   trap cleanup SIGINT SIGTERM
   
   # Loop principale del servizio
   count=0
   while true; do
       echo "$(date) - Il servizio è in esecuzione, ciclo: $count" >> $log_file
       count=$((count+1))
       sleep 60
   done
   ```

2. Rendi lo script eseguibile:
   ```bash
   chmod +x my_service.sh
   ```

3. Crea un file di unità systemd (richiede privilegi sudo):
   ```bash
   cat > my_service.service << EOF
   [Unit]
   Description=Il mio servizio di esempio
   After=network.target
   
   [Service]
   Type=simple
   ExecStart=$(pwd)/my_service.sh
   Restart=on-failure
   User=$(whoami)
   
   [Install]
   WantedBy=multi-user.target
   EOF
   ```

4. Installa e attiva il servizio (richiede privilegi sudo):
   ```bash
   sudo cp my_service.service /etc/systemd/system/
   sudo systemctl daemon-reload
   sudo systemctl start my_service
   sudo systemctl status my_service
   ```

5. Verifica i log del servizio:
   ```bash
   tail -f $HOME/my_service.log
   ```

6. Ferma il servizio e rimuovi il file di unità (richiede privilegi sudo):
   ```bash
   sudo systemctl stop my_service
   sudo systemctl disable my_service
   sudo rm /etc/systemd/system/my_service.service
   sudo systemctl daemon-reload
   ```

## Verifica di Apprendimento

Rispondi alle seguenti domande:

1. Qual è la differenza tra i comandi `kill`, `killall` e `pkill`?
2. Come puoi mettere in background un processo già avviato in foreground?
3. Quali sono i segnali più comuni inviati ai processi e cosa fanno?
4. Quali sono i vantaggi di usare systemd rispetto ai sistemi di init precedenti?
5. Come puoi impostare un job cron per eseguire uno script ogni domenica alle 2:30 del mattino?
6. Quali strumenti puoi usare per monitorare l'utilizzo delle risorse di sistema in tempo reale?
7. Come puoi verificare quali servizi systemd sono abilitati all'avvio?
