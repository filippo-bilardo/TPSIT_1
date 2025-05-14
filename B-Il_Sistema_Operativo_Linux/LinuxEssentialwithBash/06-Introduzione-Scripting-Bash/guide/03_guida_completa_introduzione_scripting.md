# Guida Completa: Introduzione allo Scripting Bash

## Cos'è lo Scripting Bash?

Lo scripting Bash è una potente tecnica per automatizzare compiti ripetitivi, eseguire sequenze di comandi e creare soluzioni personalizzate in ambiente Linux. Uno script Bash è essenzialmente un file di testo contenente una serie di comandi che vengono eseguiti sequenzialmente come se fossero stati digitati nel terminale.

### Vantaggi dello Scripting Bash

- **Automazione**: automatizzare attività ripetitive risparmiando tempo
- **Riproducibilità**: garantire che le stesse azioni vengano eseguite allo stesso modo ogni volta
- **Documentazione**: codificare le procedure operative in formato leggibile e modificabile
- **Flessibilità**: combinare i comandi Unix in modi potenti e personalizzati
- **Accessibilità**: la sintassi è relativamente semplice da apprendere, specialmente per chi ha già familiarità con i comandi Linux

## Creazione del Primo Script Bash

### 1. Creazione del File

Per creare uno script Bash, è sufficiente creare un nuovo file di testo. Convenzionalmente, gli script Bash hanno estensione `.sh`, anche se non è strettamente necessario.

```bash
touch mio_primo_script.sh
```

### 2. L'Importanza della Shebang

La prima riga di ogni script Bash dovrebbe iniziare con la cosiddetta "shebang", che indica al sistema quale interprete utilizzare per eseguire lo script:

```bash
#!/bin/bash
```

La shebang `#!` seguita dal percorso dell'interprete `/bin/bash` dice al sistema di usare Bash per interpretare lo script. Esistono diverse varianti:

- `#!/bin/sh` - Usa la shell POSIX standard (più limitata ma più portable)
- `#!/bin/bash` - Usa specificamente Bash (raccomandata per script Bash)
- `#!/usr/bin/env bash` - Più portable, usa il programma `env` per trovare Bash nel PATH

### 3. Aggiungere Comandi

Dopo la shebang, puoi aggiungere i comandi che vuoi eseguire:

```bash
#!/bin/bash

# Questo è il mio primo script
echo "Ciao, mondo!"
echo "Data e ora attuali: $(date)"
echo "Utente: $USER"
echo "Directory corrente: $(pwd)"
```

### 4. Commenti

I commenti in Bash iniziano con il carattere `#`. Tutto ciò che segue il `#` su quella riga viene ignorato dall'interprete:

```bash
# Questo è un commento e non verrà eseguito
echo "Questo verrà eseguito" # Anche questo è un commento
```

È buona pratica commentare il codice per:
- Spiegare lo scopo dello script
- Descrivere sezioni complesse di codice
- Documentare l'utilizzo previsto
- Fornire informazioni sull'autore e sulla versione

### 5. Rendere lo Script Eseguibile

Prima di poter eseguire uno script, è necessario renderlo eseguibile con il comando `chmod`:

```bash
chmod +x mio_primo_script.sh
```

Questo aggiunge il permesso di esecuzione al file.

## Esecuzione di Script Bash

Esistono diversi modi per eseguire uno script Bash:

### 1. Esecuzione Diretta (richiede permessi di esecuzione)

```bash
./mio_primo_script.sh
```

Il `./` indica di cercare lo script nella directory corrente.

### 2. Esecuzione Specificando l'Interprete

```bash
bash mio_primo_script.sh
```

In questo caso, non è necessario che lo script abbia i permessi di esecuzione o la shebang.

### 3. Esecuzione con Source o Dot Command

```bash
source mio_primo_script.sh
# oppure
. mio_primo_script.sh
```

Questo metodo esegue lo script nella shell corrente anziché in una nuova shell. Le variabili definite nello script rimarranno disponibili dopo l'esecuzione.

## Variabili in Bash

Le variabili sono un concetto fondamentale nella programmazione e permettono di memorizzare dati per un utilizzo successivo.

### 1. Dichiarazione e Assegnazione

