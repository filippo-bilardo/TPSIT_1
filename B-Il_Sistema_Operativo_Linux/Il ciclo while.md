Il ciclo `while` in Bash è una struttura di controllo che permette di eseguire ripetutamente un blocco di codice finché una condizione è vera. La sintassi di base del ciclo `while` è la seguente:

```bash
while [ condizione ]
do
  # comandi da eseguire
done
```

### Esempio di utilizzo

Ecco un esempio semplice di un ciclo `while` che stampa i numeri da 1 a 5:

```bash
#!/bin/bash

contatore=1

while [ $contatore -le 5 ]
do
  echo "Numero: $contatore"
  contatore=$((contatore + 1))
done
```

### Spiegazione

- `contatore=1`: Inizializza una variabile `contatore` a 1.
- `while [ $contatore -le 5 ]`: Il ciclo continua finché `contatore` è minore o uguale a 5.
- `do ... done`: Delimita il blocco di codice che viene eseguito ripetutamente.
- `echo "Numero: $contatore"`: Stampa il valore corrente del contatore.
- `contatore=$((contatore + 1))`: Incrementa il contatore di 1 ad ogni iterazione.

### Note

- La condizione nel ciclo `while` è valutata prima di ogni iterazione. Se la condizione è falsa all'inizio, il blocco di codice non verrà eseguito nemmeno una volta.
- È importante incrementare o modificare la variabile di controllo all'interno del ciclo per evitare loop infiniti.

---

In Bash, il ciclo `while` viene utilizzato per eseguire un blocco di comandi finché una determinata condizione è vera. La struttura generale del ciclo `while` in Bash è la seguente:

```bash
while condizione
do
    # Comandi da eseguire
done
```

### Componenti principali:
1. **condizione**: Questa è un'espressione che viene valutata prima di ogni iterazione del ciclo. Se la condizione è vera (`true`), i comandi all'interno del ciclo vengono eseguiti. Quando la condizione diventa falsa (`false`), il ciclo termina.
2. **do...done**: Questo blocco contiene i comandi che verranno eseguiti ripetutamente fintanto che la condizione rimane vera.

---

### Esempi pratici

#### 1. Contare da 1 a 5
Questo esempio mostra come usare un ciclo `while` per stampare numeri da 1 a 5:

```bash
#!/bin/bash

count=1
while [ $count -le 5 ]
do
    echo "Conteggio: $count"
    count=$((count + 1))  # Incrementa il contatore
done
```

**Spiegazione**:
- `[ $count -le 5 ]`: La condizione verifica se il valore di `count` è minore o uguale a 5.
- `count=$((count + 1))`: Incrementa il valore di `count` di 1 ad ogni iterazione.

---

#### 2. Leggere righe da un file
Il ciclo `while` può essere utilizzato per leggere riga per riga da un file:

```bash
#!/bin/bash

file="esempio.txt"
while IFS= read -r line
do
    echo "Riga letta: $line"
done < "$file"
```

**Spiegazione**:
- `IFS= read -r line`: Legge una riga dal file e la memorizza nella variabile `line`.
- `< "$file"`: Redirige il contenuto del file `esempio.txt` come input per il ciclo.

---

#### 3. Ciclo infinito (da usare con cautela)
Un ciclo infinito si verifica quando la condizione è sempre vera. È utile per processi in background o per monitoraggio continuo:

```bash
#!/bin/bash

while true
do
    echo "Ciclo infinito in esecuzione..."
    sleep 2  # Pausa di 2 secondi tra le iterazioni
done
```

**Attenzione**: Per interrompere un ciclo infinito, premi `Ctrl+C`.

---

#### 4. Verificare l'input dell'utente
Il ciclo `while` può essere utilizzato per richiedere all'utente un input specifico fino a quando non viene fornito un valore valido:

```bash
#!/bin/bash

read -p "Inserisci 'sì' per continuare: " risposta
while [ "$risposta" != "sì" ]
do
    echo "Input errato. Riprova."
    read -p "Inserisci 'sì' per continuare: " risposta
done

echo "Input corretto!"
```

