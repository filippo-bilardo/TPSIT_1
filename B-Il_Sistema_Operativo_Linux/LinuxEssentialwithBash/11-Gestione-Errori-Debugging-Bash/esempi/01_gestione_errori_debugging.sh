#!/bin/bash

# Esempio di gestione degli errori e debugging in Bash
# Questo script dimostra varie tecniche per gestire errori e debug negli script Bash

# Attivazione della modalità di debug
echo "=== Attivazione della modalità di debug ==="
set -x  # Attiva il debug (mostra i comandi eseguiti)

# Esempio di comando semplice in debug
echo "Questo comando viene mostrato prima dell'esecuzione"

# Disattivazione della modalità di debug
set +x
echo "\n=== Modalità di debug disattivata ==="

# Gestione degli errori con controllo del codice di uscita
echo "\n=== Controllo del codice di uscita ==="
ls file_esistente.txt 2>/dev/null
if [ $? -eq 0 ]; then
    echo "Il file esiste"
else
    echo "Il file non esiste (codice di errore: $?)"
fi

# Creazione di un file temporaneo per i test
touch file_esistente.txt
echo "File temporaneo creato: file_esistente.txt"

# Utilizzo di || per eseguire un comando in caso di errore
echo "\n=== Utilizzo di || (OR) per gestire errori ==="
ls file_inesistente.txt 2>/dev/null || echo "File non trovato, gestione dell'errore attivata"

# Utilizzo di && per eseguire un comando solo in caso di successo
echo "\n=== Utilizzo di && (AND) per eseguire comandi in sequenza ==="
ls file_esistente.txt 2>/dev/null && echo "File trovato, continuiamo l'esecuzione"

# Impostazione di trap per gestire segnali
echo "\n=== Utilizzo di trap per gestire segnali ==="

cleanup() {
    echo "Funzione di pulizia chiamata"
    rm -f file_esistente.txt
    echo "File temporaneo rimosso"
}

# Registra la funzione cleanup per essere eseguita all'uscita
trap cleanup EXIT

# Impostazione di errexit per terminare lo script in caso di errore
echo "\n=== Utilizzo di set -e (errexit) ==="
echo "Attivazione di errexit (lo script terminerà al primo errore)"
set -e

# Questo comando avrà successo
echo "Questo comando funziona correttamente"

# Disattivazione di errexit per dimostrare altri esempi
set +e

# Utilizzo di set -u per rilevare variabili non definite
echo "\n=== Utilizzo di set -u (nounset) ==="
echo "Attivazione di nounset (rileva variabili non definite)"
set -u

# Variabile definita
VAR_DEFINITA="Questa variabile è definita"
echo "$VAR_DEFINITA"

# Disattivazione di nounset per evitare errori
set +u

# Variabile non definita (causerebbe un errore con set -u)
echo "Con nounset disattivato, una variabile non definita diventa stringa vuota: '$VAR_NON_DEFINITA'"

# Utilizzo di set -o pipefail per rilevare errori nelle pipe
echo "\n=== Utilizzo di set -o pipefail ==="
echo "Attivazione di pipefail (rileva errori nelle pipe)"
set -o pipefail

# Esempio di pipe con errore
echo "Esempio di pipe con comando inesistente (verrà generato un errore):"
comando_inesistente 2>/dev/null | echo "Questo viene eseguito comunque"
echo "Codice di uscita della pipe: $?"

# Disattivazione di pipefail
set +o pipefail

# Utilizzo di funzioni per la gestione degli errori
echo "\n=== Funzioni per la gestione degli errori ==="

gestisci_errore() {
    local linea=$1
    local comando=$2
    local codice=$3
    echo "Errore alla linea $linea: comando '$comando' è fallito con codice $codice"
}

# Registra la funzione per gestire errori
trap 'gestisci_errore ${LINENO} "$BASH_COMMAND" $?' ERR

# Esempio di comando che fallirà
echo "Esecuzione di un comando che fallirà:"
ls /directory/inesistente 2>/dev/null

# Rimozione del trap ERR
trap - ERR

echo "\n=== Esempio completato! ==="