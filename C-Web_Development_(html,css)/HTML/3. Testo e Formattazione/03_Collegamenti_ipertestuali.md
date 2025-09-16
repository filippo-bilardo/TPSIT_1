# Collegamenti ipertestuali

## Concetti fondamentali

I collegamenti ipertestuali (o link) rappresentano uno dei concetti fondamentali del World Wide Web, permettendo la navigazione tra documenti e risorse diverse. Questi elementi interattivi consentono agli utenti di spostarsi da una pagina all'altra con un semplice clic, creando quella rete interconnessa di informazioni che caratterizza il web moderno.

L'elemento `<a>` (anchor) è il tag HTML utilizzato per creare collegamenti. La sua sintassi base richiede l'attributo `href` (hypertext reference) che specifica la destinazione del collegamento:

```html
<a href="https://www.esempio.it">Visita il nostro sito</a>
```

È importante distinguere tra collegamenti assoluti e relativi:
- **Collegamenti assoluti**: specificano l'URL completo della risorsa, incluso il protocollo (http://, https://) e il dominio. Sono utilizzati principalmente per collegamenti a siti esterni.
- **Collegamenti relativi**: specificano il percorso della risorsa rispetto alla posizione del documento corrente. Sono ideali per collegamenti interni al sito.

I termini URI (Uniform Resource Identifier) e URL (Uniform Resource Locator) sono spesso usati in modo intercambiabile, ma tecnicamente un URL è un tipo di URI che specifica non solo l'identità di una risorsa ma anche il meccanismo per accedervi (il protocollo).

## Tipi di collegamenti

### Collegamenti a pagine esterne

I collegamenti a pagine esterne puntano a risorse su altri domini. È buona pratica includere l'attributo `target="_blank"` per aprire questi link in una nuova scheda, migliorando l'esperienza utente:

```html
<a href="https://www.esempio.it" target="_blank" rel="noopener noreferrer">Visita il sito esterno</a>
```

L'attributo `rel="noopener noreferrer"` è importante per motivi di sicurezza, in quanto previene che la nuova pagina possa accedere alla finestra originale attraverso l'oggetto `window.opener`.

### Collegamenti a pagine interne del sito

Per navigare all'interno dello stesso sito, i collegamenti relativi sono più efficienti e manutenibili:

```html
<a href="pagina.html">Vai alla pagina</a>
<a href="/cartella/pagina.html">Vai alla pagina in una cartella specifica</a>
<a href="../pagina.html">Vai alla pagina nella directory superiore</a>
```

### Collegamenti a sezioni specifiche della pagina (ancore)

È possibile creare collegamenti a punti specifici all'interno della stessa pagina utilizzando gli identificatori (ID):

```html
<!-- Definizione dell'ancora -->
<h2 id="sezione1">Sezione 1</h2>

<!-- Collegamento all'ancora -->
<a href="#sezione1">Vai alla Sezione 1</a>
```

Questo tipo di collegamento è particolarmente utile per pagine lunghe o per creare un indice dei contenuti.

### Collegamenti a risorse non HTML

I collegamenti possono puntare a qualsiasi tipo di risorsa, non solo pagine HTML:

```html
<a href="documento.pdf">Scarica il PDF</a>
<a href="immagine.jpg">Visualizza l'immagine</a>
<a href="video.mp4">Guarda il video</a>
```

Per i file destinati al download, è utile aggiungere l'attributo `download`:

```html
<a href="documento.pdf" download="nome-file.pdf">Scarica il PDF</a>
```

### Collegamenti per email e protocolli speciali

HTML supporta vari protocolli oltre a HTTP/HTTPS:

```html
<a href="mailto:info@esempio.it">Contattaci via email</a>
<a href="tel:+390123456789">Chiamaci</a>
<a href="sms:+390123456789">Inviaci un SMS</a>
```

È anche possibile precompilare l'oggetto e il corpo di un'email:

```html
<a href="mailto:info@esempio.it?subject=Informazioni&body=Vorrei%20sapere%20di%20più">Richiedi informazioni</a>
```

## Attributi dell'elemento anchor

### L'attributo `href` e i suoi valori

