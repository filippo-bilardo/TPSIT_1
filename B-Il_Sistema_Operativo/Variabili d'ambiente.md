# 4.3 Variabili di Ambiente

Le variabili di ambiente rappresentano un elemento fondamentale nell'ecosistema di Linux e di qualsiasi sistema Unix-like. Possiamo immaginarle come un meccanismo globale che il sistema operativo utilizza per memorizzare informazioni importanti accessibili a tutti i processi in esecuzione. A differenza delle variabili regolari che abbiamo visto nei capitoli precedenti, le variabili di ambiente hanno una portata che si estende oltre il singolo script, influenzando potenzialmente ogni programma in esecuzione nel sistema.

## Cosa sono le variabili di ambiente

Le variabili di ambiente costituiscono un tipo particolare di variabili che definiscono l'ambiente in cui operano i programmi. Esse contengono informazioni che possono influenzare il comportamento delle applicazioni e dei processi in esecuzione. Ogni processo avviato nel sistema eredita un insieme di variabili di ambiente dal processo genitore, creando così una catena di ereditarietà che parte dalla shell di login dell'utente.

Possiamo immaginare le variabili di ambiente come un dizionario globale condiviso tra tutti i programmi, dove ogni voce rappresenta un'informazione specifica sul contesto di esecuzione: l'utente corrente, la directory home, i percorsi di ricerca dei comandi, la lingua del sistema, e molto altro ancora.

## Variabili di ambiente comuni

Il sistema operativo definisce automaticamente numerose variabili di ambiente. Ecco alcune delle più importanti che ogni sviluppatore di script Bash dovrebbe conoscere:

### `PATH`

Probabilmente la più importante variabile di ambiente, `PATH` contiene un elenco di directory separate da due punti (`:`) in cui il sistema cerca i programmi eseguibili quando viene digitato un comando. Quando digitiamo un comando come `ls`, la shell cerca un eseguibile chiamato `ls` in ciascuna delle directory elencate in `PATH`, nell'ordine specificato.

```bash
echo $PATH
# Output esempio: /usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin
```

Comprendere il funzionamento di `PATH` è cruciale quando creiamo i nostri script, poiché ci permette di renderli accessibili da qualsiasi directory senza dover specificare il percorso completo.

### `HOME`

Questa variabile contiene il percorso della directory home dell'utente corrente. È ampiamente utilizzata negli script per accedere a file personali dell'utente o per costruire percorsi relativi alla home.

```bash
echo $HOME
# Output esempio: /home/mario
```

### `USER` o `LOGNAME`

Contiene il nome dell'utente attualmente loggato nel sistema.

```bash
echo $USER
# Output esempio: mario
```

### `SHELL`

Indica il percorso dell'interprete di shell predefinito dell'utente.

```bash
echo $SHELL
# Output esempio: /bin/bash
```

### `PWD`

Contiene il percorso della directory di lavoro corrente (Present Working Directory).

```bash
echo $PWD
# Output esempio: /home/mario/documenti
```

### `LANG` e `LC_*`

Queste variabili controllano le impostazioni di localizzazione, influenzando il comportamento dei programmi rispetto a lingua, formato di data e ora, valuta, ecc.

```bash
echo $LANG
# Output esempio: it_IT.UTF-8
```

### `TERM`

Specifica il tipo di terminale in uso, influenzando il modo in cui i programmi visualizzano l'output.

```bash
echo $TERM
# Output esempio: xterm-256color
```

### `PS1`

Definisce la stringa del prompt primario della shell. Modificando questa variabile è possibile personalizzare l'aspetto del prompt.

```bash
echo $PS1
# Output esempio: \u@\h:\w\$
```

### `RANDOM`

Genera un numero casuale tra 0 e 32767 ogni volta che viene espanso.

```bash
echo $RANDOM
# Output esempio: 15437
```

## Visualizzazione delle variabili di ambiente

Per visualizzare tutte le variabili di ambiente definite nella shell corrente, possiamo utilizzare i comandi `env`, `printenv` o `set`:

