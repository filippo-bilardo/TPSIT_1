# Concetti di Layout

## Indice dei contenuti

- [Introduzione ai Layout CSS](#introduzione-ai-layout-css)
  - [Evoluzione dei metodi di layout](#evoluzione-dei-metodi-di-layout)
  - [Importanza di un buon layout](#importanza-di-un-buon-layout)
- [Proprietà Display](#proprietà-display)
  - [Block vs Inline](#block-vs-inline)
  - [Inline-block](#inline-block)
  - [None e visibility](#none-e-visibility)
  - [Altri valori di display](#altri-valori-di-display)
- [Posizionamento](#posizionamento)
  - [Static](#static)
  - [Relative](#relative)
  - [Absolute](#absolute)
  - [Fixed](#fixed)
  - [Sticky](#sticky)
- [Z-index e sovrapposizione](#z-index-e-sovrapposizione)
  - [Contesto di sovrapposizione](#contesto-di-sovrapposizione)
  - [Gestione degli elementi sovrapposti](#gestione-degli-elementi-sovrapposti)
- [Overflow e Clip](#overflow-e-clip)
  - [Gestione del contenuto in eccesso](#gestione-del-contenuto-in-eccesso)
  - [Proprietà clip e clip-path](#proprietà-clip-e-clip-path)
- [Tecniche di centratura](#tecniche-di-centratura)
  - [Centratura orizzontale](#centratura-orizzontale)
  - [Centratura verticale](#centratura-verticale)
  - [Centratura perfetta](#centratura-perfetta)
- [Layout tradizionale con float](#layout-tradizionale-con-float)
  - [Utilizzo di float](#utilizzo-di-float)
  - [Clearfix e problemi comuni](#clearfix-e-problemi-comuni)
- [Domande di autovalutazione](#domande-di-autovalutazione)
- [Esercizi pratici](#esercizi-pratici)
- [Risorse aggiuntive](#risorse-aggiuntive)

## Introduzione ai Layout CSS

### Evoluzione dei metodi di layout

Il CSS ha visto una significativa evoluzione nei metodi di layout nel corso degli anni:

1. **Layout basati su tabelle** - Nei primi giorni del web, le tabelle HTML venivano utilizzate per creare layout, un approccio ora considerato obsoleto e non semantico.

2. **Layout con float** - L'uso delle proprietà `float` e `clear` è stato il metodo principale per creare layout multi-colonna per molti anni.

3. **Layout con positioning** - Le proprietà `position` hanno offerto maggiore controllo sul posizionamento degli elementi.

4. **Flexbox** - Introdotto per semplificare la creazione di layout flessibili in una dimensione (riga o colonna).

5. **CSS Grid** - Il sistema di layout più potente, progettato specificamente per layout bidimensionali complessi.

Oggi, i moderni layout web utilizzano spesso una combinazione di questi metodi, scegliendo quello più appropriato per ogni situazione specifica.

### Importanza di un buon layout

Un layout ben progettato è fondamentale per:

- **Usabilità** - Facilita la navigazione e l'interazione con il contenuto
- **Accessibilità** - Garantisce che il contenuto sia accessibile a tutti gli utenti
- **Responsività** - Si adatta a diverse dimensioni di schermo e dispositivi
- **Estetica** - Migliora l'aspetto visivo e l'esperienza utente
- **Performance** - Un layout efficiente può migliorare le prestazioni della pagina

## Proprietà Display

La proprietà `display` è fondamentale per controllare come un elemento viene visualizzato nel flusso del documento.

### Block vs Inline

**Elementi Block:**

```css
.block-element {
  display: block;
}
```

Caratteristiche:
- Occupano l'intera larghezza disponibile
- Iniziano sempre su una nuova riga
- Rispettano le proprietà di larghezza e altezza
- Esempi di elementi block nativi: `<div>`, `<p>`, `<h1>-<h6>`, `<section>`

**Elementi Inline:**

```css
.inline-element {
  display: inline;
}
```

Caratteristiche:
- Occupano solo lo spazio necessario al loro contenuto
- Non forzano una nuova riga
- Ignorano le proprietà di larghezza e altezza
- Rispettano solo i margini orizzontali, non quelli verticali
- Esempi di elementi inline nativi: `<span>`, `<a>`, `<strong>`, `<em>`

### Inline-block

```css
.inline-block-element {
  display: inline-block;
}
```

Caratteristiche:
- Combinazione di inline e block
- Non forzano una nuova riga (come inline)
- Rispettano larghezza, altezza e tutti i margini (come block)
- Utile per creare elementi che fluiscono come testo ma possono essere dimensionati

Esempio pratico:

```html
<div class="container">
  <div class="box">Box 1</div>
  <div class="box">Box 2</div>
  <div class="box">Box 3</div>
</div>
```

```css
.container {
  text-align: center;
}

.box {
  display: inline-block;
  width: 150px;
  height: 100px;
  margin: 10px;
  background-color: #f0f0f0;
  border: 1px solid #333;
  text-align: center;
  line-height: 100px;
}
```

### None e visibility

**Display None:**

```css
.hidden-element {
  display: none;
}
```

- Rimuove completamente l'elemento dal flusso del documento
- Non occupa spazio nella pagina
- Non è accessibile agli screen reader (problemi di accessibilità)

**Visibility Hidden:**

```css
.invisible-element {
  visibility: hidden;
}
```

- Nasconde l'elemento ma mantiene il suo spazio nella pagina
- L'elemento è invisibile ma continua a occupare spazio
- Utile quando si vuole nascondere temporaneamente un elemento senza modificare il layout

### Altri valori di display

Altre proprietà display comuni:

- `display: flex` - Attiva il layout Flexbox
- `display: grid` - Attiva il layout CSS Grid
- `display: table` e correlati (`table-row`, `table-cell`, ecc.) - Emulano il comportamento delle tabelle
- `display: contents` - Rimuove il box dell'elemento ma mantiene i suoi figli nel flusso

## Posizionamento

La proprietà `position` determina come un elemento viene posizionato nel documento.

### Static

```css
.static-element {
  position: static;
}
```

- Valore predefinito per tutti gli elementi
- L'elemento segue il normale flusso del documento
- Le proprietà `top`, `right`, `bottom`, `left` e `z-index` non hanno effetto

### Relative

```css
.relative-element {
  position: relative;
  top: 20px;
  left: 30px;
}
```

- L'elemento viene posizionato relativamente alla sua posizione normale
- Mantiene il suo spazio nel flusso del documento
- Crea un nuovo contesto di posizionamento per gli elementi figli con position absolute
- Le proprietà `top`, `right`, `bottom` e `left` spostano l'elemento dalla sua posizione normale

### Absolute

```css
.absolute-element {
  position: absolute;
  top: 50px;
  left: 50px;
}
```

- L'elemento viene rimosso dal flusso normale del documento
- Viene posizionato relativamente all'antenato posizionato più vicino (un elemento con position diverso da static)
- Se non ci sono antenati posizionati, si posiziona rispetto al viewport
- Non mantiene il suo spazio nel layout

Esempio pratico:

```html
<div class="container">
  <div class="box">Elemento posizionato</div>
</div>
```

```css
.container {
  position: relative;
  width: 300px;
  height: 200px;
  border: 2px solid #333;
}

.box {
  position: absolute;
  top: 20px;
  right: 20px;
  width: 100px;
  height: 50px;
  background-color: #f0f0f0;
  border: 1px solid #999;
  text-align: center;
  line-height: 50px;
}
```

### Fixed

```css
.fixed-element {
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  background-color: #333;
  color: white;
  padding: 10px;
}
```

- L'elemento viene rimosso dal flusso normale del documento
- Viene posizionato relativamente al viewport (finestra del browser)
- Rimane nella stessa posizione anche durante lo scorrimento della pagina
- Comunemente usato per header fissi, barre di navigazione e banner

### Sticky

```css
.sticky-element {
  position: sticky;
  top: 0;
  background-color: #f0f0f0;
  padding: 10px;
  border-bottom: 1px solid #ccc;
}
```

- Ibrido tra `relative` e `fixed`
- Si comporta come `relative` finché non raggiunge una soglia specificata (es. `top: 0`)
- Diventa `fixed` quando raggiunge la soglia durante lo scorrimento
- Rimane confinato all'interno del suo contenitore genitore
- Utile per intestazioni di sezione che rimangono visibili durante lo scorrimento

## Z-index e sovrapposizione

### Contesto di sovrapposizione

La proprietà `z-index` controlla l'ordine di sovrapposizione degli elementi posizionati (non static):

```css
.element-back {
  position: absolute;
  z-index: 1;
}

.element-front {
  position: absolute;
  z-index: 2; /* Appare sopra element-back */
}
```

Regole importanti:
- Funziona solo su elementi posizionati (position diverso da static)
- Valori più alti appaiono sopra valori più bassi
- Può accettare valori negativi
- Crea un nuovo contesto di sovrapposizione

### Gestione degli elementi sovrapposti

I contesti di sovrapposizione possono essere complessi:

```html
<div class="parent1"><!-- z-index: 10 -->
  <div class="child1"><!-- z-index: 1 --></div>
</div>
<div class="parent2"><!-- z-index: 5 -->
  <div class="child2"><!-- z-index: 100 --></div>
</div>
```

In questo esempio, `child1` apparirà sopra `child2` nonostante abbia un z-index inferiore, perché il contesto di sovrapposizione del genitore `parent1` ha priorità su `parent2`.

## Overflow e Clip

### Gestione del contenuto in eccesso

La proprietà `overflow` controlla cosa succede quando il contenuto è troppo grande per il suo contenitore:

```css
.container {
  width: 300px;
  height: 200px;
  overflow: auto; /* Aggiunge barre di scorrimento quando necessario */
}
```

Valori principali:
- `visible` (default) - Il contenuto in eccesso è visibile fuori dal contenitore
- `hidden` - Il contenuto in eccesso viene tagliato
- `scroll` - Aggiunge sempre barre di scorrimento
- `auto` - Aggiunge barre di scorrimento solo quando necessario

È possibile controllare separatamente l'overflow orizzontale e verticale:

```css
.container {
  overflow-x: hidden; /* Nasconde il contenuto che eccede orizzontalmente */
  overflow-y: auto;   /* Aggiunge barre di scorrimento verticali quando necessario */
}
```

### Proprietà clip e clip-path

Le proprietà `clip` (obsoleta) e `clip-path` permettono di definire una forma di ritaglio per un elemento:

```css
.clipped-element {
  clip-path: polygon(50% 0%, 100% 50%, 50% 100%, 0% 50%);
  /* Crea una forma a diamante */
}
```

La proprietà `clip-path` supporta diverse forme:
- `inset()` - Rettangolo con possibili angoli arrotondati
- `circle()` - Cerchio
- `ellipse()` - Ellisse
- `polygon()` - Poligono personalizzato
- `url()` - Riferimento a un elemento SVG

## Tecniche di centratura

### Centratura orizzontale

**Per elementi block:**

```css
.center-block {
  width: 300px; /* Deve avere una larghezza definita */
  margin-left: auto;
  margin-right: auto;
}
```

**Per elementi inline o inline-block:**

```css
.center-inline {
  text-align: center;
}
```

### Centratura verticale

**Con line-height (per testo su una singola riga):**

```css
.center-text {
  height: 100px;
  line-height: 100px; /* Uguale all'altezza */
}
```

**Con position e transform:**

```css
.center-absolute {
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
}
```

### Centratura perfetta

**Con Flexbox:**

```css
.flex-center {
  display: flex;
  justify-content: center; /* Centra orizzontalmente */
  align-items: center;     /* Centra verticalmente */
  height: 300px;
}
```

**Con Grid:**

```css
.grid-center {
  display: grid;
  place-items: center; /* Shorthand per align-items e justify-items */
  height: 300px;
}
```

## Layout tradizionale con float

### Utilizzo di float

Prima dell'avvento di Flexbox e Grid, `float` era il metodo principale per creare layout multi-colonna:

```css
.column {
  float: left;
  width: 33.33%;
  padding: 15px;
  box-sizing: border-box;
}
```

Caratteristiche di float:
- Rimuove parzialmente l'elemento dal flusso normale
- Gli elementi successivi fluiscono intorno all'elemento flottante
- Comunemente usato per layout a colonne e per far fluire il testo intorno alle immagini

### Clearfix e problemi comuni

Il problema principale con i float è che i contenitori genitori non riconoscono l'altezza degli elementi flottanti, causando il "collasso" del contenitore.

La soluzione classica è il "clearfix":

```css
.clearfix::after {
  content: "";
  display: table;
  clear: both;
}
```

Altre tecniche per gestire i float:
- Aggiungere `overflow: auto` o `overflow: hidden` al contenitore
- Utilizzare un elemento con `clear: both` alla fine del contenitore

## Domande di autovalutazione

1. Quali sono le principali differenze tra elementi block e inline?
2. Come funziona il posizionamento absolute e a cosa si riferisce quando determina la posizione di un elemento?
3. Qual è la differenza tra `display: none` e `visibility: hidden`?
4. Come funziona la proprietà z-index e quali sono le sue limitazioni?
5. Quali sono i metodi moderni per centrare perfettamente un elemento sia orizzontalmente che verticalmente?
6. Quali problemi presenta l'utilizzo di float per i layout e come si possono risolvere?
7. Quando è appropriato utilizzare position: sticky e come si comporta durante lo scorrimento?

## Esercizi pratici

1. **Esercizio base**: Crea un header fisso in cima alla pagina che rimane visibile durante lo scorrimento.

2. **Esercizio intermedio**: Implementa un layout a tre colonne utilizzando float, assicurandoti che il contenitore mantenga l'altezza corretta con il clearfix.

3. **Esercizio avanzato**: Crea un menu a discesa che appare quando si passa il mouse su un elemento di navigazione, utilizzando position: absolute per posizionare il sottomenu.

4. **Esercizio creativo**: Progetta una "card" con un'immagine, un titolo e una descrizione. Aggiungi un badge posizionato nell'angolo superiore destro della card utilizzando position: absolute.

## Risorse aggiuntive

- [MDN Web Docs: Layout CSS](https://developer.mozilla.org/en-US/docs/Learn/CSS/CSS_layout)
- [CSS-Tricks: A Complete Guide to Flexbox](https://css-tricks.com/snippets/css/a-guide-to-flexbox/)
- [CSS-Tricks: A Complete Guide to Grid](https://css-tricks.com/snippets/css/complete-guide-grid/)
- [W3Schools: CSS Layout](https://www.w3schools.com/css/css_layout.asp)
- [Smashing Magazine: Understanding CSS Positioning](https://www.smashingmagazine.com/2009/09/absolute-horizontal-vertical-centering-css/)
- [CSS-Tricks: Centering in CSS: A Complete Guide](https://css-tricks.com/centering-css-complete-guide/)

---

- [📑 Indice](../README.md)
- [⬅️ Dimensionamento degli elementi](<../06. Tabelle, Liste, Colonne e Form/05_Form_e_input.md>)
- [➡️ Layout tradizionale con float](<02_Layout_tradizionale_con_float.md>)