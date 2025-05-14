#!/bin/bash

# Esempio di utilizzo del costrutto case in Bash
# Questo script dimostra vari modi di utilizzare il costrutto case

# 1. Esempio base: menu semplice
echo "=== Esempio 1: Menu semplice ==="
echo "Seleziona un'opzione:"
echo "a. Visualizza data"
echo "b. Visualizza ora"
echo "c. Visualizza calendario"
echo "q. Esci"

read -p "Scelta: " opzione

case $opzione in
    a|A) # Pattern multiplo: accetta sia 'a' che 'A'
        echo "Data attuale:"
        date +"%d/%m/%Y"
        ;;
    b|B)
        echo "Ora attuale:"
        date +"%H:%M:%S"
        ;;
    c|C)
        echo "Calendario del mese corrente:"
        cal
        ;;
    q|Q)
        echo "Hai scelto di uscire."
        ;;
    *) # Pattern di default: corrisponde a qualsiasi input non gestito sopra
        echo "Opzione non valida: $opzione"
        ;;
esac

# 2. Esempio con pattern di glob
echo -e "\n=== Esempio 2: Pattern di glob ==="
frutto="mela"

echo "Frutto: $frutto"
case $frutto in
    mela)
        echo "Le mele sono rosse o verdi."
        ;;
    banana)
        echo "Le banane sono gialle."
        ;;
    ar*) # Pattern con wildcard: corrisponde a qualsiasi stringa che inizia con 'ar'
        echo "Frutto che inizia con 'ar'."
        ;;
    *cia) # Pattern con wildcard: corrisponde a qualsiasi stringa che finisce con 'cia'
        echo "Frutto che finisce con 'cia'."
        ;;
    ????) # Pattern con wildcard: corrisponde a qualsiasi stringa di 4 caratteri
        echo "Nome del frutto composto da 4 lettere."
        ;;
    *)
        echo "Frutto non riconosciuto."
        ;;
esac

# 3. Esempio con intervalli di caratteri
echo -e "\n=== Esempio 3: Intervalli di caratteri ==="
read -p "Inserisci un carattere: " carattere

case $carattere in
    [aeiouAEIOU])
        echo "'$carattere' è una vocale."
        ;;
    [0-9])
        echo "'$carattere' è un numero."
        ;;
    [a-zA-Z])
        echo "'$carattere' è una consonante."
        ;;
    [[:punct:]])
        echo "'$carattere' è un segno di punteggiatura."
        ;;
    *)
        echo "'$carattere' è un altro tipo di carattere o più di un carattere."
        ;;
esac

# 4. Esempio di elaborazione di argomenti da riga di comando
echo -e "\n=== Esempio 4: Elaborazione argomenti ==="
echo "Questo esempio simula l'elaborazione di argomenti da riga di comando."
echo "Uso: ./script.sh [--help|--version|--file NOME_FILE]"

# Simuliamo un argomento passato
argomento="--file"
file="documento.txt"

echo "Argomento: $argomento $file"

case $argomento in
    --help|-h)
        echo "Mostra l'aiuto dello script."
        ;;
    --version|-v)
        echo "Versione 1.0"
        ;;
    --file|-f)
        if [ -z "$file" ]; then
            echo "Errore: Nome file mancante dopo --file"
        else
            echo "Elaborazione del file: $file"
        fi
        ;;
    "")
        echo "Nessun argomento specificato."
        ;;
    *)
        echo "Argomento non riconosciuto: $argomento"
        echo "Usa --help per visualizzare l'aiuto."
        ;;
esac

# 5. Esempio con fall-through (richiede Bash 4.0+)
echo -e "\n=== Esempio 5: Fall-through (;&) e continue (;;&) ==="
echo "Nota: Questo esempio funziona solo con Bash 4.0 o superiore."

giorno="lunedì"
echo "Giorno: $giorno"

case $giorno in
    lunedì)
        echo "È l'inizio della settimana lavorativa."
        ;& # Fall-through: esegue anche il caso successivo
    martedì|mercoledì|giovedì)
        echo "È un giorno lavorativo."
        ;;
    venerdì)
        echo "È l'ultimo giorno lavorativo della settimana."
        ;;& # Continue: continua a valutare i casi successivi
    sabato|domenica)
        echo "È weekend!"
        ;;
    *)
        echo "Giorno non valido."
        ;;
esac

echo -e "\nEsempi completati!"