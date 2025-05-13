# Guida: Strutture di Controllo in Bash

Questa guida spiega le principali strutture di controllo (condizioni e cicli) nello scripting Bash. Imparerai a gestire il flusso di esecuzione degli script tramite if, case, for, while e until.

## Condizioni
### if
```bash
if [ condizione ]; then
  # comandi
fi
```
### else/elif
```bash
if [ condizione ]; then
  # comandi
elif [ altra_condizione ]; then
  # altri comandi
else
  # comandi alternativi
fi
```
### case
```bash
case $variabile in
  valore1)
    # comandi
    ;;
  valore2)
    # comandi
    ;;
esac
```

## Cicli
### for
```bash
for var in elenco; do
  # comandi
 done
```
### while
```bash
while [ condizione ]; do
  # comandi
 done
```
### until
```bash
until [ condizione ]; do
  # comandi
 done
```

## Consigli
- Usa le strutture di controllo per rendere gli script dinamici e flessibili.
- Testa sempre le condizioni e i cicli con casi semplici prima di applicarli a script complessi.

## Approfondimenti
Consulta le pagine man di Bash (`man bash`) per ulteriori dettagli sulle strutture di controllo.