# Contenuti Multimediali nel Progetto Finale

## Introduzione

I contenuti multimediali come immagini, video e audio sono elementi fondamentali per creare un sito web coinvolgente e visivamente accattivante. In questo modulo, esploreremo come implementare e ottimizzare i contenuti multimediali per il nostro progetto finale, garantendo che siano responsive, accessibili e performanti.

## Immagini Responsive

### Implementazione Base

Per rendere le immagini responsive, utilizza CSS per impostare una larghezza massima:

```css
img {
  max-width: 100%;
  height: auto;
}
```

Questo assicura che le immagini non superino mai la larghezza del loro contenitore e mantengano le proporzioni corrette.

### Utilizzo di srcset e sizes

Per ottimizzare il caricamento delle immagini su diversi dispositivi, utilizza gli attributi `srcset` e `sizes`:

```html
<img src="immagine-small.jpg"
     srcset="immagine-small.jpg 500w,
             immagine-medium.jpg 1000w,
             immagine-large.jpg 1500w"
     sizes="(max-width: 600px) 100vw,
            (max-width: 1200px) 50vw,
            33vw"
     alt="Descrizione dell'immagine">
```

Questo permette al browser di scegliere l'immagine più appropriata in base alla dimensione dello schermo e alla densità di pixel.

### Immagini di Background Responsive

Per le immagini di sfondo, utilizza media queries per caricare immagini diverse in base alla dimensione dello schermo:

```css
.hero {
  background-image: url('hero-mobile.jpg');
  background-size: cover;
  background-position: center;
}

@media (min-width: 768px) {
  .hero {
    background-image: url('hero-tablet.jpg');
  }
}

@media (min-width: 1200px) {
  .hero {
    background-image: url('hero-desktop.jpg');
  }
}
```

## Video Responsive

### Video HTML5

Per incorporare video HTML5 responsive:

```html
<video controls width="100%">
  <source src="video.mp4" type="video/mp4">
  <source src="video.webm" type="video/webm">
  Il tuo browser non supporta il tag video.
</video>
```

### Video Incorporati (YouTube, Vimeo)

Per video da piattaforme esterne, utilizza un contenitore con rapporto d'aspetto fisso:

```html
<div class="video-container">
  <iframe src="https://www.youtube.com/embed/VIDEO_ID" frameborder="0" allowfullscreen></iframe>
</div>
```

```css
.video-container {
  position: relative;
  padding-bottom: 56.25%; /* Rapporto 16:9 */
  height: 0;
  overflow: hidden;
}

.video-container iframe {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
}
```

## Gallerie di Immagini

### Galleria Responsive Semplice

```html
<div class="gallery">
  <figure>
    <img src="immagine1.jpg" alt="Descrizione immagine 1">
    <figcaption>Didascalia immagine 1</figcaption>
  </figure>
  <figure>
    <img src="immagine2.jpg" alt="Descrizione immagine 2">
    <figcaption>Didascalia immagine 2</figcaption>
  </figure>
  <!-- Altre immagini -->
</div>
```

```css
.gallery {
  display: grid;
  grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
  gap: 20px;
}

.gallery figure {
  margin: 0;
  overflow: hidden;
}

.gallery img {
  width: 100%;
  height: 200px;
  object-fit: cover;
  transition: transform 0.3s ease;
}

.gallery img:hover {
  transform: scale(1.05);
}

.gallery figcaption {
  padding: 10px;
  text-align: center;
  background-color: #f5f5f5;
}
```

### Lightbox per Immagini

Per implementare un lightbox, puoi utilizzare librerie come Fancybox, Lightbox2 o creare una soluzione personalizzata con JavaScript:

```html
<div class="gallery">
  <a href="immagine1-large.jpg" class="lightbox-trigger">
    <img src="immagine1-thumb.jpg" alt="Descrizione immagine 1">
  </a>
  <!-- Altre immagini -->
</div>

<div id="lightbox" class="lightbox">
  <span class="close">&times;</span>
  <img class="lightbox-content" id="lightbox-image">
  <div id="caption"></div>
</div>
```

```javascript
// JavaScript semplificato per lightbox
document.querySelectorAll('.lightbox-trigger').forEach(trigger => {
  trigger.addEventListener('click', function(e) {
    e.preventDefault();
    const lightbox = document.getElementById('lightbox');
    const lightboxImg = document.getElementById('lightbox-image');
    const caption = document.getElementById('caption');
    
    lightbox.style.display = 'block';
    lightboxImg.src = this.href;
    caption.innerHTML = this.querySelector('img').alt;
  });
});

document.querySelector('.lightbox .close').addEventListener('click', function() {
  document.getElementById('lightbox').style.display = 'none';
});
```

## Audio Responsive

Per incorporare elementi audio:

```html
<audio controls>
  <source src="audio.mp3" type="audio/mpeg">
  <source src="audio.ogg" type="audio/ogg">
  Il tuo browser non supporta l'elemento audio.
</audio>
```

