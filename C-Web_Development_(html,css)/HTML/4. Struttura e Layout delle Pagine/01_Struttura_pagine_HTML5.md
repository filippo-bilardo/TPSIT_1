# Struttura delle pagine con HTML5

## Elementi semantici strutturali

HTML5 ha introdotto una serie di elementi semantici che permettono di strutturare le pagine web in modo più significativo e comprensibile. Questi elementi non solo migliorano la leggibilità del codice, ma offrono vantaggi in termini di accessibilità, SEO e manutenibilità.

L'elemento `<header>` rappresenta un contenitore per contenuti introduttivi o di navigazione. Tipicamente contiene il logo del sito, il titolo principale, la navigazione primaria e altri elementi di intestazione:

```html
<header>
  <img src="logo.svg" alt="Logo Azienda">
  <h1>Titolo del Sito</h1>
  <nav>
    <ul>
      <li><a href="index.html">Home</a></li>
      <li><a href="prodotti.html">Prodotti</a></li>
      <li><a href="contatti.html">Contatti</a></li>
    </ul>
  </nav>
</header>
```

L'elemento `<footer>` contiene informazioni di chiusura di una sezione o dell'intera pagina, come informazioni di copyright, link a documenti correlati, informazioni di contatto:

```html
<footer>
  <p>&copy; 2023 Nome Azienda. Tutti i diritti riservati.</p>
  <nav>
    <a href="privacy.html">Privacy Policy</a>
    <a href="termini.html">Termini di Servizio</a>
  </nav>
  <address>
    Via Roma 123, Milano<br>
    Email: <a href="mailto:info@esempio.it">info@esempio.it</a>
  </address>
</footer>
```

Gli elementi `<article>` e `<section>` sono spesso fonte di confusione. Un `<article>` rappresenta un contenuto autonomo e indipendente che potrebbe essere distribuito o riutilizzato separatamente dal resto della pagina (come un post di blog, un commento, un widget):

```html
<article>
  <header>
    <h2>Titolo dell'Articolo</h2>
    <p>Pubblicato il <time datetime="2023-06-15">15 Giugno 2023</time> da <a href="#">Autore</a></p>
  </header>
  <p>Contenuto dell'articolo...</p>
  <footer>
    <p>Tags: <a href="#">web</a>, <a href="#">html5</a></p>
  </footer>
</article>
```

Un `<section>` invece rappresenta una sezione generica di contenuto, tipicamente con un titolo, che fa parte di un insieme più ampio:

```html
<section>
  <h2>Caratteristiche del Prodotto</h2>
  <p>Descrizione delle caratteristiche...</p>
  <ul>
    <li>Caratteristica 1</li>
    <li>Caratteristica 2</li>
  </ul>
</section>
```

L'elemento `<aside>` è utilizzato per contenuti correlati ma tangenziali rispetto al contenuto principale, come sidebar, box informativi, pubblicità:

```html
<aside>
  <h3>Articoli Correlati</h3>
  <ul>
    <li><a href="#">Articolo correlato 1</a></li>
    <li><a href="#">Articolo correlato 2</a></li>
  </ul>
  <div class="ad-banner">
    <!-- Contenuto pubblicitario -->
  </div>
</aside>
```

L'elemento `<main>` identifica il contenuto principale del documento, escludendo header, footer, sidebar e altri contenuti ripetuti tra le pagine. Dovrebbe essere unico all'interno della pagina:

```html
<main>
  <h1>Titolo Principale</h1>
  <p>Contenuto principale della pagina...</p>
  <section>
    <!-- Sezione del contenuto principale -->
  </section>
  <article>
    <!-- Articolo nel contenuto principale -->
  </article>
</main>
```

## Modelli di layout comuni

HTML5 e CSS moderno permettono di implementare diversi modelli di layout in modo efficiente e semantico. Ecco alcuni dei pattern più comuni:

**Layout a una colonna**: semplice e diretto, ideale per contenuti focalizzati come landing page o articoli:

```html
<body>
  <header><!-- Intestazione --></header>
  <main>
    <!-- Contenuto a colonna singola -->
  </main>
  <footer><!-- Piè di pagina --></footer>
</body>
```

```css
header, main, footer {
  width: 80%;
  max-width: 1200px;
  margin: 0 auto;
}
```

**Layout a due colonne** (contenuto principale + sidebar): comune per blog, siti di notizie e portali informativi:

```html
<div class="container">
  <main>
    <!-- Contenuto principale -->
  </main>
  <aside>
    <!-- Sidebar -->
  </aside>
</div>
```

```css
.container {
  display: flex;
  max-width: 1200px;
  margin: 0 auto;
}

main {
  flex: 3; /* Proporzione relativa */
  padding-right: 20px;
}

aside {
  flex: 1;
}

@media (max-width: 768px) {
  .container {
    flex-direction: column;
  }
  
  main {
    padding-right: 0;
  }
}
```

