# Inserimento e gestione di immagini

## Elementi per l'inserimento di immagini

Le immagini rappresentano un elemento fondamentale per arricchire il contenuto delle pagine web, migliorando l'esperienza utente e facilitando la comprensione dei concetti. HTML5 offre diversi elementi per l'inserimento e la gestione delle immagini, ciascuno con caratteristiche e scopi specifici.

L'elemento `<img>` è il tag principale per inserire immagini in una pagina web. La sua sintassi base richiede almeno l'attributo `src` (source) che specifica il percorso dell'immagine:

```html
<img src="percorso/immagine.jpg" alt="Descrizione dell'immagine">
```

L'elemento `<picture>` è stato introdotto in HTML5 per gestire immagini responsive, permettendo di specificare diverse versioni della stessa immagine per diversi contesti di visualizzazione:

```html
<picture>
  <source media="(min-width: 1200px)" srcset="immagine-grande.jpg">
  <source media="(min-width: 600px)" srcset="immagine-media.jpg">
  <img src="immagine-piccola.jpg" alt="Descrizione dell'immagine">
</picture>
```

Per immagini che necessitano di una didascalia, HTML5 fornisce gli elementi `<figure>` e `<figcaption>`, che creano un contenitore semantico per l'immagine e la sua descrizione:

```html
<figure>
  <img src="grafico.jpg" alt="Grafico delle vendite 2023">
  <figcaption>Fig. 1: Andamento delle vendite nel primo trimestre 2023</figcaption>
</figure>
```

Per quanto riguarda le immagini vettoriali, è possibile utilizzare SVG (Scalable Vector Graphics) sia come file esterno che come codice inline. L'approccio inline permette maggiore controllo e interattività:

```html
<!-- SVG esterno -->
<img src="icona.svg" alt="Icona menu">

<!-- SVG inline -->
<svg width="100" height="100" viewBox="0 0 100 100">
  <circle cx="50" cy="50" r="40" stroke="black" stroke-width="2" fill="red" />
</svg>
```

## Attributi fondamentali

Gli attributi `src` e `alt` sono essenziali per l'elemento `<img>`. L'attributo `src` specifica l'URL dell'immagine, mentre `alt` fornisce un testo alternativo che viene mostrato quando l'immagine non può essere caricata o viene letta da uno screen reader:

```html
<img src="logo.png" alt="Logo aziendale XYZ Corp">
```

L'attributo `alt` è fondamentale per l'accessibilità e dovrebbe:
- Descrivere accuratamente il contenuto dell'immagine
- Essere conciso ma informativo
- Comunicare la funzione dell'immagine nel contesto
- Essere vuoto (`alt=""`) per immagini puramente decorative

Gli attributi di dimensione `width` e `height` specificano le dimensioni dell'immagine in pixel. È buona pratica includerli sempre per migliorare le prestazioni di caricamento della pagina, poiché permettono al browser di riservare lo spazio corretto prima che l'immagine sia completamente caricata:

```html
<img src="prodotto.jpg" alt="Prodotto XYZ" width="300" height="200">
```

HTML5 ha introdotto attributi per ottimizzare il caricamento delle immagini. L'attributo `loading="lazy"` indica al browser di caricare l'immagine solo quando sta per entrare nel viewport, migliorando le prestazioni della pagina:

```html
<img src="immagine-grande.jpg" alt="Paesaggio" loading="lazy">
```

L'attributo `decoding` suggerisce al browser come decodificare l'immagine:

```html
<img src="foto.jpg" alt="Foto" decoding="async">
```

Per migliorare l'accessibilità, oltre all'attributo `alt`, è possibile utilizzare altri attributi come `title` (per fornire informazioni aggiuntive al passaggio del mouse) e attributi ARIA:

```html
<img src="grafico.jpg" alt="Grafico vendite" title="Dettaglio vendite per regione" aria-describedby="desc1">
<div id="desc1" class="visually-hidden">Grafico dettagliato che mostra le vendite suddivise per regione nel 2023</div>
```

## Formati di immagine per il web

La scelta del formato immagine corretto è cruciale per ottimizzare le prestazioni e la qualità visiva. I principali formati utilizzati nel web includono:

**JPEG (Joint Photographic Experts Group)**: ideale per fotografie e immagini con molti colori e sfumature. Supporta la compressione con perdita di qualità (lossy) e permette di bilanciare qualità e dimensione del file:

