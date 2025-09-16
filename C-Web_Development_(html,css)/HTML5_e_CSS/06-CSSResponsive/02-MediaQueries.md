# Media Queries

Le Media Queries sono uno strumento fondamentale del CSS che permette di applicare stili diversi in base alle caratteristiche del dispositivo, come la dimensione dello schermo, l'orientamento o la risoluzione.

## Sintassi Base

La sintassi base di una media query è la seguente:

```css
@media tipo-di-media and (condizione) {
  /* Regole CSS da applicare quando la condizione è soddisfatta */
}
```

## Tipi di Media

- `all`: tutti i dispositivi (default)
- `screen`: schermi di computer, tablet, smartphone
- `print`: stampanti e anteprima di stampa
- `speech`: sintetizzatori vocali

## Condizioni Comuni

### Larghezza del Viewport

```css
/* Stili per schermi con larghezza massima di 768px */
@media screen and (max-width: 768px) {
  body {
    font-size: 14px;
  }
}

/* Stili per schermi con larghezza minima di 1200px */
@media screen and (min-width: 1200px) {
  body {
    font-size: 18px;
  }
}
```

### Orientamento

```css
/* Stili per dispositivi in orientamento orizzontale */
@media screen and (orientation: landscape) {
  .container {
    flex-direction: row;
  }
}

/* Stili per dispositivi in orientamento verticale */
@media screen and (orientation: portrait) {
  .container {
    flex-direction: column;
  }
}
```

### Risoluzione

```css
/* Stili per schermi ad alta risoluzione (Retina) */
@media screen and (min-resolution: 2dppx) {
  .logo {
    background-image: url('logo@2x.png');
  }
}
```

## Operatori Logici

### AND

Per combinare più condizioni che devono essere tutte soddisfatte:

```css
@media screen and (min-width: 768px) and (max-width: 1200px) {
  /* Stili per tablet e desktop di dimensioni medie */
}
```

### OR (virgola)

Per specificare condizioni alternative:

```css
@media screen and (max-width: 600px), screen and (orientation: portrait) {
  /* Stili per schermi piccoli O in orientamento verticale */
}
```

### NOT

Per negare una condizione:

```css
@media not screen and (color) {
  /* Stili per dispositivi che non hanno schermi a colori */
}
```

## Breakpoint Comuni

Ecco alcuni breakpoint comunemente utilizzati per il design responsive:

```css
/* Mobile piccolo (fino a 320px) */
@media screen and (max-width: 320px) { ... }

/* Mobile (fino a 480px) */
@media screen and (max-width: 480px) { ... }

/* Tablet piccolo (fino a 768px) */
@media screen and (max-width: 768px) { ... }

/* Tablet grande/Desktop piccolo (fino a 1024px) */
@media screen and (max-width: 1024px) { ... }

/* Desktop (fino a 1200px) */
@media screen and (max-width: 1200px) { ... }

/* Desktop grande (oltre 1200px) */
@media screen and (min-width: 1201px) { ... }
```

## Approccio Mobile-First

Nell'approccio mobile-first, si scrivono prima gli stili per dispositivi mobili e poi si aggiungono media queries con `min-width` per schermi più grandi:

```css
/* Stili base per mobile */
body {
  font-size: 16px;
}

/* Tablet */
@media screen and (min-width: 768px) {
  body {
    font-size: 18px;
  }
}

/* Desktop */
@media screen and (min-width: 1024px) {
  body {
    font-size: 20px;
  }
}
```

## Esempi Pratici

### Menu Responsive

```css
/* Stile base: menu verticale per mobile */
.nav-menu {
  display: flex;
  flex-direction: column;
}

/* Su schermi più grandi: menu orizzontale */
@media screen and (min-width: 768px) {
  .nav-menu {
    flex-direction: row;
    justify-content: space-between;
  }
}
```

### Layout a Colonne

```css
/* Stile base: una colonna per mobile */
.grid-container {
  display: grid;
  grid-template-columns: 1fr;
  gap: 20px;
}

/* Tablet: due colonne */
@media screen and (min-width: 768px) {
  .grid-container {
    grid-template-columns: 1fr 1fr;
  }
}

/* Desktop: quattro colonne */
@media screen and (min-width: 1024px) {
  .grid-container {
    grid-template-columns: repeat(4, 1fr);
  }
}
```

## Best Practices

1. **Usa l'approccio mobile-first** quando possibile
2. **Limita il numero di breakpoint** per mantenere il codice gestibile
3. **Testa su dispositivi reali** oltre che con gli strumenti di sviluppo del browser
4. **Considera le performance** evitando regole CSS troppo complesse nelle media queries
5. **Usa unità relative** (em, rem, %) invece di pixel per una maggiore flessibilità

## Navigazione del Corso
- [📑 Indice](../README.md)
- [⬅️ Principi del Design Responsive](./01-PrincipiResponsive.md)
- [➡️ Unità Relative](./03-UnitàRelative.md)