**Layout a tre colonne**: utile per portali complessi con molta informazione da organizzare:

```html
<div class="three-col-layout">
  <aside class="left-sidebar"><!-- Sidebar sinistra --></aside>
  <main><!-- Contenuto principale --></main>
  <aside class="right-sidebar"><!-- Sidebar destra --></aside>
</div>
```

```css
.three-col-layout {
  display: grid;
  grid-template-columns: 1fr 3fr 1fr;
  gap: 20px;
  max-width: 1400px;
  margin: 0 auto;
}

@media (max-width: 992px) {
  .three-col-layout {
    grid-template-columns: 1fr 2fr;
  }
  
  .right-sidebar {
    grid-column: span 2;
  }
}

@media (max-width: 768px) {
  .three-col-layout {
    grid-template-columns: 1fr;
  }
  
  .left-sidebar, .right-sidebar {
    grid-column: 1;
  }
}
```

**Layout a griglia**: ideale per gallerie di immagini, portfolio, e-commerce:

```html
<section class="grid-layout">
  <article class="card"><!-- Elemento 1 --></article>
  <article class="card"><!-- Elemento 2 --></article>
  <article class="card"><!-- Elemento 3 --></article>
  <!-- Altri elementi -->
</section>
```

```css
.grid-layout {
  display: grid;
  grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
  gap: 20px;
}

.card {
  border: 1px solid #ddd;
  padding: 15px;
  border-radius: 4px;
}
```

**Layout per applicazioni web**: strutture più complesse con header fisso, sidebar di navigazione e area di contenuto principale:

```html
<div class="app-layout">
  <header class="app-header"><!-- Header dell'app --></header>
  <nav class="app-nav"><!-- Navigazione principale --></nav>
  <main class="app-content"><!-- Contenuto principale --></main>
  <aside class="app-sidebar"><!-- Sidebar contestuale --></aside>
  <footer class="app-footer"><!-- Footer dell'app --></footer>
</div>
```

```css
.app-layout {
  display: grid;
  grid-template-areas:
    "header header"
    "nav content"
    "nav sidebar"
    "footer footer";
  grid-template-rows: auto 1fr auto auto;
  grid-template-columns: 200px 1fr;
  min-height: 100vh;
}

.app-header { grid-area: header; }
.app-nav { grid-area: nav; }
.app-content { grid-area: content; }
.app-sidebar { grid-area: sidebar; }
.app-footer { grid-area: footer; }
```

## Tecniche di strutturazione avanzate

La corretta nidificazione degli elementi semantici è fondamentale per creare strutture HTML5 significative. Ecco alcune linee guida:

- Un `<article>` può contenere il proprio `<header>` e `<footer>`
- Un `<section>` può contenere più `<article>` correlati
- Un `<article>` può contenere più `<section>` che lo suddividono
- Evitare nidificazioni eccessive che complicano la struttura

Esempio di nidificazione corretta:

```html
<article>
  <header>
    <h2>Titolo dell'articolo</h2>
  </header>
  
  <section>
    <h3>Prima sezione</h3>
    <p>Contenuto...</p>
  </section>
  
  <section>
    <h3>Seconda sezione</h3>
    <p>Contenuto...</p>
  </section>
  
  <footer>
    <p>Informazioni sull'articolo</p>
  </footer>
</article>
```

La gestione di header e footer multipli è possibile in HTML5, poiché questi elementi possono apparire più volte in un documento, purché siano all'interno di diversi elementi di sezione:

```html
<body>
  <header><!-- Header principale del sito --></header>
  
  <main>
    <article>
      <header><!-- Header dell'articolo --></header>
      <p>Contenuto dell'articolo...</p>
      <footer><!-- Footer dell'articolo --></footer>
    </article>
  </main>
  
  <footer><!-- Footer principale del sito --></footer>
</body>
```

Per contenuti complessi, è importante mantenere una struttura gerarchica chiara:

```html
<main>
  <h1>Guida completa a HTML5</h1>
  
  <section id="introduzione">
    <h2>Introduzione</h2>
    <p>Panoramica di HTML5...</p>
  </section>
  
  <section id="elementi">
    <h2>Nuovi elementi</h2>
    
    <article id="elementi-semantici">
      <h3>Elementi semantici</h3>
      <p>Descrizione degli elementi semantici...</p>
      
      <section>
        <h4>L'elemento header</h4>
        <p>Dettagli sull'elemento header...</p>
      </section>
      
      <section>
        <h4>L'elemento footer</h4>
        <p>Dettagli sull'elemento footer...</p>
      </section>
    </article>
    
    <article id="elementi-form">
      <h3>Elementi per form</h3>
      <p>Nuovi input type e attributi...</p>
    </article>
  </section>
</main>
```