```html
<img src="fotografia.jpg" alt="Paesaggio montano">
```

**PNG (Portable Network Graphics)**: supporta la trasparenza e utilizza compressione senza perdita (lossless). È ideale per immagini con testo, linee nette o aree di colore uniforme:

```html
<img src="logo.png" alt="Logo aziendale con sfondo trasparente">
```

**GIF (Graphics Interchange Format)**: supporta animazioni semplici e trasparenza limitata. È adatto per piccole animazioni e icone semplici:

```html
<img src="animazione.gif" alt="Processo di caricamento">
```

**WebP**: formato moderno sviluppato da Google che offre compressione superiore sia per immagini lossy che lossless, supportando anche trasparenza e animazioni. Riduce significativamente le dimensioni dei file mantenendo alta qualità:

```html
<img src="immagine.webp" alt="Immagine ottimizzata">
```

**AVIF (AV1 Image File Format)**: formato di nuova generazione con eccellente compressione e qualità, ma con supporto browser ancora in evoluzione:

```html
<img src="foto.avif" alt="Foto ad alta qualità e basso peso">
```

**SVG (Scalable Vector Graphics)**: formato vettoriale ideale per loghi, icone e illustrazioni che devono essere visualizzate a diverse dimensioni senza perdita di qualità:

```html
<img src="icona.svg" alt="Icona menu">
```

La scelta del formato dipende dal tipo di immagine e dal contesto d'uso:
- JPEG: per fotografie e immagini complesse
- PNG: per immagini con trasparenza e testo
- WebP: come alternativa moderna a JPEG e PNG dove supportato
- SVG: per grafica vettoriale, loghi e icone
- GIF: per animazioni semplici (o considerare video brevi come alternativa più efficiente)

## Ottimizzazione delle immagini

L'ottimizzazione delle immagini è fondamentale per migliorare le prestazioni del sito web. La compressione e il ridimensionamento sono le tecniche principali:

```html
<!-- Immagine originale: 2000x1500px, 1.2MB -->
<!-- Immagine ottimizzata: 800x600px, 120KB -->
<img src="foto-ottimizzata.jpg" alt="Paesaggio" width="800" height="600">
```

Esistono numerosi strumenti per l'ottimizzazione delle immagini:
- **Online**: TinyPNG, Squoosh, Compressor.io
- **Software desktop**: Adobe Photoshop, GIMP, ImageOptim (Mac)
- **CLI e build tools**: ImageMagick, Sharp, Webpack image loaders

Le tecniche di compressione si dividono in due categorie:
- **Lossy (con perdita)**: riduce la dimensione del file eliminando dati, con una certa perdita di qualità (JPEG, WebP lossy)
- **Lossless (senza perdita)**: riduce la dimensione senza compromettere la qualità, ma con risultati meno significativi (PNG, WebP lossless)

Per bilanciare qualità e dimensione del file:
- Utilizzare la risoluzione appropriata per il contesto di visualizzazione
- Applicare una compressione moderata per mantenere una buona qualità visiva
- Rimuovere metadati non necessari (come informazioni EXIF)
- Considerare formati moderni come WebP dove supportati

## Immagini responsive

L'attributo `srcset` permette di specificare diverse versioni della stessa immagine per diverse risoluzioni, consentendo al browser di scegliere quella più appropriata:

```html
<img src="immagine-small.jpg" 
     srcset="immagine-small.jpg 320w,
             immagine-medium.jpg 768w,
             immagine-large.jpg 1200w"
     alt="Immagine responsive">
```

L'attributo `sizes` indica al browser le dimensioni dell'immagine rispetto al viewport, aiutandolo a selezionare la risorsa corretta:

```html
<img src="immagine-small.jpg" 
     srcset="immagine-small.jpg 320w,
             immagine-medium.jpg 768w,
             immagine-large.jpg 1200w"
     sizes="(max-width: 320px) 280px,
            (max-width: 768px) 720px,
            1140px"
     alt="Immagine responsive con sizes">
```

Le media queries CSS possono essere utilizzate per gestire le immagini in modo responsive:

```css
.hero-image {
  background-image: url('small.jpg');
}

@media (min-width: 768px) {
  .hero-image {
    background-image: url('medium.jpg');
  }
}

@media (min-width: 1200px) {
  .hero-image {
    background-image: url('large.jpg');
  }
}
```

