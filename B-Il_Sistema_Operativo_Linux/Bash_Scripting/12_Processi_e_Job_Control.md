# 12. Processi e Job Control

## 12.1 Creazione e gestione di processi

In ambiente Unix/Linux, un processo è un'istanza di un programma in esecuzione. Bash offre diversi modi per creare e gestire processi.

### Esecuzione di comandi

Quando esegui un comando in Bash, viene creato un nuovo processo:

```bash
# Esecuzione di un comando semplice
ls -la

# Esecuzione di più comandi in sequenza
ls -la; echo "Fatto"

# Esecuzione condizionale (il secondo comando viene eseguito solo se il primo ha successo)
grep "pattern" file.txt && echo "Pattern trovato"

# Esecuzione condizionale (il secondo comando viene eseguito solo se il primo fallisce)
grep "pattern" file.txt || echo "Pattern non trovato"
```

### Esecuzione di comandi in un subshell

I comandi possono essere eseguiti in una subshell (un processo figlio della shell corrente) utilizzando le parentesi tonde:

```bash
# Esecuzione in una subshell
(cd /tmp && ls -la)

# La directory corrente della shell principale non cambia
echo "Directory corrente: $PWD"
```

### Sostituzione di comandi

La sostituzione di comandi permette di utilizzare l'output di un comando come parte di un altro comando:

```bash
# Sintassi con backtick (obsoleta ma ancora utilizzata)
files=`ls -1`

# Sintassi moderna (preferita)
files=$(ls -1)

# Utilizzo dell'output
echo "File trovati: $files"
```

### Informazioni sui processi

Bash fornisce comandi per ottenere informazioni sui processi:

```bash
# Visualizza il PID (Process ID) della shell corrente
echo "PID della shell: $$"

# Visualizza il PID dell'ultimo processo in background
echo "PID dell'ultimo processo in background: $!"

# Visualizza il codice di uscita dell'ultimo comando
echo "Codice di uscita: $?"
```

### Tips & Tricks: Gestione dei processi

- Usa `pgrep` per trovare rapidamente il PID di un processo per nome: `pgrep firefox`
- Utilizza `pkill` per terminare tutti i processi con un nome specifico: `pkill firefox`
- Per vedere l'albero dei processi, usa `pstree` che mostra la gerarchia dei processi in modo visuale
- Controlla lo stato di un processo con `ps -p PID -o pid,ppid,cmd,%cpu,%mem`

### Esempio pratico: Monitoraggio di un processo specifico

```bash
#!/bin/bash

# Script per monitorare un processo specifico

if [ $# -ne 1 ]; then
    echo "Uso: $0 nome_processo"
    exit 1
fi

PROCESSO=$1

while true; do
    pid=$(pgrep -f "$PROCESSO" | head -n1)
    
    if [ -z "$pid" ]; then
        echo "Processo $PROCESSO non trovato."
    else
        echo "Informazioni sul processo $PROCESSO (PID: $pid):"
        ps -p $pid -o pid,ppid,cmd,%cpu,%mem
    fi
    
    sleep 5
    clear
done
```

## 12.2 Esecuzione in background

I processi possono essere eseguiti in background, permettendo all'utente di continuare a utilizzare la shell mentre il processo è in esecuzione.

### Avvio di processi in background

```bash
# Esecuzione di un comando in background
ls -R / > output.txt &

# Visualizza il PID del processo in background
echo "Processo in background: $!"
```

### Controllo dei processi in background

```bash
# Visualizza i processi in background
jobs

# Riferimento ai job per numero
jobs %1

# Riferimento al job più recente
jobs %+

# Riferimento al job precedente
jobs %-
```

### Esempio di script con processi in background

