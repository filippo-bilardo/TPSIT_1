# Esercizi: Variabili e Tipi di Dati in Bash

Questa serie di esercizi è progettata per aiutarti a comprendere e praticare l'uso delle variabili e dei tipi di dati in Bash. Completa gli esercizi nell'ordine indicato per consolidare le conoscenze acquisite nella guida teorica.

## Esercizio 1: Variabili e Stringhe

1. Crea un file chiamato `strings.sh`:
   ```bash
   nano strings.sh
   ```

2. Aggiungi il seguente contenuto:
   ```bash
   #!/bin/bash
   
   # Esercizio sulle variabili e stringhe
   
   # 1. Dichiara due variabili con il tuo nome e cognome
   nome=""
   cognome=""
   
   # 2. Crea una variabile nome_completo che concateni nome e cognome con uno spazio
   
   
   # 3. Stampa un messaggio di benvenuto che usi questa variabile
   
   
   # 4. Calcola e stampa la lunghezza del nome completo
   
   
   # 5. Estrai e stampa le prime 3 lettere del nome
   
   
   # 6. Converti e stampa il nome completo in maiuscolo (suggerimento: usa il comando tr)
   
   
   # 7. Sostituisci e stampa il tuo nome con "Sig." o "Sig.ra" mantenendo il cognome
   
   ```

3. Completa il codice inserendo le tue soluzioni per ciascun punto.

4. Rendi lo script eseguibile:
   ```bash
   chmod +x strings.sh
   ```

5. Esegui lo script:
   ```bash
   ./strings.sh
   ```

6. **Soluzione** (da consultare solo dopo aver provato):
   ```bash
   #!/bin/bash
   
   # Esercizio sulle variabili e stringhe
   
   # 1. Dichiara due variabili con il tuo nome e cognome
   nome="Mario"
   cognome="Rossi"
   
   # 2. Crea una variabile nome_completo che concateni nome e cognome con uno spazio
   nome_completo="$nome $cognome"
   
   # 3. Stampa un messaggio di benvenuto che usi questa variabile
   echo "Benvenuto, $nome_completo!"
   
   # 4. Calcola e stampa la lunghezza del nome completo
   lunghezza=${#nome_completo}
   echo "Il tuo nome completo ha $lunghezza caratteri"
   
   # 5. Estrai e stampa le prime 3 lettere del nome
   prime_lettere=${nome:0:3}
   echo "Le prime 3 lettere del tuo nome sono: $prime_lettere"
   
   # 6. Converti e stampa il nome completo in maiuscolo
   maiuscolo=$(echo "$nome_completo" | tr '[:lower:]' '[:upper:]')
   echo "In maiuscolo: $maiuscolo"
   
   # 7. Sostituisci e stampa il tuo nome con "Sig." o "Sig.ra" mantenendo il cognome
   saluto=${nome_completo/$nome/Sig.}
   echo "Forma formale: $saluto"
   ```

## Esercizio 2: Operazioni Aritmetiche

1. Crea un file chiamato `arithmetic.sh`:
   ```bash
   nano arithmetic.sh
   ```

2. Aggiungi il seguente contenuto:
   ```bash
   #!/bin/bash
   
   # Esercizio sulle operazioni aritmetiche
   
   # 1. Dichiara due variabili numeriche
   a=
   b=
   
   # 2. Esegui e stampa le quattro operazioni base
   
   
   # 3. Calcola e stampa il resto della divisione di a per b
   
   
   # 4. Calcola e stampa a elevato alla potenza di b
   
   
   # 5. Incrementa a di 1 e stampa il risultato
   
   
   # 6. Decrementa b di 1 e stampa il risultato
   
   
   # 7. Calcola l'area di un rettangolo con lati a e b
   
   
   # 8. Calcola e stampa la media di tre numeri: a, b e 10
   
   
   # Bonus: Calcola il risultato di una equazione più complessa: (a + b) * (a - b) / 2
   
   ```

3. Completa il codice inserendo le tue soluzioni per ciascun punto.

4. Rendi lo script eseguibile e testalo.

