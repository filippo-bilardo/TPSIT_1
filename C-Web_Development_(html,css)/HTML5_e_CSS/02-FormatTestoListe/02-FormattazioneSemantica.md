# Formattazione Semantica del Testo in HTML5

## Introduzione

La formattazione semantica del testo è un concetto fondamentale in HTML5 che consiste nell'utilizzare elementi che non solo modificano l'aspetto del testo, ma ne definiscono anche il significato. Questo approccio migliora l'accessibilità, la SEO e la manutenibilità del codice.

## Differenza tra Formattazione Semantica e Presentazionale

La formattazione semantica utilizza tag che descrivono il significato del contenuto, mentre la formattazione presentazionale si concentra solo sull'aspetto visivo.

- **Formattazione Semantica**: Utilizza tag come `<strong>`, `<em>`, `<mark>`, ecc.
- **Formattazione Presentazionale**: Utilizza tag come `<b>`, `<i>`, o attributi di stile CSS.

In HTML5, si preferisce la formattazione semantica perché:

1. Migliora l'accessibilità per utenti con tecnologie assistive
2. Aiuta i motori di ricerca a comprendere meglio il contenuto
3. Separa il contenuto dalla presentazione

## Elementi di Formattazione Semantica

### Enfasi (`<em>`)

L'elemento `<em>` indica enfasi nel testo. Generalmente viene visualizzato in corsivo, ma il suo scopo principale è indicare che il testo ha un'enfasi particolare.

```html
<p>Devi <em>assolutamente</em> completare questo compito entro domani.</p>
```

### Forte Enfasi (`<strong>`)

L'elemento `<strong>` indica forte importanza, serietà o urgenza. Generalmente viene visualizzato in grassetto.

```html
<p><strong>Attenzione:</strong> Questa operazione non può essere annullata.</p>
```

### Testo Evidenziato (`<mark>`)

L'elemento `<mark>` rappresenta testo evidenziato o marcato per riferimento, come in una ricerca.

```html
<p>Ecco i <mark>risultati della ricerca</mark> che hai effettuato.</p>
```

### Testo Inserito e Cancellato (`<ins>` e `<del>`)

Questi elementi indicano testo che è stato aggiunto o rimosso dal documento.

```html
<p>Il prezzo è <del>€50</del> <ins>€40</ins> per un periodo limitato.</p>
```

### Sottoscritto e Sovrascritto (`<sub>` e `<sup>`)

Utilizzati per formule matematiche, note a piè di pagina, ecc.

```html
<p>La formula dell'acqua è H<sub>2</sub>O.</p>
<p>La superficie della Terra è 510.072.000 km<sup>2</sup>.</p>
```

### Citazioni Brevi (`<q>`)

Per citazioni brevi inline.

```html
<p>Come disse Einstein, <q>La logica ti porta da A a B, l'immaginazione ti porta ovunque.</q></p>
```

### Abbreviazioni (`<abbr>`)

Per abbreviazioni e acronimi, con un titolo che fornisce la forma completa.

```html
<p>Il <abbr title="World Wide Web Consortium">W3C</abbr> definisce gli standard web.</p>
```

### Definizioni (`<dfn>`)

Per indicare un termine che viene definito all'interno del contenuto.

```html
<p><dfn>HTML</dfn> è un linguaggio di markup utilizzato per strutturare il contenuto sul web.</p>
```

### Testo di Codice (`<code>`, `<kbd>`, `<samp>`, `<var>`)

Per rappresentare vari tipi di testo relativo alla programmazione:

```html
<p>La funzione <code>console.log()</code> stampa un messaggio nella console.</p>
<p>Premi <kbd>Ctrl</kbd> + <kbd>C</kbd> per copiare il testo.</p>
<p>Il programma ha restituito: <samp>Hello, World!</samp></p>
<p>Calcola l'area usando la formula: <var>A</var> = π<var>r</var><sup>2</sup></p>
```

### Indirizzo (`<address>`)

Per informazioni di contatto.

```html
<address>
  Scritto da <a href="mailto:mario.rossi@example.com">Mario Rossi</a>.<br>
  Via Roma 123<br>
  Milano, Italia
</address>
```

## Best Practices

1. **Usa gli elementi semantici appropriati**: Scegli l'elemento che meglio descrive il significato del testo, non solo per il suo aspetto visivo.

2. **Evita l'uso eccessivo**: Non abusare degli elementi di enfasi, altrimenti perdono il loro impatto.

3. **Combina con CSS per lo stile**: Usa gli elementi semantici per il significato e CSS per l'aspetto visivo.

4. **Nidifica correttamente**: Puoi nidificare elementi semantici quando necessario, ad esempio `<strong><em>testo molto importante</em></strong>`.

## Conclusione

La formattazione semantica del testo è un aspetto cruciale di HTML5 che va oltre la semplice presentazione visiva. Utilizzando gli elementi semantici appropriati, si crea un web più accessibile, comprensibile e strutturato, beneficiando sia gli utenti che i motori di ricerca.

## Navigazione del Corso
- [📑 Indice](../README.md)
- [⬅️ Elementi di Testo e Titoli](./01-ElementiTestoTitoli.md)
- [➡️ Liste Ordinate e Non Ordinate](./03-ListeOrdinateNonOrdinate.md)