# Selettori avanzati (attributo, pseudo-classi, pseudo-elementi)

## Indice dei contenuti

- [Selettori di attributo](#selettori-di-attributo)
  - [Sintassi di base](#sintassi-di-base-attributo)
  - [Selettori di attributo avanzati](#selettori-di-attributo-avanzati)
  - [Esempi pratici](#esempi-pratici-attributo)
- [Pseudo-classi](#pseudo-classi)
  - [Pseudo-classi di interazione](#pseudo-classi-di-interazione)
  - [Pseudo-classi strutturali](#pseudo-classi-strutturali)
  - [Pseudo-classi di stato](#pseudo-classi-di-stato)
  - [Esempi pratici](#esempi-pratici-pseudo-classi)
- [Pseudo-elementi](#pseudo-elementi)
  - [Sintassi](#sintassi-pseudo-elementi)
  - [Pseudo-elementi comuni](#pseudo-elementi-comuni)
  - [Esempi pratici](#esempi-pratici-pseudo-elementi)
- [Combinare selettori avanzati](#combinare-selettori-avanzati)
- [Casi d'uso reali](#casi-duso-reali)
- [Considerazioni sulla specificità](#considerazioni-sulla-specificità)
- [Domande di autovalutazione](#domande-di-autovalutazione)
- [Esercizi pratici](#esercizi-pratici)
- [Risorse aggiuntive](#risorse-aggiuntive)

## Selettori di attributo

I selettori di attributo permettono di selezionare elementi HTML in base ai loro attributi e valori. Sono estremamente potenti per selezionare elementi senza dover aggiungere classi o ID extra.

### Sintassi di base {#sintassi-di-base-attributo}

La sintassi di base per i selettori di attributo è:

```css
[attributo] {
  /* stili */
}
```

Questo seleziona qualsiasi elemento che ha l'attributo specificato, indipendentemente dal suo valore.

Esempio:

```css
[disabled] {
  cursor: not-allowed;
  opacity: 0.7;
}
```

Questo applica gli stili a tutti gli elementi che hanno l'attributo `disabled`, come `<button disabled>` o `<input disabled>`.

### Selettori di attributo avanzati

I selettori di attributo possono essere più specifici:

1. **Corrispondenza esatta** `[attr="valore"]`:
   ```css
   [type="submit"] {
     background-color: #4CAF50;
     color: white;
   }
   ```

2. **Corrispondenza parziale con spazi separati** `[attr~="valore"]`:
   ```css
   [class~="error"] {
     color: red;
   }
   ```
   Seleziona elementi con classe "error" (ma non "error-message" senza spazi).

3. **Corrispondenza con prefisso** `[attr|="valore"]`:
   ```css
   [lang|="en"] {
     font-family: 'Arial', sans-serif;
   }
   ```
   Seleziona elementi con `lang="en"` o che iniziano con `"en-"` (come `lang="en-US"`).

4. **Corrispondenza con inizio** `[attr^="valore"]`:
   ```css
   [href^="https"] {
     background-image: url('secure-icon.png');
     padding-left: 20px;
   }
   ```
   Seleziona link che iniziano con "https".

5. **Corrispondenza con fine** `[attr$="valore"]`:
   ```css
   [href$=".pdf"] {
     background-image: url('pdf-icon.png');
     padding-left: 20px;
   }
   ```
   Seleziona link che terminano con ".pdf".

6. **Corrispondenza con sottostringa** `[attr*="valore"]`:
   ```css
   [href*="example"] {
     color: purple;
   }
   ```
   Seleziona link che contengono "example" in qualsiasi posizione.

7. **Corrispondenza con sensibilità alle maiuscole/minuscole** `[attr="valore" i]`:
   ```css
   [title="hello" i] {
     color: blue;
   }
   ```
   Seleziona elementi con `title="hello"`, `title="Hello"`, `title="HELLO"`, ecc.

### Esempi pratici {#esempi-pratici-attributo}

1. **Stilizzare input in base al tipo**:
   ```css
   input[type="text"] {
     border: 1px solid #ddd;
     padding: 8px;
     border-radius: 4px;
   }
   
   input[type="checkbox"] {
     margin-right: 5px;
     transform: scale(1.2);
   }
   ```

2. **Stilizzare link esterni**:
   ```css
   a[href^="http"]:not([href*="miodominio.com"]) {
     color: #0066cc;
     background-image: url('external-link.svg');
     background-position: right center;
     background-repeat: no-repeat;
     padding-right: 20px;
   }
   ```

3. **Stilizzare link a documenti**:
   ```css
   a[href$=".pdf"] {
     background-image: url('pdf-icon.svg');
     background-position: left center;
     background-repeat: no-repeat;
     padding-left: 22px;
   }
   
   a[href$=".doc"], a[href$=".docx"] {
     background-image: url('word-icon.svg');
     background-position: left center;
     background-repeat: no-repeat;
     padding-left: 22px;
   }
   ```

> **Suggerimento**: I selettori di attributo sono particolarmente utili quando lavori con HTML che non puoi modificare direttamente, come contenuti generati da CMS o librerie di terze parti.

## Pseudo-classi

Le pseudo-classi selezionano elementi in base a stati, posizioni o relazioni che non possono essere espressi con selettori semplici. Sono precedute da due punti (`:`). 

### Pseudo-classi di interazione

Queste pseudo-classi si attivano in base all'interazione dell'utente:

1. **:hover** - Quando il mouse è sopra l'elemento:
   ```css
   a:hover {
     text-decoration: underline;
     color: #ff6600;
   }
   ```

2. **:active** - Quando l'elemento è attivato (es. cliccato):
   ```css
   button:active {
     transform: translateY(1px);
     box-shadow: none;
   }
   ```

3. **:focus** - Quando l'elemento ha il focus (es. tramite tab):
   ```css
   input:focus {
     border-color: #4a90e2;
     box-shadow: 0 0 0 3px rgba(74, 144, 226, 0.3);
     outline: none;
   }
   ```

4. **:visited** - Per link già visitati:
   ```css
   a:visited {
     color: #551a8b;
   }
   ```

### Pseudo-classi strutturali

Queste pseudo-classi selezionano elementi in base alla loro posizione nella struttura del documento:

1. **:first-child** - Il primo figlio del suo genitore:
   ```css
   li:first-child {
     font-weight: bold;
   }
   ```

2. **:last-child** - L'ultimo figlio del suo genitore:
   ```css
   li:last-child {
     border-bottom: none;
   }
   ```

3. **:nth-child(n)** - L'ennesimo figlio del suo genitore:
   ```css
   /* Seleziona il terzo elemento */
   li:nth-child(3) {
     background-color: #f0f0f0;
   }
   
   /* Seleziona elementi pari */
   li:nth-child(even) {
     background-color: #f9f9f9;
   }
   
   /* Seleziona elementi dispari */
   li:nth-child(odd) {
     background-color: #ffffff;
   }
   
   /* Formula: an+b */
   /* Seleziona ogni terzo elemento, iniziando dal secondo */
   li:nth-child(3n+2) {
     color: red;
   }
   ```

4. **:nth-last-child(n)** - Come nth-child ma conta dal fondo:
   ```css
   /* Seleziona il penultimo elemento */
   li:nth-last-child(2) {
     font-style: italic;
   }
   ```

5. **:only-child** - L'unico figlio del suo genitore:
   ```css
   li:only-child {
     list-style-type: none;
   }
   ```

6. **:nth-of-type(n)** - L'ennesimo elemento del suo tipo:
   ```css
   /* Il secondo paragrafo */
   p:nth-of-type(2) {
     font-size: 1.2em;
   }
   ```

7. **:empty** - Elementi senza figli:
   ```css
   div:empty {
     display: none;
   }
   ```

### Pseudo-classi di stato

Queste pseudo-classi riflettono lo stato dell'elemento:

1. **:checked** - Input selezionati (checkbox, radio):
   ```css
   input[type="checkbox"]:checked + label {
     font-weight: bold;
   }
   ```

2. **:disabled** - Elementi disabilitati:
   ```css
   button:disabled {
     opacity: 0.5;
     cursor: not-allowed;
   }
   ```

3. **:enabled** - Elementi abilitati:
   ```css
   input:enabled {
     background-color: white;
   }
   ```

4. **:valid** e **:invalid** - Per input con validazione:
   ```css
   input:valid {
     border-color: green;
   }
   
   input:invalid {
     border-color: red;
   }
   ```

5. **:required** e **:optional** - Per input obbligatori o opzionali:
   ```css
   input:required {
     border-left: 3px solid red;
   }
   ```

### Esempi pratici {#esempi-pratici-pseudo-classi}

1. **Tabella a righe alternate**:
   ```css
   tr:nth-child(odd) {
     background-color: #f2f2f2;
   }
   ```

2. **Evidenziare il primo paragrafo**:
   ```css
   p:first-of-type {
     font-size: 1.2em;
     font-weight: bold;
   }
   ```

3. **Stilizzare un form interattivo**:
   ```css
   input:focus {
     border-color: #4a90e2;
     box-shadow: 0 0 0 3px rgba(74, 144, 226, 0.3);
   }
   
   input:valid {
     border-left: 4px solid green;
   }
   
   input:invalid:not(:focus):not(:placeholder-shown) {
     border-left: 4px solid red;
   }
   
   button:hover:not(:disabled) {
     background-color: #45a049;
   }
   ```

> **Suggerimento**: Le pseudo-classi possono essere combinate per creare selettori molto specifici. Ad esempio, `a:hover:not(.disabled)` seleziona i link al passaggio del mouse che non hanno la classe "disabled".

## Pseudo-elementi

I pseudo-elementi permettono di stilizzare parti specifiche di un elemento o di inserire contenuto prima o dopo l'elemento stesso. Sono preceduti da due punti doppi (`::`), anche se la sintassi con un solo due punti (`:`) è ancora supportata per compatibilità.

### Sintassi {#sintassi-pseudo-elementi}

```css
selector::pseudo-element {
  property: value;
}
```

### Pseudo-elementi comuni

1. **::before** - Crea un elemento prima del contenuto dell'elemento selezionato:
   ```css
   .quote::before {
     content: "\201C"; /* Virgoletta aperta */
     font-size: 2em;
     color: #888;
   }
   ```

2. **::after** - Crea un elemento dopo il contenuto dell'elemento selezionato:
   ```css
   .external-link::after {
     content: " \2197"; /* Freccia diagonale */
     font-size: 0.8em;
   }
   ```

3. **::first-letter** - Seleziona la prima lettera del testo:
   ```css
   p::first-letter {
     font-size: 2em;
     font-weight: bold;
     float: left;
     margin-right: 5px;
   }
   ```

4. **::first-line** - Seleziona la prima riga del testo:
   ```css
   p::first-line {
     font-variant: small-caps;
   }
   ```

5. **::selection** - Seleziona la porzione di testo selezionata dall'utente:
   ```css
   ::selection {
     background-color: #ffb7b7;
     color: #333;
   }
   ```

6. **::placeholder** - Seleziona il testo placeholder negli input:
   ```css
   input::placeholder {
     color: #aaa;
     font-style: italic;
   }
   ```

### Esempi pratici {#esempi-pratici-pseudo-elementi}

1. **Aggiungere icone ai link**:
   ```css
   .pdf-link::before {
     content: "";
     display: inline-block;
     width: 16px;
     height: 16px;
     background-image: url('pdf-icon.svg');
     background-size: contain;
     margin-right: 5px;
     vertical-align: middle;
   }
   ```

2. **Creare tooltip personalizzati**:
   ```css
   .tooltip {
     position: relative;
   }
   
   .tooltip::after {
     content: attr(data-tooltip);
     position: absolute;
     bottom: 100%;
     left: 50%;
     transform: translateX(-50%);
     background-color: #333;
     color: white;
     padding: 5px 10px;
     border-radius: 4px;
     font-size: 0.8em;
     white-space: nowrap;
     opacity: 0;
     visibility: hidden;
     transition: opacity 0.3s, visibility 0.3s;
   }
   
   .tooltip:hover::after {
     opacity: 1;
     visibility: visible;
   }
   ```

3. **Creare un effetto di capolettera**:
   ```css
   p.intro::first-letter {
     font-size: 3em;
     font-weight: bold;
     float: left;
     line-height: 0.8;
     margin-right: 8px;
     color: #c00;
   }
   ```

4. **Aggiungere decorazioni alle intestazioni**:
   ```css
   h2::before, h2::after {
     content: "";
     display: inline-block;
     width: 30px;
     height: 1px;
     background-color: #333;
     vertical-align: middle;
     margin: 0 10px;
   }
   ```

> **Suggerimento**: I pseudo-elementi `::before` e `::after` richiedono sempre la proprietà `content`, anche se è vuota (`content: ""`). Sono elementi inline di default, ma possono essere cambiati in block o altri display.

## Combinare selettori avanzati

I selettori avanzati possono essere combinati per creare selezioni molto specifiche:

```css
/* Link esterni che terminano con .pdf al passaggio del mouse */
a[href^="http"]:not([href*="miodominio.com"])[href$=".pdf"]:hover {
  background-color: #ffecec;
}

/* Input di tipo email validi con focus */
input[type="email"]:valid:focus {
  border-color: green;
  box-shadow: 0 0 0 3px rgba(0, 128, 0, 0.2);
}

/* Prima cella di ogni riga pari in una tabella */
tr:nth-child(even) td:first-child {
  font-weight: bold;
}
```

## Casi d'uso reali

1. **Stilizzare link in base al tipo di contenuto**:
   ```css
   /* Link a documenti */
   a[href$=".pdf"]::after { content: " (PDF)"; }
   a[href$=".doc"]::after, a[href$=".docx"]::after { content: " (Word)"; }
   a[href$=".xls"]::after, a[href$=".xlsx"]::after { content: " (Excel)"; }
   
   /* Link esterni */
   a[href^="http"]:not([href*="miodominio.com"])::after {
     content: " ↗";
   }
   ```

2. **Form con feedback visivo**:
   ```css
   input:required::after {
     content: "*";
     color: red;
   }
   
   input:valid {
     border-color: green;
   }
   
   input:invalid:not(:focus):not(:placeholder-shown) {
     border-color: red;
   }
   ```

3. **Tabella di dati avanzata**:
   ```css
   /* Intestazione fissa */
   thead th {
     position: sticky;
     top: 0;
     background-color: #333;
     color: white;
   }
   
   /* Righe alternate */
   tbody tr:nth-child(odd) {
     background-color: #f9f9f9;
   }
   
   /* Evidenzia riga al passaggio del mouse */
   tbody tr:hover {
     background-color: #f0f0f0;
   }
   
   /* Prima colonna in grassetto */
   tbody td:first-child {
     font-weight: bold;
   }
   ```

## Considerazioni sulla specificità

I selettori avanzati aumentano la specificità, il che può influenzare la cascata CSS:

- **Selettori di attributo**: Hanno la stessa specificità dei selettori di classe (0,1,0)
- **Pseudo-classi**: Hanno la stessa specificità dei selettori di classe (0,1,0)
- **Pseudo-elementi**: Hanno la stessa specificità dei selettori di elemento (0,0,1)

Esempio di confronto di specificità:

```css
/* Specificità: 0,1,1 (una classe, un elemento) */
.menu li {
  color: blue;
}

/* Specificità: 0,1,1 (un attributo, un elemento) */
li[class="item"] {
  color: red;
}

/* Specificità: 0,2,1 (due pseudo-classi, un elemento) */
li:first-child:hover {
  color: green;
}
```

> **Suggerimento**: Evita di creare selettori eccessivamente complessi. Selettori troppo specifici possono rendere difficile la manutenzione del CSS e causare problemi di specificità.

## Domande di autovalutazione

1. Qual è la differenza tra `[attr^="val"]` e `[attr|="val"]`?
2. Come si seleziona un elemento che è sia il primo figlio che di tipo paragrafo?
3. Quali sono le differenze principali tra pseudo-classi e pseudo-elementi?
4. Come si può utilizzare `::before` per aggiungere contenuto decorativo a un elemento?
5. Quali pseudo-classi possono essere utilizzate per stilizzare un form in base allo stato di validazione?
6. Come si selezionano tutti i link esterni in una pagina?
7. Qual è la differenza tra `:nth-child(n)` e `:nth-of-type(n)`?
8. Come influiscono i selettori avanzati sulla specificità CSS?

## Esercizi pratici

1. **Creazione di una galleria di immagini**:
   - Usa `:nth-child()` per creare un layout a griglia con spaziature diverse per elementi in posizioni specifiche
   - Aggiungi overlay con `::before` o `::after` al passaggio del mouse

2. **Form interattivo avanzato**:
   - Stilizza input in base al tipo usando selettori di attributo
   - Aggiungi feedback visivo per stati validi/invalidi con pseudo-classi
   - Crea tooltip personalizzati con pseudo-elementi

3. **Menu di navigazione**:
   - Crea un menu con indicatori per link attivi usando pseudo-elementi
   - Aggiungi icone per link esterni o link a sezioni specifiche
   - Implementa effetti hover avanzati

4. **Tabella di dati responsiva**:
   - Usa pseudo-classi strutturali per stilizzare righe e colonne
   - Implementa etichette per visualizzazione mobile usando `::before`
   - Aggiungi ordinamento visivo con pseudo-elementi

5. **Sistema di citazioni**:
   - Crea un sistema per citazioni con virgolette personalizzate usando `::before` e `::after`
   - Implementa stili diversi per citazioni annidate

## Risorse aggiuntive

1. **Documentazione ufficiale**:
   - [MDN Web Docs - Selettori CSS](https://developer.mozilla.org/it/docs/Web/CSS/CSS_Selectors)
   - [MDN Web Docs - Pseudo-classi](https://developer.mozilla.org/it/docs/Web/CSS/Pseudo-classes)
   - [MDN Web Docs - Pseudo-elementi](https://developer.mozilla.org/it/docs/Web/CSS/Pseudo-elements)

2. **Tutorial e guide**:
   - [CSS-Tricks - A Complete Guide to CSS Pseudo-Classes and Pseudo-Elements](https://css-tricks.com/pseudo-class-selectors/)
   - [Smashing Magazine - Understanding CSS Selectors](https://www.smashingmagazine.com/2009/08/taming-advanced-css-selectors/)

3. **Strumenti**:
   - [Selectors Explained](https://kittygiraudel.github.io/selectors-explained/) - Spiega la specificità dei selettori in linguaggio naturale
   - [CSS Diner](https://flukeout.github.io/) - Gioco per imparare i selettori CSS

---

**Navigazione**
- [📑 Indice](../README.md)
- [⬅️ 01. Selettori di base](01_Selettori_di_base.md)
- [➡️ 03. Selettori_combinatori](03_Selettori_combinatori.md)
