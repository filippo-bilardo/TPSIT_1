## Struttura di base di una pagina HTML5

### Dichiarazione del doctype
Il doctype HTML5 rappresenta una significativa semplificazione rispetto alle complesse dichiarazioni delle versioni precedenti di HTML. La dichiarazione `<!DOCTYPE html>` è tutto ciò che serve per indicare al browser che il documento è scritto in HTML5, eliminando la necessità di riferimenti a DTD (Document Type Definition) esterni che caratterizzavano HTML 4.01 e XHTML. Questa semplificazione non è solo una questione di convenienza per gli sviluppatori, ma ha un impatto diretto sul rendering delle pagine: la dichiarazione doctype determina la modalità di rendering del browser, con HTML5 che attiva la modalità standard moderna.

La differenza rispetto ai doctype precedenti è notevole: in HTML 4.01, era necessario specificare se il documento era Strict, Transitional o Frameset, con dichiarazioni verbose come `<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">`. XHTML richiedeva dichiarazioni ancora più complesse che includevano namespace XML. Questa semplificazione del doctype riflette la filosofia generale di HTML5: pragmatismo e facilità d'uso, mantenendo al contempo la compatibilità con il passato e garantendo che i browser interpretino correttamente il documento secondo gli standard più recenti.

### Elemento html e attributi fondamentali
L'elemento `<html>` rappresenta la radice di un documento HTML, contenendo tutti gli altri elementi della pagina. In HTML5, è buona pratica includere l'attributo `lang` per specificare la lingua principale del documento, ad esempio `<html lang="it">` per un documento in italiano. Questo attributo è fondamentale per l'accessibilità, permettendo ai lettori di schermo di utilizzare la corretta pronuncia, e per i motori di ricerca, che possono indicizzare correttamente il contenuto in base alla lingua.

Mentre in XHTML era obbligatorio dichiarare i namespace XML, in HTML5 questa pratica è diventata opzionale. Tuttavia, in alcuni casi specifici, come quando si integra SVG o MathML direttamente nel documento HTML, può essere utile dichiarare namespace aggiuntivi. Altri attributi opzionali dell'elemento html includono `dir` per specificare la direzione del testo (utile per lingue che si leggono da destra a sinistra come l'arabo o l'ebraico) e `class` o `id` per applicare stili o comportamenti specifici all'intero documento. La corretta configurazione dell'elemento radice stabilisce il contesto fondamentale per tutto il documento HTML5.

### La sezione head
La sezione `<head>` di un documento HTML5 contiene metadati e collegamenti a risorse esterne che non vengono visualizzati direttamente nella pagina ma sono essenziali per il suo corretto funzionamento. L'elemento `<title>` è l'unico metadato obbligatorio e definisce il titolo del documento, visualizzato nella barra del titolo del browser o nelle schede. Questo titolo è anche utilizzato dai motori di ricerca e nei segnalibri, quindi dovrebbe essere descrittivo e conciso.

### Definizione del charset in HTML5
La definizione del charset (set di caratteri) è fondamentale in HTML5 e viene specificata con `<meta charset="utf-8">`, posizionata idealmente come primo elemento dopo il tag di apertura `<head>` per garantire che il browser interpreti correttamente i caratteri prima di elaborare il resto del documento.

Il charset definisce la codifica dei caratteri utilizzata nel documento HTML, determinando come i byte vengono convertiti in caratteri visualizzabili. Senza una corretta definizione del charset, i caratteri speciali, accenti e simboli potrebbero essere visualizzati in modo errato (ad esempio, "è" potrebbe apparire come "Ã¨").

#### Principali set di caratteri
- **ASCII**: Il set di caratteri più basilare, supporta solo 128 caratteri, principalmente lettere inglesi, numeri e alcuni simboli. Non supporta caratteri accentati o simboli di altre lingue.
- **ISO-8859-1** (Latin-1): Estensione di ASCII che include 256 caratteri, coprendo la maggior parte delle lingue dell'Europa occidentale, ma non supporta lingue come russo, arabo o cinese.
- **UTF-8**: Codifica Unicode che può rappresentare qualsiasi carattere dello standard Unicode, supportando praticamente tutte le lingue e i simboli del mondo. È retrocompatibile con ASCII.

