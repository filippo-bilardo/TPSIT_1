#!/bin/bash
# 06_systemctl_esempio.sh

# Questo script mostra esempi di comandi systemctl.
# Alcuni di questi comandi richiedono privilegi di root (sudo).
# È pensato per sistemi che usano systemd (la maggior parte delle distribuzioni Linux moderne).

SERVICE_NAME="cron" # Puoi cambiare con un altro servizio, es: sshd, apache2, nginx

echo "Comandi di esempio per systemctl sul servizio: $SERVICE_NAME"
echo "-----------------------------------------------------"

echo "1. Controllare lo stato di un servizio:"
echo "   Comando: systemctl status $SERVICE_NAME"
   systemctl status $SERVICE_NAME
   echo "-----------------------------------------------------"

echo "2. Verificare se un servizio è attivo (enabled) all'avvio:"
echo "   Comando: systemctl is-enabled $SERVICE_NAME"
   systemctl is-enabled $SERVICE_NAME
   echo "-----------------------------------------------------"

echo "3. Verificare se un servizio è attualmente in esecuzione (active):"
echo "   Comando: systemctl is-active $SERVICE_NAME"
   systemctl is-active $SERVICE_NAME
   echo "-----------------------------------------------------"


echo "I seguenti comandi modificano lo stato del servizio e generalmente richiedono 'sudo'."
echo "Sono commentati per sicurezza. Decommentali e aggiungi 'sudo' per testarli."

# echo "4. Fermare un servizio (richiede sudo):"
# echo "   Comando: sudo systemctl stop $SERVICE_NAME"
#   # sudo systemctl stop $SERVICE_NAME
#   echo "-----------------------------------------------------"

# sleep 2 # Pausa per osservare l'effetto se decommentato

# echo "5. Avviare un servizio (richiede sudo):"
# echo "   Comando: sudo systemctl start $SERVICE_NAME"
#   # sudo systemctl start $SERVICE_NAME
#   echo "-----------------------------------------------------"

# sleep 2 # Pausa per osservare l'effetto se decommentato

# echo "6. Riavviare un servizio (richiede sudo):"
# echo "   Comando: sudo systemctl restart $SERVICE_NAME"
#   # sudo systemctl restart $SERVICE_NAME
#   echo "-----------------------------------------------------"

# echo "7. Ricaricare la configurazione di un servizio senza riavviarlo (se supportato, richiede sudo):"
# echo "   Comando: sudo systemctl reload $SERVICE_NAME"
#   # sudo systemctl reload $SERVICE_NAME
#   echo "-----------------------------------------------------"

# echo "8. Abilitare un servizio all'avvio del sistema (richiede sudo):"
# echo "   Comando: sudo systemctl enable $SERVICE_NAME"
#   # sudo systemctl enable $SERVICE_NAME
#   echo "-----------------------------------------------------"

# echo "9. Disabilitare un servizio all'avvio del sistema (richiede sudo):"
# echo "   Comando: sudo systemctl disable $SERVICE_NAME"
#   # sudo systemctl disable $SERVICE_NAME
#   echo "-----------------------------------------------------"

echo "Per vedere tutti i servizi disponibili: systemctl list-units --type=service"
echo "Per vedere tutti i servizi in esecuzione: systemctl list-units --type=service --state=running"

echo "Script 06_systemctl_esempio.sh completato."