```bash
#!/bin/bash

# Script per eseguire più comandi in parallelo

echo "Avvio dei processi in background..."

# Avvia tre processi in background
find /etc -type f -name "*.conf" > conf_files.txt &
pid1=$!

find /var/log -type f -name "*.log" > log_files.txt &
pid2=$!

find /usr/bin -type f -executable > executable_files.txt &
pid3=$!

echo "Processi avviati con PID: $pid1, $pid2, $pid3"

# Attendi il completamento di tutti i processi
echo "Attesa del completamento dei processi..."
wait $pid1 $pid2 $pid3

echo "Tutti i processi sono completati."

# Conta i file trovati
conf_count=$(wc -l < conf_files.txt)
log_count=$(wc -l < log_files.txt)
exec_count=$(wc -l < executable_files.txt)

echo "File di configurazione trovati: $conf_count"
echo "File di log trovati: $log_count"
echo "File eseguibili trovati: $exec_count"
```

### Tips & Tricks: Processi in background

- Usa `jobs -l` per visualizzare anche i PID dei processi in background
- Se hai molti job in background, puoi terminare tutti con `kill $(jobs -p)`
- Per mettere in background un processo già avviato: premi `CTRL+Z` e poi esegui `bg`
- Usa `wait` senza argomenti per attendere il completamento di tutti i processi in background

## 12.3 Job control

Il job control permette di gestire i processi in esecuzione, spostandoli tra foreground e background.

### Comandi di job control

```bash
# Mette in pausa il processo in foreground (CTRL+Z)
^Z

# Sposta un job in background
bg %job_id

# Sposta un job in foreground
fg %job_id

# Termina un job
kill %job_id
```

Esempio di utilizzo del job control:

```bash
# Avvia un processo lungo
sleep 100

# Premi CTRL+Z per metterlo in pausa
# Output: [1]+ Stopped sleep 100

# Metti il processo in background
bg %1
# Output: [1]+ sleep 100 &

# Riporta il processo in foreground
fg %1
# Output: sleep 100
```

### Tips & Tricks: Job Control

- Puoi usare `%?stringa` per riferirsi a un job che contiene una determinata stringa nel comando
- Usa `jobs -r` per visualizzare solo i job in esecuzione e `jobs -s` per quelli fermi
- Se hai sospeso un processo con `CTRL+Z` e vuoi uscire dalla shell, usa `disown %job_id` per evitare che venga terminato

## 12.4 Segnali e trap

I segnali sono un meccanismo per comunicare con i processi in esecuzione. Il comando `trap` permette di intercettare i segnali e eseguire azioni specifiche.

### Segnali comuni

```bash
SIGHUP (1)    # Hangup, inviato quando il terminale viene chiuso
SIGINT (2)    # Interrupt, inviato quando si preme CTRL+C
SIGQUIT (3)   # Quit, inviato quando si preme CTRL+\
SIGKILL (9)   # Kill, termina immediatamente il processo (non può essere intercettato)
SIGTERM (15)  # Terminate, segnale standard per terminare un processo
SIGSTOP (19)  # Stop, mette in pausa il processo (non può essere intercettato)
```

### Utilizzo di trap

```bash
# Intercetta SIGINT (CTRL+C) e SIGTERM
trap "echo 'Segnale ricevuto, pulizia in corso...'; exit 1" SIGINT SIGTERM

# Intercetta l'uscita dallo script (EXIT)
trap "echo 'Script terminato, pulizia in corso...'" EXIT

# Ignora SIGINT
trap "" SIGINT

# Ripristina il comportamento predefinito per SIGINT
trap - SIGINT
```

Esempio di script con trap:

```bash
#!/bin/bash

# File temporaneo
TMP_FILE="/tmp/script_temp_$$.txt"

# Funzione di pulizia
cleanup() {
    echo "Pulizia in corso..."
    rm -f "$TMP_FILE"
    echo "Pulizia completata."
}

# Intercetta i segnali e l'uscita
trap cleanup EXIT SIGINT SIGTERM

echo "Script avviato. PID: $$"
echo "Creazione del file temporaneo: $TMP_FILE"
touch "$TMP_FILE"

echo "Simulazione di un'elaborazione lunga..."
echo "Premi CTRL+C per interrompere."

for i in {1..10}; do
    echo "$i" >> "$TMP_FILE"
    echo "Elaborazione: $i/10"
    sleep 1
done

echo "Elaborazione completata."
# Il file temporaneo verrà eliminato automaticamente all'uscita
```

