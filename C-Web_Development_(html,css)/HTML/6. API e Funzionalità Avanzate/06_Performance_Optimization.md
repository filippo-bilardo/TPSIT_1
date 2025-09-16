# Performance Optimization

## Introduzione all'ottimizzazione delle performance

L'ottimizzazione delle performance è un aspetto fondamentale dello sviluppo web moderno, che influisce direttamente sull'esperienza utente, sul tasso di conversione e sul posizionamento nei motori di ricerca. Con l'aumento della complessità delle applicazioni web e la diversificazione dei dispositivi di accesso, garantire tempi di caricamento rapidi e interazioni fluide è diventato più importante che mai.

Le statistiche mostrano che:
- Il 53% degli utenti abbandona un sito se impiega più di 3 secondi a caricarsi
- Un miglioramento di 100ms nel tempo di caricamento può aumentare le conversioni del 1%
- Google utilizza la velocità di caricamento come fattore di ranking per i risultati di ricerca

In questo capitolo esploreremo le principali tecniche e best practice per ottimizzare le performance delle applicazioni web, con particolare attenzione agli aspetti legati a HTML5 e alle moderne tecnologie web.

## Metriche di performance

Prima di ottimizzare, è importante comprendere quali metriche misurare. Le Web Vitals di Google forniscono un insieme di metriche standardizzate che si concentrano sull'esperienza utente:

### Core Web Vitals

- **Largest Contentful Paint (LCP)**: misura il tempo di caricamento del contenuto principale. Un buon LCP dovrebbe essere inferiore a 2.5 secondi.
- **First Input Delay (FID)**: misura il tempo che intercorre tra l'interazione dell'utente e la risposta del browser. Un buon FID dovrebbe essere inferiore a 100 millisecondi.
- **Cumulative Layout Shift (CLS)**: misura la stabilità visiva. Un buon CLS dovrebbe essere inferiore a 0.1.

### Altre metriche importanti

- **Time to First Byte (TTFB)**: tempo necessario per ricevere il primo byte di risposta dal server.
- **First Contentful Paint (FCP)**: tempo necessario per visualizzare il primo contenuto significativo.
- **Time to Interactive (TTI)**: tempo necessario affinché la pagina diventi completamente interattiva.

```javascript
// Esempio di misurazione delle performance con l'API Performance

// Misura personalizzata
performance.mark('inizio-operazione');

// Esegui operazione...
const risultato = elaboraDati();

performance.mark('fine-operazione');
performance.measure('durata-operazione', 'inizio-operazione', 'fine-operazione');

// Recupero delle misurazioni
const misurazioni = performance.getEntriesByType('measure');
console.log('Durata operazione:', misurazioni[0].duration, 'ms');

// Utilizzo di PerformanceObserver per monitorare le metriche Web Vitals
const observer = new PerformanceObserver((list) => {
  const entries = list.getEntries();
  entries.forEach((entry) => {
    console.log(`${entry.name}: ${entry.startTime}ms`);
  });
});

observer.observe({ entryTypes: ['largest-contentful-paint', 'layout-shift', 'first-input'] });
```

## Ottimizzazione delle risorse

### Ottimizzazione delle immagini

Le immagini rappresentano spesso la maggior parte del peso di una pagina web. Ottimizzarle è quindi fondamentale per migliorare le performance:

```html
<!-- Utilizzo di formati moderni -->
<picture>
  <source srcset="immagine.webp" type="image/webp">
  <source srcset="immagine.jpg" type="image/jpeg">
  <img src="immagine.jpg" alt="Descrizione" loading="lazy" width="800" height="600">
</picture>

<!-- Immagini responsive con srcset -->
<img 
  src="small.jpg" 
  srcset="small.jpg 500w, medium.jpg 1000w, large.jpg 1500w" 
  sizes="(max-width: 600px) 500px, (max-width: 1200px) 1000px, 1500px" 
  alt="Immagine responsive">

<!-- Lazy loading nativo -->
<img src="immagine.jpg" alt="Caricamento pigro" loading="lazy">
```

