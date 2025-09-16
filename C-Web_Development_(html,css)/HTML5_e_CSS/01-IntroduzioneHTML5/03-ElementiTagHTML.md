# Elementi e Tag HTML

Gli elementi HTML sono i componenti fondamentali di ogni pagina web. Essi definiscono la struttura e il contenuto della pagina, indicando al browser come visualizzare le informazioni.

## Cos'è un Elemento HTML

Un elemento HTML è composto da:

1. **Tag di apertura**: Indica l'inizio dell'elemento (es. `<p>`).
2. **Contenuto**: Il testo o altri elementi nidificati all'interno dell'elemento.
3. **Tag di chiusura**: Indica la fine dell'elemento (es. `</p>`).

Esempio di elemento completo:
```html
<p>Questo è un paragrafo di testo.</p>
```

Alcuni elementi, chiamati "elementi vuoti", non hanno contenuto e quindi non richiedono un tag di chiusura. In HTML5, questi elementi possono essere scritti con un singolo tag:

```html
<img src="immagine.jpg" alt="Descrizione immagine">
<br>
<hr>
```

## Elementi di Base HTML5

Ecco alcuni degli elementi HTML più comuni e il loro utilizzo:

### Elementi di Struttura

- **`<html>`**: L'elemento radice che contiene tutti gli altri elementi.
- **`<head>`**: Contiene metadati e informazioni sulla pagina.
- **`<body>`**: Contiene tutto il contenuto visibile della pagina.

### Elementi di Testo

- **`<h1>` a `<h6>`**: Titoli di diversi livelli (h1 è il più importante, h6 il meno importante).
- **`<p>`**: Paragrafo di testo.
- **`<span>`**: Contenitore inline per testo o elementi.
- **`<br>`**: Interruzione di riga.
- **`<hr>`**: Linea orizzontale (separatore).

### Elementi di Formattazione

- **`<strong>`**: Testo importante (generalmente visualizzato in grassetto).
- **`<em>`**: Testo enfatizzato (generalmente visualizzato in corsivo).
- **`<mark>`**: Testo evidenziato.
- **`<sub>`**: Testo in pedice.
- **`<sup>`**: Testo in apice.
- **`<code>`**: Codice di programmazione.
- **`<pre>`**: Testo preformattato (mantiene spazi e interruzioni di riga).

### Elementi di Lista

- **`<ul>`**: Lista non ordinata.
- **`<ol>`**: Lista ordinata.
- **`<li>`**: Elemento di lista.
- **`<dl>`**: Lista di definizioni.
- **`<dt>`**: Termine in una lista di definizioni.
- **`<dd>`**: Descrizione in una lista di definizioni.

### Elementi di Link e Media

- **`<a>`**: Link ipertestuale.
- **`<img>`**: Immagine.
- **`<audio>`**: Contenuto audio.
- **`<video>`**: Contenuto video.
- **`<source>`**: Risorsa media per elementi audio/video.

### Elementi Semantici HTML5

HTML5 ha introdotto nuovi elementi semantici che aiutano a descrivere meglio la struttura e il significato del contenuto:

- **`<header>`**: Intestazione della pagina o di una sezione.
- **`<nav>`**: Sezione di navigazione.
- **`<main>`**: Contenuto principale della pagina.
- **`<section>`**: Sezione generica di contenuto.
- **`<article>`**: Contenuto autonomo e indipendente.
- **`<aside>`**: Contenuto correlato ma separato dal contenuto principale.
- **`<footer>`**: Piè di pagina della pagina o di una sezione.
- **`<figure>`**: Contenuto autonomo come illustrazioni, diagrammi, foto, ecc.
- **`<figcaption>`**: Didascalia per un elemento `<figure>`.

## Nidificazione degli Elementi

Gli elementi HTML possono essere nidificati l'uno dentro l'altro, creando una struttura gerarchica:

```html
<article>
  <header>
    <h2>Titolo dell'Articolo</h2>
    <p>Pubblicato il <time datetime="2023-09-15">15 Settembre 2023</time></p>
  </header>
  <p>Questo è il primo paragrafo dell'articolo.</p>
  <p>Questo è il secondo paragrafo dell'articolo.</p>
  <footer>
    <p>Autore: Nome Cognome</p>
  </footer>
</article>
```

È importante rispettare le regole di nidificazione: gli elementi devono essere chiusi nell'ordine inverso rispetto a quello in cui sono stati aperti.

## Elementi Block vs Inline

Gli elementi HTML possono essere classificati in due categorie principali:

### Elementi Block

- Iniziano sempre su una nuova riga
- Occupano l'intera larghezza disponibile
- Possono contenere altri elementi block e inline
- Esempi: `<div>`, `<p>`, `<h1>`, `<section>`, `<article>`

### Elementi Inline

- Non iniziano su una nuova riga
- Occupano solo lo spazio necessario al loro contenuto
- Generalmente possono contenere solo dati e altri elementi inline
- Esempi: `<span>`, `<a>`, `<strong>`, `<em>`, `<img>`

## Best Practices

1. **Usa elementi semantici** quando possibile per migliorare l'accessibilità e il SEO.
2. **Mantieni la struttura pulita e logica**, con una corretta nidificazione degli elementi.
3. **Non usare elementi di presentazione obsoleti** come `<font>` o `<center>` (usa CSS invece).
4. **Assicurati che tutti gli elementi siano correttamente chiusi**.
5. **Usa gli elementi appropriati per il loro scopo previsto** (ad esempio, usa `<button>` per i pulsanti, non `<div>` con stili CSS).

## Navigazione del Corso
- [📑 Indice](../README.md)
- [⬅️ Struttura Base di un Documento HTML](./02-StrutturaBaseHTML.md)
- [➡️ Attributi HTML](./04-AttributiHTML.md)