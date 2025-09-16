# Viewport e Unità Relative

## Indice dei contenuti

- [Il Viewport](#il-viewport)
  - [Cos'è il viewport](#cosè-il-viewport)
  - [Il meta tag viewport](#il-meta-tag-viewport)
  - [Problemi comuni e soluzioni](#problemi-comuni-e-soluzioni)
- [Unità di misura assolute](#unità-di-misura-assolute)
  - [Pixel (px)](#pixel-px)
  - [Punti (pt) e altre unità assolute](#punti-pt-e-altre-unità-assolute)
  - [Quando usare unità assolute](#quando-usare-unità-assolute)
- [Unità di misura relative](#unità-di-misura-relative)
  - [Percentuali (%)](#percentuali-)
  - [em e rem](#em-e-rem)
  - [Viewport units (vw, vh, vmin, vmax)](#viewport-units-vw-vh-vmin-vmax)
  - [Altre unità relative (ch, ex)](#altre-unità-relative-ch-ex)
- [Funzioni CSS per valori dinamici](#funzioni-css-per-valori-dinamici)
  - [calc()](#calc)
  - [min(), max() e clamp()](#min-max-e-clamp)
  - [Esempi pratici](#esempi-pratici)
- [Strategie per layout fluidi](#strategie-per-layout-fluidi)
  - [Combinare unità relative](#combinare-unità-relative)
  - [Tipografia responsive](#tipografia-responsive)
  - [Layout fluidi vs adattivi](#layout-fluidi-vs-adattivi)
- [Container Queries](#container-queries)
  - [Limitazioni delle media queries](#limitazioni-delle-media-queries)
  - [Introduzione alle container queries](#introduzione-alle-container-queries)
  - [Supporto e polyfill](#supporto-e-polyfill)
- [Best practices](#best-practices)
  - [Scegliere le unità appropriate](#scegliere-le-unità-appropriate)
  - [Accessibilità](#accessibilità)
  - [Performance](#performance)
- [Esempi pratici](#esempi-pratici-1)
  - [Layout responsive con unità relative](#layout-responsive-con-unità-relative)
  - [Tipografia fluida](#tipografia-fluida)
  - [Componenti adattivi](#componenti-adattivi)
- [Domande di autovalutazione](#domande-di-autovalutazione)
- [Esercizi pratici](#esercizi-pratici)

## Il Viewport

### Cos'è il viewport

Il viewport è l'area visibile di una pagina web all'interno della finestra del browser. In altre parole, è la porzione della pagina che l'utente può vedere senza scorrere. Le dimensioni del viewport variano in base al dispositivo e all'orientamento dello schermo.

Prima dell'avvento dei dispositivi mobili, i siti web erano progettati principalmente per schermi desktop con dimensioni relativamente standard. Con la proliferazione di smartphone e tablet, è diventato essenziale adattare i siti web a viewport di dimensioni molto diverse.

È importante distinguere tra:

1. **Viewport visuale**: l'area visibile all'interno della finestra del browser
2. **Layout viewport**: l'area utilizzata dal browser per calcolare come disporre gli elementi della pagina

Sui dispositivi mobili, questi due concetti possono differire significativamente. Prima dell'introduzione del meta tag viewport, i browser mobili utilizzavano un layout viewport più ampio (tipicamente 980px) e poi ridimensionavano il contenuto per adattarlo allo schermo fisico, causando problemi di leggibilità e usabilità.

### Il meta tag viewport

Il meta tag viewport è stato introdotto da Apple con Safari per iOS per dare agli sviluppatori un maggiore controllo su come i browser mobili renderizzano le pagine. Oggi è supportato da tutti i browser moderni ed è essenziale per il design responsive.

La sintassi di base è:

```html
<meta name="viewport" content="width=device-width, initial-scale=1.0">
```

Questo tag va inserito nell'elemento `<head>` del documento HTML e dice al browser di:

- Impostare la larghezza del layout viewport uguale alla larghezza del dispositivo (`width=device-width`)
- Impostare il livello di zoom iniziale a 1 (`initial-scale=1.0`), che corrisponde a nessuno zoom

Opzioni aggiuntive includono:

- `minimum-scale`: livello minimo di zoom consentito (es. `minimum-scale=0.5`)
- `maximum-scale`: livello massimo di zoom consentito (es. `maximum-scale=3.0`)
- `user-scalable`: se l'utente può zoomare (es. `user-scalable=yes` o `user-scalable=no`)

Esempio completo:

```html
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=2.0, user-scalable=yes">
```

**Nota importante**: Per motivi di accessibilità, è generalmente sconsigliato disabilitare lo zoom dell'utente (`user-scalable=no`), poiché molti utenti con problemi di vista si affidano allo zoom per leggere i contenuti.

### Problemi comuni e soluzioni

L'utilizzo del viewport può presentare alcune sfide:

1. **Contenuto che fuoriesce dal viewport**:
   - Problema: Elementi con larghezza fissa maggiore del viewport
   - Soluzione: Utilizzare `max-width: 100%` per immagini e altri elementi

   ```css
   img, video, iframe {
     max-width: 100%;
     height: auto;
   }
   ```

2. **Testo troppo piccolo su mobile**:
   - Problema: Font-size troppo piccoli su dispositivi mobili
   - Soluzione: Utilizzare unità relative (rem, em) e media queries

   ```css
   body {
     font-size: 16px; /* Base size */
   }
   
   @media (max-width: 768px) {
     body {
       font-size: 14px;
     }
   }
   ```

3. **Elementi che scompaiono o si sovrappongono**:
   - Problema: Layout che si rompe su viewport piccoli
   - Soluzione: Design responsive con media queries e layout flessibili

4. **Problemi di zoom su input su iOS**:
   - Problema: iOS zooma automaticamente sui campi di input
   - Soluzione: Utilizzare font-size adeguati (almeno 16px) per i campi di input

   ```css
   input, select, textarea {
     font-size: 16px;
   }
   ```

5. **Orientamento del dispositivo**:
   - Problema: Layout che si rompe quando il dispositivo cambia orientamento
   - Soluzione: Utilizzare media queries per l'orientamento

   ```css
   @media (orientation: landscape) {
     /* Stili per orientamento orizzontale */
   }
   
   @media (orientation: portrait) {
     /* Stili per orientamento verticale */
   }
   ```

## Unità di misura assolute

### Pixel (px)

Il pixel (px) è l'unità di misura assoluta più comune nel web design. Tradizionalmente, un pixel CSS corrispondeva a un pixel fisico dello schermo, ma con l'avvento di display ad alta densità (come i Retina di Apple), questa corrispondenza non è più diretta.

Oggi, un pixel CSS è un'unità astratta che i browser mappano ai pixel fisici del dispositivo utilizzando un fattore di scala (device pixel ratio):

- Su display standard (1x): 1 pixel CSS = 1 pixel fisico
- Su display Retina (2x): 1 pixel CSS = 2 pixel fisici
- Su alcuni smartphone (3x): 1 pixel CSS = 3 pixel fisici

Vantaggi dei pixel:
- Precisione e controllo esatto
- Comportamento prevedibile
- Ideali per bordi, ombre e dettagli fini

Svantaggi dei pixel:
- Non si adattano alle preferenze di font dell'utente
- Non scalano automaticamente con le dimensioni del viewport
- Possono creare problemi di accessibilità

### Punti (pt) e altre unità assolute

Oltre ai pixel, CSS supporta altre unità di misura assolute:

- **pt (punti)**: 1pt = 1/72 di pollice, tradizionalmente usato nella stampa
- **pc (pica)**: 1pc = 12pt
- **in (pollici)**: 1in = 96px = 2.54cm
- **cm (centimetri)**: 1cm = 96px/2.54
- **mm (millimetri)**: 1mm = 1/10 di cm

Queste unità sono raramente utilizzate nel web design quotidiano, con l'eccezione dei punti (pt) che a volte vengono utilizzati per i fogli di stile per la stampa:

```css
@media print {
  body {
    font-size: 12pt;
  }
  
  h1 {
    font-size: 18pt;
  }
}
```

### Quando usare unità assolute

Nonostante i loro svantaggi in un contesto responsive, le unità assolute (principalmente px) hanno ancora il loro posto nel web design moderno:

1. **Bordi e dettagli fini**:
   ```css
   .card {
     border: 1px solid #ddd;
     border-radius: 4px;
     box-shadow: 0 2px 4px rgba(0,0,0,0.1);
   }
   ```

2. **Elementi decorativi non critici**:
   ```css
   .divider {
     height: 1px;
     background-color: #eee;
     margin: 20px 0;
   }
   ```

3. **Media queries**:
   ```css
   @media (min-width: 768px) {
     /* Stili per tablet e superiori */
   }
   ```

4. **Quando è necessaria precisione assoluta**:
   ```css
   .icon {
     width: 24px;
     height: 24px;
   }
   ```

In generale, è consigliabile limitare l'uso di unità assolute per elementi che non necessitano di scalare in base al contesto, e preferire unità relative per la maggior parte del layout e della tipografia.

## Unità di misura relative

### Percentuali (%)

Le percentuali sono una delle unità relative più intuitive e ampiamente utilizzate. Una percentuale si riferisce sempre a un valore del genitore o del contesto:

- Per `width` e `height`: percentuale della larghezza/altezza del genitore
- Per `margin` e `padding`: percentuale della larghezza del genitore (anche per top/bottom)
- Per `font-size`: percentuale della dimensione del font del genitore

Esempi di utilizzo:

```css
.container {
  width: 80%; /* 80% della larghezza del genitore */
  max-width: 1200px;
  margin: 0 auto;
}

.sidebar {
  width: 30%; /* 30% della larghezza del genitore */
  float: left;
}

.main-content {
  width: 70%; /* 70% della larghezza del genitore */
  float: left;
}

.padding-container {
  padding: 10%; /* Padding del 10% su tutti i lati, basato sulla larghezza del genitore */
}
```

Le percentuali sono fondamentali per creare layout fluidi che si adattano alle dimensioni del viewport, ma presentano alcune peculiarità da tenere a mente:

- Il padding verticale (top/bottom) è calcolato in base alla larghezza del genitore, non all'altezza
- Le percentuali possono comportarsi in modo inaspettato in layout complessi
- Possono causare problemi di arrotondamento su alcuni browser

### em e rem

Le unità `em` e `rem` sono fondamentali per la tipografia responsive e per creare interfacce che si adattano alle preferenze dell'utente:

**em**:
- 1em è uguale alla dimensione del font dell'elemento corrente
- Se non specificato, eredita la dimensione del font dal genitore
- È relativo al contesto, quindi si accumula in elementi annidati

```css
body {
  font-size: 16px;
}

.parent {
  font-size: 1.5em; /* 24px (16px * 1.5) */
}

.parent .child {
  font-size: 1.5em; /* 36px (24px * 1.5) */
}
```

**rem** (root em):
- 1rem è uguale alla dimensione del font dell'elemento root (html)
- Non è influenzato dalla gerarchia degli elementi
- Offre maggiore prevedibilità rispetto a em

```css
html {
  font-size: 16px; /* Base per tutti i rem */
}

.parent {
  font-size: 1.5rem; /* 24px (16px * 1.5) */
}

.parent .child {
  font-size: 1.5rem; /* Ancora 24px, non 36px */
}
```

Casi d'uso comuni:

- **rem** per dimensioni dei font, margini e padding generali:
  ```css
  h1 {
    font-size: 2.5rem;
    margin-bottom: 1.5rem;
  }
  ```

- **em** per spaziature relative all'elemento stesso:
  ```css
  h2 {
    font-size: 2rem;
    padding: 0.5em; /* Relativo alla dimensione del font di h2 */
  }
  ```

Un pattern comune è impostare la dimensione del font di base in modo che cambi in base alle dimensioni del viewport:

```css
html {
  font-size: 16px;
}

@media (min-width: 768px) {
  html {
    font-size: 18px;
  }
}

@media (min-width: 1200px) {
  html {
    font-size: 20px;
  }
}
```

In questo modo, tutti gli elementi che utilizzano rem si adatteranno automaticamente.

### Viewport units (vw, vh, vmin, vmax)

Le unità viewport sono relative alle dimensioni del viewport (l'area visibile della finestra del browser) e sono particolarmente utili per creare layout e tipografia che si adattano direttamente alle dimensioni dello schermo:

- **vw (viewport width)**: 1vw = 1% della larghezza del viewport
- **vh (viewport height)**: 1vh = 1% dell'altezza del viewport
- **vmin**: 1vmin = 1% della dimensione più piccola del viewport (larghezza o altezza)
- **vmax**: 1vmax = 1% della dimensione più grande del viewport (larghezza o altezza)

Esempi di utilizzo:

1. **Hero section a tutta altezza**:
   ```css
   .hero {
     height: 100vh; /* Occupa l'intera altezza del viewport */
     padding: 5vh 5vw; /* Padding proporzionale al viewport */
   }
   ```

2. **Tipografia responsive**:
   ```css
   h1 {
     font-size: 5vw; /* Dimensione proporzionale alla larghezza del viewport */
   }
   ```

3. **Elementi quadrati responsive**:
   ```css
   .square {
     width: 50vmin; /* Sarà sempre il 50% della dimensione minore del viewport */
     height: 50vmin;
   }
   ```

4. **Layout a schermo intero**:
   ```css
   .fullscreen {
     width: 100vw;
     height: 100vh;
     overflow: hidden;
   }
   ```

Le unità viewport sono potenti ma presentano alcune sfide:

- Possono causare testo troppo grande su schermi ampi o troppo piccolo su schermi stretti
- Su dispositivi mobili, l'altezza del viewport (vh) può cambiare quando appare/scompare la barra degli indirizzi
- Possono causare overflow orizzontale se non gestite correttamente

Per superare questi problemi, spesso le unità viewport vengono combinate con altre unità o funzioni CSS:

```css
h1 {
  font-size: calc(1.5rem + 2vw); /* Base + componente responsive */
}

.container {
  width: min(90vw, 1200px); /* Il minore tra 90vw e 1200px */
}
```

### Altre unità relative (ch, ex)

Oltre alle unità relative più comuni, CSS offre alcune unità specializzate che possono essere utili in contesti specifici:

**ch (character width)**:
- 1ch = larghezza del carattere "0" nel font corrente
- Utile per elementi basati su testo, come input e colonne di testo

```css
.text-column {
  width: 60ch; /* Larghezza ottimale per la leggibilità del testo */
  max-width: 100%;
}

input[type="text"] {
  width: 20ch; /* Spazio per circa 20 caratteri */
}
```

**ex (x-height)**:
- 1ex = altezza della lettera "x" minuscola nel font corrente
- Utile per allineamenti precisi relativi al testo

```css
.superscript {
  position: relative;
  top: -1ex;
}

.icon {
  margin-bottom: 0.5ex;
}
```

Queste unità sono meno comuni ma possono essere molto utili per casi specifici, specialmente quando si lavora con tipografia e allineamenti precisi.

## Funzioni CSS per valori dinamici

### calc()

La funzione `calc()` permette di eseguire calcoli matematici con valori CSS, anche combinando diverse unità di misura. È particolarmente utile per creare layout responsive che combinano componenti fissi e fluidi:

```css
.sidebar {
  /* Larghezza fissa di 250px con un margine di 20px */
  width: calc(250px + 20px);
}

.main-content {
  /* Occupa tutto lo spazio rimanente meno 300px */
  width: calc(100% - 300px);
}

.column {
  /* Tre colonne con gap di 20px tra loro */
  width: calc((100% - 40px) / 3);
  margin-right: 20px;
}

.column:last-child {
  margin-right: 0;
}
```

La funzione `calc()` supporta le quattro operazioni matematiche di base:
- Addizione (+)
- Sottrazione (-)
- Moltiplicazione (*)
- Divisione (/)

È importante notare che gli operatori + e - devono essere circondati da spazi, mentre * e / non ne hanno bisogno (anche se è una buona pratica includerli per leggibilità):

```css
/* Corretto */
width: calc(100% - 20px);

/* Errato - causerà un errore */
width: calc(100%-20px);
```

### min(), max() e clamp()

Queste funzioni CSS moderne offrono potenti strumenti per creare valori responsive che si adattano automaticamente alle condizioni:

**min()**:
- Restituisce il valore più piccolo tra quelli forniti
- Utile per impostare limiti massimi fluidi

```css
.container {
  /* Sarà 90% della larghezza del genitore, ma mai più di 1200px */
  width: min(90%, 1200px);
  margin: 0 auto;
}
```

**max()**:
- Restituisce il valore più grande tra quelli forniti
- Utile per impostare limiti minimi fluidi

```css
.button {
  /* Sarà almeno 100px o 10% della larghezza del viewport, qualunque sia maggiore */
  width: max(100px, 10vw);
}

p {
  /* Garantisce una dimensione minima leggibile del testo */
  font-size: max(16px, 1rem);
}
```

**clamp()**:
- Prende tre valori: minimo, preferito e massimo
- Mantiene il valore preferito entro i limiti minimo e massimo
- Perfetto per tipografia responsive e layout fluidi

```css
h1 {
  /* Dimensione del font tra 24px e 60px, idealmente 5vw */
  font-size: clamp(24px, 5vw, 60px);
}

.container {
  /* Larghezza tra 320px e 1200px, idealmente 90% */
  width: clamp(320px, 90%, 1200px);
  margin: 0 auto;
}
```

Queste funzioni hanno un eccellente supporto nei browser moderni e sono particolarmente potenti quando combinate tra loro o con `calc()`:

```css
.element {
  padding: clamp(1rem, calc(1rem + 2vw), 3rem);
  width: min(max(50%, 300px), 800px);
}
```

### Esempi pratici

Ecco alcuni esempi pratici di come combinare queste funzioni per creare layout e tipografia responsive:

1. **Tipografia fluida senza breakpoint**:
   ```css
   h1 {
     font-size: clamp(2rem, 1rem + 3vw, 4rem);
     line-height: 1.2;
   }
   
   p {
     font-size: clamp(1rem, 0.8rem + 0.5vw, 1.2rem);
     line-height: 1.5;
   }
   ```

2. **Container responsive con padding proporzionale**:
   ```css
   .container {
     width: min(90%, 1200px);
     padding: calc(1rem + 2vw);
     margin: 0 auto;
   }
   ```

3. **Griglia responsive senza media queries**:
   ```css
   .grid {
     display: grid;
     grid-template-columns: repeat(auto-fit, minmax(min(100%, 300px), 1fr));
     gap: clamp(1rem, 3%, 2rem);
   }
   ```

4. **Bottone con dimensioni adattive**:
   ```css
   .button {
     padding: clamp(0.5rem, 1vw + 0.5rem, 1rem) clamp(1rem, 2vw + 1rem, 2rem);
     font-size: clamp(0.875rem, 0.8rem + 0.5vw, 1rem);
   }
   ```

5. **Layout a due colonne che diventa a una colonna su schermi stretti**:
   ```css
   .two-columns {
     display: grid;
     grid-template-columns: repeat(auto-fit, minmax(min(100%, 400px), 1fr));
     gap: 2rem;
   }
   ```

Questi esempi mostrano come sia possibile creare design responsive senza necessariamente utilizzare media queries, sfruttando la potenza delle funzioni CSS moderne.

## Strategie per layout fluidi

### Combinare unità relative

Una strategia efficace per creare layout veramente fluidi è combinare diverse unità relative per ottenere il comportamento desiderato in vari contesti:

1. **Approccio a strati per la tipografia**:
   ```css
   html {
     /* Base responsive */
     font-size: clamp(14px, 0.5vw + 13px, 18px);
   }
   
   h1 {
     /* Scala in base alla dimensione del font di base */
     font-size: 2.5rem;
     
     /* Spaziatura proporzionale alla dimensione del font */
     margin-bottom: 0.5em;
   }
   ```

2. **Layout con componenti misti**:
   ```css
   .card {
     /* Larghezza fluida con limiti */
     width: clamp(300px, 30%, 450px);
     
     /* Padding proporzionale al viewport ma con limiti */
     padding: clamp(1rem, 2vw, 2rem);
     
     /* Margine basato sulla dimensione del font */
     margin-bottom: 2rem;
   }
   ```

3. **Griglia responsive avanzata**:
   ```css
   .grid {
     display: grid;
     /* Colonne che si adattano allo spazio disponibile */
     grid-template-columns: repeat(auto-fill, minmax(min(100%, 250px), 1fr));
     /* Gap proporzionale ma con limiti */
     gap: clamp(1rem, 2vw, 2rem);
   }
   ```

Questa combinazione di unità relative permette di creare layout che si adattano in modo naturale a diverse condizioni, spesso riducendo la necessità di media queries.

### Tipografia responsive

La tipografia responsive è fondamentale per una buona esperienza utente su tutti i dispositivi. Ecco alcune strategie efficaci:

1. **Scala tipografica fluida**:
   ```css
   html {
     font-size: clamp(16px, 0.5vw + 15px, 20px);
   }
   
   h1 { font-size: 2.5rem; }
   h2 { font-size: 2rem; }
   h3 { font-size: 1.75rem; }
   h4 { font-size: 1.5rem; }
   h5 { font-size: 1.25rem; }
   h6 { font-size: 1rem; }
   ```

2. **Dimensioni dei font specifiche per elemento**:
   ```css
   .hero-title {
     font-size: clamp(2.5rem, 5vw + 1rem, 5rem);
     line-height: 1.1;
   }
   
   .card-title {
     font-size: clamp(1.25rem, 1vw + 1rem, 1.5rem);
   }
   ```

3. **Line-height responsive**:
   ```css
   p {
     font-size: clamp(1rem, 0.5vw + 0.875rem, 1.25rem);
     /* Line-height più stretto per testo più grande */
     line-height: calc(1.5 - 0.2 * ((1rem - 16px) / 8));
   }
   ```

4. **Spaziatura proporzionale al testo**:
   ```css
   .content {
     /* Spaziatura tra paragrafi proporzionale alla dimensione del testo */
     & p + p {
       margin-top: 1.5em;
     }
     
     /* Spaziatura tra sezioni */
     & section + section {
       margin-top: 3rem;
     }
   }
   ```

Una buona tipografia responsive non riguarda solo la dimensione del testo, ma anche la leggibilità, la lunghezza delle righe e la spaziatura, tutti elementi che dovrebbero adattarsi alle dimensioni dello schermo.

### Layout fluidi vs adattivi

È importante comprendere la differenza tra layout fluidi e adattivi:

**Layout fluidi**:
- Si adattano continuamente alle dimensioni del viewport
- Utilizzano principalmente unità relative (%, vw, em, rem)
- Cambiano gradualmente senza "salti"

```css
.fluid-container {
  width: 90%;
  max-width: 1200px;
  margin: 0 auto;
}

.fluid-column {
  width: calc((100% - 4rem) / 3);
  margin-right: 2rem;
}
```

**Layout adattivi**:
- Cambiano a specifici breakpoint
- Utilizzano dimensioni fisse per ogni breakpoint
- Creano "salti" visibili quando si passa da un breakpoint all'altro

```css
.adaptive-container {
  width: 100%;
  padding: 0 1rem;
}

@media (min-