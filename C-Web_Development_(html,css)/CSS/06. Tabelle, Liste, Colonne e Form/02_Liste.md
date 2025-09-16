# Liste in CSS

## Indice dei contenuti

- [Introduzione alle liste in CSS](#introduzione-alle-liste-in-css)
- [Tipi di liste HTML](#tipi-di-liste-html)
  - [Liste ordinate](#liste-ordinate)
  - [Liste non ordinate](#liste-non-ordinate)
  - [Liste di definizioni](#liste-di-definizioni)
- [Proprietà CSS per le liste](#proprietà-css-per-le-liste)
  - [list-style-type](#list-style-type)
  - [list-style-position](#list-style-position)
  - [list-style-image](#list-style-image)
  - [list-style (shorthand)](#list-style-shorthand)
- [Stilizzazione avanzata delle liste](#stilizzazione-avanzata-delle-liste)
  - [Marcatori personalizzati](#marcatori-personalizzati)
  - [Liste multilivello](#liste-multilivello)
  - [Contatori CSS](#contatori-css)
- [Menu di navigazione con liste](#menu-di-navigazione-con-liste)
  - [Menu orizzontale](#menu-orizzontale)
  - [Menu verticale](#menu-verticale)
  - [Menu dropdown](#menu-dropdown)
- [Best practice](#best-practice)
- [Domande di autovalutazione](#domande-di-autovalutazione)
- [Esercizi pratici](#esercizi-pratici)
- [Risorse aggiuntive](#risorse-aggiuntive)

## Introduzione alle liste in CSS

Le liste sono elementi fondamentali dell'HTML utilizzati per organizzare e presentare informazioni in modo strutturato. CSS offre numerose proprietà per personalizzare l'aspetto delle liste, trasformandole da semplici elenchi a componenti visivamente accattivanti come menu di navigazione, indici o elenchi di funzionalità.

## Tipi di liste HTML

### Liste ordinate

Le liste ordinate (`<ol>`) mostrano elementi in sequenza numerica o alfabetica:

```html
<ol>
  <li>Primo elemento</li>
  <li>Secondo elemento</li>
  <li>Terzo elemento</li>
</ol>
```

### Liste non ordinate

Le liste non ordinate (`<ul>`) mostrano elementi con punti elenco (bullet points):

```html
<ul>
  <li>Elemento</li>
  <li>Altro elemento</li>
  <li>Ancora un elemento</li>
</ul>
```

### Liste di definizioni

Le liste di definizioni (`<dl>`) associano termini (`<dt>`) alle loro definizioni (`<dd>`):

```html
<dl>
  <dt>HTML</dt>
  <dd>Linguaggio di markup per la creazione di pagine web</dd>
  <dt>CSS</dt>
  <dd>Linguaggio per definire lo stile di documenti HTML</dd>
</dl>
```

## Proprietà CSS per le liste

### list-style-type

Controlla il tipo di marcatore (bullet o numerazione) utilizzato:

```css
ul {
  list-style-type: disc; /* Predefinito per <ul> */
}

ol {
  list-style-type: decimal; /* Predefinito per <ol> */
}
```

Valori comuni per `list-style-type`:

**Per liste non ordinate (`<ul>`):**
- `disc`: cerchio pieno (predefinito)
- `circle`: cerchio vuoto
- `square`: quadrato pieno
- `none`: nessun marcatore

**Per liste ordinate (`<ol>`):**
- `decimal`: numeri (1, 2, 3...)
- `decimal-leading-zero`: numeri con zero iniziale (01, 02, 03...)
- `lower-roman`: numeri romani minuscoli (i, ii, iii...)
- `upper-roman`: numeri romani maiuscoli (I, II, III...)
- `lower-alpha` o `lower-latin`: lettere minuscole (a, b, c...)
- `upper-alpha` o `upper-latin`: lettere maiuscole (A, B, C...)

### list-style-position

Determina se il marcatore è all'interno o all'esterno del flusso del testo:

```css
ul {
  list-style-position: outside; /* Predefinito */
}

ol {
  list-style-position: inside; /* Marcatori all'interno del blocco di testo */
}
```

### list-style-image

Sostituisce il marcatore standard con un'immagine:

```css
ul {
  list-style-image: url('bullet.png');
}
```

### list-style (shorthand)

Combina tutte le proprietà list-style in una sola dichiarazione:

```css
ul {
  list-style: square inside url('bullet.png');
  /* tipo posizione immagine */
}
```

## Stilizzazione avanzata delle liste

### Marcatori personalizzati

Utilizzando pseudo-elementi per un controllo totale sui marcatori:

```css
ul {
  list-style: none; /* Rimuove i marcatori predefiniti */
  padding-left: 0; /* Rimuove il padding predefinito */
}

ul li {
  position: relative;
  padding-left: 1.5em; /* Spazio per il marcatore personalizzato */
}

ul li::before {
  content: '➤'; /* Marcatore personalizzato */
  position: absolute;
  left: 0;
  color: #0066cc;
}
```

### Liste multilivello

Stilizzazione di liste annidate con marcatori diversi per ogni livello:

```css
ul {
  list-style-type: disc;
}

ul ul {
  list-style-type: circle;
}

ul ul ul {
  list-style-type: square;
}
```

### Contatori CSS

Utilizzo dei contatori CSS per numerazioni personalizzate:

```css
ol {
  list-style: none;
  counter-reset: item;
}

ol li {
  counter-increment: item;
}

ol li::before {
  content: counter(item) ". ";
  font-weight: bold;
  color: #0066cc;
}
```

## Menu di navigazione con liste

### Menu orizzontale

```css
.nav-menu {
  list-style: none;
  padding: 0;
  margin: 0;
  display: flex;
}

.nav-menu li {
  margin-right: 20px;
}

.nav-menu a {
  text-decoration: none;
  color: #333;
  padding: 5px 10px;
  display: block;
}

.nav-menu a:hover {
  background-color: #f0f0f0;
}
```

### Menu verticale

```css
.vertical-menu {
  list-style: none;
  padding: 0;
  width: 200px;
}

.vertical-menu li {
  border-bottom: 1px solid #ddd;
}

.vertical-menu a {
  text-decoration: none;
  color: #333;
  padding: 10px 15px;
  display: block;
}

.vertical-menu a:hover {
  background-color: #f0f0f0;
}
```

### Menu dropdown

```css
.dropdown-menu {
  list-style: none;
  padding: 0;
  margin: 0;
  display: flex;
}

.dropdown-menu li {
  position: relative;
}

.dropdown-menu a {
  text-decoration: none;
  color: #333;
  padding: 10px 15px;
  display: block;
}

.dropdown-menu ul {
  list-style: none;
  padding: 0;
  position: absolute;
  top: 100%;
  left: 0;
  background-color: white;
  box-shadow: 0 2px 5px rgba(0,0,0,0.2);
  display: none;
  min-width: 150px;
}

.dropdown-menu li:hover > ul {
  display: block;
}

.dropdown-menu ul a {
  padding: 10px 15px;
}

.dropdown-menu ul a:hover {
  background-color: #f0f0f0;
}
```

## Best practice

1. **Usa il tipo di lista appropriato** per il contenuto (ordinata, non ordinata o di definizione).
2. **Mantieni la semantica HTML** anche quando personalizzi completamente l'aspetto.
3. **Considera l'accessibilità** quando rimuovi i marcatori predefiniti.
4. **Usa pseudo-elementi** per marcatori personalizzati anziché immagini di sfondo quando possibile.
5. **Testa i menu di navigazione su dispositivi mobili** per garantire un'esperienza utente ottimale.
6. **Utilizza unità relative** (em, rem) per il padding e i margini per garantire la scalabilità.
7. **Considera gli stati hover e focus** per migliorare l'interattività.

## Domande di autovalutazione

1. Quali sono le differenze tra `list-style-position: inside` e `list-style-position: outside`?
2. Come si può creare un marcatore personalizzato utilizzando pseudo-elementi?
3. Quali sono i vantaggi dell'utilizzo dei contatori CSS rispetto alle liste ordinate standard?
4. Come si può creare un menu dropdown accessibile utilizzando solo HTML e CSS?
5. Quali sono le principali considerazioni di accessibilità quando si stilizzano le liste?

## Esercizi pratici

1. **Lista personalizzata**: Crea una lista non ordinata con marcatori personalizzati utilizzando pseudo-elementi.
2. **Menu di navigazione**: Implementa un menu di navigazione orizzontale responsive.
3. **Menu dropdown**: Crea un menu dropdown a due livelli senza JavaScript.
4. **Lista numerata personalizzata**: Utilizza i contatori CSS per creare una lista numerata con formattazione personalizzata.
5. **Lista di timeline**: Progetta una lista che rappresenti una timeline di eventi con connettori visivi tra gli elementi.

## Risorse aggiuntive

- [MDN Web Docs: Styling Lists](https://developer.mozilla.org/en-US/docs/Learn/CSS/Styling_text/Styling_lists)
- [CSS-Tricks: List Style Recipes](https://css-tricks.com/list-style-recipes/)
- [A Complete Guide to CSS Counters](https://css-tricks.com/almanac/properties/c/counter-reset/)
- [Accessible Navigation Menus](https://www.w3.org/WAI/tutorials/menus/)

---

[◀ Torna all'indice](../README.md#06-tabelle-liste-colonne-e-form)
[◀ Vai a Tabelle](./01_Tabelle.md)
[▶ Vai a Colonne](./03_Colonne.md)