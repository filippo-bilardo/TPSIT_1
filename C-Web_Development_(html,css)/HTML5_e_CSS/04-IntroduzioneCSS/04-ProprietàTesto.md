# Proprietà di Testo in CSS

## Introduzione

Le proprietà di testo in CSS permettono di controllare l'aspetto del testo nei documenti HTML. Queste proprietà consentono di modificare caratteristiche come il tipo di font, la dimensione, il colore, la spaziatura e molti altri aspetti tipografici. Una buona tipografia è fondamentale per la leggibilità e l'estetica di un sito web.

## Font e Tipografia

### Famiglia di Font (font-family)

La proprietà `font-family` specifica la famiglia di font da utilizzare per il testo.

#### Sintassi

```css
selettore {
  font-family: valore1, valore2, valore3, famiglia-generica;
}
```

#### Valori

- **Nomi di font specifici**: "Times New Roman", "Arial", "Helvetica", ecc.
- **Famiglie generiche**: serif, sans-serif, monospace, cursive, fantasy

#### Esempio

```css
body {
  font-family: "Helvetica Neue", Arial, sans-serif;
}

h1 {
  font-family: Georgia, "Times New Roman", serif;
}

code {
  font-family: "Courier New", Courier, monospace;
}
```

> **Nota**: È buona pratica specificare più font in ordine di preferenza e terminare con una famiglia generica. Se il browser non supporta il primo font, proverà con il secondo e così via.

### Dimensione del Font (font-size)

La proprietà `font-size` imposta la dimensione del testo.

#### Sintassi

```css
selettore {
  font-size: valore;
}
```

#### Unità di Misura Comuni

- **Pixel (px)**: Unità assoluta, precisa ma non scalabile
- **Em (em)**: Relativa alla dimensione del font dell'elemento genitore
- **Rem (rem)**: Relativa alla dimensione del font dell'elemento root (html)
- **Percentuale (%)**: Relativa alla dimensione del font dell'elemento genitore
- **Viewport Width (vw)**: Relativa alla larghezza della viewport (1vw = 1% della larghezza della viewport)

#### Esempio

```css
body {
  font-size: 16px; /* Dimensione base */
}

h1 {
  font-size: 2rem; /* 2 volte la dimensione del font dell'elemento root */
}

h2 {
  font-size: 1.5em; /* 1.5 volte la dimensione del font dell'elemento genitore */
}

p {
  font-size: 100%; /* Uguale alla dimensione del font dell'elemento genitore */
}

.responsive-text {
  font-size: calc(16px + 0.5vw); /* Dimensione che si adatta alla viewport */
}
```

### Stile del Font (font-style)

La proprietà `font-style` imposta lo stile del font, principalmente per applicare il corsivo.

#### Sintassi

```css
selettore {
  font-style: valore;
}
```

#### Valori

- **normal**: Testo normale
- **italic**: Testo in corsivo
- **oblique**: Testo obliquo (simile al corsivo ma tecnicamente diverso)

#### Esempio

```css
p {
  font-style: normal;
}

em {
  font-style: italic;
}

.citazione {
  font-style: oblique;
}
```

### Peso del Font (font-weight)

La proprietà `font-weight` imposta lo spessore o il peso del font.

#### Sintassi

```css
selettore {
  font-weight: valore;
}
```

#### Valori

- **Valori numerici**: da 100 (più leggero) a 900 (più pesante)
- **normal**: Equivalente a 400
- **bold**: Equivalente a 700
- **lighter**: Più leggero rispetto all'elemento genitore
- **bolder**: Più pesante rispetto all'elemento genitore

#### Esempio

```css
body {
  font-weight: normal; /* o 400 */
}

h1, h2, h3 {
  font-weight: bold; /* o 700 */
}

.sottile {
  font-weight: 300;
}

.extra-bold {
  font-weight: 800;
}
```

### Variante del Font (font-variant)

La proprietà `font-variant` può essere utilizzata per impostare il testo in small-caps (maiuscoletto).

#### Sintassi

```css
selettore {
  font-variant: valore;
}
```

#### Valori

- **normal**: Testo normale
- **small-caps**: Testo in maiuscoletto

#### Esempio

```css
p {
  font-variant: normal;
}

.maiuscoletto {
  font-variant: small-caps;
}
```

### Proprietà Shorthand (font)

La proprietà `font` è una shorthand che permette di impostare più proprietà del font in una sola dichiarazione.

#### Sintassi

```css
selettore {
  font: [font-style] [font-variant] [font-weight] font-size[/line-height] font-family;
}
```

#### Esempio

