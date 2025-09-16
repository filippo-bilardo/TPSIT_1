# Tecniche di posizionamento con CSS

## Modello di posizionamento CSS

Il modello di posizionamento CSS definisce come gli elementi vengono disposti all'interno della pagina web. Comprendere questo modello è fondamentale per creare layout complessi e gestire correttamente la disposizione degli elementi.

Il flusso normale del documento rappresenta il modo in cui gli elementi HTML vengono disposti quando non si applicano tecniche di posizionamento specifiche. In questo flusso, gli elementi block occupano l'intera larghezza disponibile e vengono impilati verticalmente, mentre gli elementi inline fluiscono orizzontalmente all'interno del loro contenitore.

```html
<div>Questo è un elemento block che occupa tutta la larghezza disponibile.</div>
<span>Questo è un elemento inline</span> <span>che fluisce orizzontalmente.</span>
```

Il box model è un concetto fondamentale che influenza il posizionamento degli elementi. Ogni elemento HTML è rappresentato come un rettangolo composto da:
- Content: l'area che contiene il contenuto effettivo
- Padding: lo spazio tra il contenuto e il bordo
- Border: il bordo che circonda il padding
- Margin: lo spazio esterno al bordo

```css
.box {
  width: 300px; /* larghezza del contenuto */
  padding: 20px; /* spazio interno */
  border: 2px solid black; /* bordo */
  margin: 30px; /* spazio esterno */
  /* Larghezza totale: 300 + 40 + 4 + 60 = 404px */
}
```

La proprietà `box-sizing` può modificare il calcolo delle dimensioni:

```css
.box {
  box-sizing: border-box; /* width e height includono padding e border */
  width: 300px;
  padding: 20px;
  border: 2px solid black;
  /* Larghezza totale: 300px (contenuto ridotto a 256px) */
}
```

I tipi di box influenzano il comportamento di visualizzazione degli elementi:

- **Block**: occupano l'intera larghezza disponibile e creano un'interruzione di riga
- **Inline**: occupano solo lo spazio necessario al loro contenuto e non creano interruzioni di riga
- **Inline-block**: combinano caratteristiche di entrambi, permettendo di impostare dimensioni mantenendo il flusso inline

```css
.block { display: block; }
.inline { display: inline; }
.inline-block { display: inline-block; }
```

Il contesto di formattazione determina come gli elementi vengono disposti e interagiscono tra loro. Lo stacking context controlla invece come gli elementi si sovrappongono lungo l'asse Z:

```css
.new-context {
  position: relative;
  z-index: 1;
  /* Crea un nuovo stacking context */
}
```

## Proprietà position e i suoi valori

La proprietà `position` è il cuore del sistema di posizionamento CSS e offre diverse modalità per controllare la disposizione degli elementi.

**Static** è il posizionamento predefinito, in cui gli elementi seguono il normale flusso del documento. In questa modalità, le proprietà di offset (top, right, bottom, left) e z-index non hanno effetto:

```css
.default {
  position: static;
  /* top, right, bottom, left e z-index non hanno effetto */
}
```

**Relative** posiziona l'elemento rispetto alla sua posizione normale nel flusso. L'elemento mantiene il suo spazio originale nel layout, anche quando spostato:

```css
.relative-example {
  position: relative;
  top: 20px;
  left: 30px;
  /* Spostato di 20px verso il basso e 30px verso destra rispetto alla posizione originale */
}
```

**Absolute** rimuove l'elemento dal flusso normale e lo posiziona rispetto all'antenato posizionato più vicino (un elemento con position diverso da static). Se non esiste un antenato posizionato, l'elemento si posiziona rispetto al viewport:

```css
.container {
  position: relative;
  height: 200px;
}

.absolute-example {
  position: absolute;
  top: 50px;
  right: 20px;
  /* Posizionato a 50px dall'alto e 20px dalla destra del container */
}
```

**Fixed** posiziona l'elemento rispetto al viewport, mantenendolo fisso anche durante lo scorrimento della pagina:

```css
.fixed-header {
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  background-color: white;
  box-shadow: 0 2px 5px rgba(0,0,0,0.1);
  /* Rimane in cima alla pagina durante lo scorrimento */
}
```

**Sticky** è un ibrido tra relative e fixed. L'elemento si comporta come relative fino a quando non raggiunge una soglia specificata, poi diventa fixed:

```css
.sticky-nav {
  position: sticky;
  top: 0;
  background-color: white;
  /* Si comporta normalmente fino a quando raggiunge il bordo superiore del viewport,
     poi rimane visibile in cima durante lo scorrimento */
}
```

## Coordinate di posizionamento

