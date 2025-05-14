# Guida Approfondita: Variabili e Tipi di Dati in Bash

Questa guida espande in dettaglio il funzionamento delle variabili, dei tipi di dati e delle operazioni correlate nello scripting Bash. Imparerai a dichiarare, assegnare, utilizzare e manipolare variabili, comprendere il loro scope, e conoscere le variabili speciali e i parametri posizionali.

## 1. Dichiarazione e Assegnazione di Variabili

In Bash, le variabili vengono create al momento della loro prima assegnazione. Non è richiesta una dichiarazione formale del tipo.

**Sintassi:**
```bash
nome_variabile=valore
```

**Punti Chiave:**
-   Nessuno spazio attorno al segno `=`.
-   Se il `valore` contiene spazi o caratteri speciali, deve essere racchiuso tra virgolette (singole `' '` o doppie `" "`).
    -   **Virgolette doppie (`""`)**: Permettono l'espansione delle variabili (es. `"Ciao $utente"`) e l'interpretazione di alcuni caratteri di escape (es. `"\n"` con `echo -e`).
    -   **Virgolette singole (`''`)**: Trattano tutto il contenuto letteralmente, senza espansione di variabili o interpretazione di escape.

**Esempi:**
```bash
#!/bin/bash

messaggio_semplice="Ciao Mondo"
numero=42
percorso_file='/home/utente/documenti/report.txt'
utente_corrente="$USER"

echo "Messaggio: $messaggio_semplice"
echo "Numero: $numero"
echo "Percorso: $percorso_file"
echo "Utente: $utente_corrente"

# Esempio con spazi
titolo_corso="Linux Essential with Bash"
echo "Stai seguendo il corso: $titolo_corso"

# Differenza tra virgolette
planeta="Terra"
echo "Pianeta: $planeta" # Espande la variabile
echo 'Pianeta: $planeta' # Non espande la variabile
```

## 2. Scope delle Variabili: Locali e Globali

