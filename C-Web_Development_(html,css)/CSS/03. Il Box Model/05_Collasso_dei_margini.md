# Collasso dei margini

## Indice dei contenuti

- [Introduzione al collasso dei margini](#introduzione-al-collasso-dei-margini)
  - [Definizione e comportamento](#definizione-e-comportamento)
  - [Quando si verifica](#quando-si-verifica)
- [Regole del collasso dei margini](#regole-del-collasso-dei-margini)
  - [Margini verticali adiacenti](#margini-verticali-adiacenti)
  - [Margini di elementi genitori e figli](#margini-di-elementi-genitori-e-figli)
  - [Elementi vuoti](#elementi-vuoti)
- [Come evitare il collasso dei margini](#come-evitare-il-collasso-dei-margini)
  - [Utilizzo di padding invece di margin](#utilizzo-di-padding-invece-di-margin)
  - [Aggiunta di bordi o padding](#aggiunta-di-bordi-o-padding)
  - [Utilizzo di display: flex o grid](#utilizzo-di-display-flex-o-grid)
- [Casi d'uso pratici](#casi-duso-pratici)
  - [Layout di paragrafi](#layout-di-paragrafi)
  - [Gestione degli spazi in liste](#gestione-degli-spazi-in-liste)
- [Domande di autovalutazione](#domande-di-autovalutazione)
- [Esercizi pratici](#esercizi-pratici)
- [Risorse aggiuntive](#risorse-aggiuntive)

## Introduzione al collasso dei margini

Il collasso dei margini è un comportamento specifico del CSS che può risultare controintuitivo se non si conoscono le regole che lo governano.

### Definizione e comportamento

Il collasso dei margini è un meccanismo per cui, quando due o più margini verticali (top e bottom) si incontrano, essi si combinano (o "collassano") in un unico margine. L'altezza di questo margine combinato è uguale al valore del margine più grande tra quelli che si incontrano.

```css
/* Esempio di elementi con margini che collasseranno */
.primo-paragrafo {
  margin-bottom: 20px;
}

.secondo-paragrafo {
  margin-top: 15px;
}
/* Il margine risultante tra i due paragrafi sarà di 20px, non 35px */
```

### Quando si verifica

Il collasso dei margini si verifica solo con i margini verticali (top e bottom) e mai con i margini orizzontali (left e right). Inoltre, si verifica solo tra elementi che sono in normale flusso del documento.

## Regole del collasso dei margini

### Margini verticali adiacenti

Quando due elementi block-level sono posizionati uno sopra l'altro, il margine bottom del primo elemento e il margine top del secondo elemento collasseranno.

```html
<div style="margin-bottom: 30px;">Primo elemento</div>
<div style="margin-top: 20px;">Secondo elemento</div>
<!-- La distanza tra i due div sarà di 30px, non 50px -->
```

### Margini di elementi genitori e figli

Se non c'è padding, border, contenuto inline o clearance per separare il margine-top di un elemento block dal margine-top del suo primo figlio block, o il margine-bottom dal margine-bottom del suo ultimo figlio, allora questi margini collasseranno.

```html
<div style="margin-top: 25px;">
  <p style="margin-top: 15px;">Paragrafo figlio</p>
</div>
<!-- Il margine top effettivo sarà di 25px, non 40px -->
```

### Elementi vuoti

Se un elemento è vuoto (non ha contenuto, padding o border), allora il suo margine-top e margine-bottom collasseranno in un unico margine.

```html
<div style="margin-top: 20px; margin-bottom: 30px;"></div>
<!-- Questo div avrà un margine totale di 30px, non 50px -->
```

## Come evitare il collasso dei margini

In alcuni casi, potrebbe essere necessario evitare il collasso dei margini per ottenere il layout desiderato.

### Utilizzo di padding invece di margin

Una soluzione semplice è utilizzare padding invece di margin quando possibile, poiché il padding non collassa mai.

```css
.elemento {
  padding-top: 20px;
  padding-bottom: 20px;
}
```

### Aggiunta di bordi o padding

Aggiungere un border o un padding, anche minimo, impedisce il collasso dei margini tra genitore e figlio.

```css
.genitore {
  margin-top: 20px;
  border-top: 1px solid transparent; /* Impedisce il collasso */
}

.figlio {
  margin-top: 15px;
}
```

### Utilizzo di display: flex o grid

Gli elementi all'interno di un container flex o grid non subiscono il collasso dei margini.

```css
.container {
  display: flex;
  flex-direction: column;
}

.item {
  margin-top: 20px;
  margin-bottom: 20px;
}
/* I margini non collasseranno */
```

## Casi d'uso pratici

### Layout di paragrafi

Il collasso dei margini è particolarmente utile nella formattazione di testo, dove vogliamo mantenere una spaziatura coerente tra paragrafi.

```css
p {
  margin-top: 1em;
  margin-bottom: 1em;
}
/* La distanza tra paragrafi sarà sempre di 1em, non 2em */
```

### Gestione degli spazi in liste

Il collasso dei margini aiuta a mantenere una spaziatura uniforme in liste e menu.

```css
ul {
  margin-top: 1em;
  margin-bottom: 1em;
}

li {
  margin-top: 0.5em;
  margin-bottom: 0.5em;
}
```

## Domande di autovalutazione

1. Cosa si intende per "collasso dei margini" in CSS?
2. In quali direzioni (orizzontale o verticale) si verifica il collasso dei margini?
3. Come si può prevenire il collasso dei margini tra un elemento genitore e il suo primo figlio?
4. Perché il collasso dei margini è utile nella formattazione del testo?
5. Quali proprietà di display impediscono il collasso dei margini?

## Esercizi pratici

1. **Esercizio base**: Crea due div con margini verticali e osserva come collassano. Poi modifica il codice per evitare il collasso.

2. **Esercizio intermedio**: Crea un layout con elementi annidati dove i margini del genitore e del figlio collassano. Implementa tre diverse soluzioni per prevenire il collasso.

3. **Esercizio avanzato**: Progetta un sistema di spaziatura per un blog che utilizzi strategicamente il collasso dei margini per mantenere una spaziatura coerente tra titoli, paragrafi e altri elementi.

## Risorse aggiuntive

- [MDN Web Docs: Collasso dei margini](https://developer.mozilla.org/it/docs/Web/CSS/CSS_Box_Model/Mastering_margin_collapsing)
- [CSS-Tricks: Collasso dei margini in CSS](https://css-tricks.com/what-you-should-know-about-collapsing-margins/)
- [W3C: Box Model - Collasso dei margini](https://www.w3.org/TR/CSS2/box.html#collapsing-margins)

---

- [📑 Indice](../README.md)
- [⬅️ Box-sizing e differenze tra content-box e border-box](04_Box_sizing.md)
- [➡️ Dimensionamento degli elementi](06_Dimensionamento_degli_elementi.md)
