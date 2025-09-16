# Layout responsivi e flessibili

## Fondamenti del design responsivo

Il design responsivo è un approccio alla progettazione web che garantisce che le pagine si adattino in modo ottimale a qualsiasi dispositivo e dimensione dello schermo. Questo approccio, introdotto da Ethan Marcotte nel 2010, ha rivoluzionato il modo in cui concepiamo e sviluppiamo siti web nell'era multi-dispositivo.

I principi fondamentali del design responsivo includono:
- **Layout fluidi**: utilizzo di unità relative (percentuali, em, rem) invece di dimensioni fisse in pixel
- **Immagini flessibili**: adattamento delle immagini alle dimensioni del contenitore
- **Media queries**: applicazione di stili diversi in base alle caratteristiche del dispositivo

```css
/* Esempio di layout fluido */
.container {
  width: 90%;
  max-width: 1200px;
  margin: 0 auto;
}

/* Esempio di immagine flessibile */
img {
  max-width: 100%;
  height: auto;
}
```

L'approccio mobile-first consiste nel progettare prima per i dispositivi mobili e poi progressivamente migliorare l'esperienza per schermi più grandi. Questo approccio offre diversi vantaggi:
- Costringe a concentrarsi sui contenuti essenziali
- Migliora le prestazioni su dispositivi con risorse limitate
- Semplifica il processo di progettazione progressiva

```css
/* Stile base per mobile */
.nav-menu {
  display: flex;
  flex-direction: column;
}

/* Miglioramento per schermi più grandi */
@media (min-width: 768px) {
  .nav-menu {
    flex-direction: row;
    justify-content: space-between;
  }
}
```

I breakpoint sono punti specifici in cui il layout cambia per adattarsi a diverse dimensioni dello schermo. Invece di basarsi su dispositivi specifici, è consigliabile definire breakpoint in base al contenuto:

```css
/* Breakpoint comuni */
@media (min-width: 576px) { /* Small devices */ }
@media (min-width: 768px) { /* Medium devices */ }
@media (min-width: 992px) { /* Large devices */ }
@media (min-width: 1200px) { /* Extra large devices */ }
```

Le unità di misura relative sono fondamentali per creare layout flessibili:
- **Percentuali**: relative all'elemento genitore
- **em**: relative alla dimensione del font dell'elemento
- **rem**: relative alla dimensione del font dell'elemento root (html)
- **vw/vh**: relative alla larghezza/altezza del viewport
- **vmin/vmax**: relative alla dimensione minima/massima del viewport

```css
:root {
  font-size: 16px; /* Base per calcoli rem */
}

h1 {
  font-size: 2rem; /* 32px */
}

.hero {
  height: 50vh; /* 50% dell'altezza del viewport */
  padding: 5%; /* Padding proporzionale alla larghezza */
}
```

## Sistemi di griglia

I sistemi di griglia forniscono una struttura coerente per organizzare i contenuti in colonne e righe. CSS Grid Layout è un potente sistema nativo che permette di creare layout bidimensionali complessi:

```css
.grid-container {
  display: grid;
  grid-template-columns: repeat(12, 1fr); /* 12 colonne di uguale larghezza */
  gap: 20px;
}

.header {
  grid-column: 1 / -1; /* Occupa tutte le colonne */
}

.main-content {
  grid-column: 1 / 9; /* Occupa 8 colonne */
}

.sidebar {
  grid-column: 9 / -1; /* Occupa 4 colonne */
}

@media (max-width: 768px) {
  .main-content, .sidebar {
    grid-column: 1 / -1; /* Su mobile, occupano l'intera larghezza */
  }
}
```

I framework di griglia come Bootstrap e Foundation offrono sistemi preconfigurati che semplificano lo sviluppo responsivo:

```html
<!-- Esempio con Bootstrap 5 -->
<div class="container">
  <div class="row">
    <div class="col-12 col-md-8">Contenuto principale</div>
    <div class="col-12 col-md-4">Sidebar</div>
  </div>
</div>
```

È possibile creare griglie personalizzate adattate alle esigenze specifiche del progetto:

```css
.custom-grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
  gap: 20px;
}
```

Le griglie fluide utilizzano unità relative per adattarsi automaticamente allo spazio disponibile, mentre le griglie fisse mantengono dimensioni costanti indipendentemente dalla dimensione dello schermo:

