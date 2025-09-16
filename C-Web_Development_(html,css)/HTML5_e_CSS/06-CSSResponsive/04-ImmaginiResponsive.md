# Immagini Responsive

Le immagini responsive sono un elemento fondamentale del web design moderno, poiché garantiscono una visualizzazione ottimale su qualsiasi dispositivo, migliorano i tempi di caricamento e l'esperienza utente.

## Sfide delle Immagini sul Web

Le immagini presentano diverse sfide nel design responsive:

1. **Dimensioni variabili** - Le immagini devono adattarsi a schermi di diverse dimensioni
2. **Performance** - File di grandi dimensioni rallentano il caricamento della pagina
3. **Densità di pixel** - Dispositivi con display ad alta risoluzione (Retina) richiedono immagini più dettagliate
4. **Larghezza di banda** - Gli utenti mobili potrebbero avere connessioni più lente o limiti di dati

## Tecniche CSS per Immagini Responsive

### Proprietà max-width

La tecnica più semplice per rendere responsive un'immagine è utilizzare la proprietà `max-width`:

```css
img {
  max-width: 100%;
  height: auto;
}
```

Questo assicura che l'immagine non superi mai la larghezza del suo contenitore, mantenendo le proporzioni originali.

### Immagini di Sfondo Responsive

Per le immagini di sfondo, possiamo utilizzare diverse proprietà CSS:

```css
.hero-banner {
  background-image: url('banner.jpg');
  background-size: cover; /* Copre l'intero elemento */
  background-position: center; /* Centra l'immagine */
  height: 50vh; /* Altezza relativa al viewport */
}
```

#### Media Queries per Immagini di Sfondo

```css
.hero-banner {
  background-image: url('banner-small.jpg');
  background-size: cover;
}

@media screen and (min-width: 768px) {
  .hero-banner {
    background-image: url('banner-medium.jpg');
  }
}

@media screen and (min-width: 1200px) {
  .hero-banner {
    background-image: url('banner-large.jpg');
  }
}
```

## Tecniche HTML per Immagini Responsive

### Attributo srcset

L'attributo `srcset` permette di specificare diverse versioni della stessa immagine per diverse risoluzioni o dimensioni dello schermo:

```html
<img src="immagine-small.jpg"
     srcset="immagine-small.jpg 320w,
             immagine-medium.jpg 768w,
             immagine-large.jpg 1200w"
     alt="Descrizione immagine">
```

In questo esempio:
- `320w`, `768w`, `1200w` indicano la larghezza in pixel di ciascuna immagine
- Il browser sceglie automaticamente l'immagine più appropriata in base alla dimensione del viewport e alla densità di pixel del dispositivo

### Attributo sizes

L'attributo `sizes` fornisce informazioni aggiuntive al browser su come l'immagine verrà visualizzata a diverse dimensioni dello schermo:

```html
<img src="immagine-small.jpg"
     srcset="immagine-small.jpg 320w,
             immagine-medium.jpg 768w,
             immagine-large.jpg 1200w"
     sizes="(max-width: 320px) 280px,
            (max-width: 768px) 720px,
            1100px"
     alt="Descrizione immagine">
```

In questo esempio:
- `(max-width: 320px) 280px` indica che su schermi fino a 320px, l'immagine occuperà circa 280px
- Il browser utilizza queste informazioni insieme a `srcset` per selezionare l'immagine più appropriata

### Elemento picture

L'elemento `<picture>` offre un controllo ancora maggiore, permettendo di specificare diverse immagini per diverse condizioni:

```html
<picture>
  <!-- Smartphone in verticale -->
  <source media="(max-width: 480px)" srcset="immagine-mobile.jpg">
  
  <!-- Tablet -->
  <source media="(max-width: 1024px)" srcset="immagine-tablet.jpg">
  
  <!-- Desktop -->
  <source media="(min-width: 1025px)" srcset="immagine-desktop.jpg">
  
  <!-- Fallback per browser che non supportano picture -->
  <img src="immagine-fallback.jpg" alt="Descrizione immagine">
</picture>
```

