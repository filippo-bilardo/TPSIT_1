# Elementi Avanzati dei Form

## Introduzione

Oltre agli elementi di base e di selezione, HTML5 offre una serie di elementi avanzati per i form che consentono di raccogliere dati in modo più sofisticato e interattivo. Questi elementi migliorano l'esperienza utente e offrono funzionalità specializzate per diversi tipi di input.

## Textarea

L'elemento `<textarea>` crea un'area di testo multi-linea, ideale per raccogliere testi più lunghi come commenti, recensioni o messaggi.

### Sintassi Base

```html
<textarea name="nome-textarea" id="id-textarea" rows="numero-righe" cols="numero-colonne"></textarea>
```

### Attributi Principali

- **name**: Identifica il campo quando il form viene inviato
- **id**: Identificatore unico per il campo
- **rows**: Numero di righe visibili
- **cols**: Numero di colonne visibili (larghezza in caratteri)
- **maxlength**: Numero massimo di caratteri consentiti
- **minlength**: Numero minimo di caratteri richiesti
- **placeholder**: Testo di esempio che scompare quando l'utente inizia a digitare
- **readonly**: Rende il campo di sola lettura
- **disabled**: Disabilita completamente il campo
- **required**: Rende obbligatoria la compilazione
- **wrap**: Controlla come il testo viene inviato al server ("soft", "hard")

### Esempio Completo

```html
<label for="commento">Lascia un commento:</label>
<textarea id="commento" name="commento" rows="5" cols="50" 
          placeholder="Scrivi qui il tuo commento..." 
          maxlength="500" required></textarea>
<p class="caratteri-rimasti">Caratteri rimasti: <span id="contatore">500</span></p>
```

> **Nota**: A differenza degli input vuoti, il contenuto predefinito di una textarea va inserito tra i tag di apertura e chiusura, non come attributo value.

## Datalist

L'elemento `<datalist>` fornisce un elenco di suggerimenti predefiniti per un campo di input, combinando la flessibilità di un campo di testo con la comodità di un menu a discesa.

### Sintassi Base

```html
<input type="text" id="id-input" name="nome-input" list="id-datalist">
<datalist id="id-datalist">
  <option value="valore1">Etichetta1</option>
  <option value="valore2">Etichetta2</option>
  <option value="valore3">Etichetta3</option>
</datalist>
```

### Esempio Completo

```html
<label for="browser">Quale browser utilizzi?</label>
<input type="text" id="browser" name="browser" list="browsers">
<datalist id="browsers">
  <option value="Chrome">
  <option value="Firefox">
  <option value="Safari">
  <option value="Edge">
  <option value="Opera">
  <option value="Brave">
  <option value="Vivaldi">
</datalist>
```

### Vantaggi di Datalist

- Combina la libertà di un campo di testo con i suggerimenti di un menu a discesa
- L'utente può digitare qualsiasi valore o scegliere tra i suggerimenti
- Funziona con diversi tipi di input (text, email, url, ecc.)
- Migliora l'usabilità senza limitare le opzioni dell'utente

## Output

L'elemento `<output>` rappresenta il risultato di un calcolo o di un'azione dell'utente, ed è particolarmente utile in combinazione con JavaScript.

### Sintassi Base

```html
<output name="nome-output" id="id-output" for="id-input1 id-input2"></output>
```

### Attributi Principali

- **name**: Identifica il campo quando il form viene inviato
- **id**: Identificatore unico per il campo
- **for**: Elenco di ID degli elementi che contribuiscono al risultato

### Esempio: Calcolatore di Somma

```html
<form oninput="risultato.value = parseInt(a.value) + parseInt(b.value)">
  <input type="number" id="a" name="a" value="0"> +
  <input type="number" id="b" name="b" value="0"> =
  <output name="risultato" id="risultato" for="a b">0</output>
</form>
```

### Esempio: Slider con Valore

```html
<form oninput="valoreSlider.value = slider.value">
  <label for="slider">Seleziona un valore (1-100):</label>
  <input type="range" id="slider" name="slider" min="1" max="100" value="50">
  <output name="valoreSlider" id="valoreSlider" for="slider">50</output>
</form>
```

## Progress e Meter

Questi elementi visualizzano indicatori grafici per rappresentare il progresso o un valore all'interno di un intervallo.

### Progress

Rappresenta il completamento di un'attività o il progresso di un processo.

```html
<label for="download">Progresso download:</label>
<progress id="download" max="100" value="75">75%</progress>
```

### Meter

Rappresenta un valore scalare all'interno di un intervallo noto, come un indicatore di livello.

```html
<label for="disco">Spazio su disco:</label>
<meter id="disco" min="0" max="100" low="20" high="80" optimum="50" value="75">75%</meter>
```

#### Attributi di Meter

