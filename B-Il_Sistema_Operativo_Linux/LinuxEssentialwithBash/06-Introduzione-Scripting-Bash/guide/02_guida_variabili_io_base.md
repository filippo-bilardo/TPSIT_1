# Guida: Variabili, Input e Output di Base in Bash

Questa guida introduce concetti fondamentali per rendere i tuoi script Bash più dinamici e interattivi: variabili, come visualizzare output e come leggere input dall'utente.

## Variabili in Bash

Le variabili sono usate per memorizzare dati che possono essere utilizzati e modificati durante l'esecuzione dello script. In Bash, non è necessario dichiarare esplicitamente il tipo di una variabile.

### Assegnare Valori alle Variabili

Si assegna un valore a una variabile usando il segno `=` senza spazi attorno ad esso.

```bash
#!/bin/bash

# Assegnazione di stringhe
nome="Mario Rossi"
messaggio='Benvenuto nello script!'

# Assegnazione di numeri
eta=30
quantita=100

# Per accedere al valore di una variabile, si usa il simbolo `$` seguito dal nome della variabile.
echo "Nome: $nome"
echo "Età: $eta anni"
echo "Messaggio: $messaggio"

# È buona pratica racchiudere i nomi delle variabili tra doppie virgolette quando si espandono,
# specialmente se possono contenere spazi o caratteri speciali.
echo "Il tuo nome è: ${nome}"
```

### Tipi di Variabili

1.  **Variabili Locali**: Definite all'interno dello script, sono disponibili solo in quello script. Quelle definite all'interno di una funzione sono locali a quella funzione per impostazione predefinita (a meno che non si usi `local` per renderle esplicitamente locali alla funzione).

2.  **Variabili d'Ambiente**: Sono variabili disponibili a livello di sistema per tutti i processi e script. Possono essere impostate dal sistema o dall'utente.
    Esempi comuni:
    -   `PATH`: Elenco delle directory in cui la shell cerca i comandi eseguibili.
    -   `HOME`: La directory home dell'utente corrente.
    -   `USER`: Il nome dell'utente corrente.
    -   `HOSTNAME`: Il nome host del sistema.

    ```bash
    #!/bin/bash
    echo "La tua directory home è: $HOME"
    echo "Stai eseguendo questo script come utente: $USER"
    echo "Il PATH del sistema è: $PATH"
    ```

### Convenzioni per i Nomi delle Variabili

-   I nomi possono contenere lettere, numeri e underscore (`_`).
-   Devono iniziare con una lettera o un underscore.
-   Sono case-sensitive (`NOME` è diverso da `nome`).
-   Per convenzione, le variabili d'ambiente sono scritte in MAIUSCOLO.
-   Per le variabili locali, si usa spesso il minuscolo o camelCase (es. `mioValore`).

## Comando `echo`: Visualizzare l'Output

Il comando `echo` è usato per visualizzare testo o il valore di variabili sullo standard output (solitamente il terminale).

```bash
#!/bin/bash

echo "Questo è un semplice messaggio."

frutto="Mela"
echo "Il mio frutto preferito è: $frutto"

# Opzioni comuni di echo:
# -n: Non aggiungere una nuova riga alla fine dell'output
echo -n "Testo senza newline."
echo " Altro testo sulla stessa riga."

# -e: Abilita l'interpretazione dei caratteri di escape (backslash escapes)
echo -e "Riga 1\nRiga 2\tRiga 2 con tab"
# \n: Nuova riga
# \t: Tabulazione orizzontale
```

**Nota**: Il comportamento di `echo` può variare leggermente tra diverse implementazioni di shell. Per un output più controllato e portabile, specialmente con caratteri speciali, il comando `printf` è spesso preferito (verrà trattato in guide più avanzate).

## Comando `read`: Leggere l'Input dell'Utente

Il comando `read` permette di leggere una riga di input dallo standard input (solitamente la tastiera) e assegnarla a una o più variabili.

```bash
#!/bin/bash

echo "Come ti chiami?"
read nome_utente
echo "Ciao, $nome_utente! Benvenuto."

# Opzione -p (prompt): Visualizza un messaggio prima di leggere l'input
read -p "Inserisci la tua età: " eta_utente
echo "Hai $eta_utente anni."

# Opzione -s (silent): Non visualizzare l'input mentre viene digitato (utile per password)
read -s -p "Inserisci una password segreta: " password_utente
echo # Aggiunge una newline dopo l'input nascosto
echo "Password ricevuta (non la mostreremo!)."

# Leggere più valori
echo "Inserisci il tuo nome e cognome separati da uno spazio:"
read nome cognome
echo "Nome: $nome, Cognome: $cognome"
```

### Esempio Combinato

```bash
#!/bin/bash

# Chiede il nome all'utente
read -p "Inserisci il tuo nome: " utente

# Saluta l'utente
echo "Ciao, $utente!"

# Chiede l'anno di nascita
read -p "In che anno sei nato? " anno_nascita

# Calcola l'età approssimativa (esempio semplice, non tiene conto del mese/giorno)
anno_corrente=$(date +%Y) # Ottiene l'anno corrente usando il comando date
eta_approssimativa=$((anno_corrente - anno_nascita))

echo "Dovresti avere circa $eta_approssimativa anni."
```

## Buone Pratiche

-   **Virgolette**: Usa sempre le doppie virgolette attorno alle espansioni di variabili (`"$variabile"`) per prevenire problemi con spazi o caratteri speciali nel valore della variabile (word splitting e globbing).
-   **Chiarezza**: Dai nomi significativi alle tue variabili.
-   **Prompt Utili**: Quando usi `read`, fornisci prompt chiari all'utente con l'opzione `-p`.

Con variabili, `echo` e `read`, puoi iniziare a creare script Bash che interagiscono con l'utente e gestiscono dati in modo più flessibile.