L'elemento `<picture>` offre un controllo più preciso per l'art direction, permettendo di mostrare immagini completamente diverse in base al contesto:

```html
<picture>
  <!-- Versione verticale per mobile -->
  <source media="(max-width: 767px)" srcset="ritratto.jpg">
  <!-- Versione orizzontale per desktop -->
  <source media="(min-width: 768px)" srcset="panorama.jpg">
  <!-- Fallback per browser che non supportano picture -->
  <img src="standard.jpg" alt="Immagine adattiva">
</picture>
```

## Tecniche avanzate

Il lazy loading ritarda il caricamento delle immagini fino a quando non sono necessarie, migliorando le prestazioni iniziali della pagina:

```html
<!-- Nativo HTML5 -->
<img src="immagine.jpg" alt="Descrizione" loading="lazy">

<!-- Alternativa JavaScript per browser più datati -->
<img data-src="immagine.jpg" alt="Descrizione" class="lazy">
```

Le immagini di sfondo CSS offrono maggiore flessibilità rispetto alle immagini HTML per effetti decorativi:

```css
.header {
  background-image: url('sfondo.jpg');
  background-size: cover;
  background-position: center;
}
```

Gli sprite di immagini combinano più immagini in un unico file, riducendo le richieste HTTP:

```css
.icon {
  width: 24px;
  height: 24px;
  background-image: url('sprite.png');
}

.icon-home {
  background-position: 0 0;
}

.icon-search {
  background-position: -24px 0;
}
```

Le mappe di immagini creano aree cliccabili all'interno di un'immagine:

```html
<img src="mappa.jpg" alt="Mappa dell'Italia" usemap="#regioni">

<map name="regioni">
  <area shape="poly" coords="88,193,110,185,134,190..." href="lombardia.html" alt="Lombardia">
  <area shape="poly" coords="270,265,290,280,310,270..." href="lazio.html" alt="Lazio">
</map>
```

## Performance e SEO

Le immagini hanno un impatto significativo sulle prestazioni della pagina. Per ottimizzarle:

- Utilizzare formati appropriati e compressione efficiente
- Implementare il lazy loading per le immagini sotto la piega
- Specificare dimensioni con attributi width e height
- Utilizzare immagini responsive con srcset e sizes
- Considerare la strategia di precaricamento per immagini critiche:

```html
<link rel="preload" href="hero-image.jpg" as="image">
```

Per ottimizzare le immagini per i motori di ricerca:

- Utilizzare nomi di file descrittivi (es. `montagna-dolomiti.jpg` invece di `IMG001.jpg`)
- Aggiungere attributi alt significativi
- Includere le immagini nella sitemap XML
- Considerare l'uso di metadati strutturati per immagini importanti

L'utilizzo di Content Delivery Networks (CDN) può migliorare significativamente i tempi di caricamento delle immagini:

```html
<img src="https://cdn.esempio.com/immagini/prodotto.jpg" alt="Prodotto">
```

Largest Contentful Paint (LCP) è una metrica di Core Web Vitals che misura il tempo di caricamento dell'elemento più grande nella viewport. Spesso questo elemento è un'immagine, quindi ottimizzare le immagini principali è cruciale per migliorare questa metrica:

- Precaricamento delle immagini critiche
- Ottimizzazione della compressione
- Utilizzo di formati moderni come WebP
- Implementazione di tecniche di caricamento progressivo

## Conclusione

Le immagini sono elementi fondamentali per creare pagine web coinvolgenti e informative. HTML5 offre un'ampia gamma di strumenti e tecniche per inserire e gestire immagini in modo efficace, accessibile e performante. Dall'elemento base `<img>` alle soluzioni più avanzate come `<picture>` e SVG, è possibile scegliere l'approccio più adatto alle esigenze specifiche del progetto.

L'ottimizzazione delle immagini per il web non è solo una questione tecnica, ma ha un impatto significativo sull'esperienza utente, sull'accessibilità e sul posizionamento nei motori di ricerca. Implementando le best practice discusse in questo capitolo, è possibile creare siti web che caricano rapidamente, sono accessibili a tutti gli utenti e offrono un'esperienza visiva di alta qualità su qualsiasi dispositivo.

---

### Navigazione
- [📑 Indice](<../README.md>)
- [⬅️ Collegamenti ipertestuali](<03_Collegamenti_ipertestuali.md>)
- [➡️ Tabelle: struttura e stile](<05_Tabelle_struttura_stile.md>)