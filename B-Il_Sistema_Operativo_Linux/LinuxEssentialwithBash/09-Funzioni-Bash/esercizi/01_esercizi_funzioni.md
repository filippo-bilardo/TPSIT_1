# Esercizi: Funzioni in Bash

Questi esercizi ti aiuteranno a praticare e consolidare le tue conoscenze sulle funzioni in Bash. Completa ogni esercizio creando uno script separato e testalo nel tuo ambiente Linux.

## Esercizio 1: Funzione di Saluto Personalizzato

Crea uno script con una funzione chiamata `saluto_personalizzato` che accetti due parametri: un nome e un'ora del giorno (mattina, pomeriggio, sera). La funzione dovrebbe restituire un saluto appropriato in base all'ora.

**Esempio di output:**
```
Buongiorno, Mario! Come stai questa mattina?
Buon pomeriggio, Luigi! Come stai questo pomeriggio?
Buonasera, Giovanna! Come stai questa sera?
```

## Esercizio 2: Calcolatrice Semplice

Crea uno script con quattro funzioni: `addizione`, `sottrazione`, `moltiplicazione` e `divisione`. Ogni funzione dovrebbe accettare due numeri come parametri e restituire il risultato dell'operazione. Implementa anche una funzione `calcolatrice` che accetti tre parametri: due numeri e un'operazione (+, -, *, /) e chiami la funzione appropriata.

**Esempio di utilizzo:**
```bash
risultato=$(calcolatrice 10 5 "+")
echo "10 + 5 = $risultato"

risultato=$(calcolatrice 10 5 "-")
echo "10 - 5 = $risultato"
```

## Esercizio 3: Validazione Input

Crea una funzione chiamata `valida_numero` che verifichi se un input è un numero valido. La funzione dovrebbe restituire 0 (vero in Bash) se l'input è un numero, e 1 (falso in Bash) altrimenti. Usa questa funzione in uno script che chiede all'utente di inserire un numero e continua a chiedere finché non viene inserito un valore valido.

**Suggerimento:** Usa l'espressione regolare `^[0-9]+$` per verificare se una stringa contiene solo cifre.

## Esercizio 4: Libreria di Funzioni

Crea un file chiamato `funzioni_utili.sh` che contenga diverse funzioni utili:
- `converti_maiuscolo`: converte una stringa in maiuscolo
- `converti_minuscolo`: converte una stringa in minuscolo
- `conta_caratteri`: conta il numero di caratteri in una stringa
- `inverti_stringa`: inverte l'ordine dei caratteri in una stringa

Poi crea un secondo script che importi queste funzioni usando `source` e le utilizzi.

## Esercizio 5: Gestione File con Funzioni

Crea uno script che utilizzi funzioni per gestire file:
- `crea_file`: crea un nuovo file con il contenuto specificato
- `leggi_file`: mostra il contenuto di un file
- `aggiungi_a_file`: aggiunge testo alla fine di un file
- `elimina_file`: elimina un file dopo aver chiesto conferma

Lo script dovrebbe presentare un menu all'utente che gli permetta di scegliere quale operazione eseguire.

## Sfida Avanzata: Gestione Contatti

Crea un'applicazione a riga di comando per gestire una rubrica di contatti usando funzioni Bash. L'applicazione dovrebbe permettere di:
- Aggiungere un nuovo contatto (nome, telefono, email)
- Cercare un contatto per nome
- Visualizzare tutti i contatti
- Eliminare un contatto
- Modificare un contatto esistente

Utilizza un file di testo come database e implementa funzioni separate per ogni operazione. Assicurati di gestire correttamente gli errori e di validare gli input dell'utente.