```bash
# Visualizza tutte le variabili di ambiente
env

# Visualizza una specifica variabile di ambiente
printenv HOME

# Visualizza tutte le variabili, incluse quelle di shell
set
```

Il comando `set` senza argomenti mostra tutte le variabili, incluse quelle locali alla shell e le funzioni definite. Per visualizzare solo le variabili di ambiente, è preferibile utilizzare `env` o `printenv`.

## Accesso alle variabili di ambiente

Come per le variabili normali, si accede al valore di una variabile di ambiente utilizzando il simbolo del dollaro (`$`) seguito dal nome della variabile:

```bash
#!/bin/bash

echo "La tua home directory è: $HOME"
echo "Il tuo username è: $USER"
echo "La tua shell è: $SHELL"
```

## Creazione e modifica di variabili di ambiente

Esistono due operazioni principali che possiamo effettuare con le variabili di ambiente:

1. **Assegnazione**: definisce il valore di una variabile nella shell corrente
2. **Esportazione**: rende la variabile disponibile ai processi figli (tramite il comando `export`)

### Assegnazione di variabili di ambiente

Per assegnare un valore a una variabile di ambiente, utilizziamo la stessa sintassi delle variabili normali:

```bash
EDITOR=vim
```

Questa operazione definisce la variabile solo nella shell corrente e non la rende disponibile ai processi figli.

### Esportazione di variabili di ambiente

Per rendere una variabile disponibile ai processi figli, dobbiamo "esportarla" utilizzando il comando `export`:

```bash
export EDITOR=vim
```

Oppure possiamo prima assegnare il valore e poi esportare la variabile:

```bash
EDITOR=vim
export EDITOR
```

Questa distinzione è fondamentale: senza l'esportazione, la variabile esiste solo nella shell corrente e non viene ereditata dai processi figli, inclusi gli script che lanciamo.

### Rimozione di variabili di ambiente

Per rimuovere una variabile di ambiente, utilizziamo il comando `unset`:

```bash
unset EDITOR
```

## Persistenza delle variabili di ambiente

Le variabili di ambiente definite nella shell corrente esistono solo per la durata della sessione. Una volta chiusa la shell, queste variabili vengono perse. Per renderle persistenti tra diverse sessioni, dobbiamo definirle nei file di configurazione della shell.

### File di configurazione per Bash

Bash utilizza diversi file di configurazione che vengono eseguiti in momenti diversi:

1. **File a livello di sistema**:
   - `/etc/profile`: eseguito all'avvio di una shell di login
   - `/etc/bash.bashrc`: eseguito all'avvio di una shell interattiva non di login

2. **File a livello di utente**:
   - `~/.bash_profile`, `~/.bash_login`, o `~/.profile`: eseguiti all'avvio di una shell di login
   - `~/.bashrc`: eseguito all'avvio di una shell interattiva non di login
   - `~/.bash_logout`: eseguito quando si chiude una shell di login

Per definire variabili di ambiente persistenti, è comune utilizzare i file `~/.bashrc` o `~/.profile`:

```bash
# Aggiungere al file ~/.bashrc
export EDITOR=vim
export VISUAL=vim
export PAGER=less
```

Dopo aver modificato questi file, possiamo applicare le modifiche nella shell corrente con il comando `source`:

```bash
source ~/.bashrc
# Oppure con la sintassi abbreviata
. ~/.bashrc
```

## Utilizzo delle variabili di ambiente negli script

Le variabili di ambiente possono essere utilizzate negli script Bash come qualsiasi altra variabile. Tuttavia, è importante notare che gli script ereditano solo le variabili di ambiente che sono state esportate nella shell da cui vengono lanciati.

### Esempio: utilizzo di variabili di ambiente per la configurazione

