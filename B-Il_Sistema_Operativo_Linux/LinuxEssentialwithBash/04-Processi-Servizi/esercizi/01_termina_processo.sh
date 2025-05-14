#!/bin/bash
# Esercizio: Interagire con i processi

# Funzione per mostrare i processi dell'utente corrente
mostra_processi_utente() {
    echo "-----------------------------------------------------"
    echo "Processi dell'utente corrente ($USER):"
    echo "-----------------------------------------------------"
    ps ux
    echo "-----------------------------------------------------"
}

# 1. Mostrare i processi
mostra_processi_utente

# 2. Chiedere all'utente un PID da terminare
echo "
ATTENZIONE: Questo script tenterà di terminare un processo.
Assicurati di inserire il PID di un processo che puoi terminare senza causare problemi
(ad esempio, un processo di test come 'sleep 1000 &' avviato da te).
NON TERMINARE PROCESSI DI SISTEMA O IMPORTANTI.
"
read -p "Inserisci il PID del processo che vuoi provare a terminare (o 'q' per saltare): " pid_da_terminare

if [[ "$pid_da_terminare" =~ ^[0-9]+$ ]]; then
    # Verifica se il processo esiste e appartiene all'utente
    if ps -p "$pid_da_terminare" -u "$USER" > /dev/null; then
        echo "Processo $pid_da_terminare trovato."
        
        read -p "Vuoi inviare un segnale SIGTERM (15) al processo $pid_da_terminare? (s/N): " conferma_term
        if [[ "$conferma_term" =~ ^[sS]$ ]]; then
            echo "Invio di SIGTERM (15) al processo $pid_da_terminare..."
            kill -15 "$pid_da_terminare"
            sleep 2 # Diamo tempo al processo di terminare
            if ps -p "$pid_da_terminare" > /dev/null; then
                echo "Il processo $pid_da_terminare è ancora in esecuzione."
                read -p "Vuoi inviare un segnale SIGKILL (9) al processo $pid_da_terminare? (s/N): " conferma_kill
                if [[ "$conferma_kill" =~ ^[sS]$ ]]; then
                    echo "Invio di SIGKILL (9) al processo $pid_da_terminare..."
                    kill -9 "$pid_da_terminare"
                    echo "Segnale SIGKILL inviato."
                else
                    echo "SIGKILL non inviato."
                fi
            else
                echo "Processo $pid_da_terminare terminato con SIGTERM."
            fi
        else
            echo "SIGTERM non inviato."
        fi
    else
        echo "Errore: Processo con PID $pid_da_terminare non trovato o non appartenente all'utente $USER."
    fi
elif [[ "$pid_da_terminare" != "q" ]]; then
    echo "Input non valido. PID deve essere un numero."
fi

echo "
Esercizio completato.

Per testare questo script in modo sicuro:
1. Apri un altro terminale.
2. Esegui un comando semplice in background, ad esempio: sleep 1000 &
3. Prendi nota del PID restituito.
4. Esegui questo script e usa quel PID.
"