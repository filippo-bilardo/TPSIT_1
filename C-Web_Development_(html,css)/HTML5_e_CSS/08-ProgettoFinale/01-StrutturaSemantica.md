# Struttura HTML5 Semantica

## Introduzione

La struttura semantica HTML5 è fondamentale per creare siti web moderni, accessibili e ben organizzati. Utilizzare gli elementi semantici significa dare un significato al contenuto della pagina, non solo definirne l'aspetto. Questo approccio migliora l'accessibilità, il SEO e la manutenibilità del codice.

## Elementi Semantici Principali

HTML5 ha introdotto numerosi elementi semantici che permettono di strutturare il contenuto in modo significativo:

### `<header>`

Rappresenta l'intestazione di una pagina o di una sezione. Tipicamente contiene il logo, il titolo del sito e la navigazione principale.

```html
<header>
  <img src="logo.png" alt="Logo del sito">
  <h1>Nome del Sito</h1>
  <nav>
    <!-- Menu di navigazione -->
  </nav>
</header>
```

### `<nav>`

Definisce una sezione di navigazione, contenente link ad altre pagine o parti del sito.

```html
<nav>
  <ul>
    <li><a href="index.html">Home</a></li>
    <li><a href="chi-siamo.html">Chi Siamo</a></li>
    <li><a href="servizi.html">Servizi</a></li>
    <li><a href="blog.html">Blog</a></li>
    <li><a href="contatti.html">Contatti</a></li>
  </ul>
</nav>
```

### `<main>`

Contiene il contenuto principale della pagina. Dovrebbe essere unico all'interno del documento.

```html
<main>
  <h2>Titolo della Pagina</h2>
  <p>Contenuto principale della pagina...</p>
  <!-- Altri contenuti -->
</main>
```

### `<section>`

Rappresenta una sezione generica di contenuto, tipicamente con un proprio titolo.

```html
<section>
  <h2>I Nostri Servizi</h2>
  <p>Descrizione dei servizi offerti...</p>
  <!-- Altri contenuti relativi ai servizi -->
</section>
```

### `<article>`

Rappresenta un contenuto autonomo e indipendente, come un post di blog, un articolo di giornale o un commento.

```html
<article>
  <h3>Titolo dell'Articolo</h3>
  <p class="metadata">Pubblicato il: <time datetime="2023-06-15">15 Giugno 2023</time> da <a href="#">Autore</a></p>
  <p>Contenuto dell'articolo...</p>
  <!-- Altri contenuti dell'articolo -->
</article>
```

### `<aside>`

Rappresenta contenuto correlato ma separato dal contenuto principale, come una sidebar.

```html
<aside>
  <h3>Articoli Correlati</h3>
  <ul>
    <li><a href="#">Articolo correlato 1</a></li>
    <li><a href="#">Articolo correlato 2</a></li>
    <li><a href="#">Articolo correlato 3</a></li>
  </ul>
</aside>
```

### `<footer>`

Rappresenta il piè di pagina di una pagina o di una sezione. Tipicamente contiene informazioni di copyright, link a documenti legali e contatti.

```html
<footer>
  <p>&copy; 2023 Nome del Sito. Tutti i diritti riservati.</p>
  <nav>
    <ul>
      <li><a href="privacy.html">Privacy Policy</a></li>
      <li><a href="termini.html">Termini di Servizio</a></li>
      <li><a href="cookie.html">Cookie Policy</a></li>
    </ul>
  </nav>
</footer>
```

## Altri Elementi Semantici Utili

### `<figure>` e `<figcaption>`

Utilizzati per contenuti illustrativi come immagini, diagrammi o snippet di codice, con una didascalia associata.

```html
<figure>
  <img src="immagine.jpg" alt="Descrizione dell'immagine">
  <figcaption>Didascalia dell'immagine</figcaption>
</figure>
```

### `<time>`

Rappresenta una data o un orario in un formato leggibile sia dagli umani che dalle macchine.

```html
<p>L'evento si terrà il <time datetime="2023-07-20T18:00">20 Luglio 2023 alle 18:00</time>.</p>
```

### `<address>`

Fornisce informazioni di contatto per l'autore o il proprietario di un documento o di un articolo.

```html
<address>
  <p>Scritto da <a href="mailto:autore@esempio.com">Nome Autore</a></p>
  <p>Via Roma 123, 00100 Roma, Italia</p>
</address>
```

## Struttura Completa di una Pagina

Ecco un esempio di struttura semantica completa per una pagina HTML5:

