# Dimensionamento degli Elementi

## Indice dei contenuti

- [Introduzione](#introduzione)
- [Proprietà di dimensionamento](#proprietà-di-dimensionamento)
  - [width e height](#width-e-height)
  - [min-width e min-height](#min-width-e-min-height)
  - [max-width e max-height](#max-width-e-max-height)
- [Unità di misura](#unità-di-misura)
  - [Unità assolute](#unità-assolute)
  - [Unità relative](#unità-relative)
  - [Percentuali](#percentuali)
- [Dimensionamento responsive](#dimensionamento-responsive)
  - [Viewport units](#viewport-units)
  - [Tecniche di dimensionamento fluido](#tecniche-di-dimensionamento-fluido)
- [Best practices](#best-practices)
- [Esempi pratici](#esempi-pratici)
- [Domande di autovalutazione](#domande-di-autovalutazione)
- [Esercizi](#esercizi)
- [Risorse aggiuntive](#risorse-aggiuntive)

## Introduzione

Il dimensionamento degli elementi è un aspetto fondamentale del layout CSS. Comprendere come impostare correttamente le dimensioni degli elementi è essenziale per creare layout responsive e visivamente equilibrati.

## Proprietà di dimensionamento

### width e height

Le proprietà `width` e `height` definiscono rispettivamente la larghezza e l'altezza di un elemento.

```css
.box {
  width: 300px;
  height: 200px;
}
```

È importante notare che queste proprietà si applicano solo al contenuto dell'elemento quando si utilizza `box-sizing: content-box` (impostazione predefinita). Se si utilizza `box-sizing: border-box`, le dimensioni includono padding e bordo.

### min-width e min-height

Queste proprietà definiscono le dimensioni minime di un elemento, impedendo che diventi più piccolo di un certo valore, anche quando il contenitore si restringe.

```css
.responsive-element {
  width: 100%;
  min-width: 250px; /* Non sarà mai più stretto di 250px */
}
```

### max-width e max-height

Queste proprietà limitano le dimensioni massime di un elemento, impedendo che diventi troppo grande, anche quando il contenitore si espande.

```css
.container {
  width: 100%;
  max-width: 1200px; /* Non sarà mai più largo di 1200px */
}

.image {
  max-width: 100%; /* Immagine responsive che non supera la larghezza del contenitore */
  height: auto; /* Mantiene le proporzioni */
}
```

## Unità di misura

### Unità assolute

Le unità assolute hanno dimensioni fisse e non cambiano in base al contesto:

- `px` (pixel): l'unità più comune per dimensioni precise
- `pt` (punti): utilizzata principalmente per la stampa (1pt = 1/72 di pollice)
- `cm`, `mm`, `in` (centimetri, millimetri, pollici): raramente utilizzate nel web

```css
.fixed-size {
  width: 200px;
  height: 150px;
}
```

### Unità relative

Le unità relative cambiano in base a un valore di riferimento:

- `em`: relativa alla dimensione del font dell'elemento
- `rem`: relativa alla dimensione del font dell'elemento root (html)
- `ch`: larghezza del carattere "0" del font corrente

```css
.relative-size {
  width: 20em; /* 20 volte la dimensione del font dell'elemento */
  padding: 1.5rem; /* 1.5 volte la dimensione del font root */
}
```

### Percentuali

Le percentuali sono relative alle dimensioni del contenitore genitore:

```css
.percentage-width {
  width: 50%; /* Metà della larghezza del genitore */
}

.aspect-ratio {
  width: 100%;
  height: 0;
  padding-bottom: 56.25%; /* Rapporto 16:9 */
  position: relative;
}
```

## Dimensionamento responsive

### Viewport units

Le unità viewport sono relative alle dimensioni della finestra del browser:

- `vw`: 1% della larghezza del viewport
- `vh`: 1% dell'altezza del viewport
- `vmin`: 1% della dimensione più piccola del viewport (larghezza o altezza)
- `vmax`: 1% della dimensione più grande del viewport (larghezza o altezza)

```css
.hero-section {
  height: 100vh; /* Altezza pari al 100% dell'altezza del viewport */
  width: 100vw; /* Larghezza pari al 100% della larghezza del viewport */
}

.responsive-font {
  font-size: calc(16px + 1vw); /* Font size responsive */
}
```

### Tecniche di dimensionamento fluido

Combinare diverse unità di misura per creare layout fluidi:

```css
.fluid-container {
  width: 90%; /* Percentuale della larghezza del genitore */
  max-width: 1200px; /* Limite massimo */
  margin: 0 auto; /* Centraggio orizzontale */
}

.fluid-typography {
  font-size: calc(1rem + 0.5vw); /* Combinazione di unità fisse e relative */
}
```

## Best practices

1. **Usa box-sizing: border-box** per un dimensionamento più intuitivo
   ```css
   * {
     box-sizing: border-box;
   }
   ```

2. **Preferisci dimensioni relative** per layout responsive
   ```css
   .container {
     width: 100%;
     max-width: 1200px;
   }
   ```

3. **Imposta sempre max-width: 100%** per le immagini
   ```css
   img {
     max-width: 100%;
     height: auto;
   }
   ```

4. **Usa min-height invece di height fissa** quando possibile
   ```css
   .card {
     min-height: 200px;
   }
   ```

5. **Combina unità diverse** per layout flessibili ma controllati
   ```css
   .element {
     width: calc(100% - 2rem);
     margin: 0 1rem;
   }
   ```

## Esempi pratici

### Card responsive

```css
.card-container {
  display: flex;
  flex-wrap: wrap;
  gap: 20px;
}

.card {
  flex: 1 1 300px; /* Grow, shrink, basis */
  min-width: 250px;
  max-width: 100%;
  padding: 1.5rem;
  border: 1px solid #ddd;
  border-radius: 8px;
}
```

### Immagine con rapporto d'aspetto fisso

```css
.image-container {
  width: 100%;
  height: 0;
  padding-bottom: 75%; /* Rapporto 4:3 */
  position: relative;
  overflow: hidden;
}

.image-container img {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  object-fit: cover;
}
```

## Domande di autovalutazione

1. Qual è la differenza tra `width: 100%` e `width: 100vw`?
2. Come si può mantenere un rapporto d'aspetto fisso per un elemento usando solo CSS?
3. Quando è preferibile usare `min-width` invece di `width`?
4. Quali sono i vantaggi di usare unità relative rispetto a quelle assolute?
5. Come influisce `box-sizing: border-box` sul dimensionamento degli elementi?

## Esercizi

1. Crea un contenitore che sia sempre centrato orizzontalmente, abbia una larghezza massima di 1200px e mantenga un margine del 5% dai bordi dello schermo su dispositivi più piccoli.

2. Implementa una galleria di immagini responsive con 3 immagini per riga su desktop, 2 su tablet e 1 su mobile, mantenendo un rapporto d'aspetto 16:9 per tutte le immagini.

3. Crea un elemento hero che occupi sempre esattamente l'altezza del viewport, con un titolo centrato che utilizzi una dimensione del font responsive.

4. Implementa una card che abbia una larghezza fissa di 300px su desktop ma diventi fluida (100% della larghezza disponibile) su mobile (sotto i 768px).

## Risorse aggiuntive

- [MDN Web Docs: Dimensionamento in CSS](https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_Box_Model/Introduction_to_the_CSS_box_model)
- [CSS-Tricks: A Complete Guide to CSS Units](https://css-tricks.com/the-lengths-of-css/)
- [Responsive Design Cheat Sheet](https://www.responsive-design-cheatsheet.com/)
- [Calc() in CSS](https://developer.mozilla.org/en-US/docs/Web/CSS/calc)

---

[📑 Indice](../README.md)
[⬅️ Collasso dei margini](05_Collasso_dei_margini.md)
[➡️ Concetti di layout](<../04. Layout e Posizionamento/01_Concetti_di_layout.md>)