#### Perché utilizzare UTF-8
UTF-8 è fortemente raccomandato per tutti i documenti HTML5 per i seguenti motivi:
- **Compatibilità universale**: Supporta praticamente tutti i caratteri e simboli delle lingue mondiali.
- **Efficienza**: Utilizza da 1 a 4 byte per carattere, ottimizzando lo spazio per i testi in lingue occidentali.
- **Standard de facto**: È la codifica predefinita per HTML5 e la più utilizzata sul web.
- **Retrocompatibilità**: I primi 128 caratteri sono identici ad ASCII, garantendo compatibilità con sistemi legacy.

#### Dichiarazione corretta del charset
La dichiarazione del charset deve essere posizionata all'inizio della sezione `<head>` per garantire che il browser interpreti correttamente i caratteri prima di elaborare qualsiasi altro contenuto:

```html
<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="utf-8">
    <!-- Altri metadati e risorse -->
    <title>Titolo della pagina</title>
</head>
```

È importante notare che in HTML5 la sintassi è stata semplificata rispetto alle versioni precedenti di HTML, dove era necessario utilizzare una dichiarazione più verbosa come `<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">`.

Per i siti responsive, dopo la definizione del charset, il meta tag viewport `<meta name="viewport" content="width=device-width, initial-scale=1">` è cruciale, istruendo il browser su come scalare la pagina su dispositivi di diverse dimensioni.

I collegamenti a risorse esterne vengono gestiti principalmente attraverso l'elemento `<link>`. Fogli di stile CSS vengono collegati con `<link rel="stylesheet" href="styles.css">`, mentre le favicon (le piccole icone visualizzate nelle schede del browser) con `<link rel="icon" href="favicon.ico">`. HTML5 ha introdotto anche attributi per l'ottimizzazione del caricamento delle risorse, come `preload` per caricare risorse critiche in anticipo e `prefetch` per suggerire al browser di caricare risorse che potrebbero essere necessarie per la navigazione futura, migliorando significativamente le performance percepite dall'utente.

### La sezione body
La sezione `<body>` contiene tutto il contenuto visibile della pagina web, organizzato in una struttura gerarchica di elementi che definiscono la semantica e la presentazione dei contenuti. In HTML5, questa organizzazione è notevolmente migliorata grazie all'introduzione di elementi semantici che permettono di strutturare il documento in modo più logico e significativo. La struttura generale del contenuto dovrebbe seguire principi di chiarezza e coerenza, con una gerarchia ben definita che faciliti la comprensione sia per gli utenti che per i motori di ricerca.

L'organizzazione gerarchica degli elementi è fondamentale per la corretta interpretazione del documento. I titoli, da `<h1>` a `<h6>`, dovrebbero essere utilizzati in ordine sequenziale per creare una struttura logica dei contenuti, con `<h1>` tipicamente riservato al titolo principale della pagina. Gli elementi di blocco come `<p>`, `<div>`, `<article>` e `<section>` definiscono aree distinte di contenuto, mentre gli elementi inline come `<span>`, `<a>`, `<strong>` e `<em>` modificano o arricchiscono il testo all'interno di questi blocchi.

La divisione in sezioni logiche è facilitata dagli elementi semantici di HTML5 come `<header>`, `<nav>`, `<main>`, `<article>`, `<section>`, `<aside>` e `<footer>`, che permettono di identificare chiaramente le diverse aree funzionali della pagina. Questa strutturazione non solo migliora la leggibilità e la manutenibilità del codice, ma offre anche vantaggi significativi in termini di accessibilità e SEO, permettendo a tecnologie assistive e motori di ricerca di interpretare correttamente la struttura e l'importanza relativa dei diversi contenuti.

### Esempio completo di una pagina HTML5 base
Un template minimo funzionale per una pagina HTML5 include tutti gli elementi essenziali discussi nelle sezioni precedenti, organizzati in una struttura coerente. Ecco un esempio di base:

```html
<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Titolo della pagina</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <header>
        <h1>Titolo principale</h1>
        <nav>
            <ul>
                <li><a href="#">Home</a></li>
                <li><a href="#">Chi siamo</a></li>
                <li><a href="#">Contatti</a></li>
            </ul>
        </nav>
    </header>
    <main>
        <article>
            <h2>Titolo articolo</h2>
            <p>Contenuto dell'articolo...</p>
        </article>
        <aside>
            <h3>Informazioni correlate</h3>
            <p>Contenuto secondario...</p>
        </aside>
    </main>
    <footer>
        <p>&copy; 2023 Nome Sito. Tutti i diritti riservati.</p>
    </footer>
</body>
</html>
```

