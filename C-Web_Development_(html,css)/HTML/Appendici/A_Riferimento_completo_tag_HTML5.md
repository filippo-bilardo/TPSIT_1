# A. Riferimento completo ai tag HTML5

Questo documento fornisce un riferimento completo ai tag HTML5, organizzati per categoria funzionale. Per ogni elemento vengono fornite informazioni sul suo scopo, utilizzo e, dove appropriato, esempi di codice.

## Struttura del documento

Questi elementi definiscono la struttura fondamentale di un documento HTML5:

- `<!DOCTYPE>` - Dichiarazione del tipo di documento che indica al browser che il documento è in HTML5
  ```html
  <!DOCTYPE html>
  ```

- `<html>` - Elemento radice che contiene tutti gli altri elementi HTML
  ```html
  <html lang="it">
    <!-- Contenuto del documento -->
  </html>
  ```

- `<head>` - Contenitore per metadati, collegamenti a risorse esterne e altre informazioni non visibili
  ```html
  <head>
    <title>Titolo della pagina</title>
    <meta charset="UTF-8">
  </head>
  ```

- `<title>` - Definisce il titolo del documento, visualizzato nella barra del titolo del browser
  ```html
  <title>Il mio sito web</title>
  ```

- `<body>` - Contiene tutto il contenuto visibile della pagina web
  ```html
  <body>
    <h1>Benvenuti nel mio sito</h1>
    <p>Questo è un paragrafo di testo.</p>
  </body>
  ```

## Metadati

Questi elementi forniscono informazioni aggiuntive sul documento:

- `<meta>` - Definisce metadati come la descrizione, parole chiave, autore, viewport
  ```html
  <meta name="description" content="Descrizione del sito web">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  ```

- `<link>` - Definisce relazioni tra il documento e risorse esterne, principalmente fogli di stile CSS
  ```html
  <link rel="stylesheet" href="styles.css">
  <link rel="icon" href="favicon.ico" type="image/x-icon">
  ```

- `<style>` - Contiene regole di stile CSS inline
  ```html
  <style>
    body { font-family: Arial, sans-serif; }
    h1 { color: blue; }
  </style>
  ```

- `<base>` - Specifica l'URL base per tutti i collegamenti relativi nella pagina
  ```html
  <base href="https://www.esempio.it/">
  ```

## Elementi di testo

Questi elementi definiscono la struttura e la formattazione del testo:

- `<h1>` a `<h6>` - Intestazioni di diversi livelli, dove `<h1>` è il più importante
  ```html
  <h1>Titolo principale</h1>
  <h2>Sottotitolo</h2>
  <h3>Sezione</h3>
  ```

- `<p>` - Definisce un paragrafo di testo
  ```html
  <p>Questo è un paragrafo di testo che può contenere diverse frasi.</p>
  ```

- `<br>` - Inserisce un'interruzione di riga
  ```html
  <p>Prima riga<br>Seconda riga</p>
  ```

- `<hr>` - Crea una linea orizzontale, utile per separare sezioni di contenuto
  ```html
  <p>Prima sezione</p>
  <hr>
  <p>Seconda sezione</p>
  ```

- `<pre>` - Testo preformattato che mantiene spazi e interruzioni di riga
  ```html
  <pre>
    function esempio() {
      console.log("Hello, world!");
    }
  </pre>
  ```

- `<blockquote>` - Citazione in blocco, tipicamente rientrata
  ```html
  <blockquote cite="https://fonte.it">
    <p>Questa è una citazione estesa da una fonte esterna.</p>
  </blockquote>
  ```

- `<q>` - Citazione inline, tipicamente racchiusa tra virgolette
  ```html
  <p>Come disse Einstein, <q cite="https://fonte.it">la relatività è relativa</q>.</p>
  ```

- `<abbr>` - Abbreviazione o acronimo con un titolo che fornisce la forma completa
  ```html
  <p>L'<abbr title="HyperText Markup Language">HTML</abbr> è un linguaggio di markup.</p>
  ```

