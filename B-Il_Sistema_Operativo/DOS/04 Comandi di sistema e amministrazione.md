### Capitolo 3: Comandi di sistema e amministrazione

I comandi di sistema e amministrazione sono essenziali per gestire e mantenere un sistema Windows in modo efficiente. Questo capitolo esplora i comandi più utili per monitorare le risorse di sistema, gestire i processi e configurare le impostazioni di rete.

#### Visualizzazione delle informazioni di sistema

- **`systeminfo`**: Fornisce una panoramica dettagliata delle informazioni di sistema, inclusi il sistema operativo, la configurazione dell'hardware e le impostazioni di rete.

- **`driverquery`**: Elenca tutti i driver di dispositivo installati sul sistema, con dettagli come il nome del driver, il fornitore e la versione.

- **`dxdiag`**: Avvia lo strumento di diagnostica DirectX, che fornisce informazioni dettagliate sul sistema, inclusi i componenti DirectX, il display e il suono.

#### Gestione dei processi e delle attività

- **`tasklist`**: Elenca tutti i processi attualmente in esecuzione sul sistema, con dettagli come l'ID del processo, il nome dell'immagine e l'utilizzo della memoria.
  - `tasklist /svc`: Mostra i servizi ospitati da ciascun processo.

- **`taskkill`**: Termina uno o più processi in esecuzione. Può essere utilizzato per forzare la chiusura di applicazioni non rispondenti.
  - `taskkill /IM nomeprocesso.exe`: Termina un processo specifico.
  - `taskkill /PID IDprocesso`: Termina un processo utilizzando il suo ID.

- **`taskmgr`**: Avvia il Gestione attività, che fornisce un'interfaccia grafica per monitorare e gestire i processi, le prestazioni del sistema e le applicazioni in esecuzione.

#### Configurazione di rete

- **`ipconfig`**: Visualizza le configurazioni di rete correnti, inclusi gli indirizzi IP, le maschere di sottorete e i gateway predefiniti.
  - `ipconfig /all`: Mostra tutte le informazioni di configurazione di rete.
  - `ipconfig /release`: Libera l'indirizzo IP corrente.
  - `ipconfig /renew`: Rinnova l'indirizzo IP corrente.

- **`ping`**: Testa la connettività di rete verso un altro host. È utile per diagnosticare problemi di connessione.
  - `ping google.com`: Invia pacchetti ICMP a un host specifico.

- **`netstat`**: Mostra le connessioni di rete attive, le porte di ascolto e le statistiche di rete.
  - `netstat -a`: Visualizza tutte le connessioni e le porte di ascolto.
  - `netstat -e`: Mostra le statistiche Ethernet.

#### Esempi pratici di amministrazione di sistema

1. **Monitoraggio delle risorse di sistema**:
   ```shell
   systeminfo > sistema.txt
   ```
   Questo comando salva le informazioni di sistema in un file di testo per una facile consultazione.

2. **Terminare un processo non rispondente**:
   ```shell
   taskkill /IM notepad.exe
   ```
   Questo comando forza la chiusura di tutte le istanze di Notepad in esecuzione.

3. **Diagnostica di rete**:
   ```shell
   ping 8.8.8.8
   ```
   Questo comando testa la connettività verso il DNS pubblico di Google.

#### Best practice per l'amministrazione di sistema

- **Documentazione**: Mantieni una documentazione delle modifiche apportate al sistema, specialmente quando esegui comandi che alterano la configurazione di sistema.
- **Backup**: Prima di eseguire comandi che possono influire sul sistema, assicurati di avere un backup dei dati importanti.
- **Privilegi di amministratore**: Molti comandi di amministrazione richiedono privilegi elevati. Esegui il Prompt dei comandi come amministratore quando necessario.

#### Domande di autovalutazione

1. Quale comando viene utilizzato per visualizzare le informazioni di sistema dettagliate?
   a) `sysinfo`
   b) `systeminfo`
   c) `sysdetails`
   d) `infosys`

2. Come si termina un processo utilizzando il suo ID?
   a) `endtask /PID`
   b) `taskkill /PID`
   c) `killtask /ID`
   d) `stopprocess /PID`

3. Quale comando testa la connettività di rete verso un host?
   a) `nettest`
   b) `ping`
   c) `connect`
   d) `checknet`

#### Esercizi pratici

1. Utilizza `systeminfo` per generare un rapporto di sistema e salvalo in un file di testo.
2. Usa `tasklist` per elencare tutti i processi in esecuzione e identifica un processo che puoi terminare in sicurezza con `taskkill`.
3. Configura un indirizzo IP statico utilizzando `ipconfig` e verifica la connessione con `ping`.

Questi esercizi ti aiuteranno a familiarizzare con i comandi di sistema e amministrazione, migliorando la tua capacità di gestire e mantenere un sistema Windows. Buon lavoro!