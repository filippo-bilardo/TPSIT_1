# I Tag `<head>` e `<body>`

In una pagina HTML, i tag `<head>` e `<body>` definiscono le due sezioni principali del documento. Ogni sezione ha uno scopo specifico.

## Il Tag `<head>`

Il tag `<head>` contiene metadati e informazioni sulla pagina HTML che non vengono visualizzate direttamente nel browser. Queste informazioni sono cruciali per il browser, i motori di ricerca e altri sistemi web.

Elementi comuni all'interno del tag `<head>` includono:

-   **`<title>`**: Definisce il titolo della pagina, visualizzato nella barra del titolo del browser o nella scheda della pagina. È obbligatorio e importante per la SEO.
-   **`<meta>`**: Fornisce metadati sulla pagina, come la codifica dei caratteri (`charset`), la descrizione per i motori di ricerca, le parole chiave, l'autore del documento e le impostazioni della viewport per il design responsivo.
    -   Esempio: `<meta charset="UTF-8">`
    -   Esempio: `<meta name="viewport" content="width=device-width, initial-scale=1.0">`
-   **`<link>`**: Specifica le relazioni tra il documento corrente e risorse esterne. È comunemente usato per collegare fogli di stile CSS.
    -   Esempio: `<link rel="stylesheet" href="style.css">`
-   **`<style>`**: Contiene informazioni di stile (CSS) direttamente all'interno del documento HTML (stile inline o interno).
-   **`<script>`**: Utilizzato per incorporare o fare riferimento a codice JavaScript eseguibile. Può essere posizionato anche alla fine del `<body>` per migliorare le prestazioni di caricamento della pagina.
-   **`<base>`**: Specifica l'URL di base per tutti gli URL relativi presenti nella pagina.

### Esempio di `<head>`

```html
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Titolo della Mia Pagina</title>
    <meta name="description" content="Questa è una descrizione della pagina.">
    <link rel="stylesheet" href="styles/main.css">
    <script src="scripts/main.js" defer></script>
</head>
```

## Il Tag `<body>`

Il tag `<body>` contiene tutto il contenuto visibile della pagina web. Questo include testo, immagini, collegamenti ipertestuali, tabelle, liste, video, form e qualsiasi altro elemento che l'utente vedrà e con cui interagirà nel browser.

Tutto ciò che definisce la struttura e il contenuto effettivo della pagina si trova all'interno del tag `<body>`.

### Esempio di Struttura Completa

```html
<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <title>Esempio Head e Body</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <h1>Questo è un Titolo Principale</h1>
    <p>Questo è un paragrafo di testo visibile nella pagina.</p>
    <img src="immagine.jpg" alt="Descrizione immagine">
    <ul>
        <li>Elemento lista 1</li>
        <li>Elemento lista 2</li>
    </ul>
    <script src="app.js"></script> 
    <!-- A volte gli script sono alla fine del body -->
</body>
</html>
```

In sintesi:
-   `<head>`: Contiene informazioni *sulla* pagina (metadati, link a risorse).
-   `<body>`: Contiene il contenuto *della* pagina (ciò che l'utente vede).

---

### Navigazione
- [📑 Indice](<../README.md>)
- [⬅️ Sintassi dei Tag HTML e degli Attributi](<05_Sintassi_tag_attributi.md>)
- [➡️ Gestione del testo: paragrafi, titoli e liste](<../3. Testo e Formattazione/01_Gestione_testo.md>)