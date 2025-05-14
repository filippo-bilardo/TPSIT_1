# Esercizi del Modulo 8: Controllo del Flusso in Bash

Metti alla prova la tua comprensione delle strutture di controllo del flusso in Bash con i seguenti esercizi. Per ogni esercizio, crea un nuovo file script `.sh`.

## Esercizio 1: Script di Backup Semplice

**Obiettivo:** Scrivere uno script che esegua un backup basilare di un file.

**Requisiti:**
1.  Lo script deve accettare due argomenti:
    *   Il percorso del file sorgente da backuppare.
    *   Il percorso della directory di destinazione per il backup.
2.  Controllare se vengono forniti esattamente due argomenti. In caso contrario, stampare un messaggio di errore sull'uso e uscire.
3.  Controllare se il file sorgente esiste ed è un file regolare. In caso contrario, stampare un messaggio di errore e uscire.
4.  Controllare se la directory di destinazione esiste.
    *   Se non esiste, crearla. Stampare un messaggio che informa della creazione.
    *   Se esiste ma non è una directory, stampare un messaggio di errore e uscire.
5.  Copiare il file sorgente nella directory di destinazione.
    *   Aggiungere un timestamp al nome del file di backup (es. `nomefile_AAAA-MM-GG_HH-MM-SS`).
    *   Usare il comando `cp`.
6.  Stampare un messaggio di successo che indica dove è stato salvato il backup.

**Suggerimenti:**
*   Usa `$#` per il numero di argomenti.
*   Usa `[ -f "percorso_file" ]` per verificare se è un file regolare.
*   Usa `[ -d "percorso_dir" ]` per verificare se è una directory.
*   Usa `mkdir -p "percorso_dir"` per creare una directory (l'opzione `-p` evita errori se esiste già e crea directory parent se necessario).
*   Usa `date +'%Y-%m-%d_%H-%M-%S'` per generare un timestamp.

## Esercizio 2: Indovina il Numero

**Obiettivo:** Creare un semplice gioco "Indovina il Numero".

**Requisiti:**
1.  Lo script genera un numero casuale compreso tra 1 e 100 (incluso).
    *   Puoi usare `$(( (RANDOM % 100) + 1 ))`. Ricorda che `RANDOM` è una variabile speciale di Bash.
2.  L'utente deve provare a indovinare il numero.
3.  Dopo ogni tentativo, lo script deve dire all'utente se il suo tentativo è:
    *   Troppo alto.
    *   Troppo basso.
    *   Corretto.
4.  Lo script deve continuare a chiedere un input finché l'utente non indovina il numero (usa un ciclo `while`).
5.  Contare il numero di tentativi impiegati dall'utente.
6.  Una volta che l'utente indovina, stampare un messaggio di congratulazioni e il numero di tentativi.
7.  Validare l'input dell'utente per assicurarsi che sia un numero.

**Suggerimenti:**
*   Usa un ciclo `while true` o `while [ "$TENTATIVO" -ne "$NUMERO_SEGRETO" ]`.
*   Usa `read -p "Messaggio: " VARIABILE` per l'input.
*   Usa `[[ "$INPUT" =~ ^[0-9]+$ ]]` per verificare se l'input è un numero.

## Esercizio 3: Analizzatore di Permessi File

**Obiettivo:** Scrivere uno script che analizzi e stampi i permessi di un file per l'utente corrente.

**Requisiti:**
1.  Lo script deve accettare un nome di file (o percorso) come argomento dalla riga di comando.
2.  Controllare se viene fornito esattamente un argomento. In caso contrario, stampare un messaggio di errore sull'uso e uscire.
3.  Controllare se il file specificato esiste.
    *   Se non esiste, stampare un messaggio di errore e uscire.
4.  Se il file esiste, stampare:
    *   Se l'utente corrente ha il permesso di lettura.
    *   Se l'utente corrente ha il permesso di scrittura.
    *   Se l'utente corrente ha il permesso di esecuzione.

**Suggerimenti:**
*   Usa `[ -r "$FILE" ]`, `[ -w "$FILE" ]`, `[ -x "$FILE" ]`.

## Esercizio 4: Convertitore di Temperatura Semplice

**Obiettivo:** Creare uno script che converta temperature tra Celsius e Fahrenheit.

**Requisiti:**
1.  Lo script deve presentare all'utente un menu con le seguenti opzioni:
    1.  Converti Celsius in Fahrenheit
    2.  Converti Fahrenheit in Celsius
    3.  Esci
2.  Usare un costrutto `case` per gestire la scelta dell'utente.
3.  Per le opzioni 1 e 2:
    *   Chiedere all'utente di inserire la temperatura da convertire.
    *   Validare che l'input sia un numero (può essere intero o decimale).
    *   Eseguire il calcolo:
        *   Fahrenheit = (Celsius * 9/5) + 32
        *   Celsius = (Fahrenheit - 32) * 5/9
    *   Stampare il risultato.
4.  Lo script dovrebbe continuare a mostrare il menu finché l'utente non sceglie di uscire (usa un ciclo `while`).

**Suggerimenti:**
*   Bash di default fa aritmetica intera. Per i decimali, puoi usare `bc` (Basic Calculator).
    *   Esempio: `RISULTATO=$(echo "scale=2; ($TEMP_C * 9 / 5) + 32" | bc)`
    *   `scale=2` imposta due cifre decimali.
*   Per la validazione dell'input numerico (anche decimale), puoi usare un'espressione regolare più complessa o verificare se `bc` produce un errore.

## Esercizio 5: Elaborazione Batch di File (Rinomina)

**Obiettivo:** Scrivere uno script che rinomini tutti i file con una certa estensione in una directory specificata, aggiungendo un prefisso.

**Requisiti:**
1.  Lo script deve accettare tre argomenti:
    *   Il percorso della directory in cui operare.
    *   L'estensione dei file da rinominare (es. `txt`, `jpg` - senza il punto).
    *   Il prefisso da aggiungere ai nomi dei file (es. `backup_`).
2.  Validare che siano forniti tutti e tre gli argomenti.
3.  Validare che la directory specificata esista.
4.  Usare un ciclo `for` per iterare su tutti i file con l'estensione data nella directory specificata.
    *   Esempio: `for file in "$DIRECTORY"/*."$ESTENSIONE"; do ... done`
5.  All'interno del ciclo, verificare che `$file` sia effettivamente un file (per evitare problemi se nessun file corrisponde al pattern).
6.  Per ogni file, costruire il nuovo nome aggiungendo il prefisso.
    *   Esempio: se il file è `documento.txt` e il prefisso è `vecchio_`, il nuovo nome sarà `vecchio_documento.txt`.
7.  Rinominare il file usando `mv`.
8.  Stampare un messaggio per ogni file rinominato, mostrando il vecchio e il nuovo nome.
9.  Se nessun file con l'estensione data viene trovato, stampare un messaggio appropriato.

**Suggerimenti:**
*   Usa `basename "$file"` per ottenere solo il nome del file senza il percorso della directory.
*   Usa `dirname "$file"` per ottenere solo il percorso della directory.
*   Fai attenzione alla concatenazione delle stringhe per formare il nuovo percorso completo.
*   **Importante:** Testa questo script in una directory di prova con file fittizi prima di eseguirlo su dati importanti!

Buon lavoro con questi esercizi!