In Bash, le variabili si dichiarano senza specificare un tipo e si assegnano con l'operatore `=`:

```bash
nome="Mario"
eta=30
data_oggi=$(date +%Y-%m-%d)
```

**Note importanti**:
- Non ci devono essere spazi intorno al segno `=`
- Per assegnare l'output di un comando a una variabile, usa `$()` (command substitution)

### 2. Accesso al Valore di una Variabile

Per accedere al valore di una variabile, si usa il prefisso `$`:

```bash
echo "Nome: $nome"
echo "Età: $eta"
echo "Oggi è: $data_oggi"
```

È anche possibile usare la sintassi con le parentesi graffe `${nome}`, che è particolarmente utile quando è necessario distinguere chiaramente il nome della variabile:

```bash
echo "Ciao ${nome}123"  # Chiaro che la variabile è "nome"
```

### 3. Variabili d'Ambiente

Le variabili d'ambiente sono variabili globali accessibili da tutti i processi avviati nella shell. Alcune variabili d'ambiente comuni includono:

- `$HOME` - La directory home dell'utente
- `$USER` - Il nome utente corrente
- `$PATH` - Elenco di directory dove cercare i comandi
- `$PWD` - La directory di lavoro corrente
- `$SHELL` - La shell in uso

Per visualizzare tutte le variabili d'ambiente:

```bash
env
```

Per creare una variabile d'ambiente:

```bash
export NOME_VARIABILE=valore
```

### 4. Costanti

In Bash, puoi dichiarare costanti (variabili il cui valore non può essere modificato) usando la keyword `readonly`:

```bash
readonly PI=3.14159
readonly VERSION="1.0"
```

## Input e Output di Base

### 1. Output con `echo`

Il comando `echo` è il modo più comune per produrre output in uno script Bash:

```bash
echo "Questo è un output normale"
echo -n "Questo output non ha un newline alla fine"
echo -e "Questo supporta \t caratteri \n speciali"
```

Opzioni comuni di `echo`:
- `-n`: non aggiunge una nuova riga alla fine
- `-e`: interpreta i caratteri speciali come `\t` (tab), `\n` (nuova riga)

### 2. Input con `read`

Il comando `read` permette di leggere l'input fornito dall'utente:

```bash
echo "Come ti chiami?"
read nome
echo "Ciao, $nome!"
```

