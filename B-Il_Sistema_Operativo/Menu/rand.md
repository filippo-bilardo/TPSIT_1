Ecco uno script Bash che genera un numero casuale tra 1 e 10, quindi chiede all'utente di indovinarlo utilizzando un ciclo `while`. L'utente continua a inserire numeri fino a quando non indovina il numero corretto.

```bash
#!/bin/bash

# Genera un numero casuale tra 1 e 10
numero_casuale=$(( (RANDOM % 10) + 1 ))

# Inizializza una variabile per il tentativo dell'utente
tentativo=0

# Mostra un messaggio di benvenuto
echo "Benvenuto nel gioco 'Indovina il numero'!"
echo "Ho scelto un numero casuale tra 1 e 10. Prova a indovinarlo!"

# Ciclo while per chiedere all'utente di indovinare il numero
while [[ $tentativo -ne $numero_casuale ]]
do
    # Chiedi all'utente di inserire un numero
    read -p "Inserisci il tuo tentativo: " tentativo

    # Verifica se l'input è un numero valido
    if ! [[ "$tentativo" =~ ^[0-9]+$ ]]; then
        echo "Errore: Devi inserire un numero intero."
        continue
    fi

    # Controlla se il numero è troppo alto o troppo basso
    if [[ $tentativo -lt $numero_casuale ]]; then
        echo "Il numero è più grande!"
    elif [[ $tentativo -gt $numero_casuale ]]; then
        echo "Il numero è più piccolo!"
    else
        echo "Bravo! Hai indovinato il numero!"
    fi
done
```

---

### Spiegazione dello script:

1. **Generazione del numero casuale**:
   ```bash
   numero_casuale=$(( (RANDOM % 10) + 1 ))
   ```
   - `RANDOM` è una variabile predefinita in Bash che genera un numero casuale.
   - `% 10` limita il numero generato tra 0 e 9.
   - `+ 1` sposta l'intervallo da 1 a 10.

2. **Ciclo `while`**:
   - Il ciclo continua finché il numero inserito dall'utente (`$tentativo`) non è uguale al numero casuale generato (`$numero_casuale`).

3. **Validazione dell'input**:
   - Utilizzo di un'espressione regolare (`[[ "$tentativo" =~ ^[0-9]+$ ]]`) per verificare che l'utente inserisca un numero intero.
   - Se l'input non è valido, viene mostrato un messaggio di errore e il ciclo riprende.

4. **Confronto tra numeri**:
   - Se il numero inserito è minore del numero casuale, si stampa "Il numero è più grande!".
   - Se il numero inserito è maggiore del numero casuale, si stampa "Il numero è più piccolo!".
   - Quando l'utente indovina il numero, si stampa un messaggio di successo e il ciclo termina.

---

### Esempio di esecuzione:

```
$ ./indovina_numero.sh
Benvenuto nel gioco 'Indovina il numero'!
Ho scelto un numero casuale tra 1 e 10. Prova a indovinarlo!
Inserisci il tuo tentativo: 5
Il numero è più grande!
Inserisci il tuo tentativo: 8
Il numero è più piccolo!
Inserisci il tuo tentativo: 7
Bravo! Hai indovinato il numero!
```

Questo script è semplice ma funzionale e può essere personalizzato ulteriormente aggiungendo, ad esempio, un contatore dei tentativi o un timer.