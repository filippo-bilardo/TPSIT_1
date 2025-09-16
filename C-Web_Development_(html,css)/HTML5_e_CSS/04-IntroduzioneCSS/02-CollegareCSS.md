# Collegare CSS a HTML

## Introduzione

Per applicare gli stili CSS a un documento HTML, è necessario collegare i due linguaggi. Esistono tre metodi principali per incorporare il CSS in una pagina HTML: inline, interno ed esterno. Ogni metodo ha i suoi vantaggi e casi d'uso specifici.

## Metodo 1: CSS Inline

Il CSS inline viene applicato direttamente agli elementi HTML utilizzando l'attributo `style`. Questo metodo è utile per applicare stili unici a un singolo elemento.

### Sintassi

```html
<elemento style="proprietà: valore; proprietà: valore;">
```

### Esempio

```html
<h1 style="color: blue; font-size: 24px;">Questo è un titolo blu</h1>
<p style="color: red; margin-left: 20px;">Questo è un paragrafo rosso con margine sinistro</p>
```

### Vantaggi

- Non richiede file esterni o sezioni aggiuntive
- Ha la priorità più alta nella cascata CSS
- Utile per sovrascrivere stili in casi specifici

### Svantaggi

- Mescola contenuto e presentazione, compromettendo il principio di separazione
- Difficile da mantenere in pagine con molti elementi
- Non riutilizzabile tra elementi diversi
- Aumenta la dimensione del documento HTML

## Metodo 2: CSS Interno (o Incorporato)

Il CSS interno viene inserito all'interno del documento HTML utilizzando l'elemento `<style>` nella sezione `<head>`. Questo metodo è utile per applicare stili a una singola pagina.

### Sintassi

```html
<head>
  <style>
    selettore {
      proprietà: valore;
      proprietà: valore;
    }
  </style>
</head>
```

### Esempio

```html
<!DOCTYPE html>
<html>
<head>
  <title>Esempio CSS Interno</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      background-color: #f0f0f0;
    }
    h1 {
      color: navy;
      text-align: center;
    }
    p {
      color: #333333;
      line-height: 1.6;
    }
  </style>
</head>
<body>
  <h1>Titolo della Pagina</h1>
  <p>Questo è un paragrafo con stile applicato tramite CSS interno.</p>
</body>
</html>
```

### Vantaggi

- Non richiede file esterni
- Gli stili sono applicati a tutta la pagina
- Mantiene gli stili e il contenuto nello stesso file

### Svantaggi

- Gli stili non sono riutilizzabili in altre pagine
- Aumenta la dimensione del documento HTML
- Può rallentare il caricamento della pagina se contiene molti stili

## Metodo 3: CSS Esterno (Raccomandato)

Il CSS esterno viene scritto in un file separato con estensione `.css` e collegato al documento HTML utilizzando l'elemento `<link>` nella sezione `<head>`. Questo è il metodo più comune e raccomandato per la maggior parte dei progetti web.

### Sintassi

```html
<head>
  <link rel="stylesheet" href="percorso/al/file.css">
</head>
```

### Esempio

File HTML (index.html):
```html
<!DOCTYPE html>
<html>
<head>
  <title>Esempio CSS Esterno</title>
  <link rel="stylesheet" href="stili.css">
</head>
<body>
  <h1>Titolo della Pagina</h1>
  <p>Questo è un paragrafo con stile applicato tramite CSS esterno.</p>
</body>
</html>
```

File CSS (stili.css):
```css
body {
  font-family: Arial, sans-serif;
  background-color: #f0f0f0;
}

h1 {
  color: navy;
  text-align: center;
}

p {
  color: #333333;
  line-height: 1.6;
}
```

### Vantaggi

- Completa separazione tra contenuto e presentazione
- File CSS riutilizzabile in più pagine HTML
- Riduce la dimensione dei documenti HTML
- Migliora la velocità di caricamento (il browser può memorizzare nella cache il file CSS)
- Facilita la manutenzione (modifiche in un unico file)

### Svantaggi

- Richiede una richiesta HTTP aggiuntiva per caricare il file CSS
- Può causare un breve ritardo nella visualizzazione degli stili (FOUC - Flash of Unstyled Content)

## Importare CSS da altri File CSS

È possibile importare un file CSS all'interno di un altro file CSS utilizzando la regola `@import`. Questo è utile per organizzare il codice CSS in moduli.

### Sintassi

```css
@import url('percorso/al/file.css');
```

### Esempio

```css
/* File principale.css */
@import url('reset.css');
@import url('typography.css');
@import url('layout.css');

/* Stili aggiuntivi specifici */
body {
  background-color: #f5f5f5;
}
```

### Considerazioni sull'Uso di @import

- Può rallentare il caricamento della pagina, poiché i file vengono caricati in sequenza
- È generalmente preferibile utilizzare più elementi `<link>` nel documento HTML

## Priorità e Cascata

Quando si utilizzano più metodi per applicare CSS, è importante comprendere l'ordine di priorità:

1. **CSS Inline** (priorità più alta)
2. **CSS Interno ed Esterno** (la priorità dipende dall'ordine di apparizione)
3. **Stili predefiniti del browser** (priorità più bassa)

All'interno dello stesso livello di priorità, gli stili definiti più tardi sovrascrivono quelli definiti prima.

## Media Queries nei Collegamenti CSS

È possibile specificare quando applicare un foglio di stile utilizzando l'attributo `media` nell'elemento `<link>`.

### Esempio

```html
<link rel="stylesheet" href="stili-base.css">
<link rel="stylesheet" href="stili-mobile.css" media="screen and (max-width: 768px)">
<link rel="stylesheet" href="stili-stampa.css" media="print">
```

Questo permette di caricare fogli di stile diversi in base al dispositivo o al contesto di visualizzazione.

## Best Practices

1. **Utilizzare principalmente CSS esterno** per la maggior parte degli stili
2. **Utilizzare CSS interno** per stili specifici di una singola pagina
3. **Utilizzare CSS inline** solo per sovrascrivere stili in casi eccezionali o per elementi dinamici
4. **Organizzare i file CSS** in modo logico (reset, layout, componenti, ecc.)
5. **Minimizzare i file CSS** in produzione per migliorare le prestazioni
6. **Utilizzare commenti** per documentare sezioni importanti del codice CSS

## Conclusione

La scelta del metodo per collegare CSS a HTML dipende dalle esigenze specifiche del progetto. Per la maggior parte delle applicazioni web, il CSS esterno è la soluzione migliore in quanto offre una chiara separazione tra contenuto e presentazione, riutilizzabilità e facilità di manutenzione.

Nei prossimi capitoli, esploreremo in dettaglio i selettori CSS e come utilizzarli per applicare stili a elementi specifici.

## Navigazione del Corso
- [📑 Indice](../README.md)
- [⬅️ Cos'è il CSS](./01-CosèCSS.md)
- [➡️ Selettori CSS](./03-SelettoriCSS.md)