```css
/* Griglia fluida */
.fluid-grid {
  display: grid;
  grid-template-columns: repeat(3, 1fr);
  gap: 2%;
}

/* Griglia fissa */
.fixed-grid {
  display: grid;
  grid-template-columns: repeat(3, 320px);
  gap: 20px;
  justify-content: center;
}
```

## Layout flessibili con Flexbox

Flexbox (Flexible Box Layout) è un modello di layout unidimensionale ideale per distribuire spazio e allineare elementi in una riga o colonna. I concetti fondamentali includono:

- **Flex container**: l'elemento genitore con `display: flex`
- **Flex items**: gli elementi figli diretti del container
- **Main axis**: l'asse principale (orizzontale o verticale)
- **Cross axis**: l'asse perpendicolare all'asse principale

```css
.flex-container {
  display: flex;
  flex-direction: row; /* default: orizzontale */
  justify-content: space-between; /* distribuzione sull'asse principale */
  align-items: center; /* allineamento sull'asse trasversale */
  flex-wrap: wrap; /* permette l'a capo degli elementi */
}
```

Le proprietà per il container controllano il comportamento generale del layout:

```css
.flex-container {
  display: flex;
  flex-direction: row | row-reverse | column | column-reverse;
  flex-wrap: nowrap | wrap | wrap-reverse;
  justify-content: flex-start | flex-end | center | space-between | space-around | space-evenly;
  align-items: stretch | flex-start | flex-end | center | baseline;
  align-content: flex-start | flex-end | center | space-between | space-around | stretch;
}
```

Le proprietà per gli item controllano il comportamento individuale degli elementi:

```css
.flex-item {
  order: 0; /* ordine di visualizzazione */
  flex-grow: 0; /* capacità di crescere */
  flex-shrink: 1; /* capacità di ridursi */
  flex-basis: auto; /* dimensione iniziale */
  align-self: auto | flex-start | flex-end | center | baseline | stretch;
}

/* Shorthand */
.flex-item {
  flex: 0 1 auto; /* grow shrink basis */
}
```

Pattern comuni di layout con Flexbox includono:

```css
/* Centratura perfetta */
.center-all {
  display: flex;
  justify-content: center;
  align-items: center;
  min-height: 100vh;
}

/* Layout a colonne di uguale altezza */
.equal-height-columns {
  display: flex;
  flex-wrap: wrap;
}

.equal-height-columns > div {
  flex: 1 1 300px;
  margin: 10px;
}

/* Sticky footer */
body {
  display: flex;
  flex-direction: column;
  min-height: 100vh;
}

main {
  flex: 1;
}
```

Flexbox e Grid possono essere combinati per creare layout complessi e flessibili:

```css
.page-layout {
  display: grid;
  grid-template-columns: 1fr 3fr;
  grid-template-rows: auto 1fr auto;
  min-height: 100vh;
}

.navigation {
  display: flex;
  justify-content: space-between;
}
```

## Immagini e media responsivi

Le immagini fluide si adattano automaticamente alle dimensioni del contenitore, prevenendo overflow e mantenendo le proporzioni:

```css
img, video, canvas {
  max-width: 100%;
  height: auto;
}
```

L'elemento `<picture>` e l'attributo `srcset` permettono di fornire diverse versioni di un'immagine in base alle caratteristiche del dispositivo:

```html
<picture>
  <source media="(min-width: 1200px)" srcset="immagine-grande.jpg">
  <source media="(min-width: 768px)" srcset="immagine-media.jpg">
  <img src="immagine-piccola.jpg" alt="Descrizione" loading="lazy">
</picture>
```

```html
<img src="small.jpg"
     srcset="small.jpg 500w,
             medium.jpg 1000w,
             large.jpg 2000w"
     sizes="(max-width: 600px) 100vw,
            (max-width: 1200px) 50vw,
            33vw"
     alt="Immagine responsiva">
```

Per rendere video e iframe responsivi, è possibile utilizzare un wrapper con proporzioni fisse:

```css
.video-container {
  position: relative;
  padding-bottom: 56.25%; /* Rapporto 16:9 */
  height: 0;
  overflow: hidden;
}

.video-container iframe,
.video-container video {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
}
```

