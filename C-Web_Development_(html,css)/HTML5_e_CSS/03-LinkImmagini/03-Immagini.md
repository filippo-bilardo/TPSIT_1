# Immagini in HTML5

## Introduzione

Le immagini sono elementi fondamentali per arricchire visivamente le pagine web. HTML5 offre diversi modi per inserire e gestire le immagini, permettendo di creare contenuti più coinvolgenti e informativi. In questa guida, esploreremo come inserire correttamente le immagini nelle pagine web e le migliori pratiche da seguire.

## L'elemento `<img>`

L'elemento base per inserire un'immagine in HTML è il tag `<img>`. A differenza di molti altri elementi HTML, `<img>` è un tag vuoto, cioè non ha un tag di chiusura e non contiene testo o altri elementi.

La sintassi base è:

```html
<img src="percorso-dell-immagine.jpg">
```

Dove `src` (source) è un attributo obbligatorio che specifica il percorso dell'immagine da visualizzare.

## Percorsi delle Immagini

Il percorso dell'immagine può essere specificato in diversi modi:

### Percorso Relativo

Quando l'immagine si trova nello stesso sito web:

```html
<!-- Immagine nella stessa cartella del file HTML -->
<img src="logo.jpg">

<!-- Immagine in una sottocartella -->
<img src="images/logo.jpg">

<!-- Immagine nella cartella padre -->
<img src="../logo.jpg">
```

### Percorso Assoluto

Quando l'immagine si trova in un altro sito web o si vuole specificare il percorso completo:

```html
<img src="https://example.com/images/logo.jpg">
```

## Formati di Immagine per il Web

I formati più comuni per le immagini sul web sono:

1. **JPEG/JPG**: Ideale per fotografie e immagini con molti colori e sfumature
2. **PNG**: Ottimo per immagini con trasparenza e grafica con pochi colori
3. **GIF**: Supporta animazioni semplici e trasparenza (limitata)
4. **SVG**: Formato vettoriale scalabile, perfetto per loghi e icone
5. **WebP**: Formato moderno che offre compressione superiore rispetto a JPEG e PNG

Esempio di utilizzo di diversi formati:

```html
<img src="foto.jpg"> <!-- JPEG per fotografie -->
<img src="logo.png"> <!-- PNG per loghi con trasparenza -->
<img src="animazione.gif"> <!-- GIF per semplici animazioni -->
<img src="icona.svg"> <!-- SVG per grafica vettoriale -->
<img src="banner.webp"> <!-- WebP per immagini ottimizzate -->
```

## Dimensioni delle Immagini

È possibile specificare le dimensioni di un'immagine utilizzando gli attributi `width` (larghezza) e `height` (altezza). I valori possono essere espressi in pixel o in percentuale:

```html
<!-- Dimensioni in pixel -->
<img src="logo.jpg" width="300" height="200">

<!-- Larghezza in percentuale, altezza proporzionale -->
<img src="banner.jpg" width="100%">
```

Specificare le dimensioni è una buona pratica perché aiuta il browser a riservare lo spazio corretto durante il caricamento della pagina, riducendo il "layout shift" (spostamento degli elementi durante il caricamento).

## Immagini Responsive

Per creare immagini che si adattano a diverse dimensioni dello schermo, è possibile utilizzare CSS o l'attributo `max-width`:

```html
<!-- Immagine responsive con HTML e CSS inline -->
<img src="foto.jpg" style="max-width: 100%; height: auto;">
```

Un approccio più moderno è utilizzare l'attributo `srcset` che permette di specificare diverse versioni della stessa immagine per diverse risoluzioni dello schermo:

```html
<img src="immagine-small.jpg"
     srcset="immagine-small.jpg 500w,
             immagine-medium.jpg 1000w,
             immagine-large.jpg 1500w"
     sizes="(max-width: 600px) 500px,
            (max-width: 1200px) 1000px,
            1500px"
     alt="Descrizione dell'immagine">
```

Dove:
- `srcset` elenca le diverse versioni dell'immagine con la loro larghezza in pixel (w)
- `sizes` definisce quale versione utilizzare in base alla larghezza della viewport

## Immagini di Sfondo

Oltre all'elemento `<img>`, è possibile inserire immagini come sfondo di elementi HTML utilizzando CSS:

```html
<div style="background-image: url('sfondo.jpg'); width: 100%; height: 300px;"></div>
```

## Lazy Loading

HTML5 supporta il caricamento lazy delle immagini, che carica le immagini solo quando sono visibili nella viewport, migliorando le prestazioni della pagina:

```html
<img src="immagine.jpg" loading="lazy" alt="Descrizione">
```

## Best Practices

1. **Ottimizza le immagini** prima di caricarle sul web (dimensioni e compressione)
2. **Usa il formato appropriato** per ogni tipo di immagine
3. **Specifica sempre l'attributo alt** per l'accessibilità
4. **Fornisci dimensioni esplicite** per ridurre il layout shift
5. **Implementa tecniche responsive** per adattarsi a diversi dispositivi
6. **Utilizza il lazy loading** per migliorare le prestazioni
7. **Considera l'utilizzo di CDN** per immagini su siti ad alto traffico

## Esempi Pratici

### Galleria di Immagini Semplice

```html
<div class="gallery">
  <img src="foto1.jpg" alt="Descrizione foto 1">
  <img src="foto2.jpg" alt="Descrizione foto 2">
  <img src="foto3.jpg" alt="Descrizione foto 3">
</div>

<style>
  .gallery {
    display: flex;
    flex-wrap: wrap;
    gap: 10px;
  }
  .gallery img {
    width: 300px;
    height: auto;
    border-radius: 5px;
  }
</style>
```

### Immagine con Link

```html
<a href="pagina.html">
  <img src="thumbnail.jpg" alt="Clicca per maggiori dettagli">
</a>
```

## Navigazione del Corso
- [📑 Indice](../README.md)
- [⬅️ Attributi dei Link](./02-AttributiLink.md)
- [➡️ Attributi delle Immagini](./04-AttributiImmagini.md)