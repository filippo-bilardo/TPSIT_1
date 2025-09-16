# Box Model in CSS

## Introduzione

Il Box Model è un concetto fondamentale in CSS che descrive come ogni elemento HTML viene rappresentato come un rettangolo (box) con proprietà di contenuto, padding, bordo e margine. Comprendere il Box Model è essenziale per creare layout precisi e gestire correttamente lo spazio tra gli elementi.

## Componenti del Box Model

Il Box Model è composto da quattro componenti principali, dall'interno verso l'esterno:

1. **Content (Contenuto)**: L'area dove viene visualizzato il testo, le immagini o altri media
2. **Padding (Riempimento)**: Lo spazio trasparente attorno al contenuto
3. **Border (Bordo)**: Una linea che circonda il padding e il contenuto
4. **Margin (Margine)**: Lo spazio trasparente esterno al bordo

![Box Model](https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_Box_Model/Introduction_to_the_CSS_box_model/boxmodel.png)

## Proprietà di Dimensione

### Larghezza e Altezza (width e height)

Le proprietà `width` e `height` definiscono la larghezza e l'altezza dell'area del contenuto.

```css
.box {
  width: 300px;
  height: 200px;
}
```

### Larghezza e Altezza Massime e Minime

Le proprietà `min-width`, `max-width`, `min-height` e `max-height` consentono di impostare limiti alle dimensioni degli elementi.

```css
.responsive-box {
  width: 100%;
  max-width: 800px; /* Non supererà mai 800px */
  min-width: 300px; /* Non sarà mai inferiore a 300px */
  height: auto;
  min-height: 200px;
}
```

## Padding

Il padding è lo spazio tra il contenuto e il bordo dell'elemento.

### Sintassi

```css
selettore {
  padding-top: valore;
  padding-right: valore;
  padding-bottom: valore;
  padding-left: valore;
}
```

### Shorthand

La proprietà `padding` è una shorthand che permette di impostare tutti i lati contemporaneamente:

```css
/* Tutti i lati uguali */
.box {
  padding: 20px;
}

/* Verticale | Orizzontale */
.box {
  padding: 10px 20px;
}

/* Top | Orizzontale | Bottom */
.box {
  padding: 10px 20px 15px;
}

/* Top | Right | Bottom | Left */
.box {
  padding: 10px 20px 15px 25px;
}
```

## Border

Il bordo circonda il padding e il contenuto dell'elemento.

### Proprietà Principali

```css
selettore {
  border-width: valore;
  border-style: valore;
  border-color: valore;
}
```

### Stili di Bordo

Alcuni valori comuni per `border-style` includono:
- `solid`: linea continua
- `dashed`: linea tratteggiata
- `dotted`: linea punteggiata
- `double`: doppia linea
- `none`: nessun bordo

### Shorthand

La proprietà `border` è una shorthand che combina larghezza, stile e colore:

```css
.box {
  border: 1px solid #000000;
}
```

### Bordi Arrotondati

La proprietà `border-radius` permette di arrotondare gli angoli del bordo:

```css
.rounded-box {
  border-radius: 10px;
}

.circle {
  border-radius: 50%;
}
```

## Margin

Il margine è lo spazio esterno al bordo che separa l'elemento dagli altri elementi.

### Sintassi

```css
selettore {
  margin-top: valore;
  margin-right: valore;
  margin-bottom: valore;
  margin-left: valore;
}
```

### Shorthand

La proprietà `margin` funziona come la shorthand `padding`:

```css
/* Tutti i lati uguali */
.box {
  margin: 20px;
}

/* Verticale | Orizzontale */
.box {
  margin: 10px 20px;
}

/* Top | Orizzontale | Bottom */
.box {
  margin: 10px 20px 15px;
}

/* Top | Right | Bottom | Left */
.box {
  margin: 10px 20px 15px 25px;
}
```

### Margini Negativi

I margini possono avere valori negativi, che causano la sovrapposizione degli elementi:

```css
.overlap {
  margin-top: -20px;
}
```

### Collasso dei Margini

I margini verticali (top e bottom) di elementi adiacenti possono collassare, combinandosi in un unico margine pari al valore maggiore tra i due:

```css
.paragraph1 {
  margin-bottom: 20px;
}

.paragraph2 {
  margin-top: 15px;
}
/* Il margine tra i due paragrafi sarà di 20px, non 35px */
```

## Box Sizing

La proprietà `box-sizing` determina come vengono calcolate le dimensioni totali di un elemento.

### Valori

- **content-box** (default): `width` e `height` si applicano solo all'area del contenuto
- **border-box**: `width` e `height` includono contenuto, padding e bordo (ma non il margine)

```css
/* Applica border-box a tutti gli elementi */
* {
  box-sizing: border-box;
}

.box {
  width: 300px;
  padding: 20px;
  border: 1px solid black;
  /* Con content-box: larghezza totale = 300 + 40 + 2 = 342px */
  /* Con border-box: larghezza totale = 300px */
}
```

## Esempi Pratici

### Card con Box Model

```css
.card {
  width: 300px;
  padding: 20px;
  margin: 15px;
  border: 1px solid #cccccc;
  border-radius: 8px;
  box-sizing: border-box;
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}
```

### Layout Responsive con Box Model

```css
.container {
  width: 100%;
  max-width: 1200px;
  margin: 0 auto;
  padding: 0 15px;
  box-sizing: border-box;
}

.column {
  width: 33.33%;
  padding: 0 15px;
  box-sizing: border-box;
}

@media (max-width: 768px) {
  .column {
    width: 100%;
    margin-bottom: 20px;
  }
}
```

## Esercizi Pratici

1. Crea una card con bordi arrotondati, padding interno e margini esterni
2. Implementa un layout a due colonne utilizzando il box model
3. Crea un bottone con padding, bordo e hover effect
4. Sperimenta con margini negativi per creare effetti di sovrapposizione

## Risorse Aggiuntive

- [MDN Web Docs: Box Model](https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_Box_Model/Introduction_to_the_CSS_box_model)
- [CSS-Tricks: The Box Model](https://css-tricks.com/the-css-box-model/)
- [W3Schools: CSS Box Model](https://www.w3schools.com/css/css_boxmodel.asp)

## Navigazione del Corso
- [📑 Indice](../README.md)
- [⬅️ Colori e Sfondi](./05-ColoriSfondi.md)
- [➡️ Specificità e Cascata](./07-SpecificitàCascata.md)