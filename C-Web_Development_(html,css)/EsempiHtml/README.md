# Esempi HTML - Raccolta di esempi per l'apprendimento del Web Development

Questa cartella contiene una collezione di esempi HTML che dimostrano varie tecniche e funzionalità per lo sviluppo web. Gli esempi sono organizzati per argomenti e alcuni utilizzano tecniche ormai obsolete, segnalate di seguito con alternative moderne.

## 📚 Indice degli Esempi

### 🎨 Styling e Formattazione del Testo

- **[carattere.html](carattere.html)** - ⚠️ **DEPRECATO** - Uso del tag `<font>` per stili
  - *Alternativa moderna*: Utilizzare CSS con proprietà `font-family`, `color`, `font-size`
  
- **[stile.html](stile.html)** - ⚠️ **PARZIALMENTE DEPRECATO** - Tag di formattazione base
  - Esempi di `<b>`, `<i>`, `<u>`, `<s>`, `<tt>`, `<sub>`, `<sup>`
  - *Alternativa moderna*: Utilizzare CSS con `font-weight`, `font-style`, `text-decoration`, `vertical-align`

- **[colori.html](colori.html)** - Esempi di utilizzo dei colori in HTML
- **[allineamenti.html](allineamenti.html)** - ⚠️ **DEPRECATO** - Attributi di allineamento
  - *Alternativa moderna*: CSS con `text-align`, `float`, `flexbox`, `grid`

### 🎯 Struttura e Layout

- **[intestazioni.html](intestazioni.html)** - Uso dei tag di intestazione `<h1>` - `<h6>`
- **[tabella.html](tabella.html)** - ⚠️ **PARZIALMENTE DEPRECATO** - Tabelle con attributi di presentazione
  - Mostra `border`, `cellpadding`, `cellspacing`, `bgcolor`
  - *Alternativa moderna*: CSS per lo styling delle tabelle

### 🖼️ Multimedia e Immagini

- **[immagini.html](immagini.html)** - ⚠️ **PARZIALMENTE DEPRECATO** - Tag `<img>` con attributi di presentazione
  - Uso di `align`, `border`
  - *Alternativa moderna*: CSS per posizionamento e bordi

- **[mappe.html](mappe.html)** - Mappe sensibili (image maps)
  - Esempio di `<map>`, `<area>` con coordinate
  - *Nota*: Ancora valido ma poco utilizzato, preferire soluzioni responsive

### 🎵 Audio e Video

- **[file_audio.html](file_audio.html)** - ⚠️ **DEPRECATO** - Tag `<embed>` per audio
  - *Alternativa moderna*: HTML5 `<audio>` con controlli nativi
  
- **[file_video.html](file_video.html)** - ⚠️ **DEPRECATO** - Tag `<embed>` e `<object>` per video
  - *Alternativa moderna*: HTML5 `<video>` con controlli nativi

- **[media.html](media.html)** - ⚠️ **PARZIALMENTE DEPRECATO** - JavaScript con `eval()` e `prompt()`
  - Calcolo della media di tre numeri
  - *Problemi*: Uso di `eval()` (vulnerabilità), `prompt()` (poor UX)
  - *Alternativa moderna*: Form HTML5 con validazione, input type="number"

### 📝 Form e Validazione

- **[html5.html](html5.html)** - **MODERNO** - Form HTML5 con nuovi input types
- **[html5Sol.html](html5Sol.html)** - Soluzione dell'esercizio HTML5
- **[html5_solux.html](html5_solux.html)** - Versione estesa della soluzione HTML5

- **[convalida.html](convalida.html)** - ⚠️ **PARZIALMENTE DEPRECATO** - Validazione JavaScript lato client
- **[convalidaSol.html](convalidaSol.html)** - Soluzione esercizio validazione
- **[convalida_solux.html](convalida_solux.html)** - Versione estesa validazione JavaScript
  - *Nota*: La validazione solo lato client non è sicura
  - *Alternativa moderna*: HTML5 validation + validazione server-side

- **[valida.html](valida.html)** - Altro esempio di validazione form

### 📋 Liste

- **[el_puntati.html](el_puntati.html)** - Liste non ordinate (`<ul>`, `<li>`)
- **[el_numerati.html](el_numerati.html)** - Liste ordinate (`<ol>`, `<li>`)
- **[el_misti.html](el_misti.html)** - Liste miste e annidate

