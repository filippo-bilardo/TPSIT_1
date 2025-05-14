# Costrutti Condizionali in Bash: if-elif-else-fi

## Introduzione

I costrutti condizionali sono fondamentali nella programmazione perché permettono di eseguire blocchi di codice solo quando determinate condizioni sono soddisfatte. In Bash, il costrutto principale per il controllo condizionale è `if-elif-else-fi`.

## Sintassi Base

```bash
if [condizione]; then
    # comandi da eseguire se la condizione è vera
fi
```

## Sintassi Completa

```bash
if [condizione1]; then
    # comandi da eseguire se la condizione1 è vera
elif [condizione2]; then
    # comandi da eseguire se la condizione1 è falsa e la condizione2 è vera
else
    # comandi da eseguire se tutte le condizioni precedenti sono false
fi
```

## Operatori di Confronto per Numeri

| Operatore | Descrizione |
|-----------|-------------|
| `-eq` | Uguale a (equal) |
| `-ne` | Diverso da (not equal) |
| `-gt` | Maggiore di (greater than) |
| `-ge` | Maggiore o uguale a (greater or equal) |
| `-lt` | Minore di (less than) |
| `-le` | Minore o uguale a (less or equal) |

## Operatori di Confronto per Stringhe

| Operatore | Descrizione |
|-----------|-------------|
| `=` o `==` | Uguale a |
| `!=` | Diverso da |
| `-z` | Stringa vuota |
| `-n` | Stringa non vuota |
| `<` | Precede alfabeticamente (deve essere usato con `[[` invece di `[`) |
| `>` | Segue alfabeticamente (deve essere usato con `[[` invece di `[`) |

## Operatori per File e Directory

| Operatore | Descrizione |
|-----------|-------------|
| `-e` | Il file esiste |
| `-f` | È un file regolare |
| `-d` | È una directory |
| `-r` | Il file è leggibile |
| `-w` | Il file è scrivibile |
| `-x` | Il file è eseguibile |
| `-s` | Il file non è vuoto |

## Operatori Logici

| Operatore | Descrizione |
|-----------|-------------|
| `&&` | AND logico |
| `||` | OR logico |
| `!` | NOT logico |

## Esempi Pratici

### Esempio 1: Controllo di un numero

```bash
#!/bin/bash

eta=18

if [ $eta -ge 18 ]; then
    echo "Sei maggiorenne."
else
    echo "Sei minorenne."
fi
```

### Esempio 2: Controllo di una stringa

```bash
#!/bin/bash

nome="Mario"

if [ "$nome" = "Mario" ]; then
    echo "Ciao Mario!"
elif [ "$nome" = "Luigi" ]; then
    echo "Ciao Luigi!"
else
    echo "Non ti conosco."
fi
```

### Esempio 3: Controllo di file

```bash
#!/bin/bash

file="/etc/passwd"

if [ -f "$file" ]; then
    echo "$file esiste ed è un file regolare."
    if [ -r "$file" ]; then
        echo "$file è anche leggibile."
    fi
else
    echo "$file non esiste o non è un file regolare."
fi
```

### Esempio 4: Utilizzo di operatori logici

```bash
#!/bin/bash

eta=25
nome="Mario"

if [ $eta -ge 18 ] && [ "$nome" = "Mario" ]; then
    echo "Ciao Mario, sei maggiorenne."
fi

# Sintassi alternativa con [[ ]]
if [[ $eta -ge 18 && "$nome" = "Mario" ]]; then
    echo "Ciao Mario, sei maggiorenne."
fi
```

## Differenza tra [ ] e [[ ]]

In Bash esistono due tipi di costrutti per i test condizionali:

1. `[ ]` (o `test`) - Compatibile con sh, ma con alcune limitazioni
2. `[[ ]]` - Estensione Bash con funzionalità avanzate

Vantaggi di `[[ ]]`:
- Supporta operatori come `&&`, `||` direttamente all'interno delle parentesi
- Supporta pattern matching con `=~` per espressioni regolari
- Non richiede di quotare le variabili per evitare errori di word splitting
- Supporta operatori `<` e `>` per confronti alfabetici senza escape

## Best Practices

1. Usa sempre le virgolette attorno alle variabili per evitare problemi con spazi o caratteri speciali
2. Preferisci `[[ ]]` a `[ ]` quando possibile per maggiore robustezza
3. Indenta correttamente il codice per migliorare la leggibilità
4. Usa commenti per spiegare la logica delle condizioni complesse
5. Verifica sempre che le variabili esistano prima di usarle in condizioni

## Esercizi Suggeriti

1. Scrivi uno script che verifichi se un numero inserito dall'utente è pari o dispari
2. Crea uno script che controlli se un file esiste e, in caso affermativo, mostri le sue proprietà
3. Implementa un semplice calcolatore che accetti due numeri e un operatore (+, -, *, /) e mostri il risultato

## Approfondimenti

- [Bash Conditional Expressions (Documentazione ufficiale)](https://www.gnu.org/software/bash/manual/html_node/Bash-Conditional-Expressions.html)
- [Advanced Bash-Scripting Guide - Tests](https://tldp.org/LDP/abs/html/tests.html)