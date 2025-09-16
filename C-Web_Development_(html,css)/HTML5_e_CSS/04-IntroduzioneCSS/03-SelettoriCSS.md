# Selettori CSS

## Introduzione

I selettori CSS sono modelli che determinano quali elementi HTML verranno stilizzati da un blocco di regole CSS. Sono la parte fondamentale della sintassi CSS che collega gli stili agli elementi del documento. Comprendere i selettori è essenziale per applicare efficacemente gli stili alle pagine web.

## Tipi di Selettori Base

### 1. Selettore di Elemento

Seleziona tutti gli elementi di un determinato tipo.

#### Sintassi

```css
nome-elemento {
  proprietà: valore;
}
```

#### Esempio

```css
/* Seleziona tutti i paragrafi */
p {
  color: blue;
  line-height: 1.6;
}

/* Seleziona tutti i titoli di livello 2 */
h2 {
  font-size: 24px;
  margin-bottom: 15px;
}
```

### 2. Selettore di Classe

Seleziona tutti gli elementi con una specifica classe. Le classi possono essere riutilizzate su più elementi.

#### Sintassi

```css
.nome-classe {
  proprietà: valore;
}
```

#### Esempio

```css
/* Seleziona tutti gli elementi con classe "evidenziato" */
.evidenziato {
  background-color: yellow;
  font-weight: bold;
}

/* Seleziona tutti gli elementi con classe "bottone" */
.bottone {
  padding: 10px 15px;
  border-radius: 5px;
  background-color: #4CAF50;
  color: white;
}
```

#### HTML Corrispondente

```html
<p class="evidenziato">Questo paragrafo è evidenziato.</p>
<span class="evidenziato">Anche questo span è evidenziato.</span>
<button class="bottone">Clicca qui</button>
```

### 3. Selettore di ID

Seleziona un elemento con un ID specifico. Gli ID devono essere unici all'interno di una pagina.

#### Sintassi

```css
#nome-id {
  proprietà: valore;
}
```

#### Esempio

```css
/* Seleziona l'elemento con ID "intestazione" */
#intestazione {
  font-size: 32px;
  text-align: center;
  color: #333;
}

/* Seleziona l'elemento con ID "piè-di-pagina" */
#piè-di-pagina {
  background-color: #f0f0f0;
  padding: 20px;
  text-align: center;
}
```

#### HTML Corrispondente

```html
<h1 id="intestazione">Titolo Principale della Pagina</h1>
<div id="piè-di-pagina">Copyright © 2023</div>
```

### 4. Selettore Universale

Seleziona tutti gli elementi del documento.

#### Sintassi

```css
* {
  proprietà: valore;
}
```

#### Esempio

```css
/* Applica a tutti gli elementi */
* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}
```

## Selettori Combinatori

### 1. Selettore di Discendenti

Seleziona un elemento che è discendente di un altro elemento specificato (non necessariamente figlio diretto).

#### Sintassi

```css
selettore1 selettore2 {
  proprietà: valore;
}
```

#### Esempio

```css
/* Seleziona tutti i paragrafi all'interno di div */
div p {
  text-indent: 20px;
}

/* Seleziona tutti gli span all'interno di elementi con classe "contenitore" */
.contenitore span {
  font-style: italic;
}
```

#### HTML Corrispondente

```html
<div>
  <p>Questo paragrafo è indentato.</p>
  <section>
    <p>Anche questo paragrafo è indentato, perché è un discendente di div.</p>
  </section>
</div>

<div class="contenitore">
  <p>Paragrafo normale <span>con testo in corsivo</span>.</p>
</div>
```

### 2. Selettore di Figli Diretti

Seleziona un elemento che è figlio diretto di un altro elemento specificato.

#### Sintassi

```css
selettore1 > selettore2 {
  proprietà: valore;
}
```

#### Esempio

```css
/* Seleziona tutti i li che sono figli diretti di ul */
ul > li {
  list-style-type: square;
}

/* Seleziona tutti i p che sono figli diretti di div */
div > p {
  font-weight: bold;
}
```

#### HTML Corrispondente

```html
<ul>
  <li>Questo è un elemento di lista con stile square.</li>
  <li>Anche questo è un elemento di lista con stile square.
    <ul>
      <li>Questo elemento non è selezionato dal selettore ul > li perché non è figlio diretto del primo ul.</li>
    </ul>
  </li>
</ul>

<div>
  <p>Questo paragrafo è in grassetto perché è figlio diretto di div.</p>
  <section>
    <p>Questo paragrafo non è in grassetto perché non è figlio diretto di div.</p>
  </section>
</div>
```

### 3. Selettore di Fratelli Adiacenti

