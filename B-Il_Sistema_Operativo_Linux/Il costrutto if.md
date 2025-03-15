# Capitolo: Il Costrutto Condizionale If in Bash

## Introduzione

La programmazione è fondamentalmente l'arte di prendere decisioni. In qualsiasi linguaggio di scripting o programmazione, i costrutti condizionali rappresentano lo strumento principale attraverso cui uno script può valutare condizioni diverse e scegliere differenti percorsi di esecuzione. In Bash, il costrutto `if` è il meccanismo primario per implementare questa logica decisionale.

Questo capitolo esplorerà in dettaglio il costrutto `if` in Bash, dalla sua sintassi di base fino agli usi più avanzati, fornendo esempi pratici, best practice e casi d'uso comuni. Comprenderai come utilizzare le condizioni per rendere i tuoi script più intelligenti, reattivi e robusti.

## Sintassi di Base

La forma più semplice del costrutto `if` in Bash segue questa struttura:

```bash
if [ condizione ]
then
    # comandi da eseguire se la condizione è vera
fi
```

Analizziamo i componenti chiave:

1. La parola chiave `if` indica l'inizio del costrutto condizionale.
2. La `condizione` viene valutata all'interno di parentesi quadre `[ ]` (che sono in realtà un alias per il comando `test`).
3. La parola chiave `then` introduce il blocco di comandi da eseguire se la condizione risulta vera.
4. La parola chiave `fi` (che è "if" scritto al contrario) segna la fine del costrutto condizionale.

Un aspetto cruciale da comprendere è che in Bash, una condizione è considerata vera se restituisce un codice di uscita 0, e falsa se restituisce un codice di uscita diverso da 0. Questo è opposto alla convenzione in molti altri linguaggi di programmazione, dove 0 rappresenta "falso" e valori non-zero rappresentano "vero".

## Condizioni e Operatori di Confronto

### Test su File

Bash offre numerosi operatori per verificare attributi di file e directory:

```bash
if [ -e "$file" ]    # Verifica se il file esiste
if [ -f "$file" ]    # Verifica se è un file regolare
if [ -d "$dir" ]     # Verifica se è una directory
if [ -r "$file" ]    # Verifica se è leggibile
if [ -w "$file" ]    # Verifica se è scrivibile
if [ -x "$file" ]    # Verifica se è eseguibile
if [ -s "$file" ]    # Verifica se il file esiste e non è vuoto
```

### Confronto di Stringhe

Per confrontare stringhe, Bash fornisce i seguenti operatori:

```bash
if [ "$str1" = "$str2" ]     # Verifica l'uguaglianza (notare lo spazio attorno a =)
if [ "$str1" != "$str2" ]    # Verifica la disuguaglianza
if [ -z "$str" ]             # Verifica se la stringa è vuota
if [ -n "$str" ]             # Verifica se la stringa non è vuota
```

### Confronto Numerico

Per i confronti numerici, utilizziamo:

```bash
if [ "$num1" -eq "$num2" ]    # Uguale a (equal)
if [ "$num1" -ne "$num2" ]    # Diverso da (not equal)
if [ "$num1" -lt "$num2" ]    # Minore di (less than)
if [ "$num1" -le "$num2" ]    # Minore o uguale a (less than or equal)
if [ "$num1" -gt "$num2" ]    # Maggiore di (greater than)
if [ "$num1" -ge "$num2" ]    # Maggiore o uguale a (greater than or equal)
```

## Esempio Base: Controllo dell'Esistenza di un File

Ecco un semplice esempio che dimostra come verificare l'esistenza di un file:

```bash
#!/bin/bash

file="/percorso/al/file.txt"

if [ -f "$file" ]
then
    echo "Il file $file esiste."
else
    echo "Il file $file non esiste."
fi
```

È importante notare l'uso delle virgolette doppie attorno alla variabile `$file`. Questa pratica è fondamentale per gestire correttamente i nomi di file che contengono spazi o caratteri speciali.

## Il Costrutto If-Else

Spesso abbiamo bisogno di eseguire un blocco di comandi se una condizione è vera e un altro blocco se è falsa. Per questo utilizziamo il costrutto `if-else`:

```bash
if [ condizione ]
then
    # comandi da eseguire se la condizione è vera
else
    # comandi da eseguire se la condizione è falsa
fi
```

### Esempio di If-Else: Controllo dell'Età

```bash
#!/bin/bash

echo -n "Inserisci la tua età: "
read eta

if [ "$eta" -ge 18 ]
then
    echo "Sei maggiorenne. Puoi procedere."
else
    echo "Sei minorenne. Accesso negato."
fi
```

## Il Costrutto If-Elif-Else

