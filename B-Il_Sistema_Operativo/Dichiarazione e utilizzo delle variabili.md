# 7.1 Dichiarazione e utilizzo delle variabili

Le variabili rappresentano uno dei concetti fondamentali nella programmazione, e Bash non fa eccezione. Possiamo considerare una variabile come un contenitore che memorizza un valore, permettendoci di utilizzarlo più volte nel nostro script o di modificarlo durante l'esecuzione. Questo meccanismo è particolarmente potente perché ci consente di scrivere script dinamici e adattabili a contesti diversi.

## Dichiarazione di variabili in Bash

A differenza di molti linguaggi di programmazione, Bash non richiede una dichiarazione esplicita del tipo di variabile. Ogni variabile in Bash è considerata, in linea di principio, una stringa di testo. La sintassi per dichiarare una variabile è estremamente semplice:

```bash
nome_variabile=valore
```

È fondamentale notare che **non ci devono essere spazi** né prima né dopo il segno di uguale. Questa è una delle regole sintattiche più importanti da ricordare, poiché rappresenta spesso una fonte di errori per i principianti:

```bash
# Corretto
età=42

# Errato - causerà un errore
età = 42
```

Per convenzione, i nomi delle variabili in Bash sono generalmente scritti in minuscolo o utilizzando la convenzione `snake_case`. I nomi possono contenere lettere, numeri e underscore, ma non possono iniziare con un numero. È inoltre consigliabile evitare l'uso di caratteri speciali o accentati nei nomi delle variabili.

## Accesso al valore di una variabile

Per accedere al valore di una variabile, è necessario anteporre il simbolo del dollaro `$` al nome della variabile stessa. Questo indica a Bash che desideriamo il valore contenuto nella variabile, non il suo nome:

```bash
#!/bin/bash

nome="Mario Rossi"
echo "Benvenuto, $nome!"
```

Questo script produrrà l'output:
```
Benvenuto, Mario Rossi!
```

Esistono due principali sintassi per l'espansione delle variabili:

1. **Forma semplice**: `$nome_variabile`
2. **Forma con parentesi graffe**: `${nome_variabile}`

La seconda forma è particolarmente utile quando si desidera concatenare il valore di una variabile con altro testo senza spazi intermedi, o quando si utilizzano espansioni di variabili più complesse:

```bash
#!/bin/bash

nome="Mario"
echo "Benvenuto, ${nome}!"  # Funziona come la forma semplice
echo "${nome}Rossi"         # Concatenazione diretta senza spazi
```

L'output sarà:
```
Benvenuto, Mario!
MarioRossi
```

Senza le parentesi graffe, nel secondo caso Bash cercherebbe una variabile chiamata `nomeRossi`, che presumibilmente non esiste.

## Tipi di variabili in Bash

Sebbene Bash tratti tutte le variabili come stringhe, è possibile utilizzarle per memorizzare diversi tipi di dati:

### Stringhe

Le stringhe possono essere racchiuse tra apici singoli, doppi o anche senza apici:

```bash
nome1="Mario Rossi"     # Apici doppi
nome2='Luigi Verdi'     # Apici singoli
nome3=Giovanni_Bianchi  # Senza apici (solo per stringhe senza spazi)
```

La differenza principale tra apici singoli e doppi è che:
- Gli apici singoli (`'`) preservano il valore letterale di ogni carattere
- Gli apici doppi (`"`) permettono l'espansione delle variabili all'interno

```bash
#!/bin/bash

nome="Mario"
echo "Ciao $nome"   # Stampa: Ciao Mario
echo 'Ciao $nome'   # Stampa: Ciao $nome (letteralmente)
```

### Numeri

I numeri in Bash sono anch'essi memorizzati come stringhe, ma possono essere utilizzati in operazioni aritmetiche:

```bash
#!/bin/bash

età=42
anno_nascita=$((2025 - $età))
echo "Se hai $età anni, sei nato presumibilmente nel $anno_nascita"
```

Per le operazioni aritmetiche, Bash offre diverse sintassi:
- Doppia parentesi: `$(( espressione ))`
- Comando `let`: `let "risultato = 5 + 3"`
- Comando `expr`: `risultato=$(expr 5 + 3)`

La sintassi con la doppia parentesi è la più moderna e consigliata.

### Array

Bash supporta anche gli array, che permettono di memorizzare più valori in una singola variabile:

