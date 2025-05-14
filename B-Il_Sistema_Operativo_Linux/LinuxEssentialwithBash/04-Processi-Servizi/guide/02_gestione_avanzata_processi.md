# Gestione di Processi e Servizi in Linux

## 1. Introduzione ai Processi in Linux

### 1.1 Cos'è un Processo?

Un processo è un'istanza di un programma in esecuzione. Ogni processo in Linux ha:
- Un identificatore univoco (PID - Process ID)
- Un identificatore del processo genitore (PPID - Parent Process ID)
- Uno spazio di memoria assegnato
- Un proprietario (utente e gruppo)
- Risorse allocate (file aperti, socket, ecc.)

### 1.2 Tipi di Processi

- **Processi in foreground**: Eseguiti direttamente dal terminale, bloccano il prompt fino al completamento
- **Processi in background**: Eseguiti senza bloccare il terminale, consentendo l'esecuzione di altri comandi
- **Daemon**: Processi server in esecuzione in background, solitamente avviati al boot
- **Zombie**: Processi completati ma il cui stato di uscita non è stato ancora letto dal processo genitore
- **Orfani**: Processi il cui processo genitore è terminato

### 1.3 Stati dei Processi

- **Running**: In esecuzione o in attesa di CPU
- **Sleeping**: In attesa di un evento o risorsa
  - Interruptible sleep: può essere risvegliato da segnali
  - Uninterruptible sleep: non può essere interrotto (solitamente in attesa di I/O)
- **Stopped**: Temporaneamente fermato (ad es. con Ctrl+Z)
- **Zombie**: Terminato ma non ancora "raccolto" dal genitore

## 2. Visualizzazione e Monitoraggio dei Processi

### 2.1 Comando ps

Il comando `ps` (process status) è fondamentale per visualizzare i processi attivi:

```bash
# Visualizza tutti i processi (stile BSD)
ps aux

# Visualizza tutti i processi (stile System V)
ps -ef

# Visualizza i processi in formato gerarchico (albero)
ps -ejH
ps axjf

# Visualizza i processi di un utente specifico
ps -u username

# Visualizza informazioni specifiche con formato personalizzato
ps -eo pid,ppid,user,cmd,%cpu,%mem --sort=-%cpu
```

Colonne principali nell'output di `ps`:
- **PID**: ID del processo
- **TTY**: Terminale associato
- **STAT**: Stato del processo (R=running, S=sleeping, Z=zombie, T=stopped)
- **TIME**: Tempo di CPU utilizzato
- **COMMAND**: Comando/programma in esecuzione
- **%CPU/%MEM**: Percentuale di CPU/memoria utilizzata
- **VSZ/RSS**: Memoria virtuale e fisica utilizzata

### 2.2 Comando top

`top` fornisce una vista dinamica e aggiornata dei processi in esecuzione:

```bash
top
```

Principali comandi interattivi in top:
- **h**: Mostra aiuto
- **k**: Invia segnale (kill) a un processo
- **r**: Cambia priorità (renice)
- **f**: Configura colonne visualizzate
- **o/O**: Cambia ordine di visualizzazione
- **M**: Ordina per uso memoria
- **P**: Ordina per uso CPU
- **q**: Esci

### 2.3 Comando htop

`htop` è una versione avanzata di `top` con interfaccia più user-friendly:

```bash
htop
```

Caratteristiche di htop:
- Interfaccia colorata
- Scroll verticale e orizzontale
- Rappresentazione grafica dell'uso di CPU e memoria
- Albero dei processi interattivo
- Operazioni con mouse

## 3. Controllo dei Processi

### 3.1 Segnali

I segnali sono notifiche inviate ai processi per richiedere azioni specifiche:

Segnali comuni:
- **SIGTERM (15)**: Richiesta di terminazione (può essere gestita dal processo)
- **SIGKILL (9)**: Terminazione immediata (non può essere intercettata)
- **SIGINT (2)**: Interruzione (generalmente inviata con Ctrl+C)
- **SIGSTOP (19)**: Sospensione immediata (non può essere intercettata)
- **SIGCONT (18)**: Continua dopo stop
- **SIGHUP (1)**: Disconnessione dal terminale (spesso usato per ricaricare configurazioni)

### 3.2 Comando kill

Il comando `kill` permette di inviare segnali ai processi:

```bash
# Invia SIGTERM (default)
kill PID

# Invia SIGKILL
kill -9 PID
kill -KILL PID

# Invia SIGHUP (spesso usato per ricaricare configurazioni)
kill -HUP PID
```

### 3.3 Comandi killall e pkill

Questi comandi consentono di inviare segnali a processi basati su nome anziché PID:

```bash
# Termina tutti i processi con nome specificato
killall firefox

# Termina processi in base a pattern di nome
pkill fire

# Invia segnale diverso da SIGTERM
killall -9 firefox
pkill -KILL fire

# Termina processi di un utente specifico
pkill -u username
```

### 3.4 Comandi pgrep e pidof

Identificano PID di processi da nome:

```bash
# Trova PID per nome processo
pgrep firefox

# Opzioni avanzate di pgrep
pgrep -u username firefox  # Processi di un utente
pgrep -l firefox           # Elenca anche i nomi

# Alternativa a pgrep
pidof firefox
```

## 4. Gestione di Processi in Foreground e Background

### 4.1 Avvio di Processi in Background

```bash
# Avvia un processo in background
comando &

# Esempio: editor in background
gedit file.txt &
```

### 4.2 Controllo dei Job

```bash
# Elenca job attivi
jobs

# Metti in background un processo attivo (dopo Ctrl+Z)
bg

# Riporta in foreground un processo in background
fg

# Specifica il job number
bg %1
fg %2
```

### 4.3 Sospensione e Ripresa di Processi

```bash
# Sospendi processo in foreground
[Ctrl+Z]

# Continua in background
bg

# Continua in foreground
fg
```

### 4.4 Processi Persistenti (Nohup e Screen)

```bash
# Esegui processo anche dopo chiusura del terminale
nohup comando &

# Usando screen per sessioni persistenti
screen
comando
[Ctrl+A, D]  # Distacca la sessione screen

# Riaggancia sessione screen
screen -r
```

## 5. Priorità dei Processi

### 5.1 Nice e Renice

Il valore di nice determina la priorità di un processo (da -20, massima priorità, a 19, minima priorità):

```bash
# Avvia processo con priorità modificata
nice -n 10 comando

# Cambia priorità di un processo in esecuzione
renice 10 -p PID

# Solo root può aumentare la priorità
sudo renice -10 -p PID
```

## 6. Servizi di Sistema

### 6.1 Introduzione a systemd

systemd è il sistema di init e gestione dei servizi utilizzato nella maggior parte delle distribuzioni Linux moderne:

- Gestisce l'avvio e l'arresto del sistema
- Gestisce servizi e daemon
- Gestisce mount, dispositivi, socket, ecc.
- Fornisce logging tramite journald

### 6.2 Unit di systemd

Le unit di systemd rappresentano risorse gestite dal sistema:

- **.service**: Servizi di sistema
- **.socket**: Socket IPC
- **.device**: Dispositivi
- **.mount/.automount**: Punti di mount
- **.target**: Gruppi di unit (sostituti dei runlevel)
- **.timer**: Timer (sostituti di cron in alcuni casi)

### 6.3 Comando systemctl

`systemctl` è il comando principale per interagire con systemd:

```bash
# Visualizza stato di un servizio
systemctl status ssh

# Avvia/ferma/riavvia servizi
sudo systemctl start apache2
sudo systemctl stop apache2
sudo systemctl restart apache2
sudo systemctl reload apache2  # Ricarica configurazione senza riavviare

# Abilita/disabilita avvio automatico al boot
sudo systemctl enable apache2
sudo systemctl disable apache2

# Elenca tutti i servizi attivi
systemctl list-units --type=service

# Elenca tutti i servizi (attivi e inattivi)
systemctl list-units --type=service --all

# Visualizza dipendenze di un servizio
systemctl list-dependencies apache2
```

### 6.4 Systemd Journal

journalctl è lo strumento per accedere ai log di systemd:

```bash
# Visualizza tutti i log
journalctl

# Log di un servizio specifico
journalctl -u apache2

# Log con priorità specifica (err, warning, info, ecc.)
journalctl -p err

# Log recenti
journalctl -n 100

# Log in tempo reale (follow)
journalctl -f

# Log dal boot corrente
journalctl -b
```

## 7. Scheduling di Attività

### 7.1 Cron

Cron permette di pianificare l'esecuzione periodica di comandi:

```bash
# Modifica il crontab dell'utente corrente
crontab -e

# Lista il crontab dell'utente corrente
crontab -l

# Rimuove il crontab dell'utente corrente
crontab -r
```