```css
h1 {
  font: italic bold 2rem/1.2 "Helvetica Neue", Arial, sans-serif;
}

p {
  font: normal small-caps 400 1em/1.5 Georgia, serif;
}
```

> **Nota**: Quando si usa la proprietà shorthand `font`, i valori `font-size` e `font-family` sono obbligatori, mentre gli altri sono opzionali.

## Colore e Decorazione del Testo

### Colore del Testo (color)

La proprietà `color` imposta il colore del testo.

#### Sintassi

```css
selettore {
  color: valore;
}
```

#### Valori

- **Nomi di colore**: red, blue, green, ecc.
- **Valori esadecimali**: #FF0000, #0000FF, #00FF00, ecc.
- **Valori RGB**: rgb(255, 0, 0), rgba(0, 0, 255, 0.5), ecc.
- **Valori HSL**: hsl(0, 100%, 50%), hsla(240, 100%, 50%, 0.5), ecc.

#### Esempio

```css
body {
  color: #333333; /* Grigio scuro */
}

h1 {
  color: rgb(0, 102, 204); /* Blu */
}

.evidenziato {
  color: hsl(60, 100%, 50%); /* Giallo */
}

.semi-trasparente {
  color: rgba(255, 0, 0, 0.7); /* Rosso con 70% di opacità */
}
```

### Decorazione del Testo (text-decoration)

La proprietà `text-decoration` aggiunge decorazioni al testo come sottolineatura, linea sopra o linea attraverso.

#### Sintassi

```css
selettore {
  text-decoration: valore;
}
```

#### Valori

- **none**: Nessuna decorazione
- **underline**: Sottolineatura
- **overline**: Linea sopra il testo
- **line-through**: Linea attraverso il testo

#### Esempio

```css
a {
  text-decoration: none; /* Rimuove la sottolineatura predefinita dai link */
}

.sottolineato {
  text-decoration: underline;
}

.barrato {
  text-decoration: line-through;
}

.sopralineato {
  text-decoration: overline;
}

.decorazione-multipla {
  text-decoration: underline overline;
}
```

### Trasformazione del Testo (text-transform)

La proprietà `text-transform` controlla la capitalizzazione del testo.

#### Sintassi

```css
selettore {
  text-transform: valore;
}
```

#### Valori

- **none**: Nessuna trasformazione
- **capitalize**: Prima lettera di ogni parola in maiuscolo
- **uppercase**: Tutte le lettere in maiuscolo
- **lowercase**: Tutte le lettere in minuscolo

#### Esempio

```css
.normale {
  text-transform: none;
}

.iniziali-maiuscole {
  text-transform: capitalize;
}

.tutto-maiuscolo {
  text-transform: uppercase;
}

.tutto-minuscolo {
  text-transform: lowercase;
}
```

## Allineamento e Spaziatura del Testo

### Allineamento del Testo (text-align)

La proprietà `text-align` imposta l'allineamento orizzontale del testo.

#### Sintassi

```css
selettore {
  text-align: valore;
}
```

#### Valori

- **left**: Allineamento a sinistra
- **right**: Allineamento a destra
- **center**: Allineamento al centro
- **justify**: Allineamento giustificato (testo distribuito per occupare tutta la larghezza)

#### Esempio

```css
p {
  text-align: left; /* Predefinito per lingue LTR (left-to-right) */
}

.centrato {
  text-align: center;
}

.destra {
  text-align: right;
}

.giustificato {
  text-align: justify;
}
```

### Altezza della Linea (line-height)

La proprietà `line-height` imposta l'altezza di una linea di testo, influenzando la spaziatura verticale tra le linee.

#### Sintassi

```css
selettore {
  line-height: valore;
}
```

#### Valori

- **normal**: Valore predefinito (solitamente circa 1.2)
- **Numero**: Moltiplicatore della dimensione del font (es. 1.5)
- **Lunghezza**: Valore specifico (es. 20px)
- **Percentuale**: Relativa alla dimensione del font

#### Esempio

```css
body {
  line-height: 1.6; /* 1.6 volte la dimensione del font */
}

h1 {
  line-height: 1.2; /* Più compatto per i titoli */
}

.spaziato {
  line-height: 2; /* Doppia spaziatura */
}

.specifico {
  line-height: 24px; /* Altezza fissa */
}
```

### Spaziatura tra Lettere (letter-spacing)

La proprietà `letter-spacing` controlla lo spazio tra i caratteri di un testo.

#### Sintassi

```css
selettore {
  letter-spacing: valore;
}
```

#### Valori

- **normal**: Spaziatura predefinita
- **Lunghezza**: Valore positivo (espande) o negativo (comprime)

#### Esempio

