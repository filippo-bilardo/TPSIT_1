# Esercizi: Espressioni Regolari e Manipolazione Avanzata di Testo

## Esercizio 1: Estrazione di Dati con Regex

Crea uno script che:
1. Generi un file di testo contenente diverse informazioni, inclusi indirizzi email, numeri di telefono e codici fiscali
2. Utilizzi grep con espressioni regolari per estrarre:
   - Tutti gli indirizzi email validi
   - Tutti i numeri di telefono italiani (formati diversi)
   - Tutti i codici fiscali (formato italiano)
3. Salvi i risultati in file separati

**Suggerimento:** Utilizza espressioni regolari appropriate per ogni tipo di dato. Per i codici fiscali italiani, ricorda che hanno 16 caratteri alfanumerici.

## Esercizio 2: Trasformazione di Dati con sed

Crea uno script che:
1. Prenda come input un file CSV contenente dati in formato non standard
2. Utilizzi sed per:
   - Rimuovere righe di commento (che iniziano con #)
   - Sostituire i separatori non standard con virgole
   - Formattare date in un formato standard (es. da DD-MM-YYYY a YYYY-MM-DD)
   - Aggiungere un'intestazione se mancante
3. Salvi il risultato in un nuovo file CSV ben formattato

**Suggerimento:** Utilizza gruppi di cattura in sed per riorganizzare le date.

## Esercizio 3: Analisi di Log con awk

Crea uno script che:
1. Analizzi un file di log di esempio (puoi crearlo tu stesso)
2. Utilizzi awk per:
   - Calcolare statistiche come il numero totale di accessi
   - Identificare gli IP più frequenti
   - Calcolare il tempo medio di risposta
   - Identificare gli errori più comuni
3. Generi un report formattato con i risultati

**Suggerimento:** Utilizza array associativi in awk per contare occorrenze e calcolare statistiche.

## Esercizio 4: Manipolazione Avanzata di Stringhe in Bash

Crea uno script interattivo che:
1. Chieda all'utente di inserire un percorso file completo
2. Utilizzi le operazioni di manipolazione delle stringhe di Bash per:
   - Estrarre il nome del file senza estensione
   - Estrarre solo l'estensione
   - Estrarre solo il percorso della directory
   - Convertire il nome del file in maiuscolo/minuscolo
   - Sostituire spazi con underscore nel nome del file
3. Mostri tutte le informazioni estratte in un formato leggibile

**Suggerimento:** Utilizza operatori come `${file##*/}`, `${file%.*}`, `${file##*.}`, ecc.

## Esercizio 5: Pipeline Complessa

Crea uno script che implementi una pipeline complessa per:
1. Scaricare un file di testo da Internet (puoi usare un URL pubblico o creare un file locale)
2. Estrarre e contare tutte le parole uniche
3. Ordinare le parole per frequenza
4. Generare una "nuvola di tag" ASCII semplice dove le parole più frequenti sono visualizzate in modo più prominente
5. Salvare i risultati in un file HTML formattato

**Suggerimento:** Combina grep, sed, awk, sort, uniq e altri strumenti in una pipeline efficiente.

## Esercizio 6: Validatore di Sintassi

Crea uno script che:
1. Analizzi un file di configurazione (es. in formato simile a INI o YAML semplificato)
2. Verifichi la validità della sintassi utilizzando espressioni regolari
3. Segnali errori specifici (es. chiavi duplicate, valori mancanti, formato non valido)
4. Corregga automaticamente errori semplici quando possibile

**Suggerimento:** Definisci regole di sintassi chiare e utilizza espressioni regolari per verificarle.

## Esercizio 7: Generatore di Report da Dati Strutturati

Crea uno script che:
1. Legga dati da più file di input in formati diversi (es. CSV, spazio-delimitato, ecc.)
2. Estragga informazioni specifiche da ciascun file
3. Combini i dati in un unico report strutturato
4. Formatti il report in modo leggibile (tabelle ASCII, HTML o Markdown)

**Suggerimento:** Utilizza awk per l'elaborazione principale e sed per la formattazione finale.

## Esercizio 8: Analizzatore di Codice

Crea uno script che:
1. Analizzi un file di codice sorgente (es. in C, Python, o Bash)
2. Estragga e conti:
   - Funzioni/metodi definiti
   - Variabili globali
   - Commenti (percentuale di codice commentato)
   - Complessità approssimativa (es. numero di strutture di controllo annidate)
3. Generi un report sulla "qualità" del codice

**Suggerimento:** Utilizza espressioni regolari specifiche per il linguaggio scelto.

## Esercizio 9: Convertitore di Formato

Crea uno script che:
1. Converta dati da un formato all'altro (es. da CSV a JSON, da XML a CSV, ecc.)
2. Gestisca correttamente caratteri speciali e campi con delimitatori
3. Permetta di specificare mappature di campi personalizzate

**Suggerimento:** Utilizza sed e awk per la trasformazione principale, e considera l'uso di jq per JSON.

## Esercizio 10: Challenge - Log Parser Avanzato

Crea uno script completo che:
1. Analizzi log di sistema o applicazioni in tempo reale
2. Identifichi pattern anomali o sospetti (es. tentativi di accesso falliti multipli)
3. Generi avvisi basati su soglie configurabili
4. Produca report periodici con statistiche e grafici ASCII
5. Implementi un sistema di filtraggio configurabile

**Suggerimento:** Questo è un esercizio avanzato che combina molte delle tecniche apprese. Considera di utilizzare `tail -f` per il monitoraggio in tempo reale e di implementare una configurazione esterna per le regole di analisi.