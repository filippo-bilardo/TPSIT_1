#!/bin/bash

# ================================================================
# Sistema di Monitoraggio del Sistema
# ================================================================
# Questo script implementa un sistema di monitoraggio completo che
# raccoglie e analizza metriche di sistema, genera report e avvisi
# quando vengono superate soglie critiche.

# Configurazione
# ==============
DIR_LOG="$HOME/logs/sistema"
FILE_CONFIG="$HOME/.config/monitor_config.cfg"
FILE_REPORT="$DIR_LOG/report_$(date +%Y%m%d).html"

# Soglie predefinite (possono essere sovrascritte dal file di configurazione)
SOGLIA_CPU=80        # Percentuale
SOGLIA_MEMORIA=85    # Percentuale
SOGLIA_DISCO=90      # Percentuale
SOGLIA_CARICO=5      # Load average
INTERVALLO=300       # Secondi tra le verifiche (5 minuti)
MAX_LOG=7            # Giorni di log da mantenere

# Colori per output
ROSSO="\033[0;31m"
VERDE="\033[0;32m"
GIALLO="\033[0;33m"
BLU="\033[0;34m"
NC="\033[0m" # No Color

# Funzioni
# ========

# Funzione per il logging
log() {
    local livello=$1
    local messaggio=$2
    local timestamp=$(date "+%Y-%m-%d %H:%M:%S")
    local colore=$NC
    
    case $livello in
        "INFO") colore=$BLU ;;
        "SUCCESS") colore=$VERDE ;;
        "WARNING") colore=$GIALLO ;;
        "ERROR") colore=$ROSSO ;;
    esac
    
    echo -e "${colore}[${timestamp}] [${livello}] ${messaggio}${NC}"
    
    # Assicurati che la directory di log esista
    mkdir -p "$DIR_LOG"
    echo "[${timestamp}] [${livello}] ${messaggio}" >> "$DIR_LOG/monitor.log"
}

# Funzione per caricare la configurazione
carica_configurazione() {
    log "INFO" "Caricamento della configurazione..."
    
    if [ -f "$FILE_CONFIG" ]; then
        log "INFO" "Caricamento configurazione da $FILE_CONFIG"
        source "$FILE_CONFIG"
    else
        log "WARNING" "File di configurazione non trovato. Utilizzo valori predefiniti."
        # Crea un file di configurazione di esempio
        mkdir -p "$(dirname "$FILE_CONFIG")"
        cat > "$FILE_CONFIG" << EOF
# Configurazione del Sistema di Monitoraggio
# Modifica questi valori secondo le tue esigenze

# Soglie di allarme
SOGLIA_CPU=80        # Percentuale
SOGLIA_MEMORIA=85    # Percentuale
SOGLIA_DISCO=90      # Percentuale
SOGLIA_CARICO=5      # Load average

# Impostazioni generali
INTERVALLO=300       # Secondi tra le verifiche
MAX_LOG=7            # Giorni di log da mantenere

# Directory da monitorare per lo spazio disco
DIRECTORY_MONITORATE=("/" "/home" "/var")

# Processi critici da monitorare
PROCESSI_CRITICI=("sshd" "nginx" "mysql")

# Impostazioni notifiche
NOTIFICA_EMAIL="admin@example.com"
EMAIL_ATTIVO=false
EOF
        log "INFO" "Creato file di configurazione di esempio in $FILE_CONFIG"
    fi
    
    # Imposta directory da monitorare se non definite
    if [ -z "${DIRECTORY_MONITORATE[*]}" ]; then
        DIRECTORY_MONITORATE=("/" "/home" "/var")
    fi
    
    # Imposta processi critici se non definiti
    if [ -z "${PROCESSI_CRITICI[*]}" ]; then
        PROCESSI_CRITICI=("sshd" "nginx" "mysql")
    fi
    
    log "SUCCESS" "Configurazione caricata."
}

