# Guida Avanzata: Gestione degli Errori e Debugging in Bash

## Introduzione

La gestione degli errori e il debugging sono aspetti fondamentali nella scrittura di script Bash robusti e affidabili. Questa guida approfondisce le tecniche avanzate per identificare, gestire e prevenire errori nei vostri script.

## Codici di Uscita e Controllo degli Errori

### Comprendere i Codici di Uscita

In Bash, ogni comando restituisce un codice di uscita (exit code) che indica se l'esecuzione è avvenuta con successo o meno:

- **0**: Esecuzione completata con successo
- **1-255**: Errore (diversi codici indicano diversi tipi di errore)

Potete accedere al codice di uscita dell'ultimo comando eseguito tramite la variabile speciale `$?`:

```bash
ls /cartella/esistente
echo "Codice di uscita: $?"

ls /cartella/non/esistente
echo "Codice di uscita: $?"
```

### Gestione Base degli Errori

Ecco alcune tecniche comuni per gestire gli errori:

1. **Controllo del codice di uscita**:

```bash
comando
if [ $? -ne 0 ]; then
    echo "Errore nell'esecuzione del comando"
    exit 1
fi
```

2. **Operatori di controllo `&&` e `||`**:

```bash
# Esegui il secondo comando solo se il primo ha successo
comando1 && comando2

# Esegui il secondo comando solo se il primo fallisce
comando1 || comando2
```

3. **Combinazione di operatori**:

```bash
# Se comando1 ha successo, esegui comando2, altrimenti esegui comando3
comando1 && comando2 || comando3
```

## Opzioni di Bash per la Gestione degli Errori

Bash offre diverse opzioni che possono essere attivate per migliorare la gestione degli errori:

### `set -e` (errexit)

Termina lo script se un comando restituisce un codice di uscita diverso da zero:

```bash
#!/bin/bash
set -e

echo "Questo verrà eseguito"
ls /cartella/non/esistente  # Questo comando fallirà e terminerà lo script
echo "Questo non verrà mai eseguito"
```

### `set -u` (nounset)

Tratta le variabili non definite come errori:

```bash
#!/bin/bash
set -u

echo $VARIABILE_DEFINITA    # OK se la variabile esiste
echo $VARIABILE_NON_DEFINITA # Errore se la variabile non esiste
```

### `set -o pipefail`

Fa sì che una pipeline restituisca un errore se uno qualsiasi dei comandi nella pipeline fallisce:

```bash
#!/bin/bash
set -o pipefail

# Senza pipefail, questo restituirebbe 0 se grep ha successo
# Con pipefail, restituirà l'errore di ls se ls fallisce
ls /cartella/non/esistente | grep "qualcosa"
```

### Combinazione di Opzioni

È comune combinare queste opzioni per una gestione degli errori più robusta:

```bash
#!/bin/bash
set -euo pipefail

# Il vostro script qui
```

## Il Costrutto `trap`

`trap` permette di intercettare segnali e eseguire comandi quando questi segnali vengono ricevuti. È particolarmente utile per la pulizia delle risorse in caso di errore o interruzione:

```bash
#!/bin/bash

# Funzione di pulizia
cleanup() {
    echo "Esecuzione della pulizia..."
    # Rimuovi file temporanei, ripristina impostazioni, ecc.
    rm -f /tmp/mio_script_temp_*
}

# Registra la funzione di pulizia per diversi segnali
trap cleanup EXIT ERR INT TERM

# Crea un file temporaneo
touch /tmp/mio_script_temp_file

# Il resto del vostro script
```

Segnali comuni da intercettare:
- `EXIT`: Quando lo script termina (per qualsiasi motivo)
- `ERR`: Quando un comando restituisce un codice di errore
- `INT`: Quando lo script riceve un segnale di interruzione (Ctrl+C)
- `TERM`: Quando lo script riceve un segnale di terminazione

## Tecniche di Debugging

### Modalità di Debug con `set -x`

Attiva la modalità di tracciamento, che mostra ogni comando prima della sua esecuzione:

```bash
#!/bin/bash

# Attiva il debug per tutto lo script
set -x
echo "Questo comando verrà mostrato prima dell'esecuzione"

# Oppure, attiva il debug solo per una sezione
set +x  # Disattiva il debug
echo "Questo comando non verrà mostrato prima dell'esecuzione"
set -x  # Riattiva il debug
echo "Questo comando verrà mostrato di nuovo"
```

### Modalità Verbose con `set -v`

Mostra l'input dello script, inclusi i commenti:

```bash
#!/bin/bash
set -v

# Questo commento verrà mostrato nell'output
echo "Questo comando verrà mostrato prima dell'esecuzione"
```

### Controllo Sintattico con `set -n`

Verifica la sintassi dello script senza eseguirlo:

```bash
#!/bin/bash
set -n

# Lo script non verrà eseguito, ma la sintassi verrà controllata
echo "Questo non verrà eseguito"
```

## Logging e Messaggi di Errore

Un buon sistema di logging è essenziale per il debugging e la manutenzione degli script:

```bash
#!/bin/bash

# Funzioni di logging
log_info() {
    echo "[INFO] $1"
}

log_warning() {
    echo "[WARNING] $1" >&2
}

log_error() {
    echo "[ERROR] $1" >&2
}

# Utilizzo
log_info "Avvio dello script"

if [ ! -f "$file" ]; then
    log_error "File non trovato: $file"
    exit 1
fi

log_info "Script completato con successo"
```

## Strumenti Esterni di Debugging

### ShellCheck

[ShellCheck](https://www.shellcheck.net/) è uno strumento di analisi statica per script shell che identifica problemi comuni, bug e vulnerabilità di sicurezza:

```bash
# Installazione su Ubuntu/Debian
apt-get install shellcheck

# Utilizzo
shellcheck mio_script.sh
```

### Bash Debug

Per debugging più avanzato, potete utilizzare `bashdb`, un debugger interattivo per Bash:

```bash
# Installazione su Ubuntu/Debian
apt-get install bashdb

# Utilizzo
bashdb mio_script.sh
```

## Best Practices per la Gestione degli Errori

1. **Sempre controllare i codici di uscita** dei comandi critici
2. **Utilizzare `set -e`, `set -u` e `set -o pipefail`** per script più robusti
3. **Implementare `trap`** per la pulizia delle risorse
4. **Fornire messaggi di errore chiari e informativi**
5. **Registrare informazioni di debug** in file di log
6. **Validare gli input** prima di utilizzarli
7. **Utilizzare ShellCheck** per identificare problemi potenziali
8. **Testare lo script con input diversi** e in diverse condizioni

## Conclusione

La gestione degli errori e il debugging sono componenti essenziali dello scripting Bash professionale. Implementando le tecniche descritte in questa guida, potrete creare script più robusti, più facili da mantenere e più affidabili in ambienti di produzione.

## Risorse Aggiuntive

- [Bash Manual - Controlling the Job](https://www.gnu.org/software/bash/manual/html_node/Job-Control.html)
- [Advanced Bash-Scripting Guide - Error Handling](https://tldp.org/LDP/abs/html/exitcodes.html)
- [ShellCheck](https://www.shellcheck.net/) - Strumento di analisi statica per script shell