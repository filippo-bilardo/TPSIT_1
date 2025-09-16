# Pseudo-classi e pseudo-elementi in CSS

## Indice dei contenuti
- [Introduzione alle pseudo-classi](#introduzione-alle-pseudo-classi)
- [Pseudo-classi di stato](#pseudo-classi-di-stato)
  - [Pseudo-classi per link](#pseudo-classi-per-link)
  - [Pseudo-classi per input](#pseudo-classi-per-input)
- [Pseudo-classi strutturali](#pseudo-classi-strutturali)
  - [Selettori per posizione](#selettori-per-posizione)
  - [Selettori :nth-child e :nth-of-type](#selettori-nth-child-e-nth-of-type)
- [Pseudo-elementi](#pseudo-elementi)
  - [::before e ::after](#before-e-after)
  - [::first-letter e ::first-line](#first-letter-e-first-line)
  - [::selection](#selection)
- [Differenze tra pseudo-classi e pseudo-elementi](#differenze-tra-pseudo-classi-e-pseudo-elementi)
- [Combinare pseudo-classi e pseudo-elementi](#combinare-pseudo-classi-e-pseudo-elementi)
- [Best Practice](#best-practice)
- [Domande di autovalutazione](#domande-di-autovalutazione)
- [Esercizi proposti](#esercizi-proposti)
- [Risorse esterne](#risorse-esterne)

## Introduzione alle pseudo-classi

Le pseudo-classi in CSS sono selettori speciali che permettono di selezionare elementi in base al loro stato o alla loro posizione nella struttura del documento, piuttosto che in base ai loro attributi o al loro contenuto. Le pseudo-classi iniziano sempre con i due punti (`:`), seguiti dal nome della pseudo-classe.

Le pseudo-classi consentono di applicare stili a elementi in base a:
- Stati dell'utente (come hover, focus, active)
- Posizione nella struttura del documento (come first-child, nth-child)
- Contenuto (come empty)

Sintassi di base:

```css
selector:pseudo-class {
  property: value;
}
```

## Pseudo-classi di stato

Le pseudo-classi di stato si applicano agli elementi in base alla loro interazione con l'utente o al loro stato corrente.

### Pseudo-classi per link

```css
/* Link non visitato */
a:link {
  color: blue;
}

/* Link visitato */
a:visited {
  color: purple;
}

/* Link al passaggio del mouse */
a:hover {
  color: red;
  text-decoration: underline;
}

/* Link durante il clic */
a:active {
  color: orange;
}
```

> **Suggerimento**: L'ordine di dichiarazione delle pseudo-classi per i link è importante. Si consiglia di seguire l'ordine LVHA: `:link`, `:visited`, `:hover`, `:active` per evitare comportamenti inaspettati dovuti alla cascata CSS.

### Pseudo-classi per input

```css
/* Input con focus */
input:focus {
  border-color: blue;
  outline: 2px solid lightblue;
}

/* Checkbox o radio button selezionati */
input:checked {
  background-color: green;
}

/* Input disabilitati */
input:disabled {
  background-color: #f0f0f0;
  cursor: not-allowed;
}

/* Input abilitati */
input:enabled {
  background-color: white;
}

/* Input obbligatori */
input:required {
  border-left: 4px solid red;
}

/* Input validi secondo i vincoli HTML5 */
input:valid {
  border-color: green;
}

/* Input non validi secondo i vincoli HTML5 */
input:invalid {
  border-color: red;
}
```

## Pseudo-classi strutturali

Le pseudo-classi strutturali selezionano elementi in base alla loro posizione nella struttura del documento.

### Selettori per posizione

```css
/* Primo figlio di un elemento */
li:first-child {
  font-weight: bold;
}

/* Ultimo figlio di un elemento */
li:last-child {
  border-bottom: none;
}

/* Elemento che non ha figli (è vuoto) */
div:empty {
  display: none;
}

/* Elemento che è l'unico figlio del suo genitore */
span:only-child {
  font-style: italic;
}

/* Elemento che è l'unico del suo tipo tra i figli del genitore */
img:only-of-type {
  border: 1px solid black;
}

/* Primo elemento di un certo tipo */
h2:first-of-type {
  font-size: 1.5em;
}

/* Ultimo elemento di un certo tipo */
p:last-of-type {
  margin-bottom: 2em;
}
```

### Selettori :nth-child e :nth-of-type

Questi selettori permettono di selezionare elementi in base a formule matematiche.

```css
/* Seleziona ogni secondo elemento figlio */
li:nth-child(2n) {
  background-color: #f0f0f0;
}

/* Equivalente a :nth-child(2n) */
li:nth-child(even) {
  background-color: #f0f0f0;
}

/* Seleziona ogni elemento dispari */
li:nth-child(odd) {
  background-color: #e0e0e0;
}

/* Seleziona il terzo elemento */
li:nth-child(3) {
  color: red;
}

/* Seleziona ogni terzo elemento a partire dal secondo */
li:nth-child(3n+2) {
  font-style: italic;
}

/* Seleziona i primi 5 elementi */
li:nth-child(-n+5) {
  font-weight: bold;
}
```

La differenza tra `:nth-child` e `:nth-of-type` è che il primo conta tutti i figli, indipendentemente dal tipo, mentre il secondo conta solo gli elementi dello stesso tipo.

```css
/* Seleziona ogni secondo paragrafo */
p:nth-of-type(2n) {
  color: blue;
}
```

## Pseudo-elementi

I pseudo-elementi permettono di selezionare e stilizzare parti di un elemento che non sono direttamente accessibili attraverso il DOM. I pseudo-elementi iniziano con doppio due punti (`::`) in CSS3, anche se la sintassi con un singolo due punti (`:`) è ancora supportata per compatibilità.

### ::before e ::after

I pseudo-elementi `::before` e `::after` permettono di inserire contenuto generato prima o dopo il contenuto di un elemento.

```css
/* Aggiunge un'icona prima di ogni link esterno */
a[href^="http"]::before {
  content: "🔗 ";
}

/* Aggiunge una freccia dopo ogni link */
a::after {
  content: " →";
}

/* Crea un elemento decorativo */
.card::before {
  content: "";
  display: block;
  width: 100%;
  height: 5px;
  background-color: blue;
}
```

> **Suggerimento**: La proprietà `content` è obbligatoria per i pseudo-elementi `::before` e `::after`, anche se può essere vuota (`content: ""`). Questi pseudo-elementi sono elementi inline di default, ma possono essere modificati con la proprietà `display`.

### ::first-letter e ::first-line

Questi pseudo-elementi permettono di stilizzare la prima lettera o la prima riga di un blocco di testo.

```css
/* Stilizza la prima lettera di un paragrafo */
p::first-letter {
  font-size: 2em;
  font-weight: bold;
  color: darkred;
  float: left;
  margin-right: 5px;
}

/* Stilizza la prima riga di un paragrafo */
p::first-line {
  font-variant: small-caps;
}
```

### ::selection

Il pseudo-elemento `::selection` permette di stilizzare il testo selezionato dall'utente.

```css
/* Cambia il colore del testo selezionato */
::selection {
  background-color: yellow;
  color: black;
}

/* Stilizzazione specifica per un elemento */
p::selection {
  background-color: lightblue;
}
```

## Differenze tra pseudo-classi e pseudo-elementi

| Pseudo-classi | Pseudo-elementi |
|---------------|------------------|
| Selezionano elementi in base al loro stato o posizione | Selezionano parti di un elemento |
| Iniziano con `:` | Iniziano con `::` (CSS3) o `:` (CSS2) |
| Possono essere concatenate (`:first-child:hover`) | Non possono essere concatenati tra loro |
| Non creano nuovi elementi virtuali | Creano elementi virtuali non presenti nel DOM |

## Combinare pseudo-classi e pseudo-elementi

È possibile combinare pseudo-classi e pseudo-elementi per creare selettori più specifici e potenti.

```css
/* Aggiunge un'icona prima dei link al passaggio del mouse */
a:hover::before {
  content: "👉 ";
}

/* Stilizza la prima lettera del primo paragrafo */
p:first-of-type::first-letter {
  font-size: 3em;
  color: darkred;
}

/* Aggiunge un indicatore dopo gli input non validi */
input:invalid::after {
  content: " ⚠️";
  color: red;
}
```

## Best Practice

- **Usare pseudo-classi per migliorare l'usabilità**: Le pseudo-classi come `:hover`, `:focus` e `:active` migliorano il feedback visivo per gli utenti.
- **Preferire CSS a JavaScript quando possibile**: Molte interazioni semplici possono essere gestite con pseudo-classi invece di JavaScript.
- **Attenzione alla compatibilità**: Alcune pseudo-classi e pseudo-elementi più recenti potrebbero non essere supportati in browser più vecchi.
- **Usare `::before` e `::after` per elementi decorativi**: Questi pseudo-elementi sono ideali per aggiungere elementi decorativi senza appesantire l'HTML.
- **Documentare l'uso di selettori complessi**: Quando si utilizzano formule complesse con `:nth-child()`, aggiungere commenti per spiegare il loro funzionamento.

## Suggerimenti

> **Suggerimento**: Per verificare il supporto di una pseudo-classe o pseudo-elemento nei vari browser, consultare il sito [Can I Use](https://caniuse.com/).

> **Suggerimento**: Quando si utilizzano i pseudo-elementi `::before` e `::after`, ricordarsi che non funzionano con elementi che non possono avere contenuto, come `<img>`, `<input>` o `<br>`.

## Domande di autovalutazione

1. Qual è la differenza principale tra pseudo-classi e pseudo-elementi?
2. Come si seleziona ogni terzo elemento di una lista?
3. Perché è importante l'ordine delle pseudo-classi `:link`, `:visited`, `:hover` e `:active`?
4. Come si può creare un effetto di prima lettera grande (drop cap) in un paragrafo?
5. Quali sono le limitazioni dei pseudo-elementi `::before` e `::after`?

## Esercizi proposti

1. **Esercizio base**: Crea un menu di navigazione che cambi colore al passaggio del mouse e mostri un'animazione quando un elemento è attivo.

2. **Esercizio intermedio**: Implementa una tabella a righe alternate utilizzando `:nth-child` e aggiungi effetti di hover per migliorare la leggibilità.

3. **Esercizio avanzato**: Crea un form con validazione visiva utilizzando le pseudo-classi `:valid`, `:invalid`, `:required` e i pseudo-elementi per mostrare messaggi di errore personalizzati.

---

- [📑 Indice](../README.md)
- [⬅️ Specificità e cascata](04_Specificità_e_cascata.md)
- [➡️ Concetto di box model](<../03. Il Box Model/01_Concetto_di_box_model.md>)