# Funzione per raccogliere metriche di CPU
raccolta_metriche_cpu() {
    log "INFO" "Raccolta metriche CPU..."
    
    # Utilizzo CPU (media di tutti i core)
    CPU_UTILIZZO=$(top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - $1}')
    CPU_UTILIZZO_INT=${CPU_UTILIZZO%.*}
    
    # Load average
    LOAD_AVG=$(cat /proc/loadavg | awk '{print $1}')
    
    log "INFO" "Utilizzo CPU: ${CPU_UTILIZZO}%, Load Average: ${LOAD_AVG}"
    
    # Verifica soglie
    if [ "$CPU_UTILIZZO_INT" -ge "$SOGLIA_CPU" ]; then
        log "WARNING" "Soglia CPU superata! Utilizzo: ${CPU_UTILIZZO}%"
        invia_notifica "CPU" "Utilizzo CPU elevato: ${CPU_UTILIZZO}%"
    fi
    
    if (( $(echo "$LOAD_AVG > $SOGLIA_CARICO" | bc -l) )); then
        log "WARNING" "Soglia Load Average superata! Valore: ${LOAD_AVG}"
        invia_notifica "LOAD" "Load Average elevato: ${LOAD_AVG}"
    fi
    
    # Salva dati per il report
    echo "${timestamp},cpu,${CPU_UTILIZZO}" >> "$DIR_LOG/cpu_data.csv"
    echo "${timestamp},load,${LOAD_AVG}" >> "$DIR_LOG/load_data.csv"
}

# Funzione per raccogliere metriche di memoria
raccolta_metriche_memoria() {
    log "INFO" "Raccolta metriche memoria..."
    
    # Utilizzo memoria
    MEM_TOTALE=$(free -m | awk '/Mem:/ {print $2}')
    MEM_USATA=$(free -m | awk '/Mem:/ {print $3}')
    MEM_PERCENTUALE=$((MEM_USATA * 100 / MEM_TOTALE))
    
    # Utilizzo swap
    SWAP_TOTALE=$(free -m | awk '/Swap:/ {print $2}')
    SWAP_USATA=$(free -m | awk '/Swap:/ {print $3}')
    
    if [ "$SWAP_TOTALE" -gt 0 ]; then
        SWAP_PERCENTUALE=$((SWAP_USATA * 100 / SWAP_TOTALE))
    else
        SWAP_PERCENTUALE=0
    fi
    
    log "INFO" "Memoria: ${MEM_PERCENTUALE}% (${MEM_USATA}/${MEM_TOTALE} MB), Swap: ${SWAP_PERCENTUALE}% (${SWAP_USATA}/${SWAP_TOTALE} MB)"
    
    # Verifica soglie
    if [ "$MEM_PERCENTUALE" -ge "$SOGLIA_MEMORIA" ]; then
        log "WARNING" "Soglia memoria superata! Utilizzo: ${MEM_PERCENTUALE}%"
        invia_notifica "MEMORIA" "Utilizzo memoria elevato: ${MEM_PERCENTUALE}%"
    fi
    
    # Salva dati per il report
    echo "${timestamp},memoria,${MEM_PERCENTUALE}" >> "$DIR_LOG/memoria_data.csv"
    echo "${timestamp},swap,${SWAP_PERCENTUALE}" >> "$DIR_LOG/swap_data.csv"
}

# Funzione per raccogliere metriche di disco
raccolta_metriche_disco() {
    log "INFO" "Raccolta metriche disco..."
    
    for dir in "${DIRECTORY_MONITORATE[@]}"; do
        if [ -d "$dir" ]; then
            UTILIZZO_DISCO=$(df -h "$dir" | awk 'NR==2 {print $5}' | sed 's/%//')
            SPAZIO_TOTALE=$(df -h "$dir" | awk 'NR==2 {print $2}')
            SPAZIO_USATO=$(df -h "$dir" | awk 'NR==2 {print $3}')
            SPAZIO_LIBERO=$(df -h "$dir" | awk 'NR==2 {print $4}')
            
            log "INFO" "Disco $dir: ${UTILIZZO_DISCO}% (${SPAZIO_USATO}/${SPAZIO_TOTALE})"
            
            # Verifica soglie
            if [ "$UTILIZZO_DISCO" -ge "$SOGLIA_DISCO" ]; then
                log "WARNING" "Soglia disco superata per $dir! Utilizzo: ${UTILIZZO_DISCO}%"
                invia_notifica "DISCO" "Spazio disco critico su $dir: ${UTILIZZO_DISCO}%"
            fi
            
            # Salva dati per il report
            echo "${timestamp},disco,${dir},${UTILIZZO_DISCO}" >> "$DIR_LOG/disco_data.csv"
        else
            log "WARNING" "Directory $dir non esiste, impossibile monitorare"
        fi
    done
}