```css
p {
  letter-spacing: normal;
}

.espanso {
  letter-spacing: 2px;
}

.compresso {
  letter-spacing: -0.5px;
}

.molto-espanso {
  letter-spacing: 0.5em; /* Relativo alla dimensione del font */
}
```

### Spaziatura tra Parole (word-spacing)

La proprietà `word-spacing` controlla lo spazio tra le parole.

#### Sintassi

```css
selettore {
  word-spacing: valore;
}
```

#### Valori

- **normal**: Spaziatura predefinita
- **Lunghezza**: Valore positivo (espande) o negativo (comprime)

#### Esempio

```css
p {
  word-spacing: normal;
}

.parole-distanziate {
  word-spacing: 5px;
}

.parole-ravvicinate {
  word-spacing: -1px;
}
```

### Rientro del Testo (text-indent)

La proprietà `text-indent` specifica il rientro della prima linea di un blocco di testo.

#### Sintassi

```css
selettore {
  text-indent: valore;
}
```

#### Valori

- **Lunghezza**: Valore positivo (rientro) o negativo (sporgenza)
- **Percentuale**: Relativa alla larghezza dell'elemento contenitore

#### Esempio

```css
p {
  text-indent: 2em; /* Rientro di 2em per la prima linea */
}

.nessun-rientro {
  text-indent: 0;
}

.rientro-negativo {
  text-indent: -20px;
  padding-left: 20px; /* Per evitare che il testo esca dal contenitore */
}
```

## Ombreggiatura e Effetti di Testo

### Ombra del Testo (text-shadow)

La proprietà `text-shadow` aggiunge ombre al testo.

#### Sintassi

```css
selettore {
  text-shadow: offset-x offset-y blur-radius color;
}
```

#### Valori

- **offset-x**: Spostamento orizzontale dell'ombra
- **offset-y**: Spostamento verticale dell'ombra
- **blur-radius**: (Opzionale) Raggio di sfocatura
- **color**: Colore dell'ombra

#### Esempio

```css
h1 {
  text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5);
}

.glow {
  text-shadow: 0 0 10px rgba(255, 255, 0, 0.8);
}

.testo-3d {
  color: #ffffff;
  text-shadow: 1px 1px 0 #000000,
              2px 2px 0 #333333;
}

.testo-contorno {
  color: white;
  text-shadow: -1px -1px 0 #000,
               1px -1px 0 #000,
              -1px 1px 0 #000,
               1px 1px 0 #000;
}
```

### Overflow del Testo (text-overflow)

La proprietà `text-overflow` specifica come segnalare all'utente il contenuto che è stato ritagliato.

#### Sintassi

```css
selettore {
  text-overflow: valore;
}
```

#### Valori

- **clip**: Taglia il testo (predefinito)
- **ellipsis**: Mostra un'ellissi (...) per indicare il testo ritagliato

#### Esempio

```css
.troncato {
  white-space: nowrap;
  overflow: hidden;
  text-overflow: ellipsis;
  max-width: 200px;
}
```

> **Nota**: Per far funzionare `text-overflow`, è necessario impostare anche `overflow: hidden` e in genere `white-space: nowrap`.

### Interruzione delle Parole (word-break e word-wrap)

Queste proprietà controllano come le parole lunghe vengono interrotte quando raggiungono il limite del contenitore.

#### Sintassi

```css
selettore {
  word-break: valore;
  word-wrap: valore; /* Alias: overflow-wrap */
}
```

#### Valori per word-break

- **normal**: Comportamento predefinito
- **break-all**: Può spezzare le parole in qualsiasi punto
- **keep-all**: Non spezza le parole

#### Valori per word-wrap/overflow-wrap

- **normal**: Comportamento predefinito
- **break-word**: Spezza le parole solo quando necessario

#### Esempio

```css
.break-all {
  word-break: break-all;
}

.break-word {
  word-wrap: break-word; /* o overflow-wrap: break-word; */
}

.url-lungo {
  overflow-wrap: break-word;
  word-break: break-all;
}
```

## Font Web e @font-face

La regola `@font-face` permette di utilizzare font personalizzati che non sono installati sul dispositivo dell'utente.

### Sintassi

```css
@font-face {
  font-family: 'NomeFont';
  src: url('percorso/al/font.woff2') format('woff2'),
       url('percorso/al/font.woff') format('woff');
  font-weight: normal;
  font-style: normal;
}
```

### Esempio Completo

