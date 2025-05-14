#!/bin/bash
# Script di esempio: mostra informazioni di sistema
echo "====== Informazioni di Sistema ======"
echo "Data e ora correnti: $(date)"
echo "Nome host: $(hostname)"
echo "Distribuzione Linux: $(cat /etc/os-release | grep PRETTY_NAME | cut -d '=' -f 2 | tr -d '"')"
echo "Versione kernel: $(uname -r)"
echo "Architettura CPU: $(uname -m)"
echo "Memoria: $(free -h | grep Mem | awk '{print $2}')"
echo "Spazio su disco: $(df -h / | grep / | awk '{print $4}') disponibile su /"
echo "Utente corrente: $(whoami)"
echo "Tempo di attività: $(uptime -p)"
echo "====================================="
