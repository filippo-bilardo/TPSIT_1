# Best practice per un markup semantico

## Principi fondamentali del markup semantico

Il markup semantico si basa sul principio fondamentale della separazione tra contenuto, presentazione e comportamento. Questo approccio, promosso dagli standard web moderni, prevede l'utilizzo di HTML per strutturare il contenuto, CSS per definirne la presentazione e JavaScript per implementarne il comportamento. Questa separazione non è solo una buona pratica di codifica, ma migliora anche la manutenibilità, l'accessibilità e la compatibilità cross-browser del sito web.

Utilizzare gli elementi HTML in base al loro significato semantico, piuttosto che per il loro aspetto predefinito, è essenziale per un markup di qualità. Ad esempio, un titolo dovrebbe essere marcato con elementi di intestazione (`<h1>` - `<h6>`), non con un paragrafo stilizzato per sembrare più grande:

```html
<!-- Corretto: utilizzo semantico -->
<h1>Titolo principale della pagina</h1>

<!-- Scorretto: utilizzo basato sulla presentazione -->
<p style="font-size: 2em; font-weight: bold;">Titolo principale della pagina</p>
```

La minimizzazione dell'uso di elementi generici come `<div>` e `<span>` a favore di elementi semantici più specifici migliora la leggibilità e il significato del codice. Questi elementi generici dovrebbero essere utilizzati solo quando non esiste un elemento semantico più appropriato:

```html
<!-- Preferire questo -->
<article>
  <header>
    <h2>Titolo dell'articolo</h2>
  </header>
  <p>Contenuto dell'articolo...</p>
</article>

<!-- Rispetto a questo -->
<div class="article">
  <div class="header">
    <h2>Titolo dell'articolo</h2>
  </div>
  <p>Contenuto dell'articolo...</p>
</div>
```

La coerenza nella struttura del documento è un altro principio fondamentale. Mantenere uno schema coerente attraverso tutte le pagine del sito non solo migliora l'esperienza utente, ma facilita anche la manutenzione e l'aggiornamento del codice nel tempo.

## Scelta degli elementi appropriati

Prima di iniziare a codificare, è fondamentale analizzare il contenuto per identificare la sua struttura logica. Questo processo, talvolta chiamato "content mapping", aiuta a determinare quali elementi HTML sono più adatti per rappresentare ciascuna parte del contenuto:

1. Identificare le sezioni principali del documento (header, footer, contenuto principale, navigazione)
2. Determinare la gerarchia dei contenuti e le relazioni tra le diverse parti
3. Individuare contenuti autonomi che potrebbero essere articoli indipendenti
4. Riconoscere elementi di supporto come sidebar, note, citazioni

Una volta analizzato il contenuto, è possibile mapparlo agli elementi HTML più appropriati. Ecco alcune linee guida per la scelta degli elementi:

- Utilizzare `<header>` per intestazioni di pagina o sezioni
- Utilizzare `<nav>` per blocchi di navigazione principali
- Utilizzare `<main>` per il contenuto principale della pagina (una sola volta per documento)
- Utilizzare `<article>` per contenuti autonomi e indipendenti
- Utilizzare `<section>` per raggruppare contenuti tematicamente correlati
- Utilizzare `<aside>` per contenuti correlati ma tangenziali
- Utilizzare `<footer>` per piè di pagina e informazioni di chiusura

In alcuni casi, potrebbe essere necessario scegliere tra l'utilizzo di elementi specifici o elementi generici con attributi. Ad esempio, per un menu di navigazione:

```html
<!-- Approccio semantico con elemento specifico -->
<nav>
  <ul>
    <li><a href="/">Home</a></li>
    <li><a href="/prodotti">Prodotti</a></li>
  </ul>
</nav>

<!-- Approccio con elemento generico e attributi ARIA -->
<div role="navigation" aria-label="Menu principale">
  <ul>
    <li><a href="/">Home</a></li>
    <li><a href="/prodotti">Prodotti</a></li>
  </ul>
</div>
```

In generale, è preferibile utilizzare elementi semantici nativi quando disponibili, ricorrendo agli attributi ARIA solo quando necessario per migliorare l'accessibilità di strutture complesse o personalizzate.

Per contenuti complessi o casi particolari, potrebbe essere necessario combinare diversi elementi o adottare soluzioni creative. Ad esempio, per una galleria di immagini con didascalie:

```html
<section class="gallery">
  <h2>Galleria fotografica</h2>
  <div class="gallery-grid">
    <figure>
      <img src="foto1.jpg" alt="Descrizione della foto 1">
      <figcaption>Didascalia della foto 1</figcaption>
    </figure>
    <figure>
      <img src="foto2.jpg" alt="Descrizione della foto 2">
      <figcaption>Didascalia della foto 2</figcaption>
    </figure>
    <!-- Altre immagini -->
  </div>
</section>
```

## Struttura gerarchica del documento

Un documento HTML ben strutturato segue una gerarchia logica che riflette l'organizzazione del contenuto. Questa organizzazione non solo migliora la comprensione del documento da parte di utenti e tecnologie assistive, ma facilita anche la manutenzione e l'aggiornamento del codice.

La nidificazione corretta degli elementi è fondamentale per creare una struttura gerarchica coerente. Gli elementi dovrebbero essere annidati in modo da riflettere le relazioni logiche tra i contenuti:

```html
<article>
  <header>
    <h2>Titolo dell'articolo</h2>
    <p>Metadata dell'articolo...</p>
  </header>
  
  <section>
    <h3>Prima sezione</h3>
    <p>Contenuto della prima sezione...</p>
    
    <section>
      <h4>Sottosezione</h4>
      <p>Contenuto della sottosezione...</p>
    </section>
  </section>
  
  <section>
    <h3>Seconda sezione</h3>
    <p>Contenuto della seconda sezione...</p>
  </section>
  
  <footer>
    <p>Informazioni di chiusura dell'articolo...</p>
  </footer>
</article>
```

L'utilizzo appropriato dei livelli di intestazione (h1-h6) è cruciale per definire la struttura gerarchica del documento. Le intestazioni dovrebbero seguire un ordine logico, senza saltare livelli:

```html
<h1>Titolo principale della pagina</h1>

<section>
  <h2>Sezione principale</h2>
  <p>Contenuto della sezione...</p>
  
  <section>
    <h3>Sottosezione</h3>
    <p>Contenuto della sottosezione...</p>
  </section>
</section>
```

Le relazioni tra elementi padre-figlio dovrebbero riflettere la struttura logica del contenuto. Ad esempio, un `<article>` può contenere sezioni, ma una sezione non dovrebbe contenere elementi che logicamente appartengono a un livello superiore:

```html
<!-- Corretto: struttura logica -->
<main>
  <article>
    <h2>Titolo dell'articolo</h2>
    <section>
      <h3>Sezione dell'articolo</h3>
    </section>
  </article>
</main>

<!-- Scorretto: struttura illogica -->
<main>
  <section>
    <article>
      <h2>Titolo dell'articolo</h2>
    </article>
    <h3>Sezione non correlata all'articolo</h3>
  </section>
</main>
```

## Microdata e microformati

I microdata e i microformati sono tecnologie che permettono di aggiungere informazioni semantiche strutturate al markup HTML, rendendolo più comprensibile per i motori di ricerca e altre applicazioni. Schema.org è un vocabolario condiviso utilizzato per implementare microdata, supportato dai principali motori di ricerca come Google, Bing e Yahoo.

L'implementazione di microdata con Schema.org richiede l'aggiunta di attributi specifici agli elementi HTML:

```html
<article itemscope itemtype="http://schema.org/BlogPosting">
  <header>
    <h2 itemprop="headline">Titolo del post</h2>
    <p>
      Pubblicato il <time itemprop="datePublished" datetime="2023-06-15">15 Giugno 2023</time>
      da <span itemprop="author" itemscope itemtype="http://schema.org/Person">
        <span itemprop="name">Mario Rossi</span>
      </span>
    </p>
  </header>
  
  <div itemprop="articleBody">
    <p>Contenuto dell'articolo...</p>
  </div>
</article>
```

I Rich Snippets sono risultati di ricerca arricchiti che mostrano informazioni aggiuntive direttamente nella pagina dei risultati. Implementando correttamente i microdata, è possibile ottenere Rich Snippets per vari tipi di contenuto:

```html
<!-- Esempio per una recensione di prodotto -->
<div itemscope itemtype="http://schema.org/Product">
  <h1 itemprop="name">Smartphone XYZ</h1>
  <img itemprop="image" src="smartphone.jpg" alt="Smartphone XYZ">
  
  <div itemprop="aggregateRating" itemscope itemtype="http://schema.org/AggregateRating">
    Valutazione: <span itemprop="ratingValue">4.5</span>/5 basata su
    <span itemprop="reviewCount">125</span> recensioni
  </div>
  
  <div itemprop="offers" itemscope itemtype="http://schema.org/Offer">
    Prezzo: <span itemprop="price">499.99</span>
    <meta itemprop="priceCurrency" content="EUR">€
    <link itemprop="availability" href="http://schema.org/InStock">Disponibile
  </div>
</div>
```

I microformati sono un'alternativa più semplice ai microdata, utilizzando classi HTML con nomi predefiniti. hCard è un microformato comune per le informazioni di contatto:

```html
<div class="vcard">
  <h3 class="fn">Mario Rossi</h3>
  <p class="org">Azienda XYZ</p>
  <p class="adr">
    <span class="street-address">Via Roma 123</span>,
    <span class="locality">Milano</span>,
    <span class="postal-code">20100</span>
  </p>
  <p class="tel">+39 02 1234567</p>
  <p>Email: <a class="email" href="mailto:mario@esempio.it">mario@esempio.it</a></p>
</div>
```

Per validare i microdata implementati, è possibile utilizzare strumenti come il Rich Results Test di Google o lo Structured Data Testing Tool, che verificano la corretta implementazione e mostrano eventuali errori o avvertimenti.

## Ottimizzazione per i motori di ricerca (SEO)

Il markup semantico ha un impatto significativo sull'ottimizzazione per i motori di ricerca (SEO). I motori di ricerca utilizzano la struttura semantica per comprendere meglio il contenuto e la sua rilevanza, influenzando positivamente il posizionamento nelle pagine dei risultati.

L'utilizzo strategico di titoli, meta tag e attributi è fondamentale per la SEO. I titoli dovrebbero essere descrittivi e contenere parole chiave rilevanti, mentre i meta tag forniscono informazioni aggiuntive ai motori di ricerca:

```html
<head>
  <title>Guida completa al markup semantico HTML5 - Nome Sito</title>
  <meta name="description" content="Scopri come utilizzare correttamente gli elementi semantici di HTML5 per migliorare accessibilità, SEO e manutenibilità del tuo sito web.">
  <meta name="keywords" content="HTML5, semantica, accessibilità, SEO, web development">
  <link rel="canonical" href="https://www.esempio.it/guida-markup-semantico">
</head>
```

La struttura delle URL e la navigazione influenzano la comprensione del sito da parte dei motori di ricerca. URL descrittive e una navigazione chiara e gerarchica migliorano l'indicizzazione e la comprensione della struttura del sito:

```html
<!-- Navigazione gerarchica chiara -->
<nav aria-label="Breadcrumb">
  <ol>
    <li><a href="/">Home</a></li>
    <li><a href="/guide/">Guide</a></li>
    <li aria-current="page">Markup semantico HTML5</li>
  </ol>
</nav>
```

La gestione dei contenuti duplicati è importante per evitare penalizzazioni da parte dei motori di ricerca. L'elemento `<link rel="canonical">` aiuta a indicare la versione preferita di una pagina quando esistono URL duplicati o simili:

```html
<head>
  <link rel="canonical" href="https://www.esempio.it/prodotto/smartphone-xyz">
</head>
```

## Test e validazione

La validazione del markup semantico è un passo fondamentale per garantire la qualità e la conformità agli standard. Il W3C Markup Validation Service è lo strumento ufficiale per verificare che il codice HTML sia conforme alle specifiche:

```bash
https://validator.w3.org/
```

I test di accessibilità verificano che il sito sia utilizzabile da persone con disabilità. Strumenti come WAVE, Axe o Lighthouse possono identificare problemi di accessibilità nel markup:

```bash
https://wave.webaim.org/
https://www.deque.com/axe/
```

La verifica della compatibilità cross-browser è essenziale per garantire

---

### Navigazione
- [📑 Indice](<../README.md>)
- [⬅️ Nuovi tag semantici](<01_Nuovi_tag_semantici.md>)
- [➡️ Introduzione all'accessibilità web](<03_Introduzione_accessibilita_web.md>)