5. **Soluzione** (da consultare solo dopo aver provato):
   ```bash
   #!/bin/bash
   
   # Esercizio sulle operazioni aritmetiche
   
   # 1. Dichiara due variabili numeriche
   a=15
   b=4
   
   # 2. Esegui e stampa le quattro operazioni base
   echo "a = $a, b = $b"
   echo "Addizione: $a + $b = $((a + b))"
   echo "Sottrazione: $a - $b = $((a - b))"
   echo "Moltiplicazione: $a * $b = $((a * b))"
   echo "Divisione: $a / $b = $((a / b))"
   
   # 3. Calcola e stampa il resto della divisione di a per b
   resto=$((a % b))
   echo "Resto della divisione: $a % $b = $resto"
   
   # 4. Calcola e stampa a elevato alla potenza di b
   potenza=$((a ** b))
   echo "$a elevato a $b = $potenza"
   
   # 5. Incrementa a di 1 e stampa il risultato
   ((a++))
   echo "a incrementato = $a"
   
   # 6. Decrementa b di 1 e stampa il risultato
   ((b--))
   echo "b decrementato = $b"
   
   # 7. Calcola l'area di un rettangolo con lati a e b
   area=$((a * b))
   echo "L'area del rettangolo con lati $a e $b è: $area"
   
   # 8. Calcola e stampa la media di tre numeri: a, b e 10
   media=$(( (a + b + 10) / 3 ))
   echo "La media di $a, $b e 10 è: $media"
   
   # Bonus: Calcola il risultato di una equazione più complessa: (a + b) * (a - b) / 2
   risultato=$(( (a + b) * (a - b) / 2 ))
   echo "Il risultato di (a + b) * (a - b) / 2 = $risultato"
   ```

## Esercizio 3: Array e Manipolazione

1. Crea un file chiamato `arrays.sh`:
   ```bash
   nano arrays.sh
   ```

2. Aggiungi il seguente contenuto:
   ```bash
   #!/bin/bash
   
   # Esercizio sugli array
   
   # 1. Crea un array con i giorni della settimana
   
   
   # 2. Stampa il terzo giorno della settimana
   
   
   # 3. Stampa tutti i giorni
   
   
   # 4. Stampa il numero totale di giorni
   
   
   # 5. Aggiungi un elemento "Festivo" alla fine dell'array
   
   
   # 6. Modifica il valore del sesto elemento in "Weekend"
   
   
   # 7. Crea un sottoarray con solo i giorni lavorativi (da elemento 1 a 5) e stampalo
   
   
   # 8. Rimuovi l'elemento "Festivo" dall'array
   
   
   # 9. Crea un array associativo che mappi i giorni della settimana ai corrispondenti numeri
   # (es. Lunedì -> 1, Martedì -> 2, ecc.)
   
   
   # 10. Stampa il valore associato a "Mercoledì"
   
   ```

3. Completa il codice inserendo le tue soluzioni per ciascun punto.

4. Rendi lo script eseguibile e testalo.

5. **Soluzione** (da consultare solo dopo aver provato):
   ```bash
   #!/bin/bash
   
   # Esercizio sugli array
   
   # 1. Crea un array con i giorni della settimana
   giorni=("Lunedì" "Martedì" "Mercoledì" "Giovedì" "Venerdì" "Sabato" "Domenica")
   
   # 2. Stampa il terzo giorno della settimana
   echo "Il terzo giorno è: ${giorni[2]}"
   
   # 3. Stampa tutti i giorni
   echo "Tutti i giorni: ${giorni[@]}"
   
   # 4. Stampa il numero totale di giorni
   echo "Numero totale di giorni: ${#giorni[@]}"
   
   # 5. Aggiungi un elemento "Festivo" alla fine dell'array
   giorni+=("Festivo")
   echo "Array dopo l'aggiunta: ${giorni[@]}"
   
   # 6. Modifica il valore del sesto elemento in "Weekend"
   giorni[5]="Weekend"
   echo "Array dopo la modifica: ${giorni[@]}"
   
   # 7. Crea un sottoarray con solo i giorni lavorativi (da elemento 1 a 5) e stampalo
   giorni_lavorativi=("${giorni[@]:0:5}")
   echo "Giorni lavorativi: ${giorni_lavorativi[@]}"
   
   # 8. Rimuovi l'elemento "Festivo" dall'array
   unset giorni[7]  # Assumendo che "Festivo" sia all'indice 7
   echo "Array dopo la rimozione: ${giorni[@]}"
   
   # 9. Crea un array associativo che mappi i giorni della settimana ai corrispondenti numeri
   declare -A numeri_giorni
   numeri_giorni["Lunedì"]=1
   numeri_giorni["Martedì"]=2
   numeri_giorni["Mercoledì"]=3
   numeri_giorni["Giovedì"]=4
   numeri_giorni["Venerdì"]=5
   numeri_giorni["Sabato"]=6
   numeri_giorni["Domenica"]=7
   
   # 10. Stampa il valore associato a "Mercoledì"
   echo "Il numero associato a Mercoledì è: ${numeri_giorni["Mercoledì"]}"
   ```

