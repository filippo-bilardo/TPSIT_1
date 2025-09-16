# Colori e Sfondi in CSS

## Introduzione

I colori e gli sfondi sono elementi fondamentali del design web. CSS offre numerose proprietà per controllare i colori del testo, degli sfondi, dei bordi e di altri elementi della pagina. Un uso efficace dei colori può migliorare significativamente l'aspetto estetico, l'usabilità e l'accessibilità di un sito web.

## Colori in CSS

### Sintassi dei Colori

CSS supporta diversi formati per specificare i colori:

#### Nomi di Colore

CSS include 147 nomi di colori predefiniti.

```css
h1 {
  color: red;
}

p {
  color: steelblue;
}

.avviso {
  color: orange;
}
```

#### Valori Esadecimali

I valori esadecimali sono rappresentati da un cancelletto (#) seguito da sei cifre esadecimali (o tre in forma abbreviata).

```css
body {
  color: #000000; /* Nero */
}

h1 {
  color: #FF0000; /* Rosso */
}

.abbreviato {
  color: #F00; /* Forma abbreviata per #FF0000 */
}
```

#### Valori RGB e RGBA

La funzione `rgb()` specifica i colori usando valori per rosso, verde e blu (da 0 a 255). La funzione `rgba()` aggiunge un canale alpha per la trasparenza (da 0 a 1).

```css
.rgb-esempio {
  color: rgb(255, 0, 0); /* Rosso */
}

.rgba-esempio {
  color: rgba(255, 0, 0, 0.5); /* Rosso semi-trasparente */
}
```

#### Valori HSL e HSLA

La funzione `hsl()` specifica i colori usando tonalità (0-360), saturazione (0%-100%) e luminosità (0%-100%). La funzione `hsla()` aggiunge un canale alpha per la trasparenza.

```css
.hsl-esempio {
  color: hsl(0, 100%, 50%); /* Rosso */
}

.hsla-esempio {
  color: hsla(0, 100%, 50%, 0.5); /* Rosso semi-trasparente */
}
```

### Proprietà di Colore Comuni

#### Colore del Testo (color)

La proprietà `color` imposta il colore del testo di un elemento.

```css
body {
  color: #333333; /* Grigio scuro per il testo principale */
}

h1, h2, h3 {
  color: #0066cc; /* Blu per i titoli */
}

a {
  color: #cc0000; /* Rosso per i link */
}
```

#### Colore di Sfondo (background-color)

La proprietà `background-color` imposta il colore di sfondo di un elemento.

```css
body {
  background-color: #ffffff; /* Sfondo bianco */
}

header {
  background-color: #f5f5f5; /* Grigio chiaro */
}

.evidenziato {
  background-color: #ffffcc; /* Giallo chiaro */
}
```

#### Colore del Bordo (border-color)

La proprietà `border-color` imposta il colore del bordo di un elemento.

```css
.box {
  border: 1px solid;
  border-color: #cccccc; /* Grigio per il bordo */
}

.box-colorato {
  border-top-color: red;
  border-right-color: green;
  border-bottom-color: blue;
  border-left-color: yellow;
}
```

## Sfondi in CSS

### Immagini di Sfondo

#### Impostare un'Immagine di Sfondo (background-image)

La proprietà `background-image` imposta un'immagine come sfondo di un elemento.

```css
body {
  background-image: url('sfondo.jpg');
}

.hero {
  background-image: url('https://esempio.com/immagine.jpg');
}
```

#### Ripetizione dello Sfondo (background-repeat)

La proprietà `background-repeat` controlla come un'immagine di sfondo viene ripetuta.

```css
.repeat {
  background-image: url('pattern.png');
  background-repeat: repeat; /* Ripete sia orizzontalmente che verticalmente (default) */
}

.repeat-x {
  background-image: url('pattern.png');
  background-repeat: repeat-x; /* Ripete solo orizzontalmente */
}

.repeat-y {
  background-image: url('pattern.png');
  background-repeat: repeat-y; /* Ripete solo verticalmente */
}

.no-repeat {
  background-image: url('logo.png');
  background-repeat: no-repeat; /* Non ripete l'immagine */
}
```

#### Posizione dello Sfondo (background-position)

La proprietà `background-position` imposta la posizione iniziale di un'immagine di sfondo.

```css
.centered {
  background-image: url('logo.png');
  background-repeat: no-repeat;
  background-position: center; /* Centra l'immagine */
}

.top-right {
  background-image: url('logo.png');
  background-repeat: no-repeat;
  background-position: top right; /* Posiziona in alto a destra */
}

.custom-position {
  background-image: url('logo.png');
  background-repeat: no-repeat;
  background-position: 20px 50px; /* 20px da sinistra, 50px dall'alto */
}
```

#### Dimensione dello Sfondo (background-size)

La proprietà `background-size` controlla la dimensione dell'immagine di sfondo.

```css
.cover {
  background-image: url('foto.jpg');
  background-size: cover; /* Copre l'intero elemento, mantenendo le proporzioni */
}

.contain {
  background-image: url('foto.jpg');
  background-size: contain; /* Contiene l'intera immagine nell'elemento, mantenendo le proporzioni */
}

.custom-size {
  background-image: url('foto.jpg');
  background-size: 200px 100px; /* Larghezza 200px, altezza 100px */
}
```

#### Attaccamento dello Sfondo (background-attachment)

La proprietà `background-attachment` specifica se un'immagine di sfondo scorre con il contenuto o rimane fissa.

```css
.scroll {
  background-image: url('sfondo.jpg');
  background-attachment: scroll; /* Scorre con il contenuto (default) */
}

.fixed {
  background-image: url('sfondo.jpg');
  background-attachment: fixed; /* Rimane fissa rispetto alla viewport */
}

.local {
  background-image: url('sfondo.jpg');
  background-attachment: local; /* Scorre con il contenuto dell'elemento */
}
```

#### Origine dello Sfondo (background-origin)

La proprietà `background-origin` specifica l'area di posizionamento dell'immagine di sfondo.

```css
.border-box {
  background-image: url('logo.png');
  background-origin: border-box; /* Lo sfondo inizia dal bordo */
}

.padding-box {
  background-image: url('logo.png');
  background-origin: padding-box; /* Lo sfondo inizia dal padding (default) */
}

.content-box {
  background-image: url('logo.png');
  background-origin: content-box; /* Lo sfondo inizia dal contenuto */
}
```

#### Clip dello Sfondo (background-clip)

La proprietà `background-clip` specifica l'area in cui lo sfondo è visibile.

```css
.border-box-clip {
  background-color: gold;
  background-clip: border-box; /* Lo sfondo è visibile fino al bordo (default) */
}

.padding-box-clip {
  background-color: gold;
  background-clip: padding-box; /* Lo sfondo è visibile fino al padding */
}

.content-box-clip {
  background-color: gold;
  background-clip: content-box; /* Lo sfondo è visibile solo nel contenuto */
}
```

### Sfumature (Gradients)

Le sfumature permettono di creare transizioni fluide tra due o più colori.

#### Sfumature Lineari (linear-gradient)

Le sfumature lineari creano una transizione di colore lungo una linea retta.

```css
.gradient-verticale {
  background: linear-gradient(to bottom, #ff0000, #0000ff);
  /* Da rosso in alto a blu in basso */
}

.gradient-orizzontale {
  background: linear-gradient(to right, #ff0000, #0000ff);
  /* Da rosso a sinistra a blu a destra */
}

.gradient-angolato {
  background: linear-gradient(45deg, #ff0000, #0000ff);
  /* Sfumatura a 45 gradi */
}

.gradient-multi-colore {
  background: linear-gradient(to bottom, #ff0000, #ffff00, #0000ff);
  /* Da rosso a giallo a blu */
}

.gradient-con-stop {
  background: linear-gradient(to right, #ff0000 0%, #ffff00 50%, #0000ff 100%);
  /* Rosso a 0%, giallo a 50%, blu a 100% */
}
```

#### Sfumature Radiali (radial-gradient)

Le sfumature radiali creano una transizione di colore che si irradia da un punto centrale.

```css
.gradient-radiale {
  background: radial-gradient(#ff0000, #0000ff);
  /* Da rosso al centro a blu ai bordi */
}

.gradient-radiale-forma {
  background: radial-gradient(circle, #ff0000, #0000ff);
  /* Forma circolare */
}

.gradient-radiale-ellisse {
  background: radial-gradient(ellipse, #ff0000, #0000ff);
  /* Forma ellittica */
}

.gradient-radiale-posizione {
  background: radial-gradient(at top left, #ff0000, #0000ff);
  /* Centro in alto a sinistra */
}

.gradient-radiale-complesso {
  background: radial-gradient(circle at center, #ff0000 0%, #ffff00 50%, #0000ff 100%);
  /* Circolare con stop di colore */
}
```

#### Sfumature Coniche (conic-gradient)

Le sfumature coniche creano una transizione di colore che ruota attorno a un punto centrale.

```css
.gradient-conico {
  background: conic-gradient(#ff0000, #ffff00, #00ff00, #0000ff, #ff0000);
  /* Sfumatura circolare che ruota attorno al centro */
}

.gradient-conico-angolo {
  background: conic-gradient(from 45deg, #ff0000, #0000ff);
  /* Inizia a 45 gradi */
}

.gradient-conico-posizione {
  background: conic-gradient(at top left, #ff0000, #0000ff);
  /* Centro in alto a sinistra */
}

.ruota-colori {
  background: conic-gradient(red, orange, yellow, green, blue, indigo, violet, red);
  /* Ruota dei colori */
}
```

#### Sfumature Ripetute

Le sfumature possono essere ripetute utilizzando le funzioni `repeating-linear-gradient`, `repeating-radial-gradient` e `repeating-conic-gradient`.

```css
.gradient-lineare-ripetuto {
  background: repeating-linear-gradient(45deg, #ff0000, #ff0000 10px, #0000ff 10px, #0000ff 20px);
  /* Strisce alternate rosse e blu */
}

.gradient-radiale-ripetuto {
  background: repeating-radial-gradient(circle, #ff0000, #ff0000 10px, #0000ff 10px, #0000ff 20px);
  /* Cerchi concentrici alternati rossi e blu */
}

.gradient-conico-ripetuto {
  background: repeating-conic-gradient(#ff0000, #0000ff 30deg);
  /* Settori alternati rossi e blu */
}
```

### Proprietà Shorthand (background)

La proprietà `background` è una shorthand che permette di impostare più proprietà di sfondo in una sola dichiarazione.

#### Sintassi

```css
selettore {
  background: [background-color] [background-image] [background-repeat] [background-attachment] [background-position] / [background-size] [background-origin] [background-clip];
}
```

#### Esempi

```css
.esempio-1 {
  background: #f5f5f5 url('logo.png') no-repeat center / cover;
  /* Colore di sfondo grigio chiaro, immagine logo.png non ripetuta, centrata e che copre l'intero elemento */
}

.esempio-2 {
  background: linear-gradient(to right, #ff0000, #0000ff) fixed;
  /* Sfumatura lineare da rosso a blu, fissa rispetto alla viewport */
}

.esempio-3 {
  background: url('pattern.png') repeat-x top left / 50px 50px content-box;
  /* Immagine pattern.png ripetuta orizzontalmente, posizionata in alto a sinistra, dimensione 50x50px, visibile solo nel contenuto */
}
```

## Sfondi Multipli

CSS3 permette di applicare più sfondi a un singolo elemento. Gli sfondi vengono sovrapposti con il primo sfondo specificato in cima.

```css
.sfondi-multipli {
  background:
    url('logo.png') no-repeat top left,
    url('pattern.png') repeat,
    linear-gradient(to bottom, rgba(255,255,255,0.8), rgba(255,255,255,0.2)),
    url('sfondo.jpg') no-repeat center / cover;
  /* Sovrappone: logo in alto a sinistra, pattern ripetuto, sfumatura semi-trasparente e immagine di sfondo che copre tutto */
}
```

## Opacità e Trasparenza

### Opacità dell'Elemento (opacity)

La proprietà `opacity` imposta l'opacità di un intero elemento e dei suoi figli.

```css
.semi-trasparente {
  opacity: 0.5; /* 50% di opacità */
}

.completamente-opaco {
  opacity: 1; /* 100% di opacità (default) */
}

.completamente-trasparente {
  opacity: 0; /* 0% di opacità (invisibile) */
}
```

### Trasparenza del Colore

I formati di colore RGBA e HSLA permettono di specificare la trasparenza solo per il colore, senza influenzare i contenuti dell'elemento.

```css
.sfondo-semi-trasparente {
  background-color: rgba(0, 0, 0, 0.5); /* Nero con 50% di opacità */
}

.testo-semi-trasparente {
  color: rgba(255, 0, 0, 0.7); /* Rosso con 70% di opacità */
}

.bordo-semi-trasparente {
  border: 2px solid rgba(0, 0, 255, 0.3); /* Blu con 30% di opacità */
}
```

## Filtri CSS

I filtri CSS permettono di applicare effetti grafici agli elementi.

```css
.blur {
  filter: blur(5px); /* Sfocatura */
}

.brightness {
  filter: brightness(150%); /* Luminosità aumentata */
}

.contrast {
  filter: contrast(200%); /* Contrasto aumentato */
}

.grayscale {
  filter: grayscale(100%); /* Scala di grigi */
}

.sepia {
  filter: sepia(80%); /* Effetto seppia */
}

.hue-rotate {
  filter: hue-rotate(90deg); /* Rotazione della tonalità */
}

.invert {
  filter: invert(100%); /* Inversione dei colori */
}

.opacity-filter {
  filter: opacity(50%); /* Opacità */
}

.saturate {
  filter: saturate(200%); /* Saturazione aumentata */
}

.drop-shadow {
  filter: drop-shadow(5px 5px 5px rgba(0,0,0,0.5)); /* Ombra */
}

.multiple-filters {
  filter: contrast(150%) brightness(120%) sepia(30%);
  /* Combinazione di filtri */
}
```

## Modalità di Fusione (mix-blend-mode e background-blend-mode)

Le modalità di fusione controllano come i colori di un elemento si fondono con quelli sottostanti.

```css
.overlay-blend {
  mix-blend-mode: overlay;
  /* Il contenuto dell'elemento si fonde con lo sfondo sottostante usando la modalità overlay */
}

.multiply-blend {
  background-image: url('texture.jpg'), linear-gradient(to right, red, blue);
  background-blend-mode: multiply;
  /* La texture e la sfumatura si fondono usando la modalità multiply */
}
```

## Best Practices per Colori e Sfondi

1. **Accessibilità**: Assicurarsi che ci sia sufficiente contrasto tra testo e sfondo per garantire la leggibilità (rapporto di contrasto minimo 4.5:1 per testo normale, 3:1 per testo grande).

2. **Responsive Design**: Utilizzare sfondi che si adattino a diverse dimensioni di schermo (es. `background-size: cover`).

3. **Performance**: Ottimizzare le immagini di sfondo per ridurre i tempi di caricamento. Considerare l'uso di sfumature CSS invece di immagini quando possibile.

4. **Fallback**: Fornire un colore di sfondo solido come fallback per le immagini o le sfumature che potrebbero non essere supportate.

5. **Coerenza**: Mantenere una palette di colori coerente in tutto il sito per una migliore esperienza utente.

6. **Tema Scuro/Chiaro**: Considerare l'implementazione di temi chiari e scuri utilizzando variabili CSS.

7. **Evitare Sfondi Distrattivi**: Gli sfondi non dovrebbero distrarre dal contenuto principale.

## Esempio di Sistema di Colori con Variabili CSS

```css
:root {
  /* Colori primari */
  --color-primary: #0066cc;
  --color-primary-light: #4d94ff;
  --color-primary-dark: #004c99;
  
  /* Colori secondari */
  --color-secondary: #ff6600;
  --color-secondary-light: #ff944d;
  --color-secondary-dark: #cc5200;
  
  /* Colori neutri */
  --color-text: #333333;
  --color-text-light: #666666;
  --color-background: #ffffff;
  --color-background-alt: #f5f5f5;
  --color-border: #dddddd;
  
  /* Colori di stato */
  --color-success: #28a745;
  --color-warning: #ffc107;
  --color-error: #dc3545;
  --color-info: #17a2b8;
}

/* Utilizzo delle variabili */
body {
  color: var(--color-text);
  background-color: var(--color-background);
}

h1, h2, h3 {
  color: var(--color-primary-dark);
}

a {
  color: var(--color-primary);
}

a:hover {
  color: var(--color-primary-dark);
}

.button-primary {
  background-color: var(--color-primary);
  color: white;
}

.button-secondary {
  background-color: var(--color-secondary);
  color: white;
}

.alert-success {
  background-color: var(--color-success);
  color: white;
}

.alert-error {
  background-color: var(--color-error);
  color: white;
}
```

## Conclusione

Le proprietà CSS per colori e sfondi offrono potenti strumenti per migliorare l'aspetto visivo di un sito web. Dalla semplice applicazione di colori solidi alle complesse sfumature e effetti di fusione, queste proprietà permettono di creare design accattivanti e professionali. Ricorda sempre di bilanciare l'estetica con l'accessibilità e le prestazioni per garantire la migliore esperienza utente possibile.

Nel prossimo capitolo, esploreremo il modello di box in CSS, imparando come controllare dimensioni, margini, padding e bordi degli elementi.

## Navigazione del Corso
- [📑 Indice](../README.md)
- [⬅️ Proprietà di Testo](./04-ProprietàTesto.md)
- [➡️ Modello di Box](./06-ModelloBox.md)