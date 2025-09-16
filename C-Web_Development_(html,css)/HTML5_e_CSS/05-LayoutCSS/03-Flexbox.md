# Flexbox

Flexbox (Flexible Box Layout) è un modello di layout unidimensionale progettato per organizzare elementi in una direzione (riga o colonna), offrendo un controllo avanzato sull'allineamento, la distribuzione dello spazio e l'ordine degli elementi.

## Concetti base di Flexbox

Flexbox si basa su due tipi di elementi:

1. **Flex Container**: l'elemento genitore che contiene gli elementi flex
2. **Flex Items**: gli elementi figli diretti del flex container

```css
.flex-container {
  display: flex;
}
```

Quando si imposta `display: flex` su un elemento, questo diventa un flex container e i suoi figli diretti diventano automaticamente flex items.

## Proprietà del Flex Container

### flex-direction

Definisce la direzione principale in cui vengono disposti i flex items.

```css
.flex-container {
  display: flex;
  flex-direction: row; /* predefinito */
}
```

Valori possibili:
- `row`: da sinistra a destra (predefinito)
- `row-reverse`: da destra a sinistra
- `column`: dall'alto verso il basso
- `column-reverse`: dal basso verso l'alto

### flex-wrap

Definisce se i flex items devono andare a capo quando non c'è abbastanza spazio.

```css
.flex-container {
  display: flex;
  flex-wrap: nowrap; /* predefinito */
}
```

Valori possibili:
- `nowrap`: tutti gli elementi rimangono su una singola riga/colonna (predefinito)
- `wrap`: gli elementi vanno a capo quando necessario
- `wrap-reverse`: gli elementi vanno a capo in direzione opposta

### flex-flow

Scorciatoia per impostare sia `flex-direction` che `flex-wrap`.

```css
.flex-container {
  display: flex;
  flex-flow: row wrap;
}
```

### justify-content

Definisce come vengono distribuiti i flex items lungo l'asse principale.

```css
.flex-container {
  display: flex;
  justify-content: flex-start; /* predefinito */
}
```

Valori possibili:
- `flex-start`: allineati all'inizio del container (predefinito)
- `flex-end`: allineati alla fine del container
- `center`: centrati nel container
- `space-between`: distribuiti uniformemente con il primo elemento all'inizio e l'ultimo alla fine
- `space-around`: distribuiti uniformemente con spazio uguale attorno a ciascun elemento
- `space-evenly`: distribuiti uniformemente con spazio uguale tra gli elementi

### align-items

Definisce come vengono allineati i flex items lungo l'asse trasversale (perpendicolare all'asse principale).

```css
.flex-container {
  display: flex;
  align-items: stretch; /* predefinito */
}
```

Valori possibili:
- `stretch`: gli elementi si estendono per occupare tutto lo spazio disponibile (predefinito)
- `flex-start`: allineati all'inizio dell'asse trasversale
- `flex-end`: allineati alla fine dell'asse trasversale
- `center`: centrati lungo l'asse trasversale
- `baseline`: allineati alla linea di base del testo

### align-content

Definisce come vengono distribuite le righe di flex items quando c'è spazio extra lungo l'asse trasversale (funziona solo quando `flex-wrap` è impostato su `wrap` o `wrap-reverse` e ci sono più righe/colonne).

```css
.flex-container {
  display: flex;
  flex-wrap: wrap;
  align-content: stretch; /* predefinito */
}
```

Valori possibili:
- `stretch`: le righe si estendono per occupare tutto lo spazio disponibile (predefinito)
- `flex-start`: righe raggruppate all'inizio del container
- `flex-end`: righe raggruppate alla fine del container
- `center`: righe centrate nel container
- `space-between`: righe distribuite uniformemente con la prima all'inizio e l'ultima alla fine
- `space-around`: righe distribuite uniformemente con spazio uguale attorno a ciascuna

## Proprietà dei Flex Items

### order

Definisce l'ordine di visualizzazione dei flex items, indipendentemente dall'ordine nel codice HTML.

```css
.flex-item {
  order: 0; /* predefinito */
}
```

Valori possibili: qualsiasi numero intero (gli elementi con valore minore vengono visualizzati prima).

### flex-grow

Definisce la capacità di un flex item di crescere se necessario.

```css
.flex-item {
  flex-grow: 0; /* predefinito */
}
```

