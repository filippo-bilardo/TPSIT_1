# Specificità e Cascata in CSS

## Introduzione

La specificità e la cascata sono concetti fondamentali in CSS che determinano quali stili vengono applicati quando più regole si riferiscono allo stesso elemento. Comprendere questi meccanismi è essenziale per scrivere CSS efficace e prevedibile, evitando conflitti di stile indesiderati.

## La Cascata

La "C" in CSS sta per "Cascading" (a cascata). Questo termine descrive il processo con cui il browser determina quali stili applicare quando più regole si sovrappongono. La cascata segue un ordine preciso di priorità basato su:

1. **Origine e importanza**
2. **Specificità**
3. **Ordine di apparizione**

### Origine e Importanza

Le regole CSS possono provenire da diverse origini, in ordine crescente di priorità:

1. **Stili predefiniti del browser** (user agent stylesheet)
2. **Stili dell'utente** (impostazioni personalizzate del browser)
3. **Stili dell'autore** (il CSS scritto dallo sviluppatore)

La parola chiave `!important` può modificare questa gerarchia, dando priorità assoluta a una regola:

```css
p {
  color: blue !important; /* Questa regola avrà la precedenza */
}
```

> **Attenzione**: L'uso di `!important` è generalmente sconsigliato perché complica la manutenzione del codice. È preferibile utilizzare selettori più specifici quando possibile.

## Specificità

La specificità è un peso assegnato a ciascun selettore CSS che determina quale regola viene applicata quando più selettori puntano allo stesso elemento.

### Come si Calcola la Specificità

La specificità viene calcolata come un valore a quattro parti (a,b,c,d), dove:

- **a**: 1 se lo stile è inline, 0 altrimenti
- **b**: numero di selettori ID
- **c**: numero di selettori di classe, attributi e pseudo-classi
- **d**: numero di selettori di elemento e pseudo-elementi

### Esempi di Specificità

```css
/* Specificità: 0,0,0,1 */
p {
  color: black;
}

/* Specificità: 0,0,1,0 */
.text {
  color: blue;
}

/* Specificità: 0,1,0,0 */
#header {
  color: green;
}

/* Specificità: 0,0,1,1 */
p.text {
  color: red;
}

/* Specificità: 0,1,0,1 */
#header p {
  color: purple;
}
```

### Tabella di Specificità

| Selettore | Specificità | Valore |
|-----------|-------------|--------|
| `h1` | 0,0,0,1 | 1 |
| `h1 + p` | 0,0,0,2 | 2 |
| `.classe` | 0,0,1,0 | 10 |
| `#id` | 0,1,0,0 | 100 |
| `style=""` (inline) | 1,0,0,0 | 1000 |

## Ordine di Apparizione

Se due regole hanno la stessa specificità, viene applicata quella che appare per ultima nel codice CSS:

```css
p {
  color: red;
}

/* Questa regola avrà la precedenza perché appare dopo */
p {
  color: blue;
}
```

## Ereditarietà

L'ereditarietà è un meccanismo attraverso il quale alcune proprietà CSS vengono trasmesse dagli elementi genitori ai loro discendenti.

### Proprietà che si Ereditano

Alcune proprietà si ereditano naturalmente:
- `color`
- `font-family`
- `font-size`
- `line-height`
- `text-align`
- `visibility`

### Proprietà che Non si Ereditano

Altre proprietà non si ereditano:
- `margin`
- `padding`
- `border`
- `background`
- `width`
- `height`

### Forzare l'Ereditarietà

È possibile forzare l'ereditarietà di una proprietà utilizzando il valore `inherit`:

```css
.child {
  border: inherit; /* Eredita il bordo dal genitore */
}
```

## Selettori Universali e Combinatori

Il selettore universale (`*`) e i combinatori (come `>`, `+`, `~`) non influenzano la specificità:

```css
/* Specificità: 0,0,0,1 */
p {
  color: black;
}

/* Specificità: 0,0,0,2 (solo due selettori di elemento) */
div p {
  color: red;
}
```

## Strategie per Gestire la Specificità

### 1. Mantenere Bassa la Specificità

Utilizzare selettori semplici quando possibile:

```css
/* Preferire questo */
.button {
  background-color: blue;
}

/* Piuttosto che questo */
div.container button.button {
  background-color: blue;
}
```

### 2. Utilizzare Classi invece di ID

Le classi offrono un buon equilibrio tra specificità e riutilizzabilità:

```css
/* Preferire questo */
.header {
  background-color: black;
}

/* Piuttosto che questo */
#header {
  background-color: black;
}
```

### 3. Evitare `!important`

Utilizzare `!important` solo come ultima risorsa, preferendo selettori più specifici.

### 4. Organizzare il CSS in Modo Logico

Organizzare il CSS in modo che le regole più generiche vengano prima e quelle più specifiche dopo.

## Metodologie CSS

Esistono diverse metodologie che aiutano a gestire la specificità e la cascata:

### BEM (Block Element Modifier)

```css
.block {}
.block__element {}
.block--modifier {}

/* Esempio */
.button {}
.button__icon {}
.button--primary {}
```

### SMACSS (Scalable and Modular Architecture for CSS)

Divide il CSS in categorie:
- Base
- Layout
- Module
- State
- Theme

### OOCSS (Object Oriented CSS)

Separa la struttura dall'aspetto:

```css
.button { /* Struttura */ }
.skin-blue { /* Aspetto */ }
```

## Strumenti di Debug

Per risolvere problemi di specificità e cascata:

1. **DevTools del browser**: Ispezionare gli elementi per vedere quali regole vengono applicate e quali vengono sovrascritte
2. **Validatori CSS**: Identificare errori di sintassi
3. **Linter CSS**: Rilevare potenziali problemi di specificità

## Esercizi Pratici

1. Crea un foglio di stile con regole in conflitto e analizza quale viene applicata
2. Modifica la specificità di un selettore per cambiare il comportamento della cascata
3. Sperimenta con l'ereditarietà creando una gerarchia di elementi
4. Implementa una piccola interfaccia utilizzando la metodologia BEM

## Risorse Aggiuntive

- [MDN Web Docs: Specificità](https://developer.mozilla.org/en-US/docs/Web/CSS/Specificity)
- [MDN Web Docs: Cascata](https://developer.mozilla.org/en-US/docs/Web/CSS/Cascade)
- [CSS-Tricks: Specifics on CSS Specificity](https://css-tricks.com/specifics-on-css-specificity/)
- [Specificity Calculator](https://specificity.keegan.st/)

## Navigazione del Corso
- [📑 Indice](../README.md)
- [⬅️ Box Model](./06-BoxModel.md)
- [➡️ Layout con CSS](../05-LayoutCSS/README.md)