Analizzando riga per riga: il doctype dichiara che si tratta di un documento HTML5; l'elemento html include l'attributo lang per specificare la lingua; la sezione head contiene i metadati essenziali (charset, viewport, titolo) e il collegamento al foglio di stile; la sezione body è strutturata semanticamente con header (contenente il titolo principale e la navigazione), main (con il contenuto principale diviso in article e aside) e footer (con informazioni di copyright). Questa organizzazione del codice segue le best practices moderne, creando una struttura chiara, semantica e facilmente manutenibile.

### Validazione della struttura
La validazione della struttura HTML5 è un passaggio fondamentale per garantire che il documento sia conforme agli standard e venga interpretato correttamente dai browser. Il Validatore W3C (validator.w3.org) rappresenta lo strumento di riferimento per questa verifica, analizzando il codice HTML e segnalando errori sintattici, elementi obsoleti o utilizzi impropri degli attributi. Questo strumento può essere utilizzato sia caricando direttamente il file HTML, sia inserendo l'URL di una pagina pubblicata, sia incollando il codice nell'apposito campo.

Gli errori più comuni nella struttura base includono: tag non chiusi correttamente, elementi nidificati in modo errato (ad esempio, un elemento block all'interno di un elemento inline), attributi duplicati, valori di attributi non validi e l'uso di elementi deprecati. Particolarmente frequenti sono anche gli errori relativi alla struttura semantica, come l'uso di più elementi `<h1>` nella stessa pagina o l'omissione di elementi obbligatori come `<title>`. La risoluzione di questi problemi generalmente richiede una revisione attenta del codice, seguendo le indicazioni specifiche fornite dal validatore.

Oltre alla validazione formale, è importante verificare che la struttura semantica sia logica e coerente. Strumenti come il validatore di accessibilità WAVE o l'estensione Lighthouse di Chrome possono aiutare a identificare problemi di struttura che, pur non essendo errori sintattici, potrebbero compromettere l'accessibilità o l'ottimizzazione per i motori di ricerca. La validazione regolare durante lo sviluppo permette di identificare e correggere i problemi tempestivamente, evitando che si accumulino e diventino più difficili da risolvere nelle fasi avanzate del progetto.

### Compatibilità cross-browser
Nonostante HTML5 sia ampiamente supportato dai browser moderni, garantire la compatibilità cross-browser rimane una considerazione importante, specialmente quando il sito deve supportare browser più datati. I polyfill sono script JavaScript che implementano funzionalità HTML5 in browser che non le supportano nativamente. Librerie come Modernizr possono rilevare automaticamente le capacità del browser e caricare i polyfill necessari solo quando richiesto, ottimizzando le performance. Gli shim, simili ai polyfill ma focalizzati su API JavaScript piuttosto che elementi HTML, completano questa strategia di compatibilità.

Per garantire la compatibilità della struttura base, è consigliabile adottare un approccio di progressive enhancement, partendo da una base funzionale in tutti i browser e aggiungendo gradualmente funzionalità avanzate per i browser che le supportano. CSS normalizzati come normalize.css aiutano a standardizzare il rendering di base tra diversi browser, riducendo le inconsistenze. È anche importante evitare l'uso di funzionalità sperimentali o non standardizzate senza adeguate strategie di fallback.

Il testing della struttura su diversi browser è un passaggio cruciale. Strumenti come BrowserStack, CrossBrowserTesting o il più economico servizio integrato in Firefox Developer Edition (Responsive Design Mode) permettono di verificare come la pagina viene visualizzata su diverse combinazioni di browser e dispositivi. Particolare attenzione dovrebbe essere dedicata a Internet Explorer 11, che pur essendo obsoleto è ancora utilizzato in alcuni contesti aziendali, e ai browser mobile, che potrebbero avere limitazioni specifiche. Un approccio sistematico al testing cross-browser permette di identificare e risolvere problemi di compatibilità prima che raggiungano gli utenti finali.

---

### Navigazione
- [📑 Indice](<../README.md>)
- [⬅️ Utilizzo di GitHub Pages](<../1. Ambiente di sviluppo/11_GitHub_Pages.md>)
- [➡️ Elementi e tag principali](<02_Elementi_tag_principali.md>)