- **min/max**: Valori minimo e massimo dell'intervallo
- **low/high**: Soglie che definiscono i valori "bassi" e "alti"
- **optimum**: Valore ottimale all'interno dell'intervallo
- **value**: Valore corrente

## Elementi per Data e Ora

HTML5 introduce input specializzati per la selezione di date e orari.

### Date

```html
<label for="compleanno">Data di nascita:</label>
<input type="date" id="compleanno" name="compleanno" min="1900-01-01" max="2023-12-31">
```

### Time

```html
<label for="appuntamento">Orario appuntamento:</label>
<input type="time" id="appuntamento" name="appuntamento">
```

### Datetime-local

```html
<label for="riunione">Data e ora riunione:</label>
<input type="datetime-local" id="riunione" name="riunione">
```

### Month

```html
<label for="scadenza">Mese di scadenza:</label>
<input type="month" id="scadenza" name="scadenza">
```

### Week

```html
<label for="settimana">Settimana di riferimento:</label>
<input type="week" id="settimana" name="settimana">
```

## Input con Attributi Avanzati

HTML5 ha introdotto numerosi attributi che migliorano la funzionalità degli input standard.

### Autocomplete

```html
<input type="email" id="email" name="email" autocomplete="email">
```

### Autofocus

```html
<input type="text" id="ricerca" name="q" autofocus>
```

### Multiple

```html
<input type="file" id="documenti" name="documenti" multiple>
```

### Pattern

```html
<input type="text" id="codice" name="codice" pattern="[A-Z]{3}[0-9]{4}" 
       title="Il codice deve essere formato da 3 lettere maiuscole seguite da 4 numeri">
```

## Esempi di Applicazione

### Form di Feedback Avanzato

```html
<form action="/invia-feedback" method="post">
  <h2>Lascia il tuo feedback</h2>
  
  <div class="form-group">
    <label for="nome">Nome:</label>
    <input type="text" id="nome" name="nome" required autocomplete="name">
  </div>
  
  <div class="form-group">
    <label for="email">Email:</label>
    <input type="email" id="email" name="email" required autocomplete="email">
  </div>
  
  <div class="form-group">
    <label for="prodotto">Prodotto:</label>
    <input type="text" id="prodotto" name="prodotto" list="prodotti" required>
    <datalist id="prodotti">
      <option value="Smartphone X1">
      <option value="Tablet T2">
      <option value="Laptop L3">
      <option value="Smartwatch W4">
    </datalist>
  </div>
  
  <div class="form-group">
    <label for="data-acquisto">Data di acquisto:</label>
    <input type="date" id="data-acquisto" name="data-acquisto" required>
  </div>
  
  <div class="form-group">
    <label for="valutazione">Valutazione:</label>
    <input type="range" id="valutazione" name="valutazione" min="1" max="5" step="1" value="3" oninput="valoreValutazione.value = valutazione.value + ' stelle'">
    <output name="valoreValutazione" id="valoreValutazione" for="valutazione">3 stelle</output>
  </div>
  
  <div class="form-group">
    <label for="soddisfazione">Livello di soddisfazione:</label>
    <meter id="soddisfazione" name="soddisfazione" min="0" max="100" low="30" high="70" optimum="100" value="75">75%</meter>
  </div>
  
  <div class="form-group">
    <label for="commento">Commento dettagliato:</label>
    <textarea id="commento" name="commento" rows="6" cols="50" 
              placeholder="Descrivi la tua esperienza con il prodotto..." 
              minlength="20" maxlength="1000" required></textarea>
    <p class="caratteri-rimasti">Caratteri rimasti: <span id="contatore">1000</span></p>
  </div>
  
  <div class="form-group">
    <label for="screenshot">Carica screenshot (opzionale):</label>
    <input type="file" id="screenshot" name="screenshot" accept="image/*" multiple>
  </div>
  
  <button type="submit">Invia Feedback</button>
</form>
```

## Best Practices

1. **Usa l'elemento appropriato**: Scegli l'elemento più adatto al tipo di dati che stai raccogliendo.

2. **Fornisci feedback visivo**: Utilizza elementi come `<progress>` e `<meter>` per dare un feedback visivo immediato.

3. **Combina elementi**: Usa combinazioni di elementi (come range + output) per creare controlli interattivi.

4. **Considera la compatibilità**: Alcuni elementi avanzati potrebbero non essere supportati da browser più vecchi; prevedi sempre un fallback.

5. **Migliora con JavaScript**: Gli elementi avanzati esprimono il loro pieno potenziale quando combinati con JavaScript per interazioni dinamiche.

6. **Mantieni l'accessibilità**: Assicurati che tutti gli elementi avanzati siano accessibili anche tramite tastiera e tecnologie assistive.

## Navigazione del Corso
- [📑 Indice](../README.md)
- [⬅️ Elementi di Selezione](./03-ElementiSelezione.md)
- [➡️ Validazione dei Form](./05-ValidazioneForm.md)