Valori possibili: qualsiasi numero non negativo (0 significa che l'elemento non crescerà).

### flex-shrink

Definisce la capacità di un flex item di ridursi se necessario.

```css
.flex-item {
  flex-shrink: 1; /* predefinito */
}
```

Valori possibili: qualsiasi numero non negativo (0 significa che l'elemento non si ridurrà).

### flex-basis

Definisce la dimensione iniziale di un flex item prima che lo spazio rimanente venga distribuito.

```css
.flex-item {
  flex-basis: auto; /* predefinito */
}
```

Valori possibili: `auto`, lunghezze (px, em, %), `content`.

### flex

Scorciatoia per impostare `flex-grow`, `flex-shrink` e `flex-basis`.

```css
.flex-item {
  flex: 0 1 auto; /* predefinito: flex-grow: 0, flex-shrink: 1, flex-basis: auto */
}

/* Valori comuni */
.flex-item-1 {
  flex: 1; /* flex: 1 1 0% */
}

.flex-item-2 {
  flex: auto; /* flex: 1 1 auto */
}

.flex-item-3 {
  flex: none; /* flex: 0 0 auto */
}
```

### align-self

Permette di sovrascrivere l'allineamento definito da `align-items` per un singolo flex item.

```css
.flex-item {
  align-self: auto; /* predefinito */
}
```

Valori possibili: gli stessi di `align-items` più `auto` (che eredita il valore da `align-items`).

## Esempi pratici

### Layout a colonne di uguale larghezza

```html
<div class="container">
  <div class="colonna">Colonna 1</div>
  <div class="colonna">Colonna 2</div>
  <div class="colonna">Colonna 3</div>
</div>
```

```css
.container {
  display: flex;
  gap: 20px;
}

.colonna {
  flex: 1;
  padding: 20px;
  background-color: #f0f0f0;
}
```

### Menu di navigazione responsive

```html
<nav class="menu">
  <div class="logo">Logo</div>
  <ul class="voci-menu">
    <li><a href="#">Home</a></li>
    <li><a href="#">Chi siamo</a></li>
    <li><a href="#">Servizi</a></li>
    <li><a href="#">Contatti</a></li>
  </ul>
</nav>
```

```css
.menu {
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: 10px 20px;
  background-color: #333;
  color: white;
}

.voci-menu {
  display: flex;
  list-style: none;
  margin: 0;
  padding: 0;
  gap: 20px;
}

/* Versione mobile */
@media (max-width: 768px) {
  .menu {
    flex-direction: column;
    align-items: flex-start;
  }
  
  .voci-menu {
    flex-direction: column;
    width: 100%;
    margin-top: 10px;
  }
}
```

### Card con layout flessibile

```html
<div class="card">
  <img src="immagine.jpg" alt="Immagine">
  <div class="contenuto">
    <h3>Titolo</h3>
    <p>Descrizione del prodotto...</p>
    <div class="azioni">
      <button>Dettagli</button>
      <button>Acquista</button>
    </div>
  </div>
</div>
```

```css
.card {
  display: flex;
  flex-direction: column;
  width: 300px;
  border: 1px solid #ddd;
  border-radius: 8px;
  overflow: hidden;
}

.contenuto {
  display: flex;
  flex-direction: column;
  padding: 15px;
  flex-grow: 1;
}

.azioni {
  display: flex;
  justify-content: space-between;
  margin-top: auto;
}
```

## Vantaggi di Flexbox

- Semplifica la creazione di layout complessi
- Offre un controllo preciso sull'allineamento e la distribuzione dello spazio
- Permette di modificare facilmente l'ordine degli elementi senza cambiare il codice HTML
- Gestisce automaticamente le dimensioni degli elementi in base allo spazio disponibile
- Funziona bene per layout unidimensionali (righe o colonne)

## Limitazioni di Flexbox

- Non è ottimale per layout bidimensionali complessi (per questi casi è preferibile CSS Grid)
- Può diventare complicato quando si annidano molti container flex
- Alcune proprietà avanzate potrebbero non essere supportate nei browser molto vecchi

## Navigazione
- [📑 Indice](./README.md)
- [⬅️ Posizionamento CSS](./02-PosizionamentoCSS.md)
- [➡️ CSS Grid](./04-CSSGrid.md)