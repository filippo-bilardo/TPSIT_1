# 6. Cicli

## 6.1 Il ciclo for

Il ciclo `for` in Bash permette di iterare su una lista di elementi e eseguire comandi per ciascun elemento. È uno dei costrutti di iterazione più utilizzati negli script.

### Sintassi di base

```bash
for variabile in lista; do
    # comandi da eseguire per ogni elemento della lista
done
```

Esempi di utilizzo del ciclo `for`:

```bash
# Iterazione su una lista di valori
for nome in Alice Bob Carlo Diana; do
    echo "Ciao, $nome!"
done

# Iterazione su file con pattern matching
for file in *.txt; do
    echo "Elaborazione del file: $file"
    # altri comandi...
done

# Iterazione su output di un comando
for utente in $(cut -d: -f1 /etc/passwd); do
    echo "Utente: $utente"
done
```

### Ciclo for in stile C

Bash supporta anche una sintassi simile al ciclo for del linguaggio C:

```bash
for ((inizializzazione; condizione; incremento)); do
    # comandi da eseguire
done
```

Esempio:

```bash
# Conteggio da 1 a 10
for ((i=1; i<=10; i++)); do
    echo "Numero: $i"
done

# Conteggio alla rovescia
for ((i=10; i>=1; i--)); do
    echo "Conto alla rovescia: $i"
done

# Ciclo con incremento personalizzato
for ((i=0; i<100; i+=5)); do
    echo "Valore: $i"
done
```

## 6.2 Il ciclo while

Il ciclo `while` esegue un blocco di comandi fintanto che una condizione specificata è vera.

### Sintassi di base

```bash
while [condizione]; do
    # comandi da eseguire finché la condizione è vera
done
```

Esempi di utilizzo del ciclo `while`:

```bash
# Conteggio semplice
conta=1
while [ $conta -le 5 ]; do
    echo "Conteggio: $conta"
    ((conta++))
done

# Lettura di un file riga per riga
while read linea; do
    echo "Riga letta: $linea"
done < file.txt

# Attesa di una condizione
while [ ! -f /tmp/file_segnale ]; do
    echo "In attesa del file segnale..."
    sleep 5
done
```

### Ciclo while con più condizioni

È possibile utilizzare operatori logici per creare condizioni complesse:

```bash
# Ciclo con condizioni multiple
x=1
y=10
while [ $x -le 5 ] && [ $y -ge 5 ]; do
    echo "x=$x, y=$y"
    ((x++))
    ((y--))
done
```

## 6.3 Il ciclo until

Il ciclo `until` è simile al ciclo `while`, ma con una logica invertita: esegue un blocco di comandi finché una condizione diventa vera (cioè, finché la condizione è falsa).

### Sintassi di base

```bash
until [condizione]; do
    # comandi da eseguire finché la condizione è falsa
done
```

Esempi di utilizzo del ciclo `until`:

```bash
# Conteggio fino a 5
conta=1
until [ $conta -gt 5 ]; do
    echo "Conteggio: $conta"
    ((conta++))
done

# Attesa della creazione di un file
until [ -f /tmp/file_segnale ]; do
    echo "In attesa della creazione del file..."
    sleep 5
done
```

## 6.4 Comandi break e continue

Bash fornisce i comandi `break` e `continue` per controllare il flusso all'interno dei cicli.

### Il comando break

Il comando `break` interrompe immediatamente l'esecuzione del ciclo e passa al comando successivo dopo il ciclo.

```bash
# Esempio di break
for ((i=1; i<=10; i++)); do
    echo "Iterazione: $i"
    if [ $i -eq 5 ]; then
        echo "Raggiunto 5, esco dal ciclo"
        break
    fi
done
echo "Ciclo terminato"
```

### Il comando continue

Il comando `continue` salta il resto delle istruzioni nel ciclo corrente e passa alla prossima iterazione.

