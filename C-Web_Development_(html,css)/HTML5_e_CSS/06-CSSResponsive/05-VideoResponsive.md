# Video Responsive

## Introduzione

I video sono diventati una componente essenziale delle pagine web moderne. Tuttavia, come per le immagini, è importante assicurarsi che i video si adattino correttamente a diverse dimensioni dello schermo. In questa lezione, esploreremo le tecniche per rendere i video responsive e garantire una buona esperienza utente su tutti i dispositivi.

## Tecniche di Base per Video Responsive

### Utilizzo di Contenitori Fluidi

Una delle tecniche più comuni per rendere i video responsive è utilizzare un contenitore con larghezza relativa e impostare il video per adattarsi a questo contenitore:

```css
.video-container {
  position: relative;
  width: 100%;
  padding-bottom: 56.25%; /* Rapporto 16:9 */
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

Questo approccio mantiene il rapporto d'aspetto del video (in questo caso 16:9) indipendentemente dalla dimensione dello schermo.

### HTML5 Video Element

L'elemento `<video>` di HTML5 offre un controllo nativo per i video e può essere facilmente reso responsive:

```html
<video controls width="100%">
  <source src="video.mp4" type="video/mp4">
  <source src="video.webm" type="video/webm">
  Il tuo browser non supporta il tag video.
</video>
```

Impostando `width="100%"`, il video si adatterà alla larghezza del suo contenitore.

## Video Incorporati da Piattaforme Esterne

### YouTube, Vimeo e altre piattaforme

Quando incorpori video da piattaforme come YouTube o Vimeo, puoi utilizzare la tecnica del contenitore fluido:

```html
<div class="video-container">
  <iframe src="https://www.youtube.com/embed/VIDEO_ID" frameborder="0" allowfullscreen></iframe>
</div>
```

### Soluzione con Classi Predefinite

Molti framework CSS come Bootstrap offrono classi predefinite per video responsive:

```html
<!-- Esempio con Bootstrap -->
<div class="ratio ratio-16x9">
  <iframe src="https://www.youtube.com/embed/VIDEO_ID" allowfullscreen></iframe>
</div>
```

## Media Queries per Video

In alcuni casi, potresti voler caricare video diversi in base alla dimensione dello schermo:

```css
/* Video di base per dispositivi mobili */
.background-video {
  background: url('video-small.jpg') no-repeat;
  background-size: cover;
}

/* Video per schermi più grandi */
@media (min-width: 768px) {
  .background-video {
    background: none;
  }
  
  video {
    display: block;
    width: 100%;
  }
}
```

Questo approccio consente di caricare video solo su dispositivi con schermi più grandi, risparmiando larghezza di banda su dispositivi mobili.

## Considerazioni sulla Performance

### Precaricamento e Lazy Loading

Per migliorare le prestazioni, considera l'utilizzo degli attributi di precaricamento e lazy loading:

```html
<video controls preload="none" width="100%" poster="anteprima.jpg">
  <source src="video.mp4" type="video/mp4">
</video>
```

L'attributo `preload="none"` impedisce il caricamento automatico del video, mentre `poster` mostra un'immagine di anteprima fino a quando l'utente non avvia la riproduzione.

### Formati Video Ottimizzati

Utilizza formati video moderni come MP4 (H.264) e WebM per una migliore compatibilità e compressione:

```html
<video controls width="100%">
  <source src="video.webm" type="video/webm">
  <source src="video.mp4" type="video/mp4">
</video>
```

Il browser sceglierà il primo formato supportato nell'elenco.

## Accessibilità dei Video Responsive

Non dimenticare di rendere i tuoi video accessibili:

```html
<video controls width="100%">
  <source src="video.mp4" type="video/mp4">
  <track kind="subtitles" src="sottotitoli.vtt" srclang="it" label="Italiano">
  <track kind="subtitles" src="subtitles.vtt" srclang="en" label="English">
</video>
```

L'elemento `<track>` consente di aggiungere sottotitoli, didascalie e descrizioni audio per migliorare l'accessibilità.

## Esercizi Pratici

1. Crea una pagina con un video HTML5 responsive che mantenga il rapporto d'aspetto 16:9
2. Incorpora un video da YouTube in modo responsive
3. Implementa una soluzione che mostri un'immagine su dispositivi mobili e un video su desktop
4. Aggiungi sottotitoli a un video HTML5 per migliorarne l'accessibilità

## Risorse Aggiuntive

- [MDN Web Docs: Video element](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/video)
- [CSS-Tricks: Fluid Width Video](https://css-tricks.com/fluid-width-video/)
- [web.dev: Fast playback with preload](https://web.dev/fast-playback-with-preload/)

## Navigazione
- [Indice dell'esercitazione](./README.md)
- [Esercitazione precedente: Immagini Responsive](./04-ImmaginiResponsive.md)
- [Prossima esercitazione: Mobile-First Design](./06-MobileFirst.md)