```css
/* Definizione del font */
@font-face {
  font-family: 'MioFont';
  src: url('fonts/miofont.woff2') format('woff2'),
       url('fonts/miofont.woff') format('woff');
  font-weight: normal;
  font-style: normal;
}

/* Utilizzo del font */
body {
  font-family: 'MioFont', Arial, sans-serif;
}

/* Variante bold del font */
@font-face {
  font-family: 'MioFont';
  src: url('fonts/miofont-bold.woff2') format('woff2'),
       url('fonts/miofont-bold.woff') format('woff');
  font-weight: bold;
  font-style: normal;
}
```

### Font Web Popolari

Servizi come Google Fonts, Adobe Fonts (precedentemente Typekit) e Font Awesome offrono librerie di font web pronti all'uso.

#### Esempio con Google Fonts

```html
<!-- Nel documento HTML -->
<link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">
```

```css
/* Nel CSS */
body {
  font-family: 'Roboto', sans-serif;
}

h1 {
  font-family: 'Roboto', sans-serif;
  font-weight: 700;
}
```

## Best Practices per la Tipografia Web

1. **Utilizzare un sistema di scale tipografiche** per mantenere coerenza nelle dimensioni dei font
2. **Limitare il numero di font** a 2-3 per pagina per mantenere coerenza e migliorare le prestazioni
3. **Preferire unità relative** (em, rem) per le dimensioni dei font per migliorare l'accessibilità
4. **Impostare una line-height adeguata** (generalmente 1.4-1.6) per migliorare la leggibilità
5. **Considerare la lunghezza delle righe** (idealmente 45-75 caratteri per riga)
6. **Testare la tipografia su diversi dispositivi** per garantire la leggibilità
7. **Utilizzare font fallback appropriati** in caso di problemi di caricamento dei font web
8. **Ottimizzare i file dei font web** utilizzando formati moderni come WOFF2
9. **Considerare il contrasto** tra testo e sfondo per l'accessibilità
10. **Utilizzare variabili CSS** per gestire un sistema tipografico coerente

## Esempio di Sistema Tipografico Completo

```css
:root {
  /* Variabili per i font */
  --font-primary: 'Roboto', sans-serif;
  --font-secondary: 'Georgia', serif;
  --font-code: 'Courier New', monospace;
  
  /* Variabili per le dimensioni */
  --font-size-base: 16px;
  --font-size-small: 0.875rem;
  --font-size-large: 1.125rem;
  --font-size-xl: 1.5rem;
  --font-size-xxl: 2rem;
  
  /* Variabili per i pesi */
  --font-weight-normal: 400;
  --font-weight-bold: 700;
  
  /* Variabili per l'altezza della linea */
  --line-height-tight: 1.2;
  --line-height-normal: 1.5;
  --line-height-loose: 1.8;
}

/* Stili base */
body {
  font-family: var(--font-primary);
  font-size: var(--font-size-base);
  line-height: var(--line-height-normal);
  color: #333;
}

/* Titoli */
h1, h2, h3, h4, h5, h6 {
  font-family: var(--font-secondary);
  line-height: var(--line-height-tight);
  margin-bottom: 0.5em;
}

h1 {
  font-size: var(--font-size-xxl);
  font-weight: var(--font-weight-bold);
}

h2 {
  font-size: var(--font-size-xl);
  font-weight: var(--font-weight-bold);
}

/* Paragrafi */
p {
  margin-bottom: 1rem;
}

/* Testo piccolo */
.text-small {
  font-size: var(--font-size-small);
}

/* Codice */
code, pre {
  font-family: var(--font-code);
  background-color: #f5f5f5;
  padding: 0.2em 0.4em;
  border-radius: 3px;
}

/* Link */
a {
  color: #0066cc;
  text-decoration: none;
}

a:hover {
  text-decoration: underline;
}

/* Testo evidenziato */
.highlight {
  background-color: #ffffcc;
  padding: 0.2em;
}

/* Citazioni */
blockquote {
  font-style: italic;
  border-left: 4px solid #ccc;
  padding-left: 1em;
  margin-left: 0;
}
```

## Conclusione

Le proprietà di testo in CSS offrono un controllo dettagliato sull'aspetto tipografico delle pagine web. Una buona tipografia non solo migliora l'estetica del sito, ma aumenta anche la leggibilità e l'usabilità. Sperimentare con queste proprietà, mantenendo sempre l'attenzione sull'accessibilità e la leggibilità, può trasformare significativamente l'esperienza utente di un sito web.

Nel prossimo capitolo, esploreremo le proprietà CSS per i colori e gli sfondi, imparando come creare schemi di colore efficaci e applicare sfondi interessanti agli elementi.

## Navigazione del Corso
- [📑 Indice](../README.md)
- [⬅️ Selettori CSS](./03-SelettoriCSS.md)
- [➡️ Colori e Sfondi](./05-ColoriSfondi.md)