```bash
#!/bin/bash

# Utilizzo di una variabile di ambiente con fallback
editor=${EDITOR:-vi}

echo "Il tuo editor preferito è: $editor"

# Utilizzo di PATH per verificare se un comando esiste
if command -v git &>/dev/null; then
    echo "Git è installato nel sistema"
else
    echo "Git non è installato"
fi

# Utilizzo di HOME per costruire percorsi
config_file="$HOME/.myapp/config"
if [ -f "$config_file" ]; then
    echo "File di configurazione trovato in: $config_file"
else
    echo "File di configurazione non trovato"
fi
```

### Esempio: definizione di variabili di ambiente all'interno di uno script

Quando definiamo variabili di ambiente all'interno di uno script, queste saranno disponibili solo ai processi avviati dallo script stesso, non alla shell che ha lanciato lo script:

```bash
#!/bin/bash

# Questa variabile sarà visibile solo all'interno dello script
# e ai processi avviati da esso
export MY_CONFIG="/path/to/config"

# Avviamo un processo figlio che avrà accesso a MY_CONFIG
bash -c 'echo "Il valore di MY_CONFIG è: $MY_CONFIG"'
```

Se volessimo che le variabili definite in uno script fossero disponibili anche nella shell che lo ha lanciato, dovremmo eseguire lo script con il comando `source` o con la sua abbreviazione `.`:

```bash
# Lo script imposterà le variabili nella shell corrente
source ./mio_script.sh
# Oppure
. ./mio_script.sh
```

## Variabili di ambiente temporanee

In alcuni casi, potremmo voler definire una variabile di ambiente solo per l'esecuzione di un singolo comando. Possiamo farlo prefissando l'assegnazione della variabile al comando:

```bash
# Esegue il comando 'ls' con la variabile LANG impostata a C
LANG=C ls -l

# Il valore precedente di LANG (se esistente) viene ripristinato
echo $LANG  # Mostrerà il valore originale, non "C"
```

Questa tecnica è particolarmente utile quando vogliamo modificare temporaneamente il comportamento di un programma senza influenzare l'ambiente globale.

## Variabili di ambiente speciali in Bash

Oltre alle variabili di ambiente standard, Bash definisce alcune variabili speciali che possono essere utili nei nostri script:

### `BASH_VERSION`

Contiene la versione di Bash in uso.

```bash
echo $BASH_VERSION
# Output esempio: 5.1.16(1)-release
```

### `HOSTNAME`

Contiene il nome dell'host corrente.

```bash
echo $HOSTNAME
# Output esempio: workstation-mario
```

### `SECONDS`

Contiene il numero di secondi trascorsi dall'avvio della shell.

```bash
echo $SECONDS
# Output esempio: 3467
```

### `FUNCNAME`, `BASH_SOURCE`, `BASH_LINENO`

Queste variabili contengono informazioni sul contesto di esecuzione corrente, utili per il debugging.

```bash
function mia_funzione() {
    echo "Nome funzione: ${FUNCNAME[0]}"
    echo "File sorgente: ${BASH_SOURCE[0]}"
    echo "Numero di linea: ${BASH_LINENO[0]}"
}
```

### `HISTFILE`, `HISTSIZE`, `HISTCONTROL`

Controllano il comportamento della history dei comandi.

```bash
echo $HISTFILE   # File dove è salvata la history
echo $HISTSIZE   # Numero di comandi salvati nella history
```

## Esempi pratici di utilizzo delle variabili di ambiente

Vediamo alcuni esempi concreti di come le variabili di ambiente possono essere utilizzate per risolvere problemi comuni negli script Bash.

### Esempio 1: Configurazione flessibile di uno script

```bash
#!/bin/bash

# Utilizzo di variabili di ambiente per la configurazione
# con valori predefiniti se non specificate
DB_HOST=${DB_HOST:-localhost}
DB_PORT=${DB_PORT:-3306}
DB_USER=${DB_USER:-root}
DB_PASS=${DB_PASS:-password}
DB_NAME=${DB_NAME:-mydatabase}

echo "Connessione a MySQL su $DB_HOST:$DB_PORT"
echo "Utente: $DB_USER, Database: $DB_NAME"

# Utilizzo di mysql con le variabili di configurazione
mysql -h "$DB_HOST" -P "$DB_PORT" -u "$DB_USER" -p"$DB_PASS" "$DB_NAME" <<EOF
SELECT * FROM users LIMIT 10;
EOF
```

