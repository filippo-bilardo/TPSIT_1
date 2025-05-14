# Esercizi Avanzati: Controllo del Flusso in Bash

Questa serie di esercizi offre una pratica più approfondita sulle strutture di controllo del flusso in Bash, permettendoti di consolidare e ampliare le conoscenze acquisite nel modulo.

## Esercizio 1: Sistema di Login Semplice

**Obiettivo:** Creare un sistema di login che permetta più tentativi e gestisca diverse situazioni.

**Requisiti:**
1. Crea uno script che simuli un sistema di login.
2. Definisci un username e una password corretti all'interno dello script.
3. Concedi all'utente 3 tentativi per inserire le credenziali corrette.
4. A ogni tentativo fallito, mostra un messaggio che indica quanti tentativi rimangono.
5. Dopo 3 tentativi falliti, mostra un messaggio di blocco dell'account.
6. Se l'accesso ha successo, mostra un messaggio di benvenuto.

**Suggerimenti:**
* Usa un ciclo `for` o `while` per gestire i tentativi.
* Utilizza `read -s` per nascondere la password durante la digitazione.
* Controlla se le credenziali inserite corrispondono a quelle predefinite.

**Schema di Base:**
```bash
#!/bin/bash

# Credenziali corrette
CORRECT_USERNAME="admin"
CORRECT_PASSWORD="password123"

# Numero massimo di tentativi
MAX_ATTEMPTS=3

# TODO: Implementa il ciclo per i tentativi di login
# ...

# TODO: Gestisci l'esito del login
# ...
```

## Esercizio 2: Monitoraggio delle Risorse di Sistema

**Obiettivo:** Scrivere uno script che monitorizza le risorse di sistema e avvisa quando superano determinate soglie.

**Requisiti:**
1. Lo script deve monitorare:
   - Utilizzo della CPU
   - Memoria disponibile
   - Spazio su disco
2. Definisci le soglie per ciascuna risorsa (es. CPU > 80%, memoria disponibile < 20%, spazio disco < 10%).
3. Esegui il controllo ogni 5 secondi per 10 iterazioni.
4. Visualizza un warning quando una risorsa supera la soglia definita.
5. Mantieni un conteggio di quante volte ciascuna risorsa ha superato la soglia.
6. Al termine, mostra un riepilogo delle risorse monitorate e delle volte in cui hanno superato le soglie.

**Suggerimenti:**
* Usa comandi come `top`, `free`, `df` per ottenere informazioni sulle risorse.
* Elabora l'output con `awk`, `sed` o altri strumenti per estrarre i valori numerici.
* Utilizza un ciclo `for` o `while` per le iterazioni e condizionali per verificare le soglie.
* Usa variabili per tenere traccia dei conteggi.

**Schema di Base:**
```bash
#!/bin/bash

# Soglie
CPU_THRESHOLD=80    # percentuale
MEM_THRESHOLD=20    # percentuale disponibile
DISK_THRESHOLD=10   # percentuale disponibile

# Contatori
cpu_alerts=0
mem_alerts=0
disk_alerts=0

# Numero di iterazioni
iterations=10
interval=5  # secondi

# TODO: Implementa il ciclo di monitoraggio
# ...

# TODO: Visualizza il riepilogo
# ...
```

## Esercizio 3: Analizzatore di Log

**Obiettivo:** Creare uno script che analizza un file di log e produce statistiche diverse in base alle opzioni specificate.

**Requisiti:**
1. Lo script deve accettare i seguenti parametri:
   - Il percorso del file di log da analizzare.
   - Un'opzione che indica il tipo di analisi da eseguire.
2. Implementa le seguenti opzioni di analisi:
   - `-e`: Elenca gli errori (righe contenenti "ERROR").
   - `-w`: Elenca i warning (righe contenenti "WARNING").
   - `-i`: Elenca le informazioni (righe contenenti "INFO").
   - `-c`: Conta le occorrenze di ciascun tipo di messaggio (ERROR, WARNING, INFO).
   - `-t`: Mostra una timeline con il numero di messaggi per ora/giorno.
   - `-h`: Mostra l'help.
3. Usa strutture appropriate per gestire le diverse opzioni.
4. Se il file non esiste o non è specificata un'opzione valida, mostra un messaggio di errore appropriato.

**Suggerimenti:**
* Usa `case` per gestire le diverse opzioni.
* Utilizza `grep`, `awk`, e altri strumenti per analizzare il file di log.
* Per l'opzione `-t`, potresti usare espressioni regolari per estrarre le date/ore dai log.

**Schema di Base:**
```bash
#!/bin/bash

# Verifica dei parametri
if [ $# -lt 2 ]; then
    echo "Uso: $0 <file_log> <opzione>"
    echo "Esempio: $0 application.log -e"
    exit 1
fi

LOG_FILE="$1"
OPTION="$2"

# Verifica se il file esiste
if [ ! -f "$LOG_FILE" ]; then
    echo "Errore: Il file $LOG_FILE non esiste"
    exit 1
fi

# TODO: Implementa le diverse opzioni di analisi
case "$OPTION" in
    -e)
        # Analisi errori
        ;;
    -w)
        # Analisi warning
        ;;
    # ... altre opzioni ...
    -h)
        # Visualizza help
        ;;
    *)
        echo "Opzione non riconosciuta: $OPTION"
        echo "Usa -h per visualizzare l'help"
        exit 1
        ;;
esac
```