---

### Condizioni comuni nel ciclo `while`
- `[ condizione ]`: Utilizzata per confronti numerici o stringhe.
- `-z stringa`: Verifica se una stringa è vuota.
- `-n stringa`: Verifica se una stringa non è vuota.
- `-f file`: Verifica se un file esiste ed è un file normale.
- `-d directory`: Verifica se una directory esiste.

---

### Consigli
- Usare `sleep` per evitare cicli troppo veloci che consumano risorse.
- Assicurarsi che la condizione possa diventare falsa altrimenti il ciclo sarà infinito.
- Utilizzare `break` per uscire dal ciclo in anticipo, se necessario.

---

# Capitolo: Il Ciclo While in Bash

## Introduzione

I cicli sono tra i costrutti più potenti in qualsiasi linguaggio di programmazione, e Bash non fa eccezione. Il ciclo `while` in particolare è uno strumento fondamentale che consente di eseguire comandi ripetutamente fino a quando una condizione specificata rimane vera. Questo meccanismo è essenziale per l'automazione di attività ripetitive, l'elaborazione di dati in sequenza e la creazione di script interattivi.

## Sintassi di Base

La struttura fondamentale di un ciclo `while` in Bash è la seguente:

```bash
while [ condizione ]
do
    # comandi da eseguire
done
```

Analizziamo questo costrutto:

1. La parola chiave `while` indica l'inizio del ciclo.
2. Tra parentesi quadre `[ ]` va inserita una condizione che viene valutata prima di ogni iterazione.
3. Se la condizione è vera (restituisce un valore di uscita 0), i comandi tra `do` e `done` vengono eseguiti.
4. Dopo l'esecuzione dei comandi, il controllo torna alla condizione del `while`.
5. Il ciclo termina quando la condizione diventa falsa (restituisce un valore di uscita diverso da 0).

## Esempi Pratici

### Esempio 1: Contatore Semplice

```bash
#!/bin/bash

# Inizializziamo un contatore
count=1

# Eseguiamo il ciclo finché count è minore o uguale a 5
while [ $count -le 5 ]
do
    echo "Iterazione numero $count"
    
    # Incrementiamo il contatore
    # Nota: in Bash, (( )) permette l'uso di operatori aritmetici
    (( count++ ))
done

echo "Ciclo terminato!"
```

Output:
```
Iterazione numero 1
Iterazione numero 2
Iterazione numero 3
Iterazione numero 4
Iterazione numero 5
Ciclo terminato!
```

### Esempio 2: Lettura di File Riga per Riga

```bash
#!/bin/bash

# Specificare il file da leggere
file="dati.txt"

# Controllare se il file esiste
if [ ! -f "$file" ]; then
    echo "Errore: il file $file non esiste."
    exit 1
fi

# Leggere il file riga per riga
while read -r linea
do
    echo "Riga letta: $linea"
done < "$file"
```

Questo script legge un file di testo riga per riga e mostra ciascuna riga. La redirezione `< "$file"` indirizza il contenuto del file al comando `read`.

### Esempio 3: Menu Interattivo

```bash
#!/bin/bash

scelta=""

while [ "$scelta" != "q" ]
do
    echo -e "\nMenu:"
    echo "1. Visualizza data e ora"
    echo "2. Elenca i file nella directory corrente"
    echo "3. Mostra lo spazio disco disponibile"
    echo "q. Esci"
    
    echo -n "Inserisci la tua scelta: "
    read scelta
    
    case $scelta in
        1)
            echo "Data e ora attuali: $(date)"
            ;;
        2)
            echo "File nella directory corrente:"
            ls -l
            ;;
        3)
            echo "Spazio disco disponibile:"
            df -h
            ;;
        q)
            echo "Uscita dal programma..."
            ;;
        *)
            echo "Scelta non valida. Riprova."
            ;;
    esac
done
```

Questo script crea un menu interattivo che continua a mostrare le opzioni fino a quando l'utente non inserisce 'q' per uscire.

## Varianti e Costrutti Avanzati

### Ciclo While con Condizioni Multiple