Per valutare più condizioni in sequenza, utilizziamo il costrutto `if-elif-else`:

```bash
if [ condizione1 ]
then
    # comandi da eseguire se condizione1 è vera
elif [ condizione2 ]
then
    # comandi da eseguire se condizione1 è falsa e condizione2 è vera
else
    # comandi da eseguire se tutte le condizioni precedenti sono false
fi
```

Possiamo includere quanti blocchi `elif` vogliamo, e il blocco `else` è opzionale.

### Esempio di If-Elif-Else: Classificazione del Punteggio

```bash
#!/bin/bash

echo -n "Inserisci il tuo punteggio (0-100): "
read punteggio

if [ "$punteggio" -ge 90 ]
then
    echo "Valutazione: A - Eccellente"
elif [ "$punteggio" -ge 80 ]
then
    echo "Valutazione: B - Buono"
elif [ "$punteggio" -ge 70 ]
then
    echo "Valutazione: C - Discreto"
elif [ "$punteggio" -ge 60 ]
then
    echo "Valutazione: D - Sufficiente"
else
    echo "Valutazione: F - Insufficiente"
fi
```

## Condizioni Multiple con Operatori Logici

### And Logico (&&)

Per valutare se più condizioni sono tutte vere, utilizziamo l'operatore AND logico:

```bash
if [ condizione1 ] && [ condizione2 ]
then
    # comandi da eseguire se entrambe le condizioni sono vere
fi
```

### Or Logico (||)

Per valutare se almeno una di più condizioni è vera, utilizziamo l'operatore OR logico:

```bash
if [ condizione1 ] || [ condizione2 ]
then
    # comandi da eseguire se almeno una condizione è vera
fi
```

### Esempio con Operatori Logici: Controllo dei Requisiti di Sistema

```bash
#!/bin/bash

# Verifica se lo spazio libero è sufficiente e se l'utente ha i permessi necessari
spazio_libero=$(df -h / | awk 'NR==2 {print $4}' | sed 's/G//')
percorso="/var/log"

if [ "$spazio_libero" -ge 5 ] && [ -w "$percorso" ]
then
    echo "Requisiti soddisfatti: spazio sufficiente e permessi di scrittura in $percorso."
else
    echo "Requisiti non soddisfatti."
    
    # Vediamo quale requisito non è soddisfatto
    if [ "$spazio_libero" -lt 5 ]
    then
        echo "Spazio libero insufficiente: solo ${spazio_libero}G disponibili."
    fi
    
    if [ ! -w "$percorso" ]
    then
        echo "Permessi di scrittura mancanti per $percorso."
    fi
fi
```

## Sintassi Alternativa con [[ ]]

Bash offre una forma estesa di test con la sintassi `[[ ]]`, che fornisce funzionalità aggiuntive rispetto a `[ ]`:

```bash
if [[ condizione ]]
then
    # comandi
fi
```

I vantaggi di `[[ ]]` includono:

1. Nessuna necessità di escape per caratteri speciali
2. Supporto per operatori `&&` e `||` direttamente all'interno delle parentesi
3. Supporto per il confronto di pattern con l'operatore `=~`

### Esempio con [[ ]]: Corrispondenza di Pattern

```bash
#!/bin/bash

email="utente@esempio.com"

# Verifica se la stringa ha il formato di un indirizzo email
if [[ $email =~ [a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,} ]]
then
    echo "Indirizzo email valido: $email"
else
    echo "Indirizzo email non valido: $email"
fi
```

## Test Aritmetici con (( ))

Per i test aritmetici, Bash fornisce la sintassi `(( ))`, che consente di utilizzare una sintassi più familiare per le espressioni matematiche:

```bash
if (( espressione_aritmetica ))
then
    # comandi
fi
```

All'interno di `(( ))`, i numeri sono trattati come in molti altri linguaggi di programmazione: zero è falso, non-zero è vero. Inoltre, possiamo utilizzare operatori come `<`, `>`, `<=`, `>=`, `==`, `!=` senza escape.

### Esempio con (( )): Verifica Numeri Pari/Dispari

```bash
#!/bin/bash

echo -n "Inserisci un numero: "
read numero

if (( numero % 2 == 0 ))
then
    echo "$numero è un numero pari."
else
    echo "$numero è un numero dispari."
fi
```

## Controllo del Valore di Ritorno dei Comandi

Una potente funzionalità di Bash è la capacità di utilizzare direttamente il valore di ritorno di un comando come condizione:

```bash
if comando
then
    # comandi da eseguire se il comando precedente ha avuto successo
fi
```

### Esempio con Valore di Ritorno: Verifica di un Host Remoto

