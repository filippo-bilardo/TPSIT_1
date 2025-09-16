# Posizionamento CSS

Il posizionamento CSS permette di controllare come gli elementi vengono disposti nella pagina, modificando il loro comportamento rispetto al flusso normale del documento.

## Proprietà position

La proprietà `position` è fondamentale per il controllo del layout e può assumere diversi valori:

### position: static

Questo è il valore predefinito. Gli elementi con `position: static` seguono il normale flusso del documento.

```css
.elemento-static {
  position: static;
}
```

Caratteristiche:
- Gli elementi vengono posizionati secondo il flusso normale del documento
- Le proprietà `top`, `right`, `bottom`, `left` e `z-index` non hanno effetto
- È il comportamento predefinito di tutti gli elementi HTML

### position: relative

Gli elementi con `position: relative` vengono posizionati relativamente alla loro posizione normale nel flusso del documento.

```css
.elemento-relative {
  position: relative;
  top: 20px;
  left: 30px;
}
```

Caratteristiche:
- L'elemento viene spostato rispetto alla sua posizione originale
- Lo spazio originale occupato dall'elemento viene mantenuto nel layout
- Crea un nuovo contesto di posizionamento per gli elementi figli con position absolute
- Le proprietà `top`, `right`, `bottom` e `left` specificano lo spostamento rispetto alla posizione originale

### position: absolute

Gli elementi con `position: absolute` vengono rimossi dal flusso normale del documento e posizionati rispetto all'antenato posizionato più vicino (diverso da static).

```css
.contenitore {
  position: relative;
  height: 200px;
}

.elemento-absolute {
  position: absolute;
  top: 50px;
  left: 50px;
}
```

Caratteristiche:
- L'elemento viene rimosso dal flusso normale del documento
- Non occupa spazio nel layout (gli altri elementi si comportano come se non esistesse)
- È posizionato rispetto all'antenato posizionato più vicino (con position diverso da static)
- Se non ci sono antenati posizionati, viene posizionato rispetto al viewport

### position: fixed

Gli elementi con `position: fixed` vengono rimossi dal flusso normale del documento e posizionati rispetto al viewport.

```css
.header-fisso {
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  background-color: white;
  box-shadow: 0 2px 5px rgba(0,0,0,0.1);
}
```

Caratteristiche:
- L'elemento viene rimosso dal flusso normale del documento
- Rimane fisso nella stessa posizione anche durante lo scorrimento della pagina
- È posizionato rispetto al viewport (la finestra del browser)
- Utile per elementi come header, menu di navigazione o pulsanti che devono rimanere sempre visibili

### position: sticky

Gli elementi con `position: sticky` si comportano come `relative` fino a quando non raggiungono una soglia specificata, dopodiché si comportano come `fixed`.

```css
.menu-sticky {
  position: sticky;
  top: 0;
  background-color: white;
  z-index: 100;
}
```

Caratteristiche:
- Si comporta come `position: relative` fino a quando non raggiunge la soglia specificata durante lo scorrimento
- Quando raggiunge la soglia, si comporta come `position: fixed`
- Rimane "attaccato" alla posizione specificata durante lo scorrimento
- Richiede almeno una delle proprietà `top`, `right`, `bottom` o `left` per funzionare

## Proprietà di posizionamento

Le seguenti proprietà vengono utilizzate insieme a `position` per specificare la posizione esatta degli elementi:

- `top`: distanza dal bordo superiore del contenitore di riferimento
- `right`: distanza dal bordo destro del contenitore di riferimento
- `bottom`: distanza dal bordo inferiore del contenitore di riferimento
- `left`: distanza dal bordo sinistro del contenitore di riferimento
- `z-index`: controlla la sovrapposizione degli elementi (valore maggiore = più in alto nel livello di sovrapposizione)

## Esempi pratici

### Header fisso

```html
<header class="header-fisso">
  <h1>Il mio sito</h1>
  <nav>
    <ul>
      <li><a href="#">Home</a></li>
      <li><a href="#">Chi siamo</a></li>
      <li><a href="#">Contatti</a></li>
    </ul>
  </nav>
</header>
<main class="contenuto-principale">
  <!-- Contenuto della pagina -->
</main>
```

```css
.header-fisso {
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  background-color: white;
  box-shadow: 0 2px 5px rgba(0,0,0,0.1);
  z-index: 1000;
}

.contenuto-principale {
  margin-top: 80px; /* Compensare l'altezza dell'header fisso */
}
```

### Elemento sovrapposto

```html
<div class="card">
  <img src="immagine.jpg" alt="Immagine">
  <div class="badge">Nuovo</div>
  <div class="contenuto">
    <h3>Titolo</h3>
    <p>Descrizione...</p>
  </div>
</div>
```

```css
.card {
  position: relative;
  width: 300px;
  border: 1px solid #ddd;
  border-radius: 8px;
  overflow: hidden;
}

.badge {
  position: absolute;
  top: 10px;
  right: 10px;
  background-color: red;
  color: white;
  padding: 5px 10px;
  border-radius: 4px;
}
```

## Considerazioni importanti

- Il posizionamento può causare sovrapposizioni e problemi di accessibilità se non utilizzato correttamente
- Gli elementi con `position: absolute` o `fixed` richiedono dimensioni esplicite o saranno larghi solo quanto il loro contenuto
- Il posizionamento `sticky` non funziona se l'elemento genitore ha `overflow: hidden` o `overflow: auto`
- Quando si utilizzano elementi posizionati, è importante considerare il comportamento su diverse dimensioni dello schermo

## Navigazione
- [📑 Indice](./README.md)
- [⬅️ Proprietà Display](./01-ProprietàDisplay.md)
- [➡️ Flexbox](./03-Flexbox.md)