# Proprietà Display

La proprietà `display` è una delle proprietà CSS più importanti per il controllo del layout. Essa determina come un elemento viene visualizzato nel flusso del documento.

## Valori principali della proprietà display

### display: block

Gli elementi con `display: block` occupano tutto lo spazio disponibile in larghezza e iniziano sempre su una nuova riga.

```css
.elemento-block {
  display: block;
}
```

Caratteristiche degli elementi block:
- Occupano tutta la larghezza disponibile
- Iniziano sempre su una nuova riga
- Rispettano le proprietà di larghezza e altezza
- Possono contenere altri elementi block e inline
- Esempi di elementi block nativi: `<div>`, `<p>`, `<h1>` - `<h6>`, `<section>`, `<article>`

### display: inline

Gli elementi con `display: inline` occupano solo lo spazio necessario al loro contenuto e non forzano interruzioni di riga.

```css
.elemento-inline {
  display: inline;
}
```

Caratteristiche degli elementi inline:
- Occupano solo lo spazio necessario al loro contenuto
- Non iniziano su una nuova riga
- Ignorano le proprietà di larghezza e altezza
- Rispettano solo i margini orizzontali (left e right)
- Esempi di elementi inline nativi: `<span>`, `<a>`, `<strong>`, `<em>`, `<img>`

### display: inline-block

Gli elementi con `display: inline-block` combinano caratteristiche di entrambi i tipi precedenti.

```css
.elemento-inline-block {
  display: inline-block;
}
```

Caratteristiche degli elementi inline-block:
- Si comportano come elementi inline (non forzano interruzioni di riga)
- Rispettano le proprietà di larghezza e altezza come gli elementi block
- Rispettano tutti i margini e i padding
- Utili per creare layout a colonne senza utilizzare float

### display: none

Gli elementi con `display: none` vengono completamente rimossi dal flusso del documento e non occupano spazio.

```css
.elemento-nascosto {
  display: none;
}
```

Differenza con `visibility: hidden`:
- `display: none` rimuove completamente l'elemento dal flusso del documento
- `visibility: hidden` nasconde l'elemento ma mantiene lo spazio che occuperebbe

## Altri valori di display

### display: flex

Imposta un contenitore come flexbox, un modello di layout unidimensionale.

```css
.contenitore-flex {
  display: flex;
}
```

### display: grid

Imposta un contenitore come grid, un modello di layout bidimensionale.

```css
.contenitore-grid {
  display: grid;
}
```

### display: table e correlati

Permette di simulare il comportamento delle tabelle HTML.

```css
.tabella {
  display: table;
}
.riga {
  display: table-row;
}
.cella {
  display: table-cell;
}
```

## Esempi pratici

### Creazione di un menu di navigazione orizzontale

```html
<nav>
  <ul class="menu">
    <li><a href="#">Home</a></li>
    <li><a href="#">Chi siamo</a></li>
    <li><a href="#">Servizi</a></li>
    <li><a href="#">Contatti</a></li>
  </ul>
</nav>
```

```css
.menu {
  list-style: none;
  padding: 0;
  margin: 0;
}

.menu li {
  display: inline-block;
  margin-right: 20px;
}

.menu a {
  text-decoration: none;
  color: #333;
  padding: 5px 10px;
}

.menu a:hover {
  background-color: #f0f0f0;
}
```

## Considerazioni sulla compatibilità

La maggior parte dei valori della proprietà `display` sono ben supportati nei browser moderni. Tuttavia, per i valori più recenti come `flex` e `grid`, potrebbe essere necessario verificare la compatibilità con browser più datati.

## Navigazione
- [📑 Indice](./README.md)
- [➡️ Posizionamento CSS](./02-PosizionamentoCSS.md)