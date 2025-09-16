# Elementi di Testo e Titoli in HTML5

## Introduzione

Gli elementi di testo e i titoli sono componenti fondamentali di qualsiasi pagina web. HTML5 offre diversi elementi per strutturare e formattare il testo in modo semanticamente corretto, migliorando sia la leggibilità per gli utenti che l'interpretazione per i motori di ricerca.

## Titoli (Headings)

I titoli in HTML sono definiti con i tag da `<h1>` a `<h6>`, dove `<h1>` rappresenta il titolo più importante e `<h6>` quello meno importante. È importante utilizzare questi elementi in modo gerarchico e semantico.

```html
<h1>Titolo principale della pagina</h1>
<h2>Sottotitolo importante</h2>
<h3>Sezione di terzo livello</h3>
<h4>Sottosezione di quarto livello</h4>
<h5>Punto di quinto livello</h5>
<h6>Dettaglio di sesto livello</h6>
```

### Best Practices per i Titoli

- Usa un solo `<h1>` per pagina, che dovrebbe rappresentare il titolo principale del contenuto
- Mantieni una gerarchia logica (non saltare da `<h1>` a `<h4>` senza utilizzare `<h2>` e `<h3>`)
- Non utilizzare i titoli solo per scopi stilistici (per testo grande o in grassetto)
- I titoli aiutano i motori di ricerca a comprendere la struttura della pagina

## Paragrafi

I paragrafi sono definiti con il tag `<p>`. Rappresentano blocchi di testo correlati e sono separati automaticamente da spazi verticali.

```html
<p>Questo è un paragrafo di testo. I paragrafi sono elementi a blocco che contengono testo e possono includere altri elementi inline.</p>
<p>Questo è un secondo paragrafo. HTML gestisce automaticamente lo spazio tra i paragrafi.</p>
```

## Elementi di Testo Inline

Gli elementi inline non creano interruzioni di linea e sono utilizzati all'interno di elementi a blocco come i paragrafi.

### Span

L'elemento `<span>` è un contenitore generico inline che non ha un significato semantico intrinseco, ma è utile per applicare stili o script a porzioni di testo.

```html
<p>Questo è un testo normale con <span style="color: blue;">alcune parole in blu</span> grazie all'elemento span.</p>
```

### Line Break

L'elemento `<br>` crea un'interruzione di linea all'interno di un paragrafo o altro elemento di testo.

```html
<p>Questo testo avrà<br>un'interruzione di linea qui.</p>
```

### Horizontal Rule

L'elemento `<hr>` crea una linea orizzontale che rappresenta un cambio tematico nel contenuto.

```html
<p>Primo argomento.</p>
<hr>
<p>Secondo argomento, separato tematicamente dal primo.</p>
```

## Formattazione di Base

HTML offre elementi per la formattazione di base del testo, anche se molti di questi sono stati deprecati in favore di CSS per la formattazione visiva. Tuttavia, alcuni elementi hanno mantenuto un significato semantico:

### Grassetto e Corsivo

```html
<p><b>Testo in grassetto</b> - usato per evidenziare visivamente senza importanza semantica</p>
<p><i>Testo in corsivo</i> - usato per testo in una voce o umore alternativo</p>
```

## Conclusione

Gli elementi di testo e i titoli sono essenziali per strutturare il contenuto di una pagina web in modo semanticamente corretto. Utilizzando questi elementi in modo appropriato, si migliora l'accessibilità, la leggibilità e l'ottimizzazione per i motori di ricerca delle pagine web.

## Navigazione del Corso
- [📑 Indice](../README.md)
- [⬅️ Introduzione a HTML5](../01-IntroduzioneHTML5/README.md)
- [➡️ Formattazione Semantica del Testo](./02-FormattazioneSemantica.md)