```bash
#!/bin/bash

# Dichiarazione di un array
colori=("rosso" "verde" "blu" "giallo")

# Accesso a un elemento dell'array (gli indici partono da 0)
echo "Il primo colore è ${colori[0]}"

# Numero di elementi nell'array
echo "Ci sono ${#colori[@]} colori"

# Tutti gli elementi dell'array
echo "I colori sono: ${colori[@]}"
```

Gli array in Bash sono molto potenti e verranno trattati più in dettaglio nella sezione 7.3.

## Variabili locali e globali

Per default, le variabili in Bash sono globali all'interno dello script. Tuttavia, all'interno di una funzione, è possibile dichiarare variabili locali con la parola chiave `local`:

```bash
#!/bin/bash

nome="Globale"

funzione_esempio() {
    local nome="Locale"
    echo "All'interno della funzione: $nome"
}

echo "Prima della funzione: $nome"
funzione_esempio
echo "Dopo la funzione: $nome"
```

L'output sarà:
```
Prima della funzione: Globale
All'interno della funzione: Locale
Dopo la funzione: Globale
```

L'uso di variabili locali è una buona pratica perché aiuta a evitare conflitti di nomi e rende le funzioni più indipendenti e riutilizzabili.

## Constanti in Bash

Bash non ha un vero e proprio concetto di costante, ma possiamo simulare questo comportamento utilizzando il comando `readonly`:

```bash
#!/bin/bash

readonly PI=3.14159
echo "Il valore di Pi è $PI"

# Il seguente tentativo di modifica genererà un errore
PI=3.14
```

L'errore generato sarà simile a:
```
line 6: PI: readonly variable
```

È una buona pratica dichiarare come `readonly` le variabili che non dovrebbero cambiare durante l'esecuzione dello script, e per convenzione i loro nomi sono spesso scritti in maiuscolo.

---

## Espansione indiretta delle variabili

Il punto esclamativo `!` all'interno delle parentesi graffe `{}` in Bash è utilizzato per l'espansione indiretta delle variabili. Questo meccanismo consente di ottenere il valore di una variabile il cui nome è memorizzato in un'altra variabile.

L'espansione indiretta è utile quando hai bisogno di accedere dinamicamente a variabili il cui nome è determinato a runtime.

### Esempio

```bash
#!/bin/bash

# Dichiarazione di variabili
nome_variabile="saluto"
saluto="Ciao, mondo!"

# Utilizzo dell'espansione indiretta per ottenere il valore di 'saluto'
valore_indiretto=${!nome_variabile}
echo "Valore indiretto: $valore_indiretto"
```

**Output:**
```
Valore indiretto: Ciao, mondo!
```

### Spiegazione

- `${!nome_variabile}`: Il punto esclamativo `!` indica a Bash di eseguire un'espansione indiretta. Invece di restituire il valore di `nome_variabile`, Bash restituisce il valore della variabile il cui nome è memorizzato in `nome_variabile`.
- In questo caso, `nome_variabile` contiene la stringa `"saluto"`, quindi `${!nome_variabile}` restituisce il valore della variabile `saluto`, che è `"Ciao, mondo!"`.

### Utilizzo pratico

L'espansione indiretta è utile in scenari in cui devi lavorare con variabili dinamiche, come quando leggi nomi di variabili da un file o da un input utente e devi accedere ai loro valori.

### Note

- L'espansione indiretta richiede che la variabile di riferimento (`saluto` nell'esempio) sia già definita nel contesto in cui viene utilizzata.
- È una funzionalità avanzata e può essere utile in script complessi dove la flessibilità nell'accesso alle variabili è necessaria.

---

## Espansione con valori predefiniti

L'espansione con valori predefiniti in Bash ti permette di specificare un valore di fallback che verrà utilizzato se una variabile non è impostata o è vuota. Questo è utile per evitare errori e garantire che una variabile abbia sempre un valore valido.

### Sintassi di base

La sintassi per l'espansione con valori predefiniti è la seguente:

```bash
${variabile:-valore_predefinito}
```

### Esempio 1: Variabile non impostata

```bash
#!/bin/bash

# Variabile non impostata
echo "Valore di variabile non impostata: ${variabile:-valore_predefinito}"
```

**Output:**
```
Valore di variabile non impostata: valore_predefinito
```

### Spiegazione

- `${variabile:-valore_predefinito}`: Se `variabile` non è impostata o è vuota, viene utilizzato `valore_predefinito`.

### Esempio 2: Variabile impostata

```bash
#!/bin/bash

# Variabile impostata
variabile="valore_effettivo"
echo "Valore di variabile impostata: ${variabile:-valore_predefinito}"
```