## Esercizio 4: Gioco di Indovinelli

**Obiettivo:** Creare un gioco interattivo a linea di comando che pone indovinelli all'utente.

**Requisiti:**
1. Lo script deve contenere almeno 5 indovinelli diversi con relative risposte.
2. Presentare gli indovinelli in ordine casuale.
3. Per ogni indovinello:
   - Mostrare il testo dell'indovinello.
   - Attendere l'input dell'utente.
   - Verificare se la risposta è corretta (ignorando maiuscole/minuscole).
   - Dare feedback all'utente.
4. Tenere traccia del punteggio dell'utente.
5. Al termine, mostrare il punteggio finale e un messaggio personalizzato in base al risultato.
6. Chiedere all'utente se vuole giocare di nuovo.

**Suggerimenti:**
* Usa array per memorizzare domande e risposte.
* Utilizza la funzione `shuf` o un algoritmo per randomizzare l'ordine degli indovinelli.
* Usa `tr '[:upper:]' '[:lower:]'` per convertire in minuscolo e fare confronti case-insensitive.
* Implementa un ciclo per gestire il flusso del gioco e le ripetizioni.

**Schema di Base:**
```bash
#!/bin/bash

# Array di indovinelli e risposte
questions=(
    "Qual è l'animale più veloce del mondo?"
    "Quale pianeta è conosciuto come il pianeta rosso?"
    "Quante zampe ha un ragno?"
    "In quale anno è stata fondata Linux?"
    "Chi ha scritto il kernel di Linux?"
)

answers=(
    "ghepardo"
    "marte"
    "8"
    "1991"
    "linus torvalds"
)

# Funzione per mischiare gli indici degli indovinelli
# TODO: implementa la funzione shuffle

# Punteggio iniziale
score=0

# TODO: Implementa il ciclo di gioco
# ...

# TODO: Visualizza il risultato finale
# ...

# TODO: Chiedi se giocare di nuovo
# ...
```

## Esercizio 5: Gestore di Processi Personalizzato

**Obiettivo:** Creare uno script che simuli un semplice gestore di processi, in grado di avviare, monitorare e terminare programmi.

**Requisiti:**
1. Lo script deve offrire un menu interattivo con le seguenti opzioni:
   - Avviare un nuovo processo (specificato dall'utente).
   - Elencare i processi avviati dalla sessione corrente.
   - Monitorare l'utilizzo di CPU/memoria di un processo specifico.
   - Terminare un processo.
   - Uscire dallo script.
2. Per ogni processo avviato, lo script deve memorizzare:
   - Il nome del comando.
   - Il PID.
   - L'ora di avvio.
3. Implementa controlli per gestire errori come:
   - Comando non trovato.
   - PID non valido o non trovato.
   - Permessi insufficienti.
4. Usa colori per rendere l'output più leggibile.

**Suggerimenti:**
* Usa array per memorizzare le informazioni sui processi.
* Utilizza `$!` per ottenere il PID dell'ultimo processo avviato in background.
* Implementa funzioni separate per ciascuna operazione.
* Usa `ps`, `top` o `kill` per interagire con i processi.
* Utilizza cicli e strutture condizionali per costruire il menu interattivo.

**Schema di Base:**
```bash
#!/bin/bash

# Colori per l'output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
NC='\033[0m' # No Color

# Array per memorizzare le informazioni sui processi
declare -a process_names
declare -a process_pids
declare -a process_start_times

# Funzione per mostrare il menu
show_menu() {
    clear
    echo -e "${YELLOW}===== GESTORE PROCESSI =====${NC}"
    echo "1. Avvia nuovo processo"
    echo "2. Elenca processi"
    echo "3. Monitora processo"
    echo "4. Termina processo"
    echo "5. Esci"
    echo
    read -p "Seleziona un'opzione (1-5): " choice
    return $choice
}

# Funzione per avviare un processo
start_process() {
    # TODO: Implementa questa funzione
    # ...
}

# Funzione per elencare i processi
list_processes() {
    # TODO: Implementa questa funzione
    # ...
}

# Funzione per monitorare un processo
monitor_process() {
    # TODO: Implementa questa funzione
    # ...
}

# Funzione per terminare un processo
terminate_process() {
    # TODO: Implementa questa funzione
    # ...
}

# Loop principale
while true; do
    show_menu
    choice=$?
    
    case $choice in
        1)
            start_process
            ;;
        2)
            list_processes
            ;;
        3)
            monitor_process
            ;;
        4)
            terminate_process
            ;;
        5)
            echo -e "${GREEN}Uscita dal programma.${NC}"
            exit 0
            ;;
        *)
            echo -e "${RED}Opzione non valida.${NC}"
            sleep 1
            ;;
    esac
done
```

## Conclusione

Questi esercizi ti aiuteranno a consolidare la tua comprensione delle strutture di controllo del flusso in Bash e ad applicarle in scenari più complessi e realistici. Una volta completati, avrai acquisito le competenze necessarie per scrivere script Bash più sofisticati e utili per l'automazione delle attività di sistema.

Ricorda che la pratica è fondamentale per padroneggiare la programmazione in Bash. Non esitare a modificare e estendere questi esercizi per esplorare ulteriormente le capacità di Bash e per adattarli alle tue esigenze specifiche.