```html
<div class="video-container">
  <iframe src="https://www.youtube.com/embed/dQw4w9WgXcQ" frameborder="0" allowfullscreen></iframe>
</div>
```

L'ottimizzazione delle risorse per dispositivi diversi include:
- Fornire immagini di dimensioni appropriate
- Utilizzare formati moderni come WebP
- Implementare il lazy loading
- Considerare la densità di pixel (display retina)

## Tipografia responsiva

Le unità relative per il testo garantiscono leggibilità su tutti i dispositivi:

```css
body {
  font-size: 16px; /* Base size */
}

h1 {
  font-size: 2rem; /* Relativo alla dimensione root */
}

.hero-text {
  font-size: calc(1rem + 2vw); /* Combinazione di unità fisse e relative */
}
```

Il scaling del testo per la leggibilità può essere implementato con media queries:

```css
body {
  font-size: 16px;
}

@media (min-width: 768px) {
  body {
    font-size: 18px;
  }
}

@media (min-width: 1200px) {
  body {
    font-size: 20px;
  }
}
```

Per prevenire testo troppo piccolo su mobile:

```css
/* Minimo 14px anche su schermi piccoli */
p {
  font-size: max(14px, 1rem);
}

/* Evitare che il testo diventi troppo grande su schermi ampi */
h1 {
  font-size: min(5vw, 3rem);
}
```

Il controllo delle interruzioni di riga migliora la leggibilità:

```css
.no-break {
  white-space: nowrap;
}

.prevent-orphans {
  orphans: 3;
  widows: 3;
}

.hyphenate {
  hyphens: auto;
}
```

## Pattern di UI responsivi

I menu di navigazione responsivi si adattano a diverse dimensioni dello schermo:

```html
<nav class="responsive-nav">
  <button class="menu-toggle" aria-expanded="false" aria-controls="menu">Menu</button>
  <ul id="menu" class="menu">
    <li><a href="#">Home</a></li>
    <li><a href="#">Prodotti</a></li>
    <li><a href="#">Servizi</a></li>
    <li><a href="#">Contatti</a></li>
  </ul>
</nav>
```

```css
.menu {
  display: flex;
}

.menu-toggle {
  display: none;
}

@media (max-width: 768px) {
  .menu {
    display: none;
    flex-direction: column;
  }
  
  .menu.active {
    display: flex;
  }
  
  .menu-toggle {
    display: block;
  }
}
```

Le card e i contenitori flessibili si adattano automaticamente allo spazio disponibile:

```css
.card-container {
  display: grid;
  grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
  gap: 20px;
}

.card {
  display: flex;
  flex-direction: column;
  border: 1px solid #ddd;
  border-radius: 4px;
  overflow: hidden;
}

.card-image {
  width: 100%;
  aspect-ratio: 16/9;
  object-fit: cover;
}
```

## Conclusione

I layout responsivi e flessibili sono diventati un elemento fondamentale del web design moderno, permettendo di creare esperienze utente ottimali su qualsiasi dispositivo. L'approccio mobile-first, combinato con l'uso di media queries, unità relative e sistemi di griglia flessibili, consente di sviluppare siti web che si adattano elegantemente a schermi di diverse dimensioni.

Flexbox e CSS Grid hanno rivoluzionato il modo in cui strutturiamo le pagine web, offrendo strumenti potenti per creare layout complessi con meno codice e maggiore flessibilità. Questi sistemi, insieme a framework CSS come Bootstrap e Foundation, forniscono soluzioni robuste per affrontare le sfide del design responsive.

Ricordate che un buon design responsive non riguarda solo l'adattamento del layout, ma anche l'ottimizzazione di immagini, tipografia e interazioni per garantire prestazioni eccellenti su tutti i dispositivi. Implementando le tecniche discusse in questo capitolo, potrete creare siti web che offrono un'esperienza utente coerente e di alta qualità, indipendentemente dal dispositivo utilizzato per accedervi.

---

### Navigazione
- [📑 Indice](<../README.md>)
- [⬅️ Struttura delle pagine con HTML5](<01_Struttura_pagine_HTML5.md>)
- [➡️ Tecniche di posizionamento con CSS](<03_Tecniche_posizionamento_CSS.md>)