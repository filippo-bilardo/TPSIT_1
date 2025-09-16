# Layout Responsive

## Introduzione

Un layout responsive è essenziale per garantire che il tuo sito web si adatti e funzioni correttamente su tutti i dispositivi, dalle schermate desktop di grandi dimensioni agli smartphone. Nel progetto finale, implementerai un design completamente responsive che offrirà un'esperienza utente ottimale indipendentemente dal dispositivo utilizzato.

## Principi del Design Responsive

### 1. Design Mobile-First

L'approccio mobile-first consiste nel progettare prima per i dispositivi mobili e poi estendere il design per schermi più grandi. Questo approccio è consigliato perché:

- Costringe a concentrarsi sui contenuti essenziali
- Migliora le prestazioni su dispositivi con risorse limitate
- Semplifica il processo di progettazione progressiva

```css
/* Stile base (mobile) */
.container {
  padding: 15px;
}

/* Media query per tablet */
@media (min-width: 768px) {
  .container {
    padding: 30px;
  }
}

/* Media query per desktop */
@media (min-width: 1024px) {
  .container {
    padding: 40px;
    max-width: 1200px;
    margin: 0 auto;
  }
}
```

### 2. Griglie Flessibili

Utilizza sistemi di griglia flessibili che si adattano alle dimensioni dello schermo, invece di layout a larghezza fissa.

```css
/* Sistema di griglia semplice */
.row {
  display: flex;
  flex-wrap: wrap;
  margin: 0 -15px;
}

.col {
  width: 100%;
  padding: 0 15px;
  box-sizing: border-box;
}

/* Colonne responsive */
@media (min-width: 768px) {
  .col-md-6 {
    width: 50%;
  }
  
  .col-md-4 {
    width: 33.333%;
  }
  
  .col-md-8 {
    width: 66.666%;
  }
}
```

### 3. Media Queries

Le media queries permettono di applicare stili diversi in base alle caratteristiche del dispositivo, come la larghezza dello schermo.

```css
/* Breakpoint comuni */

/* Smartphone (fino a 767px) */
/* Stili di base, non necessitano di media query nell'approccio mobile-first */

/* Tablet (da 768px a 1023px) */
@media (min-width: 768px) and (max-width: 1023px) {
  /* Stili per tablet */
}

/* Desktop (da 1024px in su) */
@media (min-width: 1024px) {
  /* Stili per desktop */
}

/* Desktop di grandi dimensioni (da 1440px in su) */
@media (min-width: 1440px) {
  /* Stili per schermi grandi */
}
```

### 4. Immagini Responsive

Assicurati che le immagini si adattino alle dimensioni del contenitore e non causino overflow orizzontale.

```css
img {
  max-width: 100%;
  height: auto;
  display: block;
}
```

Per immagini più avanzate, utilizza l'attributo `srcset` per fornire versioni diverse dell'immagine in base alla risoluzione del dispositivo:

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

## Tecniche di Layout Responsive

### 1. Flexbox

Flexbox è ideale per layout unidimensionali (righe o colonne) e offre un controllo preciso sull'allineamento e la distribuzione dello spazio.

```css
/* Container di card responsive con Flexbox */
.card-container {
  display: flex;
  flex-wrap: wrap;
  gap: 20px;
  justify-content: center;
}

.card {
  flex: 1 1 300px; /* Grow, shrink, basis */
  max-width: 400px;
  padding: 20px;
  border: 1px solid #ddd;
  border-radius: 8px;
}
```

### 2. CSS Grid

CSS Grid è perfetto per layout bidimensionali (righe e colonne) e offre un controllo preciso sulla posizione degli elementi.

```css
/* Layout di pagina responsive con Grid */
.page-layout {
  display: grid;
  gap: 20px;
  grid-template-columns: 1fr;
}

@media (min-width: 768px) {
  .page-layout {
    grid-template-columns: 2fr 1fr;
    grid-template-areas:
      "header header"
      "main sidebar"
      "footer footer";
  }
  
  .header { grid-area: header; }
  .main { grid-area: main; }
  .sidebar { grid-area: sidebar; }
  .footer { grid-area: footer; }
}
```

