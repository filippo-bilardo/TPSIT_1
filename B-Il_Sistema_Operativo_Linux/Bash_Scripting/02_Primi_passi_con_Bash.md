# 2. Primi passi con Bash

## 2.1 La struttura di uno script Bash

Uno script Bash è essenzialmente un file di testo che contiene una serie di comandi che vengono eseguiti in sequenza. La struttura di base di uno script Bash comprende:

1. **Shebang** (prima riga che indica l'interprete)
2. **Commenti** per documentare lo script
3. **Dichiarazioni di variabili**
4. **Funzioni** (opzionali)
5. **Corpo principale** dello script con comandi e logica

Ecco un esempio di uno script Bash semplice ma completo:

```bash
#!/bin/bash

# Descrizione: Un semplice script di esempio
# Autore: Nome Cognome
# Data: YYYY-MM-DD

# Dichiarazione di variabili
NOME="Mondo"

# Funzione di saluto
saluta() {
    echo "Ciao, $1!"
}

# Corpo principale dello script
echo "Inizio dello script"
saluta "$NOME"
echo "Fine dello script"
```

## 2.2 Shebang e permessi di esecuzione

### Shebang

La prima riga di uno script Bash, chiamata "shebang" (da "sharp" # e "bang" !), indica al sistema quale interprete utilizzare per eseguire lo script.

Formato standard:
```bash
#!/bin/bash
```

Alternative comuni:
```bash
#!/usr/bin/env bash  # Più portabile, usa il comando 'env' per trovare bash nel PATH
#!/bin/sh            # Per script compatibili con la shell POSIX
```

### Permessi di esecuzione

Per eseguire uno script Bash, è necessario assegnargli i permessi di esecuzione utilizzando il comando `chmod`:

```bash
chmod +x nomescript.sh  # Aggiunge il permesso di esecuzione per tutti gli utenti
chmod 755 nomescript.sh  # Equivalente a rwxr-xr-x (lettura/scrittura/esecuzione per il proprietario, lettura/esecuzione per gli altri)
```

Esempio di verifica dei permessi:
```bash
ls -l nomescript.sh
# Output: -rwxr-xr-x 1 utente gruppo 123 gen 1 12:34 nomescript.sh
```

## 2.3 Commenti e documentazione

I commenti in Bash iniziano con il carattere `#` e continuano fino alla fine della riga. Sono ignorati dall'interprete e servono a documentare il codice.

### Commenti in linea
```bash
echo "Hello World"  # Questo è un commento in linea
```

### Blocchi di commenti
```bash
# ===================================
# Questa è una sezione importante
# che richiede una spiegazione dettagliata
# ===================================
```

### Documentazione dello script

È buona pratica includere all'inizio dello script un blocco di commenti che ne descriva lo scopo, l'autore, la data di creazione e le istruzioni per l'uso:

```bash
#!/bin/bash

# ===================================
# Nome: backup_script.sh
# Descrizione: Esegue il backup dei file di configurazione
# Autore: Nome Cognome
# Data: YYYY-MM-DD
# Versione: 1.0
# Utilizzo: ./backup_script.sh [directory_sorgente] [directory_destinazione]
# ===================================
```

## 2.4 Esecuzione di comandi e script

Esistono diversi modi per eseguire uno script Bash:

### Esecuzione diretta (richiede permessi di esecuzione)
```bash
./nomescript.sh  # Esegue lo script nella directory corrente
/percorso/completo/nomescript.sh  # Esegue lo script specificando il percorso completo
```

### Esecuzione tramite interprete
```bash
bash nomescript.sh  # Esegue lo script usando bash (non richiede permessi di esecuzione)
sh nomescript.sh    # Esegue lo script usando sh (potrebbe comportarsi diversamente)
```

### Esecuzione con source o punto
```bash
source nomescript.sh  # Esegue lo script nell'ambiente della shell corrente
. nomescript.sh       # Equivalente a 'source' (sintassi abbreviata)
```

### Differenze tra i metodi di esecuzione

- **Esecuzione diretta** e **tramite interprete**: lo script viene eseguito in una nuova istanza della shell (subshell)
- **Esecuzione con source**: lo script viene eseguito nella shell corrente, quindi può modificare l'ambiente (variabili, directory di lavoro, ecc.)

## 2.5 Debugging di base

Bash offre diverse opzioni per il debugging degli script:

### Esecuzione in modalità verbose
```bash
bash -v nomescript.sh  # Mostra ogni riga prima dell'esecuzione
```

### Esecuzione in modalità debug
```bash
bash -x nomescript.sh  # Mostra ogni comando dopo l'espansione e prima dell'esecuzione
```

### Combinazione di opzioni
```bash
bash -xv nomescript.sh  # Combina le modalità verbose e debug
```

### Debugging selettivo

È possibile attivare e disattivare il debugging all'interno dello script:

```bash
#!/bin/bash

echo "Questa parte non è in debug"

set -x  # Attiva il debugging
echo "Questa parte è in debug"
ls -la
set +x  # Disattiva il debugging

echo "Questa parte non è più in debug"
```

### Controllo degli errori

È possibile configurare lo script per terminare in caso di errori:

```bash
set -e  # Lo script termina se un comando restituisce un codice di uscita diverso da zero
set -u  # Lo script termina se viene utilizzata una variabile non definita
set -o pipefail  # Lo script considera fallita una pipeline se uno qualsiasi dei comandi fallisce
```

Un'opzione comune è combinare questi controlli all'inizio dello script:

```bash
#!/bin/bash
set -euo pipefail
```

## Best Practices

1. **Utilizzare sempre lo shebang** all'inizio dello script per garantire l'uso dell'interprete corretto
2. **Documentare adeguatamente** lo script con commenti, specialmente per le parti complesse
3. **Utilizzare nomi significativi** per script, variabili e funzioni
4. **Controllare i permessi** prima di distribuire uno script
5. **Includere messaggi di aiuto** per script con parametri da riga di comando
6. **Gestire gli errori** in modo appropriato
7. **Testare lo script** in un ambiente sicuro prima dell'uso in produzione

## Tips and Tricks

1. **Verificare la sintassi senza eseguire lo script**:
   ```bash
   bash -n nomescript.sh
   ```

2. **Creare un template per nuovi script**:
   ```bash
   cat > ~/.bash_script_template << 'EOF'
   #!/bin/bash
   set -euo pipefail
   
   # Descrizione: 
   # Autore: 
   # Data: 
   
   # Corpo principale
   
   EOF
   ```

3. **Utilizzare shellcheck per analizzare gli script**:
   ```bash
   shellcheck nomescript.sh  # Richiede l'installazione di shellcheck
   ```

4. **Rendere lo script portabile**:
   ```bash
   #!/usr/bin/env bash
   ```

5. **Aggiungere un'opzione di aiuto**:
   ```bash
   if [[ "$1" == "-h" || "$1" == "--help" ]]; then
     echo "Utilizzo: $0 [opzioni]"
     exit 0
   fi
   ```

## Domande di Autovalutazione

1. **Cosa indica la linea #!/bin/bash all'inizio di uno script?**
   - A) Un commento speciale
   - B) L'interprete da utilizzare per eseguire lo script
   - C) Una direttiva di compilazione
   - D) Un'istruzione di importazione

