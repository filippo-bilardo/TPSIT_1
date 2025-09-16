# Esercitazione 5: Progetto finale - Sito web completo

## Obiettivi
In questa esercitazione finale metterai in pratica tutte le competenze acquisite nelle esercitazioni precedenti per creare un sito web completo. Imparerai a:
- Progettare e implementare un sito web multi-pagina
- Utilizzare HTML5, CSS3 e JavaScript in modo integrato
- Implementare funzionalità avanzate come form, multimedia e API HTML5
- Ottimizzare il sito per diversi dispositivi e browser
- Applicare best practices di accessibilità e SEO

## Prerequisiti
- Completamento delle Esercitazioni 1-4
- Conoscenza di HTML5, CSS3 e JavaScript di base
- Un editor di testo (VS Code, Sublime Text, Notepad++, ecc.)
- Un browser web moderno (Chrome, Firefox, Edge, ecc.)

## Descrizione del progetto
Dovrai creare un sito web personale o un portfolio che includa le seguenti pagine:
1. **Home page**: presentazione e introduzione
2. **Chi sono/About**: informazioni personali o sull'azienda
3. **Portfolio/Progetti**: galleria di progetti o lavori
4. **Blog/News**: sezione con articoli o notizie
5. **Contatti**: form di contatto e informazioni

## Requisiti tecnici

### Struttura e layout
- Utilizzare i tag semantici di HTML5 per strutturare le pagine
- Implementare un layout responsive che funzioni su dispositivi mobili, tablet e desktop
- Creare un menu di navigazione responsive con effetto hamburger per dispositivi mobili
- Utilizzare CSS Grid e/o Flexbox per il layout

### Contenuti e funzionalità
- Incorporare elementi multimediali (immagini, video, audio)
- Implementare un form di contatto con validazione
- Utilizzare almeno una API HTML5 (geolocalizzazione, canvas, drag and drop, ecc.)
- Implementare una galleria di immagini interattiva
- Creare un blog con almeno 3 articoli di esempio

### Stile e design
- Creare un design coerente e professionale
- Utilizzare una palette di colori armoniosa
- Implementare animazioni e transizioni CSS
- Utilizzare font web (Google Fonts o simili)
- Assicurarsi che il contrasto sia sufficiente per la leggibilità

### Ottimizzazione e best practices
- Ottimizzare le immagini per il web
- Implementare meta tag per SEO
- Assicurarsi che il sito sia accessibile (WCAG)
- Validare il codice HTML e CSS
- Assicurarsi che il sito funzioni su diversi browser

## Fasi di sviluppo

### Fase 1: Pianificazione e design
1. Definire l'obiettivo del sito e il pubblico target
2. Creare una mappa del sito con la struttura delle pagine
3. Disegnare wireframe per le diverse pagine
4. Scegliere la palette di colori e i font

### Fase 2: Struttura HTML
1. Creare la struttura base di tutte le pagine
2. Implementare il menu di navigazione
3. Aggiungere i contenuti principali
4. Implementare il footer con informazioni di copyright e link ai social media

### Fase 3: Stile CSS
1. Creare un file CSS principale per gli stili comuni
2. Implementare il layout responsive
3. Stilizzare tutti gli elementi (testo, immagini, form, ecc.)
4. Aggiungere animazioni e transizioni

### Fase 4: Funzionalità JavaScript
1. Implementare la validazione del form di contatto
2. Creare la galleria di immagini interattiva
3. Aggiungere funzionalità di filtro per i progetti
4. Implementare il menu hamburger per dispositivi mobili

### Fase 5: Test e ottimizzazione
1. Testare il sito su diversi dispositivi e browser
2. Validare il codice HTML e CSS
3. Ottimizzare le immagini e le risorse
4. Verificare l'accessibilità

## Esempi di implementazione

### Esempio di struttura delle cartelle
```
project/
├── index.html
├── about.html
├── portfolio.html
├── blog.html
├── contact.html
├── css/
│   ├── style.css
│   ├── responsive.css
│   └── animations.css
├── js/
│   ├── main.js
│   ├── gallery.js
│   └── form-validation.js
├── images/
│   ├── logo.svg
│   ├── hero-image.jpg
│   ├── projects/
│   │   ├── project1.jpg
│   │   ├── project2.jpg
│   │   └── ...
│   └── blog/
│       ├── article1.jpg
│       ├── article2.jpg
│       └── ...
└── fonts/
    └── ...
```

