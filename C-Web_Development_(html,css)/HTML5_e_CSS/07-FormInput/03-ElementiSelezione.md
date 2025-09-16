# Elementi di Selezione

## Introduzione

Gli elementi di selezione nei form HTML permettono agli utenti di scegliere tra opzioni predefinite. Questi elementi sono fondamentali per raccogliere dati in modo strutturato e offrire un'esperienza utente intuitiva. In questa guida, esploreremo i principali elementi di selezione disponibili in HTML5.

## Select e Option

L'elemento `<select>` crea un menu a discesa (dropdown) che consente agli utenti di selezionare una o più opzioni da un elenco.

### Sintassi Base

```html
<select name="nome-select" id="id-select">
  <option value="valore1">Testo Opzione 1</option>
  <option value="valore2">Testo Opzione 2</option>
  <option value="valore3">Testo Opzione 3</option>
</select>
```

### Attributi Principali

- **name**: Identifica il campo quando il form viene inviato
- **id**: Identificatore unico per il campo (utile per label e CSS)
- **multiple**: Consente la selezione multipla di opzioni
- **size**: Determina quante opzioni sono visibili contemporaneamente
- **required**: Rende obbligatoria la selezione
- **disabled**: Disabilita l'intero menu a discesa

### Attributi per Option

- **value**: Il valore inviato al server quando l'opzione è selezionata
- **selected**: Preseleziona l'opzione
- **disabled**: Disabilita una singola opzione

### Esempio Completo

```html
<label for="frutta">Seleziona la tua frutta preferita:</label>
<select name="frutta" id="frutta" required>
  <option value="">-- Seleziona un'opzione --</option>
  <option value="mela">Mela</option>
  <option value="banana" selected>Banana</option>
  <option value="arancia">Arancia</option>
  <option value="fragola" disabled>Fragola (non disponibile)</option>
</select>
```

### Gruppi di Opzioni

L'elemento `<optgroup>` permette di raggruppare le opzioni in categorie:

```html
<select name="auto" id="auto">
  <optgroup label="Auto Italiane">
    <option value="fiat">Fiat</option>
    <option value="alfa">Alfa Romeo</option>
  </optgroup>
  <optgroup label="Auto Tedesche">
    <option value="bmw">BMW</option>
    <option value="audi">Audi</option>
  </optgroup>
</select>
```

## Radio Button

I radio button permettono agli utenti di selezionare una sola opzione da un gruppo. Sono ideali quando le opzioni sono limitate e devono essere tutte visibili.

### Sintassi Base

```html
<input type="radio" id="id-opzione" name="nome-gruppo" value="valore-opzione">
<label for="id-opzione">Testo Opzione</label>
```

### Attributi Principali

- **name**: Identifica il gruppo di radio button (deve essere uguale per tutti i radio button dello stesso gruppo)
- **value**: Il valore inviato al server quando il radio button è selezionato
- **checked**: Preseleziona il radio button
- **required**: Rende obbligatoria la selezione di un'opzione del gruppo

### Esempio Completo

```html
<fieldset>
  <legend>Seleziona il tuo genere musicale preferito:</legend>
  
  <div>
    <input type="radio" id="rock" name="genere" value="rock" checked>
    <label for="rock">Rock</label>
  </div>
  
  <div>
    <input type="radio" id="pop" name="genere" value="pop">
    <label for="pop">Pop</label>
  </div>
  
  <div>
    <input type="radio" id="jazz" name="genere" value="jazz">
    <label for="jazz">Jazz</label>
  </div>
  
  <div>
    <input type="radio" id="classica" name="genere" value="classica">
    <label for="classica">Classica</label>
  </div>
</fieldset>
```

## Checkbox

Le checkbox permettono agli utenti di selezionare più opzioni contemporaneamente o nessuna. Sono ideali per liste di opzioni non esclusive.

### Sintassi Base

```html
<input type="checkbox" id="id-opzione" name="nome-opzione" value="valore-opzione">
<label for="id-opzione">Testo Opzione</label>
```

### Attributi Principali

- **name**: Identifica la checkbox quando il form viene inviato
- **value**: Il valore inviato al server quando la checkbox è selezionata
- **checked**: Preseleziona la checkbox
- **required**: Rende obbligatoria la selezione della checkbox
- **indeterminate**: Stato intermedio (né selezionato né deselezionato)

