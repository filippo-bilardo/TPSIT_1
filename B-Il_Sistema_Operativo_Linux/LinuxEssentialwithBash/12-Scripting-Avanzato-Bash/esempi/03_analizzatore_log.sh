#!/bin/bash

# ================================================================
# Analizzatore Avanzato di Log con Regex e Manipolazione del Testo
# ================================================================

# Questo script dimostra l'uso avanzato di espressioni regolari e
# strumenti di manipolazione del testo per analizzare file di log
# e generare report strutturati.

# -----------------------------
# Configurazione
# -----------------------------
FILE_LOG="/tmp/esempio_log.txt"
FILE_REPORT="/tmp/report_log.html"

# Colori per output
ROSSO="\033[0;31m"
VERDE="\033[0;32m"
GIALLO="\033[0;33m"
BLU="\033[0;34m"
NC="\033[0m" # No Color

# -----------------------------
# Funzioni
# -----------------------------

# Funzione per creare un file di log di esempio
crea_log_esempio() {
    echo -e "${BLU}Creazione file di log di esempio...${NC}"
    
    # Crea un file di log di esempio con vari formati e messaggi
    cat > "$FILE_LOG" << EOF
[2023-05-10 08:12:34] [INFO] Avvio del sistema
[2023-05-10 08:12:35] [INFO] Connessione al database riuscita
[2023-05-10 08:15:42] [WARNING] Spazio su disco inferiore al 20% (IP: 192.168.1.10)
[2023-05-10 08:23:11] [ERROR] Impossibile accedere al file /var/data/config.xml
[2023-05-10 08:25:30] [INFO] Utente mario.rossi@example.com ha effettuato l'accesso (IP: 10.0.0.15)
[2023-05-10 08:45:22] [DEBUG] Parametri di configurazione: timeout=30s, retry=3, mode=auto
[2023-05-10 09:12:05] [INFO] Utente anna.verdi@example.org ha effettuato l'accesso (IP: 10.0.0.23)
[2023-05-10 09:18:47] [WARNING] Timeout durante la connessione al servizio esterno
[2023-05-10 09:30:12] [ERROR] Errore di autenticazione per l'utente luca.bianchi@example.net (IP: 192.168.1.45)
[2023-05-10 09:45:33] [CRITICAL] Servizio database non disponibile dopo 5 tentativi
[2023-05-10 10:02:18] [INFO] Riavvio del servizio database completato
[2023-05-10 10:15:42] [INFO] Utente luca.bianchi@example.net ha effettuato l'accesso (IP: 192.168.1.45)
[2023-05-10 10:30:55] [WARNING] Utilizzo CPU superiore all'80% per 5 minuti
[2023-05-10 10:45:21] [ERROR] Impossibile completare il backup: spazio insufficiente
[2023-05-10 11:05:33] [INFO] Backup manuale avviato dall'amministratore
[2023-05-10 11:20:45] [INFO] Backup completato con successo (dimensione: 1.2GB)
[2023-05-10 11:35:12] [DEBUG] Pulizia cache: 234MB liberati
[2023-05-10 11:50:30] [INFO] Aggiornamento automatico avviato
[2023-05-10 12:05:22] [ERROR] Aggiornamento fallito: errore di connessione al repository
[2023-05-10 12:20:18] [WARNING] Tentativo di accesso non autorizzato da IP: 203.0.113.42
[2023-05-10 12:35:47] [CRITICAL] Rilevato possibile attacco brute force da IP: 203.0.113.42
[2023-05-10 12:40:12] [INFO] IP 203.0.113.42 bloccato automaticamente
[2023-05-10 13:05:33] [INFO] Utente admin@example.com ha effettuato l'accesso (IP: 10.0.0.5)
[2023-05-10 13:20:45] [INFO] Configurazione firewall aggiornata
[2023-05-10 13:35:22] [DEBUG] Scansione di sicurezza avviata
[2023-05-10 14:10:18] [INFO] Scansione completata: nessuna vulnerabilità rilevata
EOF
    
    echo -e "${VERDE}File di log creato in $FILE_LOG${NC}"
}

# Funzione per estrarre e contare i livelli di log
analizza_livelli_log() {
    echo -e "\n${BLU}Analisi dei livelli di log...${NC}"
    
    # Estrai e conta i livelli di log usando grep, sort e uniq
    echo -e "\nDistribuzione dei livelli di log:"
    grep -o "\[\(INFO\|WARNING\|ERROR\|DEBUG\|CRITICAL\)\]" "$FILE_LOG" | \
    sort | uniq -c | sort -nr | \
    awk '{printf "%-10s: %3d occorrenze (%6.2f%%)\n", $2, $1, $1*100/NR}'
    
    # Salva i dati per il report
    grep -o "\[\(INFO\|WARNING\|ERROR\|DEBUG\|CRITICAL\)\]" "$FILE_LOG" | \
    sort | uniq -c | sort -nr > /tmp/livelli_log.txt
}