Questo script può essere configurato semplicemente impostando le variabili di ambiente prima della sua esecuzione:

```bash
DB_HOST=production-db DB_USER=app_user DB_PASS=secure_pass ./database_query.sh
```

### Esempio 2: Adattamento al contesto di esecuzione

```bash
#!/bin/bash

# Determina l'ambiente di esecuzione dalle variabili di ambiente
ENVIRONMENT=${ENVIRONMENT:-development}

case "$ENVIRONMENT" in
    production)
        CONFIG_FILE="/etc/myapp/production.conf"
        LOG_LEVEL="ERROR"
        ;;
    staging)
        CONFIG_FILE="/etc/myapp/staging.conf"
        LOG_LEVEL="WARNING"
        ;;
    development)
        CONFIG_FILE="$HOME/.myapp/development.conf"
        LOG_LEVEL="DEBUG"
        ;;
    *)
        echo "Ambiente sconosciuto: $ENVIRONMENT"
        exit 1
        ;;
esac

echo "Avvio dell'applicazione in modalità $ENVIRONMENT"
echo "Utilizzo del file di configurazione: $CONFIG_FILE"
echo "Livello di log impostato a: $LOG_LEVEL"

# Qui andrebbe il codice per avviare l'applicazione
```

Questo script permette di adattare il comportamento dell'applicazione in base all'ambiente di esecuzione, semplicemente impostando la variabile `ENVIRONMENT`.

### Esempio 3: Internazionalizzazione

```bash
#!/bin/bash

# Funzione per i messaggi localizzati
function get_message() {
    local msg_id=$1
    local lang=${LANG:-en_US.UTF-8}
    
    case "${lang%%.*}" in
        it_*)
            case "$msg_id" in
                welcome) echo "Benvenuto nel sistema" ;;
                goodbye) echo "Arrivederci" ;;
                error) echo "Si è verificato un errore" ;;
                *) echo "Messaggio sconosciuto" ;;
            esac
            ;;
        fr_*)
            case "$msg_id" in
                welcome) echo "Bienvenue dans le système" ;;
                goodbye) echo "Au revoir" ;;
                error) echo "Une erreur s'est produite" ;;
                *) echo "Message inconnu" ;;
            esac
            ;;
        *)  # Default: inglese
            case "$msg_id" in
                welcome) echo "Welcome to the system" ;;
                goodbye) echo "Goodbye" ;;
                error) echo "An error occurred" ;;
                *) echo "Unknown message" ;;
            esac
            ;;
    esac
}

# Utilizzo della funzione localizzata
echo "$(get_message welcome)"
# Esegui alcune operazioni
echo "$(get_message goodbye)"
```

Questo script utilizza la variabile di ambiente `LANG` per determinare la lingua dell'utente e fornire messaggi localizzati.

## Best Practices per l'utilizzo delle variabili di ambiente

Quando lavoriamo con le variabili di ambiente nei nostri script, è importante seguire alcune best practices:

1. **Utilizzo di maiuscole per i nomi**: Per convenzione, i nomi delle variabili di ambiente sono in maiuscolo (`DB_HOST` invece di `db_host`).

2. **Fornire valori predefiniti**: Utilizzare la sintassi `${VAR:-default}` per assegnare valori predefiniti alle variabili di ambiente che potrebbero non essere definite.

3. **Validare i valori**: Verificare sempre che le variabili di ambiente contengano valori validi prima di utilizzarle.

   ```bash
   if [[ -z "$IMPORTANT_VAR" ]]; then
       echo "Error: IMPORTANT_VAR is not set"
       exit 1
   fi
   ```

4. **Documentazione**: Documentare chiaramente quali variabili di ambiente lo script utilizza e quali sono i loro possibili valori.

5. **Evitare di esportare troppe variabili**: Esportare solo le variabili che effettivamente devono essere accessibili ai processi figli.