**Output:**
```
Valore di variabile impostata: valore_effettivo
```

### Spiegazione

- In questo caso, poiché `variabile` è impostata con un valore, viene utilizzato `valore_effettivo` invece di `valore_predefinito`.

### Utilizzo pratico

L'espansione con valori predefiniti è utile in script dove vuoi garantire che una variabile abbia sempre un valore valido, anche se non è stata impostata dall'utente o da un altro processo.

### Note

- Puoi utilizzare questa tecnica per impostare valori di default per variabili di configurazione, argomenti di script, o qualsiasi altra situazione in cui un valore predefinito è desiderabile.
- È una pratica comune negli script di shell per migliorare la robustezza e la manutenibilità del codice.

--- 
## Esempi pratici

Vediamo ora un esempio completo che utilizza diversi tipi di variabili per calcolare il costo totale di un acquisto:

```bash
#!/bin/bash

# Dati dell'articolo
nome_articolo="Laptop XPS 13"
prezzo_unitario=1200
quantità=2
aliquota_iva=22

# Calcoli
imponibile=$((prezzo_unitario * quantità))
iva=$((imponibile * aliquota_iva / 100))
totale=$((imponibile + iva))

# Output
echo "Dettagli acquisto:"
echo "------------------"
echo "Articolo: $nome_articolo"
echo "Prezzo unitario: €$prezzo_unitario"
echo "Quantità: $quantità"
echo "Imponibile: €$imponibile"
echo "IVA (${aliquota_iva}%): €$iva"
echo "Totale: €$totale"
```

Questo script produce un output simile a:
```
Dettagli acquisto:
------------------
Articolo: Laptop XPS 13
Prezzo unitario: €1200
Quantità: 2
Imponibile: €2400
IVA (22%): €528
Totale: €2928
```

## Best practices

Ecco alcune buone pratiche da seguire quando si lavora con le variabili in Bash:

1. **Usa nomi significativi** - Nomi come `x`, `y`, `tmp` non sono descrittivi; preferisci nomi come `contatore_righe`, `nome_utente`, etc.

2. **Inizializza sempre le variabili** - Questo aiuta a prevenire comportamenti inaspettati quando si accede a variabili non definite.

3. **Usa le parentesi graffe** - Adotta l'abitudine di usare `${variabile}` anziché `$variabile` per evitare problemi di espansione.

4. **Racchiudi le variabili tra virgolette** - Quando usi una variabile in un comando, spesso è saggio racchiuderla tra virgolette doppie: `echo "${nome}"`. Questo previene problemi con valori contenenti spazi o caratteri speciali.

5. **Usa variabili locali nelle funzioni** - Questo aiuta a evitare effetti collaterali indesiderati.

6. **Dichiara le costanti come readonly** - Per i valori che non dovrebbero cambiare, usa `readonly`.

7. **Considera l'uso di uppercase per le costanti** - Per convenzione, le costanti vengono spesso scritte in maiuscolo: `readonly MAX_TENTATIVI=3`.

## Verificare l'esistenza di una variabile

A volte è necessario verificare se una variabile è stata definita prima di utilizzarla. Bash offre diversi modi per farlo:

```bash
#!/bin/bash

# Verifica se la variabile nome esiste
if [ -z "${nome+set}" ]; then
    echo "La variabile nome non è impostata"
else
    echo "La variabile nome è impostata a: $nome"
fi

# In alternativa, usando la sintassi di sostituzione di parametri
echo "${nome:-La variabile nome non è impostata}"
```

La sintassi `${nome:-valore_default}` restituisce il valore della variabile se è definita, altrimenti restituisce `valore_default`.

## Esercizi proposti

1. Scrivi uno script che chieda all'utente il suo nome e cognome, li memorizzi in variabili separate e poi visualizzi un messaggio di benvenuto personalizzato.

2. Crea uno script che utilizzi variabili per calcolare l'area e il perimetro di un rettangolo. Le dimensioni dovrebbero essere definite all'inizio dello script.

3. Modifica lo script del calcolo del costo totale dell'esempio precedente per includere uno sconto del 10% se l'imponibile supera €2000.

4. Scrivi uno script che utilizzi una variabile di tipo array per memorizzare i nomi dei giorni della settimana e poi li visualizzi uno per riga.

5. Crea uno script che utilizzi variabili readonly per memorizzare informazioni di configurazione (come percorsi di file o nomi di utenti) e poi le utilizzi per eseguire operazioni di base sul sistema.

---
