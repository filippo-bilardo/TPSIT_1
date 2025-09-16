# Come collegare CSS a HTML

## Indice dei contenuti
- [1. CSS Inline](#1-css-inline)
- [2. CSS Interno (Internal CSS)](#2-css-interno-internal-css)
- [3. CSS Esterno (External CSS)](#3-css-esterno-external-css)
- [4. Importazione di fogli di stile](#4-importazione-di-fogli-di-stile)
- [5. Media Queries](#5-media-queries)
- [Best Practice](#best-practice)
- [Domande di autovalutazione](#domande-di-autovalutazione)
- [Esercizi proposti](#esercizi-proposti)
- [Risorse esterne](#risorse-esterne)

Esistono tre metodi principali per applicare stili CSS a un documento HTML. Ogni metodo ha i suoi vantaggi e svantaggi, e la scelta dipende dalle specifiche esigenze del progetto.

## 1. CSS Inline

Gli stili vengono applicati direttamente agli elementi HTML utilizzando l'attributo `style`.

```html
<p style="color: blue; font-size: 16px;">Questo è un paragrafo con stile inline.</p>
```

**Vantaggi**:
- Priorità massima nella cascata (sovrascrive altri stili)
- Utile per override puntuali e modifiche specifiche
- Non richiede file aggiuntivi
- Immediato da implementare

**Svantaggi**:
- Difficile da mantenere in progetti di grandi dimensioni
- Mescola contenuto (HTML) e presentazione (CSS)
- Non riutilizzabile su più elementi
- Aumenta la dimensione del file HTML
- Rende difficile la gestione coerente dello stile

## 2. CSS Interno (Internal CSS)

Gli stili vengono definiti all'interno del documento HTML utilizzando il tag `<style>` nella sezione `<head>`.

```html
<!DOCTYPE html>
<html>
<head>
    <title>Esempio CSS Interno</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 20px;
        }
        
        h1 {
            color: #333;
            text-align: center;
        }
        
        p {
            line-height: 1.6;
            color: #666;
        }
    </style>
</head>
<body>
    <h1>Titolo della pagina</h1>
    <p>Questo è un paragrafo con stile interno.</p>
</body>
</html>
```

**Vantaggi**:
- Non richiede file esterni
- Gli stili sono applicati solo alla pagina corrente
- Utile per pagine con stili unici
- Riduce il numero di richieste HTTP

**Svantaggi**:
- Non separazione tra contenuto e presentazione
- Non riutilizzabile su più pagine
- Aumenta la dimensione del file HTML
- Difficile da mantenere in progetti con molte pagine

## 3. CSS Esterno (External CSS)

Gli stili vengono definiti in un file separato con estensione `.css` e collegati al documento HTML utilizzando il tag `<link>` nella sezione `<head>`.

**File HTML (index.html)**:
```html
<!DOCTYPE html>
<html>
<head>
    <title>Esempio CSS Esterno</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <h1>Titolo della pagina</h1>
    <p>Questo è un paragrafo con stile esterno.</p>
</body>
</html>
```

**File CSS (styles.css)**:
```css
body {
    font-family: Arial, sans-serif;
    margin: 0;
    padding: 20px;
}

h1 {
    color: #333;
    text-align: center;
}

p {
    line-height: 1.6;
    color: #666;
}
```

**Vantaggi**:
- Completa separazione tra contenuto e presentazione
- Riutilizzabile su più pagine
- Facilita la manutenzione e l'aggiornamento
- Riduce la dimensione dei file HTML
- Il browser può memorizzare nella cache il file CSS
- Migliora i tempi di caricamento per siti con più pagine

**Svantaggi**:
- Richiede una richiesta HTTP aggiuntiva
- Può causare FOUC (Flash of Unstyled Content) durante il caricamento

## Metodi alternativi di collegamento

### Importazione CSS (@import)

È possibile importare file CSS esterni all'interno di un altro file CSS o all'interno di un tag `<style>` utilizzando la regola `@import`.

**All'interno di un file CSS**:
```css
@import url('typography.css');
@import url('colors.css');

/* Altri stili */
```

**All'interno di un tag style**:
```html
<style>
    @import url('styles.css');
    /* Altri stili */
</style>
```

**Vantaggi e svantaggi di @import**:
- **Vantaggi**: Permette di organizzare il CSS in moduli
- **Svantaggi**: Può rallentare il caricamento della pagina poiché i file vengono caricati sequenzialmente

### Caricamento dinamico con JavaScript

In alcuni casi, è possibile caricare fogli di stile dinamicamente utilizzando JavaScript.

```javascript
const link = document.createElement('link');
link.rel = 'stylesheet';
link.href = 'styles.css';
document.head.appendChild(link);
```

## Best Practices

1. **Preferire CSS esterno** per la maggior parte dei progetti, specialmente quelli di medie e grandi dimensioni.

2. **Utilizzare CSS interno** per prototipi rapidi o pagine singole con stili unici.

3. **Limitare l'uso di CSS inline** solo per override specifici o quando necessario per ragioni di performance.

4. **Organizzare i file CSS esterni** in modo logico (es. reset.css, layout.css, components.css).

5. **Considerare l'ordine di caricamento** dei fogli di stile, poiché influisce sulla cascata.

6. **Utilizzare media queries** nei link per caricare CSS specifici per dispositivi:
   ```html
   <link rel="stylesheet" href="mobile.css" media="screen and (max-width: 768px)">
   ```

7. **Aggiungere l'attributo `rel="preload"`** per i CSS critici:
   ```html
   <link rel="preload" href="critical.css" as="style">
   <link rel="stylesheet" href="critical.css">
   ```

## Suggerimenti pratici

- **Utilizzare strumenti di sviluppo del browser** per ispezionare e modificare temporaneamente gli stili.

- **Commentare il codice CSS** per facilitare la manutenzione futura.

- **Considerare l'utilizzo di metodologie CSS** come BEM, SMACSS o OOCSS per progetti più grandi.

- **Testare il rendering su diversi browser** per garantire la compatibilità.

## Domande di autovalutazione

1. Quali sono i tre metodi principali per collegare CSS a HTML?

2. Quale metodo di collegamento CSS offre la massima priorità nella cascata?

3. Quali sono i vantaggi principali dell'utilizzo di CSS esterno?

4. In quali situazioni è preferibile utilizzare CSS interno?

5. Cosa significa FOUC e come può essere mitigato?

6. Quali sono gli svantaggi dell'utilizzo della regola `@import`?

7. Come si può ottimizzare il caricamento dei fogli di stile CSS?

## Esercizi proposti

1. **Esercizio base**: Crea una pagina HTML e applica stili utilizzando tutti e tre i metodi di collegamento CSS (inline, interno ed esterno).

2. **Esercizio intermedio**: Crea un sito web di tre pagine con un header, footer e sidebar comuni. Utilizza CSS esterno per gli elementi comuni e CSS interno per gli stili specifici di ogni pagina.

3. **Esercizio avanzato**: Implementa un sistema di temi per un sito web utilizzando diversi file CSS esterni e un meccanismo per passare da un tema all'altro (chiaro/scuro).

4. **Esercizio di analisi**: Visita un sito web popolare e utilizza gli strumenti di sviluppo del browser per analizzare come vengono collegati e organizzati i fogli di stile.

## Risorse esterne

- [MDN Web Docs: Come applicare CSS](https://developer.mozilla.org/it/docs/Learn/CSS/First_steps/How_CSS_is_structured)
- [W3Schools: CSS How To](https://www.w3schools.com/css/css_howto.asp)
- [CSS-Tricks: All About Floats](https://css-tricks.com/all-about-floats/)
- [Google Developers: Render-Blocking CSS](https://developers.google.com/web/fundamentals/performance/critical-rendering-path/render-blocking-css)

---

- [📑 Indice](../README.md)
- [⬅️ Storia e evoluzione del CSS](<01_Storia_e_evoluzione_del_CSS.md>)
- [➡️ Sintassi di base e regole](03_Sintassi_di_base_e_regole.md)