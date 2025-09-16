## Le tecnologie web: HTML, CSS e JavaScript

### Introduzione alle tecnologie web fondamentali
Lo sviluppo web moderno si basa su tre tecnologie fondamentali che lavorano insieme per creare esperienze web complete: HTML, CSS e JavaScript. Queste tecnologie rappresentano rispettivamente la struttura, la presentazione e il comportamento di un sito web. Comprendere il ruolo e le caratteristiche di ciascuna di queste tecnologie è essenziale per chiunque voglia intraprendere un percorso nello sviluppo web.

### HTML: la struttura dei contenuti

#### Cos'è HTML
HTML (HyperText Markup Language) è il linguaggio di markup standard utilizzato per creare la struttura di base delle pagine web. Non è un linguaggio di programmazione, ma un sistema di annotazione che utilizza tag per definire la struttura e il significato dei contenuti. HTML fornisce il fondamento su cui si costruiscono i siti web, definendo elementi come intestazioni, paragrafi, immagini, link, tabelle e form.

#### Caratteristiche principali di HTML
1. **Semantica**: HTML5 ha introdotto numerosi elementi semantici (come `<header>`, `<nav>`, `<section>`, `<article>`) che aiutano a descrivere il significato del contenuto, migliorando l'accessibilità e il SEO.

2. **Accessibilità**: HTML include attributi e elementi specifici per migliorare l'accessibilità dei contenuti web per persone con disabilità.

3. **Ipertestualità**: La capacità di collegare documenti attraverso link ipertestuali è una caratteristica fondamentale di HTML che ha reso possibile il World Wide Web.

4. **Compatibilità**: HTML è progettato per essere retrocompatibile, permettendo ai browser di interpretare correttamente anche markup obsoleto.

#### Esempio di codice HTML base
```html
<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>La mia prima pagina</title>
</head>
<body>
    <header>
        <h1>Benvenuto nel mio sito</h1>
        <nav>
            <ul>
                <li><a href="#">Home</a></li>
                <li><a href="#">Chi siamo</a></li>
                <li><a href="#">Contatti</a></li>
            </ul>
        </nav>
    </header>
    <main>
        <section>
            <h2>Chi siamo</h2>
            <p>Questo è un paragrafo di esempio che descrive la nostra azienda.</p>
            <img src="immagine.jpg" alt="Descrizione dell'immagine">
        </section>
    </main>
    <footer>
        <p>&copy; 2023 Il Mio Sito</p>
    </footer>
</body>
</html>
```

### CSS: lo stile e la presentazione

#### Cos'è CSS
CSS (Cascading Style Sheets) è un linguaggio di fogli di stile utilizzato per descrivere la presentazione visiva di un documento HTML. Mentre HTML definisce la struttura e il contenuto, CSS controlla come questi elementi appaiono sullo schermo, sulla carta o in altri media. CSS permette di separare il contenuto dalla presentazione, migliorando la manutenibilità e la flessibilità del design web.

#### Caratteristiche principali di CSS
1. **Selettori**: CSS utilizza selettori per targettizzare elementi HTML specifici. I selettori possono essere basati su tag, classi, ID, attributi o relazioni tra elementi.

2. **Box Model**: Ogni elemento HTML è rappresentato come un box rettangolare, con proprietà come margin, border, padding e content che ne definiscono le dimensioni e lo spazio.

3. **Layout**: CSS offre diversi sistemi di layout, dai tradizionali float e positioning ai moderni Flexbox e Grid, che permettono di creare layout complessi e responsive.

4. **Responsive Design**: Con media queries e unità relative, CSS permette di adattare il design a diverse dimensioni di schermo e dispositivi.

5. **Animazioni e transizioni**: CSS3 ha introdotto la possibilità di creare animazioni e transizioni senza ricorrere a JavaScript o Flash.

#### Esempio di codice CSS
```css
/* Stili generali */
body {
    font-family: 'Arial', sans-serif;
    line-height: 1.6;
    color: #333;
    margin: 0;
    padding: 0;
    background-color: #f4f4f4;
}

/* Header e navigazione */
header {
    background-color: #35424a;
    color: white;
    padding: 20px;
    text-align: center;
}

nav ul {
    list-style: none;
    display: flex;
    justify-content: center;
    padding: 0;
}

nav li {
    margin: 0 15px;
}

nav a {
    color: white;
    text-decoration: none;
}

/* Contenuto principale */
main {
    max-width: 1200px;
    margin: 20px auto;
    padding: 0 20px;
}

section {
    background: white;
    padding: 20px;
    border-radius: 5px;
    box-shadow: 0 2px 5px rgba(0,0,0,0.1);
}

/* Responsive design */
@media (max-width: 768px) {
    nav ul {
        flex-direction: column;
    }
    
    nav li {
        margin: 10px 0;
    }
}
```

### JavaScript: l'interattività e il comportamento

#### Cos'è JavaScript
JavaScript è un linguaggio di programmazione interpretato, orientato agli oggetti e di alto livello, utilizzato principalmente per aggiungere interattività e comportamenti dinamici alle pagine web. A differenza di HTML e CSS, JavaScript è un vero e proprio linguaggio di programmazione che permette di manipolare il contenuto della pagina, rispondere agli eventi utente, comunicare con server e creare applicazioni web complesse.

#### Caratteristiche principali di JavaScript
1. **Manipolazione del DOM**: JavaScript può modificare dinamicamente la struttura, il contenuto e lo stile di una pagina web attraverso il Document Object Model (DOM).

2. **Gestione degli eventi**: Permette di rispondere alle azioni dell'utente come clic, movimenti del mouse, input da tastiera e altro.