-   **Variabili Globali (o d'Ambiente)**: Sono accessibili in tutto lo script e anche nei sottoprocessi avviati dallo script (se esportate con `export`). Le variabili d'ambiente del sistema (es. `HOME`, `PATH`, `USER`) sono globali per natura.
    ```bash
    #!/bin/bash
    VAR_GLOBALE="Sono accessibile ovunque in questo script"
    export VAR_ESPORTATA="Sono accessibile anche nei sottoprocessi"

    echo "Globale: $VAR_GLOBALE"
    bash ./altro_script.sh # altro_script.sh potrà accedere a VAR_ESPORTATA
    ```

-   **Variabili Locali**: Sono definite all'interno di una funzione usando la keyword `local`. Il loro scope è limitato alla funzione in cui sono dichiarate. Se una variabile con lo stesso nome di una globale viene dichiarata `local` in una funzione, la versione locale "nasconde" quella globale all'interno della funzione.
    ```bash
    #!/bin/bash
    nome="Globale"

    mia_funzione() {
      local nome="Locale"
      echo "Dentro la funzione, nome è: $nome"
    }

    echo "Prima della funzione, nome è: $nome"
    mia_funzione
    echo "Dopo la funzione, nome è: $nome"
    # Output:
    # Prima della funzione, nome è: Globale
    # Dentro la funzione, nome è: Locale
    # Dopo la funzione, nome è: Globale
    ```

## 3. Tipi di Dati

Bash non ha un sistema di tipi rigoroso come altri linguaggi. Fondamentalmente, **tutte le variabili sono trattate come stringhe**. Tuttavia, Bash può interpretare il contenuto di una variabile come un numero quando viene utilizzata in un contesto aritmetico.

-   **Stringhe**: Sequenze di caratteri.
-   **Numeri**: Se una stringa contiene solo cifre, può essere usata in operazioni aritmetiche.

## 4. Parametri Posizionali

Quando si esegue uno script, è possibile passargli argomenti dalla riga di comando. Questi argomenti sono accessibili all'interno dello script tramite i parametri posizionali:

-   `$0`: Nome dello script stesso.
-   `$1`: Primo argomento.
-   `$2`: Secondo argomento.
-   ...e così via fino a `$9`.
-   `${10}`, `${11}`, ...: Per argomenti oltre il nono, usare le parentesi graffe.

**Esempio (`parametri.sh`):**
```bash
#!/bin/bash
echo "Nome dello script: $0"
echo "Primo argomento: $1"
echo "Secondo argomento: $2"
echo "Terzo argomento: $3"
```
Esecuzione: `./parametri.sh mela pera banana`
Output:
```
Nome dello script: ./parametri.sh
Primo argomento: mela
Secondo argomento: pera
Terzo argomento: banana
```

## 5. Variabili Speciali di Bash

Bash fornisce diverse variabili speciali che contengono informazioni utili sullo stato dello script e del sistema:

-   `$?`: Codice di uscita (exit status) dell'ultimo comando eseguito. `0` indica successo, un valore diverso da `0` indica un errore.
-   `$#`: Numero di argomenti passati allo script (esclusi `$0`).
-   `$*`: Tutti gli argomenti passati allo script, visti come una singola stringa (separati dal primo carattere di `IFS`, di solito uno spazio).
-   `$@`: Tutti gli argomenti passati allo script, visti come parole separate. Quando racchiuso tra doppie virgolette (`"$@"`), espande ogni argomento come una stringa separata, preservando gli spazi negli argomenti.
-   `$$`: ID del processo (PID) della shell corrente (dello script in esecuzione).
-   `$!`: PID dell'ultimo comando eseguito in background.
-   `$_`: Ultimo argomento del comando precedente.
-   `$LINENO`: Numero di riga corrente nello script.
-   `$FUNCNAME`: Nome della funzione corrente (se all'interno di una funzione).

**Esempio:**
```bash
#!/bin/bash
ls /non_esiste
echo "Exit status di ls: $?"

echo "Numero di argomenti: $#"
echo "Argomenti come stringa unica (\$*): $*"
echo "Argomenti come parole separate (\$@): $@"

for arg in "$@"; do # "$@" è spesso preferito per iterare sugli argomenti
  echo "Argomento: $arg"
done

echo "PID dello script: $$"
```

## 6. Espansione delle Variabili (`${variabile}`)

L'uso delle parentesi graffe `${variabile}` è una forma più robusta e versatile per accedere al valore di una variabile. È obbligatorio quando il nome della variabile è seguito da caratteri che potrebbero essere interpretati come parte del nome (es. `${variabile}_suffisso`). Offre anche molte funzionalità avanzate:

-   **Valore di default se non impostata o nulla:**
    -   `${variabile:-valore_default}`: Usa `valore_default` se `variabile` è non impostata o nulla, ma non assegna `valore_default` a `variabile`.
    -   `${variabile:=valore_default}`: Usa `valore_default` se `variabile` è non impostata o nulla, E ASSEGNA `valore_default` a `variabile`.
-   **Messaggio di errore se non impostata o nulla:**
    -   `${variabile:?messaggio_errore}`: Se `variabile` è non impostata o nulla, stampa `messaggio_errore` su stderr ed esce dallo script.
-   **Lunghezza della variabile:**
    -   `${#variabile}`: Restituisce la lunghezza della stringa contenuta in `variabile`.
-   **Rimozione di pattern (prefissi/suffissi):**
    -   `${variabile#pattern}`: Rimuove la più corta corrispondenza di `pattern` dall'inizio.
    -   `${variabile##pattern}`: Rimuove la più lunga corrispondenza di `pattern` dall'inizio.
    -   `${variabile%pattern}`: Rimuove la più corta corrispondenza di `pattern` dalla fine.
    -   `${variabile%%pattern}`: Rimuove la più lunga corrispondenza di `pattern` dalla fine.
-   **Sostituzione di pattern:**
    -   `${variabile/pattern/sostituzione}`: Sostituisce la prima corrispondenza di `pattern` con `sostituzione`.
    -   `${variabile//pattern/sostituzione}`: Sostituisce tutte le corrispondenze di `pattern` con `sostituzione`.

**Esempio:**
```bash
#!/bin/bash

email="utente@esempio.com"
echo "Username: ${email%@*}" # utente
echo "Dominio: ${email#*@}"  # esempio.com

nome_file="documento.backup.txt"
echo "Senza estensione .txt: ${nome_file%.txt}" # documento.backup
echo "Solo nome base: ${nome_file%%.*}"      # documento

frase="amo il bash scripting"
echo "${frase/bash/Bash}" # amo il Bash scripting

# Valore di default
# unset utente_non_definito
echo "Utente: ${utente_non_definito:-'guest'}" # Utente: guest
echo "Valore di utente_non_definito: $utente_non_definito" # Ancora non definito

echo "Nuovo utente: ${nuovo_utente:='admin'}" # Nuovo utente: admin
echo "Valore di nuovo_utente: $nuovo_utente"   # admin

echo "Lunghezza di 'frase': ${#frase}" # 21
```

## 7. Sostituzione di Comandi

Permette di catturare l'output di un comando e assegnarlo a una variabile o usarlo come parte di un altro comando.

-   **Sintassi moderna (preferita): `$(comando)`**
-   **Sintassi legacy (backticks): `` `comando` ``** (meno leggibile e problematica con l'annidamento)

**Esempio:**
```bash
#!/bin/bash

data_corrente=$(date +%Y-%m-%d)
echo "Oggi è il: $data_corrente"

lista_file=$(ls -l)
echo "Elenco file:
$lista_file"

# Annidamento (più facile con $())
info_kernel=$(uname -r)
versione_kernel_completa="Kernel: $(echo $info_kernel | cut -d'-' -f1)"
echo $versione_kernel_completa
```

## 8. Operazioni Aritmetiche

Bash offre diversi modi per eseguire calcoli matematici su interi.

-   **Espansione Aritmetica: `$((espressione))` (preferita)**
    -   Sintassi chiara e supporta operatori standard (+, -, *, /, %, **, ++, --, ecc.).
    -   Le variabili all'interno di `$(( ))` non necessitano del prefisso `$`.
    ```bash
    #!/bin/bash
    a=10
    b=5
    somma=$((a + b))
    echo "Somma: $somma" # Somma: 15

    prodotto=$((a * b))
    echo "Prodotto: $prodotto" # Prodotto: 50

    ((a++)) # Incrementa a
    echo "Nuovo valore di a: $a" # Nuovo valore di a: 11
    ```

-   **Comando `let`**
    -   Simile a `$(( ))` ma è un comando a sé stante.
    -   Le variabili non necessitano del `$`.
    ```bash
    #!/bin/bash
    x=20
    y=3
    let risultato="x / y" # Divisione intera
    echo "Risultato di x / y: $risultato" # Risultato di x / y: 6

    let x+=5 # Equivalente a x = x + 5
    echo "x dopo incremento: $x" # x dopo incremento: 25
    ```

-   **Comando `expr` (più datato)**
    -   Meno intuitivo, richiede spazi tra operatori e operandi, e alcuni operatori devono essere escapati.
    ```bash
    #!/bin/bash
    val1=7
    val2=8
    ris_expr=$(expr $val1 \* $val2) # Notare lo spazio e l'escape per *
    echo "Prodotto con expr: $ris_expr" # Prodotto con expr: 56
    ```

**Nota**: Bash gestisce nativamente solo aritmetica intera. Per operazioni con numeri in virgola mobile, si usano utility esterne come `bc` o `awk`.

## 9. Stringhe: Concatenazione, Lunghezza, Sottostringhe

-   **Concatenazione**: Avviene semplicemente mettendo le variabili o stringhe una accanto all'altra.
    ```bash
    str1="Ciao"
    str2="Mondo"
    saluto="$str1 $str2!" # Aggiunge uno spazio tra le due
    echo $saluto # Ciao Mondo!

    saluto_diretto="$str1$str2"
echo $saluto_diretto # CiaoMondo
    ```

-   **Lunghezza**: Già vista con `${#variabile}`.
    ```bash
    testo="Bash è potente"
    echo "Lunghezza: ${#testo}" # Lunghezza: 14
    ```

-   **Sottostringhe (Substring Extraction)**: Usando l'espansione `${variabile:offset:lunghezza}`.
    -   `offset`: Posizione di inizio (0-indexed).
    -   `lunghezza` (opzionale): Numero di caratteri da estrarre.
    ```bash
    #!/bin/bash
    stringa_lunga="abcdefghijklmnopqrstuvwxyz"
    sottostringa1=${stringa_lunga:0:5} # Primi 5 caratteri
    echo "Sottostringa 1: $sottostringa1" # abcde

    sottostringa2=${stringa_lunga:10:3}
    echo "Sottostringa 2: $sottostringa2" # klm

    sottostringa3=${stringa_lunga:20} # Dall'offset fino alla fine
    echo "Sottostringa 3: $sottostringa3" # uvwxyz

    # Offset negativo (conta dalla fine, richiede spazio prima dei duepunti o parentesi)
    sottostringa4=${stringa_lunga: -4} # Ultimi 4 caratteri
    echo "Sottostringa 4: $sottostringa4" # wxyz

    sottostringa5=${stringa_lunga: -6:3} # 3 caratteri partendo dal sesto dalla fine
    echo "Sottostringa 5: $sottostringa5" # uvw
    ```

## 10. Array (Cenni)

Bash supporta array indicizzati (numerici) e array associativi (stringhe come indici, da Bash 4.0+).

-   **Array Indicizzati**:
    ```bash
    #!/bin/bash
    # Dichiarazione
    frutti=("Mela" "Pera" "Banana" "Arancia")
    # Oppure
    # frutti[0]="Mela"
    # frutti[1]="Pera"

    # Accesso a un elemento (0-indexed)
    echo "Primo frutto: ${frutti[0]}"  # Mela
    echo "Terzo frutto: ${frutti[2]}"  # Banana

    # Accesso a tutti gli elementi
    echo "Tutti i frutti: ${frutti[@]}" # Mela Pera Banana Arancia
    # Oppure ${frutti[*]} (con differenze sottili quando tra virgolette)

    # Numero di elementi
    echo "Numero di frutti: ${#frutti[@]}"

    # Iterare su un array
    for frutto in "${frutti[@]}"; do
      echo "Frutto corrente: $frutto"
    done
    ```

-   **Array Associativi (Bash 4.0+)**:
    Devono essere dichiarati esplicitamente con `declare -A`.
    ```bash
    #!/bin/bash
    declare -A capitali

    capitali["Italia"]="Roma"
    capitali["Francia"]="Parigi"
    capitali["Germania"]="Berlino"

    echo "Capitale d'Italia: ${capitali[Italia]}"

    echo "Tutte le capitali: ${capitali[@]}"
    echo "Tutte le nazioni (indici): ${!capitali[@]}"

    for nazione in "${!capitali[@]}"; do
      echo "La capitale di $nazione è ${capitali[$nazione]}"
    done
    ```

## Consigli e Buone Pratiche

-   **Nomi Significativi**: Usa nomi di variabili che descrivano il loro contenuto o scopo.
-   **Virgolette**: Usa sempre doppie virgolette attorno alle espansioni di variabili (`"$variabile"`) per prevenire problemi di word splitting e globbing, specialmente se il valore può contenere spazi.
-   **Parentesi Graffe**: Preferisci `${variabile}` rispetto a `$variabile` per chiarezza e per evitare ambiguità, specialmente quando la variabile è seguita da altri caratteri.
-   **`local` nelle Funzioni**: Dichiara sempre le variabili locali alle funzioni con `local` per evitare di sovrascrivere accidentalmente variabili globali.
-   **Scegli lo Strumento Giusto**: Per operazioni aritmetiche complesse o in virgola mobile, considera `bc` o `awk`.

Questa guida copre gli aspetti fondamentali delle variabili e dei tipi di dati in Bash. La sperimentazione e la pratica sono essenziali per padroneggiare questi concetti.