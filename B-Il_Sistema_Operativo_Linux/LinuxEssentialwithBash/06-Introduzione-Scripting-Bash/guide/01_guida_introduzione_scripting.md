# Guida Approfondita: Introduzione allo Scripting Bash

Questa guida espande i concetti fondamentali dello scripting Bash in ambiente Linux. Imparerai in dettaglio cosa sono gli script, come crearli, renderli eseguibili, e le best practice iniziali per automatizzare attività ripetitive.

## Cos'è uno script Bash?

Uno script Bash è un file di testo contenente una sequenza di comandi che la shell Bash interpreta ed esegue. Gli script sono fondamentali per:

-   **Automazione**: Eseguire compiti ripetitivi senza intervento manuale.
-   **Personalizzazione**: Creare comandi personalizzati o modificare il comportamento del sistema.
-   **Gestione del sistema**: Semplificare attività amministrative complesse.

Gli script possono variare da semplici sequenze di comandi a programmi complessi con logica condizionale, cicli e funzioni.

## Creazione di uno script Bash

Segui questi passaggi per creare il tuo primo script:

1.  **Apri un editor di testo**: Puoi usare editor come `nano`, `vim`, `gedit` o qualsiasi altro editor di testo semplice.
    ```bash
    nano mio_primo_script.sh
    ```

2.  **Inserisci la "Shebang"**: La prima riga di ogni script Bash deve essere la *shebang*. Indica al sistema quale interprete utilizzare per eseguire lo script.
    ```bash
    #!/bin/bash
    ```
    -   `#!` è la sequenza magica che identifica il file come script.
    -   `/bin/bash` è il percorso assoluto dell'interprete Bash. Potrebbe variare leggermente su alcuni sistemi (es. `/usr/bin/bash`), ma `/bin/bash` è lo standard più comune.

3.  **Scrivi i comandi**: Aggiungi i comandi Bash che desideri eseguire, uno per riga.
    ```bash
    #!/bin/bash
    # Questo è un commento, non verrà eseguito
    echo "Ciao, Mondo!"
    echo "La data e ora corrente sono:"
    date
    echo "La mia directory attuale è:"
    pwd
    ```

4.  **Salva il file**: Salva il file con un nome descrittivo e l'estensione `.sh` (convenzione, non obbligatoria ma raccomandata), ad esempio `mio_primo_script.sh`.

## Rendere uno script eseguibile

Per impostazione predefinita, i file di testo non hanno il permesso di esecuzione. Devi concederlo esplicitamente usando il comando `chmod` (change mode).

```bash
chmod +x mio_primo_script.sh
```

-   `chmod`: Comando per modificare i permessi dei file.
-   `+x`: Aggiunge (`+`) il permesso di esecuzione (`x`) al file.
-   `mio_primo_script.sh`: Il nome del tuo script.

Puoi verificare i permessi con `ls -l mio_primo_script.sh`. Dovresti vedere una `x` nei permessi.

## Esecuzione di uno script Bash

Ci sono diversi modi per eseguire uno script:

1.  **Specificando il percorso (se nella directory corrente)**:
    Se ti trovi nella stessa directory dello script e questo è eseguibile:
    ```bash
    ./mio_primo_script.sh
    ```
    -   `./` indica al sistema di cercare l'eseguibile nella directory corrente. È necessario per motivi di sicurezza, per evitare l'esecuzione accidentale di script con nomi uguali a comandi di sistema se la directory corrente non è nel `PATH`.

2.  **Specificando il percorso assoluto o relativo**:
    ```bash
    /percorso/completo/a/mio_primo_script.sh
    # oppure
    ../cartella_script/mio_primo_script.sh
    ```

3.  **Usando l'interprete Bash direttamente (non richiede permesso di esecuzione)**:
    ```bash
    bash mio_primo_script.sh
    ```
    In questo caso, stai dicendo esplicitamente a `bash` di interpretare il file, quindi il permesso `+x` e la shebang non sono strettamente necessari (anche se la shebang è comunque una buona pratica).

## Commenti negli Script

I commenti sono cruciali per rendere gli script comprensibili e manutenibili. Tutto ciò che segue un simbolo `#` su una riga è considerato un commento e viene ignorato dall'interprete Bash (ad eccezione della shebang `#!`).

```bash
#!/bin/bash

# Questo è un commento a riga intera.
echo "Questo comando verrà eseguito."

ls -l # Questo è un commento alla fine di una riga di comando.

# Puoi usare i commenti per:
# - Spiegare logiche complesse
# - Disabilitare temporaneamente delle righe di codice (commentarle)
# - Aggiungere informazioni sull'autore, data, versione, ecc.

# echo "Questo comando è commentato e non verrà eseguito."
```

## Primi Passi e Consigli Utili

-   **Inizia semplice**: Comincia con script brevi che eseguono pochi comandi.
-   **Testa frequentemente**: Esegui lo script dopo ogni piccola modifica per individuare subito eventuali errori.
-   **Usa nomi di file descrittivi**: `backup_documenti.sh` è meglio di `script1.sh`.
-   **Sii consapevole della directory corrente**: Molti comandi (come `cp`, `mv`, `rm`) operano in relazione alla directory da cui lo script viene eseguito, a meno che non si usino percorsi assoluti.
-   **Gestione degli errori**: Imparerai in seguito come gestire gli errori e far terminare lo script in modo controllato.

## Approfondimenti

-   Consulta le pagine `man` dei comandi che usi (es. `man echo`, `man date`, `man chmod`).
-   Esplora le guide successive di questo corso per imparare a usare variabili, strutture di controllo, funzioni e molto altro.
-   Cerca online esempi di script Bash per vedere come altri risolvono problemi comuni.

Questa guida ha gettato le basi. La pratica costante è la chiave per diventare proficienti nello scripting Bash.