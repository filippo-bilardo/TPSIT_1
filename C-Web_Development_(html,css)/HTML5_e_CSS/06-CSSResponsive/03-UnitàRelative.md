# Unità Relative in CSS

Le unità relative sono fondamentali per il design responsive perché si adattano in base al contesto, a differenza delle unità assolute (come i pixel) che mantengono sempre le stesse dimensioni indipendentemente dal dispositivo o dal contesto.

## Perché Usare Unità Relative

L'utilizzo di unità relative offre diversi vantaggi:

- **Adattabilità** - Gli elementi si ridimensionano proporzionalmente in base al contesto
- **Accessibilità** - Rispettano le preferenze dell'utente (come la dimensione del testo del browser)
- **Manutenibilità** - Facilitano la gestione del codice perché molti valori si calcolano automaticamente

## Tipi di Unità Relative

### Unità Relative al Font

#### em

L'unità `em` è relativa alla dimensione del font dell'elemento genitore.

```css
.parent {
  font-size: 16px; /* Base */
}

.child {
  font-size: 1.5em; /* = 24px (16px * 1.5) */
  padding: 1em; /* = 24px (relativo al font-size dell'elemento stesso) */
}

.grandchild {
  font-size: 1.5em; /* = 36px (24px * 1.5) */
}
```

**Attenzione**: Gli `em` si accumulano nei contesti annidati, il che può portare a dimensioni inaspettate.

#### rem

L'unità `rem` (root em) è relativa alla dimensione del font dell'elemento root (html).

```css
html {
  font-size: 16px; /* Base per tutti i rem */
}

.element {
  font-size: 1.5rem; /* = 24px (16px * 1.5) */
  margin: 2rem; /* = 32px (16px * 2) */
}

.nested-element {
  font-size: 2rem; /* = 32px (16px * 2), non influenzato dal genitore */
}
```

**Vantaggio**: I `rem` non si accumulano, rendendo più prevedibile il dimensionamento.

### Unità Relative al Viewport

#### vw (Viewport Width)

`1vw` equivale all'1% della larghezza del viewport.

```css
.hero-title {
  font-size: 5vw; /* 5% della larghezza della finestra */
}

.container {
  width: 80vw; /* 80% della larghezza della finestra */
}
```

#### vh (Viewport Height)

`1vh` equivale all'1% dell'altezza del viewport.

```css
.full-screen {
  height: 100vh; /* 100% dell'altezza della finestra */
}

.half-screen {
  height: 50vh; /* 50% dell'altezza della finestra */
}
```

#### vmin e vmax

- `vmin`: 1% della dimensione più piccola del viewport (larghezza o altezza)
- `vmax`: 1% della dimensione più grande del viewport (larghezza o altezza)

```css
.responsive-element {
  font-size: 5vmin; /* 5% della dimensione minore (utile per orientamento variabile) */
  width: 50vmax; /* 50% della dimensione maggiore */
}
```

### Percentuali

Le percentuali sono relative all'elemento genitore.

```css
.parent {
  width: 500px;
}

.child {
  width: 50%; /* = 250px (50% di 500px) */
  margin-left: 10%; /* = 50px (10% di 500px) */
}
```

**Nota**: Per proprietà come `margin` e `padding`, la percentuale è sempre relativa alla larghezza del genitore, anche per i valori verticali.

## Funzioni di Dimensionamento

### calc()

La funzione `calc()` permette di eseguire calcoli con unità diverse.

```css
.sidebar {
  /* Larghezza fissa di 250px su desktop, adattiva su mobile */
  width: calc(100% - 2rem);
  max-width: 250px;
}

.content {
  /* Larghezza che si adatta allo spazio rimanente meno un margine */
  width: calc(100% - 300px - 2rem);
}
```

### clamp()

La funzione `clamp()` definisce un valore che si adatta tra un minimo e un massimo.

```css
.responsive-text {
  /* Minimo 16px, preferito 4% della larghezza, massimo 32px */
  font-size: clamp(16px, 4vw, 32px);
}

.flexible-container {
  /* Larghezza che si adatta tra 300px e 1200px */
  width: clamp(300px, 80%, 1200px);
}
```

### min() e max()

Le funzioni `min()` e `max()` selezionano rispettivamente il valore più piccolo o più grande tra quelli forniti.

```css
.container {
  /* Prende il valore minore tra 90% e 1200px */
  width: min(90%, 1200px);
  
  /* Prende il valore maggiore tra 300px e 50% */
  height: max(300px, 50%);
}
```

## Strategie di Utilizzo

### Tipografia Responsive

```css
html {
  /* Base font-size che si adatta leggermente */
  font-size: clamp(16px, 1vw + 14px, 20px);
}

h1 {
  font-size: 2.5rem;
  margin-bottom: 1.5rem;
}

p {
  font-size: 1rem;
  line-height: 1.5;
  margin-bottom: 1rem;
}
```

### Layout Fluido

```css
.container {
  /* Centrato con larghezza massima */
  width: min(90%, 1200px);
  margin: 0 auto;
}

.card {
  /* Almeno 250px, ma si adatta allo spazio disponibile */
  width: clamp(250px, 30%, 400px);
  padding: 1.5rem;
}
```

### Spaziatura Proporzionale

```css
.section {
  /* Spaziatura verticale che aumenta su schermi più grandi */
  padding-top: clamp(2rem, 5vw, 5rem);
  padding-bottom: clamp(2rem, 5vw, 5rem);
}

.grid {
  display: grid;
  gap: clamp(1rem, 2vw, 2rem);
}
```

## Best Practices

1. **Combina unità diverse** per ottenere il miglior risultato (es. `clamp()` con px, rem e vw)
2. **Usa `rem` per la tipografia** per mantenere la coerenza e rispettare le impostazioni dell'utente
3. **Preferisci `%` e unità viewport** per layout e contenitori
4. **Evita `em` per font-size in elementi annidati** per prevenire l'effetto a cascata
5. **Usa `max-width` e `min-width`** insieme alle unità relative per controllare i limiti di dimensione

## Navigazione del Corso
- [📑 Indice](../README.md)
- [⬅️ Media Queries](./02-MediaQueries.md)
- [➡️ Immagini Responsive](./04-ImmaginiResponsive.md)