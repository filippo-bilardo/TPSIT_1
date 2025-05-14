# Esercizi sui Costrutti Condizionali in Bash

Questi esercizi ti aiuteranno a praticare l'uso dei costrutti condizionali `if-elif-else-fi` in Bash. Gli esercizi sono organizzati in ordine di difficoltà crescente.

## Esercizio 1: Verifica Numero Pari o Dispari

**Obiettivo**: Scrivi uno script che accetti un numero come argomento e determini se è pari o dispari.

**Requisiti**:
- Lo script deve accettare un numero come argomento da riga di comando
- Deve verificare se il numero è pari o dispari usando l'operatore modulo (`%`)
- Deve stampare un messaggio appropriato

**Suggerimento**: In Bash, puoi usare `$(( numero % 2 ))` per calcolare il resto della divisione per 2.

**Esempio di soluzione**:
```bash
#!/bin/bash

# Verifica se è stato fornito un argomento
if [ $# -eq 0 ]; then
    echo "Errore: Fornisci un numero come argomento."
    exit 1
fi

numero=$1

# Verifica se l'input è un numero
if ! [[ $numero =~ ^[0-9]+$ ]]; then
    echo "Errore: '$numero' non è un numero valido."
    exit 1
fi

# Verifica se il numero è pari o dispari
if (( numero % 2 == 0 )); then
    echo "$numero è un numero pari."
else
    echo "$numero è un numero dispari."
fi
```

## Esercizio 2: Calcolatore Semplice

**Obiettivo**: Crea un calcolatore a riga di comando che accetti due numeri e un operatore.

**Requisiti**:
- Lo script deve accettare tre argomenti: numero1 operatore numero2
- Gli operatori supportati devono essere: +, -, *, / e %
- Deve gestire gli errori (divisione per zero, operatore non valido, ecc.)
- Deve mostrare il risultato dell'operazione

**Suggerimento**: Usa un costrutto `case` per gestire i diversi operatori.

**Esempio di soluzione parziale**:
```bash
#!/bin/bash

# Verifica se sono stati forniti tutti gli argomenti necessari
if [ $# -ne 3 ]; then
    echo "Uso: $0 numero1 operatore numero2"
    echo "Operatori supportati: +, -, *, /, %"
    exit 1
fi

num1=$1
operatore=$2
num2=$3

# Verifica se gli input sono numeri validi
if ! [[ $num1 =~ ^[0-9]+$ ]] || ! [[ $num2 =~ ^[0-9]+$ ]]; then
    echo "Errore: Gli argomenti devono essere numeri."
    exit 1
fi

# Esegui l'operazione richiesta
case $operatore in
    "+")
        risultato=$(( num1 + num2 ))
        ;;
    "-")
        risultato=$(( num1 - num2 ))
        ;;
    "*")
        risultato=$(( num1 * num2 ))
        ;;
    "/")
        # Gestisci la divisione per zero
        if [ $num2 -eq 0 ]; then
            echo "Errore: Divisione per zero non consentita."
            exit 1
        fi
        risultato=$(( num1 / num2 ))
        ;;
    "%")
        # Gestisci il modulo per zero
        if [ $num2 -eq 0 ]; then
            echo "Errore: Modulo per zero non consentito."
            exit 1
        fi
        risultato=$(( num1 % num2 ))
        ;;
    *)
        echo "Errore: Operatore '$operatore' non supportato."
        echo "Operatori supportati: +, -, *, /, %"
        exit 1
        ;;
esac

echo "$num1 $operatore $num2 = $risultato"
```

## Esercizio 3: Verifica File e Directory

**Obiettivo**: Scrivi uno script che analizzi un percorso fornito dall'utente e fornisca informazioni dettagliate.

**Requisiti**:
- Lo script deve accettare un percorso come argomento
- Deve verificare se il percorso esiste
- Se esiste, deve determinare se è un file o una directory
- Se è un file, deve mostrare dimensione, permessi e data di ultima modifica
- Se è una directory, deve contare quanti file contiene

**Suggerimento**: Usa i test condizionali per file (`-f`, `-d`, ecc.) e comandi come `stat`, `ls` e `wc`.

**Esempio di soluzione parziale**:
```bash
#!/bin/bash

# Verifica se è stato fornito un argomento
if [ $# -eq 0 ]; then
    echo "Errore: Fornisci un percorso come argomento."
    exit 1
fi

percorso=$1

# Verifica se il percorso esiste
if [ ! -e "$percorso" ]; then
    echo "Errore: Il percorso '$percorso' non esiste."
    exit 1
fi

# Verifica se è un file o una directory
if [ -f "$percorso" ]; then
    echo "'$percorso' è un file regolare."
    echo "Dimensione: $(stat -c %s "$percorso") byte"
    echo "Permessi: $(stat -c %A "$percorso")"
    echo "Ultima modifica: $(stat -c %y "$percorso")"
    
    # Verifica se il file è eseguibile
    if [ -x "$percorso" ]; then
        echo "Il file è eseguibile."
    fi
elif [ -d "$percorso" ]; then
    echo "'$percorso' è una directory."
    num_files=$(ls -la "$percorso" | grep -v ^d | wc -l)
    # Sottrai 1 per escludere la riga 'total' nell'output di ls
    num_files=$((num_files - 1))
    echo "Contiene $num_files file (inclusi i file nascosti)."
    
    # Verifica se la directory è scrivibile
    if [ -w "$percorso" ]; then
        echo "La directory è scrivibile."
    else
        echo "La directory non è scrivibile."
    fi
else
    echo "'$percorso' esiste ma non è né un file regolare né una directory."
    echo "Potrebbe essere un link simbolico o un file speciale."
fi
```