Opzioni utili di `read`:
- `-p "prompt"`: mostra un prompt senza bisogno di un echo separato
- `-s`: modalità silenziosa (non mostra ciò che l'utente digita, utile per password)
- `-t N`: timeout di N secondi
- `-n N`: legge solo N caratteri

Esempio avanzato:

```bash
read -p "Username: " username
read -sp "Password: " password
echo ""  # Aggiunge una nuova riga dopo la password
echo "Accesso come: $username"
```

### 3. Input da Argomenti della Linea di Comando

Gli script Bash possono anche accettare argomenti dalla linea di comando:

```bash
#!/bin/bash
echo "Il nome dello script è: $0"
echo "Il primo argomento è: $1"
echo "Il secondo argomento è: $2"
echo "Tutti gli argomenti: $@"
echo "Numero di argomenti: $#"
```

Se esegui questo script con:

```bash
./script.sh arg1 arg2 arg3
```

Otterrai:
```
Il nome dello script è: ./script.sh
Il primo argomento è: arg1
Il secondo argomento è: arg2
Tutti gli argomenti: arg1 arg2 arg3
Numero di argomenti: 3
```

## Uno Script Completo

Ecco un esempio di script completo che incorpora i concetti presentati:

```bash
#!/bin/bash
# ------------------------------
# Calcolatore semplice
# Autore: Mario Rossi
# Versione: 1.0
# Data: 2023-06-10
# ------------------------------

# Funzione per visualizzare un messaggio di benvenuto
mostra_benvenuto() {
    echo "========================================="
    echo "  Benvenuto nel Calcolatore Bash v1.0"
    echo "========================================="
    echo ""
}

# Funzione per mostrare il menu
mostra_menu() {
    echo "Scegli un'operazione:"
    echo "1) Addizione"
    echo "2) Sottrazione"
    echo "3) Moltiplicazione"
    echo "4) Divisione"
    echo "5) Esci"
}

# Variabile per tracciare lo stato del programma
continua=true

# Visualizza il benvenuto
mostra_benvenuto

# Loop principale
while $continua; do
    # Mostra il menu
    mostra_menu
    
    # Leggi la scelta dell'utente
    read -p "Inserisci la tua scelta (1-5): " scelta
    
    # Esci se l'utente sceglie 5
    if [ "$scelta" == "5" ]; then
        echo "Grazie per aver usato il calcolatore. Arrivederci!"
        continua=false
        continue
    fi
    
    # Verifica che la scelta sia valida
    if [[ "$scelta" != [1-4] ]]; then
        echo "Scelta non valida. Riprova."
        continue
    fi
    
    # Leggi i numeri
    read -p "Inserisci il primo numero: " num1
    read -p "Inserisci il secondo numero: " num2
    
    # Esegui l'operazione richiesta
    case $scelta in
        1)
            risultato=$(echo "$num1 + $num2" | bc)
            operazione="+"
            ;;
        2)
            risultato=$(echo "$num1 - $num2" | bc)
            operazione="-"
            ;;
        3)
            risultato=$(echo "$num1 * $num2" | bc)
            operazione="*"
            ;;
        4)
            # Verifica divisione per zero
            if [ "$num2" == "0" ]; then
                echo "Errore: Divisione per zero non possibile!"
                echo ""
                continue
            fi
            risultato=$(echo "scale=2; $num1 / $num2" | bc)
            operazione="/"
            ;;
    esac
    
    # Mostra il risultato
    echo ""
    echo "$num1 $operazione $num2 = $risultato"
    echo ""
    
    # Chiedi se continuare
    read -p "Vuoi fare un altro calcolo? (s/n): " risposta
    if [[ "$risposta" != [sS]* ]]; then
        echo "Grazie per aver usato il calcolatore. Arrivederci!"
        continua=false
    fi
    
    echo ""
done

# Fine dello script
exit 0
```

## Best Practices per lo Scripting Bash

1. **Usa sempre la shebang**: Inizia ogni script con `#!/bin/bash` o `#!/usr/bin/env bash`.

2. **Aggiungi commenti**: Documenta lo scopo dello script, le sezioni importanti e i passaggi complessi.

3. **Usa la modalità strict**:
   ```bash
   set -e       # Exit immediatamente se un comando esce con un valore non-zero
   set -u       # Tratta le variabili non definite come un errore
   set -o pipefail  # Esce con errore se qualsiasi comando in una pipe fallisce
   ```

4. **Usa variabili con nomi significativi**: `numero_utenti` è più chiaro di `nu`.

5. **Usa le funzioni** per organizzare il codice e migliorare la leggibilità.

6. **Gestisci gli errori**: Verifica i codici di ritorno e fornisci messaggi di errore utili.

7. **Usa indentazione e spaziatura** per rendere il codice più leggibile.

8. **Preferisci $(comando) a `comando`** per la sostituzione di comandi, in quanto è più leggibile e permette l'annidamento.

9. **Usa le parentesi graffe per le variabili** nei casi ambigui: `${variabile}` invece di `$variabile`.

10. **Prova il tuo script** con input diversi, inclusi casi limite e input potenzialmente problematici.

## Conclusione

Lo scripting Bash è uno strumento potente che consente agli utenti Linux di automatizzare compiti, creare workflows complessi ed estendere le funzionalità del sistema. Questa guida introduttiva ha coperto i concetti fondamentali per iniziare, ma Bash offre molto di più, inclusi costrutti condizionali, cicli, funzioni e molto altro che verrà approfondito nei prossimi moduli.

Ricorda che uno degli aspetti più potenti di Bash è la capacità di combinare comandi Unix esistenti in modi nuovi e creativi. Esplora sempre la documentazione (`man bash`), cerca esempi online e sperimentare è il modo migliore per imparare!

## Risorse Aggiuntive

- **Man pages**: `man bash` per la documentazione completa
- **GNU Bash Manual**: documentazione ufficiale di Bash
- **Bash Reference Manual**: https://www.gnu.org/software/bash/manual/
- **Bash Scripting Guide**: https://tldp.org/LDP/abs/html/