# Funzione per estrarre indirizzi IP
estrai_indirizzi_ip() {
    echo -e "\n${BLU}Estrazione degli indirizzi IP...${NC}"
    
    # Estrai tutti gli indirizzi IP usando regex
    echo -e "\nIndirizzi IP trovati:"
    grep -E -o "([0-9]{1,3}\.){3}[0-9]{1,3}" "$FILE_LOG" | \
    sort | uniq -c | sort -nr | \
    awk '{printf "%-15s: %3d occorrenze\n", $2, $1}'
    
    # Salva i dati per il report
    grep -E -o "([0-9]{1,3}\.){3}[0-9]{1,3}" "$FILE_LOG" | \
    sort | uniq -c | sort -nr > /tmp/indirizzi_ip.txt
    
    # Identifica IP sospetti (con errori o avvisi)
    echo -e "\nIP con attività sospette:"
    grep -E "\[ERROR\]|\[WARNING\]|\[CRITICAL\]" "$FILE_LOG" | \
    grep -E -o "([0-9]{1,3}\.){3}[0-9]{1,3}" | \
    sort | uniq -c | sort -nr | \
    awk '{printf "%-15s: %3d attività sospette\n", $2, $1}'
}

# Funzione per estrarre indirizzi email
estrai_email() {
    echo -e "\n${BLU}Estrazione degli indirizzi email...${NC}"
    
    # Estrai tutti gli indirizzi email usando regex
    echo -e "\nIndirizzi email trovati:"
    grep -E -o "[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}" "$FILE_LOG" | \
    sort | uniq -c | sort -nr | \
    awk '{printf "%-30s: %3d occorrenze\n", $2, $1}'
    
    # Salva i dati per il report
    grep -E -o "[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}" "$FILE_LOG" | \
    sort | uniq -c | sort -nr > /tmp/indirizzi_email.txt
}

# Funzione per analizzare gli errori
analizza_errori() {
    echo -e "\n${BLU}Analisi degli errori...${NC}"
    
    # Estrai tutti i messaggi di errore
    echo -e "\nMessaggi di errore trovati:"
    grep "\[ERROR\]\|\[CRITICAL\]" "$FILE_LOG" | \
    sed -E 's/^\[(.*?)\] \[(ERROR|CRITICAL)\] (.*)$/\3/' | \
    sort | uniq -c | sort -nr | \
    awk '{printf "%3d occorrenze: %s\n", $1, substr($0, length($1)+1)}'
    
    # Salva i dati per il report
    grep "\[ERROR\]\|\[CRITICAL\]" "$FILE_LOG" | \
    sed -E 's/^\[(.*?)\] \[(ERROR|CRITICAL)\] (.*)$/\3/' | \
    sort | uniq -c | sort -nr > /tmp/errori.txt
}

# Funzione per analizzare l'attività temporale
analizza_attivita_temporale() {
    echo -e "\n${BLU}Analisi dell'attività temporale...${NC}"
    
    # Estrai e conta le ore di attività
    echo -e "\nDistribuzione oraria delle attività:"
    grep -E -o "\[[0-9]{4}-[0-9]{2}-[0-9]{2} ([0-9]{2}):[0-9]{2}:[0-9]{2}\]" "$FILE_LOG" | \
    sed -E 's/.*\[.*? ([0-9]{2}):.*/\1/' | \
    sort | uniq -c | \
    awk '{printf "Ora %s: %3d attività\n", $2, $1}'
    
    # Salva i dati per il report
    grep -E -o "\[[0-9]{4}-[0-9]{2}-[0-9]{2} ([0-9]{2}):[0-9]{2}:[0-9]{2}\]" "$FILE_LOG" | \
    sed -E 's/.*\[.*? ([0-9]{2}):.*/\1/' | \
    sort | uniq -c > /tmp/attivita_oraria.txt
}