```bash
# Esempio di continue
for ((i=1; i<=10; i++)); do
    if [ $i -eq 5 ]; then
        echo "Salto l'iterazione 5"
        continue
    fi
    echo "Iterazione: $i"
done
```

### Utilizzo con cicli annidati

È possibile specificare a quale ciclo applicare `break` o `continue` quando si hanno cicli annidati:

```bash
# Break con cicli annidati
for ((i=1; i<=3; i++)); do
    echo "Ciclo esterno: $i"
    for ((j=1; j<=3; j++)); do
        echo "  Ciclo interno: $j"
        if [ $i -eq 2 ] && [ $j -eq 2 ]; then
            echo "    Uscita dal ciclo interno"
            break
        fi
    done
done

# Break dal ciclo esterno
for ((i=1; i<=3; i++)); do
    echo "Ciclo esterno: $i"
    for ((j=1; j<=3; j++)); do
        echo "  Ciclo interno: $j"
        if [ $i -eq 2 ] && [ $j -eq 2 ]; then
            echo "    Uscita da entrambi i cicli"
            break 2  # Esce da 2 livelli di cicli
        fi
    done
done
```

Similmente, è possibile utilizzare `continue` con un numero per specificare a quale livello di ciclo applicarlo:

```bash
# Continue con cicli annidati
for ((i=1; i<=3; i++)); do
    echo "Ciclo esterno: $i"
    for ((j=1; j<=3; j++)); do
        if [ $j -eq 2 ]; then
            echo "  Salto j=2"
            continue
        fi
        echo "  Ciclo interno: $j"
    done
done
```

## 6.5 Buone pratiche per l'uso dei cicli

Quando si utilizzano i cicli in Bash, è importante seguire alcune buone pratiche per garantire che gli script siano efficienti, leggibili e manutenibili:

### Evitare cicli inutili

In molti casi, è possibile utilizzare comandi Bash nativi che operano su più file senza la necessità di cicli espliciti:

```bash
# Invece di questo:
for file in *.txt; do
    chmod 644 "$file"
done

# Meglio usare:
chmod 644 *.txt
```

### Proteggere le variabili

Utilizzare sempre le virgolette doppie attorno alle variabili per evitare problemi con spazi e caratteri speciali:

```bash
# Corretto:
for file in *.txt; do
    echo "Elaborazione di: \"$file\""
done

# Problematico se i nomi dei file contengono spazi:
for file in *.txt; do
    echo Elaborazione di: $file  # Potrebbe causare problemi
done
```

### Utilizzare IFS (Internal Field Separator)

Modificare temporaneamente l'IFS può essere utile quando si lavora con dati delimitati:

```bash
# Lettura di un file CSV
old_IFS="$IFS"
IFS=","
while read -r nome cognome email; do
    echo "Nome: $nome, Cognome: $cognome, Email: $email"
done < dati.csv
IFS="$old_IFS"  # Ripristina l'IFS originale
```

### Controllare gli errori

Verificare sempre le condizioni di errore all'interno dei cicli:

```bash
for file in *.conf; do
    if [ ! -f "$file" ]; then
        echo "Attenzione: $file non esiste o non è un file regolare"
        continue
    fi
    
    # Elaborazione del file...
done
```

## 6.6 Ottimizzazione dei cicli

Ecco alcuni suggerimenti per ottimizzare i cicli negli script Bash:

### Ridurre le chiamate a programmi esterni

Le chiamate a programmi esterni all'interno di un ciclo possono rallentare significativamente l'esecuzione:

```bash
# Inefficiente:
for i in {1..1000}; do
    result=$(date +%s)  # Chiamata esterna in ogni iterazione
    # Elaborazione...
done

# Più efficiente:
current_time=$(date +%s)  # Una sola chiamata esterna
for i in {1..1000}; do
    result=$current_time
    # Elaborazione...
done
```

### Utilizzare operazioni aritmetiche interne

