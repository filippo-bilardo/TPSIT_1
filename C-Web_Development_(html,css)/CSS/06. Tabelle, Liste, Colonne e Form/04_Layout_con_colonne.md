# Layout con colonne in CSS

## Indice dei contenuti

- [Introduzione ai layout con colonne](#introduzione-ai-layout-con-colonne)
- [Metodi per creare layout a colonne](#metodi-per-creare-layout-a-colonne)
  - [Utilizzo di float](#utilizzo-di-float)
  - [Utilizzo di Flexbox](#utilizzo-di-flexbox)
  - [Utilizzo di Grid](#utilizzo-di-grid)
  - [Utilizzo di multi-column](#utilizzo-di-multi-column)
- [Sistemi a griglia](#sistemi-a-griglia)
  - [Griglia 12 colonne](#griglia-12-colonne)
  - [Implementazione di una griglia personalizzata](#implementazione-di-una-griglia-personalizzata)
- [Layout responsive con colonne](#layout-responsive-con-colonne)
  - [Media queries e breakpoint](#media-queries-e-breakpoint)
  - [Approccio mobile-first](#approccio-mobile-first)
- [Pattern di layout comuni](#pattern-di-layout-comuni)
  - [Layout a due colonne](#layout-a-due-colonne)
  - [Layout a tre colonne](#layout-a-tre-colonne)
  - [Layout asimmetrici](#layout-asimmetrici)
  - [Layout a colonne variabili](#layout-a-colonne-variabili)
- [Best practice](#best-practice)
- [Domande di autovalutazione](#domande-di-autovalutazione)
- [Esercizi pratici](#esercizi-pratici)
- [Risorse aggiuntive](#risorse-aggiuntive)

## Introduzione ai layout con colonne

I layout a colonne sono fondamentali nel web design moderno, permettendo di organizzare il contenuto in modo ordinato e leggibile. Questi layout consentono di suddividere lo spazio orizzontale della pagina in sezioni distinte, facilitando la presentazione di informazioni correlate ma separate.

Nel corso degli anni, le tecniche per creare layout a colonne si sono evolute significativamente, passando da metodi basati su tabelle HTML (ora considerati obsoleti), a tecniche più moderne come float, flexbox, grid e multi-column.

## Metodi per creare layout a colonne

### Utilizzo di float

Il metodo tradizionale, ancora utile in alcuni contesti:

```css
.container {
  width: 100%;
  overflow: hidden; /* Clearfix */
}

.colonna {
  float: left;
  width: 33.33%;
  padding: 15px;
  box-sizing: border-box;
}

/* Clearfix alternativo */
.container::after {
  content: "";
  display: table;
  clear: both;
}
```

**Vantaggi**:
- Ampio supporto nei browser
- Semplice da implementare

**Svantaggi**:
- Richiede clearfix per evitare problemi di layout
- Difficile da rendere responsive senza molte media queries
- Limitato in termini di allineamento verticale

### Utilizzo di Flexbox

Un approccio moderno e flessibile:

```css
.container {
  display: flex;
  flex-wrap: wrap;
}

.colonna {
  flex: 1;
  padding: 15px;
  min-width: 200px; /* Larghezza minima per responsività */
}
```

**Vantaggi**:
- Allineamento verticale semplice
- Distribuzione dello spazio flessibile
- Ordine degli elementi facilmente modificabile

**Svantaggi**:
- Non ideale per layout complessi a griglia
- Può richiedere polyfill per browser molto vecchi

### Utilizzo di Grid

Il sistema più potente per layout bidimensionali:

```css
.container {
  display: grid;
  grid-template-columns: repeat(3, 1fr); /* 3 colonne di uguale larghezza */
  gap: 20px;
}

.colonna {
  padding: 15px;
}

/* Elemento che occupa più colonne */
.colonna-larga {
  grid-column: span 2;
}
```

**Vantaggi**:
- Controllo preciso su righe e colonne
- Posizionamento avanzato degli elementi
- Gestione semplificata degli spazi tra elementi (gap)

**Svantaggi**:
- Supporto limitato in browser molto vecchi
- Curva di apprendimento più ripida

### Utilizzo di multi-column

Ideale per contenuti testuali:

```css
.container {
  column-count: 3;
  column-gap: 20px;
  column-rule: 1px solid #ddd;
}

/* Elemento che occupa tutte le colonne */
.titolo {
  column-span: all;
}
```

**Vantaggi**:
- Ottimo per testi lunghi
- Flusso automatico del contenuto tra colonne

**Svantaggi**:
- Controllo limitato sul posizionamento degli elementi
- Non ideale per layout complessi con elementi di dimensioni diverse

## Sistemi a griglia

### Griglia 12 colonne

Un approccio comune nei framework CSS:

```css
.container {
  width: 100%;
  display: flex;
  flex-wrap: wrap;
}

/* Base per tutte le colonne */
[class*="col-"] {
  box-sizing: border-box;
  padding: 0 15px;
}

/* Colonne per desktop */
.col-1 { width: 8.33%; }
.col-2 { width: 16.66%; }
.col-3 { width: 25%; }
.col-4 { width: 33.33%; }
.col-5 { width: 41.66%; }
.col-6 { width: 50%; }
.col-7 { width: 58.33%; }
.col-8 { width: 66.66%; }
.col-9 { width: 75%; }
.col-10 { width: 83.33%; }
.col-11 { width: 91.66%; }
.col-12 { width: 100%; }

/* Media query per tablet */
@media (max-width: 768px) {
  .col-md-1 { width: 8.33%; }
  .col-md-2 { width: 16.66%; }
  /* ... e così via */
  .col-md-12 { width: 100%; }
}

/* Media query per mobile */
@media (max-width: 576px) {
  [class*="col-"] {
    width: 100%;
  }
}
```

### Implementazione di una griglia personalizzata

Utilizzando CSS Grid:

```css
.grid {
  display: grid;
  grid-template-columns: repeat(12, 1fr);
  gap: 20px;
}

.span-1 { grid-column: span 1; }
.span-2 { grid-column: span 2; }
/* ... e così via */
.span-12 { grid-column: span 12; }

@media (max-width: 768px) {
  .grid {
    grid-template-columns: repeat(6, 1fr);
  }
  
  .md-span-1 { grid-column: span 1; }
  /* ... e così via */
  .md-span-6 { grid-column: span 6; }
}

@media (max-width: 576px) {
  .grid {
    grid-template-columns: 1fr;
  }
}
```

## Layout responsive con colonne

### Media queries e breakpoint

```css
/* Layout base (mobile) */
.container {
  display: flex;
  flex-direction: column;
}

.colonna {
  width: 100%;
  margin-bottom: 20px;
}

/* Tablet */
@media (min-width: 768px) {
  .container {
    flex-direction: row;
    flex-wrap: wrap;
  }
  
  .colonna {
    width: 50%;
  }
}

/* Desktop */
@media (min-width: 992px) {
  .colonna {
    width: 33.33%;
  }
}
```

### Approccio mobile-first

L'approccio mobile-first inizia con un layout per dispositivi mobili e poi aggiunge complessità per schermi più grandi. Questo approccio è considerato una best practice perché:

1. Prioritizza il contenuto essenziale
2. Migliora le prestazioni su dispositivi con risorse limitate
3. Semplifica il processo di progettazione

## Pattern di layout comuni

### Layout a due colonne

```css
/* Utilizzo di Grid */
.due-colonne {
  display: grid;
  grid-template-columns: 1fr 1fr;
  gap: 30px;
}

/* Responsive */
@media (max-width: 768px) {
  .due-colonne {
    grid-template-columns: 1fr;
  }
}
```

### Layout a tre colonne

```css
/* Utilizzo di Flexbox */
.tre-colonne {
  display: flex;
  flex-wrap: wrap;
}

.colonna {
  flex: 1;
  min-width: 250px;
  padding: 20px;
}
```

### Layout asimmetrici

```css
/* Utilizzo di Grid */
.layout-asimmetrico {
  display: grid;
  grid-template-columns: 2fr 1fr;
  gap: 20px;
}

/* Responsive */
@media (max-width: 768px) {
  .layout-asimmetrico {
    grid-template-columns: 1fr;
  }
}
```

### Layout a colonne variabili

```css
.layout-variabile {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
  gap: 20px;
}
```

Questo pattern crea automaticamente il numero di colonne che si adattano allo spazio disponibile, mantenendo ciascuna colonna di almeno 250px di larghezza.

## Best practice

1. **Adotta un approccio mobile-first** per garantire un'esperienza ottimale su tutti i dispositivi.
2. **Utilizza unità relative** (%, em, rem, fr) invece di pixel per dimensioni flessibili.
3. **Scegli il metodo appropriato** in base alle esigenze del layout:
   - Flexbox per layout unidimensionali o componenti UI
   - Grid per layout bidimensionali complessi
   - Multi-column per contenuti testuali
4. **Testa su diversi dispositivi e browser** per garantire la compatibilità.
5. **Considera l'accessibilità** assicurandoti che l'ordine del contenuto abbia senso anche senza stili.
6. **Usa box-sizing: border-box** per un calcolo più intuitivo delle dimensioni.
7. **Limita l'annidamento** di container per evitare complessità inutili.

## Domande di autovalutazione

1. Quali sono i vantaggi e gli svantaggi dei diversi metodi per creare layout a colonne (float, flexbox, grid, multi-column)?
2. Come si può implementare un layout a tre colonne che diventa a una colonna su dispositivi mobili?
3. Perché l'approccio mobile-first è considerato una best practice nel web design responsive?
4. Come si può creare un layout asimmetrico con una colonna principale più larga e una sidebar più stretta?
5. Quali sono le considerazioni di accessibilità da tenere presenti quando si progettano layout a colonne?

## Esercizi pratici

1. **Layout base**: Crea un layout a tre colonne utilizzando flexbox che si adatti a diverse dimensioni dello schermo.
2. **Griglia personalizzata**: Implementa un sistema a griglia di 12 colonne utilizzando CSS Grid.
3. **Layout complesso**: Progetta un layout di pagina con intestazione, piè di pagina, contenuto principale e due sidebar laterali.
4. **Layout a colonne variabili**: Crea una galleria di immagini che utilizzi colonne di larghezza variabile in base al contenuto.
5. **Layout ibrido**: Combina diversi metodi (flexbox, grid, multi-column) per creare un layout di pagina completo.

## Risorse aggiuntive

- [MDN Web Docs: CSS Grid Layout](https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_Grid_Layout)
- [MDN Web Docs: Flexbox](https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_Flexible_Box_Layout)
- [CSS-Tricks: A Complete Guide to Grid](https://css-tricks.com/snippets/css/complete-guide-grid/)
- [CSS-Tricks: A Complete Guide to Flexbox](https://css-tricks.com/snippets/css/a-guide-to-flexbox/)
- [Smashing Magazine: Responsive Layouts](https://www.smashingmagazine.com/2018/05/guide-css-layout/)

---

[◀ Torna all'indice](../README.md#06-tabelle-liste-colonne-e-form)
[◀ Vai a Colonne](./03_Colonne.md)
[▶ Vai a Form e input](./05_Form_e_input.md)