L'attributo `href` può contenere diversi tipi di valori:
- URL assoluti: `https://www.esempio.it`
- URL relativi: `pagina.html`, `../pagina.html`
- Ancore: `#sezione`
- Protocolli speciali: `mailto:`, `tel:`, `ftp:`
- JavaScript: `javascript:void(0)` (sebbene sia preferibile usare event listener)

### Target: controllo della destinazione

L'attributo `target` controlla dove aprire il collegamento:

- `_self`: nella stessa finestra/tab (comportamento predefinito)
- `_blank`: in una nuova finestra/tab
- `_parent`: nel frame genitore
- `_top`: nella finestra completa, uscendo da eventuali frame

```html
<a href="https://www.esempio.it" target="_blank">Apri in una nuova scheda</a>
```

### Attributi `rel` per SEO e sicurezza

L'attributo `rel` definisce la relazione tra la pagina corrente e quella collegata:

- `nofollow`: indica ai motori di ricerca di non seguire il link
- `noopener`: previene che la pagina di destinazione possa accedere alla finestra originale
- `noreferrer`: impedisce di trasmettere informazioni di referral
- `sponsored`: indica un link sponsorizzato o pubblicitario
- `ugc`: indica contenuto generato dagli utenti

```html
<a href="https://www.esempio.it" rel="nofollow noopener">Link esterno</a>
```

### Attributi di accessibilità

Per migliorare l'accessibilità, è possibile utilizzare attributi come:

- `title`: fornisce informazioni aggiuntive sul collegamento
- `aria-label`: offre un'etichetta accessibile per screen reader

```html
<a href="documento.pdf" title="Documento in formato PDF, 2.5MB">Scarica la guida</a>
<a href="#" aria-label="Chiudi la finestra di dialogo">✕</a>
```

### Attributi per download di file

L'attributo `download` suggerisce al browser di scaricare la risorsa anziché navigarvi:

```html
<a href="documento.pdf" download>Scarica il PDF</a>
<a href="immagine.jpg" download="foto.jpg">Scarica l'immagine</a>
```

## Styling dei collegamenti

### Stati dei collegamenti

I collegamenti hanno diversi stati che possono essere stilizzati con CSS:

```css
/* Link non visitato */
a:link {
  color: blue;
}

/* Link visitato */
a:visited {
  color: purple;
}

/* Mouse sopra il link */
a:hover {
  color: red;
  text-decoration: underline;
}

/* Link attivo (durante il clic) */
a:active {
  color: orange;
}

/* Link con focus (navigazione da tastiera) */
a:focus {
  outline: 2px solid blue;
}
```

È importante mantenere l'ordine LVHA (link, visited, hover, active) per evitare conflitti di specificità.

### Personalizzazione dell'aspetto con CSS

I collegamenti possono essere completamente personalizzati con CSS:

```css
.button-link {
  display: inline-block;
  padding: 10px 20px;
  background-color: #4CAF50;
  color: white;
  text-decoration: none;
  border-radius: 4px;
  transition: background-color 0.3s;
}

.button-link:hover {
  background-color: #45a049;
}
```

### Trasformazione di collegamenti in pulsanti

I collegamenti possono essere stilizzati per apparire come pulsanti, mantenendo la semantica del link:

```html
<a href="pagina.html" class="button-link">Continua</a>
```

### Effetti di transizione e animazione

Le transizioni CSS possono migliorare l'interattività dei collegamenti:

```css
a {
  position: relative;
  color: #000;
  text-decoration: none;
}

a::after {
  content: '';
  position: absolute;
  width: 100%;
  height: 2px;
  bottom: 0;
  left: 0;
  background-color: #000;
  transform: scaleX(0);
  transition: transform 0.3s ease-out;
}

a:hover::after {
  transform: scaleX(1);
}
```

## Collegamenti avanzati

### Mappe di immagini

Le mappe di immagini permettono di creare aree cliccabili all'interno di un'immagine:

```html
<img src="mappa.jpg" alt="Mappa" usemap="#mapparegioni">

<map name="mapparegioni">
  <area shape="rect" coords="0,0,100,100" href="regione1.html" alt="Regione 1">
  <area shape="circle" coords="200,200,50" href="regione2.html" alt="Regione 2">
  <area shape="poly" coords="300,100,400,200,300,300" href="regione3.html" alt="Regione 3">
</map>
```