### 3. Layout Multi-colonna

Per contenuti testuali, il layout multi-colonna può migliorare la leggibilità su schermi più grandi.

```css
.article-content {
  column-width: 300px; /* Larghezza minima delle colonne */
  column-gap: 40px; /* Spazio tra le colonne */
}

/* Evita che i titoli vengano divisi tra le colonne */
.article-content h2, .article-content h3 {
  column-span: all;
}
```

## Componenti Responsive Comuni

### 1. Menu di Navigazione Responsive

```html
<nav class="main-nav">
  <button class="menu-toggle" aria-expanded="false" aria-controls="main-menu">
    <span class="sr-only">Menu</span>
    <span class="icon-bar"></span>
    <span class="icon-bar"></span>
    <span class="icon-bar"></span>
  </button>
  
  <ul id="main-menu" class="menu">
    <li><a href="index.html">Home</a></li>
    <li><a href="chi-siamo.html">Chi Siamo</a></li>
    <li><a href="servizi.html">Servizi</a></li>
    <li><a href="blog.html">Blog</a></li>
    <li><a href="contatti.html">Contatti</a></li>
  </ul>
</nav>
```

```css
/* Stile base per mobile */
.main-nav {
  position: relative;
}

.menu {
  display: none;
  list-style: none;
  padding: 0;
  margin: 0;
}

.menu-toggle {
  display: block;
  background: none;
  border: none;
  padding: 10px;
  cursor: pointer;
}

.icon-bar {
  display: block;
  width: 25px;
  height: 3px;
  background-color: #333;
  margin: 5px 0;
}

.sr-only {
  position: absolute;
  width: 1px;
  height: 1px;
  padding: 0;
  margin: -1px;
  overflow: hidden;
  clip: rect(0, 0, 0, 0);
  border: 0;
}

/* Menu aperto su mobile */
.menu.active {
  display: block;
}

/* Stile per tablet e desktop */
@media (min-width: 768px) {
  .menu-toggle {
    display: none;
  }
  
  .menu {
    display: flex;
  }
  
  .menu li {
    margin-right: 20px;
  }
  
  .menu li:last-child {
    margin-right: 0;
  }
}
```

```javascript
// JavaScript per il toggle del menu
document.addEventListener('DOMContentLoaded', function() {
  const menuToggle = document.querySelector('.menu-toggle');
  const menu = document.querySelector('.menu');
  
  menuToggle.addEventListener('click', function() {
    const expanded = this.getAttribute('aria-expanded') === 'true' || false;
    this.setAttribute('aria-expanded', !expanded);
    menu.classList.toggle('active');
  });
});
```

### 2. Griglia di Card Responsive

```html
<div class="card-grid">
  <article class="card">
    <img src="immagine1.jpg" alt="Descrizione immagine 1">
    <div class="card-content">
      <h3>Titolo Card 1</h3>
      <p>Descrizione della card...</p>
      <a href="#" class="btn">Leggi di più</a>
    </div>
  </article>
  
  <!-- Altre card simili -->
</div>
```

```css
.card-grid {
  display: grid;
  grid-template-columns: repeat(auto-fill, minmax(280px, 1fr));
  gap: 30px;
}

.card {
  border: 1px solid #ddd;
  border-radius: 8px;
  overflow: hidden;
  transition: transform 0.3s, box-shadow 0.3s;
}

.card:hover {
  transform: translateY(-5px);
  box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1);
}

.card img {
  width: 100%;
  height: 200px;
  object-fit: cover;
}

.card-content {
  padding: 20px;
}

.btn {
  display: inline-block;
  padding: 8px 16px;
  background-color: #0066cc;
  color: white;
  text-decoration: none;
  border-radius: 4px;
  transition: background-color 0.3s;
}

.btn:hover {
  background-color: #0052a3;
}
```

