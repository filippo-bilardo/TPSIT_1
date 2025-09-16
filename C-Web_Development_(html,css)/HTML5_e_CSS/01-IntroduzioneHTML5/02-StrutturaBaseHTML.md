# Struttura Base di un Documento HTML

Ogni documento HTML5 segue una struttura standard che definisce come il contenuto deve essere organizzato. Questa struttura fornisce al browser le informazioni necessarie per interpretare e visualizzare correttamente la pagina web.

## La Dichiarazione del Tipo di Documento (DOCTYPE)

Ogni documento HTML5 inizia con una dichiarazione del tipo di documento, che indica al browser quale versione di HTML si sta utilizzando. In HTML5, questa dichiarazione è semplificata rispetto alle versioni precedenti:

```html
<!DOCTYPE html>
```

Questa riga deve essere la prima del documento, prima di qualsiasi altro elemento HTML.

## L'Elemento `<html>`

Dopo la dichiarazione DOCTYPE, il documento è racchiuso nell'elemento `<html>`, che è l'elemento radice di ogni pagina web:

```html
<html lang="it">
  <!-- Contenuto della pagina -->
</html>
```

L'attributo `lang` specifica la lingua del documento, importante per l'accessibilità e il SEO.

## L'Elemento `<head>`

L'elemento `<head>` contiene metadati e informazioni sul documento che non vengono visualizzati direttamente nella pagina:

```html
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Titolo della Pagina</title>
  <link rel="stylesheet" href="stile.css">
  <script src="script.js"></script>
</head>
```

Elementi comuni all'interno del `<head>`:

- **`<meta charset="UTF-8">`**: Specifica la codifica dei caratteri del documento.
- **`<meta name="viewport">`**: Controlla come la pagina viene visualizzata sui dispositivi mobili.
- **`<title>`**: Definisce il titolo della pagina, visualizzato nella scheda del browser.
- **`<link>`**: Collega risorse esterne come fogli di stile CSS.
- **`<script>`**: Include script JavaScript.
- **`<meta name="description">`**: Fornisce una descrizione della pagina per i motori di ricerca.
- **`<meta name="keywords">`**: Specifica parole chiave per i motori di ricerca (meno rilevante oggi).

## L'Elemento `<body>`

L'elemento `<body>` contiene tutto il contenuto visibile della pagina web:

```html
<body>
  <header>
    <h1>Titolo Principale</h1>
    <nav>
      <!-- Menu di navigazione -->
    </nav>
  </header>
  
  <main>
    <section>
      <h2>Sezione 1</h2>
      <p>Contenuto della sezione...</p>
    </section>
    
    <article>
      <h2>Articolo</h2>
      <p>Contenuto dell'articolo...</p>
    </article>
  </main>
  
  <footer>
    <p>&copy; 2023 Il Mio Sito</p>
  </footer>
</body>
```

## Struttura Completa

Ecco un esempio di struttura completa di un documento HTML5:

```html
<!DOCTYPE html>
<html lang="it">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>La Mia Prima Pagina Web</title>
  <link rel="stylesheet" href="stile.css">
</head>
<body>
  <header>
    <h1>Benvenuto nella Mia Prima Pagina Web</h1>
    <nav>
      <ul>
        <li><a href="#">Home</a></li>
        <li><a href="#">Chi Sono</a></li>
        <li><a href="#">Contatti</a></li>
      </ul>
    </nav>
  </header>
  
  <main>
    <section>
      <h2>Chi Sono</h2>
      <p>Questa è una sezione che parla di me...</p>
    </section>
    
    <article>
      <h2>Il Mio Primo Articolo</h2>
      <p>Questo è il contenuto del mio primo articolo...</p>
    </article>
  </main>
  
  <footer>
    <p>&copy; 2023 La Mia Prima Pagina Web</p>
  </footer>
</body>
</html>
```

## Validazione del Documento HTML

È importante assicurarsi che il documento HTML sia valido secondo gli standard W3C. Un documento HTML valido:

- È più probabile che venga visualizzato correttamente su diversi browser
- È più accessibile per gli utenti con disabilità
- È più facile da mantenere e aggiornare
- Ha prestazioni migliori

Puoi validare il tuo documento HTML utilizzando il [Validatore W3C](https://validator.w3.org/).

## Best Practices

1. **Usa sempre la dichiarazione DOCTYPE**
2. **Specifica sempre l'attributo `lang` nell'elemento `<html>`**
3. **Includi sempre i meta tag essenziali nel `<head>`**
4. **Usa elementi semantici per strutturare il contenuto**
5. **Mantieni la struttura pulita e ben indentata**
6. **Valida regolarmente il tuo codice HTML**

## Navigazione del Corso
- [📑 Indice](../README.md)
- [⬅️ Cos'è HTML5](./01-CosèHTML5.md)
- [➡️ Elementi e Tag HTML](./03-ElementiTagHTML.md)