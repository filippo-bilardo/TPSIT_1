# Nuovi tag semantici in HTML5 (header, footer, section, article)

## Introduzione alla semantica in HTML5

La semantica nel contesto HTML si riferisce all'uso di elementi che comunicano chiaramente il significato e la struttura del contenuto, non solo la sua presentazione. HTML5 ha segnato un'importante evoluzione rispetto a HTML4 e XHTML, introducendo numerosi elementi semantici che permettono di descrivere più accuratamente la struttura di una pagina web.

Prima di HTML5, gli sviluppatori erano costretti a utilizzare elementi generici come `<div>` con classi o ID descrittivi (es. `<div class="header">`) per strutturare le pagine. Questo approccio, sebbene funzionale, non forniva alcun significato semantico intrinseco al markup, rendendo più difficile per browser, screen reader e motori di ricerca interpretare correttamente la struttura del documento.

I vantaggi di un markup semantico sono molteplici:
- **Accessibilità migliorata**: le tecnologie assistive possono interpretare meglio la struttura della pagina
- **SEO potenziato**: i motori di ricerca comprendono meglio il contenuto e la sua importanza relativa
- **Manutenibilità del codice**: il markup diventa più leggibile e auto-documentato
- **Consistenza**: promuove pratiche di codifica standardizzate

L'impatto di questi elementi semantici si estende oltre il codice stesso, influenzando positivamente l'esperienza utente, la visibilità nei motori di ricerca e la facilità di manutenzione a lungo termine del sito web.

## L'elemento `<header>`

L'elemento `<header>` rappresenta un contenitore per contenuti introduttivi o di navigazione. È tipicamente utilizzato per racchiudere intestazioni, loghi, menu di navigazione principali e altri elementi che appaiono nella parte superiore di una sezione o di una pagina.

```html
<header>
  <img src="logo.png" alt="Logo aziendale">
  <h1>Titolo del sito</h1>
  <nav>
    <ul>
      <li><a href="#">Home</a></li>
      <li><a href="#">Chi siamo</a></li>
      <li><a href="#">Contatti</a></li>
    </ul>
  </nav>
</header>
```

È importante distinguere l'elemento `<header>` dall'elemento `<head>`. Mentre `<head>` contiene metadati e informazioni non visibili della pagina (come titolo, collegamenti a CSS, meta tag), `<header>` è un elemento visibile che fa parte del contenuto della pagina e può contenere elementi come titoli, loghi e navigazione.

Una pagina può contenere più elementi `<header>`, non solo nella parte superiore del documento ma anche all'interno di sezioni o articoli. Questo permette di strutturare gerarchicamente i contenuti:

```html
<article>
  <header>
    <h2>Titolo dell'articolo</h2>
    <p>Pubblicato il <time datetime="2023-05-20">20 Maggio 2023</time></p>
  </header>
  <p>Contenuto dell'articolo...</p>
</article>
```

Alcuni pattern comuni e best practices per l'utilizzo dell'elemento `<header>` includono:
- Includere almeno un elemento di intestazione (`<h1>`-`<h6>`) per definire chiaramente la sezione
- Utilizzare `<header>` per raggruppare elementi introduttivi, non solo per la parte superiore della pagina
- Evitare di annidare un `<header>` all'interno di un altro `<header>`
- Combinare con altri elementi semantici come `<nav>` per una struttura più significativa

## L'elemento `<footer>`

L'elemento `<footer>` rappresenta un piè di pagina per il suo elemento genitore, contenendo tipicamente informazioni sulla sezione a cui appartiene. In un contesto di pagina completa, il footer solitamente contiene informazioni di copyright, link a documenti correlati, informazioni di contatto e altri elementi che appaiono nella parte inferiore della pagina.

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

Il contenuto tipico di un footer include:
- Informazioni di copyright
- Link a documenti legali (privacy policy, termini di servizio)
- Informazioni di contatto (spesso all'interno dell'elemento `<address>`)
- Link ai social media
- Link di navigazione secondari
- Crediti del sito

Come per l'elemento `<header>`, anche `<footer>` può essere utilizzato più volte all'interno di una pagina, non solo alla fine del documento ma anche all'interno di sezioni o articoli:

```html
<article>
  <h2>Titolo dell'articolo</h2>
  <p>Contenuto dell'articolo...</p>
  <footer>
    <p>Autore: <a href="#">Nome Autore</a></p>
    <p>Tags: <a href="#">html5</a>, <a href="#">semantica</a></p>
  </footer>
</article>
```

L'elemento `<footer>` ha una relazione complementare con altri elementi semantici, in particolare con `<header>`. Mentre `<header>` introduce una sezione, `<footer>` la conclude, fornendo informazioni di contesto o metadati aggiuntivi.

## L'elemento `<section>`

L'elemento `<section>` rappresenta una sezione generica di contenuto, tipicamente con un titolo. È utilizzato per raggruppare contenuti tematicamente correlati all'interno di un documento.

```html
<section>
  <h2>Caratteristiche del prodotto</h2>
  <p>Il nostro prodotto offre numerosi vantaggi...</p>
  <ul>
    <li>Caratteristica 1</li>
    <li>Caratteristica 2</li>
    <li>Caratteristica 3</li>
  </ul>
</section>
```

La differenza principale tra `<section>` e `<div>` è che `<section>` ha un valore semantico, indicando che il contenuto al suo interno forma un'unità tematica coerente. Un `<div>`, invece, è un contenitore generico senza significato semantico intrinseco. La regola generale è: se il contenuto potrebbe apparire logicamente nel sommario di un documento, probabilmente dovrebbe essere in un elemento `<section>`.

Le sezioni possono essere annidate per creare una gerarchia di contenuti:

```html
<section>
  <h2>Servizi</h2>
  <p>Offriamo diversi servizi professionali...</p>
  
  <section>
    <h3>Consulenza</h3>
    <p>I nostri servizi di consulenza includono...</p>
  </section>
  
  <section>
    <h3>Sviluppo</h3>
    <p>I nostri servizi di sviluppo includono...</p>
  </section>
</section>
```

È importante mantenere una struttura gerarchica coerente con le intestazioni. Ogni `<section>` dovrebbe idealmente iniziare con un elemento di intestazione (`<h1>`-`<h6>`) che ne identifica il tema o l'argomento. Questo non solo migliora la semantica, ma aiuta anche a creare un outline del documento logico e accessibile.

## L'elemento `<article>`

L'elemento `<article>` rappresenta un contenuto autonomo e indipendente che potrebbe essere distribuito o riutilizzato separatamente dal resto della pagina. Esempi tipici includono post di blog, articoli di giornale, commenti degli utenti o widget interattivi.

```html
<article>
  <header>
    <h2>Come utilizzare gli elementi semantici in HTML5</h2>
    <p>Pubblicato il <time datetime="2023-06-15">15 Giugno 2023</time> da <a href="#">Mario Rossi</a></p>
  </header>
  
  <p>HTML5 ha introdotto numerosi elementi semantici che migliorano la struttura delle pagine web...</p>
  
  <footer>
    <p>Categorie: <a href="#">Web Development</a>, <a href="#">HTML5</a></p>
  </footer>
</article>
```

La distinzione tra `<article>` e `<section>` può essere sottile. La domanda chiave da porsi è: il contenuto ha senso come entità indipendente? Se sì, probabilmente dovrebbe essere un `<article>`. Se invece è semplicemente una parte tematica di una pagina più ampia, probabilmente dovrebbe essere una `<section>`.

Gli articoli possono essere annidati quando rappresentano contenuti correlati ma comunque indipendenti:

```html
<article>
  <h2>Post del blog</h2>
  <p>Contenuto principale del post...</p>
  
  <section class="comments">
    <h3>Commenti</h3>
    
    <article class="comment">
      <header>
        <h4>Commento di Giulia</h4>
        <p>Pubblicato il <time datetime="2023-06-16T10:30">16 Giugno, 10:30</time></p>
      </header>
      <p>Ottimo articolo, molto utile!</p>
    </article>
    
    <article class="comment">
      <header>
        <h4>Commento di Marco</h4>
        <p>Pubblicato il <time datetime="2023-06-16T14:45">16 Giugno, 14:45</time></p>
      </header>
      <p>Grazie per le informazioni dettagliate.</p>
    </article>
  </section>
</article>
```

