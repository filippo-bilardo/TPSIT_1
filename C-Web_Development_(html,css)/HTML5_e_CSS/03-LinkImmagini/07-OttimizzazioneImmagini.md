# Ottimizzazione delle Immagini per il Web

## Introduzione

L'ottimizzazione delle immagini è un aspetto fondamentale dello sviluppo web moderno. Immagini non ottimizzate possono rallentare significativamente il caricamento delle pagine, aumentare il consumo di dati degli utenti e influire negativamente sull'esperienza utente complessiva. In questa guida, esploreremo le tecniche e le best practice per ottimizzare le immagini per il web, bilanciando qualità visiva e prestazioni.

## Perché Ottimizzare le Immagini?

L'ottimizzazione delle immagini offre numerosi vantaggi:

1. **Velocità di caricamento**: Pagine più veloci migliorano l'esperienza utente e il posizionamento nei motori di ricerca
2. **Risparmio di banda**: Riduce il consumo di dati, particolarmente importante per utenti mobili
3. **Minore utilizzo di risorse**: Riduce il carico sui server e il consumo di batteria sui dispositivi mobili
4. **Migliore SEO**: I motori di ricerca premiano i siti web con tempi di caricamento rapidi

## Scelta del Formato Corretto

Ogni formato di immagine ha caratteristiche specifiche che lo rendono più adatto per determinati tipi di immagini:

### JPEG/JPG

- **Ideale per**: Fotografie e immagini con molte sfumature di colore
- **Caratteristiche**: Compressione con perdita di qualità, file di dimensioni ridotte
- **Svantaggi**: Non supporta la trasparenza, può mostrare artefatti di compressione

```html
<img src="fotografia.jpg" alt="Fotografia di paesaggio">
```

### PNG

- **Ideale per**: Immagini con trasparenza, grafica con testo, loghi
- **Caratteristiche**: Compressione senza perdita di qualità, supporto per la trasparenza
- **Svantaggi**: File generalmente più grandi rispetto a JPEG

```html
<img src="logo.png" alt="Logo aziendale con sfondo trasparente">
```

### GIF

- **Ideale per**: Animazioni semplici, immagini con pochi colori
- **Caratteristiche**: Supporto per animazioni, compressione senza perdita
- **Svantaggi**: Limitato a 256 colori, non adatto per fotografie

```html
<img src="animazione.gif" alt="Animazione semplice">
```

### SVG

- **Ideale per**: Icone, loghi, illustrazioni vettoriali
- **Caratteristiche**: Formato vettoriale scalabile, file di testo modificabili
- **Svantaggi**: Non adatto per fotografie, può essere complesso per immagini molto dettagliate

```html
<img src="icona.svg" alt="Icona vettoriale">
<!-- oppure incorporato direttamente -->
<svg width="100" height="100"><!-- contenuto SVG --></svg>
```

### WebP

- **Ideale per**: Quasi tutti i tipi di immagini
- **Caratteristiche**: Compressione superiore rispetto a JPEG e PNG, supporto per trasparenza e animazioni
- **Svantaggi**: Non supportato da tutti i browser (anche se la compatibilità è in aumento)

```html
<picture>
  <source srcset="immagine.webp" type="image/webp">
  <img src="immagine.jpg" alt="Immagine di fallback">
</picture>
```

### AVIF

- **Ideale per**: Tutti i tipi di immagini
- **Caratteristiche**: Compressione ancora migliore di WebP, supporto per HDR
- **Svantaggi**: Supporto browser limitato (in crescita)

```html
<picture>
  <source srcset="immagine.avif" type="image/avif">
  <source srcset="immagine.webp" type="image/webp">
  <img src="immagine.jpg" alt="Immagine di fallback">
</picture>
```

## Tecniche di Compressione

### Compressione con Perdita vs Senza Perdita

- **Compressione con perdita**: Riduce le dimensioni del file eliminando dati (JPEG, WebP lossy)
- **Compressione senza perdita**: Riduce le dimensioni senza eliminare dati (PNG, GIF, WebP lossless)

### Strumenti di Compressione

Esistono numerosi strumenti per comprimere le immagini:

1. **Strumenti online**:
   - TinyPNG/TinyJPG
   - Squoosh
   - Compressor.io

2. **Software desktop**:
   - Adobe Photoshop (Salva per web)
   - GIMP
   - ImageOptim (Mac)
   - FileOptimizer (Windows)

3. **Strumenti a riga di comando**:
   - ImageMagick
   - MozJPEG
   - OptiPNG

## Dimensionamento Corretto delle Immagini

### Ridimensionamento

Servire immagini con le dimensioni esatte necessarie per la visualizzazione:

```html
<!-- Sbagliato: immagine da 2000x1500px ridimensionata via HTML -->
<img src="immagine-grande.jpg" width="400" height="300" alt="Immagine">

<!-- Corretto: immagine già ridimensionata al server -->
<img src="immagine-400x300.jpg" width="400" height="300" alt="Immagine">
```

### Immagini Responsive

Utilizzare l'attributo `srcset` per fornire diverse dimensioni di immagini in base al dispositivo:

```html
<img src="immagine-small.jpg"
     srcset="immagine-small.jpg 400w,
             immagine-medium.jpg 800w,
             immagine-large.jpg 1200w"
     sizes="(max-width: 600px) 100vw, (max-width: 1200px) 50vw, 800px"
     alt="Immagine responsive">
```