# Funzione per monitorare processi critici
monitoraggio_processi() {
    log "INFO" "Monitoraggio processi critici..."
    
    for processo in "${PROCESSI_CRITICI[@]}"; do
        NUM_PROCESSI=$(pgrep -c "$processo" 2>/dev/null || echo 0)
        
        if [ "$NUM_PROCESSI" -gt 0 ]; then
            log "INFO" "Processo $processo: $NUM_PROCESSI istanze in esecuzione"
            
            # Ottieni CPU e memoria per ogni istanza
            PROCESSI_INFO=$(ps -C "$processo" -o pid,%cpu,%mem,cmd --sort=-%cpu | head -n 6)
            echo "$PROCESSI_INFO" >> "$DIR_LOG/processi_${processo}.log"
        else
            log "WARNING" "Processo critico $processo non in esecuzione!"
            invia_notifica "PROCESSO" "Processo critico $processo non in esecuzione!"
        fi
    done
}

# Funzione per inviare notifiche
invia_notifica() {
    local tipo=$1
    local messaggio=$2
    local timestamp=$(date "+%Y-%m-%d %H:%M:%S")
    
    # Registra la notifica nel file di log
    echo "[${timestamp}] [NOTIFICA] [${tipo}] ${messaggio}" >> "$DIR_LOG/notifiche.log"
    
    # Invia email se configurato
    if [ "$EMAIL_ATTIVO" = true ] && [ -n "$NOTIFICA_EMAIL" ]; then
        echo "${messaggio}" | mail -s "[ALERT] Sistema di Monitoraggio - ${tipo}" "$NOTIFICA_EMAIL"
        log "INFO" "Notifica email inviata a $NOTIFICA_EMAIL"
    fi
    
    # Qui potresti aggiungere altri metodi di notifica (Slack, Telegram, ecc.)
}