I metadati e le informazioni associate sono spesso inclusi all'interno di elementi `<header>` e `<footer>` annidati nell'articolo, fornendo contesto come data di pubblicazione, autore, categorie o tag.

## Altri elementi semantici correlati

Oltre a `<header>`, `<footer>`, `<section>` e `<article>`, HTML5 ha introdotto altri elementi semantici che completano la struttura delle pagine web.

L'elemento `<nav>` rappresenta una sezione della pagina destinata a contenere link di navigazione principali. Non tutti i gruppi di link devono essere in un elemento `<nav>`, ma solo quelli che costituiscono blocchi di navigazione significativi:

```html
<nav>
  <ul>
    <li><a href="/">Home</a></li>
    <li><a href="/prodotti">Prodotti</a></li>
    <li><a href="/servizi">Servizi</a></li>
    <li><a href="/contatti">Contatti</a></li>
  </ul>
</nav>
```

L'elemento `<aside>` rappresenta una sezione di contenuto tangenzialmente correlato al contenuto circostante, che potrebbe essere considerato separato dal contenuto principale. È comunemente utilizzato per sidebar, box informativi, pubblicità o note a margine:

```html
<aside>
  <h3>Articoli correlati</h3>
  <ul>
    <li><a href="#">Introduzione a CSS Grid</a></li>
    <li><a href="#">Accessibilità web: linee guida essenziali</a></li>
  </ul>
  <div class="ad-banner">
    <!-- Contenuto pubblicitario -->
  </div>
</aside>
```

L'elemento `<main>` rappresenta il contenuto principale del documento, escludendo header, footer, navigazione e sidebar. Dovrebbe essere unico all'interno della pagina:

```html
<main>
  <h1>Titolo principale della pagina</h1>
  <p>Contenuto principale...</p>
  
  <section>
    <!-- Sezione del contenuto principale -->
  </section>
  
  <article>
    <!-- Articolo nel contenuto principale -->
  </article>
</main>
```

Gli elementi `<figure>` e `<figcaption>` sono utilizzati per contenuti illustrativi come immagini, diagrammi o snippet di codice, accompagnati da una didascalia:

```html
<figure>
  <img src="diagramma.png" alt="Diagramma della struttura HTML5">
  <figcaption>Fig. 1: Rappresentazione visiva degli elementi semantici HTML5 e delle loro relazioni.</figcaption>
</figure>
```

## Implementazione pratica

La conversione da layout basati su div a layout semantici è un processo graduale che può migliorare significativamente la qualità del codice. Ecco un esempio di trasformazione:

**Prima (layout basato su div):**

```html
<div class="header">
  <h1>Titolo del sito</h1>
  <div class="nav"><!-- Menu di navigazione --></div>
</div>

<div class="content">
  <div class="main-content">
    <div class="post">
      <h2>Titolo del post</h2>
      <div class="post-meta">Pubblicato il 15/06/2023</div>
      <div class="post-content"><!-- Contenuto del post --></div>
    </div>
  </div>
  
  <div class="sidebar"><!-- Contenuto della sidebar --></div>
</div>

<div class="footer"><!-- Contenuto del footer --></div>
```

**Dopo (layout semantico):**

```html
<header>
  <h1>Titolo del sito</h1>
  <nav><!-- Menu di navigazione --></nav>
</header>

<main>
  <article>
    <header>
      <h2>Titolo del post</h2>
      <p><time datetime="2023-06-15">Pubblicato il 15/06/2023</time></p>
    </header>
    <div class="post-content"><!-- Contenuto del post --></div>
  </article>
</main>

<aside><!-- Contenuto della sidebar --></aside>
```

---

### Navigazione
- [📑 Indice](<../README.md>)
- [⬅️ Performance Optimization](<../6. API e Funzionalità Avanzate/06_Performance_Optimization.md>)
- [➡️ Best practice per un markup semantico](<02_Best_practice_markup_semantico.md>)