Seleziona un elemento che è immediatamente preceduto da un altro elemento specificato.

#### Sintassi

```css
selettore1 + selettore2 {
  proprietà: valore;
}
```

#### Esempio

```css
/* Seleziona il primo paragrafo che segue immediatamente un h2 */
h2 + p {
  font-size: 18px;
  color: #666;
}

/* Seleziona ogni li che segue immediatamente un altro li */
li + li {
  margin-top: 10px;
}
```

#### HTML Corrispondente

```html
<h2>Titolo della Sezione</h2>
<p>Questo paragrafo è selezionato perché segue immediatamente un h2.</p>
<p>Questo paragrafo non è selezionato perché non segue immediatamente un h2.</p>

<ul>
  <li>Primo elemento</li>
  <li>Questo elemento ha un margine superiore di 10px.</li>
  <li>Anche questo elemento ha un margine superiore di 10px.</li>
</ul>
```

### 4. Selettore di Fratelli Generali

Seleziona tutti gli elementi che sono preceduti da un altro elemento specificato.

#### Sintassi

```css
selettore1 ~ selettore2 {
  proprietà: valore;
}
```

#### Esempio

```css
/* Seleziona tutti i paragrafi che seguono un h2 */
h2 ~ p {
  font-style: italic;
}

/* Seleziona tutti i div che seguono un elemento con classe "separatore" */
.separatore ~ div {
  border-top: 1px solid #ccc;
}
```

#### HTML Corrispondente

```html
<h2>Titolo della Sezione</h2>
<p>Questo paragrafo è in corsivo.</p>
<div>Questo div non è selezionato.</div>
<p>Anche questo paragrafo è in corsivo.</p>

<div class="separatore"></div>
<p>Questo paragrafo non è selezionato.</p>
<div>Questo div ha un bordo superiore.</div>
<div>Anche questo div ha un bordo superiore.</div>
```

## Selettori di Attributo

Selezionano elementi in base ai loro attributi o valori di attributi.

### Sintassi Base

```css
/* Seleziona elementi con un attributo specifico */
[attributo] {
  proprietà: valore;
}

/* Seleziona elementi con un attributo che ha un valore specifico */
[attributo="valore"] {
  proprietà: valore;
}
```

### Esempi

```css
/* Seleziona tutti gli elementi con attributo "title" */
[title] {
  cursor: help;
}

/* Seleziona tutti gli input di tipo "text" */
input[type="text"] {
  border: 1px solid #ccc;
  padding: 5px;
}

/* Seleziona tutti i link che si aprono in una nuova finestra */
a[target="_blank"] {
  color: red;
  text-decoration: underline;
}

/* Seleziona elementi con attributo "data-categoria" che contiene la parola "importante" */
[data-categoria*="importante"] {
  font-weight: bold;
}

/* Seleziona elementi con attributo "lang" che inizia con "it" */
[lang^="it"] {
  font-family: 'Times New Roman', serif;
}

/* Seleziona elementi con attributo "href" che termina con ".pdf" */
[href$=".pdf"] {
  background-image: url('icona-pdf.png');
  padding-left: 20px;
  background-repeat: no-repeat;
}
```

## Pseudo-classi

Le pseudo-classi selezionano elementi in base a stati o posizioni che non possono essere espressi con selettori semplici.

### Sintassi

```css
selettore:pseudo-classe {
  proprietà: valore;
}
```

### Esempi di Pseudo-classi Comuni

```css
/* Stile quando il mouse passa sopra un elemento */
a:hover {
  text-decoration: underline;
  color: #0066cc;
}

/* Stile per link visitati */
a:visited {
  color: purple;
}

/* Stile per link attivi (quando si fa clic) */
a:active {
  color: red;
}

/* Stile per il primo figlio di un elemento */
li:first-child {
  font-weight: bold;
}

/* Stile per l'ultimo figlio di un elemento */
li:last-child {
  border-bottom: none;
}

/* Stile per elementi dispari in una lista */
tr:nth-child(odd) {
  background-color: #f2f2f2;
}

/* Stile per elementi pari in una lista */
tr:nth-child(even) {
  background-color: #ffffff;
}

/* Stile per elementi in base a una formula */
li:nth-child(3n+1) {
  color: blue;
}

/* Stile per elementi quando sono in focus */
input:focus {
  border-color: #0066cc;
  outline: none;
}

/* Stile per elementi disabilitati */
button:disabled {
  opacity: 0.5;
  cursor: not-allowed;
}

/* Stile per elementi selezionati */
option:checked {
  background-color: #e0e0e0;
}
```

## Pseudo-elementi

I pseudo-elementi permettono di stilizzare parti specifiche di un elemento.

