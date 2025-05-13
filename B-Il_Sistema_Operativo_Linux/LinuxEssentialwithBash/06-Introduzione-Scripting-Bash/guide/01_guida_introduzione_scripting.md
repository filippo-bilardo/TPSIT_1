# Guida: Introduzione allo Scripting Bash

Questa guida offre una panoramica sui concetti fondamentali dello scripting Bash in ambiente Linux. Imparerai cosa sono gli script, come crearli, renderli eseguibili e i primi passi per automatizzare attività ripetitive.

## Cos'è uno script Bash?
Uno script Bash è un file di testo che contiene una sequenza di comandi Bash, eseguiti in ordine. Gli script permettono di automatizzare operazioni e processi.

## Creazione di uno script
1. Crea un nuovo file, ad esempio `mio_script.sh`.
2. Inserisci la "shebang" all'inizio del file:
```bash
#!/bin/bash
```
3. Scrivi i comandi che vuoi automatizzare.

## Rendere eseguibile uno script
Usa il comando:
```bash
chmod +x mio_script.sh
```

## Esecuzione di uno script
Lancia lo script con:
```bash
./mio_script.sh
```

## Consigli
- Commenta il codice con `#` per spiegare cosa fa ogni parte.
- Testa sempre lo script su dati non critici.

## Approfondimenti
Consulta le pagine man di Bash (`man bash`) e cerca esempi pratici per migliorare le tue competenze.