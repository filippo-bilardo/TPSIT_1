# Cicli For in Bash

## Introduzione

I cicli `for` sono uno strumento fondamentale nella programmazione Bash che permettono di eseguire un blocco di comandi ripetutamente per ogni elemento di un insieme. Sono particolarmente utili per elaborare liste di file, numeri o stringhe in modo efficiente.

## Sintassi Base

In Bash, esistono due principali forme di ciclo `for`:

### 1. Sintassi Tradizionale (Shell Style)

```bash
for variabile in lista_elementi
do
    # comandi da eseguire per ogni elemento
done
```

Oppure su una singola riga:

```bash
for variabile in lista_elementi; do comandi; done
```

### 2. Sintassi in Stile C (C-Style)

```bash
for ((inizializzazione; condizione; incremento))
do
    # comandi da eseguire finché la condizione è vera
done
```

## Esempi di Utilizzo

### Iterazione su una Lista di Elementi

```bash
#!/bin/bash

# Iterazione su una lista di stringhe
for frutto in mela pera banana arancia
do
    echo "Mi piace la $frutto"
done
```

### Iterazione su Numeri

```bash
#!/bin/bash

# Iterazione su un intervallo di numeri
for numero in {1..5}
do
    echo "Numero: $numero"
done

# Con incremento specifico
for numero in {0..10..2}  # Da 0 a 10 con incremento di 2
do
    echo "Numero pari: $numero"
done
```

### Iterazione su File

```bash
#!/bin/bash

# Iterazione su tutti i file .txt nella directory corrente
for file in *.txt
do
    echo "Elaborazione del file: $file"
    # Altri comandi per elaborare il file
done

# Iterazione su file con glob pattern
for file in /var/log/*.log
do
    echo "File di log: $file"
done
```

### Utilizzo della Sintassi C-Style

```bash
#!/bin/bash

# Conteggio da 1 a 5
for ((i=1; i<=5; i++))
do
    echo "Conteggio: $i"
done

# Conteggio alla rovescia
for ((i=10; i>0; i--))
do
    echo "Conto alla rovescia: $i"
done

# Ciclo con incremento personalizzato
for ((i=0; i<=20; i+=5))
do
    echo "Valore: $i"
done
```

## Caratteristiche Avanzate

### Espansione di Comandi

Puoi utilizzare l'output di un comando come lista di elementi:

```bash
#!/bin/bash

# Iterazione su tutti gli utenti del sistema
for utente in $(cut -d: -f1 /etc/passwd)
do
    echo "Utente: $utente"
done

# Iterazione sui file modificati nelle ultime 24 ore
for file in $(find /path/to/dir -type f -mtime -1)
do
    echo "File recente: $file"
done
```

### Cicli Annidati

Puoi annidare cicli `for` per elaborare strutture di dati multidimensionali:

```bash
#!/bin/bash

# Tabella di moltiplicazione 5x5
for ((i=1; i<=5; i++))
do
    for ((j=1; j<=5; j++))
    do
        risultato=$((i * j))
        printf "%3d " $risultato
    done
    echo  # Nuova riga dopo ogni riga della tabella
done
```

### Controllo del Ciclo con break e continue

- `break`: Esce immediatamente dal ciclo
- `continue`: Salta all'iterazione successiva

```bash
#!/bin/bash

# Esempio di break
for numero in {1..10}
do
    echo "Numero: $numero"
    if [ $numero -eq 5 ]; then
        echo "Raggiunto 5, esco dal ciclo"
        break
    fi
done

# Esempio di continue
for numero in {1..10}
do
    # Salta i numeri pari
    if [ $((numero % 2)) -eq 0 ]; then
        continue
    fi
    echo "Numero dispari: $numero"
done
```

## Casi d'Uso Comuni

### Elaborazione di File in Batch

```bash
#!/bin/bash

# Converti tutti i file .jpg in .png
for immagine in *.jpg
do
    nome_base=${immagine%.jpg}
    echo "Conversione di $immagine in $nome_base.png"
    # convert "$immagine" "$nome_base.png"  # Richiede ImageMagick
done
```

### Backup di File

```bash
#!/bin/bash

# Backup di tutti i file di configurazione
for config in /etc/*.conf
do
    if [ -f "$config" ]; then
        echo "Backup di $config"
        cp "$config" "$config.bak"
    fi
done
```

### Monitoraggio di Sistema

```bash
#!/bin/bash

# Monitoraggio dell'uso della CPU ogni 5 secondi per 1 minuto
for ((i=1; i<=12; i++))
do
    echo "Lettura $i:"
    top -bn1 | head -n 20
    sleep 5
done
```

## Best Practices

1. **Usa le Virgolette**: Metti sempre le variabili tra virgolette per evitare problemi con spazi o caratteri speciali
   ```bash
   for file in *.txt; do echo "Elaborazione di \"$file\""; done
   ```

2. **Gestisci i Nomi File con Spazi**: Usa `IFS` (Internal Field Separator) per gestire correttamente i file con spazi
   ```bash
   IFS=$'\n'  # Imposta il separatore di campo a newline
   for file in $(find . -type f -name "*.txt")
   do
       echo "Elaborazione di \"$file\""
   done
   unset IFS  # Ripristina IFS al valore predefinito
   ```

3. **Evita Globbing Indesiderato**: Usa `shopt -s nullglob` per gestire il caso in cui nessun file corrisponde al pattern
   ```bash
   shopt -s nullglob
   for file in *.non_esistente
   do
       echo "$file"  # Non verrà eseguito se non ci sono file corrispondenti
   done
   shopt -u nullglob  # Ripristina l'impostazione predefinita
   ```

4. **Preferisci la Sintassi Appropriata**: Usa la sintassi tradizionale per iterare su liste di elementi e la sintassi C-style per conteggi numerici

5. **Controlla gli Errori**: Verifica sempre che le operazioni all'interno del ciclo siano andate a buon fine
   ```bash
   for file in *.txt
   do
       if ! grep -q "pattern" "$file"; then
           echo "Pattern non trovato in $file"
       fi
   done
   ```

## Limitazioni e Alternative

- I cicli `for` possono diventare inefficienti per set di dati molto grandi
- Per elaborazioni di testo complesse, considera l'uso di strumenti come `awk` o `sed`
- Per operazioni su file in parallelo, considera l'uso di `xargs` con l'opzione `-P`

## Esercizi Suggeriti

1. Scrivi uno script che calcoli la somma di tutti i numeri da 1 a N, dove N è fornito come argomento
2. Crea uno script che rinomini tutti i file .txt in una directory aggiungendo la data corrente al nome
3. Implementa un contatore di parole che analizzi tutti i file .txt in una directory e mostri il numero totale di parole

## Approfondimenti

- [Bash For Loop (Documentazione ufficiale)](https://www.gnu.org/software/bash/manual/html_node/Looping-Constructs.html)
- [Advanced Bash-Scripting Guide - Loops](https://tldp.org/LDP/abs/html/loops1.html)