### Esempio Completo

```html
<fieldset>
  <legend>Seleziona gli ingredienti per la tua pizza:</legend>
  
  <div>
    <input type="checkbox" id="pomodoro" name="ingredienti[]" value="pomodoro" checked>
    <label for="pomodoro">Pomodoro</label>
  </div>
  
  <div>
    <input type="checkbox" id="mozzarella" name="ingredienti[]" value="mozzarella" checked>
    <label for="mozzarella">Mozzarella</label>
  </div>
  
  <div>
    <input type="checkbox" id="funghi" name="ingredienti[]" value="funghi">
    <label for="funghi">Funghi</label>
  </div>
  
  <div>
    <input type="checkbox" id="prosciutto" name="ingredienti[]" value="prosciutto">
    <label for="prosciutto">Prosciutto</label>
  </div>
</fieldset>
```

> **Nota**: Quando si utilizzano più checkbox correlate, è comune aggiungere le parentesi quadre `[]` al nome (es. `name="ingredienti[]"`) per indicare che si tratta di un array di valori.

## Best Practices

1. **Usa sempre `<label>`**: Associa sempre un'etichetta a ogni elemento di selezione per migliorare l'usabilità e l'accessibilità.

2. **Raggruppa con `<fieldset>` e `<legend>`**: Utilizza questi elementi per raggruppare logicamente gli elementi correlati.

3. **Valore predefinito per select**: Includi sempre un'opzione predefinita nei menu a discesa, come "-- Seleziona un'opzione --".

4. **Organizza in modo logico**: Disponi le opzioni in un ordine logico (alfabetico, numerico, per frequenza d'uso, ecc.).

5. **Considera l'accessibilità**: Assicurati che gli elementi siano navigabili da tastiera e comprensibili per le tecnologie assistive.

## Esempi di Applicazione

### Form di Prenotazione Ristorante

```html
<form action="/prenota" method="post">
  <fieldset>
    <legend>Dettagli Prenotazione</legend>
    
    <div>
      <label for="data">Data:</label>
      <input type="date" id="data" name="data" required>
    </div>
    
    <div>
      <label for="orario">Orario:</label>
      <select id="orario" name="orario" required>
        <option value="">-- Seleziona un orario --</option>
        <option value="19:00">19:00</option>
        <option value="19:30">19:30</option>
        <option value="20:00">20:00</option>
        <option value="20:30">20:30</option>
        <option value="21:00">21:00</option>
      </select>
    </div>
    
    <div>
      <label for="persone">Numero di persone:</label>
      <select id="persone" name="persone" required>
        <option value="">-- Seleziona --</option>
        <option value="1">1 persona</option>
        <option value="2">2 persone</option>
        <option value="3">3 persone</option>
        <option value="4">4 persone</option>
        <option value="5">5 persone</option>
        <option value="6">6 persone</option>
      </select>
    </div>
    
    <fieldset>
      <legend>Posizione preferita:</legend>
      <div>
        <input type="radio" id="interno" name="posizione" value="interno" checked>
        <label for="interno">Interno</label>
      </div>
      <div>
        <input type="radio" id="esterno" name="posizione" value="esterno">
        <label for="esterno">Esterno (terrazza)</label>
      </div>
    </fieldset>
    
    <fieldset>
      <legend>Richieste speciali:</legend>
      <div>
        <input type="checkbox" id="compleanno" name="speciale[]" value="compleanno">
        <label for="compleanno">Festeggiamento compleanno</label>
      </div>
      <div>
        <input type="checkbox" id="bambini" name="speciale[]" value="bambini">
        <label for="bambini">Seggiolone per bambini</label>
      </div>
      <div>
        <input type="checkbox" id="allergie" name="speciale[]" value="allergie">
        <label for="allergie">Allergie/intolleranze alimentari</label>
      </div>
    </fieldset>
    
    <button type="submit">Prenota</button>
  </fieldset>
</form>
```

## Navigazione del Corso
- [📑 Indice](../README.md)
- [⬅️ Tipi di Input](./02-TipiInput.md)
- [➡️ Elementi Avanzati](./04-ElementiAvanzati.md)