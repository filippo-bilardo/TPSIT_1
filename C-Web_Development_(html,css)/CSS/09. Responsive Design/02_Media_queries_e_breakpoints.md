# Media Queries e Breakpoints

## Indice dei contenuti

- [Introduzione alle Media Queries](#introduzione-alle-media-queries)
  - [Cos'è una media query](#cosè-una-media-query)
  - [Evoluzione e supporto browser](#evoluzione-e-supporto-browser)
- [Sintassi delle Media Queries](#sintassi-delle-media-queries)
  - [Media types](#media-types)
  - [Media features](#media-features)
  - [Operatori logici](#operatori-logici)
- [Breakpoints](#breakpoints)
  - [Cosa sono i breakpoints](#cosa-sono-i-breakpoints)
  - [Approcci alla definizione dei breakpoints](#approcci-alla-definizione-dei-breakpoints)
  - [Breakpoints comuni](#breakpoints-comuni)
- [Mobile-first vs Desktop-first](#mobile-first-vs-desktop-first)
  - [Approccio mobile-first](#approccio-mobile-first)
  - [Approccio desktop-first](#approccio-desktop-first)
  - [Vantaggi e svantaggi](#vantaggi-e-svantaggi)
- [Media Queries Avanzate](#media-queries-avanzate)
  - [Range di valori](#range-di-valori)
  - [Feature queries con @supports](#feature-queries-con-supports)
  - [Preferenze utente](#preferenze-utente)
- [Best Practices](#best-practices)
  - [Organizzazione del codice](#organizzazione-del-codice)
  - [Performance](#performance)
  - [Testing](#testing)
- [Esempi Pratici](#esempi-pratici)
  - [Menu di navigazione responsive](#menu-di-navigazione-responsive)
  - [Layout a griglia responsive](#layout-a-griglia-responsive)
  - [Tipografia responsive](#tipografia-responsive)
- [Strumenti e Risorse](#strumenti-e-risorse)
  - [Strumenti di sviluppo del browser](#strumenti-di-sviluppo-del-browser)
  - [Framework e librerie](#framework-e-librerie)
  - [Risorse online](#risorse-online)
- [Domande di autovalutazione](#domande-di-autovalutazione)
- [Esercizi pratici](#esercizi-pratici)

## Introduzione alle Media Queries

### Cos'è una media query

Le media queries sono una caratteristica fondamentale del CSS3 che permette di applicare stili diversi in base alle caratteristiche del dispositivo o del browser che sta visualizzando la pagina. Sono uno strumento essenziale per creare layout responsive che si adattano a diverse dimensioni dello schermo e condizioni di visualizzazione.

Una media query è composta da:
- Un media type opzionale (screen, print, speech, all)
- Una o più condizioni che verificano le caratteristiche del dispositivo
- Un blocco di regole CSS da applicare quando le condizioni sono soddisfatte

```css
@media screen and (max-width: 768px) {
  /* Regole CSS che si applicano solo su schermi con larghezza massima di 768px */
  body {
    font-size: 14px;
  }
}
```

### Evoluzione e supporto browser

Le media queries sono state introdotte con CSS2 nel 1998, ma inizialmente supportavano solo media type semplici come `screen` e `print`. Con CSS3, le media queries sono state notevolmente potenziate con l'introduzione delle media features come `width`, `height`, `orientation`, ecc.

Cronologia:
- CSS2 (1998): Introduzione dei media type base
- CSS3 Media Queries Level 3 (2012): Aggiunta di media features e operatori logici
- CSS3 Media Queries Level 4 (in sviluppo): Nuove features come `hover`, `pointer`, `prefers-color-scheme`

Oggi le media queries sono supportate da tutti i browser moderni, inclusi:
- Chrome 21+
- Firefox 3.5+
- Safari 4.0+
- Opera 9.0+
- Internet Explorer 9+
- Edge (tutte le versioni)

## Sintassi delle Media Queries

### Media types

I media types specificano il tipo di dispositivo a cui si applicano le regole CSS. I principali sono:

- `all`: Tutti i dispositivi (default se non specificato)
- `screen`: Schermi di computer, tablet, smartphone
- `print`: Stampa e anteprima di stampa
- `speech`: Sintetizzatori vocali

Esempio:

```css
/* Stili per la stampa */
@media print {
  nav, footer {
    display: none; /* Nasconde navigazione e footer durante la stampa */
  }
  
  body {
    font-size: 12pt; /* Dimensione del testo ottimizzata per la stampa */
    color: black;
  }
}
```

### Media features

Le media features sono condizioni che testano caratteristiche specifiche del dispositivo o del browser. Le più comuni includono:

- `width`, `min-width`, `max-width`: Larghezza del viewport
- `height`, `min-height`, `max-height`: Altezza del viewport
- `aspect-ratio`: Rapporto tra larghezza e altezza
- `orientation`: Orientamento del dispositivo (portrait o landscape)
- `resolution`: Risoluzione del dispositivo
- `color`: Numero di bit per componente colore
- `hover`: Capacità del dispositivo di hover (puntatore)
- `pointer`: Precisione del dispositivo di puntamento

Esempi:

```css
/* Stili per dispositivi con larghezza massima di 768px */
@media (max-width: 768px) {
  /* Regole CSS */
}

/* Stili per dispositivi in modalità landscape */
@media (orientation: landscape) {
  /* Regole CSS */
}

/* Stili per dispositivi ad alta risoluzione (retina) */
@media (min-resolution: 2dppx) {
  /* Regole CSS */
}

/* Stili per dispositivi che supportano hover */
@media (hover: hover) {
  .card:hover {
    transform: scale(1.05);
  }
}
```

### Operatori logici

Le media queries supportano operatori logici per creare condizioni più complesse:

- `and`: Richiede che tutte le condizioni siano vere
- `,` (virgola, equivalente a OR): Richiede che almeno una condizione sia vera
- `not`: Nega una media query
- `only`: Previene che browser obsoleti interpretino la query (raramente usato oggi)

Esempi:

```css
/* AND: entrambe le condizioni devono essere vere */
@media screen and (min-width: 768px) and (max-width: 1023px) {
  /* Stili per tablet */
}

/* OR: almeno una condizione deve essere vera */
@media (max-width: 767px), (orientation: portrait) {
  /* Stili per dispositivi mobili o qualsiasi dispositivo in portrait */
}

/* NOT: nega una media query */
@media not screen and (min-width: 768px) {
  /* Stili per tutto tranne schermi >= 768px */
}
```

## Breakpoints

### Cosa sono i breakpoints

I breakpoints sono punti specifici nelle dimensioni del viewport dove il layout cambia per adattarsi meglio alle dimensioni dello schermo. Sono espressi in unità di misura come pixel, em o rem e vengono utilizzati nelle media queries per applicare stili diversi.

I breakpoints rappresentano i "punti di rottura" dove il design deve cambiare per mantenere una buona esperienza utente. Ad esempio, un layout a tre colonne su desktop potrebbe diventare a colonna singola su mobile.

### Approcci alla definizione dei breakpoints

Esistono due approcci principali per definire i breakpoints:

1. **Basati sui dispositivi**: Definire breakpoints in base alle dimensioni comuni dei dispositivi (iPhone, iPad, ecc.)
   - Svantaggi: Richiede aggiornamenti costanti con l'evoluzione dei dispositivi

2. **Basati sul contenuto**: Definire breakpoints quando il layout inizia a "rompersi"
   - Vantaggi: Più flessibile e adattabile a tutti i dispositivi
   - Approccio raccomandato dalla maggior parte degli esperti

Procedura per definire breakpoints basati sul contenuto:
1. Iniziare con il design per la dimensione più piccola (o più grande, a seconda dell'approccio)
2. Allargare (o restringere) gradualmente la finestra del browser
3. Quando il layout inizia a sembrare scomodo o "rotto", definire un breakpoint
4. Adattare il layout per la nuova dimensione
5. Ripetere il processo

### Breakpoints comuni

Sebbene i breakpoints dovrebbero idealmente essere basati sul contenuto, esistono alcune dimensioni comunemente utilizzate che corrispondono a categorie generali di dispositivi:

```css
/* Mobile (base) */
/* Stili di base, nessuna media query necessaria */

/* Mobile grande / Tablet piccolo */
@media (min-width: 576px) {
  /* Stili per viewport >= 576px */
}

/* Tablet */
@media (min-width: 768px) {
  /* Stili per viewport >= 768px */
}

/* Desktop */
@media (min-width: 992px) {
  /* Stili per viewport >= 992px */
}

/* Desktop grande */
@media (min-width: 1200px) {
  /* Stili per viewport >= 1200px */
}

/* Extra large */
@media (min-width: 1400px) {
  /* Stili per viewport >= 1400px */
}
```

Questi breakpoints sono simili a quelli utilizzati da framework come Bootstrap, ma ricorda che il miglior approccio è sempre quello di adattare i breakpoints al tuo specifico contenuto e design.

## Mobile-first vs Desktop-first

### Approccio mobile-first

L'approccio mobile-first consiste nel progettare prima l'interfaccia per dispositivi mobili e poi aggiungere progressivamente funzionalità e complessità per schermi più grandi. Questo approccio utilizza principalmente media queries con `min-width`.

```css
/* Stili di base per mobile */
body {
  font-size: 16px;
}

.container {
  width: 100%;
  padding: 0 15px;
}

/* Tablet e superiori */
@media (min-width: 768px) {
  .container {
    width: 750px;
    margin: 0 auto;
  }
}

/* Desktop e superiori */
@media (min-width: 992px) {
  .container {
    width: 970px;
  }
}
```

### Approccio desktop-first

L'approccio desktop-first consiste nel progettare prima l'interfaccia per desktop e poi semplificarla per schermi più piccoli. Questo approccio utilizza principalmente media queries con `max-width`.

```css
/* Stili di base per desktop */
body {
  font-size: 16px;
}

.container {
  width: 1170px;
  margin: 0 auto;
}

/* Tablet */
@media (max-width: 991px) {
  .container {
    width: 750px;
  }
}

/* Mobile */
@media (max-width: 767px) {
  .container {
    width: 100%;
    padding: 0 15px;
  }
}
```

### Vantaggi e svantaggi

**Mobile-first: Vantaggi**
- Costringe a concentrarsi sui contenuti essenziali
- Migliora le prestazioni su dispositivi con risorse limitate
- Si allinea con l'indicizzazione mobile-first di Google
- Generalmente produce CSS più pulito e leggero

**Mobile-first: Svantaggi**
- Può essere più difficile per designer abituati a lavorare su desktop
- Potrebbe limitare inizialmente la creatività per layout complessi

**Desktop-first: Vantaggi**
- Più intuitivo per progetti con funzionalità complesse principalmente per desktop
- Permette di sfruttare subito tutte le capacità dei browser desktop

**Desktop-first: Svantaggi**
- Rischio di sovraccaricare dispositivi mobili con CSS non necessario
- Può portare a un'esperienza mobile "ridotta" anziché ottimizzata
- Tendenza a creare CSS più pesante

Oggi, l'approccio mobile-first è generalmente considerato la best practice, soprattutto considerando la crescente percentuale di traffico mobile sul web.

## Media Queries Avanzate

### Range di valori

CSS Media Queries Level 4 introduce la sintassi per i range di valori, che semplifica la scrittura di media queries per intervalli di dimensioni:

```css
/* Sintassi tradizionale */
@media (min-width: 768px) and (max-width: 1023px) {
  /* Stili per tablet */
}

/* Nuova sintassi con range (supporto limitato) */
@media (width >= 768px and width <= 1023px) {
  /* Stili per tablet */
}
```

Nota: La sintassi con range ha ancora supporto limitato, quindi è consigliabile utilizzare la sintassi tradizionale per la massima compatibilità.

### Feature queries con @supports

Le feature queries (`@supports`) permettono di applicare stili solo se il browser supporta una determinata funzionalità CSS. Possono essere combinate con le media queries per creare regole ancora più specifiche:

```css
/* Applica stili solo se il browser supporta display: grid */
@supports (display: grid) {
  .container {
    display: grid;
    grid-template-columns: repeat(auto-fill, minmax(200px, 1fr));
    gap: 20px;
  }
}

/* Combina media query e feature query */
@media (min-width: 768px) {
  @supports (display: grid) {
    /* Stili grid per viewport >= 768px */
    .container {
      grid-template-columns: repeat(3, 1fr);
    }
  }
}
```

### Preferenze utente

CSS Media Queries Level 5 introduce media features per rilevare le preferenze dell'utente:

```css
/* Stili per modalità scura */
@media (prefers-color-scheme: dark) {
  body {
    background-color: #121212;
    color: #f0f0f0;
  }
}

/* Stili per utenti che preferiscono animazioni ridotte */
@media (prefers-reduced-motion: reduce) {
  * {
    animation: none !important;
    transition: none !important;
  }
}

/* Stili per utenti che preferiscono un contrasto maggiore */
@media (prefers-contrast: more) {
  body {
    color: black;
    background: white;
  }
  
  a {
    color: blue;
    text-decoration: underline;
  }
}
```

Queste media features permettono di creare esperienze più accessibili e personalizzate in base alle preferenze dell'utente.

## Best Practices

### Organizzazione del codice

Una buona organizzazione delle media queries è fondamentale per mantenere il codice CSS gestibile:

1. **Media queries raggruppate per componente**:
   ```css
   /* Stili base per il componente */
   .component {
     /* Proprietà */
   }
   
   /* Media queries specifiche per il componente */
   @media (min-width: 768px) {
     .component {
       /* Proprietà */
     }
   }
   ```

2. **Media queries raggruppate per breakpoint**:
   ```css
   /* Stili base per tutti i componenti */
   .component1 { /* ... */ }
   .component2 { /* ... */ }
   
   /* Tablet */
   @media (min-width: 768px) {
     .component1 { /* ... */ }
     .component2 { /* ... */ }
   }
   
   /* Desktop */
   @media (min-width: 992px) {
     .component1 { /* ... */ }
     .component2 { /* ... */ }
   }
   ```

3. **File separati per breakpoint**:
   ```css
   /* base.css - Stili di base */
   /* tablet.css - @media (min-width: 768px) */
   /* desktop.css - @media (min-width: 992px) */
   ```

L'approccio migliore dipende dalla dimensione del progetto e dalle preferenze del team. Per progetti più grandi, l'approccio per componente è spesso più manutenibile.

### Performance

Le media queries possono influire sulle prestazioni se non utilizzate correttamente:

1. **Limita il numero di breakpoints**:
   - Usa solo i breakpoints necessari
   - Evita di creare troppi breakpoints specifici per dispositivi

2. **Evita media queries annidate troppo complesse**:
   - Media queries troppo specifiche possono essere difficili da mantenere
   - Possono aumentare la complessità del CSS

3. **Usa min-width invece di max-width quando possibile**:
   - Generalmente più efficiente con l'approccio mobile-first

4. **Considera l'uso di container queries quando disponibili**:
   - Le container queries (in arrivo in CSS) permettono di basare gli stili sulle dimensioni del contenitore anziché del viewport

### Testing

Testare le media queries è essenziale per garantire un'esperienza coerente su tutti i dispositivi:

1. **Usa gli strumenti di sviluppo del browser**:
   - Chrome DevTools, Firefox Developer Tools, ecc.
   - Modalità responsive per simulare diverse dimensioni dello schermo

2. **Testa su dispositivi reali**:
   - I simulatori non catturano sempre tutte le peculiarità dei dispositivi reali
   - Testa su diversi dispositivi e browser quando possibile

3. **Usa servizi di testing cross-browser**:
   - BrowserStack, Sauce Labs, ecc.
   - Permettono di testare su una vasta gamma di dispositivi e browser

4. **Verifica i breakpoints critici**:
   - Testa specificamente ai punti di breakpoint
   - Verifica che la transizione tra layout sia fluida

## Esempi Pratici

### Menu di navigazione responsive

Un esempio classico di utilizzo delle media queries è la creazione di un menu di navigazione che si trasforma in un menu hamburger su dispositivi mobili:

```html
<nav class="navbar">
  <div class="logo">Logo</div>
  <button class="hamburger">☰</button>
  <ul class="nav-links">
    <li><a href="#">Home</a></li>
    <li><a href="#">About</a></li>
    <li><a href="#">Services</a></li>
    <li><a href="#">Contact</a></li>
  </ul>
</nav>
```

```css
.navbar {
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: 1rem;
  background-color: #333;
  color: white;
}

.logo {
  font-size: 1.5rem;
  font-weight: bold;
}

.hamburger {
  display: none;
  background: none;
  border: none;
  color: white;
  font-size: 1.5rem;
  cursor: pointer;
}

.nav-links {
  display: flex;
  list-style: none;
  margin: 0;
  padding: 0;
}

.nav-links li {
  margin-left: 1rem;
}

.nav-links a {
  color: white;
  text-decoration: none;
}

/* Media query per dispositivi mobili */
@media (max-width: 767px) {
  .hamburger {
    display: block;
  }
  
  .nav-links {
    display: none;
    flex-direction: column;
    position: absolute;
    top: 60px;
    left: 0;
    right: 0;
    background: #333;
    z-index: 1;
  }
  
  .nav-links.active {
    display: flex;
  }
  
  .nav-links li {
    margin: 0;
    text-align: center;
  }
  
  .nav-links a {
    display: block;
    padding: 1rem;
    border-bottom: 1px solid #444;
  }
}
```

```javascript
// JavaScript per attivare/disattivare il menu mobile
document.querySelector('.hamburger').addEventListener('click', function() {
  document.querySelector('.nav-links').classList.toggle('active');
});
```

### Layout a griglia responsive

Un layout a griglia che si adatta a diverse dimensioni dello schermo:

```html
<div class="grid-container">
  <div class="card">Card 1</div>
  <div class="card">Card 2</div>
  <div class="card">Card 3</div>
  <div class="card">Card 4</div>
  <div class="card">Card 5</div>
  <div class="card">Card 6</div>
</div>
```

```css
.grid-container {
  display: grid;
  gap: 20px;
  padding: 20px;
}

.card {
  background-color: #f0f0f0;
  border-radius: 8px;
  padding: 20px;
  box-shadow: 0 2px 4px rgba(0,0,0,0.1);
}

/* Mobile: 1 colonna */
.grid-container {
  grid-template-columns: 1fr;
}

/* Tablet: 2 colonne */
@media (min-width: 768px) {
  .grid-container {
    grid-template-columns: repeat(2, 1fr);
  }
}

/* Desktop: 3 colonne */
@media (min-width: 992px) {
  .grid-container {
    grid-template-columns: repeat(3, 1fr);
  }
}

/* Desktop grande: 4 colonne */
@media (min-width: 1200px) {
  .grid-container {
    grid-template-columns: repeat(4, 1fr);
  }
}
```

### Tipografia responsive

Adattare la tipografia a diverse dimensioni dello schermo:

```css
/* Base (mobile) */
html {
  font-size: 16px;
}

h1 {
  font-size: 2rem;      /* 32px */
  line-height: 1.2;
}

h2 {
  font-size: 1.5rem;    /* 24px */
  line-height: 1.3;
}

p {
  font-size: 1rem;      /* 16px */
  line-height: 1.5;
}

/* Tablet */
@media (min-width: 768px) {
  html {
    font-size: 17px;
  }
  
  h1 {
    font-size: 2.25rem;  /* 38.25px */
  }
}

/* Desktop */
@media (min-width: 992px) {
  html {
    font-size: 18px;
  }
  
  h1 {
    font-size: 2.5rem;   /* 45px */
  }
}

/* Approccio alternativo con clamp() */
h1 {
  font-size: clamp(2rem, 5vw, 3rem);
  /* Minimo: 2rem (32px), Preferito: 5vw, Massimo: 3rem (48px) */
}

p {
  font-size: clamp(1rem, 1rem + 0.2vw, 1.2rem);
}
```

## Strumenti e Risorse

### Strumenti di sviluppo del browser

I browser moderni offrono strumenti potenti per lavorare con le media queries:

1. **Chrome DevTools**:
   - Modalità dispositivo (Toggle Device Toolbar)
   - Emulazione di dispositivi specifici
   - Visualizzazione delle media queries attive nella scheda "Styles"

2. **Firefox Developer Tools**:
   - Modalità responsive design
   - Visualizzatore di media queries
   - Emulazione di dispositivi touch

3. **Safari Web Inspector**:
   - Modalità responsive design
   - Emulazione di dispositivi iOS

### Framework e librerie

Framework CSS che semplificano lo sviluppo responsive:

1. **Bootstrap**:
   - Sistema a griglia responsive pronto all'uso
   - Componenti responsive predefiniti
   - Breakpoints predefiniti (576px, 768px, 992px, 1200px, 1400px)

2. **Tailwind CSS**:
   - Utility-first CSS framework
   - Media queries predefinite con prefissi (sm:, md:, lg:, xl:, 2xl:)
   - Altamente personalizzabile

3. **Foundation**:
   - Framework responsive avanzato
   - Sistema a griglia flessibile
   - Approccio mobile-first

### Risorse online

Risorse utili per approfondire le media queries:

1. **Documentazione**:
   - [MDN Web Docs: Media Queries](https://developer.mozilla.org/en-US/docs/Web/CSS/Media_Queries)
   - [W3C Media Queries Level 4](https://www.w3.org/TR/mediaqueries-4/)
   - [CSS-Tricks: A Complete Guide to CSS Media Queries](https://css-tricks.com/a-complete-guide-to-css-media-queries/)

2. **Strumenti online**:
   - [Responsively App](https://responsively.app/) - Testa il design responsive su più dispositivi simultaneamente
   - [Media Query Debugger](https://www.npmjs.com/package/media-query-debugger) - Visualizza le media queries attive
   - [Responsive Design Checker](https://responsivedesignchecker.com/) - Testa il tuo sito su diverse dimensioni dello schermo

3. **Tutorial e corsi**:
   - [freeCodeCamp: Responsive Web Design Certification](https://www.freecodecamp.org/learn/responsive-web-design/)
   - [Udemy: Responsive Web Design Courses](https://www.udemy.com/topic/responsive-web-design/)
   - [YouTube: Kevin Powell's Responsive Design Tutorials](https://www.youtube.com/user/KepowOb)

## Domande di autovalutazione

1. Qual è la differenza tra l'approccio mobile-first e desktop-first? Quali sono i vantaggi di ciascuno?

2. Spiega la sintassi di base di una media query e come funzionano gli operatori logici `and`, `,` (OR) e `not`.

3. Quali sono i principali media types e media features utilizzati nelle media queries?

4. Come si dovrebbero definire i breakpoints in un progetto? È meglio basarli sui dispositivi o sul contenuto?

5. Cosa sono le feature queries (`@supports`) e come possono essere combinate con le media queries?

6. Quali sono le best practices per organizzare le media queries in un progetto CSS di grandi dimensioni?

7. Come si può implementare un menu di navigazione responsive che diventa un menu hamburger su dispositivi mobili?

8. Quali sono le media features introdotte in CSS Media Queries Level 4 e 5 e come possono migliorare l'accessibilità?

9. Come si può testare efficacemente un design responsive durante lo sviluppo?

10. Quali strumenti e framework possono aiutare nello sviluppo di layout responsive?

## Esercizi pratici

1. **Menu di navigazione responsive**:
   Crea un menu di navigazione orizzontale che si trasforma in un menu hamburger su dispositivi mobili (larghezza < 768px).

2. **Layout a griglia responsive**:
   Implementa un layout a griglia che mostri 1 colonna su mobile, 2 colonne su tablet e 3 colonne su desktop.

3. **Card responsive**:
   Crea un componente card che adatti il suo layout in base alla dimensione dello schermo (immag