```bash
#!/bin/bash

host="esempio.com"

# Verifica se l'host è raggiungibile
if ping -c 1 -W 1 $host &> /dev/null
then
    echo "L'host $host è raggiungibile."
else
    echo "Impossibile raggiungere l'host $host."
fi
```

## Annidamento dei Costrutti If

È possibile annidare più costrutti `if` per creare logiche decisionali più complesse:

```bash
if [ condizione_esterna ]
then
    # comandi
    
    if [ condizione_interna ]
    then
        # comandi annidati
    fi
fi
```

### Esempio di If Annidati: Verifica dei Requisiti Utente

```bash
#!/bin/bash

echo -n "Inserisci il tuo nome utente: "
read utente

if id "$utente" &>/dev/null
then
    echo "L'utente $utente esiste."
    
    if groups "$utente" | grep -q "sudo"
    then
        echo "L'utente $utente ha privilegi di amministrazione."
        
        if [ -d "/home/$utente" ]
        then
            echo "La directory home dell'utente esiste."
        else
            echo "Attenzione: La directory home non esiste."
        fi
    else
        echo "L'utente $utente non ha privilegi di amministrazione."
    fi
else
    echo "L'utente $utente non esiste nel sistema."
fi
```

## If in Una Sola Riga

Per script semplici o per risparmiare spazio, è possibile scrivere un costrutto `if` in una sola riga:

```bash
if [ condizione ]; then comando; fi
```

Anche se questa forma è più compatta, è generalmente meno leggibile per script complessi.

## Costrutto If per Gestire Errori

Uno degli utilizzi più comuni del costrutto `if` è la gestione degli errori:

```bash
#!/bin/bash

file="/percorso/al/file.txt"

if ! [ -f "$file" ]
then
    echo "Errore: Il file $file non esiste." >&2
    exit 1
fi

# Se arriviamo qui, il file esiste e possiamo procedere
echo "Elaborazione del file $file..."
```

## Best Practice

### 1. Usa Sempre le Virgolette per le Variabili

```bash
# CORRETTO
if [ "$variabile" = "valore" ]

# ERRATO (potrebbe fallire con variabili contenenti spazi)
if [ $variabile = "valore" ]
```

### 2. Controlla i Parametri di Input

```bash
#!/bin/bash

if [ $# -lt 2 ]
then
    echo "Utilizzo: $0 parametro1 parametro2" >&2
    exit 1
fi
```

### 3. Usa la Notazione Estesa per Maggiore Chiarezza

```bash
# Forma estesa, più chiara
if [ "$status" = "ok" ]
then
    echo "Tutto bene"
else
    echo "C'è un problema"
fi

# Forma compatta, meno leggibile
if [ "$status" = "ok" ]; then echo "Tutto bene"; else echo "C'è un problema"; fi
```

### 4. Indenta Correttamente il Codice

```bash
if [ condizione1 ]
then
    # Indentazione consistente
    comando1
    comando2
    
    if [ condizione_annidata ]
    then
        # Ulteriore indentazione per il blocco annidato
        comando_annidato
    fi
else
    # Stessa indentazione del primo blocco if
    comando3
fi
```

### 5. Evita l'Uso Eccessivo di Else If

Se hai molte condizioni da verificare, valuta l'uso del costrutto `case` anziché una lunga catena di `elif`.

## Errori Comuni e Loro Soluzione

### 1. Dimenticare gli Spazi nelle Condizioni

```bash
# ERRATO
if [$variabile="valore"]

# CORRETTO
if [ "$variabile" = "valore" ]
```

### 2. Confondere = e ==

In Bash con `[ ]`, l'operatore di uguaglianza per le stringhe è `=` (anche se `==` funziona in Bash ma non in sh):

```bash
# CORRETTO per Bash e sh
if [ "$stringa1" = "$stringa2" ]

# Funziona in Bash ma non in sh
if [ "$stringa1" == "$stringa2" ]

# Con [[ ]] possiamo usare == senza problemi
if [[ "$stringa1" == "$stringa2" ]]
```

### 3. Confondere Operatori Numerici e di Stringa

```bash
# ERRATO (confronta come stringhe)
if [ "$num1" = "$num2" ]

# CORRETTO (confronta come numeri)
if [ "$num1" -eq "$num2" ]
```

### 4. Non Gestire le Variabili Non Inizializzate

```bash
# ERRATO (se variabile non è inizializzata, genera un errore)
if [ $variabile = "valore" ]

# CORRETTO (sicuro anche se variabile non è inizializzata)
if [ "${variabile:-}" = "valore" ]
```

## Esempi Pratici

### Esempio 1: Script di Backup

