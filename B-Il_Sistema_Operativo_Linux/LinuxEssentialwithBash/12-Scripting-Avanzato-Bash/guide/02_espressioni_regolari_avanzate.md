# Guida alle Espressioni Regolari Avanzate

## Introduzione

Le espressioni regolari (regex) sono uno strumento potentissimo per la manipolazione e l'analisi del testo. Questa guida approfondisce gli aspetti avanzati delle regex, fornendo esempi pratici e tecniche per risolvere problemi complessi di elaborazione del testo.

## Tecniche Avanzate di Pattern Matching

### Lookahead e Lookbehind

Queste tecniche permettono di verificare se un pattern è seguito o preceduto da un altro pattern, senza includere quest'ultimo nella corrispondenza.

#### Lookahead Positivo (?=pattern)

Verifica che il pattern specificato segua la posizione corrente, senza includerlo nella corrispondenza.

```bash
# Trova tutte le parole seguite da un numero
grep -P '\w+(?=\s+\d+)' file.txt
```

#### Lookahead Negativo (?!pattern)

Verifica che il pattern specificato NON segua la posizione corrente.

```bash
# Trova tutte le parole NON seguite da un numero
grep -P '\w+(?!\s+\d+)' file.txt
```

#### Lookbehind Positivo (?<=pattern)

Verifica che il pattern specificato preceda la posizione corrente, senza includerlo nella corrispondenza.

```bash
# Trova tutti i numeri preceduti da 'ID:'
grep -P '(?<=ID:\s)\d+' file.txt
```

#### Lookbehind Negativo (?<!pattern)

Verifica che il pattern specificato NON preceda la posizione corrente.

```bash
# Trova tutti i numeri NON preceduti da 'ID:'
grep -P '(?<!ID:\s)\d+' file.txt
```

### Gruppi di Cattura Nominati

I gruppi di cattura nominati permettono di assegnare nomi ai gruppi per un riferimento più chiaro.

```bash
# Estrazione di data con gruppi nominati (richiede grep con PCRE)
grep -P '(?P<giorno>\d{2})-(?P<mese>\d{2})-(?P<anno>\d{4})' file.txt
```

### Pattern Ricorsivi

Alcune implementazioni avanzate di regex supportano pattern ricorsivi, utili per analizzare strutture annidate come parentesi o tag HTML.

```bash
# Trova testo tra parentesi, anche annidate (richiede PCRE)
grep -P '\((?:[^()]|(?R))*\)' file.txt
```

## Ottimizzazione delle Espressioni Regolari

### Tecniche di Ottimizzazione

1. **Ancoraggio**: Usa `^` e `$` quando possibile per limitare la ricerca.
2. **Evita il backtracking eccessivo**: Limita l'uso di `.*` e preferisci `.*?` (non greedy).
3. **Usa classi di caratteri specifiche**: `[0-9]` è più efficiente di `\d` in alcune implementazioni.
4. **Evita gruppi di cattura non necessari**: Usa `(?:pattern)` invece di `(pattern)` quando non hai bisogno di catturare.

### Esempio di Ottimizzazione

Espressione non ottimizzata:
```regex
.*<title>(.*)</title>.*
```

Espressione ottimizzata:
```regex
^.*?<title>([^<]*)</title>.*$
```

## Debugging di Espressioni Regolari

### Strumenti di Debugging

1. **Siti web**: regex101.com, regexr.com per testare e visualizzare il funzionamento delle regex.
2. **Strumenti a riga di comando**:
   ```bash
   # Usa l'opzione -o per vedere solo le corrispondenze
   grep -o 'pattern' file.txt
   
   # Usa l'opzione -n per vedere i numeri di riga
   grep -n 'pattern' file.txt
   ```

### Tecniche di Debugging

1. **Divide et impera**: Scomponi espressioni complesse in parti più semplici e testale separatamente.
2. **Test incrementale**: Inizia con un pattern semplice e aggiungi complessità gradualmente.
3. **Usa commenti**: In implementazioni avanzate, puoi usare `(?#commento)` per documentare parti complesse.

## Casi d'Uso Avanzati

### Validazione di Formati Complessi

#### Validazione di un URL
```regex
^(https?|ftp)://[\w-]+(\.[\w-]+)+([\w.,@?^=%&:/~+#-]*[\w@?^=%&/~+#-])?$
```

#### Validazione di un Indirizzo IPv4
```regex
^(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$
```

#### Validazione di un Codice Fiscale Italiano
```regex
^[A-Z]{6}\d{2}[A-Z]\d{2}[A-Z]\d{3}[A-Z]$
```

### Estrazione e Trasformazione di Dati Strutturati

#### Estrazione di Dati da Log
```bash
# Estrai timestamp, livello di log e messaggio
grep -P '^(?P<timestamp>\d{4}-\d{2}-\d{2} \d{2}:\d{2}:\d{2}) \[(?P<level>INFO|WARNING|ERROR)\] (?P<message>.*)$' log.txt
```

#### Trasformazione di Formati di Data
```bash
# Converti da DD/MM/YYYY a YYYY-MM-DD
sed -E 's@([0-9]{2})/([0-9]{2})/([0-9]{4})@\3-\2-\1@g' file.txt
```

## Integrazione con Altri Strumenti

### Regex in Combinazione con awk

```bash
# Calcola la somma dei valori nella terza colonna solo per righe che contengono 'VALID'
awk '/VALID/ {sum += $3} END {print sum}' file.txt
```

### Regex in Combinazione con find

```bash
# Trova tutti i file .log modificati negli ultimi 7 giorni che contengono errori
find /var/log -name "*.log" -mtime -7 -exec grep -l "ERROR" {} \;
```

## Esercizi Pratici

1. Scrivi un'espressione regolare per estrarre tutti gli indirizzi email da un file, considerando vari formati validi.
2. Crea un'espressione per validare numeri di carta di credito di diversi circuiti (Visa, MasterCard, American Express).
3. Sviluppa un pattern per estrarre informazioni strutturate da un file CSV, gestendo correttamente i campi che contengono virgole.
4. Scrivi un'espressione per identificare e contare le parole ripetute consecutivamente in un testo.

## Conclusione

Le espressioni regolari avanzate sono uno strumento potente che richiede pratica e comprensione approfondita. Con le tecniche presentate in questa guida, sarai in grado di affrontare problemi complessi di manipolazione del testo in modo efficiente ed elegante.

## Risorse Aggiuntive

- [Regex101](https://regex101.com/) - Tester online con spiegazioni dettagliate
- [RegexCrossword](https://regexcrossword.com/) - Giochi per imparare le regex
- [The Regex Cookbook](https://www.regular-expressions.info/) - Raccolta di pattern pronti all'uso
- [Mastering Regular Expressions](https://www.oreilly.com/library/view/mastering-regular-expressions/0596528124/) - Libro di riferimento completo