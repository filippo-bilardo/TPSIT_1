# CSS Grid

CSS Grid è un sistema di layout bidimensionale che permette di creare griglie complesse per organizzare contenuti in righe e colonne. A differenza di Flexbox, che è unidimensionale, Grid è progettato specificamente per layout a griglia bidimensionali.

## Concetti base di CSS Grid

CSS Grid si basa su due tipi di elementi:

1. **Grid Container**: l'elemento genitore che contiene gli elementi della griglia
2. **Grid Items**: gli elementi figli diretti del grid container

```css
.grid-container {
  display: grid;
}
```

Quando si imposta `display: grid` su un elemento, questo diventa un grid container e i suoi figli diretti diventano automaticamente grid items.

## Proprietà del Grid Container

### grid-template-columns e grid-template-rows

Definiscono la struttura della griglia specificando le dimensioni delle colonne e delle righe.

```css
.grid-container {
  display: grid;
  grid-template-columns: 200px 1fr 2fr;
  grid-template-rows: 100px auto;
}
```

In questo esempio, creiamo una griglia con:
- 3 colonne: la prima di 200px, la seconda che occupa 1 frazione dello spazio disponibile, la terza che occupa 2 frazioni
- 2 righe: la prima di 100px, la seconda che si adatta automaticamente al contenuto

### La funzione repeat()

Permette di ripetere valori senza doverli scrivere più volte.

```css
.grid-container {
  display: grid;
  grid-template-columns: repeat(3, 1fr); /* equivalente a: 1fr 1fr 1fr */
  grid-template-rows: repeat(2, 100px); /* equivalente a: 100px 100px */
}
```

### La funzione minmax()

Permette di definire un intervallo di dimensioni tra un minimo e un massimo.

```css
.grid-container {
  display: grid;
  grid-template-columns: minmax(200px, 1fr) 2fr;
}
```

In questo esempio, la prima colonna avrà una larghezza minima di 200px ma potrà crescere fino a occupare 1 frazione dello spazio disponibile.

### grid-template-areas

Permette di definire aree con nomi personalizzati per creare layout complessi.

```css
.grid-container {
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

### grid-column-gap, grid-row-gap e grid-gap

Definiscono lo spazio tra le colonne e le righe della griglia.

```css
.grid-container {
  display: grid;
  grid-template-columns: repeat(3, 1fr);
  grid-column-gap: 20px; /* spazio tra le colonne */
  grid-row-gap: 30px; /* spazio tra le righe */
}

/* Oppure usando la scorciatoia grid-gap */
.grid-container {
  display: grid;
  grid-template-columns: repeat(3, 1fr);
  grid-gap: 30px 20px; /* riga colonna */
}
```

Nota: Le proprietà moderne sono `column-gap`, `row-gap` e `gap`, ma le versioni con prefisso `grid-` sono ancora supportate.

### justify-items e align-items

Definiscono l'allineamento degli elementi all'interno delle loro celle.

```css
.grid-container {
  display: grid;
  grid-template-columns: repeat(3, 1fr);
  justify-items: center; /* allineamento orizzontale */
  align-items: center; /* allineamento verticale */
}
```

Valori possibili: `start`, `end`, `center`, `stretch` (predefinito).

### justify-content e align-content

Definiscono l'allineamento dell'intera griglia all'interno del container quando la griglia è più piccola del container.

```css
.grid-container {
  display: grid;
  grid-template-columns: repeat(3, 100px);
  grid-template-rows: repeat(2, 100px);
  height: 500px;
  justify-content: center; /* allineamento orizzontale della griglia */
  align-content: center; /* allineamento verticale della griglia */
}
```

Valori possibili: `start`, `end`, `center`, `stretch`, `space-around`, `space-between`, `space-evenly`.

## Proprietà dei Grid Items

### grid-column e grid-row

Definiscono la posizione e l'estensione di un elemento nella griglia.

```css
.grid-item {
  grid-column: 1 / 3; /* dalla linea 1 alla linea 3 (occupa 2 colonne) */
  grid-row: 2 / 4; /* dalla linea 2 alla linea 4 (occupa 2 righe) */
}

/* Alternativa usando span */
.grid-item {
  grid-column: 1 / span 2; /* inizia dalla linea 1 e si estende per 2 colonne */
  grid-row: 2 / span 2; /* inizia dalla linea 2 e si estende per 2 righe */
}
```

### grid-area

Scorciatoia per impostare `grid-row-start`, `grid-column-start`, `grid-row-end` e `grid-column-end` in un'unica dichiarazione.

```css
.grid-item {
  grid-area: 2 / 1 / 4 / 3; /* riga-inizio / colonna-inizio / riga-fine / colonna-fine */
}

