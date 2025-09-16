# Flexbox

## Indice dei contenuti

- [Introduzione a Flexbox](#introduzione-a-flexbox)
  - [Storia e supporto browser](#storia-e-supporto-browser)
  - [Vantaggi di Flexbox](#vantaggi-di-flexbox)
- [Concetti fondamentali](#concetti-fondamentali)
  - [Flex container e flex item](#flex-container-e-flex-item)
  - [Assi principale e trasversale](#assi-principale-e-trasversale)
  - [Direzione del flusso](#direzione-del-flusso)
- [Proprietà del container](#proprietà-del-container)
  - [display: flex](#display-flex)
  - [flex-direction](#flex-direction)
  - [flex-wrap](#flex-wrap)
  - [flex-flow](#flex-flow)
  - [justify-content](#justify-content)
  - [align-items](#align-items)
  - [align-content](#align-content)
- [Proprietà degli item](#proprietà-degli-item)
  - [order](#order)
  - [flex-grow](#flex-grow)
  - [flex-shrink](#flex-shrink)
  - [flex-basis](#flex-basis)
  - [flex (shorthand)](#flex-shorthand)
  - [align-self](#align-self)
- [Pattern di layout comuni](#pattern-di-layout-comuni)
  - [Layout a colonne di uguale altezza](#layout-a-colonne-di-uguale-altezza)
  - [Centratura perfetta](#centratura-perfetta)
  - [Card layout](#card-layout)
  - [Holy Grail Layout](#holy-grail-layout)
- [Flexbox vs altre tecniche di layout](#flexbox-vs-altre-tecniche-di-layout)
  - [Confronto con float](#confronto-con-float)
  - [Confronto con CSS Grid](#confronto-con-css-grid)
  - [Quando usare Flexbox](#quando-usare-flexbox)
- [Domande di autovalutazione](#domande-di-autovalutazione)
- [Esercizi pratici](#esercizi-pratici)
- [Risorse aggiuntive](#risorse-aggiuntive)

## Introduzione a Flexbox

### Storia e supporto browser

Flexbox (Flexible Box Layout Module) è stato introdotto come parte delle specifiche CSS3 per risolvere i problemi comuni di layout che erano difficili da realizzare con i metodi tradizionali come float e positioning.

La specifica Flexbox è stata sviluppata in diverse fasi:
- 2009: Prima bozza della specifica
- 2012: Sintassi aggiornata (quella attualmente in uso)
- 2018: Raggiunge lo stato di Raccomandazione W3C

Oggi Flexbox è supportato da tutti i browser moderni, rendendo sicuro il suo utilizzo in progetti di produzione senza la necessità di fallback significativi.

### Vantaggi di Flexbox

Flexbox offre numerosi vantaggi rispetto ai metodi di layout tradizionali:

1. **Flessibilità** - Come suggerisce il nome, permette di creare layout flessibili che si adattano allo spazio disponibile
2. **Allineamento semplificato** - Facilita l'allineamento degli elementi sia orizzontalmente che verticalmente
3. **Ordine degli elementi** - Permette di modificare l'ordine di visualizzazione degli elementi indipendentemente dall'ordine nel DOM
4. **Distribuzione dello spazio** - Offre controllo preciso su come lo spazio viene distribuito tra gli elementi
5. **Dimensionamento proporzionale** - Consente agli elementi di crescere o ridursi in base allo spazio disponibile

## Concetti fondamentali

### Flex container e flex item

Il modello Flexbox si basa su due componenti principali:

1. **Flex Container** - L'elemento genitore che ha `display: flex` o `display: inline-flex`
2. **Flex Items** - Gli elementi figli diretti del flex container

```html
<div class="flex-container">  <!-- Flex Container -->
  <div class="item">1</div>  <!-- Flex Item -->
  <div class="item">2</div>  <!-- Flex Item -->
  <div class="item">3</div>  <!-- Flex Item -->
</div>
```

```css
.flex-container {
  display: flex;
}
```

### Assi principale e trasversale

Flexbox opera su due assi:

1. **Asse principale (Main Axis)** - L'asse primario lungo il quale vengono disposti i flex item. La direzione è determinata da `flex-direction`.
2. **Asse trasversale (Cross Axis)** - L'asse perpendicolare all'asse principale.

Quando `flex-direction` è `row` (default):
- L'asse principale va da sinistra a destra
- L'asse trasversale va dall'alto verso il basso

Quando `flex-direction` è `column`:
- L'asse principale va dall'alto verso il basso
- L'asse trasversale va da sinistra a destra

### Direzione del flusso

La direzione del flusso è determinata dalla proprietà `flex-direction` e può essere:

- `row` (default) - Da sinistra a destra
- `row-reverse` - Da destra a sinistra
- `column` - Dall'alto verso il basso
- `column-reverse` - Dal basso verso l'alto

È importante notare che cambiare la direzione del flusso influisce su quale asse è principale e quale è trasversale, modificando di conseguenza il comportamento di altre proprietà Flexbox.

## Proprietà del container

### display: flex

La proprietà che attiva il layout Flexbox:

```css
.container {
  display: flex; /* o inline-flex */
}
```

- `flex` - Il container diventa un elemento a blocco con comportamento flex
- `inline-flex` - Il container diventa un elemento inline con comportamento flex

### flex-direction

Definisce la direzione dell'asse principale:

```css
.container {
  display: flex;
  flex-direction: row; /* default | row-reverse | column | column-reverse */
}
```

- `row` - Da sinistra a destra (default)
- `row-reverse` - Da destra a sinistra
- `column` - Dall'alto verso il basso
- `column-reverse` - Dal basso verso l'alto

### flex-wrap

Controlla se gli elementi possono andare a capo quando non c'è abbastanza spazio:

```css
.container {
  display: flex;
  flex-wrap: nowrap; /* default | wrap | wrap-reverse */
}
```

- `nowrap` - Gli elementi rimangono su una singola linea, potenzialmente restringendosi (default)
- `wrap` - Gli elementi vanno a capo su più linee quando necessario
- `wrap-reverse` - Gli elementi vanno a capo su più linee in ordine inverso

### flex-flow

Shorthand per `flex-direction` e `flex-wrap`:

```css
.container {
  display: flex;
  flex-flow: row wrap; /* <flex-direction> <flex-wrap> */
}
```

### justify-content

Definisce come gli elementi vengono distribuiti lungo l'asse principale:

```css
.container {
  display: flex;
  justify-content: flex-start; /* default | flex-end | center | space-between | space-around | space-evenly */
}
```

- `flex-start` - Elementi allineati all'inizio dell'asse principale (default)
- `flex-end` - Elementi allineati alla fine dell'asse principale
- `center` - Elementi centrati lungo l'asse principale
- `space-between` - Elementi distribuiti uniformemente con il primo all'inizio e l'ultimo alla fine
- `space-around` - Elementi distribuiti uniformemente con spazio uguale intorno a ciascuno
- `space-evenly` - Elementi distribuiti uniformemente con spazio uguale tra di loro e ai bordi

### align-items

Definisce come gli elementi vengono allineati lungo l'asse trasversale:

```css
.container {
  display: flex;
  align-items: stretch; /* default | flex-start | flex-end | center | baseline */
}
```

- `stretch` - Gli elementi si estendono per riempire il container lungo l'asse trasversale (default)
- `flex-start` - Elementi allineati all'inizio dell'asse trasversale
- `flex-end` - Elementi allineati alla fine dell'asse trasversale
- `center` - Elementi centrati lungo l'asse trasversale
- `baseline` - Elementi allineati alla loro linea di base

### align-content

Controlla l'allineamento delle linee quando ci sono più righe di flex item (funziona solo con `flex-wrap: wrap` o `wrap-reverse`):

```css
.container {
  display: flex;
  flex-wrap: wrap;
  align-content: stretch; /* default | flex-start | flex-end | center | space-between | space-around | space-evenly */
}
```

- `stretch` - Le linee si estendono per occupare lo spazio disponibile (default)
- `flex-start` - Linee impacchettate all'inizio del container
- `flex-end` - Linee impacchettate alla fine del container
- `center` - Linee centrate nel container
- `space-between` - Linee distribuite uniformemente con la prima all'inizio e l'ultima alla fine
- `space-around` - Linee distribuite uniformemente con spazio uguale intorno a ciascuna
- `space-evenly` - Linee distribuite uniformemente con spazio uguale tra di loro

## Proprietà degli item

### order

Controlla l'ordine di visualizzazione degli elementi:

```css
.item {
  order: 0; /* default | <integer> */
}
```

- Valore predefinito: 0
- Valori più bassi vengono visualizzati prima
- Può essere negativo

### flex-grow

Definisce la capacità di un elemento di crescere se necessario:

```css
.item {
  flex-grow: 0; /* default | <number> */
}
```

- Valore predefinito: 0 (non cresce)
- Valori positivi permettono all'elemento di crescere
- Il valore rappresenta la proporzione di spazio extra che l'elemento dovrebbe occupare

Esempio:
```css
.item1 { flex-grow: 1; } /* Occupa 1/3 dello spazio extra */
.item2 { flex-grow: 2; } /* Occupa 2/3 dello spazio extra */
```

### flex-shrink

Definisce la capacità di un elemento di ridursi se necessario:

```css
.item {
  flex-shrink: 1; /* default | <number> */
}
```

- Valore predefinito: 1 (può ridursi)
- 0 significa che l'elemento non si riduce
- Valori più alti indicano una maggiore capacità di riduzione

### flex-basis

Definisce la dimensione predefinita di un elemento prima che lo spazio rimanente venga distribuito:

```css
.item {
  flex-basis: auto; /* default | <length> | <percentage> */
}
```

- `auto` - Si basa sulla dimensione del contenuto o su width/height (default)
- Può essere una lunghezza (es. `300px`) o una percentuale

### flex (shorthand)

Shorthand per `flex-grow`, `flex-shrink` e `flex-basis`:

```css
.item {
  flex: 0 1 auto; /* default | <flex-grow> <flex-shrink> <flex-basis> */
}
```

Valori comuni:
- `flex: 1` - Equivale a `flex: 1 1 0%` (cresce e si riduce, basis 0)
- `flex: auto` - Equivale a `flex: 1 1 auto` (cresce e si riduce, basis auto)
- `flex: none` - Equivale a `flex: 0 0 auto` (non cresce né si riduce)
- `flex: initial` - Equivale a `flex: 0 1 auto` (valore predefinito)

### align-self

Permette di sovrascrivere l'allineamento specificato da `align-items` per singoli elementi:

```css
.item {
  align-self: auto; /* default | flex-start | flex-end | center | baseline | stretch */
}
```

- `auto` - Eredita il valore di `align-items` del container (default)
- Gli altri valori funzionano come in `align-items`

## Pattern di layout comuni

### Layout a colonne di uguale altezza

Uno dei problemi classici del CSS risolti facilmente con Flexbox:

```html
<div class="equal-height-container">
  <div class="column">Contenuto breve</div>
  <div class="column">Contenuto più lungo che occupa più spazio verticale</div>
  <div class="column">Contenuto medio</div>
</div>
```

```css
.equal-height-container {
  display: flex;
}

.column {
  flex: 1;
  padding: 20px;
  background-color: #f0f0f0;
  border: 1px solid #ccc;
  margin: 0 10px;
}
```

Con questo codice, tutte le colonne avranno la stessa altezza indipendentemente dal loro contenuto.

### Centratura perfetta

Centrare un elemento sia orizzontalmente che verticalmente è semplice con Flexbox:

```html
<div class="center-container">
  <div class="centered-element">Perfettamente centrato</div>
</div>
```

```css
.center-container {
  display: flex;
  justify-content: center;
  align-items: center;
  height: 300px;
  border: 2px dashed #333;
}

.centered-element {
  padding: 20px;
  background-color: #f0f0f0;
  border: 1px solid #ccc;
}
```

### Card layout

Un pattern comune per mostrare contenuti in card di uguale larghezza ma altezza variabile:

```html
<div class="card-container">
  <div class="card">
    <h3>Titolo Card 1</h3>
    <p>Contenuto breve.</p>
    <button>Azione</button>
  </div>
  <div class="card">
    <h3>Titolo Card 2</h3>
    <p>Contenuto più lungo che occupa più spazio verticale. Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
    <button>Azione</button>
  </div>
  <div class="card">
    <h3>Titolo Card 3</h3>
    <p>Contenuto medio.</p>
    <button>Azione</button>
  </div>
</div>
```

```css
.card-container {
  display: flex;
  flex-wrap: wrap;
  gap: 20px;
}

.card {
  flex: 1 1 300px; /* Grow, shrink, basis */
  display: flex;
  flex-direction: column;
  padding: 20px;
  background-color: #f9f9f9;
  border-radius: 5px;
  box-shadow: 0 2px 5px rgba(0,0,0,0.1);
}

.card button {
  margin-top: auto; /* Spinge il pulsante verso il basso */
  align-self: flex-start;
  padding: 8px 16px;
  background-color: #4CAF50;
  color: white;
  border: none;
  border-radius: 4px;
  cursor: pointer;
}
```

Questo layout permette alle card di adattarsi allo spazio disponibile, andando a capo quando necessario, e mantiene i pulsanti allineati in basso indipendentemente dall'altezza del contenuto.

### Holy Grail Layout

Il "Santo Graal" del layout web: header, footer, contenuto principale e due sidebar laterali:

```html
<div class="holy-grail">
  <header>Header</header>
  <div class="holy-grail-body">
    <nav class="holy-grail-nav">Nav / Sidebar sinistra</nav>
    <main class="holy-grail-content">Contenuto principale</main>
    <aside class="holy-grail-aside">Sidebar destra</aside>
  </div>
  <footer>Footer</footer>
</div>
```

```css
.holy-grail {
  display: flex;
  flex-direction: column;
  min-height: 100vh;
}

header, footer {
  background-color: #f0f0f0;
  padding: 20px;
}

.holy-grail-body {
  display: flex;
  flex: 1;
}

.holy-grail-content {
  flex: 1;
  padding: 20px;
}

.holy-grail-nav, .holy-grail-aside {
  flex: 0 0 200px; /* Non cresce, non si riduce, larghezza fissa */
  padding: 20px;
  background-color: #e0e0e0;
}

/* Responsive: su schermi piccoli, impila gli elementi */
@media (max-width: 768px) {
  .holy-grail-body {
    flex-direction: column;
  }
  
  .holy-grail-nav, .holy-grail-aside {
    flex: 0 0 auto;
  }
}
```

## Flexbox vs altre tecniche di layout

### Confronto con float

**Vantaggi di Flexbox rispetto a float:**

1. **Allineamento verticale** - Flexbox permette di allineare facilmente gli elementi verticalmente
2. **Ordine flessibile** - Possibilità di cambiare l'ordine degli elementi senza modificare l'HTML
3. **Distribuzione dello spazio** - Controllo preciso su come lo spazio viene distribuito
4. **Altezze uguali** - Colonne di uguale altezza senza hack
5. **Nessun clearfix** - Non è necessario utilizzare clearfix o altre tecniche per gestire gli elementi flottanti

### Confronto con CSS Grid

**Flexbox:**
- Unidimensionale (riga O colonna)
- Ideale per componenti UI e piccoli layout
- Focalizzato sul contenuto
- Eccellente per distribuire spazio tra elementi in una singola dimensione

**CSS Grid:**
- Bidimensionale (righe E colonne)
- Ideale per layout di pagina completi
- Focalizzato sul layout
- Eccellente per posizionare elementi in una griglia precisa

### Quando usare Flexbox

Flexbox è particolarmente adatto per:

1. **Componenti UI** - Barre di navigazione, card, form, ecc.
2. **Layout unidimensionali** - Quando si lavora principalmente in una direzione (orizzontale o verticale)
3. **Allineamento** - Quando è necessario centrare o allineare elementi
4. **Distribuzione dello spazio** - Quando si vuole distribuire lo spazio disponibile tra elementi
5. **Ordine dinamico** - Quando si vuole modificare l'ordine degli elementi in base al dispositivo o ad altre condizioni

## Domande di autovalutazione

1. Quali sono i due assi principali in Flexbox e come cambiano in base alla direzione del flusso?
2. Qual è la differenza tra `justify-content` e `align-items`?
3. Come si può utilizzare Flexbox per creare un layout a colonne di uguale altezza?
4. Quali sono le differenze principali tra Flexbox e CSS Grid?
5. Come funziona la proprietà `flex` shorthand e quali sono i suoi valori predefiniti?
6. In che modo la proprietà `order` influisce sulla visualizzazione degli elementi?
7. Come si può centrare perfettamente un elemento sia orizzontalmente che verticalmente con Flexbox?

## Esercizi pratici

1. **Esercizio base**: Crea una barra di navigazione orizzontale con elementi distribuiti uniformemente e centrati verticalmente.

2. **Esercizio intermedio**: Implementa un layout a tre colonne con sidebar di larghezza fissa e contenuto centrale flessibile. Assicurati che le colonne abbiano la stessa altezza indipendentemente dal contenuto.

3. **Esercizio avanzato**: Crea un layout di card responsive che mostri 3 card per riga su schermi grandi, 2 su schermi medi e 1 su schermi piccoli. Ogni card dovrebbe avere un'immagine in alto, un titolo, un testo e un pulsante allineato in basso.

4. **Esercizio creativo**: Implementa il "Holy Grail Layout" con header, footer, contenuto principale e due sidebar. Rendi il layout responsive in modo che su dispositivi mobili le sidebar appaiano sotto il contenuto principale.

## Risorse aggiuntive

- [MDN Web Docs: Flexbox](https://developer.mozilla.org/en-US/docs/Learn/CSS/CSS_layout/Flexbox)
- [CSS-Tricks: A Complete Guide to Flexbox](https://css-tricks.com/snippets/css/a-guide-to-flexbox/)
- [Flexbox Froggy](https://flexboxfroggy.com/) - Un gioco per imparare Flexbox
- [Flexbox Defense](http://www.flexboxdefense.com/) - Un altro gioco per imparare Flexbox
- [Solved by Flexbox](https://philipwalton.github.io/solved-by-flexbox/) - Esempi di problemi comuni risolti con Flexbox
- [Flexbox Cheatsheet](https://yoksel.github.io/flex-cheatsheet/) - Riferimento visuale per le proprietà Flexbox
- [What the Flexbox?!](https://flexbox.io/) - Corso video gratuito su Flexbox

---

[📑 Indice](../README.md)
[⬅️ Concetti di layout](02_Concetto_di_box_model.md)
➡️ Collasso dei margini](05_Collasso_dei_margini.md)
[⬅️ Border](03_Border.md)