3. **AJAX e Fetch API**: Consente di effettuare richieste asincrone al server senza ricaricare la pagina, permettendo esperienze utente più fluide.

4. **Linguaggio versatile**: JavaScript supporta diversi paradigmi di programmazione, inclusi orientato agli oggetti, funzionale e imperativo.

5. **Ecosistema ricco**: Un vasto ecosistema di librerie e framework (come React, Angular, Vue.js) estende le capacità di JavaScript per lo sviluppo di applicazioni web complesse.

#### Esempio di codice JavaScript
```javascript
// Seleziona elementi del DOM
const header = document.querySelector('header');
const navLinks = document.querySelectorAll('nav a');
const sections = document.querySelectorAll('section');

// Aggiunge un evento di scroll
window.addEventListener('scroll', function() {
    // Cambia lo stile dell'header durante lo scroll
    if (window.scrollY > 100) {
        header.classList.add('scrolled');
    } else {
        header.classList.remove('scrolled');
    }
});

// Aggiunge eventi di click ai link di navigazione
navLinks.forEach(link => {
    link.addEventListener('click', function(e) {
        e.preventDefault();
        const targetId = this.getAttribute('href').substring(1);
        const targetSection = document.getElementById(targetId);
        
        if (targetSection) {
            window.scrollTo({
                top: targetSection.offsetTop - 70,
                behavior: 'smooth'
            });
        }
    });
});

// Funzione per caricare dati da un'API
async function fetchData() {
    try {
        const response = await fetch('https://api.example.com/data');
        const data = await response.json();
        
        // Aggiorna il DOM con i dati ricevuti
        const dataContainer = document.getElementById('data-container');
        data.forEach(item => {
            const element = document.createElement('div');
            element.textContent = item.name;
            dataContainer.appendChild(element);
        });
    } catch (error) {
        console.error('Errore nel caricamento dei dati:', error);
    }
}

// Chiama la funzione quando la pagina è caricata
document.addEventListener('DOMContentLoaded', fetchData);
```

### L'interazione tra HTML, CSS e JavaScript

#### Il modello a tre livelli
Lo sviluppo web moderno segue un modello a tre livelli che separa chiaramente:
1. **Struttura (HTML)**: Definisce cosa sono i contenuti e come sono organizzati.
2. **Presentazione (CSS)**: Controlla come appaiono visivamente i contenuti.
3. **Comportamento (JavaScript)**: Determina come i contenuti rispondono alle interazioni.

Questa separazione migliora la manutenibilità, l'accessibilità e la scalabilità dei progetti web.

#### Esempio di interazione
Consideriamo un semplice esempio di un pulsante che cambia colore quando viene cliccato:

```html
<!-- HTML: struttura -->
<button id="color-button">Cambia colore</button>
```

```css
/* CSS: presentazione iniziale */
#color-button {
    padding: 10px 20px;
    background-color: blue;
    color: white;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    transition: background-color 0.3s ease;
}

#color-button.changed {
    background-color: red;
}
```

```javascript
// JavaScript: comportamento
document.getElementById('color-button').addEventListener('click', function() {
    this.classList.toggle('changed');
});
```

In questo esempio:
- HTML definisce l'esistenza e il tipo dell'elemento (un pulsante).
- CSS definisce l'aspetto iniziale e l'aspetto alternativo del pulsante.
- JavaScript aggiunge l'interattività, cambiando la classe CSS quando l'utente clicca.

### Evoluzione e tendenze future

#### HTML
- **HTML Living Standard**: HTML è ora sviluppato come uno "standard vivente" in continua evoluzione.
- **Web Components**: Permettono di creare componenti riutilizzabili con funzionalità incapsulate.
- **Accessibilità migliorata**: Maggiore enfasi su ARIA e altre tecnologie per migliorare l'accessibilità.

#### CSS
- **CSS Variables**: Permettono di definire valori riutilizzabili in tutto il foglio di stile.
- **CSS Grid e Subgrid**: Sistemi di layout sempre più potenti e flessibili.
- **Houdini**: API che permettono agli sviluppatori di estendere CSS con nuove funzionalità.

#### JavaScript
- **ECMAScript moderno**: Nuove versioni di JavaScript introducono regolarmente nuove funzionalità.
- **WebAssembly**: Permette di eseguire codice compilato ad alte prestazioni nel browser.
- **Framework e librerie**: L'ecosistema continua a evolversi con nuovi strumenti e approcci.

### Conclusione
HTML, CSS e JavaScript formano il triumvirato fondamentale delle tecnologie web front-end. Mentre HTML fornisce la struttura semantica dei contenuti, CSS ne controlla l'aspetto visivo e JavaScript aggiunge interattività e comportamenti dinamici. La separazione di questi tre livelli rappresenta una best practice nello sviluppo web, permettendo una maggiore manutenibilità e flessibilità.

Con l'evoluzione continua del web, queste tecnologie si stanno espandendo e migliorando, offrendo agli sviluppatori strumenti sempre più potenti per creare esperienze web ricche e accessibili. La padronanza di HTML, CSS e JavaScript rimane fondamentale per chiunque voglia intraprendere una carriera nello sviluppo web, costituendo la base su cui si costruiscono competenze più avanzate e specializzate.

---

### Navigazione
- [📑 Indice](<../README.md>)
- [⬅️ Siti web statici e dinamici](<10_Siti_web_statici_e_dinamici.md>)
- [➡️ I protocolli del WWW e messaggi HTTP](<12_Protocolli_WWW_e_messaggi_HTTP.md>)