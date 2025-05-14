#!/bin/bash
# Esempio di utilizzo di trap per intercettare segnali ed errori

# Funzione da eseguire quando lo script esce
cleanup() {
    echo ""
    echo "Pulizia in corso... (simulazione)"
    # Qui potresti rimuovere file temporanei, chiudere connessioni, ecc.
    rm -f /tmp/mio_script_temp_file.txt
    echo "Pulizia completata."
}

# Funzione da eseguire in caso di errore (segnale ERR)
handle_error() {
    local exit_code=$?
    local line_number=$1
    echo ""
    echo "Errore rilevato sulla linea $line_number con codice di uscita $exit_code"
    echo "Lo script terminerà."
    # Potresti voler loggare l'errore o inviare una notifica
}

# Funzione da eseguire quando si riceve SIGINT (Ctrl+C)
handle_sigint() {
    echo ""
    echo "SIGINT (Ctrl+C) ricevuto. Uscita in corso..."
    # Esegui la pulizia anche qui se necessario
    cleanup
    exit 130 # Codice di uscita standard per SIGINT
}

# Imposta le trap
trap cleanup EXIT         # Esegue cleanup() quando lo script esce (normalmente o per errore)
trap 'handle_error $LINENO' ERR # Esegue handle_error() quando un comando restituisce un errore (se set -e non è attivo o per errori non coperti)
trap handle_sigint SIGINT SIGTERM # Esegue handle_sigint() su Ctrl+C o SIGTERM

# Abilita l'uscita immediata in caso di errore per far scattare la trap ERR più chiaramente
set -e

echo "Script avviato. PID: $$"
echo "Prova a premere Ctrl+C per vedere la trap SIGINT in azione."
echo "Oppure attendi che lo script generi un errore."

# Crea un file temporaneo (per la demo di cleanup)
touch /tmp/mio_script_temp_file.txt
echo "File temporaneo /tmp/mio_script_temp_file.txt creato."

# Simulazione di lavoro
echo ""
echo "Inizio lavoro simulato..."
for i in {1..5}; do
    echo "Lavoro in corso... ($i/5)"
    sleep 1
done

echo ""
echo "Ora causerò un errore per testare la trap ERR."
comando_che_non_esiste # Questo comando fallirà e attiverà la trap ERR

# Questa parte dello script non dovrebbe essere raggiunta se l'errore precedente si verifica
echo "Lavoro simulato completato con successo."
echo "Fine dello script (questo messaggio non dovrebbe apparire se l'errore si verifica)."