### Esempio di menu di navigazione responsive
```html
<header>
    <div class="logo">
        <a href="index.html"><img src="images/logo.svg" alt="Logo"></a>
    </div>
    
    <button class="hamburger" id="hamburgerBtn">
        <span></span>
        <span></span>
        <span></span>
    </button>
    
    <nav id="mainNav">
        <ul>
            <li><a href="index.html">Home</a></li>
            <li><a href="about.html">Chi sono</a></li>
            <li><a href="portfolio.html">Portfolio</a></li>
            <li><a href="blog.html">Blog</a></li>
            <li><a href="contact.html">Contatti</a></li>
        </ul>
    </nav>
</header>
```

```css
/* CSS per il menu responsive */
header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 1rem;
    background-color: #fff;
    box-shadow: 0 2px 5px rgba(0,0,0,0.1);
}

.logo img {
    height: 40px;
}

nav ul {
    display: flex;
    list-style: none;
    margin: 0;
    padding: 0;
}

nav li {
    margin: 0 1rem;
}

nav a {
    text-decoration: none;
    color: #333;
    font-weight: 500;
    transition: color 0.3s;
}

nav a:hover {
    color: #4CAF50;
}

.hamburger {
    display: none;
    background: none;
    border: none;
    cursor: pointer;
    padding: 0.5rem;
}

.hamburger span {
    display: block;
    width: 25px;
    height: 3px;
    background-color: #333;
    margin: 5px 0;
    transition: all 0.3s;
}

@media (max-width: 768px) {
    .hamburger {
        display: block;
    }
    
    nav {
        position: absolute;
        top: 70px;
        left: 0;
        right: 0;
        background-color: #fff;
        box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        max-height: 0;
        overflow: hidden;
        transition: max-height 0.3s;
    }
    
    nav.active {
        max-height: 300px;
    }
    
    nav ul {
        flex-direction: column;
        padding: 1rem;
    }
    
    nav li {
        margin: 0.5rem 0;
    }
    
    .hamburger.active span:nth-child(1) {
        transform: rotate(45deg) translate(5px, 5px);
    }
    
    .hamburger.active span:nth-child(2) {
        opacity: 0;
    }
    
    .hamburger.active span:nth-child(3) {
        transform: rotate(-45deg) translate(7px, -7px);
    }
}
```

```javascript
// JavaScript per il menu hamburger
document.addEventListener('DOMContentLoaded', function() {
    const hamburgerBtn = document.getElementById('hamburgerBtn');
    const mainNav = document.getElementById('mainNav');
    
    hamburgerBtn.addEventListener('click', function() {
        hamburgerBtn.classList.toggle('active');
        mainNav.classList.toggle('active');
    });
});
```

## Consegna
Al termine dell'esercitazione, dovresti avere un sito web completo con:
- Almeno 5 pagine HTML
- File CSS per lo stile e la responsività
- File JavaScript per le funzionalità interattive
- Elementi multimediali ottimizzati
- Form di contatto funzionante
- Design responsive che funziona su diversi dispositivi

## Criteri di valutazione
- **Struttura e semantica HTML**: uso corretto dei tag semantici e struttura logica
- **Design e stile CSS**: aspetto visivo, coerenza, responsività
- **Funzionalità JavaScript**: implementazione corretta delle funzionalità interattive
- **Responsività**: adattamento a diverse dimensioni dello schermo
- **Accessibilità**: conformità alle linee guida WCAG
- **Ottimizzazione**: tempi di caricamento, dimensione delle risorse
- **Originalità e creatività**: approccio personale al design e alle funzionalità

## Risorse aggiuntive
- [MDN Web Docs](https://developer.mozilla.org/)
- [CSS-Tricks](https://css-tricks.com/)
- [Google Fonts](https://fonts.google.com/)
- [Font Awesome](https://fontawesome.com/) (per icone)
- [Unsplash](https://unsplash.com/) (per immagini gratuite)
- [TinyPNG](https://tinypng.com/) (per ottimizzare le immagini)
- [Can I Use](https://caniuse.com/) (per verificare il supporto dei browser)
- [WAVE Web Accessibility Tool](https://wave.webaim.org/) (per verificare l'accessibilità)

---
[Torna all'indice delle esercitazioni](../README.md)