### 3. Layout a Due Colonne Responsive

```html
<div class="two-column-layout">
  <main class="main-content">
    <h2>Contenuto Principale</h2>
    <p>Testo del contenuto principale...</p>
    <!-- Altri contenuti -->
  </main>
  
  <aside class="sidebar">
    <div class="widget">
      <h3>Widget Sidebar</h3>
      <p>Contenuto del widget...</p>
    </div>
    <!-- Altri widget -->
  </aside>
</div>
```

```css
.two-column-layout {
  display: flex;
  flex-direction: column;
  gap: 30px;
}

.main-content {
  width: 100%;
}

.sidebar {
  width: 100%;
}

.widget {
  background-color: #f5f5f5;
  padding: 20px;
  border-radius: 8px;
  margin-bottom: 20px;
}

@media (min-width: 768px) {
  .two-column-layout {
    flex-direction: row;
  }
  
  .main-content {
    flex: 2;
  }
  
  .sidebar {
    flex: 1;
  }
}
```

## Testare il Design Responsive

### 1. Strumenti di Test

- **Chrome DevTools**: Usa la modalità dispositivo per simulare diverse dimensioni di schermo
- **Firefox Responsive Design Mode**: Simile a Chrome DevTools
- **BrowserStack**: Per testare su dispositivi reali
- **Lighthouse**: Per valutare le prestazioni e l'accessibilità su mobile

### 2. Checklist per il Test

- Verifica che il contenuto sia leggibile su tutti i dispositivi senza zoom
- Controlla che i link e i pulsanti siano facilmente cliccabili su touch screen (almeno 44x44px)
- Assicurati che le immagini si adattino correttamente e non causino overflow
- Verifica che i form siano utilizzabili su dispositivi mobili
- Controlla che il menu di navigazione funzioni correttamente su tutti i dispositivi
- Testa le prestazioni di caricamento su connessioni lente

## Implementazione nel Progetto Finale

Per il tuo progetto finale, dovrai implementare un layout responsive che funzioni bene su almeno tre tipi di dispositivi:

1. **Smartphone** (larghezza fino a 767px)
2. **Tablet** (larghezza da 768px a 1023px)
3. **Desktop** (larghezza da 1024px in su)

Ogni pagina del tuo sito dovrebbe adattarsi fluidamente a queste dimensioni, mantenendo una buona usabilità e leggibilità.

### Esempio di Struttura di File CSS

```
/css
  |- style.css         (stili comuni e mobile-first)
  |- responsive.css    (media queries per tablet e desktop)
  |- components/       (componenti riutilizzabili)
     |- navigation.css
     |- cards.css
     |- forms.css
     |- footer.css
```

## Best Practices

1. **Usa unità relative** (%, em, rem, vw, vh) invece di pixel per dimensioni e spaziature

2. **Evita larghezze fisse** che potrebbero causare overflow su schermi piccoli

3. **Testa frequentemente** durante lo sviluppo su diverse dimensioni dello schermo

4. **Considera l'accessibilità** in ogni fase del design responsive

5. **Ottimizza le immagini** per ridurre i tempi di caricamento su dispositivi mobili

6. **Semplifica il design per mobile** rimuovendo elementi non essenziali

7. **Usa font leggibili** con dimensioni appropriate per ogni dispositivo

8. **Implementa touch targets adeguati** per una migliore usabilità su dispositivi touch

## Conclusione

Implementare un layout responsive è fondamentale per garantire che il tuo sito web sia accessibile e utilizzabile da tutti gli utenti, indipendentemente dal dispositivo che stanno utilizzando. Seguendo i principi e le tecniche descritte in questa guida, potrai creare un progetto finale che si adatta perfettamente a qualsiasi dimensione dello schermo, offrendo un'esperienza utente ottimale su desktop, tablet e smartphone.

## Navigazione del Corso
- [📑 Indice](../README.md)
- [⬅️ Struttura Semantica](./01-StrutturaSemantica.md)
- [➡️ Navigazione](./03-Navigazione.md)