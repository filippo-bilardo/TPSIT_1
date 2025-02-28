# Test Bash con Doppie Quadre

## Introduzione ai Test con Doppie Quadre

In Bash, le doppie parentesi quadre `[[ ... ]]` rappresentano una forma avanzata di test condizionale che offre numerosi vantaggi rispetto alla sintassi tradizionale a parentesi singole `[ ... ]`. Le doppie parentesi quadre sono state introdotte nelle versioni più recenti di Bash come estensione specifica, fornendo funzionalità aggiuntive e una maggiore flessibilità nei test condizionali.

## Vantaggi dei Test con Doppie Quadre

Le doppie parentesi quadre offrono diversi vantaggi significativi:

1. **Nessuna necessità di escape per caratteri speciali**: Con `[[ ... ]]` non è necessario fare l'escape di caratteri speciali come spazi o parentesi nei nomi dei file.

2. **Supporto per operatori avanzati**: Includono il supporto per l'operatore di pattern matching `=~` e gli operatori logici `&&` e `||`.

3. **Prevenzione di errori comuni**: Riducono la necessità di proteggere le variabili con le virgolette, prevenendo errori dovuti all'espansione delle variabili.

4. **Supporto per il pattern matching**: Consentono il matching di espressioni con glob patterns e regex.

## Sintassi di Base

```bash
if [[ condizione ]]; then
    # comandi da eseguire se la condizione è vera
fi
```

## Operatori di Confronto per Stringhe

```bash
[[ $stringa1 == $stringa2 ]]    # Verifica uguaglianza
[[ $stringa1 != $stringa2 ]]    # Verifica disuguaglianza
[[ $stringa1 < $stringa2 ]]     # Confronto lessicografico (minore di)
[[ $stringa1 > $stringa2 ]]     # Confronto lessicografico (maggiore di)
[[ -z $stringa ]]               # Verifica se la stringa è vuota
[[ -n $stringa ]]               # Verifica se la stringa non è vuota
```

### Esempio: Controllo del Nome Utente

```bash
#!/bin/bash

username="admin"

if [[ $username == "admin" ]]; then
    echo "Benvenuto amministratore!"
elif [[ $username == "guest" ]]; then
    echo "Accesso limitato per ospiti"
else
    echo "Utente: $username"
fi
```

## Operatori per Test sui File

```bash
[[ -e $file ]]    # Verifica se il file esiste
[[ -f $file ]]    # Verifica se è un file regolare
[[ -d $file ]]    # Verifica se è una directory
[[ -r $file ]]    # Verifica se il file è leggibile
[[ -w $file ]]    # Verifica se il file è scrivibile
[[ -x $file ]]    # Verifica se il file è eseguibile
[[ -s $file ]]    # Verifica se il file non è vuoto
[[ $file1 -nt $file2 ]]    # Verifica se file1 è più recente di file2
[[ $file1 -ot $file2 ]]    # Verifica se file1 è più vecchio di file2
```

### Esempio: Controllo di Sicurezza dei File

```bash
#!/bin/bash

config_file="/etc/app/config.ini"

if [[ -f $config_file ]]; then
    if [[ -r $config_file ]]; then
        echo "File di configurazione trovato e leggibile"
        
        if [[ -w $config_file ]]; then
            echo "AVVISO: Il file di configurazione è scrivibile!"
        else
            echo "Il file di configurazione è protetto in scrittura (corretto)"
        fi
    else
        echo "ERRORE: File di configurazione non leggibile!"
    fi
else
    echo "ERRORE: File di configurazione non trovato!"
fi
```

## Operatori Logici

```bash
[[ condizione1 && condizione2 ]]    # AND logico (entrambe vere)
[[ condizione1 || condizione2 ]]    # OR logico (almeno una vera)
[[ ! condizione ]]                  # NOT logico (negazione)
```

### Esempio: Verifica dei Requisiti di Sistema

```bash
#!/bin/bash

min_space=1000000  # 1GB in KB
free_space=$(df -k /home | tail -1 | awk '{print $4}')
min_ram=2000000    # 2GB in KB
free_ram=$(free -k | grep "Mem:" | awk '{print $7}')

if [[ $free_space -ge $min_space && $free_ram -ge $min_ram ]]; then
    echo "Sistema pronto per l'installazione"
else
    echo "Requisiti di sistema non soddisfatti:"
    
    if [[ $free_space -lt $min_space ]]; then
        echo "- Spazio disco insufficiente"
    fi
    
    if [[ $free_ram -lt $min_ram ]]; then
        echo "- Memoria RAM insufficiente"
    fi
fi
```

## Pattern Matching con Glob

Le doppie parentesi quadre supportano naturalmente i pattern glob senza necessità di operatori aggiuntivi:

```bash
[[ $filename == *.txt ]]       # Verifica se il filename termina con .txt
[[ $username == admin* ]]      # Verifica se username inizia con "admin"
[[ $input == [0-9]* ]]         # Verifica se input inizia con un numero
```

### Esempio: Categorizzazione dei File

```bash
#!/bin/bash

for file in *; do
    if [[ -f $file ]]; then
        if [[ $file == *.txt ]]; then
            echo "$file è un documento di testo"
        elif [[ $file == *.jpg || $file == *.png || $file == *.gif ]]; then
            echo "$file è un'immagine"
        elif [[ $file == *.sh ]]; then
            echo "$file è uno script bash"
            if [[ -x $file ]]; then
                echo "  - È eseguibile"
            else
                echo "  - Non è eseguibile"
            fi
        fi
    fi
done
```