#### Art Direction con picture

L'elemento `<picture>` è particolarmente utile per l'"art direction", ovvero quando si vogliono mostrare versioni diverse dell'immagine (non solo ridimensionate ma anche ritagliate o composte diversamente) in base al dispositivo:

```html
<picture>
  <!-- Versione mobile: immagine ritagliata sul soggetto principale -->
  <source media="(max-width: 480px)" srcset="prodotto-ritaglio-mobile.jpg">
  
  <!-- Versione desktop: immagine completa con contesto -->
  <img src="prodotto-completo.jpg" alt="Descrizione prodotto">
</picture>
```

## Formati di Immagine Moderni

### WebP

WebP è un formato moderno che offre una migliore compressione rispetto a JPEG e PNG, mantenendo una buona qualità:

```html
<picture>
  <!-- Browser che supportano WebP -->
  <source type="image/webp" srcset="immagine.webp">
  
  <!-- Fallback per altri browser -->
  <img src="immagine.jpg" alt="Descrizione immagine">
</picture>
```

### AVIF

AVIF è un formato ancora più recente con compressione superiore:

```html
<picture>
  <!-- Browser che supportano AVIF -->
  <source type="image/avif" srcset="immagine.avif">
  
  <!-- Browser che supportano WebP -->
  <source type="image/webp" srcset="immagine.webp">
  
  <!-- Fallback per altri browser -->
  <img src="immagine.jpg" alt="Descrizione immagine">
</picture>
```

## Lazy Loading

Il lazy loading ritarda il caricamento delle immagini che non sono immediatamente visibili nella viewport, migliorando i tempi di caricamento iniziali:

```html
<img src="immagine.jpg" alt="Descrizione" loading="lazy">
```

L'attributo `loading="lazy"` è supportato nativamente dai browser moderni.

## Best Practices

1. **Ottimizza le immagini** prima di caricarle (compressione, dimensioni appropriate)
2. **Fornisci sempre l'attributo alt** per l'accessibilità
3. **Usa srcset e sizes** per immagini che devono adattarsi a diverse dimensioni dello schermo
4. **Usa l'elemento picture** per l'art direction o per servire formati moderni con fallback
5. **Implementa il lazy loading** per migliorare le performance
6. **Considera la densità di pixel** fornendo versioni ad alta risoluzione per display Retina
7. **Testa su dispositivi reali** per verificare che le immagini si comportino come previsto

## Esempio Completo

```html
<picture>
  <!-- Formato AVIF con diverse risoluzioni -->
  <source type="image/avif"
          srcset="immagine-small.avif 320w,
                  immagine-medium.avif 768w,
                  immagine-large.avif 1200w"
          sizes="(max-width: 320px) 280px,
                 (max-width: 768px) 720px,
                 1100px">
  
  <!-- Formato WebP con diverse risoluzioni -->
  <source type="image/webp"
          srcset="immagine-small.webp 320w,
                  immagine-medium.webp 768w,
                  immagine-large.webp 1200w"
          sizes="(max-width: 320px) 280px,
                 (max-width: 768px) 720px,
                 1100px">
  
  <!-- Fallback JPEG con diverse risoluzioni -->
  <img src="immagine-medium.jpg"
       srcset="immagine-small.jpg 320w,
               immagine-medium.jpg 768w,
               immagine-large.jpg 1200w"
       sizes="(max-width: 320px) 280px,
              (max-width: 768px) 720px,
              1100px"
       alt="Descrizione dettagliata dell'immagine"
       loading="lazy">
</picture>
```

## Navigazione del Corso
- [📑 Indice](../README.md)
- [⬅️ Unità Relative](./03-UnitàRelative.md)
- [➡️ Video Responsive](./05-VideoResponsive.md)