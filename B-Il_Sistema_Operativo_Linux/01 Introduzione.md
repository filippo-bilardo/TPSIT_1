# Introduzione al linguaggio di scripting Bash

## Storia delle Shell

### Le origini: Unix e le prime shell

La storia delle shell inizia con lo sviluppo del sistema operativo Unix nei primi anni '70 presso i Bell Labs di AT&T. La prima shell Unix, sviluppata da Ken Thompson nel 1971, era conosciuta semplicemente come "Thompson shell" o "sh". Questa shell primitiva offriva funzionalità basilari per l'esecuzione di comandi e la gestione di processi.

La vera evoluzione iniziò con la **Bourne Shell** (sh), sviluppata da Stephen Bourne nel 1977. Questa shell introdusse molti concetti fondamentali ancora in uso oggi:
- Variabili d'ambiente
- Controllo di flusso (if/then/else)
- Cicli (for, while)
- Funzioni

Negli anni successivi, altre shell importanti furono sviluppate:

- **C Shell** (csh): Creata da Bill Joy all'Università di California, Berkeley nel 1978. Introdusse una sintassi simile al linguaggio C e funzionalità come l'history dei comandi e gli alias.

- **Korn Shell** (ksh): Sviluppata da David Korn nei Bell Labs nel 1982. Combinava la compatibilità con la Bourne Shell e le funzionalità interattive della C Shell, aggiungendo anche l'editing della linea di comando.

- **TENEX C Shell** (tcsh): Un'estensione della C Shell con miglioramenti nell'interfaccia utente e nella completamento dei comandi.

### La nascita di Bash

La **Bourne Again SHell** (Bash) fu creata da Brian Fox nel 1989 come parte del Progetto GNU della Free Software Foundation. Il nome "Bash" è un gioco di parole che fa riferimento sia alla Bourne Shell (da cui deriva) sia al concetto di "rinascita" (born again).

Bash fu progettata per essere un'implementazione libera e migliorata della Bourne Shell, combinando le migliori caratteristiche delle shell precedenti:

- Compatibilità con la sintassi della Bourne Shell
- Editing avanzato della linea di comando (dalla Korn Shell)
- History dei comandi e alias (dalla C Shell)
- Nuove funzionalità originali

Dal 1992, lo sviluppo di Bash è stato guidato principalmente da Chet Ramey. Nel corso degli anni, Bash è diventata la shell predefinita per la maggior parte delle distribuzioni Linux e per macOS (fino a Catalina).

### Evoluzione e diffusione

Bash ha continuato a evolversi attraverso numerose versioni, aggiungendo funzionalità come:

- Completamento programmabile
- Array associativi
- Funzioni di manipolazione delle stringhe
- Aritmetica intera
- Supporto per espressioni regolari

Con l'ascesa di Linux negli anni '90 e 2000, Bash è diventata la shell più diffusa nel mondo Unix-like. Anche con l'introduzione di shell più moderne come Zsh e Fish, Bash rimane lo standard de facto per lo scripting di shell.

## Caratteristiche fondamentali di Bash

### Cos'è Bash?

Bash (Bourne Again SHell) è sia un interprete di comandi che un linguaggio di scripting. Come interprete, fornisce un'interfaccia testuale attraverso la quale gli utenti possono interagire con il sistema operativo. Come linguaggio di scripting, permette di automatizzare compiti complessi attraverso script eseguibili.

### Vantaggi di Bash

- **Universalità**: Disponibile praticamente su ogni sistema Unix-like
- **Potenza**: Accesso diretto alle funzionalità del sistema operativo
- **Integrazione**: Facile combinazione con altri strumenti Unix
- **Semplicità**: Curva di apprendimento relativamente dolce per operazioni basilari

### Limitazioni di Bash

- **Performance**: Non ottimale per calcoli intensivi o manipolazione complessa di dati
- **Tipizzazione**: Sistema di tipi limitato rispetto a linguaggi di programmazione moderni
- **Portabilità**: Alcuni script potrebbero richiedere modifiche per funzionare su sistemi diversi
- **Debugging**: Strumenti di debug meno sofisticati rispetto ad altri linguaggi

## Concetti base dello scripting Bash

### Struttura di uno script Bash

Uno script Bash è un file di testo che contiene una serie di comandi che vengono eseguiti in sequenza. Il file inizia tipicamente con uno "shebang" che indica l'interprete da utilizzare:

```bash
#!/bin/bash

# Questo è un commento
echo "Hello, World!"
```

### Esecuzione di uno script

Per eseguire uno script Bash, è necessario renderlo eseguibile e poi invocarlo:

```bash
chmod +x myscript.sh  # Rende lo script eseguibile
./myscript.sh         # Esegue lo script
```

Alternativamente, è possibile eseguire lo script specificando l'interprete:

