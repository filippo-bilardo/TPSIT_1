# Esercizi: Introduzione allo Scripting Bash

Questa serie di esercizi ti aiuterà a familiarizzare con la creazione e l'esecuzione di script Bash. Completa gli esercizi nell'ordine indicato per consolidare le conoscenze acquisite nella guida teorica.

## Esercizio 1: Il Tuo Primo Script

1. Crea un file chiamato `hello.sh` usando l'editor di testo a tua scelta:
   ```bash
   nano hello.sh
   ```

2. Aggiungi il seguente contenuto al file:
   ```bash
   #!/bin/bash
   
   # Il mio primo script Bash
   echo "Ciao, mondo!"
   echo "Oggi è $(date)"
   echo "Sono l'utente $USER"
   ```

3. Salva il file ed esci dall'editor

4. Rendi lo script eseguibile:
   ```bash
   chmod +x hello.sh
   ```

5. Esegui lo script in diversi modi:
   - Esecuzione diretta:
     ```bash
     ./hello.sh
     ```
   - Specificando l'interprete:
     ```bash
     bash hello.sh
     ```
   - Usando source (lo script viene eseguito nella shell corrente):
     ```bash
     source hello.sh
     ```

6. Osserva le differenze tra i metodi di esecuzione, se presenti

## Esercizio 2: Variabili e Input Utente

1. Crea un nuovo script chiamato `greeter.sh`:
   ```bash
   nano greeter.sh
   ```

2. Aggiungi il seguente contenuto:
   ```bash
   #!/bin/bash
   
   # Script per salutare l'utente
   
   # Definisci una variabile
   DEFAULT_NAME="Ospite"
   
   # Chiedi il nome all'utente
   echo "Come ti chiami?"
   read user_name
   
   # Se l'utente non inserisce nulla, usa il nome predefinito
   if [ -z "$user_name" ]; then
       user_name=$DEFAULT_NAME
   fi
   
   # Saluta l'utente
   echo "Ciao, $user_name!"
   
   # Chiedi l'età
   echo "Quanti anni hai?"
   read age
   
   # Verifica che l'input sia un numero
   if [[ "$age" =~ ^[0-9]+$ ]]; then
       echo "Hai $age anni."
   else
       echo "Non hai inserito un numero valido per l'età."
   fi
   
   # Mostra la data e l'ora
   echo "Oggi è $(date)"
   ```

3. Rendi lo script eseguibile e prova ad eseguirlo:
   ```bash
   chmod +x greeter.sh
   ./greeter.sh
   ```

4. Prova ad eseguire lo script senza inserire il nome e verificando cosa succede con vari input per l'età

## Esercizio 3: Lavorare con i Parametri

1. Crea un nuovo script chiamato `params.sh`:
   ```bash
   nano params.sh
   ```

2. Inserisci il seguente contenuto:
   ```bash
   #!/bin/bash
   
   # Script per dimostrare l'uso dei parametri
   
   echo "Nome dello script: $0"
   echo "Numero di parametri: $#"
   echo "Tutti i parametri: $@"
   echo
   
   # Verifica se ci sono parametri
   if [ $# -eq 0 ]; then
       echo "Nessun parametro fornito."
       echo "Uso: $0 [parametro1] [parametro2] [...]"
       exit 1
   fi
   
   # Mostra i parametri uno per uno
   count=1
   for param in "$@"; do
       echo "Parametro $count: $param"
       count=$((count + 1))
   done
   
   # Accesso diretto ai parametri
   if [ $# -ge 1 ]; then
       echo "Primo parametro: $1"
   fi
   
   if [ $# -ge 2 ]; then
       echo "Secondo parametro: $2"
   fi
   ```

3. Rendi lo script eseguibile:
   ```bash
   chmod +x params.sh
   ```

4. Eseguilo con vari parametri:
   ```bash
   ./params.sh
   ./params.sh ciao
   ./params.sh "primo parametro" secondo terzo
   ./params.sh * # Espande i file nella directory
   ```

## Esercizio 4: Calcolatrice Semplice

1. Crea un nuovo script chiamato `calculator.sh`:
   ```bash
   nano calculator.sh
   ```