È possibile utilizzare operatori logici per combinare più condizioni:

```bash
#!/bin/bash

count=1
max=5

while [ $count -le $max ] && [ $(date +%S) -ne 0 ]
do
    echo "Contatore: $count, Secondi: $(date +%S)"
    sleep 1
    (( count++ ))
done
```

Questo script itera finché il contatore è minore o uguale a 5 E i secondi dell'ora corrente non sono 0.

### Ciclo While con Test Alternativo

Esistono diverse forme per specificare i test in Bash:

```bash
# Utilizzando [[ ]], che offre funzionalità estese rispetto a [ ]
while [[ $variabile == *pattern* ]]
do
    # comandi
done

# Utilizzando (( )) per espressioni aritmetiche
while (( x < 10 ))
do
    # comandi
    (( x++ ))
done

# Utilizzando test direttamente
while test $a -lt $b
do
    # comandi
done
```

### Ciclo Infinito

A volte è utile creare un ciclo che continua all'infinito fino a quando non viene interrotto esplicitamente:

```bash
#!/bin/bash

# Ciclo infinito
while true
do
    echo "Premere Ctrl+C per terminare questo ciclo infinito"
    sleep 1
done
```

Per terminare uno script come questo, è necessario utilizzare Ctrl+C o inviare un segnale di interruzione.

## Best Practice

1. **Evitare cicli infiniti non intenzionali**: Assicurarsi sempre che ci sia una condizione che prima o poi diventerà falsa, oppure un meccanismo esplicito per terminare il ciclo.

2. **Utilizzare variabili con nomi significativi**: Invece di `i`, `j`, `k`, utilizzare nomi che descrivono lo scopo della variabile, come `contatore`, `num_tentativi`, ecc.

3. **Includere istruzioni di debug**: Quando si sviluppano script complessi, può essere utile includere comandi di debug:

```bash
while [ $contatore -lt $max ]
do
    echo "DEBUG: Iterazione $contatore di $max" >&2
    # altri comandi
    (( contatore++ ))
done
```

4. **Inizializzare sempre le variabili**: Prima di utilizzare una variabile in un ciclo `while`, assicurarsi di averla inizializzata con un valore appropriato.

5. **Usare `break` e `continue` con parsimonia**: Sebbene sia possibile utilizzare `break` per uscire da un ciclo e `continue` per passare alla prossima iterazione, l'uso eccessivo può rendere il codice difficile da leggere e mantenere.

## Controllo di Flusso nel Ciclo While

### Break

L'istruzione `break` permette di uscire immediatamente da un ciclo:

```bash
#!/bin/bash

count=1

while [ $count -le 10 ]
do
    echo "Numero: $count"
    
    if [ $count -eq 5 ]
    then
        echo "Raggiungo 5, esco dal ciclo!"
        break
    fi
    
    (( count++ ))
done

echo "Ciclo terminato al valore $count"
```

### Continue

L'istruzione `continue` salta il resto delle istruzioni nell'iterazione corrente e passa alla valutazione della condizione per la prossima iterazione:

```bash
#!/bin/bash

count=0

while [ $count -lt 10 ]
do
    (( count++ ))
    
    # Salta i numeri pari
    if (( count % 2 == 0 ))
    then
        echo "Salto il numero pari $count"
        continue
    fi
    
    echo "Elaboro il numero dispari $count"
done
```

## Ciclo Until

Bash fornisce anche un ciclo `until`, che è essenzialmente l'opposto del ciclo `while`. Mentre il ciclo `while` esegue comandi finché una condizione è vera, il ciclo `until` esegue comandi finché una condizione diventa vera:

```bash
#!/bin/bash

count=1

until [ $count -gt 5 ]
do
    echo "Contatore: $count"
    (( count++ ))
done
```

Questo script produce lo stesso output dell'esempio del contatore semplice con `while`, ma la logica è invertita.

## Casi d'Uso Comuni

### Monitoraggio di File o Risorse

