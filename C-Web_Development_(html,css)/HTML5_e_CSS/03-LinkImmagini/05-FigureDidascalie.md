# Figure e Didascalie in HTML5

## Introduzione

HTML5 ha introdotto gli elementi `<figure>` e `<figcaption>` per migliorare la semantica e l'accessibilità quando si presentano contenuti visivi con didascalie associate. Questi elementi sono particolarmente utili per immagini, diagrammi, grafici, snippet di codice o qualsiasi altro contenuto che beneficia di una didascalia esplicativa.

## Elemento `<figure>`

L'elemento `<figure>` rappresenta un contenuto autonomo, spesso illustrativo, che è referenziato dal flusso principale del documento ma che potrebbe essere spostato in un'altra parte del documento o in un'appendice senza influenzare il flusso principale.

### Sintassi Base

```html
<figure>
  <!-- Contenuto della figura (immagine, grafico, codice, ecc.) -->
</figure>
```

## Elemento `<figcaption>`

L'elemento `<figcaption>` rappresenta una didascalia o una legenda che descrive il resto del contenuto del suo elemento `<figure>` genitore.

### Sintassi Base

```html
<figure>
  <!-- Contenuto della figura -->
  <figcaption>Didascalia della figura</figcaption>
</figure>
```

## Utilizzo di `<figure>` e `<figcaption>`

### Immagine con Didascalia

```html
<figure>
  <img src="tramonto.jpg" alt="Tramonto sul mare">
  <figcaption>Tramonto spettacolare fotografato dalla spiaggia di Santa Maria</figcaption>
</figure>
```

### Posizionamento della Didascalia

La didascalia può essere posizionata sia sopra che sotto il contenuto della figura:

```html
<!-- Didascalia sopra l'immagine -->
<figure>
  <figcaption>Fig. 1: Vista aerea della città</figcaption>
  <img src="vista-aerea.jpg" alt="Vista aerea della città di Milano">
</figure>

<!-- Didascalia sotto l'immagine (più comune) -->
<figure>
  <img src="vista-aerea.jpg" alt="Vista aerea della città di Milano">
  <figcaption>Fig. 1: Vista aerea della città</figcaption>
</figure>
```

## Casi d'Uso Comuni

### Galleria di Immagini con Didascalie

```html
<section class="galleria">
  <figure>
    <img src="foto1.jpg" alt="Descrizione foto 1">
    <figcaption>Piazza del Duomo, Milano</figcaption>
  </figure>
  
  <figure>
    <img src="foto2.jpg" alt="Descrizione foto 2">
    <figcaption>Colosseo, Roma</figcaption>
  </figure>
  
  <figure>
    <img src="foto3.jpg" alt="Descrizione foto 3">
    <figcaption>Ponte di Rialto, Venezia</figcaption>
  </figure>
</section>
```

### Snippet di Codice con Didascalia

```html
<figure>
  <pre><code>
function saluta(nome) {
  return `Ciao, ${nome}!`;
}
  </code></pre>
  <figcaption>Esempio di funzione JavaScript per generare un saluto personalizzato</figcaption>
</figure>
```

### Citazioni con Attribuzione

```html
<figure>
  <blockquote>
    <p>La vita è ciò che ti accade mentre sei occupato a fare altri progetti.</p>
  </blockquote>
  <figcaption>— John Lennon</figcaption>
</figure>
```

### Diagrammi e Grafici

```html
<figure>
  <img src="grafico-vendite.png" alt="Grafico delle vendite annuali dal 2020 al 2023">
  <figcaption>Fig. 3: Andamento delle vendite negli ultimi quattro anni, con picco nel terzo trimestre 2022</figcaption>
</figure>
```

## Stili CSS per Figure e Didascalie

È comune applicare stili CSS a `<figure>` e `<figcaption>` per migliorarne l'aspetto:

```css
figure {
  border: 1px solid #ccc;
  border-radius: 5px;
  padding: 10px;
  margin: 20px 0;
  text-align: center;
}

figcaption {
  font-style: italic;
  font-size: 0.9em;
  color: #666;
  margin-top: 8px;
}
```

## Figure Multiple in un Singolo Elemento `<figure>`

È possibile includere più immagini o elementi all'interno di un singolo elemento `<figure>` con una didascalia comune:

```html
<figure>
  <img src="prodotto-fronte.jpg" alt="Vista frontale del prodotto">
  <img src="prodotto-retro.jpg" alt="Vista posteriore del prodotto">
  <img src="prodotto-lato.jpg" alt="Vista laterale del prodotto">
  <figcaption>Fig. 4: Viste multiple del nostro nuovo prodotto XYZ</figcaption>
</figure>
```

## Accessibilità

L'uso corretto di `<figure>` e `<figcaption>` migliora l'accessibilità del contenuto web:

1. **Associazione semantica**: Collega esplicitamente un'immagine alla sua didascalia
2. **Navigazione con screen reader**: Gli screen reader possono identificare e annunciare correttamente le didascalie
3. **Comprensione del contesto**: Fornisce contesto aggiuntivo per il contenuto visivo

## Best Practices

1. **Usa `<figure>` per contenuti referenziati**: Utilizza `<figure>` solo per contenuti che sono referenziati nel testo principale o che potrebbero essere spostati senza influenzare il flusso del documento
2. **Mantieni l'attributo `alt`**: Anche quando usi `<figcaption>`, continua a fornire un attributo `alt` appropriato per le immagini
3. **Didascalie concise**: Scrivi didascalie chiare e concise che aggiungano valore al contenuto
4. **Stile coerente**: Mantieni uno stile coerente per tutte le figure e didascalie nel tuo sito
5. **Responsive design**: Assicurati che le figure e le didascalie si adattino bene a diverse dimensioni dello schermo

## Navigazione del Corso
- [📑 Indice](../README.md)
- [⬅️ Attributi delle Immagini](./04-AttributiImmagini.md)
- [➡️ Mappe Immagine](./06-MappeImmagine.md)