Per quanto riguarda la navigazione, è possibile organizzarla in principale e secondaria:

```html
<header>
  <nav aria-label="Navigazione principale">
    <!-- Menu principale -->
  </nav>
</header>

<aside>
  <nav aria-label="Navigazione secondaria">
    <!-- Menu secondario o contestuale -->
  </nav>
</aside>
```

## Struttura per dispositivi diversi

L'adattamento della struttura per diversi dispositivi è essenziale nell'era del mobile. Un approccio efficace è il "progressive enhancement", che parte da una base funzionale per tutti i dispositivi e aggiunge funzionalità avanzate per dispositivi più capaci.

L'approccio mobile-first inizia progettando per schermi piccoli e poi adatta il layout per schermi più grandi:

```css
/* Stile base per mobile */
.container {
  display: flex;
  flex-direction: column;
}

/* Adattamento per tablet */
@media (min-width: 768px) {
  .container {
    flex-direction: row;
  }
  
  main {
    flex: 2;
  }
  
  aside {
    flex: 1;
  }
}

/* Adattamento per desktop */
@media (min-width: 1200px) {
  .container {
    max-width: 1200px;
    margin: 0 auto;
  }
}
```

Per nascondere o mostrare elementi in base al dispositivo, si possono utilizzare classi utility:

```css
.mobile-only {
  display: block;
}

.desktop-only {
  display: none;
}

@media (min-width: 768px) {
  .mobile-only {
    display: none;
  }
  
  .desktop-only {
    display: block;
  }
}
```

```html
<button class="mobile-only">Menu</button>

<nav class="desktop-only">
  <!-- Menu di navigazione completo -->
</nav>
```

## Accessibilità della struttura

Una struttura HTML5 semantica migliora significativamente l'accessibilità delle pagine web. Gli elementi semantici forniscono informazioni aggiuntive alle tecnologie assistive, permettendo agli utenti con disabilità di navigare e comprendere meglio il contenuto.

L'uso di landmark ARIA può migliorare ulteriormente l'accessibilità, fornendo punti di riferimento chiari per la navigazione:

```html
<header role="banner">
  <!-- Contenuto dell'header -->
</header>

<nav role="navigation">
  <!-- Menu di navigazione -->
</nav>

<main role="main">
  <!-- Contenuto principale -->
</main>

<aside role="complementary">
  <!-- Contenuto correlato -->
</aside>

<footer role="contentinfo">
  <!-- Informazioni sul copyright, contatti, ecc. -->
</footer>
```

È importante mantenere una struttura di intestazioni logica e gerarchica, utilizzando correttamente gli elementi da `<h1>` a `<h6>`. Questo non solo migliora l'accessibilità, ma anche il SEO.

## Conclusione

La struttura delle pagine HTML5 rappresenta un significativo passo avanti nell'evoluzione del web, offrendo un approccio più semantico e significativo alla creazione di contenuti online. Gli elementi semantici come `<header>`, `<footer>`, `<nav>`, `<main>`, `<article>`, `<section>` e `<aside>` non sono semplici contenitori, ma portatori di significato che migliorano la comprensione del contenuto sia per gli utenti che per le macchine.

Implementare una struttura HTML5 corretta porta numerosi vantaggi: migliora l'accessibilità per gli utenti con disabilità, ottimizza il posizionamento nei motori di ricerca, semplifica la manutenzione del codice e garantisce una maggiore coerenza tra diverse piattaforme e dispositivi.

La vera potenza di HTML5 emerge quando la struttura semantica viene combinata con CSS moderno e JavaScript, creando esperienze web ricche, responsive e accessibili. Adottare le best practice discusse in questo capitolo è essenziale per creare pagine web moderne che siano pronte per il futuro del web.

Gli elementi semantici di HTML5 hanno una corrispondenza diretta con i landmark ARIA (Accessible Rich Internet Applications), che aiutano gli utenti di screen reader a navigare nella pagina:

| Elemento HTML5 | Ruolo ARIA equivalente |
|----------------|------------------------|
| `<header>`     | `role="banner"`        |
| `<nav>`        | `role="navigation"`    |
| `<main>`       | `role="main"`          |
| `<aside>`      | `role="complementary"` |
| `<footer>`     | `role="contentinfo"`   |
| `<section>`    | `role="region"`        |
| `<article>`    | `role="article"`       |
| `<form>`       | `role="form"`          |

---

### Navigazione
- [📑 Indice](<../README.md>)
- [⬅️ Elementi multimediali](<../3. Testo e Formattazione/05_Elementi_multimediali.md>)
- [➡️ Layout responsivi e flessibili](<02_Layout_responsivi_flessibili.md>)