### 🔗 Collegamenti e Navigazione

- **[link.html](link.html)** - Esempi di collegamenti ipertestuali
- **[esterno.html](esterno.html)** - Collegamenti a risorse esterne

### 🌍 Esempi Tematici

- **[regioni.html](regioni.html)** - Esempio pratico sulle regioni italiane
- **[regioniSol.html](regioniSol.html)** - Soluzione esercizio regioni
- **[regioni_solux.html](regioni_solux.html)** - Versione estesa regioni

### 🎨 CSS e Styling

- **[mio_stile.css](mio_stile.css)** - File CSS esterno per gli esempi
- **[attributi_body.html](attributi_body.html)** - ⚠️ **DEPRECATO** - Attributi di styling nel tag `<body>`
  - Uso di `leftmargin`, `topmargin`, `text`, `link`, `background`
  - *Alternativa moderna*: CSS per margin, padding, colori e sfondi

## 📁 File Multimediali Inclusi

### Immagini
- `immagine1.jpg`, `immagine2.jpg`, `immagine3.jpg` - Paesaggi italiani
- `italy.jpg`, `mantegna.jpg`, `federico.jpg` - Immagini tematiche
- `gruppo1.jpg` - `gruppo5_4.jpg` - Serie di immagini per esercizi
- `blu.jpg`, `erba.jpg`, `sfondo.jpg`, `tb.jpg`, `vett.jpg` - Sfondi e texture
- `mappa.gif`, `mappa.jpg` - Immagini per mappe sensibili
- `pulsante.jpg` - Elemento UI

### Audio
- `inizio.wav`, `fine.wav` - File audio WAV
- `inizio.mp3` - File audio MP3

### Video
- `bill.mpg` - File video MPEG
- `trailer.webm` - File video WebM

## ⚠️ Note sulle Tecnologie Deprecate

### Tag HTML Obsoleti
- `<font>` → Usare CSS `font-family`, `color`, `font-size`
- `<center>` → Usare CSS `text-align: center`
- Attributi di presentazione su `<table>` → Usare CSS per styling

### Tecniche Sconsigliate
- **`eval()`** in JavaScript → Rischio sicurezza, usare `parseInt()`, `parseFloat()`
- **`prompt()`** per input → Poor UX, usare form HTML
- **`<embed>` per media** → Usare `<audio>` e `<video>` HTML5
- **Validazione solo client-side** → Sempre validare anche server-side

### Alternative Moderne Raccomandate

#### Per lo Styling
```css
/* Invece di <font face="arial" color="red" size="4"> */
.my-text {
    font-family: Arial, sans-serif;
    color: red;
    font-size: 1.2em;
}
```

#### Per Audio/Video
```html
<!-- Invece di <embed src="audio.wav"> -->
<audio controls>
    <source src="audio.mp3" type="audio/mpeg">
    <source src="audio.ogg" type="audio/ogg">
    Il tuo browser non supporta l'elemento audio.
</audio>

<!-- Invece di <embed src="video.mpg"> -->
<video controls width="400">
    <source src="video.mp4" type="video/mp4">
    <source src="video.webm" type="video/webm">
    Il tuo browser non supporta l'elemento video.
</video>
```

#### Per Form e Validazione
```html
<!-- HTML5 con validazione nativa -->
<form>
    <input type="email" required placeholder="Email">
    <input type="number" min="1" max="100" required>
    <input type="date" required>
    <button type="submit">Invia</button>
</form>
```

## 🎯 Obiettivi Didattici

Questi esempi sono pensati per:
1. **Comprendere l'evoluzione del Web** - Da HTML base a HTML5
2. **Identificare pratiche obsolete** - Cosa evitare nello sviluppo moderno
3. **Apprendere alternative moderne** - Best practices attuali
4. **Sviluppare senso critico** - Valutare tecnologie e approcci

## 📖 Come Utilizzare Questi Esempi

1. **Studia il codice obsoleto** per comprendere come si faceva "prima"
2. **Analizza i problemi** di accessibilità, manutenibilità e performance
3. **Implementa le alternative moderne** seguendo gli standard attuali
4. **Testa la compatibilità** cross-browser delle soluzioni moderne

---

*Ultimo aggiornamento: Settembre 2025*
*Per domande o suggerimenti, consulta la documentazione ufficiale [MDN Web Docs](https://developer.mozilla.org/)*