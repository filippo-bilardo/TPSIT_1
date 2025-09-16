# Attributi HTML

## Introduzione agli Attributi

Gli attributi HTML forniscono informazioni aggiuntive sugli elementi HTML e sono sempre specificati nella tag di apertura. Gli attributi sono composti da una coppia nome/valore, dove il nome è la proprietà che si desidera impostare e il valore è ciò che si desidera assegnare a quella proprietà.

## Sintassi degli Attributi

```html
<tag attributo="valore">Contenuto</tag>
```

Esempio:

```html
<a href="https://www.example.com">Visita Example.com</a>
```

In questo esempio, `href` è l'attributo e `"https://www.example.com"` è il valore dell'attributo.

## Attributi Comuni

### 1. Attributi Globali

Gli attributi globali possono essere utilizzati su qualsiasi elemento HTML:

- **id**: Specifica un identificatore unico per un elemento
- **class**: Specifica una o più classi per un elemento (utilizzate per CSS e JavaScript)
- **style**: Specifica stili CSS inline per un elemento
- **title**: Specifica informazioni aggiuntive sull'elemento (mostrate come tooltip)
- **lang**: Specifica la lingua del contenuto dell'elemento
- **data-***: Utilizzato per memorizzare dati personalizzati privati per la pagina o l'applicazione

Esempio:

```html
<p id="paragrafo1" class="importante evidenziato" style="color: blue;" title="Questo è un paragrafo importante">Contenuto del paragrafo</p>
```

### 2. Attributi Specifici per Elementi

Molti elementi HTML hanno attributi specifici che possono essere utilizzati solo con essi:

#### Elementi di Link (`<a>`)
- **href**: Specifica l'URL della pagina a cui il link porta
- **target**: Specifica dove aprire il documento collegato
- **rel**: Specifica la relazione tra il documento corrente e il documento collegato

```html
<a href="https://www.example.com" target="_blank" rel="noopener">Visita Example.com in una nuova scheda</a>
```

#### Elementi di Immagine (`<img>`)
- **src**: Specifica il percorso dell'immagine
- **alt**: Specifica un testo alternativo per l'immagine
- **width**: Specifica la larghezza dell'immagine
- **height**: Specifica l'altezza dell'immagine

```html
<img src="immagine.jpg" alt="Descrizione dell'immagine" width="300" height="200">
```

#### Elementi di Input (`<input>`)
- **type**: Specifica il tipo di input
- **name**: Specifica il nome dell'input
- **value**: Specifica il valore iniziale dell'input
- **placeholder**: Specifica un suggerimento che descrive il valore atteso
- **required**: Specifica che l'input deve essere compilato prima dell'invio del modulo

```html
<input type="email" name="email" placeholder="Inserisci la tua email" required>
```

## Attributi Booleani

Gli attributi booleani sono attributi che non richiedono un valore. La presenza dell'attributo rappresenta il valore "true", mentre l'assenza rappresenta il valore "false".

Esempi di attributi booleani:
- **disabled**: Disabilita un elemento di input
- **checked**: Preseleziona un elemento di input (checkbox o radio)
- **readonly**: Rende un elemento di input di sola lettura
- **required**: Rende un elemento di input obbligatorio

```html
<input type="checkbox" checked>
<input type="text" disabled>
<input type="text" readonly>
```

## Attributi Personalizzati (data-*)

HTML5 permette di creare attributi personalizzati utilizzando il prefisso `data-`. Questi attributi sono utili per memorizzare dati personalizzati privati per la pagina o l'applicazione.

```html
<div data-user-id="123" data-user-name="Mario Rossi">Profilo Utente</div>
```

Questi attributi possono essere facilmente accessibili tramite JavaScript:

```javascript
const div = document.querySelector('div');
const userId = div.dataset.userId; // "123"
const userName = div.dataset.userName; // "Mario Rossi"
```

## Best Practices per l'Utilizzo degli Attributi

1. **Usa sempre le virgolette** per i valori degli attributi, anche se non sono strettamente necessarie in alcuni casi.
2. **Utilizza attributi semantici** quando possibile (ad esempio, `required` invece di `data-required="true"`)
3. **Mantieni i nomi degli attributi personalizzati descrittivi** ma concisi
4. **Evita di duplicare gli ID** all'interno della stessa pagina
5. **Utilizza classi multiple** separate da spazi per applicare più stili a un elemento

## Conclusione

Gli attributi HTML sono fondamentali per personalizzare e arricchire gli elementi HTML. Forniscono un modo per aggiungere funzionalità, stili e informazioni aggiuntive agli elementi, rendendo le pagine web più interattive e accessibili.

---

## Navigazione

- [⬅️ Elementi e Tag HTML](./03-ElementiTagHTML.md)
- [➡️ Commenti e Indentazione](./05-CommentiIndentazione.md)
- [🏠 Torna all'indice](./README.md)