2. Aggiungi il seguente contenuto:
   ```bash
   #!/bin/bash
   
   # Calcolatrice semplice
   
   # Funzione per l'addizione
   add() {
       echo "$1 + $2 = $(($1 + $2))"
   }
   
   # Funzione per la sottrazione
   subtract() {
       echo "$1 - $2 = $(($1 - $2))"
   }
   
   # Funzione per la moltiplicazione
   multiply() {
       echo "$1 * $2 = $(($1 * $2))"
   }
   
   # Funzione per la divisione
   divide() {
       # Controlla divisione per zero
       if [ $2 -eq 0 ]; then
           echo "Errore: Divisione per zero."
       else
           # Usa bc per divisione con decimali
           result=$(echo "scale=2; $1 / $2" | bc)
           echo "$1 / $2 = $result"
       fi
   }
   
   # Menu principale
   echo "Calcolatrice Bash"
   echo "================="
   echo "Scegli un'operazione:"
   echo "1. Addizione"
   echo "2. Sottrazione"
   echo "3. Moltiplicazione"
   echo "4. Divisione"
   echo
   
   # Leggi la scelta dell'utente
   read -p "Inserisci la tua scelta (1-4): " choice
   
   # Verifica che la scelta sia valida
   if ! [[ "$choice" =~ ^[1-4]$ ]]; then
       echo "Scelta non valida"
       exit 1
   fi
   
   # Leggi i numeri
   read -p "Inserisci il primo numero: " num1
   read -p "Inserisci il secondo numero: " num2
   
   # Verifica che gli input siano numeri
   if ! [[ "$num1" =~ ^-?[0-9]+$ ]]; then
       echo "Errore: Il primo input non è un numero valido."
       exit 1
   fi
   
   if ! [[ "$num2" =~ ^-?[0-9]+$ ]]; then
       echo "Errore: Il secondo input non è un numero valido."
       exit 1
   fi
   
   # Esegui l'operazione selezionata
   case $choice in
       1)
           add $num1 $num2
           ;;
       2)
           subtract $num1 $num2
           ;;
       3)
           multiply $num1 $num2
           ;;
       4)
           divide $num1 $num2
           ;;
   esac
   ```

3. Rendi lo script eseguibile:
   ```bash
   chmod +x calculator.sh
   ```

4. Esegui lo script e prova diverse operazioni e numeri:
   ```bash
   ./calculator.sh
   ```

## Esercizio 5: Interazione con il Sistema

1. Crea un file chiamato `system_info.sh`:
   ```bash
   nano system_info.sh
   ```