- `<address>` - Informazioni di contatto per l'autore/proprietario di un documento
  ```html
  <address>
    Scritto da <a href="mailto:info@esempio.it">Mario Rossi</a>.<br>
    Via Roma 123, Milano<br>
    Italia
  </address>
  ```

- `<cite>` - Titolo di un'opera (libro, film, canzone, ecc.)
  ```html
  <p><cite>Il nome della rosa</cite> è un romanzo di Umberto Eco.</p>
  ```

- `<bdo>` - Sovrascrive la direzione del testo
  ```html
  <bdo dir="rtl">Questo testo sarà visualizzato da destra a sinistra</bdo>
  ```

## Formattazione del testo

Questi elementi applicano formattazione semantica al testo:

- `<strong>` - Testo di forte importanza, tipicamente in grassetto
  ```html
  <p><strong>Attenzione:</strong> Questo è importante.</p>
  ```

- `<em>` - Testo enfatizzato, tipicamente in corsivo
  ```html
  <p>Questo è <em>davvero</em> interessante.</p>
  ```

- `<mark>` - Testo evidenziato per riferimento
  ```html
  <p>Cerca la parola <mark>evidenziata</mark> nel testo.</p>
  ```

- `<small>` - Testo più piccolo per note a piè di pagina o disclaimer
  ```html
  <p>Questo è il contenuto principale.<small>Nota: si applicano termini e condizioni.</small></p>
  ```

- `<del>` - Testo eliminato, tipicamente barrato
  ```html
  <p>Prezzo: <del>€50</del> €40</p>
  ```

- `<ins>` - Testo inserito, tipicamente sottolineato
  ```html
  <p>Il meeting è alle <del>14:00</del> <ins>15:00</ins>.</p>
  ```

- `<sub>` - Testo in pedice
  ```html
  <p>H<sub>2</sub>O è la formula chimica dell'acqua.</p>
  ```

- `<sup>` - Testo in apice
  ```html
  <p>2<sup>3</sup> = 8</p>
  ```

- `<code>` - Frammento di codice informatico
  ```html
  <p>La funzione <code>getElementById()</code> seleziona un elemento per ID.</p>
  ```

- `<kbd>` - Input da tastiera
  ```html
  <p>Premere <kbd>Ctrl</kbd> + <kbd>C</kbd> per copiare.</p>
  ```

- `<samp>` - Output di esempio di un programma
  ```html
  <p>Il programma ha restituito: <samp>Hello, world!</samp></p>
  ```

- `<var>` - Variabile in un'espressione matematica o di programmazione
  ```html
  <p>L'equazione è: <var>x</var> = <var>y</var> + 2</p>
  ```

## Liste

Questi elementi creano liste di vari tipi:

- `<ul>` - Lista non ordinata (con punti elenco)
  ```html
  <ul>
    <li>Primo elemento</li>
    <li>Secondo elemento</li>
  </ul>
  ```

- `<ol>` - Lista ordinata (con numeri o lettere)
  ```html
  <ol>
    <li>Primo passo</li>
    <li>Secondo passo</li>
  </ol>
  ```

- `<li>` - Elemento di lista, usato all'interno di `<ul>` o `<ol>`
  ```html
  <li>Questo è un elemento di lista</li>
  ```

- `<dl>` - Lista di definizioni
  ```html
  <dl>
    <dt>HTML</dt>
    <dd>HyperText Markup Language, il linguaggio standard per le pagine web</dd>
    <dt>CSS</dt>
    <dd>Cascading Style Sheets, usato per stilizzare le pagine HTML</dd>
  </dl>
  ```

- `<dt>` - Termine in una lista di definizioni
  ```html
  <dt>JavaScript</dt>
  ```

- `<dd>` - Descrizione in una lista di definizioni
  ```html
  <dd>Un linguaggio di programmazione per il web</dd>
  ```

## Collegamenti e immagini

Questi elementi creano collegamenti ipertestuali e inseriscono media:

