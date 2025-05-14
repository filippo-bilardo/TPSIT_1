#!/bin/bash
# Script di esempio: monitoraggio del sistema
# Questo script mostra come raccogliere varie informazioni di sistema

echo "============================================================"
echo "              MONITORAGGIO DEL SISTEMA LINUX                "
echo "============================================================"

# ------------ INFORMAZIONI DI BASE ------------
echo -e "\n=== INFORMAZIONI DI BASE DEL SISTEMA ==="
echo "Data e ora: $(date)"
echo "Hostname: $(hostname)"
echo "Kernel: $(uname -r)"
echo "Uptime: $(uptime -p)"
echo "Utenti loggati: $(who | wc -l)"

# ------------ UTILIZZO CPU ------------
echo -e "\n=== UTILIZZO CPU ==="
echo "Carico medio (1, 5, 15 min):"
uptime | grep -oE 'load average: [0-9.]+(, [0-9.]+)+'

echo -e "\nDettagli utilizzo CPU (prime 5 linee):"
echo "processor, %user, %system, %idle"
mpstat -P ALL | grep -v Average | head -n 7

echo -e "\nProcessi che utilizzano più CPU:"
ps aux --sort=-%cpu | head -n 6

# ------------ MEMORIA ------------
echo -e "\n=== MEMORIA ==="
echo "Statistiche memoria:"
free -h

echo -e "\nSwap utilizzato:"
swapon --show

echo -e "\nProcessi che utilizzano più memoria:"
ps aux --sort=-%mem | head -n 6

# ------------ SPAZIO SU DISCO ------------
echo -e "\n=== SPAZIO SU DISCO ==="
echo "Utilizzo spazio disco (filesystem principali):"
df -h | grep -v "tmpfs\|udev"

echo -e "\nDirectory che occupano più spazio nella directory corrente:"
du -sh * 2>/dev/null | sort -hr | head -n 5

# ------------ RETE ------------
echo -e "\n=== INFORMAZIONI DI RETE ==="
echo "Interfacce di rete:"
ip -brief address show

echo -e "\nConnessioni di rete attive (top 10):"
ss -tuln | head -n 11

# ------------ PROCESSI ------------
echo -e "\n=== PROCESSI ==="
echo "Totale processi in esecuzione: $(ps aux | wc -l)"

echo -e "\nTop 5 processi per CPU:"
ps -eo pid,ppid,cmd,%cpu,%mem --sort=-%cpu | head -n 6

echo -e "\nTop 5 processi per memoria:"
ps -eo pid,ppid,cmd,%cpu,%mem --sort=-%mem | head -n 6

# ------------ SERVIZI ------------
echo -e "\n=== SERVIZI DEL SISTEMA ==="
echo "Servizi sistemd attivi (top 10):"
systemctl list-units --type=service --state=running | head -n 11

# ------------ I/O DISCO ------------
echo -e "\n=== OPERAZIONI I/O SU DISCO ==="
if command -v iostat &> /dev/null; then
    echo "Statistiche I/O disco (primi 5 dispositivi):"
    iostat -d -h | head -n 10
else
    echo "iostat non installato. Installa il pacchetto sysstat per visualizzare statistiche I/O."
fi

# ------------ LOG DI SISTEMA ------------
echo -e "\n=== LOG DI SISTEMA RECENTI ==="
echo "Messaggi recenti dai log di sistema (ultimi 10):"
if command -v journalctl &> /dev/null; then
    journalctl -q -n 10 --no-pager
else
    tail -n 10 /var/log/syslog 2>/dev/null || echo "Impossibile accedere ai log di sistema."
fi

# ------------ UTENTI ------------
echo -e "\n=== UTENTI E SESSIONI ==="
echo "Sessioni utente attive:"
who

echo -e "\nUltimi accessi al sistema (5 più recenti):"
last | head -n 5

# ------------ RISORSE IN TEMPO REALE ------------
echo -e "\n=== MONITORAGGIO IN TEMPO REALE ==="
echo "Per un monitoraggio in tempo reale, puoi usare comandi come:"
echo "- top/htop: Visualizzazione processi e utilizzo risorse"
echo "- vmstat 1: Statistiche di sistema ogni secondo"
echo "- iostat -dx 1: Statistiche I/O dettagliate ogni secondo"
echo "- netstat -i 1: Statistiche rete ogni secondo"
echo "- sar: Collezione e reporting di statistiche di sistema"

echo -e "\n============================================================"
echo "        FINE DEL REPORT DI MONITORAGGIO DEL SISTEMA           "
echo "============================================================"
