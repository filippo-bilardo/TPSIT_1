# Border (Bordo)

## Indice dei contenuti

- [Introduzione ai Bordi](#introduzione-ai-bordi)
  - [Definizione e ruolo nel Box Model](#definizione-e-ruolo-nel-box-model)
  - [Impatto sul layout](#impatto-sul-layout)
- [Proprietà dei Bordi](#proprietà-dei-bordi)
  - [border-width](#border-width)
  - [border-style](#border-style)
  - [border-color](#border-color)
  - [Sintassi abbreviata](#sintassi-abbreviata)
- [Bordi per lato specifico](#bordi-per-lato-specifico)
  - [Controllo individuale dei lati](#controllo-individuale-dei-lati)
  - [Combinazioni di proprietà](#combinazioni-di-proprietà)
- [Bordi arrotondati](#bordi-arrotondati)
  - [border-radius](#border-radius)
  - [Forme creative con border-radius](#forme-creative-con-border-radius)
- [Tecniche avanzate](#tecniche-avanzate)
  - [Bordi con immagini](#bordi-con-immagini)
  - [Bordi multipli](#bordi-multipli)
  - [Animazioni dei bordi](#animazioni-dei-bordi)
- [Domande di autovalutazione](#domande-di-autovalutazione)
- [Esercizi pratici](#esercizi-pratici)
- [Risorse aggiuntive](#risorse-aggiuntive)

## Introduzione ai Bordi

### Definizione e ruolo nel Box Model

Nel Box Model CSS, il bordo (border) è il terzo componente che circonda il contenuto e il padding di un elemento HTML. Il bordo rappresenta un contorno visibile che delimita l'elemento e lo separa dagli altri elementi della pagina.

```css
/* Esempio di elemento con bordo */
.box-con-bordo {
  width: 200px;
  height: 100px;
  padding: 20px;
  border: 2px solid #333; /* Bordo di 2px, stile solido, colore grigio scuro */
  margin: 15px;
  background-color: #f0f0f0;
}
```

### Impatto sul layout

I bordi influenzano le dimensioni totali di un elemento nel Box Model standard (content-box):

- **Larghezza totale** = width + padding-left + padding-right + border-left + border-right
- **Altezza totale** = height + padding-top + padding-bottom + border-top + border-bottom

Questo significa che aggiungere un bordo aumenta le dimensioni dell'elemento, a meno che non si utilizzi `box-sizing: border-box`.

```css
.content-box {
  width: 200px;
  height: 100px;
  border: 10px solid black;
  /* Dimensioni totali: 220px × 120px */
}

.border-box {
  width: 200px;
  height: 100px;
  border: 10px solid black;
  box-sizing: border-box;
  /* Dimensioni totali: 200px × 100px */
}
```

## Proprietà dei Bordi

### border-width

La proprietà `border-width` definisce lo spessore del bordo. Può essere specificata con:

- Valori in unità di misura (px, em, rem, ecc.)
- Valori predefiniti: thin, medium, thick

```css
.elemento {
  /* Valori in unità di misura */
  border-width: 2px;
  
  /* Valori predefiniti */
  border-width: thin;      /* Generalmente 1px */
  border-width: medium;    /* Generalmente 3px */
  border-width: thick;     /* Generalmente 5px */
  
  /* Valori diversi per ogni lato (top, right, bottom, left) */
  border-width: 1px 2px 3px 4px;
}
```

### border-style

La proprietà `border-style` definisce l'aspetto del bordo. I valori possibili sono:

- `none`: Nessun bordo (default)
- `solid`: Linea continua
- `dashed`: Linea tratteggiata
- `dotted`: Linea punteggiata
- `double`: Doppia linea
- `groove`: Effetto inciso
- `ridge`: Effetto in rilievo
- `inset`: Effetto incassato
- `outset`: Effetto sporgente
- `hidden`: Simile a none, ma influisce sul collasso dei bordi nelle tabelle

```css
.bordi-esempi {
  border-width: 5px;
  border-color: #333;
}

.bordo-solid { border-style: solid; }
.bordo-dashed { border-style: dashed; }
.bordo-dotted { border-style: dotted; }
.bordo-double { border-style: double; }
.bordo-groove { border-style: groove; }
.bordo-ridge { border-style: ridge; }
.bordo-inset { border-style: inset; }
.bordo-outset { border-style: outset; }
```

### border-color

La proprietà `border-color` definisce il colore del bordo. Può essere specificata con:

- Nomi di colori: red, blue, green, ecc.
- Valori esadecimali: #FF0000, #0000FF, ecc.
- Valori RGB: rgb(255, 0, 0), rgba(0, 0, 255, 0.5), ecc.
- Valori HSL: hsl(0, 100%, 50%), hsla(240, 100%, 50%, 0.5), ecc.
- `transparent`: Bordo trasparente
- `currentColor`: Eredita il colore del testo dell'elemento

```css
.elemento {
  border-style: solid;
  border-width: 2px;
  
  /* Diversi modi di specificare il colore */
  border-color: red;
  border-color: #FF0000;
  border-color: rgb(255, 0, 0);
  border-color: hsl(0, 100%, 50%);
  
  /* Colori diversi per ogni lato (top, right, bottom, left) */
  border-color: red blue green yellow;
}
```

### Sintassi abbreviata

La proprietà `border` è una sintassi abbreviata che combina `border-width`, `border-style` e `border-color` in un'unica dichiarazione:

```css
.elemento {
  /* Sintassi completa */
  border-width: 2px;
  border-style: solid;
  border-color: #333;
  
  /* Sintassi abbreviata equivalente */
  border: 2px solid #333;
}
```

L'ordine dei valori non è importante, ma è consigliabile seguire la convenzione: width, style, color.

## Bordi per lato specifico

### Controllo individuale dei lati

È possibile controllare separatamente i bordi di ciascun lato dell'elemento:

```css
.elemento {
  /* Bordi completi per lato */
  border-top: 1px solid red;
  border-right: 2px dashed blue;
  border-bottom: 3px dotted green;
  border-left: 4px double yellow;
  
  /* Oppure proprietà individuali per lato */
  border-top-width: 1px;
  border-top-style: solid;
  border-top-color: red;
  
  border-right-width: 2px;
  border-right-style: dashed;
  border-right-color: blue;
  
  /* E così via per gli altri lati */
}
```

### Combinazioni di proprietà

È possibile combinare diverse proprietà per creare effetti interessanti:

```css
.pulsante {
  /* Bordo solo in basso */
  border: none;
  border-bottom: 2px solid #333;
  
  /* Bordo con effetto 3D */
  border-top: 1px solid #fff;
  border-left: 1px solid #fff;
  border-right: 1px solid #000;
  border-bottom: 1px solid #000;
}
```

## Bordi arrotondati

### border-radius

La proprietà `border-radius` permette di creare bordi arrotondati:

```css
.elemento {
  /* Raggio uguale per tutti gli angoli */
  border-radius: 10px;
  
  /* Raggi diversi per ogni angolo (top-left, top-right, bottom-right, bottom-left) */
  border-radius: 5px 10px 15px 20px;
  
  /* Raggi diversi per coppie di angoli (top-left/bottom-right, top-right/bottom-left) */
  border-radius: 5px 10px;
  
  /* Raggi diversi per tre angoli (top-left, top-right/bottom-left, bottom-right) */
  border-radius: 5px 10px 15px;
}
```

È anche possibile specificare raggi diversi per gli assi orizzontale e verticale di ciascun angolo:

```css
.elemento {
  /* Sintassi completa: orizzontale/verticale per ogni angolo */
  border-radius: 10px/20px 30px/40px 50px/60px 70px/80px;
  
  /* Proprietà individuali per angolo */
  border-top-left-radius: 10px 20px;
  border-top-right-radius: 30px 40px;
  border-bottom-right-radius: 50px 60px;
  border-bottom-left-radius: 70px 80px;
}
```

### Forme creative con border-radius

Con `border-radius` è possibile creare forme diverse dal rettangolo standard:

```css
/* Cerchio */
.cerchio {
  width: 100px;
  height: 100px;
  border-radius: 50%;
  background-color: red;
}

/* Ellisse */
.ellisse {
  width: 150px;
  height: 100px;
  border-radius: 50%;
  background-color: blue;
}

/* Pillola */
.pillola {
  width: 200px;
  height: 80px;
  border-radius: 40px;
  background-color: green;
}
```

## Tecniche avanzate

### Bordi con immagini

La proprietà `border-image` permette di utilizzare immagini come bordi:

```css
.elemento {
  border: 15px solid transparent;
  border-image: url('bordo.png') 30 round;
  
  /* Sintassi completa */
  border-image-source: url('bordo.png');
  border-image-slice: 30;
  border-image-width: 15px;
  border-image-outset: 0;
  border-image-repeat: round;
}
```

### Bordi multipli

È possibile simulare bordi multipli utilizzando combinazioni di `border`, `outline` e `box-shadow`:

```css
.bordi-multipli {
  background-color: white;
  border: 5px solid red;
  outline: 5px solid blue;
  box-shadow: 0 0 0 10px green;
  margin: 20px;
}
```

### Animazioni dei bordi

I bordi possono essere animati con le transizioni o le animazioni CSS:

```css
.pulsante {
  border: 2px solid #333;
  transition: border-color 0.3s, border-width 0.3s;
}

.pulsante:hover {
  border-color: #ff0000;
  border-width: 4px;
}

.bordo-animato {
  border: 2px solid #333;
  animation: bordo-lampeggiante 2s infinite;
}

@keyframes bordo-lampeggiante {
  0% { border-color: #333; }
  50% { border-color: #ff0000; }
  100% { border-color: #333; }
}
```

## Domande di autovalutazione

1. Quali sono le tre proprietà principali che compongono un bordo in CSS?
2. Come influisce il bordo sulle dimensioni totali di un elemento nel Box Model standard?
3. Quali sono i diversi stili di bordo disponibili in CSS?
4. Come si crea un bordo arrotondato solo in alcuni angoli di un elemento?
5. Qual è la differenza tra `border` e `outline`?

## Esercizi pratici

1. **Esercizio base**: Crea un elemento div con diversi stili di bordo su ciascun lato. Utilizza colori e spessori diversi per visualizzare chiaramente le differenze.

2. **Esercizio intermedio**: Crea una galleria di immagini con bordi decorativi. Ogni immagine dovrebbe avere un bordo diverso e un effetto hover che modifica il bordo.

3. **Esercizio avanzato**: Crea un pulsante con effetto 3D utilizzando solo le proprietà dei bordi. Il pulsante dovrebbe cambiare aspetto quando viene premuto (stato :active).

## Risorse aggiuntive

- [MDN Web Docs: Border](https://developer.mozilla.org/en-US/docs/Web/CSS/border)
- [MDN Web Docs: Border-radius](https://developer.mozilla.org/en-US/docs/Web/CSS/border-radius)
- [MDN Web Docs: Border-image](https://developer.mozilla.org/en-US/docs/Web/CSS/border-image)
- [CSS-Tricks: Border-radius](https://css-tricks.com/the-shapes-of-css/)
- [W3Schools: CSS Borders](https://www.w3schools.com/css/css_border.asp)
- [Codrops CSS Reference: Border](https://tympanus.net/codrops/css_reference/border/)

---

- [📑 Indice](../README.md)
- [⬅️ Margin e padding](02_Margin_e_padding.md)
- [➡️ Box sizing](04_Box_sizing.md)