2. Inserisci il seguente codice:
   ```bash
   #!/bin/bash
   
   # Script per raccogliere informazioni sul sistema
   
   # Funzione per mostrare l'intestazione
   show_header() {
       echo "==========================================="
       echo " Informazioni sul Sistema"
       echo "==========================================="
       echo
   }
   
   # Funzione per mostrare informazioni sull'utente
   show_user_info() {
       echo "INFORMAZIONI UTENTE:"
       echo "------------------"
       echo "Nome utente: $USER"
       echo "Home directory: $HOME"
       echo "Shell: $SHELL"
       echo "UID: $(id -u)"
       groups=$(groups)
       echo "Gruppi: $groups"
       echo
   }
   
   # Funzione per mostrare informazioni sul sistema operativo
   show_os_info() {
       echo "INFORMAZIONI SUL SISTEMA OPERATIVO:"
       echo "--------------------------------"
       
       # Diverse distribuzioni memorizzano le informazioni in file diversi
       if [ -f /etc/os-release ]; then
           # Per la maggior parte delle distribuzioni moderne
           source /etc/os-release
           echo "Nome SO: $NAME"
           echo "Versione: $VERSION"
           echo "ID: $ID"
       elif [ -f /etc/lsb-release ]; then
           # Per alcune distribuzioni basate su Ubuntu
           source /etc/lsb-release
           echo "Nome SO: $DISTRIB_ID"
           echo "Versione: $DISTRIB_RELEASE ($DISTRIB_CODENAME)"
       else
           # Fallback
           echo "Nome SO: $(uname -s)"
           echo "Versione: $(uname -r)"
       fi
       
       echo "Architettura: $(uname -m)"
       echo "Kernel: $(uname -r)"
       uptime=$(uptime -p)
       echo "Uptime: $uptime"
       echo
   }
   
   # Funzione per mostrare informazioni sull'hardware
   show_hardware_info() {
       echo "INFORMAZIONI HARDWARE:"
       echo "-------------------"
       
       # CPU
       echo "CPU:"
       if [ -f /proc/cpuinfo ]; then
           cpu_model=$(grep "model name" /proc/cpuinfo | head -1 | cut -d ":" -f2 | sed 's/^[ \t]*//')
           cpu_cores=$(grep -c "processor" /proc/cpuinfo)
           echo "  Modello: $cpu_model"
           echo "  Core: $cpu_cores"
       else
           echo "  Informazioni CPU non disponibili"
       fi
       
       # Memoria
       echo "Memoria:"
       if [ -f /proc/meminfo ]; then
           total_mem=$(grep "MemTotal" /proc/meminfo | awk '{print $2}')
           free_mem=$(grep "MemFree" /proc/meminfo | awk '{print $2}')
           available_mem=$(grep "MemAvailable" /proc/meminfo | awk '{print $2}')
           # Converti da KB a MB
           total_mem_mb=$((total_mem / 1024))
           free_mem_mb=$((free_mem / 1024))
           available_mem_mb=$((available_mem / 1024))
           echo "  Totale: $total_mem_mb MB"
           echo "  Libera: $free_mem_mb MB"
           echo "  Disponibile: $available_mem_mb MB"
       else
           echo "  Informazioni memoria non disponibili"
       fi
       
       # Disco
       echo "Spazio su disco:"
       df_output=$(df -h / | tail -1)
       disk_size=$(echo "$df_output" | awk '{print $2}')
       disk_used=$(echo "$df_output" | awk '{print $3}')
       disk_avail=$(echo "$df_output" | awk '{print $4}')
       disk_percent=$(echo "$df_output" | awk '{print $5}')
       echo "  Totale: $disk_size"
       echo "  Usato: $disk_used ($disk_percent)"
       echo "  Disponibile: $disk_avail"
       echo
   }
   
   # Funzione per mostrare informazioni di rete
   show_network_info() {
       echo "INFORMAZIONI DI RETE:"
       echo "------------------"
       
       # Hostname
       echo "Hostname: $(hostname)"
       
       # Interfacce di rete
       echo "Interfacce di rete:"
       
       # Usa ip se disponibile, altrimenti ifconfig
       if command -v ip &> /dev/null; then
           ip -brief address show | while read -r line; do
               if [ -n "$line" ]; then
                   interface=$(echo "$line" | awk '{print $1}')
                   status=$(echo "$line" | awk '{print $2}')
                   address=$(echo "$line" | awk '{print $3}')
                   
                   echo "  $interface: $status - $address"
               fi
           done
       elif command -v ifconfig &> /dev/null; then
           ifconfig_output=$(ifconfig)
           interfaces=$(echo "$ifconfig_output" | grep -o "^\w*" | grep -v "^$")
           
           for interface in $interfaces; do
               ip_address=$(ifconfig "$interface" | grep "inet " | awk '{print $2}')
               if [ -n "$ip_address" ]; then
                   echo "  $interface: $ip_address"
               fi
           done
       else
           echo "  Comando ip o ifconfig non disponibile"
       fi
       
       # DNS
       if [ -f /etc/resolv.conf ]; then
           echo "Server DNS:"
           grep "nameserver" /etc/resolv.conf | while read -r line; do
               dns_server=$(echo "$line" | awk '{print $2}')
               echo "  $dns_server"
           done
       fi
       
       echo
   }
   
   # Funzione per mostrare processi in esecuzione
   show_processes() {
       echo "PROCESSI IN ESECUZIONE:"
       echo "---------------------"
       echo "Top 5 processi per CPU:"
       ps aux --sort=-%cpu | head -6
       echo
       echo "Top 5 processi per memoria:"
       ps aux --sort=-%mem | head -6
       echo
   }
   
   # Funzione principale
   main() {
       show_header
       show_user_info
       show_os_info
       show_hardware_info
       show_network_info
       
       # Chiedi all'utente se vuole vedere anche i processi
       read -p "Vuoi vedere anche i processi in esecuzione? (s/n): " choice
       if [[ "$choice" =~ ^[sS]$ ]]; then
           show_processes
       fi
       
       echo "==========================================="
       echo " Fine del report"
       echo "==========================================="
   }
   
   # Esegui la funzione principale
   main
   ```