2. **Quale comando si utilizza per rendere eseguibile uno script Bash?**
   - A) execute +x script.sh
   - B) chmod +x script.sh
   - C) permission +x script.sh
   - D) run +x script.sh

3. **Quale opzione di bash attiva la modalità di debug che mostra i comandi durante l'esecuzione?**
   - A) bash -d script.sh
   - B) bash -v script.sh
   - C) bash -x script.sh
   - D) bash -debug script.sh

4. **Qual è la differenza principale tra eseguire uno script con ./script.sh e con source script.sh?**
   - A) Non c'è differenza
   - B) source esegue lo script più velocemente
   - C) ./script.sh esegue in una subshell, source esegue nella shell corrente
   - D) source funziona solo per script di sistema

5. **Cosa fa l'istruzione set -e in uno script Bash?**
   - A) Esporta tutte le variabili
   - B) Termina lo script se un comando restituisce un errore
   - C) Abilita l'espansione delle variabili
   - D) Attiva la modalità di debug

## Esercizi Proposti

1. **Script base**: Crea uno script Bash che mostri un messaggio di benvenuto, la data corrente e l'elenco dei file nella directory corrente.

2. **Debug pratico**: Scrivi uno script con alcuni errori intenzionali, poi utilizzalo per praticare le tecniche di debugging viste in questo capitolo.

3. **Documentazione**: Crea un template personalizzato per i tuoi script Bash che includa una documentazione completa e controlli di errore.

4. **Esecuzione condizionale**: Scrivi uno script che si comporti in modo diverso a seconda di come viene eseguito (direttamente, tramite bash o tramite source).

5. **Permessi e sicurezza**: Crea uno script che verifichi e imposti i permessi corretti per un insieme di file in una directory specificata.

## Risposte alle Domande di Autovalutazione

1. **B) L'interprete da utilizzare per eseguire lo script** - La linea shebang indica al sistema quale programma utilizzare per interpretare il resto del file.

2. **B) chmod +x script.sh** - Il comando chmod con l'opzione +x aggiunge il permesso di esecuzione al file.

3. **C) bash -x script.sh** - L'opzione -x attiva la modalità di debug che mostra ogni comando dopo l'espansione e prima dell'esecuzione.

4. **C) ./script.sh esegue in una subshell, source esegue nella shell corrente** - Quando si esegue uno script con ./script.sh, viene creata una nuova istanza della shell. Con source, lo script viene eseguito nella shell corrente, quindi può modificare l'ambiente.

5. **B) Termina lo script se un comando restituisce un errore** - L'opzione set -e fa sì che lo script termini immediatamente se un comando restituisce un codice di uscita diverso da zero.