## Esercizio 4: Sostituzione di Comandi e Espansione delle Variabili

1. Crea un file chiamato `expansion.sh`:
   ```bash
   nano expansion.sh
   ```

2. Aggiungi il seguente contenuto:
   ```bash
   #!/bin/bash
   
   # Esercizio sulla sostituzione di comandi e espansione delle variabili
   
   # 1. Crea una variabile che contenga la data corrente usando la sostituzione di comandi
   
   
   # 2. Crea una variabile che contenga l'elenco dei file nella directory corrente
   
   
   # 3. Calcola e memorizza il numero di file nella directory corrente
   
   
   # 4. Crea una variabile percorso con il percorso di un file inesistente
   
   
   # 5. Usa il parametro di default per dare un valore alternativo se il file non esiste
   # (usa la sintassi ${variabile:-default})
   
   
   # 6. Prendi un nome file dalla variabile percorso (usa il pattern matching per estrarre 
   # solo il nome del file senza il percorso)
   
   
   # 7. Estrai l'estensione del file dalla variabile percorso
   # (usa il pattern matching per estrarre solo l'estensione)
   
   
   # 8. Sostituisci l'estensione del file con ".backup"
   
   
   # 9. Crea una variabile chiamata "user_dir" che sia uguale alla
   # home directory dell'utente corrente
   
   
   # 10. Crea una variabile per memorizzare il nome dell'utente corrente
   # attraverso la sostituzione di comando
   
   
   # Stampa tutti i valori per verifica
   
   ```

3. Completa il codice inserendo le tue soluzioni per ciascun punto.

4. Rendi lo script eseguibile e testalo.

5. **Soluzione** (da consultare solo dopo aver provato):
   ```bash
   #!/bin/bash
   
   # Esercizio sulla sostituzione di comandi e espansione delle variabili
   
   # 1. Crea una variabile che contenga la data corrente usando la sostituzione di comandi
   data_corrente=$(date +"%Y-%m-%d")
   
   # 2. Crea una variabile che contenga l'elenco dei file nella directory corrente
   lista_file=$(ls -1)
   
   # 3. Calcola e memorizza il numero di file nella directory corrente
   numero_file=$(ls -1 | wc -l)
   
   # 4. Crea una variabile percorso con il percorso di un file inesistente
   percorso="/tmp/file_che_non_esiste.txt"
   
   # 5. Usa il parametro di default per dare un valore alternativo se il file non esiste
   # (usa la sintassi ${variabile:-default})
   contenuto_file=${$(cat "$percorso" 2>/dev/null):-"File non trovato"}
   
   # 6. Prendi un nome file dalla variabile percorso (usa il pattern matching per estrarre 
   # solo il nome del file senza il percorso)
   nome_file=${percorso##*/}
   
   # 7. Estrai l'estensione del file dalla variabile percorso
   # (usa il pattern matching per estrarre solo l'estensione)
   estensione=${percorso##*.}
   
   # 8. Sostituisci l'estensione del file con ".backup"
   nuovo_percorso=${percorso%.*}.backup
   
   # 9. Crea una variabile chiamata "user_dir" che sia uguale alla
   # home directory dell'utente corrente
   user_dir=$HOME
   
   # 10. Crea una variabile per memorizzare il nome dell'utente corrente
   # attraverso la sostituzione di comando
   nome_utente=$(whoami)
   
   # Stampa tutti i valori per verifica
   echo "Data corrente: $data_corrente"
   echo "Lista dei file:"
   echo "$lista_file"
   echo "Numero di file: $numero_file"
   echo "Percorso: $percorso"
   echo "Contenuto file: $contenuto_file"
   echo "Nome file: $nome_file"
   echo "Estensione: $estensione"
   echo "Nuovo percorso: $nuovo_percorso"
   echo "Directory utente: $user_dir"
   echo "Nome utente: $nome_utente"
   ```

## Esercizio 5: Script Completo - Gestore di File

1. Crea un file chiamato `file_manager.sh`:
   ```bash
   nano file_manager.sh
   ```

2. Questo script deve:
   - Accettare parametri dalla linea di comando per:
     - Operazione da eseguire (crea, elenco, rinomina, elimina)
     - Nome del file/directory
   - Utilizzare valori predefiniti in caso di parametri mancanti
   - Implementare controlli di errore con messaggi appropriati
   - Utilizzare array per memorizzare liste di file/directory
   - Usare variabili per memorizzare risultati intermedi