### Sintassi

```css
selettore::pseudo-elemento {
  proprietà: valore;
}
```

### Esempi di Pseudo-elementi Comuni

```css
/* Stile per la prima lettera di un paragrafo */
p::first-letter {
  font-size: 2em;
  font-weight: bold;
  color: #900;
}

/* Stile per la prima riga di un paragrafo */
p::first-line {
  font-variant: small-caps;
}

/* Aggiunge contenuto prima di un elemento */
h2::before {
  content: "§ ";
  color: #999;
}

/* Aggiunge contenuto dopo un elemento */
a[href^="http"]::after {
  content: " ↗";
  font-size: 0.8em;
}

/* Stile per il testo selezionato dall'utente */
::selection {
  background-color: #ffff00;
  color: #000000;
}
```

## Combinazione di Selettori

È possibile combinare più selettori per creare regole più specifiche.

### Esempi

```css
/* Seleziona paragrafi con classe "nota" */
p.nota {
  font-style: italic;
  color: #666;
}

/* Seleziona elementi con entrambe le classi */
.bottone.primario {
  background-color: #0066cc;
  color: white;
}

/* Seleziona input di tipo checkbox quando sono selezionati */
input[type="checkbox"]:checked {
  outline: 2px solid blue;
}

/* Seleziona il primo paragrafo all'interno di un articolo */
article > p:first-child {
  font-size: 1.2em;
  font-weight: bold;
}

/* Seleziona link esterni quando il mouse passa sopra */
a[href^="http"]:hover {
  text-decoration: underline;
  color: #cc0000;
}
```

## Raggruppamento di Selettori

È possibile applicare lo stesso stile a più selettori raggruppandoli.

### Sintassi

```css
selettore1, selettore2, selettore3 {
  proprietà: valore;
}
```

### Esempio

```css
/* Applica lo stesso stile a h1, h2 e h3 */
h1, h2, h3 {
  font-family: 'Georgia', serif;
  color: #333;
  margin-bottom: 15px;
}

/* Applica lo stesso stile a diversi tipi di input */
input[type="text"], input[type="email"], input[type="password"], textarea {
  border: 1px solid #ccc;
  padding: 8px;
  border-radius: 4px;
}
```

## Specificità dei Selettori

La specificità determina quale regola CSS viene applicata quando più regole potrebbero influenzare lo stesso elemento. Più specifico è un selettore, maggiore è la sua priorità.

### Ordine di Specificità (dal meno specifico al più specifico)

1. Selettori di elemento e pseudo-elementi (`p`, `::before`)
2. Selettori di classe, pseudo-classi e attributi (`.classe`, `:hover`, `[attributo]`)
3. Selettori di ID (`#id`)
4. Stili inline (`style="..."`) 

### Esempio di Specificità

```css
/* Specificità: 0-0-1 */
p {
  color: blue;
}

/* Specificità: 0-1-0 */
.testo {
  color: red;
}

/* Specificità: 0-1-1 */
p.testo {
  color: green;
}

/* Specificità: 1-0-0 */
#contenuto {
  color: purple;
}

/* Specificità: 1-0-1 */
#contenuto p {
  color: orange;
}
```

In questo esempio, se un paragrafo ha sia la classe `testo` che si trova all'interno di un elemento con ID `contenuto`, il colore sarà arancione perché `#contenuto p` ha la specificità più alta.

## Best Practices per l'Uso dei Selettori

1. **Preferire le classi** per la maggior parte degli stili
2. **Evitare selettori troppo specifici** che rendono difficile sovrascrivere gli stili
3. **Limitare l'uso degli ID** come selettori CSS
4. **Utilizzare selettori di attributo** per elementi con caratteristiche specifiche
5. **Sfruttare le pseudo-classi** per stati interattivi
6. **Mantenere bassa la specificità** quando possibile
7. **Utilizzare nomi di classe semantici** che descrivono lo scopo dell'elemento, non il suo aspetto
8. **Evitare selettori universali** in combinazione con altri selettori per motivi di performance

## Conclusione

I selettori CSS sono strumenti potenti che permettono di applicare stili in modo preciso e mirato. Comprendere i diversi tipi di selettori e come combinarli efficacemente è fondamentale per creare fogli di stile ben organizzati e manutenibili.

Nel prossimo capitolo, esploreremo le proprietà CSS per il testo, come modificare font, dimensioni, colori e altre caratteristiche tipografiche.

## Navigazione del Corso
- [📑 Indice](../README.md)
- [⬅️ Collegare CSS a HTML](./02-CollegareCSS.md)
- [➡️ Proprietà di Testo](./04-ProprietàTesto.md)