# Funzione per generare un report HTML
genera_report_html() {
    echo -e "\n${BLU}Generazione del report HTML...${NC}"
    
    # Crea intestazione HTML
    cat > "$FILE_REPORT" << EOF
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Report Analisi Log</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 20px; }
        h1 { color: #2c3e50; }
        h2 { color: #3498db; margin-top: 30px; }
        table { border-collapse: collapse; width: 100%; margin-top: 10px; }
        th, td { border: 1px solid #ddd; padding: 8px; text-align: left; }
        th { background-color: #f2f2f2; }
        tr:nth-child(even) { background-color: #f9f9f9; }
        .error { color: #e74c3c; }
        .warning { color: #f39c12; }
        .info { color: #2980b9; }
        .debug { color: #7f8c8d; }
        .critical { color: #c0392b; font-weight: bold; }
    </style>
</head>
<body>
    <h1>Report di Analisi Log</h1>
    <p>File analizzato: <code>$FILE_LOG</code></p>
    <p>Data analisi: $(date "+%d/%m/%Y %H:%M:%S")</p>
    
    <h2>Distribuzione dei Livelli di Log</h2>
    <table>
        <tr>
            <th>Livello</th>
            <th>Occorrenze</th>
            <th>Percentuale</th>
        </tr>
EOF
    
    # Aggiungi dati sui livelli di log
    cat /tmp/livelli_log.txt | while read count level; do
        level=$(echo $level | tr -d '[]')
        total=$(wc -l < "$FILE_LOG")
        percentage=$(echo "scale=2; $count * 100 / $total" | bc)
        
        cat >> "$FILE_REPORT" << EOF
        <tr>
            <td class="$level">$level</td>
            <td>$count</td>
            <td>$percentage%</td>
        </tr>
EOF
    done
    
    # Aggiungi sezione indirizzi IP
    cat >> "$FILE_REPORT" << EOF
    </table>
    
    <h2>Indirizzi IP Rilevati</h2>
    <table>
        <tr>
            <th>Indirizzo IP</th>
            <th>Occorrenze</th>
        </tr>
EOF
    
    cat /tmp/indirizzi_ip.txt | while read count ip; do
        cat >> "$FILE_REPORT" << EOF
        <tr>
            <td>$ip</td>
            <td>$count</td>
        </tr>
EOF
    done
    
    # Aggiungi sezione indirizzi email
    cat >> "$FILE_REPORT" << EOF
    </table>
    
    <h2>Indirizzi Email Rilevati</h2>
    <table>
        <tr>
            <th>Indirizzo Email</th>
            <th>Occorrenze</th>
        </tr>
EOF
    
    cat /tmp/indirizzi_email.txt | while read count email; do
        cat >> "$FILE_REPORT" << EOF
        <tr>
            <td>$email</td>
            <td>$count</td>
        </tr>
EOF
    done
    
    # Aggiungi sezione errori
    cat >> "$FILE_REPORT" << EOF
    </table>
    
    <h2>Messaggi di Errore</h2>
    <table>
        <tr>
            <th>Messaggio</th>
            <th>Occorrenze</th>
        </tr>
EOF
    
    cat /tmp/errori.txt | while read line; do
        count=$(echo $line | awk '{print $1}')
        message=$(echo $line | cut -d' ' -f2-)
        
        cat >> "$FILE_REPORT" << EOF
        <tr>
            <td class="error">$message</td>
            <td>$count</td>
        </tr>
EOF
    done
    
    # Aggiungi sezione attività oraria
    cat >> "$FILE_REPORT" << EOF
    </table>
    
    <h2>Distribuzione Oraria delle Attività</h2>
    <table>
        <tr>
            <th>Ora</th>
            <th>Numero di Attività</th>
        </tr>
EOF
    
    cat /tmp/attivita_oraria.txt | while read count hour; do
        cat >> "$FILE_REPORT" << EOF
        <tr>
            <td>$hour:00 - $hour:59</td>
            <td>$count</td>
        </tr>
EOF
    done
    
    # Chiudi il documento HTML
    cat >> "$FILE_REPORT" << EOF
    </table>
    
    <h2>Esempi di Log per Livello</h2>
    
    <h3>Errori Critici</h3>
    <pre>
$(grep "\[CRITICAL\]" "$FILE_LOG" | head -n 3)
    </pre>
    
    <h3>Errori</h3>
    <pre>
$(grep "\[ERROR\]" "$FILE_LOG" | head -n 3)
    </pre>
    
    <h3>Avvisi</h3>
    <pre>
$(grep "\[WARNING\]" "$FILE_LOG" | head -n 3)
    </pre>
    
    <p><small>Generato dall'Analizzatore di Log v1.0</small></p>
</body>
</html>
EOF
    
    echo -e "${VERDE}Report HTML generato in $FILE_REPORT${NC}"
}

# -----------------------------
# Funzione principale
# -----------------------------
main() {
    echo -e "${VERDE}=== ANALIZZATORE AVANZATO DI LOG ===${NC}\n"
    
    # Crea un file di log di esempio se non specificato diversamente
    if [ "$1" = "--file" ] && [ -n "$2" ]; then
        FILE_LOG="$2"
        echo -e "${BLU}Utilizzo file di log: $FILE_LOG${NC}"
    else
        crea_log_esempio
    fi
    
    # Verifica che il file esista
    if [ ! -f "$FILE_LOG" ]; then
        echo -e "${ROSSO}Errore: File di log non trovato: $FILE_LOG${NC}"
        exit 1
    fi
    
    # Esegui le analisi
    analizza_livelli_log
    estrai_indirizzi_ip
    estrai_email
    analizza_errori
    analizza_attivita_temporale
    
    # Genera il report HTML
    genera_report_html
    
    echo -e "\n${VERDE}Analisi completata con successo!${NC}"
    echo -e "Report HTML: $FILE_REPORT"
}

# -----------------------------
# Gestione degli argomenti
# -----------------------------
case "$1" in
    --help|-h)
        echo "Utilizzo: $0 [OPZIONI]"
        echo "Opzioni:"
        echo "  --file FILE    Specifica un file di log da analizzare"
        echo "  --help, -h     Mostra questo messaggio di aiuto"
        exit 0
        ;;
    *)
        main "$@"
        ;;
esac