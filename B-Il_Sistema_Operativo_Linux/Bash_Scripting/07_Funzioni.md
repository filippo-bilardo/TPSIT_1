# 7. Funzioni

## 7.1 Definizione e chiamata di funzioni

Le funzioni in Bash permettono di raggruppare comandi che possono essere riutilizzati all'interno dello script. Sono utili per organizzare il codice e evitare ripetizioni.

### Sintassi di base

Esistono due modi principali per definire una funzione in Bash:

```bash
# Sintassi 1
function nome_funzione {
    # comandi
}

# Sintassi 2 (più portabile)
nome_funzione() {
    # comandi
}
```

Per chiamare una funzione, basta usare il suo nome:

```bash
nome_funzione
```

Esempi di definizione e chiamata di funzioni:

```bash
# Definizione di una funzione semplice
saluta() {
    echo "Ciao, mondo!"
}

# Chiamata della funzione
saluta  # Output: Ciao, mondo!

# Funzione con comandi multipli
mostra_data() {
    echo "Data attuale:"
    date
    echo "Calendario del mese:"
    cal
}

# Chiamata della funzione
mostra_data
```

## 7.2 Passaggio di parametri

Le funzioni in Bash possono accettare parametri, che vengono passati come argomenti durante la chiamata della funzione. All'interno della funzione, questi parametri sono accessibili tramite variabili posizionali: `$1`, `$2`, ecc.

```bash
# Funzione con parametri
saluta_persona() {
    echo "Ciao, $1!"
}

# Chiamata con un parametro
saluta_persona "Mario"  # Output: Ciao, Mario!

# Funzione con più parametri
somma() {
    echo "La somma di $1 e $2 è $(($1 + $2))"
}

# Chiamata con due parametri
somma 5 3  # Output: La somma di 5 e 3 è 8
```

Variabili speciali utili per gestire i parametri:

```bash
info_parametri() {
    echo "Nome della funzione: ${FUNCNAME[0]}"
    echo "Numero di parametri: $#"
    echo "Tutti i parametri: $@"
    echo "Primo parametro: $1"
    echo "Secondo parametro: $2"
}

info_parametri uno due tre
```

## 7.3 Variabili locali e globali

Per default, le variabili in Bash sono globali, il che significa che sono accessibili da qualsiasi parte dello script. Tuttavia, è possibile dichiarare variabili locali all'interno di una funzione usando la parola chiave `local`.

```bash
# Esempio di variabili globali e locali
variabile_globale="Sono globale"

funzione_test() {
    local variabile_locale="Sono locale"
    echo "All'interno della funzione:"
    echo "Variabile globale: $variabile_globale"
    echo "Variabile locale: $variabile_locale"
    
    # Modifica della variabile globale
    variabile_globale="Globale modificata"
}

# Chiamata della funzione
funzione_test

echo "\nAll'esterno della funzione:"
echo "Variabile globale: $variabile_globale"
echo "Variabile locale: $variabile_locale"  # Sarà vuota o darà errore
```

L'utilizzo di variabili locali è una buona pratica perché:
- Evita conflitti di nomi con variabili globali
- Riduce gli effetti collaterali indesiderati
- Rende le funzioni più modulari e riutilizzabili

## 7.4 Valore di ritorno e stato di uscita

In Bash, le funzioni non restituiscono valori come in altri linguaggi di programmazione. Invece, restituiscono uno stato di uscita (un numero intero tra 0 e 255) che indica se la funzione è stata eseguita con successo (0) o se si è verificato un errore (qualsiasi valore diverso da 0).

```bash
# Funzione con stato di uscita
controlla_file() {
    if [ -f "$1" ]; then
        echo "Il file $1 esiste."
        return 0  # Successo
    else
        echo "Il file $1 non esiste."
        return 1  # Errore
    fi
}

# Chiamata della funzione e verifica dello stato di uscita
controlla_file "/etc/passwd"
if [ $? -eq 0 ]; then
    echo "La funzione ha avuto successo."
else
    echo "La funzione ha riportato un errore."
fi
```

Per "restituire" valori effettivi, ci sono diverse tecniche:

### 1. Utilizzare l'output della funzione

```bash
quadrato() {
    echo $(($1 * $1))
}

# Cattura dell'output in una variabile
risultato=$(quadrato 5)
echo "Il quadrato di 5 è $risultato"
```

### 2. Modificare una variabile globale

```bash
risultato_cubo=0

cubo() {
    risultato_cubo=$(($1 * $1 * $1))
}

cubo 3
echo "Il cubo di 3 è $risultato_cubo"
```

### 3. Utilizzare una variabile di riferimento (Bash 4.3+)

```bash
calcola_potenza() {
    local base=$1
    local esponente=$2