/* Oppure per assegnare un elemento a un'area nominata */
.grid-item {
  grid-area: header; /* fa riferimento a un'area definita in grid-template-areas */
}
```

### justify-self e align-self

Permettono di sovrascrivere l'allineamento definito da `justify-items` e `align-items` per un singolo grid item.

```css
.grid-item {
  justify-self: end; /* allineamento orizzontale */
  align-self: center; /* allineamento verticale */
}
```

Valori possibili: `start`, `end`, `center`, `stretch` (predefinito).

## Esempi pratici

### Layout a griglia responsive

```html
<div class="gallery">
  <div class="item">1</div>
  <div class="item">2</div>
  <div class="item">3</div>
  <div class="item">4</div>
  <div class="item">5</div>
  <div class="item">6</div>
</div>
```

```css
.gallery {
  display: grid;
  grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
  grid-gap: 20px;
}

.item {
  background-color: #f0f0f0;
  padding: 20px;
  border-radius: 5px;
  text-align: center;
}
```

Questo esempio crea una galleria responsive che adatta automaticamente il numero di colonne in base alla larghezza disponibile, mantenendo ogni elemento con una larghezza minima di 250px.

### Layout a pagina completa

```html
<div class="page">
  <header class="header">Header</header>
  <nav class="nav">Navigazione</nav>
  <main class="main">Contenuto principale</main>
  <aside class="sidebar">Sidebar</aside>
  <footer class="footer">Footer</footer>
</div>
```

```css
.page {
  display: grid;
  grid-template-columns: 200px 1fr 200px;
  grid-template-rows: auto 1fr auto;
  grid-template-areas:
    "header header header"
    "nav main sidebar"
    "footer footer footer";
  min-height: 100vh;
  gap: 10px;
}

.header { grid-area: header; background-color: #f0f0f0; }
.nav { grid-area: nav; background-color: #e0e0e0; }
.main { grid-area: main; background-color: #d0d0d0; }
.sidebar { grid-area: sidebar; background-color: #e0e0e0; }
.footer { grid-area: footer; background-color: #f0f0f0; }

/* Versione mobile */
@media (max-width: 768px) {
  .page {
    grid-template-columns: 1fr;
    grid-template-areas:
      "header"
      "nav"
      "main"
      "sidebar"
      "footer";
  }
}
```

### Layout a dashboard

```html
<div class="dashboard">
  <div class="header">Header</div>
  <div class="sidebar">Sidebar</div>
  <div class="main">Contenuto principale</div>
  <div class="widget-1">Widget 1</div>
  <div class="widget-2">Widget 2</div>
  <div class="widget-3">Widget 3</div>
  <div class="widget-4">Widget 4</div>
</div>
```

```css
.dashboard {
  display: grid;
  grid-template-columns: 200px repeat(3, 1fr);
  grid-template-rows: auto 1fr auto;
  grid-template-areas:
    "header header header header"
    "sidebar main main main"
    "sidebar widget-1 widget-2 widget-3"
    "sidebar widget-4 widget-4 widget-4";
  min-height: 100vh;
  gap: 15px;
}

.header { grid-area: header; }
.sidebar { grid-area: sidebar; }
.main { grid-area: main; }
.widget-1 { grid-area: widget-1; }
.widget-2 { grid-area: widget-2; }
.widget-3 { grid-area: widget-3; }
.widget-4 { grid-area: widget-4; }

/* Stili aggiuntivi */
.dashboard > div {
  padding: 20px;
  background-color: #f0f0f0;
  border-radius: 5px;
}
```

## Vantaggi di CSS Grid

- Permette di creare layout bidimensionali complessi
- Offre un controllo preciso sul posizionamento degli elementi
- Semplifica la creazione di layout responsive
- Riduce la necessità di elementi wrapper aggiuntivi
- Facilita l'allineamento verticale e orizzontale
- Permette di riorganizzare facilmente il layout per diverse dimensioni dello schermo

## Limitazioni di CSS Grid

- Può essere eccessivo per layout semplici unidimensionali (per questi casi è preferibile Flexbox)
- Richiede una curva di apprendimento più ripida rispetto ad altri metodi di layout
- Potrebbe non essere supportato nei browser molto vecchi (ma ha un buon supporto nei browser moderni)

## Quando usare Grid vs Flexbox

- **Usa Grid quando:**
  - Hai bisogno di un layout bidimensionale (righe e colonne)
  - Vuoi allineare elementi sia orizzontalmente che verticalmente in una struttura a griglia
  - Hai un layout complesso con elementi di dimensioni diverse
  - Vuoi posizionare elementi in modo preciso

- **Usa Flexbox quando:**
  - Hai bisogno di un layout unidimensionale (riga o colonna)
  - Vuoi distribuire lo spazio tra elementi in una singola direzione
  - Hai un layout semplice come una barra di navigazione o un elenco di elementi
  - Vuoi allineare elementi all'interno di un contenitore

Spesso, la soluzione migliore è utilizzare entrambi: Grid per il layout generale della pagina e Flexbox per componenti specifici all'interno della griglia.

## Navigazione
- [📑 Indice](./README.md)
- [⬅️ Flexbox](./03-Flexbox.md)
- [➡️ Torna all'indice](../README.md)