# Funzione per generare report HTML
genera_report() {
    log "INFO" "Generazione report HTML..."
    
    # Crea intestazione HTML
    cat > "$FILE_REPORT" << EOF
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Report di Sistema - $(date +"%d/%m/%Y")</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 20px; }
        h1 { color: #333366; }
        h2 { color: #666699; margin-top: 30px; }
        table { border-collapse: collapse; width: 100%; margin-top: 10px; }
        th, td { border: 1px solid #ddd; padding: 8px; text-align: left; }
        th { background-color: #f2f2f2; }
        tr:nth-child(even) { background-color: #f9f9f9; }
        .warning { color: orange; }
        .critical { color: red; }
        .normal { color: green; }
    </style>
</head>
<body>
    <h1>Report di Sistema - $(date +"%d/%m/%Y")</h1>
    <p>Generato il: $(date "+%d/%m/%Y %H:%M:%S")</p>
    
    <h2>Riepilogo</h2>
    <table>
        <tr>
            <th>Metrica</th>
            <th>Valore</th>
            <th>Stato</th>
        </tr>
        <tr>
            <td>Utilizzo CPU</td>
            <td>${CPU_UTILIZZO}%</td>
            <td class="$([ "$CPU_UTILIZZO_INT" -ge "$SOGLIA_CPU" ] && echo "critical" || echo "normal")">$([ "$CPU_UTILIZZO_INT" -ge "$SOGLIA_CPU" ] && echo "CRITICO" || echo "Normale")</td>
        </tr>
        <tr>
            <td>Load Average</td>
            <td>${LOAD_AVG}</td>
            <td class="$(echo "$LOAD_AVG > $SOGLIA_CARICO" | bc -l | grep -q 1 && echo "critical" || echo "normal")">$(echo "$LOAD_AVG > $SOGLIA_CARICO" | bc -l | grep -q 1 && echo "CRITICO" || echo "Normale")</td>
        </tr>
        <tr>
            <td>Memoria</td>
            <td>${MEM_PERCENTUALE}% (${MEM_USATA}/${MEM_TOTALE} MB)</td>
            <td class="$([ "$MEM_PERCENTUALE" -ge "$SOGLIA_MEMORIA" ] && echo "critical" || echo "normal")">$([ "$MEM_PERCENTUALE" -ge "$SOGLIA_MEMORIA" ] && echo "CRITICO" || echo "Normale")</td>
        </tr>
EOF
    
    # Aggiungi informazioni sul disco
    for dir in "${DIRECTORY_MONITORATE[@]}"; do
        if [ -d "$dir" ]; then
            UTILIZZO_DISCO=$(df -h "$dir" | awk 'NR==2 {print $5}' | sed 's/%//')
            SPAZIO_TOTALE=$(df -h "$dir" | awk 'NR==2 {print $2}')
            SPAZIO_USATO=$(df -h "$dir" | awk 'NR==2 {print $3}')
            
            cat >> "$FILE_REPORT" << EOF
        <tr>
            <td>Disco $dir</td>
            <td>${UTILIZZO_DISCO}% (${SPAZIO_USATO}/${SPAZIO_TOTALE})</td>
            <td class="$([ "$UTILIZZO_DISCO" -ge "$SOGLIA_DISCO" ] && echo "critical" || echo "normal")">$([ "$UTILIZZO_DISCO" -ge "$SOGLIA_DISCO" ] && echo "CRITICO" || echo "Normale")</td>
        </tr>
EOF
        fi
    done
    
    # Chiudi la tabella di riepilogo
    echo "    </table>" >> "$FILE_REPORT"
    
    # Aggiungi sezione processi critici
    cat >> "$FILE_REPORT" << EOF
    
    <h2>Processi Critici</h2>
    <table>
        <tr>
            <th>Processo</th>
            <th>Stato</th>
            <th>Istanze</th>
        </tr>
EOF
    
    for processo in "${PROCESSI_CRITICI[@]}"; do
        NUM_PROCESSI=$(pgrep -c "$processo" 2>/dev/null || echo 0)
        
        cat >> "$FILE_REPORT" << EOF
        <tr>
            <td>${processo}</td>
            <td class="$([ "$NUM_PROCESSI" -eq 0 ] && echo "critical" || echo "normal")">$([ "$NUM_PROCESSI" -eq 0 ] && echo "NON IN ESECUZIONE" || echo "In esecuzione")</td>
            <td>${NUM_PROCESSI}</td>
        </tr>
EOF
    done
    
    # Chiudi la tabella dei processi
    echo "    </table>" >> "$FILE_REPORT"
    
    # Aggiungi sezione notifiche recenti
    cat >> "$FILE_REPORT" << EOF
    
    <h2>Notifiche Recenti</h2>
    <table>
        <tr>
            <th>Timestamp</th>
            <th>Tipo</th>
            <th>Messaggio</th>
        </tr>
EOF
    
    # Aggiungi le ultime 10 notifiche
    if [ -f "$DIR_LOG/notifiche.log" ]; then
        tail -n 10 "$DIR_LOG/notifiche.log" | while read -r line; do
            NOTIFICA_TIMESTAMP=$(echo "$line" | cut -d']' -f1 | sed 's/\[//')
            NOTIFICA_TIPO=$(echo "$line" | cut -d']' -f3 | sed 's/\[//')
            NOTIFICA_MESSAGGIO=$(echo "$line" | cut -d']' -f4-)
            
            cat >> "$FILE_REPORT" << EOF
        <tr>
            <td>${NOTIFICA_TIMESTAMP}</td>
            <td>${NOTIFICA_TIPO}</td>
            <td>${NOTIFICA_MESSAGGIO}</td>
        </tr>
EOF
        done
    fi
    
    # Chiudi la tabella delle notifiche
    echo "    </table>" >> "$FILE_REPORT"
    
    # Chiudi il documento HTML
    cat >> "$FILE_REPORT" << EOF
    
    <h2>Informazioni di Sistema</h2>
    <pre>
$(uname -a)

Uptime: $(uptime)
    </pre>
    
    <p><small>Generato dal Sistema di Monitoraggio v1.0</small></p>
</body>
</html>
EOF
    
    log "SUCCESS" "Report HTML generato: $FILE_REPORT"
}

# Funzione per pulire vecchi log
pulisci_vecchi_log() {
    log "INFO" "Pulizia vecchi log..."
    
    # Rimuovi file di log più vecchi di MAX_LOG giorni
    find "$DIR_LOG" -name "*.log" -type f -mtime +"$MAX_LOG" -delete
    find "$DIR_LOG" -name "*.csv" -type f -mtime +"$MAX_LOG" -delete
    find "$DIR_LOG" -name "report_*.html" -type f -mtime +"$MAX_LOG" -delete
    
    log "INFO" "Pulizia completata"
}

# Funzione principale
main() {
    log "INFO" "Avvio del sistema di monitoraggio..."
    
    # Carica configurazione
    carica_configurazione
    
    # Esegui il monitoraggio una volta
    raccolta_metriche_cpu
    raccolta_metriche_memoria
    raccolta_metriche_disco
    monitoraggio_processi
    
    # Genera report
    genera_report
    
    # Pulisci vecchi log
    pulisci_vecchi_log
    
    log "SUCCESS" "Monitoraggio completato con successo"
    
    # Se lo script è stato chiamato con l'opzione --daemon, continua a eseguire
    if [ "$1" = "--daemon" ]; then
        log "INFO" "Modalità daemon attivata, intervallo: $INTERVALLO secondi"
        
        while true; do
            sleep "$INTERVALLO"
            raccolta_metriche_cpu
            raccolta_metriche_memoria
            raccolta_metriche_disco
            monitoraggio_processi
            genera_report
            
            # Pulisci vecchi log una volta al giorno (86400 secondi)
            if [ $((RANDOM % (86400 / INTERVALLO))) -eq 0 ]; then
                pulisci_vecchi_log
            fi
        done
    fi
}

# Gestione degli argomenti
case "$1" in
    --help|-h)
        echo "Utilizzo: $0 [OPZIONE]"
        echo "Opzioni:"
        echo "  --help, -h     Mostra questo messaggio di aiuto"
        echo "  --daemon, -d   Esegui in modalità daemon (continua)"
        echo "  --report, -r   Genera solo il report"
        echo "  --config, -c   Mostra la configurazione attuale"
        exit 0
        ;;
    --daemon|-d)
        main "--daemon"
        ;;
    --report|-r)
        carica_configurazione
        raccolta_metriche_cpu
        raccolta_metriche_memoria
        raccolta_metriche_disco
        monitoraggio_processi
        genera_report
        echo "Report generato: $FILE_REPORT"
        exit 0
        ;;
    --config|-c)
        carica_configurazione
        echo "Configurazione attuale:"
        echo "  Soglia CPU: $SOGLIA_CPU%"
        echo "  Soglia Memoria: $SOGLIA_MEMORIA%"
        echo "  Soglia Disco: $SOGLIA_DISCO%"
        echo "  Soglia Carico: $SOGLIA_CARICO"
        echo "  Intervallo: $INTERVALLO secondi"
        echo "  Max Log: $MAX_LOG giorni"
        echo "  Directory monitorate: ${DIRECTORY_MONITORATE[*]}"
        echo "  Processi critici: ${PROCESSI_CRITICI[*]}"
        if [ "$EMAIL_ATTIVO" = true ]; then
            echo "  Notifiche email: Attive ($NOTIFICA_EMAIL)"
        else
            echo "  Notifiche email: Disattive"
        fi
        exit 0
        ;;
    *)
        main
        ;;
esac