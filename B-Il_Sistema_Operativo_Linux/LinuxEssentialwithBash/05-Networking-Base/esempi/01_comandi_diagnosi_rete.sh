#!/bin/bash
# Script di esempio per dimostrare i comandi di base per la diagnosi di rete in Linux

echo "======================================================"
echo "              COMANDI DI DIAGNOSI RETE"
echo "======================================================"

# 1. Visualizzare la configurazione delle interfacce di rete
echo "
--- 1. Visualizzazione Configurazione Interfacce (ip addr) ---"
read -p "Vuoi visualizzare la configurazione delle interfacce di rete? (s/N): " conferma_ip
if [[ "$conferma_ip" =~ ^[sS]$ ]]; then
    echo "Esecuzione: ip addr show"
    ip addr show
else
    echo "Comando 'ip addr show' saltato."
fi

# 2. Verificare la raggiungibilità di un host (ping)
echo "
--- 2. Verifica Raggiungibilità Host (ping) ---"
read -p "Inserisci un hostname o indirizzo IP da pingare (es. google.com o 8.8.8.8): " host_ping
if [ -n "$host_ping" ]; then
    echo "Esecuzione: ping -c 4 $host_ping"
    ping -c 4 "$host_ping"
else
    echo "Nessun host inserito. Comando 'ping' saltato."
fi

# 3. Tracciare il percorso verso un host (traceroute)
echo "
--- 3. Tracciamento Percorso (traceroute) ---"
read -p "Vuoi tracciare il percorso verso '$host_ping' (o un altro host se non inserito prima)? (s/N): " conferma_trace
if [[ "$conferma_trace" =~ ^[sS]$ ]]; then
    if [ -z "$host_ping" ]; then
        read -p "Inserisci un hostname o indirizzo IP per traceroute: " host_trace
    else
        host_trace="$host_ping"
    fi
    if [ -n "$host_trace" ]; then
        echo "Esecuzione: traceroute $host_trace"
        echo "(Nota: traceroute potrebbe richiedere privilegi di root o più tempo per completare)"
        traceroute "$host_trace"
    else
        echo "Nessun host inserito. Comando 'traceroute' saltato."
    fi
else
    echo "Comando 'traceroute' saltato."
fi

# 4. Risoluzione nomi DNS (nslookup)
echo "
--- 4. Risoluzione Nomi DNS (nslookup) ---"
read -p "Inserisci un hostname da risolvere con nslookup (es. www.kernel.org): " host_nslookup
if [ -n "$host_nslookup" ]; then
    echo "Esecuzione: nslookup $host_nslookup"
    nslookup "$host_nslookup"
else
    echo "Nessun host inserito. Comando 'nslookup' saltato."
fi

# 5. Risoluzione nomi DNS avanzata (dig)
echo "
--- 5. Risoluzione Nomi DNS Avanzata (dig) ---"
read -p "Vuoi usare 'dig' per risolvere '$host_nslookup' (o un altro host)? (s/N): " conferma_dig
if [[ "$conferma_dig" =~ ^[sS]$ ]]; then
    if [ -z "$host_nslookup" ]; then
        read -p "Inserisci un hostname per dig: " host_dig
    else
        host_dig="$host_nslookup"
    fi
    if [ -n "$host_dig" ]; then
        echo "Esecuzione: dig $host_dig A +short (per l'indirizzo IPv4)"
        dig "$host_dig" A +short
        echo "
Esecuzione: dig $host_dig MX +short (per i record Mail Exchange)"
        dig "$host_dig" MX +short
    else
        echo "Nessun host inserito. Comando 'dig' saltato."
    fi
else
    echo "Comando 'dig' saltato."
fi

# 6. Visualizzare le connessioni di rete (ss)
echo "
--- 6. Visualizzazione Connessioni di Rete (ss) ---"
read -p "Vuoi visualizzare le porte TCP in ascolto (listening)? (s/N): " conferma_ss_listen
if [[ "$conferma_ss_listen" =~ ^[sS]$ ]]; then
    echo "Esecuzione: ss -tlpn (Porte TCP in ascolto, numeriche, con PID)"
    sudo ss -tlpn
else
    echo "Comando 'ss -tlpn' saltato."
fi

read -p "Vuoi visualizzare le connessioni TCP stabilite? (s/N): " conferma_ss_estab
if [[ "$conferma_ss_estab" =~ ^[sS]$ ]]; then
    echo "Esecuzione: ss -tpn state established (Connessioni TCP stabilite, numeriche, con PID)"
    ss -tpn state established
else
    echo "Comando 'ss -tpn state established' saltato."
fi

echo "
======================================================"
echo "          ESEMPI DI COMANDI COMPLETATI"
echo "======================================================"
echo "Ricorda che alcuni comandi (es. traceroute, ss con opzione -p) potrebbero richiedere privilegi di root (sudo)."