# Immagini Responsive

## Indice dei contenuti

- [Introduzione alle immagini responsive](#introduzione-alle-immagini-responsive)
  - [Perché le immagini responsive sono importanti](#perché-le-immagini-responsive-sono-importanti)
  - [Sfide delle immagini sul web](#sfide-delle-immagini-sul-web)
- [Tecniche CSS per immagini responsive](#tecniche-css-per-immagini-responsive)
  - [Immagini fluide con max-width](#immagini-fluide-con-max-width)
  - [Immagini di sfondo responsive](#immagini-di-sfondo-responsive)
  - [Object-fit e object-position](#object-fit-e-object-position)
  - [Aspect ratio e dimensioni proporzionali](#aspect-ratio-e-dimensioni-proporzionali)
- [Tecniche HTML per immagini responsive](#tecniche-html-per-immagini-responsive)
  - [L'attributo srcset](#lattributo-srcset)
  - [L'attributo sizes](#lattributo-sizes)
  - [L'elemento picture](#lelemento-picture)
  - [Art direction con media queries](#art-direction-con-media-queries)
- [Formati di immagine moderni](#formati-di-immagine-moderni)
  - [WebP](#webp)
  - [AVIF](#avif)
  - [JPEG 2000 e JPEG XR](#jpeg-2000-e-jpeg-xr)
  - [SVG per grafica vettoriale](#svg-per-grafica-vettoriale)
- [Ottimizzazione delle immagini](#ottimizzazione-delle-immagini)
  - [Compressione e qualità](#compressione-e-qualità)
  - [Dimensioni appropriate](#dimensioni-appropriate)
  - [Lazy loading](#lazy-loading)
  - [CDN per immagini](#cdn-per-immagini)
- [Media responsive](#media-responsive)
  - [Video responsive](#video-responsive)
  - [iframe responsive](#iframe-responsive)
  - [Mappe responsive](#mappe-responsive)
- [Best practices](#best-practices)
  - [Performance](#performance)
  - [Accessibilità](#accessibilità)
  - [SEO](#seo)
- [Strumenti e risorse](#strumenti-e-risorse)
  - [Strumenti di ottimizzazione](#strumenti-di-ottimizzazione)
  - [Servizi di gestione immagini](#servizi-di-gestione-immagini)
  - [Risorse di apprendimento](#risorse-di-apprendimento)
- [Domande di autovalutazione](#domande-di-autovalutazione)
- [Esercizi pratici](#esercizi-pratici)

## Introduzione alle immagini responsive

### Perché le immagini responsive sono importanti

Le immagini rappresentano in media il 50-60% del peso totale di una pagina web. Renderle responsive non è solo una questione estetica, ma ha un impatto significativo su:

1. **Performance**: Immagini ottimizzate per dispositivi specifici riducono il tempo di caricamento della pagina
2. **Esperienza utente**: Immagini appropriate per ogni dispositivo migliorano la leggibilità e l'usabilità
3. **Consumo di dati**: Fornire immagini più piccole ai dispositivi mobili riduce il consumo di dati degli utenti
4. **SEO**: La velocità di caricamento è un fattore di ranking per i motori di ricerca
5. **Accessibilità**: Immagini che si adattano correttamente migliorano l'accessibilità del sito

Secondo HTTP Archive, le immagini costituiscono in media 900KB di una pagina web di 2MB, evidenziando l'importanza di ottimizzarle per diversi dispositivi e connessioni.

### Sfide delle immagini sul web

Le principali sfide nella gestione delle immagini responsive includono:

1. **Diversità di dispositivi**: Schermi con dimensioni e risoluzioni molto diverse (da smartwatch a TV 4K)
2. **Densità di pixel variabile**: Dispositivi con rapporti di pixel diversi (1x, 2x, 3x)
3. **Larghezza di banda**: Connessioni con velocità variabili (da 2G a fibra ottica)
4. **Art direction**: Necessità di mostrare immagini diverse (non solo ridimensionate) su dispositivi diversi
5. **Formati di immagine**: Supporto variabile per formati moderni come WebP e AVIF
6. **Prestazioni**: Bilanciare qualità visiva e velocità di caricamento

Le tecniche responsive per le immagini mirano a risolvere queste sfide fornendo la versione più appropriata dell'immagine per ogni contesto di visualizzazione.

## Tecniche CSS per immagini responsive

### Immagini fluide con max-width

La tecnica più semplice e ampiamente supportata per rendere le immagini responsive è utilizzare la proprietà `max-width` in CSS:

```css
img {
  max-width: 100%;
  height: auto;
}
```

Questo codice assicura che:
- L'immagine non superi mai la larghezza del suo contenitore
- L'altezza si adatti proporzionalmente per mantenere le proporzioni originali

Esempio pratico:

```html
<div class="container">
  <img src="immagine.jpg" alt="Descrizione immagine">
</div>
```

```css
.container {
  width: 80%;
  max-width: 1200px;
  margin: 0 auto;
}

img {
  max-width: 100%;
  height: auto;
  display: block; /* Rimuove lo spazio sotto l'immagine */
}
```

Questa tecnica è semplice ma ha limitazioni: carica sempre la stessa immagine indipendentemente dalla dimensione del dispositivo, potenzialmente sprecando larghezza di banda su dispositivi piccoli.

### Immagini di sfondo responsive

Per immagini di sfondo, CSS offre diverse proprietà per creare sfondi responsive:

```css
.hero {
  background-image: url('background.jpg');
  background-size: cover; /* Copre l'intero elemento */
  background-position: center; /* Centra l'immagine */
  height: 50vh; /* Altezza relativa al viewport */
}
```

È possibile utilizzare media queries per caricare immagini diverse in base alla dimensione dello schermo:

```css
.hero {
  background-size: cover;
  background-position: center;
  height: 50vh;
}

/* Immagine per mobile (default) */
.hero {
  background-image: url('background-small.jpg');
}

/* Immagine per tablet */
@media (min-width: 768px) {
  .hero {
    background-image: url('background-medium.jpg');
  }
}

/* Immagine per desktop */
@media (min-width: 1200px) {
  .hero {
    background-image: url('background-large.jpg');
  }
}
```

Questo approccio permette di caricare immagini ottimizzate per diverse dimensioni dello schermo.

### Object-fit e object-position

Le proprietà `object-fit` e `object-position` offrono un controllo avanzato su come le immagini si adattano al loro contenitore:

```css
.thumbnail {
  width: 300px;
  height: 200px;
  object-fit: cover; /* L'immagine copre l'area mantenendo le proporzioni */
  object-position: center; /* Centra l'immagine nell'area */
}
```

Valori comuni per `object-fit`:
- `cover`: L'immagine copre l'intero contenitore mantenendo le proporzioni (può essere ritagliata)
- `contain`: L'immagine è completamente visibile nel contenitore (possono apparire spazi vuoti)
- `fill`: L'immagine riempie il contenitore (può essere distorta)
- `none`: L'immagine non viene ridimensionata
- `scale-down`: L'immagine è ridimensionata come con `none` o `contain`, a seconda di quale produce un risultato più piccolo

Esempio di galleria con immagini di dimensioni uniformi:

```html
<div class="gallery">
  <div class="gallery-item">
    <img src="image1.jpg" alt="Descrizione 1">
  </div>
  <div class="gallery-item">
    <img src="image2.jpg" alt="Descrizione 2">
  </div>
  <!-- Altre immagini... -->
</div>
```

```css
.gallery {
  display: grid;
  grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
  gap: 20px;
}

.gallery-item {
  aspect-ratio: 16/9;
  overflow: hidden;
}

.gallery-item img {
  width: 100%;
  height: 100%;
  object-fit: cover;
  transition: transform 0.3s ease;
}

.gallery-item img:hover {
  transform: scale(1.05);
}
```

### Aspect ratio e dimensioni proporzionali

Mantenere le proporzioni corrette è fondamentale per le immagini responsive. La proprietà `aspect-ratio` di CSS permette di definire le proporzioni di un elemento:

```css
.video-container {
  width: 100%;
  aspect-ratio: 16/9;
  background-color: #000;
}
```

Per browser che non supportano `aspect-ratio`, è possibile utilizzare la tecnica del "padding-hack":

```css
.video-container {
  width: 100%;
  position: relative;
  padding-bottom: 56.25%; /* Rapporto 16:9 (9/16 = 0.5625) */
  height: 0;
  overflow: hidden;
}

.video-container iframe,
.video-container video {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
}
```

Questa tecnica è particolarmente utile per contenuti incorporati come video, mappe e iframe.

## Tecniche HTML per immagini responsive

### L'attributo srcset

L'attributo `srcset` permette di fornire al browser diverse versioni della stessa immagine, lasciando che sia il browser a scegliere quella più appropriata in base alla dimensione del viewport e alla densità di pixel del dispositivo:

```html
<img src="small.jpg"
     srcset="small.jpg 500w,
             medium.jpg 1000w,
             large.jpg 1500w"
     alt="Descrizione immagine">
```

In questo esempio:
- `src` fornisce un'immagine di fallback per browser che non supportano srcset
- `srcset` elenca le immagini disponibili con la loro larghezza in pixel (w)
- Il browser sceglie automaticamente l'immagine più appropriata

È anche possibile utilizzare il descrittore di densità di pixel (x) invece della larghezza:

```html
<img src="image-1x.jpg"
     srcset="image-1x.jpg 1x,
             image-2x.jpg 2x,
             image-3x.jpg 3x"
     alt="Descrizione immagine">
```

Questo è utile per fornire immagini ad alta risoluzione per display retina e simili.

### L'attributo sizes

L'attributo `sizes` lavora insieme a `srcset` per informare il browser su quanto spazio occuperà l'immagine nella pagina a diverse larghezze del viewport:

```html
<img src="small.jpg"
     srcset="small.jpg 500w,
             medium.jpg 1000w,
             large.jpg 1500w"
     sizes="(max-width: 600px) 100vw,
            (max-width: 1200px) 50vw,
            33vw"
     alt="Descrizione immagine">
```

In questo esempio:
- Su schermi fino a 600px, l'immagine occuperà il 100% della larghezza del viewport
- Su schermi tra 601px e 1200px, occuperà il 50% della larghezza del viewport
- Su schermi più grandi di 1200px, occuperà il 33% della larghezza del viewport

Il browser utilizza queste informazioni insieme alla larghezza del viewport e alla densità di pixel per scegliere l'immagine più appropriata da `srcset`.

### L'elemento picture

L'elemento `picture` offre un controllo ancora maggiore, permettendo di specificare diverse immagini per diverse condizioni e formati:

```html
<picture>
  <!-- Smartphone in portrait -->
  <source media="(max-width: 767px)" srcset="mobile.jpg">
  
  <!-- Tablet in portrait -->
  <source media="(max-width: 1023px)" srcset="tablet.jpg">
  
  <!-- Desktop e altri -->
  <img src="desktop.jpg" alt="Descrizione immagine">
</picture>
```

L'elemento `picture` è particolarmente utile per l'art direction, quando si vuole mostrare immagini diverse (non solo versioni ridimensionate) su dispositivi diversi.

È anche utile per supportare formati moderni con fallback:

```html
<picture>
  <!-- Formato moderno WebP -->
  <source type="image/webp" srcset="image.webp">
  
  <!-- Formato moderno AVIF -->
  <source type="image/avif" srcset="image.avif">
  
  <!-- Fallback per browser che non supportano WebP o AVIF -->
  <img src="image.jpg" alt="Descrizione immagine">
</picture>
```

### Art direction con media queries

L'art direction consiste nel mostrare immagini diverse (non solo ridimensionate) su dispositivi diversi. Ad esempio, su mobile potrebbe essere necessario mostrare un ritaglio più stretto di un'immagine per evidenziare il soggetto principale.

L'elemento `picture` con media queries è perfetto per questo scopo:

```html
<picture>
  <!-- Versione mobile: ritaglio stretto sul soggetto -->
  <source media="(max-width: 767px)" srcset="portrait-crop-small.jpg 1x, portrait-crop-small-2x.jpg 2x">
  
  <!-- Versione tablet: ritaglio intermedio -->
  <source media="(max-width: 1023px)" srcset="landscape-crop-medium.jpg 1x, landscape-crop-medium-2x.jpg 2x">
  
  <!-- Versione desktop: immagine completa -->
  <img src="landscape-full.jpg" srcset="landscape-full.jpg 1x, landscape-full-2x.jpg 2x" alt="Descrizione immagine">
</picture>
```

Questo approccio permette di fornire l'esperienza visiva migliore per ogni dispositivo, non solo ridimensionando l'immagine ma adattando il contenuto stesso.

## Formati di immagine moderni

### WebP

WebP è un formato di immagine moderno sviluppato da Google che offre compressione superiore rispetto a JPEG e PNG:

- **Vantaggi**:
  - Compressione migliore del 25-35% rispetto a JPEG con qualità simile
  - Supporta sia la compressione con perdita che senza perdita
  - Supporta la trasparenza (come PNG) con dimensioni file inferiori
  - Supporta l'animazione (come GIF) con dimensioni file inferiori

- **Supporto browser**:
  - Chrome, Edge, Firefox, Opera, Android Browser
  - Safari da iOS 14 e macOS Big Sur

Implementazione con fallback:

```html
<picture>
  <source type="image/webp" srcset="image.webp">
  <img src="image.jpg" alt="Descrizione immagine">
</picture>
```

### AVIF

AVIF è un formato ancora più recente basato sul codec video AV1:

- **Vantaggi**:
  - Compressione migliore del 50% rispetto a JPEG con qualità simile
  - Migliore del 20% rispetto a WebP
  - Supporta HDR, wide gamut color e profondità di colore fino a 12 bit
  - Supporta trasparenza e animazioni

- **Supporto browser**:
  - Chrome, Opera
  - Firefox (parziale)
  - Safari e Edge (non ancora supportato)

Implementazione con fallback multiplo:

```html
<picture>
  <source type="image/avif" srcset="image.avif">
  <source type="image/webp" srcset="image.webp">
  <img src="image.jpg" alt="Descrizione immagine">
</picture>
```

### JPEG 2000 e JPEG XR

Altri formati moderni con supporto limitato:

- **JPEG 2000**:
  - Supportato principalmente da Safari
  - Migliore qualità e compressione rispetto a JPEG

- **JPEG XR**:
  - Sviluppato da Microsoft
  - Supportato principalmente da Internet Explorer e Edge Legacy

Implementazione completa con tutti i fallback:

```html
<picture>
  <source type="image/avif" srcset="image.avif">
  <source type="image/webp" srcset="image.webp">
  <source type="image/jp2" srcset="image.jp2">
  <source type="image/jxr" srcset="image.jxr">
  <img src="image.jpg" alt="Descrizione immagine">
</picture>
```

### SVG per grafica vettoriale

SVG (Scalable Vector Graphics) è ideale per icone, loghi e illustrazioni:

- **Vantaggi**:
  - Scalabile a qualsiasi dimensione senza perdita di qualità
  - File di piccole dimensioni per grafica semplice
  - Animabile e interattivo con CSS e JavaScript
  - Accessibile e indicizzabile (essendo basato su XML)

- **Svantaggi**:
  - Non adatto per fotografie o immagini complesse
  - Può diventare pesante con grafica molto dettagliata

Esempio di utilizzo inline:

```html
<svg width="24" height="24" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
  <path d="M12 2L1 21h22L12 2z" fill="currentColor"/>
</svg>
```

O come immagine esterna:

```html
<img src="icon.svg" alt="Icona" width="24" height="24">
```

## Ottimizzazione delle immagini

### Compressione e qualità

La compressione delle immagini è fondamentale per ridurre le dimensioni dei file senza compromettere eccessivamente la qualità visiva:

1. **Compressione con perdita** (JPEG, WebP, AVIF):
   - Ideale per fotografie e immagini con molti colori
   - Bilanciare qualità e dimensione del file
   - Una qualità JPEG dell'80-85% è spesso un buon compromesso

2. **Compressione senza perdita** (PNG, WebP senza perdita):
   - Ideale per grafica con testo, linee nette o trasparenza
   - Utilizzare strumenti di ottimizzazione come PNGQuant o OptiPNG

3. **Strumenti di compressione**:
   - ImageOptim (Mac)
   - FileOptimizer (Windows)
   - Squoosh (web)
   - TinyPNG/TinyJPG (web)

Regola generale: per il web, è meglio sacrificare un po' di qualità per ottenere file più piccoli, purché la differenza non sia percepibile dall'utente medio.

### Dimensioni appropriate

Fornire immagini con le dimensioni appropriate è cruciale per la performance:

1. **Evitare il sovradimensionamento**:
   - Non caricare immagini più grandi del necessario
   - Un'immagine da 5000px ridimensionata a 500px spreca larghezza di banda

2. **Preparare multiple versioni**:
   - Creare versioni di diverse dimensioni per `srcset`
   - Dimensioni comuni: 320px, 640px, 960px, 1280px, 1920px

3. **Considerare la densità di pixel**:
   - Dispositivi retina (2x) richiedono immagini con risoluzione doppia
   - Un elemento di 300px su un display 2x dovrebbe idealmente avere un'immagine di 600px

4. **Automatizzare il processo**:
   - Utilizzare strumenti di build o CMS che generano automaticamente le varianti
   - Servizi come Cloudinary o Imgix possono generare varianti on-the-fly

### Lazy loading

Il lazy loading carica le immagini solo quando stanno per entrare nel viewport, migliorando il tempo di caricamento iniziale della pagina:

1. **Attributo loading nativo**:
   ```html
   <img src="image.jpg" loading="lazy" alt="Descrizione">
   ```
   Supportato dalla maggior parte dei browser moderni

2. **Intersection Observer API**:
   ```javascript
   document.addEventListener("DOMContentLoaded", function() {
     const images = document.querySelectorAll("img[data-src]");
     
     const imgObserver = new IntersectionObserver((entries, observer) => {
       entries.forEach(entry => {
         if (entry.isIntersecting) {
           const img = entry.target;
           img.src = img.dataset.src;
           observer.unobserve(img);
         }
       });
     });
     
     images.forEach(img => imgObserver.observe(img));
   });
   ```
   
   HTML:
   ```html
   <img data-src="image.jpg" src="placeholder.jpg" alt="Descrizione">
   ```

3. **LQIP (Low Quality Image Placeholders)**:
   Mostrare una versione a bassa qualità dell'immagine mentre quella ad alta qualità si carica

### CDN per immagini

I Content Delivery Network specializzati in immagini offrono vantaggi significativi:

1. **Ottimizzazione automatica**:
   - Compressione intelligente
   - Conversione automatica in formati moderni (WebP, AVIF)
   - Ridimensionamento on-the-fly

2. **Distribuzione globale**:
   - Server distribuiti geograficamente per ridurre la latenza
   - Caching efficiente

3. **Servizi popolari**:
   - Cloudinary
   - Imgix
   - Cloudflare Images
   - ImageKit

Esempio di utilizzo di Cloudinary:

```html
<img src="https://res.cloudinary.com/demo/image/upload/w_600,f_auto,q_auto/sample.jpg"
     srcset="https://res.cloudinary.com/demo/image/upload/w_600,f_auto,q_auto/sample.jpg 600w,
             https://res.cloudinary.com/demo/image/upload/w_1200,f_auto,q_auto/sample.jpg 1200w"
     sizes="(max-width: 600px) 100vw, 600px"
     alt="Descrizione immagine">
```

In questo esempio:
- `w_600`: larghezza di 600px
- `f_auto`: formato automatico (WebP se supportato)
- `q_auto`: qualità automatica ottimizzata

## Media responsive

### Video responsive

Rendere i video responsive richiede tecniche simili alle immagini:

1. **Video HTML5 responsive**:

```html
<video controls width="100%" poster="thumbnail.jpg">
  <source src="video.webm" type="video/webm">
  <source src="video.mp4" type="video/mp4">
  Il tuo browser non supporta il tag video.
</video>
```

```css
video {
  max-width: 100%;
  height: auto;
}
```

2. **Video con aspect ratio fisso**:

```css
.video-container {
  position: relative;
  width: 100%;
  aspect-ratio: 16/9;
}

.video-container video {
  position: absolute;
  width: 100%;
  height: 100%;
  object-fit: cover;
}
```

### iframe responsive

Rendere responsive gli iframe (YouTube, Vimeo, mappe, ecc.):

```html
<div class="iframe-container">
  <iframe src="https://www.youtube.com/embed/video_id" frameborder="0" allowfullscreen></iframe>
</div>
```

```css
.iframe-container {
  position: relative;
  width: 100%;
  padding-bottom: 56.25%; /* Rapporto 16:9 */
  height: 0;
  overflow: hidden;
}

.iframe-container iframe {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
}
```

Per rapporti diversi, modificare il `padding-bottom`:
- 4:3 = 75%
- 1:1 = 100%
- 21:9 = 42.85%

### Mappe responsive

Le mappe incorporate possono essere rese responsive con lo stesso approccio degli iframe:

```html
<div class="map-container">
  <iframe src="https://www.google.com/maps/embed?pb=!1m18!..." frameborder="0" allowfullscreen></iframe>
</div>
```

```css
.map-container {
  position: relative;
  width: 100%;
  padding-bottom: 75%; /* Rapporto 4:3 per le mappe */
  height: 0;
  overflow: hidden;
}

.map-container iframe {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
}
```

## Best practices

### Performance

Ottimizzare le immagini per la performance:

1. **Utilizzare formati appropriati**:
   - JPEG/WebP/AVIF per fotografie
   - PNG/WebP per grafica con trasparenza
   - SVG per icone e illustrazioni
   - GIF solo quando necessario (preferire WebP animato o video)

2. **Implementare lazy loading**:
   - Caricare le immagini solo quando necessario
   - Utilizzare l'attributo `loading="lazy"` o JavaScript

3. **Preload per immagini critiche**:
   ```html
   <link rel="preload" as="image" href="hero.jpg">
   ```

4. **Evitare il CLS (Cumulative Layout Shift)**:
   - Specificare sempre `width` e `height` o aspect ratio
   - Utilizzare placeholder durante il caricamento

5. **Ottimizzare il critical rendering path**:
   - Evitare immagini di grandi dimensioni above the fold
   - Considerare tecniche come LQIP (Low Quality Image Placeholders)

### Accessibilità

Rendere le immagini accessibili:

1. **Utilizzare sempre l'attributo alt**:
   ```html
   <img src="image.jpg" alt="Descrizione significativa dell'immagine">
   ```
   Per immagini decorative, usare `alt=""`

2. **Considerare il contrasto**:
   - Assicurarsi che il testo sovrapposto alle immagini abbia contrasto sufficiente
   - Utilizzare overlay o ombre per migliorare la leggibilità

3. **Non comunicare informazioni solo attraverso immagini**:
   - Le informazioni importanti dovrebbero essere disponibili anche nel testo

4. **Evitare testo nelle immagini**:
   - Il testo nelle immagini non è accessibile agli screen reader
   - Non è scalabile o traducibile

### SEO

Ottimizzare le immagini per i motori di ricerca:

1. **Utilizzare nomi di file descrittivi**:
   - `mountain-landscape-alps.jpg` invece di `IMG_12345.jpg`