## Esercizio 4: Analizzatore di Log (Avanzato)

**Obiettivo**: Crea uno script che analizzi un file di log e generi un report basato su criteri specifici.

**Requisiti**:
- Lo script deve accettare un file di log come argomento
- Deve contare quante righe contengono errori (parola "ERROR")
- Deve contare quante righe contengono avvisi (parola "WARNING")
- Deve identificare l'ora in cui si è verificato il maggior numero di errori
- Deve generare un report con queste informazioni

**Suggerimento**: Usa comandi come `grep`, `wc`, `awk` e `sort` in combinazione con i costrutti condizionali.

**Esempio di file di log**:
```
2023-10-01 08:15:23 INFO Sistema avviato
2023-10-01 08:16:45 WARNING Spazio su disco inferiore al 20%
2023-10-01 08:17:12 ERROR Impossibile connettersi al database
2023-10-01 08:17:30 ERROR Timeout della connessione
2023-10-01 09:22:15 WARNING Tentativo di accesso non autorizzato
2023-10-01 10:45:23 ERROR Errore di autenticazione
```

**Sfida aggiuntiva**: Estendi lo script per generare un grafico ASCII che mostri la distribuzione degli errori per ora.

## Esercizio 5: Menu Interattivo (Avanzato)

**Obiettivo**: Crea un menu interattivo a riga di comando che offra diverse funzionalità di sistema.

**Requisiti**:
- Lo script deve mostrare un menu con almeno 5 opzioni
- Le opzioni devono includere: informazioni di sistema, spazio su disco, processi attivi, utenti connessi e uscita
- Deve gestire input non validi
- Deve tornare al menu principale dopo ogni operazione (tranne per l'uscita)

**Suggerimento**: Usa un ciclo `while` con un costrutto `case` per gestire le diverse opzioni del menu.

**Esempio di soluzione parziale**:
```bash
#!/bin/bash

# Funzione per mostrare il menu
mostra_menu() {
    clear
    echo "===== MENU DI SISTEMA ====="
    echo "1. Informazioni di sistema"
    echo "2. Spazio su disco"
    echo "3. Processi attivi"
    echo "4. Utenti connessi"
    echo "5. Uscita"
    echo "==========================="
    echo -n "Seleziona un'opzione (1-5): "
}

# Funzione per le informazioni di sistema
info_sistema() {
    echo "\n===== INFORMAZIONI DI SISTEMA ====="
    echo "Sistema operativo: $(uname -s)"
    echo "Versione kernel: $(uname -r)"
    echo "Architettura: $(uname -m)"
    echo "Nome host: $(hostname)"
    echo
    read -p "Premi Enter per continuare..."
}

# Funzione per lo spazio su disco
spazio_disco() {
    echo "\n===== SPAZIO SU DISCO ====="
    df -h
    echo
    read -p "Premi Enter per continuare..."
}

# Funzione per i processi attivi
processi_attivi() {
    echo "\n===== PROCESSI ATTIVI ====="
    echo "Top 10 processi per utilizzo CPU:"
    ps aux --sort=-%cpu | head -11
    echo
    read -p "Premi Enter per continuare..."
}

# Funzione per gli utenti connessi
utenti_connessi() {
    echo "\n===== UTENTI CONNESSI ====="
    who
    echo
    read -p "Premi Enter per continuare..."
}

# Loop principale del menu
while true; do
    mostra_menu
    read scelta
    
    case $scelta in
        1)
            info_sistema
            ;;
        2)
            spazio_disco
            ;;
        3)
            processi_attivi
            ;;
        4)
            utenti_connessi
            ;;
        5)
            echo "\nArrivederci!"
            exit 0
            ;;
        *)
            echo "\nErrore: Opzione non valida. Seleziona un'opzione da 1 a 5."
            read -p "Premi Enter per continuare..."
            ;;
    esac
done
```

## Suggerimenti per l'Apprendimento

1. **Inizia dai più semplici**: Completa gli esercizi nell'ordine proposto
2. **Sperimenta**: Modifica gli script per aggiungere funzionalità o migliorare la gestione degli errori
3. **Consulta la documentazione**: Usa `man bash` o la documentazione online per approfondire i concetti
4. **Debugging**: Usa `set -x` all'inizio dello script per vedere come viene eseguito passo dopo passo
5. **Condividi**: Confronta le tue soluzioni con quelle di altri per imparare approcci diversi

Buon lavoro!