### Collegamenti con JavaScript

I collegamenti possono essere potenziati con JavaScript per comportamenti più complessi:

```html
<a href="pagina.html" onclick="event.preventDefault(); caricaPagina(this.href);">Carica con AJAX</a>
```

È preferibile utilizzare event listener separati per mantenere la separazione tra HTML e comportamento:

```javascript
document.querySelector('a.ajax-link').addEventListener('click', function(e) {
  e.preventDefault();
  caricaPagina(this.href);
});
```

### API History e manipolazione dell'URL

L'API History permette di manipolare la cronologia del browser senza ricaricare la pagina:

```javascript
// Aggiunge una nuova voce alla cronologia
history.pushState({page: 2}, "Titolo", "?page=2");

// Sostituisce l'entry corrente nella cronologia
history.replaceState({page: 3}, "Titolo", "?page=3");
```

### Prefetching e prerendering

È possibile suggerire al browser di precaricare risorse che potrebbero essere necessarie:

```html
<link rel="prefetch" href="pagina-successiva.html">
<link rel="prerender" href="pagina-probabile.html">
```

## Considerazioni di usabilità

### Testo descrittivo per i collegamenti

Utilizzare testo descrittivo nei collegamenti migliora l'usabilità e l'accessibilità:

```html
<!-- Evitare -->
<a href="prodotto.html">Clicca qui</a>

<!-- Preferire -->
<a href="prodotto.html">Visualizza dettagli del prodotto</a>
```

### Distinguibilità visiva dei collegamenti

I collegamenti devono essere facilmente riconoscibili all'interno del contenuto:
- Utilizzare colori contrastanti
- Mantenere la sottolineatura o fornire altri indicatori visivi
- Assicurarsi che i collegamenti siano distinguibili anche per utenti con daltonismo

### Consistenza nell'interfaccia utente

Mantenere uno stile coerente per i collegamenti in tutto il sito:
- Utilizzare gli stessi colori per lo stesso tipo di azioni
- Posizionare i menu di navigazione in modo coerente
- Utilizzare pattern riconoscibili per i collegamenti

### Feedback visivo per l'interazione

Fornire feedback visivo quando l'utente interagisce con i collegamenti:
- Cambiamenti di stile al passaggio del mouse (hover)
- Indicatori di focus per la navigazione da tastiera
- Animazioni o transizioni per migliorare l'esperienza utente

## Best practices e SEO

### Ottimizzazione dei collegamenti per i motori di ricerca

I collegamenti sono fondamentali per la SEO:
- Utilizzare testo descrittivo e pertinente
- Evitare testo generico come "clicca qui" o "leggi di più"
- Utilizzare l'attributo `title` per fornire informazioni aggiuntive
- Strutturare la navigazione in modo logico e gerarchico

### Gestione dei collegamenti rotti

I collegamenti rotti danneggiano l'esperienza utente e la SEO:
- Verificare regolarmente i collegamenti con strumenti di controllo
- Implementare reindirizzamenti 301 per URL modificati
- Creare una pagina 404 personalizzata e utile
- Monitorare i log del server per identificare errori 404

### Utilizzo appropriato di attributi rel

Gli attributi `rel` aiutano a definire la relazione tra pagine:
- `rel="nofollow"` per collegamenti non approvati o pubblicitari
- `rel="sponsored"` per collegamenti sponsorizzati
- `rel="ugc"` per contenuti generati dagli utenti
- `rel="noopener noreferrer"` per collegamenti esterni in nuove schede

### Monitoraggio e analisi dei clic sui collegamenti

Tracciare i clic sui collegamenti fornisce informazioni preziose sul comportamento degli utenti:
- Implementare il tracciamento degli eventi con strumenti di analisi
- Analizzare quali collegamenti ricevono più clic
- Testare posizionamenti e testi alternativi
- Utilizzare i dati per ottimizzare la navigazione del sito

---

### Navigazione
- [📑 Indice](<../README.md>)
- [⬅️ Elementi inline e block-level](<02_Elementi_inline_block.md>)
- [➡️ Inserimento e gestione di immagini](<04_Inserimento_gestione_immagini.md>)