3. Rendi lo script eseguibile:
   ```bash
   chmod +x system_info.sh
   ```

4. Esegui lo script:
   ```bash
   ./system_info.sh
   ```

## Esercizio 6: Script di Utilità per File e Directory

1. Crea un file chiamato `file_organizer.sh`:
   ```bash
   nano file_organizer.sh
   ```

2. Inserisci il seguente codice:
   ```bash
   #!/bin/bash
   
   # Script per organizzare i file in base all'estensione
   
   # Verifica se è stata specificata una directory
   if [ $# -eq 0 ]; then
       echo "Uso: $0 <directory>"
       echo "Esempio: $0 ~/Downloads"
       exit 1
   fi
   
   # Assegna la directory
   target_dir="$1"
   
   # Verifica che la directory esista
   if [ ! -d "$target_dir" ]; then
       echo "Errore: La directory $target_dir non esiste."
       exit 1
   fi
   
   # Entra nella directory target
   cd "$target_dir" || exit 1
   
   echo "Organizzo i file in: $target_dir"
   
   # Crea directory per i tipi di file più comuni
   mkdir -p Immagini Documenti Video Audio Archivi Altri
   
   # Funzione per contare i file spostati
   count_moved=0
   
   # Funzione per spostare i file
   move_files() {
       local pattern=$1
       local destination=$2
       
       # Trova i file corrispondenti al pattern ed escludendo le directory
       for file in $pattern; do
           # Verifica che sia un file regolare e non una directory
           if [ -f "$file" ]; then
               # Sposta il file nella destinazione
               mv "$file" "$destination/"
               echo "Spostato: $file -> $destination/"
               count_moved=$((count_moved + 1))
           fi
       done
   }
   
   # Sposta i file in base all'estensione
   echo "Spostamento dei file in corso..."
   
   # Immagini
   move_files "*.jpg *.jpeg *.png *.gif *.bmp *.svg *.tiff" "Immagini"
   
   # Documenti
   move_files "*.pdf *.doc *.docx *.xls *.xlsx *.ppt *.pptx *.txt *.rtf *.odt *.ods *.odp" "Documenti"
   
   # Video
   move_files "*.mp4 *.avi *.mkv *.mov *.wmv *.flv *.webm" "Video"
   
   # Audio
   move_files "*.mp3 *.wav *.ogg *.flac *.aac *.m4a" "Audio"
   
   # Archivi
   move_files "*.zip *.rar *.tar *.gz *.7z *.bz2 *.xz" "Archivi"
   
   # Conta quanti file sono rimasti
   remaining=$(find . -maxdepth 1 -type f | wc -l)
   
   # Sposta i file rimanenti nella cartella Altri
   if [ $remaining -gt 0 ]; then
       echo "Spostamento di $remaining file rimanenti in 'Altri'..."
       find . -maxdepth 1 -type f -exec mv {} Altri/ \;
       count_moved=$((count_moved + remaining))
   fi
   
   # Rimuovi le directory vuote
   for dir in Immagini Documenti Video Audio Archivi Altri; do
       # Conta file nella directory
       num_files=$(find "$dir" -type f | wc -l)
       
       if [ $num_files -eq 0 ]; then
           rmdir "$dir"
           echo "Rimossa directory vuota: $dir"
       else
           echo "Directory $dir: $num_files file"
       fi
   done
   
   echo "Completato! $count_moved file organizzati."
   ```

3. Rendi lo script eseguibile:
   ```bash
   chmod +x file_organizer.sh
   ```

4. Crea una directory di test con vari tipi di file:
   ```bash
   mkdir -p ~/test_files
   cd ~/test_files
   touch file1.txt file2.pdf image.jpg video.mp4 archive.zip
   ```

5. Esegui lo script sulla directory di test:
   ```bash
   cd ~
   ./file_organizer.sh ~/test_files
   ```

6. Esplora la directory di test per verificare l'organizzazione:
   ```bash
   ls -la ~/test_files/*
   ```