Utilizzare le operazioni aritmetiche interne di Bash invece di chiamare programmi esterni come `expr`:

```bash
# Inefficiente:
for i in {1..100}; do
    j=$(expr $i + 5)  # Chiamata esterna
done

# Più efficiente:
for i in {1..100}; do
    j=$((i + 5))  # Operazione aritmetica interna
done
```

### Preferire cicli for con sequenze predefinite

Quando possibile, utilizzare l'espansione delle sequenze invece di cicli while con contatori:

```bash
# Meno efficiente:
i=1
while [ $i -le 100 ]; do
    echo $i
    ((i++))
done

# Più efficiente:
for i in {1..100}; do
    echo $i
done
```

### Utilizzare la redirezione I/O fuori dal ciclo

Quando si scrive su un file all'interno di un ciclo, è più efficiente aprire la redirezione una sola volta:

```bash
# Inefficiente (apre e chiude il file ad ogni iterazione):
for i in {1..100}; do
    echo "Linea $i" >> output.txt
done

# Più efficiente (apre e chiude il file una sola volta):
{
    for i in {1..100}; do
        echo "Linea $i"
    done
} > output.txt
```

## 6.7 Domande di autovalutazione

1. **Quale dei seguenti cicli è più adatto per iterare su una lista di file in una directory?**
   - A) Ciclo while
   - B) Ciclo for
   - C) Ciclo until
   - D) Nessuno dei precedenti

2. **Quale comando permette di interrompere immediatamente l'esecuzione di un ciclo?**
   - A) exit
   - B) continue
   - C) break
   - D) return

3. **Come si può specificare a quale livello di ciclo annidato applicare un comando break?**
   - A) Utilizzando break seguito dal numero di livelli
   - B) Utilizzando l'opzione -l con break
   - C) Non è possibile, break esce sempre solo dal ciclo più interno
   - D) Utilizzando break con il nome del ciclo

4. **Quale ciclo esegue i comandi finché una condizione diventa vera?**
   - A) for
   - B) while
   - C) until
   - D) loop

5. **Quale delle seguenti è una buona pratica quando si utilizzano cicli in Bash?**
   - A) Evitare l'uso delle virgolette attorno alle variabili
   - B) Chiamare programmi esterni ad ogni iterazione
   - C) Proteggere le variabili con virgolette doppie
   - D) Utilizzare sempre cicli annidati

**Risposte:**
1. B) Ciclo for
2. C) break
3. A) Utilizzando break seguito dal numero di livelli
4. C) until
5. C) Proteggere le variabili con virgolette doppie

## 6.8 Esercizi proposti

1. **Contatore personalizzato**: Scrivi uno script che utilizzi un ciclo for per contare da un numero iniziale a un numero finale, con un incremento specificato dall'utente.

2. **Elaborazione file**: Scrivi uno script che utilizzi un ciclo for per cercare tutti i file .txt in una directory e nelle sue sottodirectory, e conti il numero di righe in ciascun file.

3. **Menu interattivo**: Crea un menu interattivo utilizzando un ciclo while che permetta all'utente di scegliere tra diverse opzioni e eseguire azioni diverse in base alla scelta.

4. **Monitoraggio processi**: Scrivi uno script che utilizzi un ciclo until per monitorare un processo specifico e notificare quando termina.

5. **Elaborazione CSV**: Scrivi uno script che legga un file CSV riga per riga utilizzando un ciclo while e IFS personalizzato, ed estragga e visualizzi informazioni specifiche.

6. **Cicli annidati**: Scrivi uno script che utilizzi cicli for annidati per generare una tabella di moltiplicazione da 1 a 10.

7. **Gestione errori**: Scrivi uno script che utilizzi un ciclo for per elaborare una lista di file, con gestione degli errori appropriata per i file che non esistono o non sono accessibili.

8. **Ottimizzazione**: Prendi uno script esistente che utilizza cicli e ottimizzalo seguendo le buone pratiche discusse in questa lezione.