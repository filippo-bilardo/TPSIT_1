# Esercitazione 2: Creazione di un layout responsive

## Obiettivi
In questa esercitazione imparerai a:
- Creare un layout responsive utilizzando HTML5 e CSS
- Utilizzare i tag semantici di HTML5 per strutturare la pagina
- Implementare media queries per adattare il layout a diverse dimensioni dello schermo
- Creare un menu di navigazione responsive

## Prerequisiti
- Conoscenza base di HTML5 (completamento dell'Esercitazione 1)
- Conoscenza base di CSS (vedi sezione 8 del corso)
- Un editor di testo (VS Code, Sublime Text, Notepad++, ecc.)
- Un browser web moderno (Chrome, Firefox, Edge, ecc.)

## Esercizio 1: Struttura semantica della pagina

### Istruzioni
1. Crea un nuovo file chiamato `index.html`
2. Inserisci la struttura base di una pagina HTML5
3. Utilizza i tag semantici di HTML5 per creare la seguente struttura:
   - `<header>`: per l'intestazione della pagina
   - `<nav>`: per il menu di navigazione
   - `<main>`: per il contenuto principale
   - `<section>`: per diverse sezioni di contenuto
   - `<article>`: per contenuti indipendenti
   - `<aside>`: per contenuti correlati ma separati
   - `<footer>`: per il piè di pagina

### Esempio di codice
```html
<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Layout Responsive</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <header>
        <h1>Il mio sito responsive</h1>
        <nav>
            <ul>
                <li><a href="#home">Home</a></li>
                <li><a href="#about">Chi siamo</a></li>
                <li><a href="#services">Servizi</a></li>
                <li><a href="#contact">Contatti</a></li>
            </ul>
        </nav>
    </header>
    
    <main>
        <section id="home">
            <h2>Benvenuti</h2>
            <p>Questo è un esempio di layout responsive creato con HTML5 e CSS.</p>
        </section>
        
        <section id="about">
            <h2>Chi siamo</h2>
            <article>
                <h3>La nostra storia</h3>
                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
            </article>
        </section>
        
        <section id="services">
            <h2>I nostri servizi</h2>
            <div class="services-container">
                <article class="service">
                    <h3>Servizio 1</h3>
                    <p>Descrizione del servizio 1.</p>
                </article>
                <article class="service">
                    <h3>Servizio 2</h3>
                    <p>Descrizione del servizio 2.</p>
                </article>
                <article class="service">
                    <h3>Servizio 3</h3>
                    <p>Descrizione del servizio 3.</p>
                </article>
            </div>
        </section>
        
        <aside>
            <h3>Notizie correlate</h3>
            <ul>
                <li>Notizia 1</li>
                <li>Notizia 2</li>
                <li>Notizia 3</li>
            </ul>
        </aside>
    </main>
    
    <footer>
        <p>&copy; 2023 Il mio sito responsive. Tutti i diritti riservati.</p>
    </footer>
</body>
</html>
```

## Esercizio 2: Stile CSS responsive

### Istruzioni
1. Crea un nuovo file chiamato `style.css`
2. Implementa uno stile base per tutti gli elementi della pagina
3. Utilizza il box model per definire margini, padding e bordi
4. Implementa un layout a griglia per la sezione dei servizi
5. Aggiungi media queries per rendere il layout responsive:
   - Layout per dispositivi mobili (max-width: 768px)
   - Layout per tablet (min-width: 769px e max-width: 1024px)
   - Layout per desktop (min-width: 1025px)

### Esempio di codice CSS
```css
/* Reset CSS di base */
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

body {
    font-family: Arial, sans-serif;
    line-height: 1.6;
    color: #333;
}

/* Header e navigazione */
header {
    background-color: #4CAF50;
    color: white;
    padding: 1rem;
    text-align: center;
}

nav ul {
    list-style: none;
    display: flex;
    justify-content: center;
    margin-top: 1rem;
}

nav li {
    margin: 0 1rem;
}

nav a {
    color: white;
    text-decoration: none;
    padding: 0.5rem;
}

nav a:hover {
    background-color: rgba(255, 255, 255, 0.2);
    border-radius: 4px;
}

/* Main content */
main {
    max-width: 1200px;
    margin: 0 auto;
    padding: 1rem;
    display: grid;
    grid-template-columns: 3fr 1fr;
    gap: 2rem;
}

section {
    margin-bottom: 2rem;
}

h2 {
    margin-bottom: 1rem;
    color: #4CAF50;
}

/* Services grid */
.services-container {
    display: grid;
    grid-template-columns: repeat(3, 1fr);
    gap: 1rem;
}

.service {
    background-color: #f9f9f9;
    padding: 1rem;
    border-radius: 4px;
    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
}

/* Aside */
aside {
    background-color: #f0f0f0;
    padding: 1rem;
    border-radius: 4px;
}

aside ul {
    list-style: none;
    margin-top: 0.5rem;
}

aside li {
    margin-bottom: 0.5rem;
    padding-bottom: 0.5rem;
    border-bottom: 1px solid #ddd;
}

/* Footer */
footer {
    background-color: #333;
    color: white;
    text-align: center;
    padding: 1rem;
    margin-top: 2rem;
}

/* Media Queries */
@media (max-width: 768px) {
    nav ul {
        flex-direction: column;
    }
    
    nav li {
        margin: 0.5rem 0;
    }
    
    main {
        grid-template-columns: 1fr;
    }
    
    .services-container {
        grid-template-columns: 1fr;
    }
}

@media (min-width: 769px) and (max-width: 1024px) {
    .services-container {
        grid-template-columns: repeat(2, 1fr);
    }
}
```

## Esercizio 3: Menu di navigazione responsive

### Istruzioni
1. Modifica il file `style.css` per implementare un menu hamburger per dispositivi mobili
2. Aggiungi JavaScript per gestire l'apertura e la chiusura del menu
3. Assicurati che il menu funzioni correttamente su tutte le dimensioni dello schermo

### Esempio di codice JavaScript
```javascript
// Crea un nuovo file chiamato script.js e aggiungi questo codice
document.addEventListener('DOMContentLoaded', function() {
    const hamburger = document.createElement('div');
    hamburger.className = 'hamburger';
    hamburger.innerHTML = '&#9776;';
    
    const nav = document.querySelector('nav');
    const header = document.querySelector('header');
    
    header.insertBefore(hamburger, nav);
    
    hamburger.addEventListener('click', function() {
        nav.classList.toggle('active');
    });
});
```

### CSS aggiuntivo per il menu hamburger
```css
/* Aggiungi questo al tuo file style.css */
.hamburger {
    display: none;
    font-size: 2rem;
    cursor: pointer;
}

@media (max-width: 768px) {
    .hamburger {
        display: block;
    }
    
    nav {
        display: none;
    }
    
    nav.active {
        display: block;
    }
    
    nav ul {
        flex-direction: column;
    }
}
```

## Verifica e test
1. Apri il file `index.html` nel tuo browser
2. Ridimensiona la finestra del browser per verificare che il layout si adatti correttamente
3. Testa il sito su diversi dispositivi o utilizzando gli strumenti di sviluppo del browser
4. Verifica che il menu hamburger funzioni correttamente sui dispositivi mobili

## Consegna
Al termine dell'esercitazione, dovresti avere:
- Un file `index.html` con una struttura semantica
- Un file `style.css` con stili responsive
- Un file `script.js` per la gestione del menu hamburger
- Un layout che si adatta a diverse dimensioni dello schermo

## Risorse aggiuntive
- [MDN Web Docs - CSS Grid Layout](https://developer.mozilla.org/it/docs/Web/CSS/CSS_Grid_Layout)
- [MDN Web Docs - Media Queries](https://developer.mozilla.org/it/docs/Web/CSS/Media_Queries)
- [CSS-Tricks - A Complete Guide to Flexbox](https://css-tricks.com/snippets/css/a-guide-to-flexbox/)
- [CSS-Tricks - A Complete Guide to Grid](https://css-tricks.com/snippets/css/complete-guide-grid/)

---
[Torna all'indice delle esercitazioni](../README.md)