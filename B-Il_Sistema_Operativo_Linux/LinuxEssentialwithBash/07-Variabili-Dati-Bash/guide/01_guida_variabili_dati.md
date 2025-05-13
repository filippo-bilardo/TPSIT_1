# Guida: Variabili e Tipi di Dati in Bash

Questa guida spiega come funzionano le variabili e i principali tipi di dati nello scripting Bash. Imparerai a dichiarare, assegnare e utilizzare variabili, oltre a conoscere le differenze tra variabili numeriche e stringhe.

## Dichiarazione e assegnazione
Per dichiarare e assegnare una variabile:
```bash
nome_variabile=valore
```
Esempio:
```bash
messaggio="Ciao mondo"
numero=42
```

## Utilizzo delle variabili
Per richiamare il valore di una variabile:
```bash
echo $messaggio
echo $numero
```

## Tipi di dati
In Bash, tutte le variabili sono trattate come stringhe, ma possono essere usate come numeri se necessario.

## Operazioni aritmetiche
Per eseguire operazioni aritmetiche:
```bash
somma=$((numero + 10))
echo $somma
```

## Consigli
- Non mettere spazi intorno all'uguale nell'assegnazione.
- Usa nomi significativi per le variabili.

## Approfondimenti
Consulta la documentazione Bash e le pagine man per ulteriori dettagli sulle variabili.