3. Aggiungi al file questo schema iniziale:
   ```bash
   #!/bin/bash
   
   # File Manager - Gestione file e directory
   
   # Colori per l'output
   RED='\033[0;31m'
   GREEN='\033[0;32m'
   YELLOW='\033[0;33m'
   RESET='\033[0m'
   
   # Operazione predefinita
   DEFAULT_OP="elenco"
   
   # Directory predefinita
   DEFAULT_DIR="."
   
   # Funzione di aiuto
   show_help() {
       echo "Uso: $0 operazione [nome]"
       echo
       echo "Operazioni disponibili:"
       echo "  crea [nome]     - Crea un nuovo file o directory"
       echo "  elenco [dir]    - Elenca i file in una directory"
       echo "  rinomina vecchio nuovo - Rinomina un file"
       echo "  elimina [nome]  - Elimina un file o directory"
       echo "  aiuto           - Mostra questo messaggio"
       echo
       echo "Esempi:"
       echo "  $0 crea mio_file.txt"
       echo "  $0 crea -d mia_directory"
       echo "  $0 elenco /tmp"
       echo "  $0 rinomina vecchio.txt nuovo.txt"
       echo "  $0 elimina file_da_eliminare.txt"
   }
   
   # Funzione per creare
   create_item() {
       # TODO: Implementa la funzione per creare file o directory
       # Il primo parametro è il nome
       # Se il secondo parametro è "-d", crea una directory invece di un file
   }
   
   # Funzione per elencare
   list_items() {
       # TODO: Implementa la funzione per elencare i file
       # Il primo parametro è la directory da esaminare
       # La funzione deve mostrare informazioni su ogni file trovato
       # Utilizza gli array per memorizzare le liste
   }
   
   # Funzione per rinominare
   rename_item() {
       # TODO: Implementa la funzione per rinominare file
       # Il primo parametro è il nome vecchio
       # Il secondo parametro è il nome nuovo
   }
   
   # Funzione per eliminare
   delete_item() {
       # TODO: Implementa la funzione per eliminare file
       # Il primo parametro è il nome del file da eliminare
       # Chiedi conferma prima di eliminare
   }
   
   # Menu principale
   main() {
       # TODO: Implementa la logica principale
       # Controlla i parametri e chiama la funzione appropriata
       # Usa valori predefiniti quando necessario
   }
   
   # Chiamata alla funzione principale
   main "$@"
   ```

4. Sviluppa l'implementazione completa dello script.

5. Rendi lo script eseguibile e testalo con vari comandi:
   ```bash
   chmod +x file_manager.sh
   ./file_manager.sh aiuto
   ./file_manager.sh crea test.txt
   ./file_manager.sh elenco
   ./file_manager.sh rinomina test.txt test_renamed.txt
   ./file_manager.sh elimina test_renamed.txt
   ```

6. **Soluzione** (da consultare solo dopo aver provato):
   La soluzione è complessa, troverai il file completo alla fine del modulo.

## Esercizio 6: Variabili Speciali e Debug

1. Crea un file chiamato `special_vars.sh`:
   ```bash
   nano special_vars.sh
   ```

2. Aggiungi il seguente contenuto:
   ```bash
   #!/bin/bash
   
   # Esercizio sulle variabili speciali
   
   # Attivare la modalità di debug
   set -x
   
   # Funzione di esempio
   test_function() {
       echo "Nome funzione: $FUNCNAME"
       echo "Primo argomento: $1"
       echo "Tutti gli argomenti: $@"
       echo "Numero argomenti: $#"
   }
   
   # Stampa informazioni sullo script
   echo "=== INFORMAZIONI SCRIPT ==="
   echo "Nome script: $0"
   echo "PID: $$"
   echo "Directory corrente: $PWD"
   echo "Home directory: $HOME"
   
   # Esegui un comando e verifica lo status
   echo "=== TEST COMANDI ==="
   ls /tmp
   echo "Exit status: $?"
   
   ls /directory_non_esistente 2>/dev/null
   echo "Exit status dopo errore: $?"
   
   # Chiama la funzione con argomenti
   echo "=== TEST FUNZIONE ==="
   test_function "primo" "secondo" "terzo"
   
   # Avvia un processo in background
   echo "=== PROCESSO BACKGROUND ==="
   sleep 2 &
   echo "PID ultimo processo background: $!"
   
   # Attendi la conclusione del processo
   wait
   
   # Disattiva debug
   set +x
   
   # Riassunto finale
   echo "=== RIASSUNTO FINALE ==="
   echo "Nome script: $0"
   echo "Directory script: ${0%/*}"
   echo "Linea comando: $0 $@"
   
   # Il tuo compito è eseguire questo script con vari argomenti
   # e studiare il comportamento delle variabili speciali.
   # Esegui:
   # 1. ./special_vars.sh
   # 2. ./special_vars.sh arg1 arg2
   # 3. ./special_vars.sh "argomento con spazi"
   ```

