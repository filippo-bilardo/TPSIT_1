#!/bin/bash
# Script di esempio: dimostrazione del comando sudo
# NOTA: Questo script richiede privilegi sudo per alcune operazioni

echo "===== DIMOSTRAZIONE DI SUDO ====="

# Verifica se l'utente può usare sudo
if sudo -v &> /dev/null; then
    echo "L'utente $(whoami) ha accesso a sudo."
else
    echo "L'utente $(whoami) NON ha accesso a sudo. Alcune parti di questo script non funzioneranno."
    echo "Per continuare, eseguire il script come utente con privilegi sudo."
    exit 1
fi

# Mostra la configurazione di sudo
echo -e "\n== Configurazione di sudo =="
echo "File di configurazione di sudo:"
sudo ls -la /etc/sudoers /etc/sudoers.d/

# Mostra chi può usare sudo
echo -e "\n== Utenti nel gruppo sudo/wheel =="
if grep -q "^sudo:" /etc/group; then
    echo "Membri del gruppo sudo: $(grep "^sudo:" /etc/group | cut -d: -f4)"
elif grep -q "^wheel:" /etc/group; then
    echo "Membri del gruppo wheel: $(grep "^wheel:" /etc/group | cut -d: -f4)"
else
    echo "Nessun gruppo sudo o wheel trovato."
fi

# Differenza tra utente normale e super user
echo -e "\n== Differenza tra utente normale e root =="
echo "1. Tentativo di visualizzare file di sistema protetto come utente normale:"
if cat /etc/shadow &> /dev/null; then
    echo "Sorprendentemente, sei riuscito ad accedere a /etc/shadow come utente normale."
else
    echo "Errore: Accesso negato a /etc/shadow (come previsto per un utente normale)"
fi

echo -e "\n2. Tentativo di visualizzare lo stesso file con sudo:"
if sudo cat /etc/shadow &> /dev/null; then
    echo "Successo! Con sudo puoi accedere a /etc/shadow."
    echo "(Output non mostrato per questioni di sicurezza)"
else
    echo "Errore: Non riesci ad accedere al file nemmeno con sudo."
fi

# Esecuzione dei comandi come altro utente
echo -e "\n== Esecuzione comandi come altro utente =="
echo "Utente corrente: $(whoami)"
echo "Comando 'whoami' eseguito con sudo:"
sudo whoami

# Mostra alcuni esempi comuni di utilizzo di sudo
echo -e "\n== Esempi comuni di utilizzo di sudo =="
echo "1. Visualizzazione log di sistema:"
echo "   sudo tail /var/log/syslog"
echo "2. Montare un filesystem:"
echo "   sudo mount /dev/sdb1 /mnt"
echo "3. Modificare file di configurazione:"
echo "   sudo nano /etc/hosts"
echo "4. Gestire servizi di sistema:"
echo "   sudo systemctl restart apache2"
echo "5. Aggiornare il sistema:"
echo "   sudo apt update && sudo apt upgrade (Debian/Ubuntu)"
echo "   sudo dnf update (Fedora/RHEL)"

# Regole importanti per sudo
echo -e "\n== Regole importanti per sudo =="
echo "1. Usa sudo solo quando necessario"
echo "2. Non eseguire applicazioni grafiche con sudo (usare invece pkexec)"
echo "3. Stai attento con sudo su script scaricati da Internet"
echo "4. Evita di usare 'sudo su' o 'sudo -i' a meno che non sia assolutamente necessario"
echo "5. Ricorda che le azioni con sudo sono registrate nei log di sistema"

# Mostra gli ultimi comandi sudo nei log (se disponibili)
echo -e "\n== Ultimi comandi sudo nei log =="
if [ -f /var/log/auth.log ]; then
    echo "Ultimi 5 comandi sudo nei log:"
    sudo grep "sudo" /var/log/auth.log | tail -5
elif [ -f /var/log/secure ]; then
    echo "Ultimi 5 comandi sudo nei log:"
    sudo grep "sudo" /var/log/secure | tail -5
else
    echo "File di log standard non trovati."
fi

echo -e "\n===== FINE DIMOSTRAZIONE ====="
