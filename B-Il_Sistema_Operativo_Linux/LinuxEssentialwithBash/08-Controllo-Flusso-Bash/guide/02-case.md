# Il Costrutto case in Bash

## Introduzione

Il costrutto `case` in Bash è un'alternativa elegante e leggibile alle strutture `if-elif-else` quando si devono confrontare una variabile con diversi valori possibili. È particolarmente utile quando si hanno molte condizioni alternative basate sul valore di una singola variabile.

## Sintassi Base

```bash
case ESPRESSIONE in
    PATTERN1)
        COMANDI1
        ;;
    PATTERN2)
        COMANDI2
        ;;
    PATTERN3)
        COMANDI3
        ;;
    *)
        COMANDI_DEFAULT
        ;;
esac
```

Dove:
- `ESPRESSIONE` è la variabile o espressione da valutare
- `PATTERN1`, `PATTERN2`, ecc. sono i pattern da confrontare con l'espressione
- `COMANDI1`, `COMANDI2`, ecc. sono i comandi da eseguire se il pattern corrispondente corrisponde all'espressione
- `*` è il pattern di default che corrisponde a qualsiasi valore non catturato dai pattern precedenti
- `;;` indica la fine di un blocco di comandi
- `esac` ("case" al contrario) chiude il costrutto case

## Pattern Matching

I pattern in un costrutto `case` possono utilizzare diversi tipi di matching:

1. **Matching esatto**: `valore)`
2. **Wildcard**: `val*)`
3. **Pattern multipli**: `val1 | val2 | val3)`
4. **Intervalli di caratteri**: `[a-z])`
5. **Classi di caratteri**: `[[:alpha:]])`

## Esempi Pratici

### Esempio 1: Menu semplice

```bash
#!/bin/bash

echo "Seleziona un'opzione:"
echo "1. Visualizza data"
echo "2. Visualizza utenti connessi"
echo "3. Visualizza spazio su disco"
echo "q. Esci"

read -p "Scelta: " scelta

case $scelta in
    1)
        date
        ;;
    2)
        who
        ;;
    3)
        df -h
        ;;
    q|Q)
        echo "Arrivederci!"
        exit 0
        ;;
    *)
        echo "Opzione non valida!"
        ;;
esac
```

### Esempio 2: Gestione di argomenti da riga di comando

```bash
#!/bin/bash

# Script per gestire file di log

case $1 in
    --help|-h)
        echo "Uso: $0 [OPZIONE]"
        echo "Opzioni:"
        echo "  --help, -h     Mostra questo messaggio di aiuto"
        echo "  --list, -l     Elenca i file di log"
        echo "  --clean, -c    Pulisce i file di log più vecchi di 7 giorni"
        echo "  --view, -v FILE Visualizza il contenuto di un file di log"
        ;;
    --list|-l)
        echo "Elenco dei file di log:"
        ls -la /var/log/*.log 2>/dev/null
        ;;
    --clean|-c)
        echo "Pulizia dei file di log vecchi..."
        find /var/log -name "*.log" -type f -mtime +7 -exec echo {} \;
        echo "Fatto."
        ;;
    --view|-v)
        if [ -z "$2" ]; then
            echo "Errore: Specificare un file da visualizzare"
            exit 1
        elif [ -f "$2" ]; then
            less "$2"
        else
            echo "Errore: Il file $2 non esiste"
            exit 1
        fi
        ;;
    "")
        echo "Errore: Nessuna opzione specificata"
        echo "Usa '$0 --help' per visualizzare l'aiuto"
        exit 1
        ;;
    *)
        echo "Errore: Opzione non riconosciuta: $1"
        echo "Usa '$0 --help' per visualizzare l'aiuto"
        exit 1
        ;;
esac
```

### Esempio 3: Elaborazione basata sull'estensione del file

```bash
#!/bin/bash

# Script per elaborare file in base all'estensione

if [ $# -eq 0 ]; then
    echo "Errore: Specificare almeno un file"
    exit 1
fi

for file in "$@"; do
    if [ ! -f "$file" ]; then
        echo "Avviso: $file non è un file regolare, saltato."
        continue
    fi
    
    # Estrai l'estensione del file
    ext="${file##*.}"
    
    case $ext in
        txt|text|md)
            echo "$file: File di testo, conteggio parole:"
            wc -w "$file"
            ;;
        jpg|jpeg|png|gif)
            echo "$file: Immagine, dimensioni:"
            identify -format "%wx%h" "$file" 2>/dev/null || echo "Comando 'identify' non disponibile"
            ;;
        mp3|wav|ogg)
            echo "$file: File audio"
            ;;
        mp4|avi|mkv)
            echo "$file: File video"
            ;;
        sh)
            echo "$file: Script shell, verifico sintassi:"
            bash -n "$file" && echo "Sintassi OK" || echo "Errori di sintassi trovati"
            ;;
        *)
            echo "$file: Tipo di file non riconosciuto (estensione .$ext)"
            ;;
    esac
done
```

## Vantaggi del Costrutto case

1. **Leggibilità**: Rende il codice più chiaro e facile da leggere rispetto a lunghe catene di if-elif-else
2. **Manutenibilità**: Facilita l'aggiunta o la rimozione di nuovi casi
3. **Efficienza**: Può essere più efficiente di lunghe catene di if-elif-else
4. **Pattern matching avanzato**: Supporta pattern più complessi rispetto ai semplici confronti di uguaglianza

## Limitazioni

1. Può confrontare solo stringhe (non espressioni aritmetiche direttamente)
2. Non supporta operatori di confronto come `-eq`, `-lt`, ecc.
3. Non è adatto per condizioni complesse che coinvolgono più variabili

## Best Practices

1. Usa `case` quando hai molte alternative basate sul valore di una singola variabile
2. Includi sempre un caso di default (`*)`) per gestire input imprevisti
3. Organizza i casi in ordine logico, con i casi più comuni o importanti all'inizio
4. Usa commenti per spiegare casi complessi o non ovvi
5. Ricorda che i pattern sono sensibili alle maiuscole/minuscole, a meno che non usi pattern che le ignorano

## Compatibilità con Bash Moderno

Nelle versioni più recenti di Bash (4.0+), è possibile utilizzare `;&` invece di `;;` per far "cadere" l'esecuzione nel caso successivo, o `;;&` per continuare a valutare i casi successivi anche dopo una corrispondenza.

```bash
case $var in
    pattern1)
        echo "Pattern1 corrisponde"
        ;& # Esegue anche il caso successivo
    pattern2)
        echo "Pattern2 viene eseguito"
        ;;
    pattern3)
        echo "Pattern3 viene eseguito solo se corrisponde"
        ;;&  # Continua a valutare i casi successivi
    *)
        echo "Default viene eseguito se pattern3 corrisponde o se nessun altro pattern corrisponde"
        ;;
esac
```

## Esercizi Suggeriti

1. Scrivi uno script che accetti un carattere e determini se è una vocale, una consonante, un numero o un carattere speciale
2. Crea un semplice calcolatore che accetti due numeri e un operatore (+, -, *, /) usando `case`
3. Implementa un menu interattivo per un sistema di gestione file con opzioni per copiare, spostare, eliminare e visualizzare file

## Approfondimenti

- [Bash Case Statement (Documentazione ufficiale)](https://www.gnu.org/software/bash/manual/html_node/Conditional-Constructs.html#Conditional-Constructs)
- [Advanced Bash-Scripting Guide - Case Construct](https://tldp.org/LDP/abs/html/case-command.html)