Le proprietà `top`, `right`, `bottom` e `left` specificano la distanza dell'elemento dai bordi del suo contenitore di riferimento quando si utilizzano position diverse da static:

```css
.positioned {
  position: absolute;
  top: 0; /* 0px dal bordo superiore */
  right: 20px; /* 20px dal bordo destro */
  bottom: 30px; /* 30px dal bordo inferiore */
  left: 10px; /* 10px dal bordo sinistro */
}
```

Le unità di misura per il posizionamento possono essere assolute (px) o relative (%, em, rem, vw, vh):

```css
.absolute-units {
  position: absolute;
  top: 50px; /* Unità assoluta */
}

.relative-units {
  position: absolute;
  top: 10%; /* 10% dell'altezza del contenitore */
  left: 5vw; /* 5% della larghezza del viewport */
}
```

La proprietà `z-index` controlla la sovrapposizione degli elementi lungo l'asse Z. Valori più alti appaiono sopra elementi con valori più bassi:

```css
.back-layer {
  position: relative;
  z-index: 1;
}

.middle-layer {
  position: relative;
  z-index: 2;
}

.front-layer {
  position: relative;
  z-index: 3;
}
```

Problemi comuni con il posizionamento includono:

1. **Sovrapposizioni inaspettate**: risolvibili con z-index appropriati
2. **Elementi che escono dal flusso**: gestibili con dimensioni appropriate dei contenitori
3. **Stacking context annidati**: z-index funziona solo all'interno dello stesso stacking context

```css
/* Soluzione per contenere elementi absolute */
.container {
  position: relative;
  overflow: hidden; /* Contiene gli elementi che potrebbero fuoriuscire */
}
```

## Tecniche di centratura

La centratura degli elementi è una delle operazioni più comuni nel layout CSS. Per elementi block, la centratura orizzontale tradizionale utilizza margin auto:

```css
.center-block {
  width: 80%; /* Deve avere una larghezza definita */
  max-width: 1200px;
  margin-left: auto;
  margin-right: auto;
}
```

Per elementi inline, si può utilizzare text-align sul contenitore:

```css
.center-inline {
  text-align: center;
}
```

La centratura verticale è stata storicamente più complessa. Con le tecniche moderne, Flexbox offre la soluzione più elegante:

```css
.center-flex {
  display: flex;
  justify-content: center; /* Centratura orizzontale */
  align-items: center; /* Centratura verticale */
  height: 300px; /* Altezza definita necessaria per la centratura verticale */
}
```

Con Grid, la centratura è altrettanto semplice:

```css
.center-grid {
  display: grid;
  place-items: center; /* Centratura sia orizzontale che verticale */
  height: 300px;
}
```

Per browser datati, esistono tecniche legacy come il posizionamento assoluto con transform:

```css
.center-legacy {
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
}
```

## Float e clear

La proprietà `float` è stata originariamente progettata per far fluire il testo attorno alle immagini, ma è stata ampiamente utilizzata per creare layout prima dell'avvento di Flexbox e Grid:

```css
.float-left {
  float: left;
  margin-right: 15px;
}

.float-right {
  float: right;
  margin-left: 15px;
}
```

Un problema comune con i float è il collasso dei contenitori. La soluzione tradizionale è il "clearfix":

```css
.clearfix::after {
  content: "";
  display: table;
  clear: both;
}
```

La proprietà `clear` impedisce agli elementi di affiancarsi a elementi flottanti:

```css
.clear-left { clear: left; } /* Non si affianca a elementi con float: left */
.clear-right { clear: right; } /* Non si affianca a elementi con float: right */
.clear-both { clear: both; } /* Non si affianca a nessun elemento flottante */
```

I float presentano diverse limitazioni per il layout moderno:
- Difficoltà nel centrare verticalmente
- Complessità nella creazione di layout responsive
- Problemi con l'uguale altezza delle colonne

Le alternative moderne includono Flexbox per layout unidimensionali e Grid per layout bidimensionali.

## Posizionamento con Flexbox

Flexbox eccelle nell'allineamento e nella distribuzione dello spazio lungo un singolo asse. L'allineamento principale (justify-content) controlla la distribuzione degli elementi lungo l'asse principale:

```css
.flex-container {
  display: flex;
  justify-content: space-between; /* Distribuisce gli elementi con spazio uguale tra loro */
}
```

L'allineamento trasversale (align-items) controlla l'allineamento degli elementi lungo l'asse secondario:

```css
.flex-container {
  display: flex;
  align-items: center; /* Centra gli elementi verticalmente (in un flex-row) */
}
```

La direzione e l'ordine degli elementi possono essere facilmente controllati:

```css
.flex-container {
  display: flex;
  flex-direction: row-reverse; /* Inverte l'ordine orizzontale */
}

.flex-item {
  order: -1; /* Sposta l'elemento all'inizio */
}
```

La distribuzione dello spazio può essere gestita con proprietà come flex-grow, flex-shrink e flex-basis:

```css
.flex-item-grow {
  flex-grow: 1; /* Assorbe lo spazio extra disponibile */
}

.flex-item-fixed {
  flex: 0 0 200px; /* Non cresce, non si riduce, larghezza fissa di 200px */
}
```

Flexbox è ideale per:
- Barre di navigazione
- Card con footer allineati
- Centratura di contenuti
- Layout a una dimensione (righe o colonne)

## Posizionamento con Grid

CSS Grid permette di definire layout bidimensionali complessi con righe e colonne. La definizione della griglia avviene specificando le dimensioni delle tracce:

```css
.grid-container {
  display: grid;
  grid-template-columns: 1fr 2fr 1fr; /* Tre colonne con proporzioni 1:2:1 */
  grid-template-rows: auto 300px auto; /* Tre righe con altezze diverse */
  gap: 20px; /* Spazio tra le celle */
}
```

Il posizionamento preciso degli elementi può essere controllato specificando le linee di inizio e fine:

```css
.grid-item {
  grid-column: 1 / 3; /* Dalla linea 1 alla linea 3 (occupa 2 colonne) */
  grid-row: 2 / 4; /* Dalla linea 2 alla linea 4 (occupa 2 righe) */
}
```

Le aree di griglia permettono di definire layout con nomi descrittivi:

```css
.grid-container {
  display: grid;
  grid-template-areas:
    "header header header"
    "sidebar content content"
    "footer footer footer";
  grid-template-columns: 1fr 3fr 1fr;
}

.header { grid-area: header; }
.sidebar { grid-area: sidebar; }
.content { grid-area: content; }
.footer { grid-area: footer; }
```

I template permettono di creare layout complessi in modo dichiarativo:

```css
.grid-container {
  display: grid;
  grid-template-columns: repeat(12, 1fr);
  grid-auto-rows: minmax(100px, auto);
  gap: 20px;
}

.featured {
  grid-column: span 8;
  grid-row: span 2;
}

.sidebar {
  grid-column: 9 / -1;
  grid-row: 1 / 3;
}
```

## Tecniche responsive di posizionamento

L'adattamento del posizionamento a diverse dimensioni dello schermo è essenziale per un'esperienza utente ottimale. Le media queries permettono di applicare stili diversi in base alle caratteristiche del dispositivo:

```css
/* Layout di base (mobile) */
.container {
  display: flex;
  flex-direction: column;
}

/* Layout per tablet */
@media (min-width: 768px) {
  .container {
    flex-direction: row;
  }
  
  .sidebar {
    width: 30%;
  }
  
  .main-content {
    width: 70%;
  }
}

/* Layout per desktop */
@media (min-width: 1200px) {
  .container {
    max-width: 1200px;
    margin: 0 auto;
  }
}
```

Le tecniche di posizionamento responsive spesso combinano diversi approcci:

- Flexbox per layout unidimensionali adattivi
- Grid per layout bidimensionali complessi
- Posizionamento relativo e assoluto per sovrapposizioni e effetti speciali
- Unità relative (%, em, rem, vw, vh) per dimensioni fluide

## Conclusione

Le tecniche di posizionamento CSS rappresentano un aspetto fondamentale dello sviluppo web moderno, offrendo gli strumenti necessari per creare layout complessi, flessibili e visivamente accattivanti. La comprensione del modello di posizionamento CSS, inclusi il flusso normale, il box model e i diversi tipi di posizionamento, è essenziale per ogni sviluppatore web.

Con l'evoluzione del CSS, abbiamo assistito a un significativo miglioramento nelle capacità di layout, passando da soluzioni basate su float e posizionamento assoluto a tecnologie moderne come Flexbox e Grid. Queste nuove tecnologie non solo semplificano la creazione di layout complessi, ma offrono anche maggiore flessibilità e controllo, riducendo la necessità di hack e soluzioni alternative.

Implementare le tecniche di posizionamento discusse in questo capitolo vi permetterà di creare interfacce web responsive, accessibili e visivamente coerenti su tutti i dispositivi. Ricordate che un buon layout non è solo una questione estetica, ma influisce direttamente sull'usabilità, l'accessibilità e l'esperienza complessiva dell'utente.

---

### Navigazione
- [📑 Indice](<../README.md>)
- [⬅️ Layout responsivi e flessibili](<02_Layout_responsivi_flessibili.md>)
- [➡️ Form HTML](<../5. Form e Input/01_Form_HTML.md>)