```html
<!DOCTYPE html>
<html lang="it">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Titolo della Pagina - Nome del Sito</title>
  <link rel="stylesheet" href="css/style.css">
</head>
<body>
  <header>
    <img src="img/logo.png" alt="Logo del Sito">
    <h1>Nome del Sito</h1>
    <nav>
      <ul>
        <li><a href="index.html" class="active">Home</a></li>
        <li><a href="chi-siamo.html">Chi Siamo</a></li>
        <li><a href="servizi.html">Servizi</a></li>
        <li><a href="blog.html">Blog</a></li>
        <li><a href="contatti.html">Contatti</a></li>
      </ul>
    </nav>
  </header>

  <main>
    <section class="hero">
      <h2>Benvenuti nel Nostro Sito</h2>
      <p>Descrizione principale del sito e dei servizi offerti...</p>
      <a href="contatti.html" class="cta-button">Contattaci</a>
    </section>

    <section class="features">
      <h2>I Nostri Servizi</h2>
      
      <article class="feature">
        <h3>Servizio 1</h3>
        <p>Descrizione del servizio 1...</p>
      </article>
      
      <article class="feature">
        <h3>Servizio 2</h3>
        <p>Descrizione del servizio 2...</p>
      </article>
      
      <article class="feature">
        <h3>Servizio 3</h3>
        <p>Descrizione del servizio 3...</p>
      </article>
    </section>

    <section class="testimonials">
      <h2>Cosa Dicono i Nostri Clienti</h2>
      
      <article class="testimonial">
        <blockquote>
          <p>Citazione del cliente...</p>
        </blockquote>
        <footer>
          <cite>— Nome Cliente, Azienda</cite>
        </footer>
      </article>
      
      <!-- Altri testimonial -->
    </section>
  </main>

  <aside class="sidebar">
    <section class="recent-posts">
      <h3>Articoli Recenti</h3>
      <ul>
        <li><a href="#">Titolo articolo 1</a></li>
        <li><a href="#">Titolo articolo 2</a></li>
        <li><a href="#">Titolo articolo 3</a></li>
      </ul>
    </section>
    
    <section class="social-media">
      <h3>Seguici</h3>
      <ul>
        <li><a href="#">Facebook</a></li>
        <li><a href="#">Twitter</a></li>
        <li><a href="#">Instagram</a></li>
        <li><a href="#">LinkedIn</a></li>
      </ul>
    </section>
  </aside>

  <footer>
    <div class="footer-content">
      <div class="company-info">
        <h3>Nome del Sito</h3>
        <address>
          <p>Via Roma 123, 00100 Roma, Italia</p>
          <p>Email: <a href="mailto:info@esempio.com">info@esempio.com</a></p>
          <p>Tel: <a href="tel:+390123456789">+39 012 345 6789</a></p>
        </address>
      </div>
      
      <nav class="footer-nav">
        <h3>Collegamenti Rapidi</h3>
        <ul>
          <li><a href="index.html">Home</a></li>
          <li><a href="chi-siamo.html">Chi Siamo</a></li>
          <li><a href="servizi.html">Servizi</a></li>
          <li><a href="blog.html">Blog</a></li>
          <li><a href="contatti.html">Contatti</a></li>
        </ul>
      </nav>
      
      <nav class="legal-nav">
        <h3>Informazioni Legali</h3>
        <ul>
          <li><a href="privacy.html">Privacy Policy</a></li>
          <li><a href="termini.html">Termini di Servizio</a></li>
          <li><a href="cookie.html">Cookie Policy</a></li>
        </ul>
      </nav>
    </div>
    
    <div class="copyright">
      <p>&copy; 2023 Nome del Sito. Tutti i diritti riservati.</p>
    </div>
  </footer>

  <script src="js/script.js"></script>
</body>
</html>
```

## Vantaggi della Struttura Semantica

### 1. Accessibilità

Gli elementi semantici aiutano le tecnologie assistive (come gli screen reader) a interpretare correttamente il contenuto della pagina, migliorando l'esperienza per gli utenti con disabilità.

### 2. SEO (Search Engine Optimization)

I motori di ricerca comprendono meglio il contenuto della pagina quando è strutturato semanticamente, il che può portare a un migliore posizionamento nei risultati di ricerca.

### 3. Manutenibilità

Il codice semantico è più facile da leggere e mantenere, sia per te che per altri sviluppatori che potrebbero lavorare sul progetto in futuro.

### 4. Consistenza

Utilizzare elementi semantici promuove una struttura coerente in tutto il sito web, migliorando l'esperienza utente.

### 5. Adattabilità

Una struttura semantica ben definita facilita l'adattamento del design a diversi dispositivi e dimensioni dello schermo.

## Best Practices

1. **Usa sempre l'elemento più appropriato** per il contenuto che stai rappresentando.

2. **Non abusare degli elementi semantici** solo per ottenere un certo stile visivo. Usa CSS per lo stile, HTML per la struttura.

3. **Mantieni una gerarchia logica dei titoli** (h1-h6) all'interno della pagina.

4. **Limita l'uso di `<div>` e `<span>`** a situazioni in cui non esiste un elemento semantico più appropriato.

5. **Testa la tua struttura** con strumenti di validazione e tecnologie assistive per assicurarti che sia accessibile e ben formata.

## Conclusione

Implementare una struttura HTML5 semantica è un passo fondamentale nella creazione di siti web moderni e professionali. Non solo migliora l'accessibilità e il SEO, ma rende anche il tuo codice più pulito, più facile da mantenere e più adattabile alle future evoluzioni del web.

Per il tuo progetto finale, assicurati di utilizzare gli elementi semantici in modo appropriato per strutturare ogni pagina del tuo sito, creando una base solida su cui costruire il design e le funzionalità.

## Navigazione del Corso
- [📑 Indice](../README.md)
- [⬅️ Progetto Finale](./README.md)
- [➡️ Layout Responsive](./02-LayoutResponsive.md)