```bash
#!/bin/bash

# Configurazione
dir_origine="/home/utente/documenti"
dir_backup="/backup"
data=$(date +%Y%m%d)
file_backup="$dir_backup/backup_$data.tar.gz"

# Verifica se la directory di origine esiste
if [ ! -d "$dir_origine" ]
then
    echo "Errore: La directory $dir_origine non esiste." >&2
    exit 1
fi

# Verifica se la directory di backup esiste
if [ ! -d "$dir_backup" ]
then
    echo "La directory di backup non esiste. Tentativo di crearla..."
    
    if mkdir -p "$dir_backup"
    then
        echo "Directory di backup creata con successo."
    else
        echo "Errore: Impossibile creare la directory di backup." >&2
        exit 2
    fi
fi

# Verifica se c'è abbastanza spazio
spazio_necessario=$(du -s "$dir_origine" | awk '{print $1}')
spazio_disponibile=$(df "$dir_backup" | awk 'NR==2 {print $4}')

if [ "$spazio_disponibile" -lt "$spazio_necessario" ]
then
    echo "Errore: Spazio insufficiente per il backup." >&2
    echo "Spazio necessario: $spazio_necessario KB" >&2
    echo "Spazio disponibile: $spazio_disponibile KB" >&2
    exit 3
fi

# Esegue il backup
echo "Creazione del backup in corso..."

if tar -czf "$file_backup" -C "$(dirname "$dir_origine")" "$(basename "$dir_origine")"
then
    echo "Backup completato con successo: $file_backup"
else
    echo "Errore durante la creazione del backup." >&2
    exit 4
fi
```

### Esempio 2: Verifica dell'Installazione di Pacchetti

```bash
#!/bin/bash

# Lista di pacchetti necessari
pacchetti=("wget" "curl" "jq" "git")

# Funzione per verificare se un pacchetto è installato
is_installed() {
    if command -v "$1" &> /dev/null
    then
        return 0  # Il pacchetto è installato
    else
        return 1  # Il pacchetto non è installato
    fi
}

# Verifica ciascun pacchetto
for pacchetto in "${pacchetti[@]}"
do
    echo -n "Verifica di $pacchetto: "
    
    if is_installed "$pacchetto"
    then
        echo "Installato"
    else
        echo "Non installato"
        
        # Chiede all'utente se vuole installare il pacchetto
        echo -n "Vuoi installare $pacchetto? (s/n): "
        read risposta
        
        if [ "$risposta" = "s" ] || [ "$risposta" = "S" ]
        then
            echo "Installazione di $pacchetto in corso..."
            
            if apt-get install -y "$pacchetto" &> /dev/null
            then
                echo "$pacchetto installato con successo."
            else
                echo "Errore durante l'installazione di $pacchetto." >&2
            fi
        fi
    fi
done
```

## Esercizi Proposti

### Esercizio 1: Verifica dell'Estensione di un File

Scrivi uno script che accetti un nome di file come argomento e visualizzi un messaggio diverso in base all'estensione del file (es. .txt, .jpg, .sh, ecc.).

### Esercizio 2: Calcolatrice Semplice

Crea una calcolatrice da riga di comando che accetti tre argomenti: un numero, un operatore (+, -, *, /) e un altro numero. Utilizza il costrutto `if` per gestire i diversi operatori e mostrare il risultato dell'operazione.

### Esercizio 3: Gestore di Processi

Scrivi uno script che accetti un nome di processo come argomento e verifichi se il processo è in esecuzione. Se è in esecuzione, mostra informazioni sul processo; se non lo è, chiedi all'utente se vuole avviarlo.

### Esercizio 4: Analizzatore di Log

Crea uno script che analizzi un file di log e mostri diverse statistiche in base alle opzioni specificate dall'utente (es. conteggio degli errori, avvisi, accessi riusciti, ecc.).

### Esercizio 5: Gestione delle Dipendenze

Scrivi uno script che verifichi se tutte le dipendenze necessarie per un progetto sono installate. Se alcune dipendenze mancano, lo script dovrebbe mostrarle e chiedere all'utente se vuole installarle.

## Conclusione

Il costrutto `if` è uno strumento fondamentale nella programmazione Bash, che consente di prendere decisioni basate su varie condizioni. Comprendere a fondo come utilizzare questo costrutto, insieme ai vari operatori di confronto e alle tecniche avanzate discusse in questo capitolo, ti permetterà di scrivere script più intelligenti, reattivi e robusti.

Ricorda sempre di seguire le best practice, in particolare l'uso delle virgolette per le variabili e la corretta indentazione del codice, per evitare errori comuni e creare script più leggibili e manutenibili.

Con la padronanza del costrutto `if`, avrai in mano uno strumento essenziale per elevare le tue capacità di scripting in Bash e affrontare con sicurezza sfide sempre più complesse.