Best practice per l'ottimizzazione delle immagini:
- Utilizzare formati moderni come WebP o AVIF quando supportati
- Comprimere le immagini senza perdita significativa di qualità
- Specificare le dimensioni corrette con gli attributi width e height
- Implementare il lazy loading per le immagini non visibili inizialmente
- Utilizzare immagini responsive con srcset e sizes

### Ottimizzazione di CSS e JavaScript

I file CSS e JavaScript possono bloccare il rendering della pagina. Ottimizzarli è essenziale per migliorare i tempi di caricamento:

```html
<!-- CSS critico inline -->
<style>
  /* CSS critico per il rendering iniziale */
  body { margin: 0; font-family: sans-serif; }
  header { background: #f0f0f0; padding: 1rem; }
</style>

<!-- Caricamento asincrono del CSS non critico -->
<link rel="preload" href="styles.css" as="style" onload="this.onload=null;this.rel='stylesheet'">
<noscript><link rel="stylesheet" href="styles.css"></noscript>

<!-- JavaScript asincrono e differito -->
<script src="non-critico.js" async></script>
<script src="dopo-rendering.js" defer></script>
```

Best practice per l'ottimizzazione di CSS e JavaScript:
- Minimizzare e comprimere i file
- Eliminare il codice inutilizzato (tree shaking)
- Caricare il CSS critico inline
- Utilizzare gli attributi async o defer per gli script
- Implementare il code splitting per caricare solo il necessario

## Tecniche di caching

Il caching è una delle tecniche più efficaci per migliorare le performance, riducendo il numero di richieste al server e i tempi di risposta:

```html
<!-- Cache-Control per risorse statiche -->
<!-- Nel server HTTP (esempio per Apache .htaccess) -->
<!--
<IfModule mod_expires.c>
  ExpiresActive On
  ExpiresByType image/jpeg "access plus 1 year"
  ExpiresByType image/png "access plus 1 year"
  ExpiresByType text/css "access plus 1 month"
  ExpiresByType application/javascript "access plus 1 month"
</IfModule>
-->

<!-- Service Worker per caching avanzato -->
<script>
  if ('serviceWorker' in navigator) {
    window.addEventListener('load', () => {
      navigator.serviceWorker.register('/sw.js')
        .then(registration => {
          console.log('Service Worker registrato');
        })
        .catch(error => {
          console.error('Errore nella registrazione del Service Worker:', error);
        });
    });
  }
</script>
```

Esempio di Service Worker per il caching:

```javascript
// sw.js
const CACHE_NAME = 'site-cache-v1';
const urlsToCache = [
  '/',
  '/index.html',
  '/styles/main.css',
  '/scripts/main.js',
  '/images/logo.png'
];

self.addEventListener('install', event => {
  event.waitUntil(
    caches.open(CACHE_NAME)
      .then(cache => {
        return cache.addAll(urlsToCache);
      })
  );
});

self.addEventListener('fetch', event => {
  event.respondWith(
    caches.match(event.request)
      .then(response => {
        if (response) {
          return response;
        }
        return fetch(event.request);
      })
  );
});
```

## Critical Rendering Path

Ottimizzare il Critical Rendering Path significa migliorare i passaggi che il browser deve completare prima di poter renderizzare la pagina iniziale:

1. **Costruzione del DOM**: parsing del HTML
2. **Costruzione del CSSOM**: parsing del CSS
3. **Costruzione del Render Tree**: combinazione di DOM e CSSOM
4. **Layout**: calcolo delle dimensioni e posizioni
5. **Paint**: rendering effettivo sullo schermo

Strategies per ottimizzare il Critical Rendering Path:

```html
<!-- Preload di risorse critiche -->
<link rel="preload" href="font.woff2" as="font" type="font/woff2" crossorigin>
<link rel="preload" href="critical.css" as="style">
<link rel="preload" href="hero-image.jpg" as="image">

<!-- Prefetch di risorse che saranno necessarie in futuro -->
<link rel="prefetch" href="next-page.html">

<!-- Preconnect per stabilire connessioni anticipate -->
<link rel="preconnect" href="https://api.example.com">
<link rel="dns-prefetch" href="https://cdn.example.com">
```

## Ottimizzazione per dispositivi mobili

Con l'aumento del traffico mobile, ottimizzare per questi dispositivi è diventato cruciale:

```html
<!-- Viewport corretto -->
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Utilizzo di media queries per adattare il contenuto -->
<style>
  @media (max-width: 600px) {
    .container {
      padding: 10px;
    }
    .sidebar {
      display: none;
    }
  }
</style>

<!-- Touch target adeguati -->
<style>
  .button {
    min-width: 48px;
    min-height: 48px;
    padding: 12px;
    margin: 8px;
  }
</style>
```

Best practice per l'ottimizzazione mobile:
- Implementare un design responsive
- Ridurre al minimo l'uso di risorse pesanti
- Assicurarsi che gli elementi interattivi abbiano dimensioni adeguate per il touch (almeno 48x48px)
- Testare su dispositivi reali con diverse connessioni

## Strumenti di analisi e monitoraggio

Per ottimizzare efficacemente, è necessario misurare e monitorare costantemente le performance:

### Strumenti di Google

- **Lighthouse**: analisi completa delle performance, accessibilità, SEO e best practice
- **PageSpeed Insights**: analisi delle performance con suggerimenti di ottimizzazione
- **Chrome DevTools**: analisi dettagliata del caricamento, rendering e interazioni

### Web Vitals

```javascript
// Monitoraggio delle Web Vitals con la libreria web-vitals
import {getLCP, getFID, getCLS} from 'web-vitals';

function sendToAnalytics({name, delta, id}) {
  const body = JSON.stringify({name, delta, id});
  
  // Utilizza sendBeacon quando disponibile, altrimenti fetch
  if (navigator.sendBeacon) {
    navigator.sendBeacon('/analytics', body);
  } else {
    fetch('/analytics', {
      body,
      method: 'POST',
      keepalive: true
    });
  }
}

// Monitora e invia le metriche
getLCP(sendToAnalytics);
getFID(sendToAnalytics);
getCLS(sendToAnalytics);
```

## Conclusione

L'ottimizzazione delle performance è un processo continuo che richiede attenzione costante. Seguendo le best practice descritte in questo capitolo, è possibile migliorare significativamente l'esperienza utente e il successo del proprio sito web.

Ricorda che l'approccio migliore è quello di incorporare l'ottimizzazione delle performance fin dall'inizio del processo di sviluppo, piuttosto che considerarla come un'attività da svolgere alla fine.

Alcuni principi chiave da tenere a mente:

1. **Misura prima di ottimizzare**: utilizza strumenti di analisi per identificare i colli di bottiglia reali
2. **Concentrati sull'esperienza utente**: priorizza le ottimizzazioni che hanno il maggiore impatto sulla percezione di velocità
3. **Test su dispositivi reali**: non affidarti solo ai test su desktop o emulatori
4. **Ottimizza progressivamente**: inizia con le ottimizzazioni più semplici e ad alto impatto
5. **Automatizza**: integra i test di performance nel processo di sviluppo e deployment

Implementando queste tecniche e mantenendo un focus costante sulle performance, potrai creare applicazioni web veloci, reattive e in grado di offrire un'esperienza utente eccellente su qualsiasi dispositivo e connessione.

---

### Navigazione
- [📑 Indice](<../README.md>)
- [⬅️ Web Components](<05_Web_Components.md>)
- [➡️ Nuovi tag semantici](<../7. Semantica e Accessibilità/01_Nuovi_tag_semantici.md>)