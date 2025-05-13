# Guida: Funzioni in Bash

Questa guida spiega come creare e utilizzare le funzioni negli script Bash. Le funzioni permettono di organizzare il codice, riutilizzare blocchi di comandi e rendere gli script più leggibili e modulari. Sono fondamentali per scrivere script complessi e mantenibili.

## Definizione di una funzione
```bash
nome_funzione() {
  # comandi
}
```
Esempio base:
```bash
saluta() {
  echo "Ciao, $1!"
}
```

## Chiamare una funzione
Per eseguire una funzione basta scrivere il suo nome, eventualmente passando parametri:
```bash
saluta "Mario"
```
Output:
```
Ciao, Mario!
```

## Passaggio di parametri
Le funzioni possono ricevere parametri come gli script:
- `$1`, `$2`, ...: rappresentano i parametri passati alla funzione.
- `$@`: tutti i parametri come lista.
- `$#`: numero di parametri ricevuti.

Esempio avanzato:
```bash
info_parametri() {
    echo "Nome funzione: ${FUNCNAME[0]}"
    echo "Numero parametri: $#"
    echo "Tutti i parametri: $@"
    echo "Primo parametro: $1"
    echo "Secondo parametro: $2"
}
info_parametri uno due tre
```
Output:
```
Nome funzione: info_parametri
Numero parametri: 3
Tutti i parametri: uno due tre
Primo parametro: uno
Secondo parametro: due
```

## Valore di ritorno
Una funzione può restituire un valore tramite il comando `return` (solo numerico, tipicamente usato per codici di stato) oppure stampando su stdout (per valori testuali o numerici):

```bash
somma() {
    echo $(($1 + $2))
}
risultato=$(somma 5 3)
echo "La somma è $risultato"
```

## Scope delle variabili
Le variabili dichiarate all'interno di una funzione sono globali per default. Per limitarne la visibilità, usa `local`:
```bash
esempio_scope() {
    local messaggio="Ciao solo nella funzione"
    echo "$messaggio"
}
esempio_scope
echo "$messaggio"  # Non esiste fuori dalla funzione
```

## Funzioni ricorsive
Le funzioni possono chiamare sé stesse (ricorsione):
```bash
fattoriale() {
    if [ $1 -le 1 ]; then
        echo 1
    else
        local temp=$(fattoriale $(($1 - 1)))
        echo $(($1 * temp))
    fi
}
echo "Fattoriale di 5: $(fattoriale 5)"
```

## Casi d'uso reali
- Suddividere script lunghi in blocchi logici
- Automatizzare task ripetitivi
- Gestire errori e validazioni
- Creare librerie di funzioni riutilizzabili

## Consigli pratici
- Dai nomi significativi alle funzioni.
- Usa `local` per evitare conflitti tra variabili.
- Documenta le funzioni con commenti chiari.
- Testa le funzioni singolarmente.

## Approfondimenti
- Consulta la documentazione ufficiale di Bash (`man bash`).
- Esplora script open source per vedere esempi di funzioni avanzate.
- Prova a scrivere funzioni che gestiscono input/output, validano parametri e gestiscono errori.

## Esercizio proposto
Scrivi una funzione che riceve una stringa e stampa se è palindroma oppure no.

## Risorse utili
- https://www.gnu.org/software/bash/manual/bash.html
- https://tldp.org/LDP/abs/html/