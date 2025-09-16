# Elementi di Citazione e Codice in HTML5

## Introduzione

Gli elementi di citazione e codice in HTML5 permettono di rappresentare correttamente contenuti citati da altre fonti e frammenti di codice all'interno delle pagine web. Questi elementi non solo migliorano l'aspetto visivo del contenuto, ma forniscono anche un significato semantico che aiuta i browser, i motori di ricerca e le tecnologie assistive a interpretare correttamente il contenuto.

## Elementi di Citazione

### Citazioni Brevi (`<q>`)

L'elemento `<q>` è utilizzato per citazioni brevi inline che non richiedono interruzioni di paragrafo. I browser generalmente aggiungono automaticamente le virgolette attorno al contenuto.

```html
<p>Come ha detto Einstein, <q>La logica ti porta da A a B, l'immaginazione ti porta ovunque.</q></p>
```

L'attributo `cite` può essere utilizzato per indicare l'URL della fonte:

```html
<p>Secondo il sito ufficiale, <q cite="https://www.w3.org/">Il W3C è un consorzio internazionale dove i membri, lo staff a tempo pieno e il pubblico lavorano insieme per sviluppare standard Web.</q></p>
```

### Citazioni a Blocco (`<blockquote>`)

L'elemento `<blockquote>` è utilizzato per citazioni più lunghe che occupano un blocco separato. I browser generalmente applicano un rientro al contenuto.

```html
<blockquote>
  <p>Il successo non è definitivo, il fallimento non è fatale: è il coraggio di continuare che conta.</p>
</blockquote>
```

Anche `<blockquote>` supporta l'attributo `cite`:

```html
<blockquote cite="https://example.com/discorso-churchill">
  <p>Non arrenderti mai, mai, mai, mai—in niente, grande o piccolo, grande o insignificante—non arrenderti mai se non alle convinzioni dell'onore e del buon senso.</p>
  <footer>— Winston Churchill</footer>
</blockquote>
```

### Elemento `<cite>`

L'elemento `<cite>` è utilizzato per rappresentare il titolo di un'opera (libro, film, canzone, ecc.) citata in un documento. Generalmente viene visualizzato in corsivo.

```html
<p>Il mio libro preferito è <cite>Il Signore degli Anelli</cite> di J.R.R. Tolkien.</p>
```

## Elementi per il Codice

### Codice Inline (`<code>`)

L'elemento `<code>` è utilizzato per rappresentare frammenti di codice informatico all'interno di un testo. Generalmente viene visualizzato con un font monospazio.

```html
<p>La funzione <code>console.log()</code> è utilizzata per stampare messaggi nella console JavaScript.</p>
```

### Blocchi di Codice

Per blocchi di codice più grandi, è comune combinare `<code>` con `<pre>` (testo preformattato) per preservare spazi e interruzioni di linea:

```html
<pre><code>
function saluta(nome) {
  return "Ciao, " + nome + "!";
}

console.log(saluta("Mondo"));
// Output: Ciao, Mondo!
</code></pre>
```

### Input da Tastiera (`<kbd>`)

L'elemento `<kbd>` rappresenta l'input da tastiera o altri comandi che l'utente dovrebbe digitare.

```html
<p>Per salvare il documento, premi <kbd>Ctrl</kbd> + <kbd>S</kbd>.</p>
```

### Output di Programma (`<samp>`)

L'elemento `<samp>` rappresenta l'output di un programma o sistema informatico.

```html
<p>Quando esegui lo script, vedrai: <samp>Hello, World!</samp></p>
```

### Variabili (`<var>`)

L'elemento `<var>` rappresenta una variabile in un'espressione matematica o di programmazione.

```html
<p>L'equazione è <var>E</var> = <var>m</var><var>c</var><sup>2</sup>.</p>
```

## Combinare Elementi

Gli elementi di citazione e codice possono essere combinati tra loro e con altri elementi HTML per creare strutture più complesse e semanticamente ricche:

```html
<figure>
  <blockquote cite="https://example.com/fonte">
    <p>La semplicità è la massima sofisticazione.</p>
  </blockquote>
  <figcaption>— Leonardo da Vinci, <cite>Taccuini</cite></figcaption>
</figure>
```

```html
<div class="code-example">
  <p>Ecco come calcolare l'area di un cerchio in JavaScript:</p>
  <pre><code>
function areaCircle(radius) {
  return Math.PI * Math.pow(radius, 2);
}

const area = areaCircle(5);
console.log(<samp>L'area è: ${area}</samp>);
  </code></pre>
  <p>Dove <var>radius</var> è il raggio del cerchio.</p>
</div>
```

## Stili CSS per Citazioni e Codice

È possibile personalizzare l'aspetto degli elementi di citazione e codice con CSS:

```css
blockquote {
  border-left: 4px solid #ccc;
  margin-left: 0;
  padding-left: 1em;
  font-style: italic;
}

code {
  background-color: #f4f4f4;
  padding: 2px 4px;
  border-radius: 3px;
  font-family: 'Courier New', monospace;
}

pre code {
  display: block;
  padding: 1em;
  overflow-x: auto;
  line-height: 1.5;
}

kbd {
  background-color: #eee;
  border: 1px solid #b4b4b4;
  border-radius: 3px;
  box-shadow: 0 1px 1px rgba(0, 0, 0, 0.2);
  padding: 2px 4px;
  font-family: sans-serif;
}
```

## Best Practices

1. **Usa gli elementi semantici appropriati**: Scegli l'elemento che meglio rappresenta il significato del contenuto, non solo per il suo aspetto visivo.

2. **Fornisci la fonte delle citazioni**: Quando possibile, utilizza l'attributo `cite` per indicare la fonte originale.

3. **Mantieni la leggibilità del codice**: Usa `<pre>` con `<code>` per preservare la formattazione dei blocchi di codice.

4. **Considera l'accessibilità**: Gli elementi semantici aiutano le tecnologie assistive a interpretare correttamente il contenuto.

5. **Usa CSS per lo stile**: Personalizza l'aspetto degli elementi con CSS invece di utilizzare attributi HTML deprecati.

## Conclusione

Gli elementi di citazione e codice in HTML5 sono strumenti potenti per rappresentare correttamente contenuti specializzati nelle pagine web. Utilizzandoli in modo appropriato, si migliora non solo l'aspetto visivo del contenuto, ma anche la sua struttura semantica, beneficiando l'accessibilità e la SEO del sito web.

## Navigazione del Corso
- [📑 Indice](../README.md)
- [⬅️ Liste di Definizioni](./04-ListeDefinizioni.md)
- [➡️ Link e Immagini](../03-LinkImmagini/README.md)