## Esercizio 7: Monitoraggio dei Processi

1. Crea un file chiamato `process_monitor.sh`:
   ```bash
   nano process_monitor.sh
   ```

2. Inserisci il seguente codice:
   ```bash
   #!/bin/bash
   
   # Script per monitorare un processo specifico
   
   # Verifica se è stato specificato un processo
   if [ $# -eq 0 ]; then
       echo "Uso: $0 <nome_processo> [intervallo_in_secondi]"
       echo "Esempio: $0 firefox 5"
       exit 1
   fi
   
   # Assegna parametri
   process_name="$1"
   
   # Imposta intervallo predefinito a 2 secondi o usa quello fornito
   interval=2
   if [ $# -ge 2 ]; then
       interval="$2"
   fi
   
   # Funzione per ottenere informazioni sul processo
   get_process_info() {
       # Ottenere PID e informazioni usando ps
       pid_info=$(ps -eo pid,ppid,cmd,%cpu,%mem,rss | grep -v grep | grep "$process_name")
       
       # Se il processo non è in esecuzione
       if [ -z "$pid_info" ]; then
           echo "Processo $process_name non trovato."
           return 1
       fi
       
       # Estrai il primo PID (in caso di più processi con lo stesso nome)
       pid=$(echo "$pid_info" | head -1 | awk '{print $1}')
       
       # Ottieni le informazioni dettagliate
       cpu=$(echo "$pid_info" | head -1 | awk '{print $4}')
       mem=$(echo "$pid_info" | head -1 | awk '{print $5}')
       rss=$(echo "$pid_info" | head -1 | awk '{print $6}')
       rss_mb=$(echo "scale=2; $rss/1024" | bc)
       
       # Ottieni informazioni sui file aperti (limitato a 10)
       open_files=$(lsof -p "$pid" 2>/dev/null | wc -l)
       
       # Output
       echo "Processo: $process_name (PID: $pid)"
       echo "CPU: $cpu%"
       echo "Memoria: $mem% ($rss_mb MB)"
       echo "File aperti: $open_files"
       
       return 0
   }
   
   # Funzione per pulire lo schermo e posizionare il cursore
   clear_screen() {
       clear
       echo "==========================================="
       echo " Monitoraggio Processo: $process_name"
       echo " Intervallo: $interval secondi"
       echo " Premi Ctrl+C per terminare"
       echo "==========================================="
       echo
   }
   
   # Loop principale
   echo "Avvio monitoraggio per il processo '$process_name'..."
   echo "Premi Ctrl+C per terminare."
   
   try_count=0
   max_tries=3
   
   while true; do
       clear_screen
       
       # Ottieni e mostra le informazioni
       if ! get_process_info; then
           try_count=$((try_count + 1))
           
           if [ $try_count -ge $max_tries ]; then
               echo "Processo non trovato dopo $max_tries tentativi. Uscita."
               exit 1
           else
               echo "Tentativo $try_count di $max_tries..."
           fi
       else
           # Resetta il contatore se il processo è stato trovato
           try_count=0
           
           echo
           echo "Ultima verifica: $(date "+%H:%M:%S")"
       fi
       
       # Attendi l'intervallo specificato
       sleep $interval
   done
   ```

3. Rendi lo script eseguibile:
   ```bash
   chmod +x process_monitor.sh
   ```

4. Esegui lo script specificando un processo da monitorare (ad esempio 'bash'):
   ```bash
   ./process_monitor.sh bash
   ```

5. Prova a monitorare diversi processi e con intervalli diversi

## Verifica di Apprendimento

Rispondi alle seguenti domande:

1. Cosa indica la shebang `#!/bin/bash` all'inizio di uno script?
2. Quali sono le differenze tra eseguire uno script con `./script.sh`, `bash script.sh` e `source script.sh`?
3. Come si accede al valore di una variabile in Bash?
4. Quali sono le principali variabili speciali in Bash che si riferiscono ai parametri posizionali?
5. Come si legge l'input dell'utente in uno script Bash?
6. Come si può rendere eseguibile uno script Bash?
7. Come si possono ottenere informazioni sul sistema operativo da uno script Bash?
8. Qual è la differenza tra variabili locali e variabili d'ambiente?