Sintassi del crontab:
```
# m h dom mon dow comando
# minuto (0-59), ora (0-23), giorno del mese (1-31), mese (1-12), giorno della settimana (0-7, 0=domenica)

# Esempi:
0 5 * * * /script/backup.sh        # Esegui alle 5:00 ogni giorno
*/10 * * * * /script/monitor.sh    # Esegui ogni 10 minuti
0 9-17 * * 1-5 /script/check.sh    # Esegui alle ore intere, dalle 9 alle 17, lun-ven
```

### 7.2 Comando at

`at` permette di programmare comandi una tantum:

```bash
# Esegui comando alle 14:30
at 14:30
comando
[Ctrl+D]

# Esegui domani
at tomorrow
comando
[Ctrl+D]

# Esegui tra 2 ore
at now + 2 hours
comando
[Ctrl+D]

# Lista job at in attesa
atq

# Rimuovi job at
atrm job_number
```

### 7.3 Systemd Timer

Alternativa moderna a cron, integrata con systemd:

```bash
# Crea file di service
sudo nano /etc/systemd/system/mio-script.service
[Unit]
Description=Il mio script di backup

[Service]
Type=oneshot
ExecStart=/path/to/script.sh

# Crea file di timer
sudo nano /etc/systemd/system/mio-script.timer
[Unit]
Description=Esegui mio-script ogni giorno alle 5:00

[Timer]
OnCalendar=*-*-* 05:00:00
Persistent=true

[Install]
WantedBy=timers.target

# Attiva il timer
sudo systemctl enable --now mio-script.timer

# Verifica timer attivi
systemctl list-timers
```

## 8. Monitoraggio delle Risorse di Sistema

### 8.1 Comando free

Visualizza l'utilizzo della memoria:

```bash
free -h  # Formato human-readable
```

### 8.2 Comando vmstat

Statistiche su memoria virtuale, processi, I/O, CPU:

```bash
vmstat 1 10  # Aggiornamento ogni 1 secondo per 10 volte
```

### 8.3 Comando iostat

Statistiche su CPU e I/O per dispositivi e partizioni:

```bash
iostat -x 1 5  # Statistiche estese, aggiornamento ogni 1 secondo per 5 volte
```

### 8.4 Comando mpstat

Statistiche dettagliate sulla CPU:

```bash
mpstat -P ALL 1 5  # Statistiche per tutte le CPU, aggiornamento ogni 1 secondo per 5 volte
```

### 8.5 Comando lsof

Lista dei file aperti:

```bash
lsof  # Tutti i file aperti
lsof -u username  # File aperti da un utente
lsof -p PID  # File aperti da un processo
lsof -i :80  # File aperti su una porta
```

## 9. Troubleshooting di Processi

### 9.1 Processi Zombie

```bash
# Identificare processi zombie
ps aux | grep Z

# Uccidere processo padre per eliminare zombie
kill -9 PPID_del_processo_zombie
```

### 9.2 Processi Bloccati

```bash
# Identifica processi in stato D (uninterruptible sleep)
ps aux | grep -w D

# Verifica se processi sono bloccati su I/O
iostat -x 1

# A volte l'unica soluzione è riavviare il sistema
```

### 9.3 Alto Utilizzo CPU/Memoria

```bash
# Identifica processi che consumano più CPU
top -b -n 1 | head -n 20

# Identifica processi che consumano più memoria
ps aux --sort=-%mem | head -n 10

# Limita risorse con cgroups (avanzato)
systemd-run --scope -p MemoryMax=500M comando
```

## 10. Best Practices

1. **Evita di uccidere processi di sistema** a meno che non sai esattamente cosa stai facendo
2. **Usa priorità nice** per processi pesanti non interattivi
3. **Usa nohup o screen** per processi che devono continuare dopo la disconnessione
4. **Preferisci systemd** per gestire servizi persistenti
5. **Monitora regolarmente** l'uso delle risorse di sistema
6. **Esegui i backup** prima di modificare servizi di sistema critici
7. **Documenta le configurazioni** dei servizi personalizzati
8. **Usa systemctl mask** per impedire l'avvio accidentale di servizi pericolosi
9. **Evita SIGKILL (kill -9)** se non necessario, preferisci SIGTERM
10. **Implementa procedure di graceful shutdown** nei tuoi script