```bash
#!/bin/bash

file="/var/log/sistema.log"

# Monitora la dimensione del file
while true
do
    size=$(du -k "$file" | cut -f1)
    
    if [ $size -gt 1024 ]
    then
        echo "Attenzione: il file $file ha superato 1MB!"
        # Possibile azione: rotazione log, notifica, ecc.
    fi
    
    sleep 60  # Controlla ogni minuto
done
```

### Attesa di un Evento

```bash
#!/bin/bash

server="esempio.com"
porta=22

# Attendi che il server sia raggiungibile
while ! nc -z $server $porta 2>/dev/null
do
    echo "In attesa che $server:$porta sia disponibile..."
    sleep 5
done

echo "$server:$porta è ora raggiungibile!"
```

### Elaborazione di Dati in Batch

```bash
#!/bin/bash

max_batch=100
count=0

cat datimoltograndi.txt | while read linea
do
    # Elabora la linea
    echo "Elaborazione: $linea"
    
    (( count++ ))
    
    # Dopo ogni batch di 100 linee, fai una pausa
    if [ $count -eq $max_batch ]
    then
        echo "Completato un batch di $max_batch elementi. Pausa di 2 secondi..."
        sleep 2
        count=0
    fi
done
```

## Errori Comuni e Loro Soluzione

### 1. Dimenticare gli Spazi nelle Condizioni

Un errore comune è dimenticare gli spazi nei test:

```bash
# ERRATO
while [$count -lt 5]
do
    # comandi
done

# CORRETTO
while [ $count -lt 5 ]
do
    # comandi
done
```

### 2. Non Incrementare il Contatore

Un altro errore frequente è dimenticare di aggiornare la variabile di controllo:

```bash
count=1

# ERRATO: ciclo infinito!
while [ $count -le 5 ]
do
    echo $count
    # Manca l'incremento!
done

# CORRETTO
while [ $count -le 5 ]
do
    echo $count
    (( count++ ))
done
```

### 3. Problemi con le Variabili non Inizializzate

```bash
# ERRATO: la variabile non è inizializzata
while [ $count -le 5 ]
do
    echo $count
    (( count++ ))
done

# CORRETTO
count=1
while [ $count -le 5 ]
do
    echo $count
    (( count++ ))
done
```

## Esercizi Proposti

### Esercizio 1: Contatore alla Rovescia

Scrivi uno script Bash che utilizzi un ciclo `while` per creare un contatore alla rovescia da 10 a 1, e poi visualizzi "Lancio!" al termine del conto.

### Esercizio 2: Indovina il Numero

Crea uno script che generi un numero casuale tra 1 e 100, e poi chieda all'utente di indovinarlo. Utilizza un ciclo `while` per continuare a chiedere input finché l'utente non indovina il numero, fornendo suggerimenti se il numero inserito è troppo alto o troppo basso.

### Esercizio 3: Monitor di Sistema

Scrivi uno script che utilizzi un ciclo `while` per monitorare l'utilizzo della CPU ogni 5 secondi. Se l'utilizzo supera l'80%, lo script dovrebbe mostrare un avviso.

### Esercizio 4: Backup Incrementale

Crea uno script di backup che utilizzi un ciclo `while` per scansionare una directory alla ricerca di file modificati nelle ultime 24 ore e li copi in una directory di backup.

### Esercizio 5: Parser di Log

Scrivi uno script che legga un file di log riga per riga utilizzando un ciclo `while` e conti il numero di occorrenze di errori specifici (ad esempio, "404 Not Found" in un log di server web).

## Conclusione

Il ciclo `while` in Bash è un potente strumento che consente di automatizzare attività ripetitive e creare script dinamici. Padroneggiando questo costrutto, insieme alle sue varianti e ai comandi correlati, sarai in grado di sviluppare script Bash più sofisticati ed efficienti.

Ricorda sempre di prestare attenzione alle condizioni del ciclo e all'aggiornamento delle variabili di controllo per evitare cicli infiniti non intenzionali. Con la pratica e seguendo le best practice, diventerai sempre più efficace nell'utilizzo dei cicli `while` per risolvere problemi reali di amministrazione di sistema e automazione.