### Tips & Tricks: Segnali e trap

- Usa `trap -l` per visualizzare tutti i segnali disponibili
- Puoi usare i numeri dei segnali invece dei nomi: `trap "echo 'Segnale 2 ricevuto'" 2`
- Per script complessi, crea una funzione di pulizia separata e usala con trap
- Ricorda che `SIGKILL` (9) e `SIGSTOP` (19) non possono essere intercettati

## 12.5 Priorità e nice

In Unix/Linux, ogni processo ha una priorità che determina quanto tempo di CPU gli viene assegnato. Il comando `nice` permette di avviare un processo con una priorità specifica, mentre `renice` permette di modificare la priorità di un processo in esecuzione.

### Utilizzo di nice e renice

```bash
# Avvia un processo con priorità bassa (valore nice alto)
nice -n 10 comando

# Avvia un processo con priorità alta (valore nice negativo, richiede privilegi di root)
sudo nice -n -10 comando

# Modifica la priorità di un processo esistente
renice +5 -p PID
```

Esempio di script con nice:

```bash
#!/bin/bash

# Avvia tre processi con priorità diverse

echo "Avvio del processo ad alta priorità..."
sudo nice -n -10 find / -name "*.conf" > high_priority.txt &
pid1=$!

echo "Avvio del processo a priorità normale..."
find /home -name "*.txt" > normal_priority.txt &
pid2=$!

echo "Avvio del processo a bassa priorità..."
nice -n 10 find /usr -name "*.log" > low_priority.txt &
pid3=$!

echo "Processi avviati con PID: $pid1, $pid2, $pid3"

# Visualizza le priorità
ps -o pid,nice,cmd -p $pid1 $pid2 $pid3

# Attendi il completamento
wait $pid1 $pid2 $pid3
echo "Tutti i processi sono completati."
```

### Tips & Tricks: Priorità dei processi

- I valori di nice vanno da -20 (massima priorità) a 19 (minima priorità)
- Solo l'utente root può impostare valori di nice negativi
- Usa `top` e premi 'r' per modificare la priorità di un processo in esecuzione
- Per processi CPU-intensivi non critici, usa sempre un valore nice positivo

## 12.6 Processi in background e foreground

In Bash, i processi possono essere eseguiti in foreground (primo piano) o in background (secondo piano).

### Differenze tra foreground e background

- **Foreground**: Il processo occupa il terminale, l'utente deve attendere il completamento prima di poter eseguire altri comandi.
- **Background**: Il processo viene eseguito senza occupare il terminale, l'utente può continuare a utilizzare la shell.

### Gestione dell'output dei processi in background

I processi in background continuano a scrivere sul terminale, il che può essere fastidioso. È possibile redirigere l'output per evitare questo problema:

```bash
# Redirige sia stdout che stderr a un file
comando > output.log 2>&1 &

# Scarta completamente l'output
comando > /dev/null 2>&1 &
```

### Mantenere i processi in esecuzione dopo la chiusura del terminale

I processi in background vengono terminati quando si chiude il terminale. Per evitare questo, è possibile utilizzare il comando `nohup`:

```bash
# Mantiene il processo in esecuzione anche dopo la chiusura del terminale
nohup comando &

# Redirige l'output a un file specifico
nohup comando > output.log 2>&1 &
```

Alternativa a `nohup` è il comando `disown`:

```bash
# Avvia un processo in background
comando &

# Dissocia il processo dalla shell
disown %1
```

### Esempio di script con nohup

```bash
#!/bin/bash