3. Rendi lo script eseguibile:
   ```bash
   chmod +x special_vars.sh
   ```

4. Esegui lo script con vari argomenti come suggerito e osserva l'output del debug.

5. Modifica lo script per aggiungere e testare altre variabili speciali di Bash.

## Verifica di Apprendimento

Rispondi alle seguenti domande:

1. Qual è la differenza tra le virgolette singole e doppie in Bash?
2. Come si accede all'ultimo carattere di una stringa in Bash?
3. Come si può calcolare la lunghezza di un array in Bash?
4. Spiega la differenza tra `$@` e `$*` nell'accesso agli argomenti.
5. Come puoi assegnare un valore predefinito a una variabile se questa non è definita?
6. Qual è la differenza tra `$()` e le backticks per la sostituzione di comandi?
7. Come si può convertire una stringa in maiuscolo o minuscolo in Bash?
8. Cosa fa l'espressione `${variabile##*.}`?
9. Come si può incrementare il valore di una variabile numerica in Bash?
10. Qual è il significato della variabile speciale `$?`?

---

**Soluzione all'Esercizio 5 (file_manager.sh)**:

```bash
#!/bin/bash

# File Manager - Gestione file e directory

# Colori per l'output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
RESET='\033[0m'

# Operazione predefinita
DEFAULT_OP="elenco"

# Directory predefinita
DEFAULT_DIR="."

# Funzione di aiuto
show_help() {
    echo "Uso: $0 operazione [nome]"
    echo
    echo "Operazioni disponibili:"
    echo "  crea [nome]     - Crea un nuovo file o directory"
    echo "  elenco [dir]    - Elenca i file in una directory"
    echo "  rinomina vecchio nuovo - Rinomina un file"
    echo "  elimina [nome]  - Elimina un file o directory"
    echo "  aiuto           - Mostra questo messaggio"
    echo
    echo "Esempi:"
    echo "  $0 crea mio_file.txt"
    echo "  $0 crea -d mia_directory"
    echo "  $0 elenco /tmp"
    echo "  $0 rinomina vecchio.txt nuovo.txt"
    echo "  $0 elimina file_da_eliminare.txt"
}

# Funzione per creare
create_item() {
    local name=$1
    local is_dir=$2
    
    if [ -z "$name" ]; then
        echo -e "${RED}Errore: Nome file/directory mancante${RESET}"
        echo "Uso: $0 crea [-d] <nome>"
        return 1
    fi
    
    if [ -e "$name" ]; then
        echo -e "${RED}Errore: '$name' esiste già${RESET}"
        return 1
    fi
    
    if [ "$is_dir" = "-d" ]; then
        mkdir -p "$name"
        if [ $? -eq 0 ]; then
            echo -e "${GREEN}Directory '$name' creata con successo${RESET}"
        else
            echo -e "${RED}Errore nella creazione della directory '$name'${RESET}"
            return 1
        fi
    else
        touch "$name"
        if [ $? -eq 0 ]; then
            echo -e "${GREEN}File '$name' creato con successo${RESET}"
        else
            echo -e "${RED}Errore nella creazione del file '$name'${RESET}"
            return 1
        fi
    fi
    
    return 0
}

# Funzione per elencare
list_items() {
    local dir=${1:-$DEFAULT_DIR}
    
    if [ ! -d "$dir" ]; then
        echo -e "${RED}Errore: La directory '$dir' non esiste${RESET}"
        return 1
    fi
    
    echo -e "${YELLOW}Contenuto della directory '$dir':${RESET}"
    
    # Array per diversi tipi di file
    files=()
    directories=()
    others=()
    
    # Popola gli array
    while IFS= read -r item; do
        if [ -f "$item" ]; then
            files+=("$item")
        elif [ -d "$item" ]; then
            directories+=("$item")
        else
            others+=("$item")
        fi
    done < <(find "$dir" -maxdepth 1 -mindepth 1 | sort)
    
    # Mostra directory
    if [ ${#directories[@]} -gt 0 ]; then
        echo -e "\n${YELLOW}Directory:${RESET}"
        for d in "${directories[@]}"; do
            name=$(basename "$d")
            echo -e " 📁 ${GREEN}$name${RESET}"
        done
    fi
    
    # Mostra file
    if [ ${#files[@]} -gt 0 ]; then
        echo -e "\n${YELLOW}File:${RESET}"
        for f in "${files[@]}"; do
            name=$(basename "$f")
            size=$(du -h "$f" | cut -f1)
            last_mod=$(stat -c %y "$f" | cut -d. -f1)
            echo -e " 📄 $name - ${size} - $last_mod"
        done
    fi
    
    # Mostra altri
    if [ ${#others[@]} -gt 0 ]; then
        echo -e "\n${YELLOW}Altri:${RESET}"
        for o in "${others[@]}"; do
            name=$(basename "$o")
            echo -e " ❓ $name"
        done
    fi
    
    # Mostra sommario
    total_items=$((${#directories[@]} + ${#files[@]} + ${#others[@]}))
    echo -e "\n${YELLOW}Totale: $total_items elementi (${#directories[@]} directory, ${#files[@]} file, ${#others[@]} altri)${RESET}"
    
    return 0
}

# Funzione per rinominare
rename_item() {
    local old_name=$1
    local new_name=$2
    
    if [ -z "$old_name" ] || [ -z "$new_name" ]; then
        echo -e "${RED}Errore: Nome file/directory mancante${RESET}"
        echo "Uso: $0 rinomina <vecchio_nome> <nuovo_nome>"
        return 1
    fi
    
    if [ ! -e "$old_name" ]; then
        echo -e "${RED}Errore: '$old_name' non esiste${RESET}"
        return 1
    fi
    
    if [ -e "$new_name" ]; then
        echo -e "${RED}Errore: '$new_name' esiste già${RESET}"
        return 1
    fi
    
    mv "$old_name" "$new_name"
    if [ $? -eq 0 ]; then
        echo -e "${GREEN}'$old_name' rinominato in '$new_name' con successo${RESET}"
    else
        echo -e "${RED}Errore durante la rinomina${RESET}"
        return 1
    fi
    
    return 0
}

# Funzione per eliminare
delete_item() {
    local name=$1
    
    if [ -z "$name" ]; then
        echo -e "${RED}Errore: Nome file/directory mancante${RESET}"
        echo "Uso: $0 elimina <nome>"
        return 1
    fi
    
    if [ ! -e "$name" ]; then
        echo -e "${RED}Errore: '$name' non esiste${RESET}"
        return 1
    fi
    
    # Chiedi conferma
    read -p "Sei sicuro di voler eliminare '$name'? (s/n): " confirm
    if [[ ! "$confirm" =~ ^[Ss]$ ]]; then
        echo -e "${YELLOW}Operazione annullata${RESET}"
        return 0
    fi
    
    if [ -d "$name" ]; then
        # Directory
        rm -r "$name"
        if [ $? -eq 0 ]; then
            echo -e "${GREEN}Directory '$name' eliminata con successo${RESET}"
        else
            echo -e "${RED}Errore durante l'eliminazione della directory${RESET}"
            return 1
        fi
    else
        # File o altro
        rm "$name"
        if [ $? -eq 0 ]; then
            echo -e "${GREEN}File '$name' eliminato con successo${RESET}"
        else
            echo -e "${RED}Errore durante l'eliminazione del file${RESET}"
            return 1
        fi
    fi
    
    return 0
}

# Menu principale
main() {
    local operation=${1:-$DEFAULT_OP}
    
    case "$operation" in
        crea)
            shift
            # Controlla se il primo argomento è -d (directory)
            if [ "$1" = "-d" ]; then
                create_item "$2" "-d"
            else
                create_item "$1" ""
            fi
            ;;
        elenco)
            shift
            list_items "$1"
            ;;
        rinomina)
            shift
            rename_item "$1" "$2"
            ;;
        elimina)
            shift
            delete_item "$1"
            ;;
        aiuto|help|--help|-h)
            show_help
            ;;
        *)
            echo -e "${RED}Errore: Operazione '$operation' non riconosciuta${RESET}"
            show_help
            exit 1
            ;;
    esac
}

# Chiamata alla funzione principale
main "$@"
```