## Espressioni Regolari con l'Operatore =~

Una delle caratteristiche più potenti delle doppie parentesi quadre è il supporto alle espressioni regolari con l'operatore `=~`:

```bash
[[ $stringa =~ pattern ]]    # Verifica se la stringa corrisponde al pattern regex
```

### Esempio: Validazione dell'Input

```bash
#!/bin/bash

# Validazione di un indirizzo email
read -p "Inserisci il tuo indirizzo email: " email

if [[ $email =~ ^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$ ]]; then
    echo "Email valida: $email"
else
    echo "Formato email non valido"
fi

# Validazione di una password
read -p "Inserisci la tua password: " password

if [[ $password =~ ^.{8,}$ && $password =~ [0-9] && $password =~ [A-Z] ]]; then
    echo "Password accettata"
else
    echo "La password deve contenere almeno 8 caratteri, un numero e una lettera maiuscola"
fi
```

### Utilizzo della Variabile BASH_REMATCH

Quando si usa l'operatore `=~`, Bash popola l'array `BASH_REMATCH` con le corrispondenze trovate:

```bash
#!/bin/bash

# Estrazione di informazioni da una stringa
log_entry="2023-11-15 14:32:45 [ERROR] Process 12345 failed: Out of memory"

if [[ $log_entry =~ ([0-9]{4}-[0-9]{2}-[0-9]{2})\ ([0-9]{2}:[0-9]{2}:[0-9]{2})\ \[([A-Z]+)\]\ Process\ ([0-9]+)\ (.+) ]]; then
    echo "Data: ${BASH_REMATCH[1]}"
    echo "Ora: ${BASH_REMATCH[2]}"
    echo "Livello: ${BASH_REMATCH[3]}"
    echo "PID: ${BASH_REMATCH[4]}"
    echo "Messaggio: ${BASH_REMATCH[5]}"
else
    echo "Formato log non riconosciuto"
fi
```

## Confronto con i Test a Parentesi Singole [ ]

Per evidenziare i vantaggi delle doppie parentesi quadre, ecco un confronto diretto:

### Con Parentesi Singole:

```bash
# Richiede virgolette per evitare errori con variabili vuote
if [ -z "$var" ]; then
    echo "Variabile vuota"
fi

# Necessita dell'escape dei caratteri speciali
if [ "$filename" = "report 2023.txt" ]; then
    echo "File trovato"
fi

# Usa -a e -o per AND e OR
if [ "$a" = "foo" -a "$b" = "bar" ]; then
    echo "Condizioni soddisfatte"
fi
```

### Con Doppie Parentesi:

```bash
# Non richiede virgolette (anche se rimane una buona pratica)
if [[ -z $var ]]; then
    echo "Variabile vuota"
fi

# Gestisce automaticamente gli spazi nei nomi
if [[ $filename == "report 2023.txt" ]]; then
    echo "File trovato"
fi

# Usa && e || come in altri linguaggi
if [[ $a == "foo" && $b == "bar" ]]; then
    echo "Condizioni soddisfatte"
fi
```

## Compatibilità e Portabilità

È importante notare che le doppie parentesi quadre sono specifiche di Bash e non sono parte dello standard POSIX. Se la portabilità tra diverse shell è una preoccupazione, è consigliabile attenersi ai test con parentesi singole.

```bash
#!/bin/bash
# Per garantire che lo script venga eseguito con Bash
# shebang importante quando si usano funzionalità specifiche di Bash

# Controllo della versione di Bash
if [[ ${BASH_VERSION%%.*} -lt 4 ]]; then
    echo "Questo script richiede Bash versione 4 o superiore"
    exit 1
fi
```

## Esercizi Proposti

1. **Validatore di Numeri di Telefono**: Scrivi uno script che verifica se una stringa rappresenta un numero di telefono italiano valido utilizzando le espressioni regolari.

2. **Analizzatore di Log**: Crea uno script che legge un file di log e categorizza gli eventi in errori, avvisi e informazioni usando il pattern matching.

3. **Gestione dei File**: Implementa uno script che organizza automaticamente i file in una directory in sottodirectory basate sul tipo di file, usando i test sui file e il pattern matching.

4. **Controllo di Sicurezza**: Sviluppa uno script che verifica le autorizzazioni di tutti i file in una directory e segnala potenziali problemi di sicurezza.

5. **Parser di Configurazione**: Scrivi uno script che analizza un file di configurazione e estrae i parametri usando le espressioni regolari.

## Best Practices

1. **Usa sempre le doppie parentesi quadre quando possibile** per beneficiare delle funzionalità avanzate e della riduzione degli errori.

2. **Continua a usare le virgolette attorno alle variabili**, anche se non sempre necessario con le doppie parentesi, per mantenere la coerenza e facilitare la manutenzione.

3. **Documenta l'uso di espressioni regolari complesse** con commenti per facilitare la comprensione.

4. **Evita annidamenti eccessivi** di test condizionali; considera l'uso di funzioni per migliorare la leggibilità.

5. **Verifica sempre la disponibilità delle funzionalità avanzate** se stai scrivendo script destinati ad ambienti diversi.

## Conclusione

I test con doppie parentesi quadre rappresentano un'evoluzione significativa nella programmazione Bash, offrendo maggiore potenza, flessibilità e protezione dagli errori. Padroneggiare questa sintassi avanzata consente di scrivere script più robusti, leggibili e manutenibili.