6. **Sicurezza**: Non memorizzare informazioni sensibili (come password) in variabili di ambiente se possibile. Se è necessario, assicurarsi che non vengano registrate nella history o in log.

7. **Utilizzo di file di configurazione**: Per configurazioni complesse, considerare l'uso di file di configurazione invece di numerose variabili di ambiente.

## Gestione di variabili di ambiente in file di configurazione

Per gli script più complessi, può essere utile caricare le variabili di ambiente da un file di configurazione. Ecco un esempio di come implementare questa funzionalità:

```bash
#!/bin/bash

# Carica le variabili di ambiente dal file .env se presente
if [ -f .env ]; then
    echo "Caricamento configurazione da file .env"
    # Carica ogni linea che non è un commento e che contiene un '='
    while IFS='=' read -r key value; do
        # Ignora linee vuote o commenti
        if [[ ! $key =~ ^[[:space:]]*$ && ! $key =~ ^[[:space:]]*# ]]; then
            # Rimuovi eventuali spazi attorno al nome della variabile
            key=$(echo "$key" | xargs)
            # Esporta la variabile
            export "$key=$value"
            echo "  $key = $value"
        fi
    done < .env
fi

# Ora possiamo utilizzare le variabili caricate
echo "Database host: $DB_HOST"
echo "API key: $API_KEY"
```

Il file `.env` potrebbe avere un formato simile a questo:

```
# Configurazione del database
DB_HOST=localhost
DB_PORT=5432
DB_USER=app
DB_PASS=secret

# Configurazione API
API_KEY=1234567890abcdef
API_TIMEOUT=30
```

## Problemi comuni e soluzioni

### Variabili non disponibili in script lanciati da cron

I job cron vengono eseguiti in un ambiente con un set limitato di variabili di ambiente. Per risolvere questo problema, possiamo:

1. Definire esplicitamente le variabili all'interno dello script
2. Caricare il file di configurazione della shell all'inizio dello script
3. Impostare le variabili direttamente nel file crontab

```bash
# Nel file crontab
SHELL=/bin/bash
PATH=/usr/local/bin:/usr/bin:/bin
LANG=it_IT.UTF-8

# Esecuzione del job
0 * * * * /path/to/script.sh
```

### Variabili contenenti spazi o caratteri speciali

Quando una variabile di ambiente contiene spazi o caratteri speciali, è essenziale racchiuderla tra virgolette doppie quando la si utilizza:

```bash
FILE_PATH="/path/with spaces/to/file.txt"

# Corretto
if [ -f "$FILE_PATH" ]; then
    echo "File trovato"
fi

# Errato - causerà errori se il percorso contiene spazi
if [ -f $FILE_PATH ]; then
    echo "File trovato"
fi
```

## Esercizi proposti

1. Scrivi uno script che visualizzi tutte le variabili di ambiente il cui nome inizia con "BASH".

2. Crea uno script che modifichi temporaneamente il `PATH` per includere una directory specificata dall'utente, esegua un comando in quella directory, e poi ripristini il `PATH` originale.

3. Implementa un sistema di configurazione per uno script che legga variabili di ambiente da un file `.conf` se presente nella home dell'utente, altrimenti utilizzi valori predefiniti.

4. Scrivi uno script che determini la configurazione regionale del sistema (lingua, formato di data, ecc.) utilizzando le variabili di ambiente appropriate e visualizzi un messaggio localizzato.

5. Crea una semplice libreria di funzioni per gestire variabili di ambiente in modo sicuro, includendo funzioni per la validazione, l'impostazione di valori predefiniti e la gestione di valori sensibili.

---

Le variabili di ambiente costituiscono uno strumento potente per influenzare il comportamento degli script e dei programmi. Comprendere come utilizzarle efficacemente permette di creare script più flessibili, configurabili e adattabili a diversi contesti di esecuzione. Nel prossimo capitolo, esploreremo le costanti e le variabili di sola lettura, che ci permetteranno di definire valori che non devono essere modificati durante l'esecuzione dei nostri script.