```bash
bash myscript.sh
```

### Variabili

Le variabili in Bash non richiedono dichiarazione esplicita del tipo:

```bash
# Assegnazione di variabili
nome="Mondo"
numero=42

# Utilizzo di variabili
echo "Ciao, $nome!"
echo "Il numero è ${numero}"
```

### Variabili speciali

Bash fornisce diverse variabili speciali:

- `$0`: Nome dello script
- `$1`, `$2`, ...: Argomenti posizionali
- `$#`: Numero di argomenti
- `$@`: Tutti gli argomenti come array
- `$?`: Codice di uscita dell'ultimo comando
- `$$`: PID del processo corrente

### Input e output

```bash
# Output su standard output
echo "Questo è un messaggio"

# Input da standard input
echo "Come ti chiami?"
read nome
echo "Ciao, $nome!"

# Redirezione
echo "Log message" > file.log     # Sovrascrive file.log
echo "Another log" >> file.log    # Appende a file.log
wc -l < file.log                  # Input da file
```

### Strutture di controllo

#### Condizionali

```bash
# If-else
if [ $numero -gt 10 ]; then
    echo "Il numero è maggiore di 10"
elif [ $numero -eq 10 ]; then
    echo "Il numero è uguale a 10"
else
    echo "Il numero è minore di 10"
fi

# Case
case $frutto in
    "mela")
        echo "Hai scelto una mela"
        ;;
    "banana"|"ananas")
        echo "Hai scelto un frutto tropicale"
        ;;
    *)
        echo "Frutto non riconosciuto"
        ;;
esac
```

#### Cicli

```bash
# For loop
for i in 1 2 3 4 5; do
    echo "Numero: $i"
done

# While loop
count=1
while [ $count -le 5 ]; do
    echo "Conteggio: $count"
    ((count++))
done

# Until loop
count=5
until [ $count -le 0 ]; do
    echo "Conto alla rovescia: $count"
    ((count--))
done
```

### Funzioni

```bash
# Definizione di funzione
saluta() {
    local nome="$1"  # Variabile locale
    echo "Ciao, $nome!"
}

# Chiamata di funzione
saluta "Mario"
```

## Strumenti e tecniche avanzate

### Manipolazione di testo

Bash offre potenti strumenti per la manipolazione di testo, spesso utilizzati in combinazione con comandi Unix come `grep`, `sed` e `awk`:

```bash
# Ricerca di pattern con grep
grep "errore" log.txt

# Sostituzione di testo con sed
sed 's/vecchio/nuovo/g' file.txt

# Elaborazione di dati strutturati con awk
awk '{print $1, $3}' dati.csv
```

### Espressioni regolari

Bash supporta espressioni regolari per pattern matching avanzato:

```bash
if [[ $stringa =~ ^[0-9]+$ ]]; then
    echo "La stringa contiene solo numeri"
fi
```

### Gestione degli errori

```bash
# Uscita in caso di errore
set -e  # Lo script termina se un comando restituisce un codice di errore

# Gestione personalizzata degli errori
comando || { echo "Errore: comando fallito"; exit 1; }

# Trap per gestire segnali
trap "echo 'Script interrotto'; exit 1" SIGINT SIGTERM
```

## Best Practices

1. **Documentare il codice**: Utilizzare commenti per spiegare il funzionamento dello script
2. **Gestire gli errori**: Controllare sempre i codici di ritorno dei comandi
3. **Validare gli input**: Non fidarsi mai degli input esterni senza validarli
4. **Utilizzare variabili locali**: Limitare lo scope delle variabili nelle funzioni
5. **Evitare hardcoding**: Utilizzare variabili per valori che potrebbero cambiare
6. **Modularizzare**: Dividere script complessi in funzioni riutilizzabili
7. **Testare**: Verificare lo script con diversi input e condizioni

## Conclusioni

Bash è uno strumento potente e versatile che continua a essere fondamentale nell'ecosistema Unix/Linux. La sua combinazione di semplicità, potenza e ubiquità lo rende uno strumento essenziale per amministratori di sistema, sviluppatori e utenti avanzati.

Nonostante l'emergere di alternative più moderne, la conoscenza di Bash rimane una competenza preziosa che offre un controllo diretto e flessibile sul sistema operativo, permettendo di automatizzare attività ripetitive e costruire soluzioni personalizzate per problemi complessi.

---

## Risorse utili

- **Documentazione ufficiale**: [GNU Bash Manual](https://www.gnu.org/software/bash/manual/)
- **Guide online**: [Bash Guide for Beginners](https://tldp.org/LDP/Bash-Beginners-Guide/html/)
- **Riferimento avanzato**: [Advanced Bash-Scripting Guide](https://tldp.org/LDP/abs/html/)
- **Strumenti di debug**: [ShellCheck](https://www.shellcheck.net/)