## Lazy Loading

Il lazy loading carica le immagini solo quando sono necessarie (quando entrano nel viewport):

```html
<img src="immagine.jpg" loading="lazy" alt="Immagine con lazy loading">
```

## Utilizzo di CDN (Content Delivery Network)

I CDN possono migliorare significativamente i tempi di caricamento delle immagini:

1. **Distribuzione geografica**: Serve le immagini dal server più vicino all'utente
2. **Ottimizzazione automatica**: Molti CDN offrono ottimizzazione automatica delle immagini
3. **Caching**: Memorizza nella cache le immagini per un accesso più rapido

## Formati di Nuova Generazione e Fallback

Utilizzare formati moderni con fallback per browser più vecchi:

```html
<picture>
  <!-- Formato più recente e più efficiente -->
  <source srcset="immagine.avif" type="image/avif">
  
  <!-- Fallback a WebP -->
  <source srcset="immagine.webp" type="image/webp">
  
  <!-- Fallback finale a JPEG -->
  <img src="immagine.jpg" alt="Descrizione immagine">
</picture>
```

## Ottimizzazione delle Immagini di Sfondo

Anche le immagini di sfondo CSS possono essere ottimizzate:

```css
/* Utilizzo di media queries per immagini di sfondo responsive */
.header {
  background-image: url('header-small.jpg');
}

@media (min-width: 768px) {
  .header {
    background-image: url('header-medium.jpg');
  }
}

@media (min-width: 1200px) {
  .header {
    background-image: url('header-large.jpg');
  }
}
```

## Sprite CSS

Per icone e piccole immagini ripetute, gli sprite CSS possono ridurre il numero di richieste HTTP:

```css
.icon {
  background-image: url('sprite.png');
  width: 24px;
  height: 24px;
}

.icon-home {
  background-position: 0 0;
}

.icon-search {
  background-position: -24px 0;
}

.icon-settings {
  background-position: -48px 0;
}
```

## Ottimizzazione delle Immagini per Dispositivi ad Alta Densità di Pixel

Per dispositivi con display ad alta densità (Retina), è possibile fornire immagini a risoluzione maggiore:

```html
<img src="immagine.jpg"
     srcset="immagine.jpg 1x,
             immagine@2x.jpg 2x,
             immagine@3x.jpg 3x"
     alt="Immagine per display ad alta densità">
```

## Strumenti di Analisi

Per identificare problemi di ottimizzazione delle immagini:

1. **Google PageSpeed Insights**: Analizza le prestazioni della pagina e suggerisce ottimizzazioni
2. **Lighthouse**: Strumento di audit integrato in Chrome DevTools
3. **WebPageTest**: Test approfondito delle prestazioni del sito

## Checklist per l'Ottimizzazione delle Immagini

1. **Scegli il formato giusto** in base al tipo di immagine
2. **Comprimi le immagini** mantenendo una qualità accettabile
3. **Ridimensiona le immagini** alle dimensioni effettive di visualizzazione
4. **Implementa il lazy loading** per le immagini non visibili inizialmente
5. **Utilizza immagini responsive** con `srcset` e `sizes`
6. **Considera i formati moderni** come WebP e AVIF con fallback
7. **Ottimizza le immagini di sfondo** in CSS
8. **Utilizza CDN** per la distribuzione delle immagini
9. **Fornisci versioni ad alta risoluzione** per display Retina
10. **Monitora regolarmente** le prestazioni delle immagini

## Esempi Pratici

### Ottimizzazione Completa di un'Immagine Hero

```html
<picture>
  <source media="(max-width: 600px)" srcset="hero-mobile.avif" type="image/avif">
  <source media="(max-width: 600px)" srcset="hero-mobile.webp" type="image/webp">
  <source media="(max-width: 600px)" srcset="hero-mobile.jpg">
  
  <source media="(max-width: 1200px)" srcset="hero-tablet.avif" type="image/avif">
  <source media="(max-width: 1200px)" srcset="hero-tablet.webp" type="image/webp">
  <source media="(max-width: 1200px)" srcset="hero-tablet.jpg">
  
  <source srcset="hero-desktop.avif" type="image/avif">
  <source srcset="hero-desktop.webp" type="image/webp">
  <img src="hero-desktop.jpg" alt="Immagine hero" width="1600" height="900" loading="eager">
</picture>
```

### Galleria di Immagini Ottimizzata

```html
<div class="gallery">
  <figure>
    <picture>
      <source srcset="gallery1.webp" type="image/webp">
      <img src="gallery1.jpg" alt="Immagine 1" width="400" height="300" loading="lazy">
    </picture>
    <figcaption>Immagine 1</figcaption>
  </figure>
  
  <figure>
    <picture>
      <source srcset="gallery2.webp" type="image/webp">
      <img src="gallery2.jpg" alt="Immagine 2" width="400" height="300" loading="lazy">
    </picture>
    <figcaption>Immagine 2</figcaption>
  </figure>
  
  <!-- Altre immagini... -->
</div>
```

## Navigazione del Corso
- [📑 Indice](../README.md)
- [⬅️ Mappe Immagine](./06-MappeImmagine.md)
- [➡️ Introduzione a CSS](../04-IntroduzioneCSS/README.md)