```css
audio {
  width: 100%;
  max-width: 500px;
}
```

## Ottimizzazione dei Contenuti Multimediali

### Formati di Immagine

- **JPEG**: Per fotografie e immagini con molti colori
- **PNG**: Per immagini che richiedono trasparenza
- **WebP**: Formato moderno con migliore compressione (con fallback per browser più vecchi)
- **SVG**: Per icone, loghi e grafica vettoriale

### Compressione delle Immagini

Utilizza strumenti come TinyPNG, ImageOptim o Squoosh per comprimere le immagini senza perdita significativa di qualità.

### Lazy Loading

Implementa il lazy loading per caricare le immagini solo quando necessario:

```html
<!-- Utilizzo dell'attributo nativo loading -->
<img src="immagine.jpg" loading="lazy" alt="Descrizione immagine">
```

O con JavaScript per browser più vecchi:

```javascript
document.addEventListener("DOMContentLoaded", function() {
  const lazyImages = [].slice.call(document.querySelectorAll("img.lazy"));

  if ("IntersectionObserver" in window) {
    let lazyImageObserver = new IntersectionObserver(function(entries, observer) {
      entries.forEach(function(entry) {
        if (entry.isIntersecting) {
          let lazyImage = entry.target;
          lazyImage.src = lazyImage.dataset.src;
          lazyImage.classList.remove("lazy");
          lazyImageObserver.unobserve(lazyImage);
        }
      });
    });

    lazyImages.forEach(function(lazyImage) {
      lazyImageObserver.observe(lazyImage);
    });
  }
});
```

## Accessibilità dei Contenuti Multimediali

### Testo Alternativo per le Immagini

Assicurati sempre di fornire un testo alternativo descrittivo per le immagini:

```html
<img src="grafico-vendite.jpg" alt="Grafico che mostra l'aumento delle vendite del 25% nel 2023">
```

Per immagini decorative che non aggiungono informazioni al contenuto:

```html
<img src="decorazione.jpg" alt="" role="presentation">
```

### Sottotitoli e Trascrizioni

Per video e audio, fornisci sottotitoli e trascrizioni:

```html
<video controls>
  <source src="video.mp4" type="video/mp4">
  <track src="sottotitoli.vtt" kind="subtitles" srclang="it" label="Italiano">
  Il tuo browser non supporta il tag video.
</video>
```

### ARIA per Contenuti Multimediali

Utilizza attributi ARIA quando necessario per migliorare l'accessibilità:

```html
<div id="slideshow" role="region" aria-label="Galleria di immagini">
  <!-- Contenuto del slideshow -->
</div>
```

## Integrazione con i Social Media

### Open Graph e Twitter Cards

Aggiungi meta tag per controllare come i tuoi contenuti multimediali appaiono quando condivisi sui social media:

```html
<!-- Open Graph -->
<meta property="og:title" content="Titolo della Pagina">
<meta property="og:description" content="Descrizione della pagina">
<meta property="og:image" content="https://tuosito.com/immagine-social.jpg">
<meta property="og:url" content="https://tuosito.com/pagina">

<!-- Twitter Card -->
<meta name="twitter:card" content="summary_large_image">
<meta name="twitter:title" content="Titolo della Pagina">
<meta name="twitter:description" content="Descrizione della pagina">
<meta name="twitter:image" content="https://tuosito.com/immagine-social.jpg">
```

## Conclusione

I contenuti multimediali sono essenziali per creare un sito web coinvolgente, ma devono essere implementati con attenzione per garantire responsività, accessibilità e performance. Utilizzando le tecniche descritte in questo modulo, potrai integrare efficacemente immagini, video e audio nel tuo progetto finale.

Ricorda sempre di ottimizzare i file multimediali, fornire alternative accessibili e testare su diversi dispositivi per garantire un'esperienza utente ottimale.

## Esercizio Pratico

Per il tuo progetto finale, implementa:

1. Una galleria di immagini responsive con lightbox
2. Un video incorporato (YouTube o HTML5) ottimizzato per dispositivi mobili
3. Un'immagine hero responsive con versioni diverse per mobile, tablet e desktop
4. Lazy loading per tutte le immagini sotto la piega

Assicurati che tutti i contenuti multimediali siano accessibili e ottimizzati per le prestazioni.

## Risorse Aggiuntive

- [MDN Web Docs: Immagini Responsive](https://developer.mozilla.org/en-US/docs/Learn/HTML/Multimedia_and_embedding/Responsive_images)
- [web.dev: Ottimizzazione delle Immagini](https://web.dev/fast/#optimize-your-images)
- [W3C: Accessibilità dei Contenuti Multimediali](https://www.w3.org/WAI/media/av/)

## Navigazione
- [Indice del Progetto Finale](./README.md)
- [⬅️ Navigazione](./03-Navigazione.md)
- [➡️ Form e Interattività](./05-FormInterattività.md)