- `<a>` - Collegamento ipertestuale a un'altra pagina o risorsa
  ```html
  <a href="https://www.esempio.it">Visita il nostro sito</a>
  <a href="mailto:info@esempio.it">Contattaci</a>
  <a href="#sezione">Vai alla sezione</a>
  ```

- `<img>` - Inserisce un'immagine
  ```html
  <img src="immagine.jpg" alt="Descrizione dell'immagine" width="300" height="200">
  ```

- `<map>` - Definisce una mappa di immagine con aree cliccabili
  ```html
  <img src="mappa.jpg" alt="Mappa" usemap="#workmap">
  <map name="workmap">
    <area shape="rect" coords="34,44,270,350" alt="Computer" href="computer.htm">
    <area shape="circle" coords="337,300,44" alt="Tazza" href="tazza.htm">
  </map>
  ```

- `<area>` - Definisce un'area cliccabile all'interno di una mappa di immagine
  ```html
  <area shape="rect" coords="34,44,270,350" alt="Computer" href="computer.htm">
  ```

- `<figure>` - Contenitore per contenuto autonomo, spesso con didascalia
  ```html
  <figure>
    <img src="grafico.jpg" alt="Grafico delle vendite">
    <figcaption>Fig.1 - Andamento delle vendite nel 2023</figcaption>
  </figure>
  ```

- `<figcaption>` - Didascalia per un elemento `<figure>`
  ```html
  <figcaption>Fig.1 - Andamento delle vendite nel 2023</figcaption>
  ```

## Tabelle

Questi elementi creano e strutturano tabelle:

- `<table>` - Definisce una tabella
  ```html
  <table>
    <tr>
      <th>Nome</th>
      <th>Età</th>
    </tr>
    <tr>
      <td>Mario</td>
      <td>30</td>
    </tr>
  </table>
  ```

- `<caption>` - Titolo della tabella
  ```html
  <caption>Elenco dipendenti</caption>
  ```

- `<thead>` - Gruppo di righe di intestazione
  ```html
  <thead>
    <tr>
      <th>Nome</th>
      <th>Cognome</th>
    </tr>
  </thead>
  ```

- `<tbody>` - Gruppo di righe di contenuto
  ```html
  <tbody>
    <tr>
      <td>Mario</td>
      <td>Rossi</td>
    </tr>
  </tbody>
  ```

- `<tfoot>` - Gruppo di righe di piè di pagina
  ```html
  <tfoot>
    <tr>
      <td colspan="2">Totale dipendenti: 10</td>
    </tr>
  </tfoot>
  ```

- `<tr>` - Riga della tabella
  ```html
  <tr>
    <td>Dato 1</td>
    <td>Dato 2</td>
  </tr>
  ```

- `<th>` - Cella di intestazione
  ```html
  <th scope="col">Nome</th>
  ```

- `<td>` - Cella di dati
  ```html
  <td>Mario</td>
  ```

- `<colgroup>` - Gruppo di colonne per applicare stili
  ```html
  <colgroup>
    <col style="background-color: #f2f2f2">
    <col span="2" style="background-color: #e6f7ff">
  </colgroup>
  ```

- `<col>` - Specifica proprietà per una colonna
  ```html
  <col style="width: 150px">
  ```

## Elementi semantici

Questi elementi forniscono significato strutturale al contenuto:

- `<article>` - Contenuto indipendente e autonomo
  ```html
  <article>
    <h2>Titolo dell'articolo</h2>
    <p>Contenuto dell'articolo...</p>
  </article>
  ```

- `<section>` - Sezione tematica di un documento
  ```html
  <section>
    <h2>Caratteristiche del prodotto</h2>
    <p>Descrizione delle caratteristiche...</p>
  </section>
  ```

- `<nav>` - Sezione di navig
---

### Navigazione
- [📑 Indice](<../README.md>)
- [⬅️ Guida Precedente](<../Accessibilità/03_Introduzione_accessibilita_web.md>)
- [➡️ B. Strumenti utili per lo sviluppo HTML5](<B_Strumenti_utili_sviluppo_HTML5.md>)
