# CSS Grid

## Indice dei contenuti

- [Introduzione a CSS Grid](#introduzione-a-css-grid)
  - [Storia e supporto browser](#storia-e-supporto-browser)
  - [Vantaggi di CSS Grid](#vantaggi-di-css-grid)
- [Concetti fondamentali](#concetti-fondamentali)
  - [Grid container e grid item](#grid-container-e-grid-item)
  - [Linee, tracce, celle, aree](#linee-tracce-celle-aree)
  - [Grid esplicite e implicite](#grid-esplicite-e-implicite)
- [Proprietà del container](#proprietà-del-container)
  - [display: grid](#display-grid)
  - [grid-template-columns e grid-template-rows](#grid-template-columns-e-grid-template-rows)
  - [grid-template-areas](#grid-template-areas)
  - [grid-gap (gap)](#grid-gap-gap)
  - [justify-items e align-items](#justify-items-e-align-items)
  - [justify-content e align-content](#justify-content-e-align-content)
- [Proprietà degli item](#proprietà-degli-item)
  - [grid-column e grid-row](#grid-column-e-grid-row)
  - [grid-area](#grid-area)
  - [justify-self e align-self](#justify-self-e-align-self)
- [Funzioni e unità speciali](#funzioni-e-unità-speciali)
  - [fr (fraction)](#fr-fraction)
  - [minmax()](#minmax)
  - [repeat()](#repeat)
  - [auto-fill e auto-fit](#auto-fill-e-auto-fit)
- [Pattern di layout comuni](#pattern-di-layout-comuni)
  - [Holy Grail Layout](#holy-grail-layout)
  - [Card Layout](#card-layout)
  - [Masonry Layout](#masonry-layout)
  - [Dashboard Layout](#dashboard-layout)
- [CSS Grid vs altre tecniche di layout](#css-grid-vs-altre-tecniche-di-layout)
  - [Confronto con Flexbox](#confronto-con-flexbox)
  - [Confronto con layout tradizionali](#confronto-con-layout-tradizionali)
  - [Quando usare CSS Grid](#quando-usare-css-grid)
- [Domande di autovalutazione](#domande-di-autovalutazione)
- [Esercizi pratici](#esercizi-pratici)
- [Risorse aggiuntive](#risorse-aggiuntive)

## Introduzione a CSS Grid

### Storia e supporto browser

CSS Grid Layout è un sistema di layout bidimensionale progettato specificamente per l'organizzazione di contenuti in righe e colonne. A differenza di altri sistemi di layout, CSS Grid è stato creato appositamente per risolvere problemi complessi di layout che erano difficili da realizzare con metodi precedenti.

La specifica CSS Grid ha avuto una storia interessante:
- 2011: Microsoft implementa la prima versione di Grid in IE10
- 2017: La specifica raggiunge lo stato di Raccomandazione W3C
- 2017-2018: Tutti i principali browser implementano il supporto completo

Oggi CSS Grid è supportato da tutti i browser moderni, inclusi Edge, Firefox, Chrome, Safari e Opera, rendendo sicuro il suo utilizzo in progetti di produzione senza la necessità di fallback significativi.

### Vantaggi di CSS Grid

CSS Grid offre numerosi vantaggi rispetto ad altri metodi di layout:

1. **Layout bidimensionale** - Permette di controllare sia righe che colonne contemporaneamente
2. **Controllo preciso** - Offre un controllo dettagliato sul posizionamento degli elementi
3. **Allineamento semplificato** - Facilita l'allineamento degli elementi sia orizzontalmente che verticalmente
4. **Layout complessi** - Semplifica la creazione di layout complessi e asimmetrici
5. **Responsive design** - Facilita la creazione di layout che si adattano a diverse dimensioni dello schermo
6. **Riduzione del markup** - Richiede meno elementi di markup rispetto ai metodi tradizionali

## Concetti fondamentali

### Grid container e grid item

Il modello CSS Grid si basa su due componenti principali:

1. **Grid Container** - L'elemento genitore che ha `display: grid` o `display: inline-grid`
2. **Grid Items** - Gli elementi figli diretti del grid container

```html
<div class="grid-container">  <!-- Grid Container -->
  <div class="item">1</div>  <!-- Grid Item -->
  <div class="item">2</div>  <!-- Grid Item -->
  <div class="item">3</div>  <!-- Grid Item -->
</div>
```

```css
.grid-container {
  display: grid;
}
```

### Linee, tracce, celle, aree

CSS Grid utilizza una terminologia specifica per descrivere la struttura della griglia:

1. **Linee (Lines)** - Le linee orizzontali e verticali che dividono la griglia. Sono numerate a partire da 1.
2. **Tracce (Tracks)** - Lo spazio tra due linee adiacenti, formando righe o colonne.
3. **Celle (Cells)** - L'unità più piccola della griglia, formata dall'intersezione di una riga e una colonna.
4. **Aree (Areas)** - Qualsiasi rettangolo formato da quattro linee della griglia, che può contenere una o più celle.

### Grid esplicite e implicite

CSS Grid permette di definire griglie in due modi:

1. **Grid Esplicita** - Definita esplicitamente con proprietà come `grid-template-columns` e `grid-template-rows`.
2. **Grid Implicita** - Creata automaticamente quando il contenuto eccede la grid esplicita. Può essere controllata con `grid-auto-rows` e `grid-auto-columns`.

```css
.grid-container {
  display: grid;
  grid-template-columns: 100px 200px; /* Grid esplicita: 2 colonne */
  grid-template-rows: 50px 50px;      /* Grid esplicita: 2 righe */
  grid-auto-rows: 100px;              /* Righe implicite: 100px di altezza */
}
```

## Proprietà del container

### display: grid

La proprietà che attiva il layout Grid:

```css
.container {
  display: grid; /* o inline-grid */
}
```

- `grid` - Il container diventa un elemento a blocco con comportamento grid
- `inline-grid` - Il container diventa un elemento inline con comportamento grid

### grid-template-columns e grid-template-rows

Definiscono la struttura delle colonne e delle righe della griglia:

```css
.container {
  display: grid;
  grid-template-columns: 100px 200px 100px; /* 3 colonne con larghezze specifiche */
  grid-template-rows: 50px 100px;           /* 2 righe con altezze specifiche */
}
```

È possibile utilizzare diverse unità di misura:
- Lunghezze fisse (px, em, rem)
- Percentuali (%)
- Frazioni (fr) - Distribuiscono lo spazio disponibile proporzionalmente
- auto - Dimensiona in base al contenuto

### grid-template-areas

Permette di definire aree della griglia utilizzando nomi:

```css
.container {
  display: grid;
  grid-template-columns: 1fr 3fr 1fr;
  grid-template-rows: auto 1fr auto;
  grid-template-areas: 
    "header header header"
    "sidebar content aside"
    "footer footer footer";
}

.header { grid-area: header; }
.sidebar { grid-area: sidebar; }
.content { grid-area: content; }
.aside { grid-area: aside; }
.footer { grid-area: footer; }
```

Ogni stringa rappresenta una riga, e ogni parola all'interno della stringa rappresenta una colonna. Il punto (`.`) può essere usato per indicare una cella vuota.

### grid-gap (gap)

Definisce lo spazio tra righe e colonne:

```css
.container {
  display: grid;
  grid-template-columns: 1fr 1fr 1fr;
  gap: 20px;                   /* Spazio uguale tra righe e colonne */
  /* Alternativa: */
  row-gap: 20px;               /* Spazio tra le righe */
  column-gap: 10px;            /* Spazio tra le colonne */
}
```

Nota: `grid-gap`, `grid-row-gap` e `grid-column-gap` sono state rinominate in `gap`, `row-gap` e `column-gap` nella specifica più recente, ma le versioni con prefisso sono ancora supportate per compatibilità.

### justify-items e align-items

Controllano l'allineamento degli item all'interno delle loro celle:

```css
.container {
  display: grid;
  justify-items: center;  /* Allineamento orizzontale: start | end | center | stretch */
  align-items: center;    /* Allineamento verticale: start | end | center | stretch */
}
```

- `start` - Allinea gli elementi all'inizio della cella
- `end` - Allinea gli elementi alla fine della cella
- `center` - Centra gli elementi nella cella
- `stretch` (default) - Gli elementi si estendono per riempire la cella

### justify-content e align-content

Controllano l'allineamento dell'intera griglia all'interno del container quando la griglia è più piccola del container:

```css
.container {
  display: grid;
  grid-template-columns: 100px 100px 100px;
  grid-template-rows: 100px 100px;
  height: 500px; /* Container più grande della griglia */
  justify-content: center;  /* Allineamento orizzontale della griglia */
  align-content: center;    /* Allineamento verticale della griglia */
}
```

Valori possibili: `start | end | center | stretch | space-around | space-between | space-evenly`

## Proprietà degli item

### grid-column e grid-row

Definiscono la posizione e l'estensione di un item nella griglia, riferendosi alle linee della griglia:

```css
.item {
  grid-column: 1 / 3;  /* Dalla linea 1 alla linea 3 (occupa 2 colonne) */
  grid-row: 2 / 4;      /* Dalla linea 2 alla linea 4 (occupa 2 righe) */
  
  /* Sintassi alternativa: */
  grid-column: 1 / span 2;  /* Dalla linea 1, estendendosi per 2 colonne */
  grid-row: 2 / span 2;      /* Dalla linea 2, estendendosi per 2 righe */
  
  /* Shorthand: */
  grid-column-start: 1;
  grid-column-end: 3;
  grid-row-start: 2;
  grid-row-end: 4;
}
```

È possibile utilizzare numeri negativi per contare le linee dalla fine della griglia.

### grid-area

Shorthand per `grid-row-start`, `grid-column-start`, `grid-row-end` e `grid-column-end`, o per assegnare un item a un'area nominata:

```css
.item {
  /* Sintassi per posizione: grid-row-start / grid-column-start / grid-row-end / grid-column-end */
  grid-area: 2 / 1 / 4 / 3;
  
  /* Sintassi per area nominata (da usare con grid-template-areas): */
  grid-area: header;
}
```

### justify-self e align-self

Permettono di sovrascrivere l'allineamento specificato da `justify-items` e `align-items` per singoli elementi:

```css
.item {
  justify-self: center;  /* Allineamento orizzontale: start | end | center | stretch */
  align-self: end;       /* Allineamento verticale: start | end | center | stretch */
}
```

## Funzioni e unità speciali

### fr (fraction)

L'unità `fr` rappresenta una frazione dello spazio disponibile nel container:

```css
.container {
  display: grid;
  grid-template-columns: 1fr 2fr 1fr;  /* Proporzione 1:2:1 */
}
```

In questo esempio, la seconda colonna occuperà il doppio dello spazio rispetto alla prima e alla terza.

### minmax()

La funzione `minmax()` definisce un intervallo di dimensioni tra un minimo e un massimo:

```css
.container {
  display: grid;
  grid-template-columns: minmax(100px, 200px) 1fr 1fr;
}
```

La prima colonna avrà una larghezza minima di 100px e massima di 200px.

### repeat()

La funzione `repeat()` permette di ripetere parti della definizione della griglia:

```css
.container {
  display: grid;
  grid-template-columns: repeat(3, 1fr);  /* Equivale a: 1fr 1fr 1fr */
  grid-template-rows: repeat(2, 100px);   /* Equivale a: 100px 100px */
  
  /* Pattern ripetuti: */
  grid-template-columns: repeat(2, 100px 200px);  /* Equivale a: 100px 200px 100px 200px */
}
```

### auto-fill e auto-fit

Questi valori, usati con `repeat()`, permettono di creare griglie responsive che adattano automaticamente il numero di colonne in base allo spazio disponibile:

```css
.container {
  display: grid;
  grid-template-columns: repeat(auto-fill, minmax(200px, 1fr));
}
```

Differenze:
- `auto-fill`: Crea il maggior numero possibile di tracce, anche se alcune rimangono vuote
- `auto-fit`: Espande gli item per occupare lo spazio disponibile, eliminando le tracce vuote

## Pattern di layout comuni

### Holy Grail Layout

Il classico layout con header, footer, contenuto principale e due sidebar laterali:

```html
<div class="holy-grail">
  <header>Header</header>
  <nav>Nav / Sidebar sinistra</nav>
  <main>Contenuto principale</main>
  <aside>Sidebar destra</aside>
  <footer>Footer</footer>
</div>
```

```css
.holy-grail {
  display: grid;
  grid-template-columns: 200px 1fr 200px;
  grid-template-rows: auto 1fr auto;
  grid-template-areas: 
    "header header header"
    "nav main aside"
    "footer footer footer";
  min-height: 100vh;
}

header { grid-area: header; }
nav { grid-area: nav; }
main { grid-area: main; }
aside { grid-area: aside; }
footer { grid-area: footer; }

/* Responsive: su schermi piccoli, impila gli elementi */
@media (max-width: 768px) {
  .holy-grail {
    grid-template-columns: 1fr;
    grid-template-areas: 
      "header"
      "nav"
      "main"
      "aside"
      "footer";
  }
}
```

### Card Layout

Un pattern comune per mostrare contenuti in card di uguale larghezza:

```html
<div class="card-container">
  <div class="card">Card 1</div>
  <div class="card">Card 2</div>
  <div class="card">Card 3</div>
  <div class="card">Card 4</div>
  <div class="card">Card 5</div>
  <div class="card">Card 6</div>
</div>
```

```css
.card-container {
  display: grid;
  grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
  gap: 20px;
}

.card {
  background-color: #f9f9f9;
  padding: 20px;
  border-radius: 5px;
  box-shadow: 0 2px 5px rgba(0,0,0,0.1);
}
```

Questo layout crea automaticamente il numero appropriato di colonne in base alla larghezza del container.

### Masonry Layout

Un layout simile a Pinterest, con elementi di altezze diverse:

```html
<div class="masonry-container">
  <div class="item item1">Item 1</div>
  <div class="item item2">Item 2</div>
  <div class="item item3">Item 3</div>
  <div class="item item4">Item 4</div>
  <div class="item item5">Item 5</div>
  <div class="item item6">Item 6</div>
</div>
```

```css
.masonry-container {
  display: grid;
  grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
  grid-auto-rows: 20px;
  gap: 20px;
}

.item {
  background-color: #f9f9f9;
  padding: 20px;
  border-radius: 5px;
  box-shadow: 0 2px 5px rgba(0,0,0,0.1);
}

/* Altezze diverse per gli item */
.item1 { grid-row: span 8; }
.item2 { grid-row: span 5; }
.item3 { grid-row: span 10; }
.item4 { grid-row: span 7; }
.item5 { grid-row: span 6; }
.item6 { grid-row: span 9; }
```

Nota: Per un vero layout masonry, potrebbe essere necessario utilizzare JavaScript per calcolare le altezze degli elementi.

### Dashboard Layout

Un layout per dashboard con widget di diverse dimensioni:

```html
<div class="dashboard">
  <div class="widget widget1">Widget 1</div>
  <div class="widget widget2">Widget 2</div>
  <div class="widget widget3">Widget 3</div>
  <div class="widget widget4">Widget 4</div>
  <div class="widget widget5">Widget 5</div>
  <div class="widget widget6">Widget 6</div>
</div>
```

```css
.dashboard {
  display: grid;
  grid-template-columns: repeat(4, 1fr);
  grid-auto-rows: minmax(100px, auto);
  gap: 20px;
}

.widget {
  background-color: #f9f9f9;
  padding: 20px;
  border-radius: 5px;
  box-shadow: 0 2px 5px rgba(0,0,0,0.1);
}

.widget1 {
  grid-column: 1 / 3;
  grid-row: 1 / 3;
}

.widget2 {
  grid-column: 3 / 5;
}

.widget3 {
  grid-column: 3;
  grid-row: 2;
}

.widget4 {
  grid-column: 4;
  grid-row: 2;
}

.widget5 {
  grid-column: 1 / 3;
}

.widget6 {
  grid-column: 3 / 5;
}
```

## CSS Grid vs altre tecniche di layout

### Confronto con Flexbox

**CSS Grid:**
- Bidimensionale (righe E colonne)
- Ideale per layout di pagina completi
- Focalizzato sul layout
- Eccellente per posizionare elementi in una griglia precisa

**Flexbox:**
- Unidimensionale (riga O colonna)
- Ideale per componenti UI e piccoli layout
- Focalizzato sul contenuto
- Eccellente per distribuire spazio tra elementi in una singola dimensione

### Confronto con layout tradizionali

**Vantaggi di CSS Grid rispetto a float e positioning:**

1. **Controllo bidimensionale** - Grid permette di controllare sia righe che colonne contemporaneamente
2. **Meno markup** - Non richiede elementi aggiuntivi per il layout
3. **Nessun clearfix** - Non è necessario utilizzare clearfix o altre tecniche
4. **Allineamento verticale** - Permette di allineare facilmente gli elementi verticalmente
5. **Layout complessi** - Semplifica la creazione di layout complessi e asimmetrici

### Quando usare CSS Grid

CSS Grid è particolarmente adatto per:

1. **Layout di pagina completi** - Quando si definisce la struttura principale della pagina
2. **Layout bidimensionali** - Quando si lavora con righe e colonne
3. **Layout asimmetrici** - Quando gli elementi hanno dimensioni diverse
4. **Posizionamento preciso** - Quando è necessario posizionare gli elementi in punti specifici
5. **Layout responsive complessi** - Quando si vuole modificare radicalmente il layout in base alla dimensione dello schermo

Una buona pratica è utilizzare Grid per il layout generale della pagina e Flexbox per i componenti interni.

## Domande di autovalutazione

1. Quali sono le differenze principali tra CSS Grid e Flexbox?
2. Come si può creare una griglia con 3 colonne di uguale larghezza?
3. Spiega la differenza tra `grid-template-columns` e `grid-auto-columns`.
4. Come si può posizionare un elemento in modo che occupi due righe e tre colonne?
5. Qual è la differenza tra `auto-fill` e `auto-fit`?
6. Come si può creare un layout responsive con CSS Grid senza utilizzare media queries?
7. Spiega il concetto di "grid area" e come si utilizza.

## Esercizi pratici

1. **Esercizio base**: Crea una griglia di 3x3 con celle di uguale dimensione e colora ogni cella con un colore diverso.

2. **Esercizio intermedio**: Implementa il "Holy Grail Layout" con header, footer, contenuto principale e due sidebar. Rendi il layout responsive in modo che su dispositivi mobili le sidebar appaiano sotto il contenuto principale.

3. **Esercizio avanzato**: Crea un layout di galleria di immagini con CSS Grid che mostri immagini di diverse dimensioni in una griglia ordinata. Le immagini più grandi dovrebbero occupare più celle della griglia.

4. **Esercizio creativo**: Implementa un dashboard responsive con widget di diverse dimensioni. Alcuni widget dovrebbero occupare più spazio di altri, e il layout dovrebbe adattarsi a diverse dimensioni dello schermo.

## Risorse aggiuntive

- [MDN Web Docs: CSS Grid Layout](https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_Grid_Layout)
- [CSS-Tricks: A Complete Guide to Grid](https://css-tricks.com/snippets/css/complete-guide-grid/)
- [Grid by Example](https://gridbyexample.com/) - Esempi e pattern di CSS Grid
- [CSS Grid Garden](https://cssgridgarden.com/) - Un gioco per imparare CSS Grid
- [Wes Bos: CSS Grid Course](https://cssgrid.io/) - Corso video gratuito su CSS Grid
- [Jen Simmons: Layout Land](https://www.youtube.com/layoutland) - Video tutorial su CSS Grid e layout moderni
- [Rachel Andrew: Grid by Example](https://gridbyexample.com/) - Esempi e risorse su CSS Grid