# Selettori di base (elemento, classe, ID)

## Indice dei contenuti

- [Introduzione ai selettori](#introduzione-ai-selettori)
- [Selettori di elemento](#selettori-di-elemento)
  - [Sintassi e utilizzo](#sintassi-e-utilizzo-elemento)
  - [Esempi pratici](#esempi-pratici-elemento)
- [Selettori di classe](#selettori-di-classe)
  - [Sintassi e utilizzo](#sintassi-e-utilizzo-classe)
  - [Esempi pratici](#esempi-pratici-classe)
  - [Selettori di classe multipli](#selettori-di-classe-multipli)
- [Selettori di ID](#selettori-di-id)
  - [Sintassi e utilizzo](#sintassi-e-utilizzo-id)
  - [Esempi pratici](#esempi-pratici-id)
  - [Quando usare gli ID](#quando-usare-gli-id)
- [Selettore universale](#selettore-universale)
- [Confronto tra selettori](#confronto-tra-selettori)
  - [Specificità](#specificità)
  - [Performance](#performance)
  - [Casi d'uso](#casi-duso)
- [Domande di autovalutazione](#domande-di-autovalutazione)
- [Esercizi pratici](#esercizi-pratici)
- [Risorse aggiuntive](#risorse-aggiuntive)

## Introduzione ai selettori

I selettori CSS sono modelli che determinano quali elementi HTML vengono stilizzati da un insieme di regole CSS. I selettori di base sono i più fondamentali e ampiamente utilizzati nel CSS quotidiano.

I selettori di base si dividono in tre categorie principali:
- Selettori di elemento (o di tipo)
- Selettori di classe
- Selettori di ID

Ogni tipo di selettore ha un diverso livello di specificità e casi d'uso appropriati.

## Selettori di elemento

I selettori di elemento (o selettori di tipo) prendono di mira gli elementi HTML in base al loro nome di tag.

### Sintassi e utilizzo {#sintassi-e-utilizzo-elemento}

La sintassi è semplicemente il nome del tag HTML:

```css
tagname {
  property: value;
}
```

Esempio:

```css
p {
  color: blue;
  font-size: 16px;
}

h1 {
  font-family: 'Arial', sans-serif;
  margin-bottom: 20px;
}
```

### Esempi pratici {#esempi-pratici-elemento}

1. **Stilizzare tutti i paragrafi**:
   ```css
   p {
     line-height: 1.6;
     margin-bottom: 1em;
   }
   ```

2. **Stilizzare tutte le immagini**:
   ```css
   img {
     max-width: 100%;
     height: auto;
     border-radius: 4px;
   }
   ```

3. **Stilizzare tutti i link**:
   ```css
   a {
     color: #0066cc;
     text-decoration: none;
   }
   
   a:hover {
     text-decoration: underline;
   }
   ```

> **Suggerimento**: I selettori di elemento sono utili per definire stili di base, ma possono essere troppo generici per layout complessi. Usali per impostare stili predefiniti coerenti.

## Selettori di classe

I selettori di classe prendono di mira elementi HTML che hanno un attributo `class` specifico. Sono i selettori più versatili e comunemente utilizzati.

### Sintassi e utilizzo {#sintassi-e-utilizzo-classe}

La sintassi utilizza un punto (`.`) seguito dal nome della classe:

```css
.classname {
  property: value;
}
```

Nel HTML, si applica così:

```html
<div class="classname">Contenuto</div>
```

Esempio:

```css
.highlight {
  background-color: yellow;
  font-weight: bold;
}
```

```html
<p>Questo è un <span class="highlight">testo evidenziato</span> in un paragrafo.</p>
```

### Esempi pratici {#esempi-pratici-classe}

1. **Creare un bottone**:
   ```css
   .button {
     display: inline-block;
     padding: 10px 20px;
     background-color: #4CAF50;
     color: white;
     border-radius: 4px;
     cursor: pointer;
   }
   
   .button:hover {
     background-color: #45a049;
   }
   ```

2. **Stilizzare una card**:
   ```css
   .card {
     border: 1px solid #ddd;
     border-radius: 8px;
     padding: 16px;
     box-shadow: 0 2px 4px rgba(0,0,0,0.1);
   }
   ```

3. **Creare una griglia di base**:
   ```css
   .grid {
     display: flex;
     flex-wrap: wrap;
   }
   
   .grid-item {
     flex: 0 0 calc(33.333% - 20px);
     margin: 10px;
   }
   ```

### Selettori di classe multipli

Un elemento HTML può avere più classi, separate da spazi:

```html
<div class="card featured large">Contenuto</div>
```

Puoi selezionare elementi con più classi specifiche concatenandole (senza spazi):

```css
.card.featured {
  border-color: gold;
}
```

Questo seleziona solo gli elementi che hanno *entrambe* le classi `card` e `featured`.

> **Suggerimento**: Le classi sono riutilizzabili e possono essere applicate a qualsiasi elemento. Questo le rende ideali per stili che si ripetono in tutta l'applicazione.

## Selettori di ID

I selettori di ID prendono di mira elementi HTML con un attributo `id` specifico. Ogni ID dovrebbe essere unico all'interno di una pagina HTML.

### Sintassi e utilizzo {#sintassi-e-utilizzo-id}

La sintassi utilizza un cancelletto (`#`) seguito dal nome dell'ID:

```css
#idname {
  property: value;
}
```

Nel HTML, si applica così:

```html
<div id="idname">Contenuto</div>
```

Esempio:

```css
#header {
  background-color: #333;
  color: white;
  padding: 20px 0;
}
```

```html
<header id="header">Intestazione del sito</header>
```

### Esempi pratici {#esempi-pratici-id}

1. **Stilizzare l'intestazione principale**:
   ```css
   #main-header {
     position: sticky;
     top: 0;
     z-index: 100;
     background-color: white;
     box-shadow: 0 2px 5px rgba(0,0,0,0.1);
   }
   ```

2. **Stilizzare il footer**:
   ```css
   #footer {
     background-color: #222;
     color: #eee;
     padding: 40px 0;
     margin-top: 60px;
   }
   ```

3. **Stilizzare una sezione specifica**:
   ```css
   #hero-section {
     height: 80vh;
     background-image: url('hero.jpg');
     background-size: cover;
     display: flex;
     align-items: center;
     justify-content: center;
   }
   ```

### Quando usare gli ID

Gli ID dovrebbero essere utilizzati con parsimonia nel CSS per diversi motivi:

1. **Alta specificità**: Gli ID hanno una specificità molto alta, che può rendere difficile sovrascrivere gli stili in seguito.
2. **Non riutilizzabili**: Per definizione, un ID dovrebbe essere unico in una pagina.
3. **Casi d'uso appropriati**: Gli ID sono più adatti per:
   - Elementi di navigazione interna (ancore)
   - JavaScript (getElementById)
   - Elementi veramente unici nella pagina (header principale, footer, ecc.)

> **Suggerimento**: Preferisci le classi agli ID per la maggior parte degli stili CSS. Usa gli ID principalmente per JavaScript e navigazione interna.

## Selettore universale

Il selettore universale (`*`) corrisponde a qualsiasi elemento HTML.

```css
* {
  box-sizing: border-box;
  margin: 0;
  padding: 0;
}
```

Questo esempio imposta `box-sizing`, `margin` e `padding` per tutti gli elementi della pagina.

> **Attenzione**: Il selettore universale può influire sulle prestazioni se usato con proprietà che causano ricalcoli di layout. Usalo con moderazione.

## Confronto tra selettori

### Specificità

La specificità determina quale regola CSS viene applicata quando più regole puntano allo stesso elemento:

1. **Selettori di ID**: Specificità più alta (100)
2. **Selettori di classe**: Specificità media (10)
3. **Selettori di elemento**: Specificità più bassa (1)

Esempio di confronto:

```css
#header {             /* Specificità: 100 */
  color: black;
}

.header {             /* Specificità: 10 */
  color: blue;
}

header {              /* Specificità: 1 */
  color: red;
}
```

Per un elemento `<header id="header" class="header">`, il colore sarà nero perché il selettore ID ha la specificità più alta.

### Performance

In termini di performance di rendering:

1. **Selettori di ID**: Generalmente i più veloci
2. **Selettori di classe**: Molto efficienti
3. **Selettori di elemento**: Possono essere meno efficienti su pagine grandi
4. **Selettore universale**: Il meno efficiente

Tuttavia, le differenze di performance sono minime nella maggior parte dei casi e non dovrebbero essere la preoccupazione principale nella scelta dei selettori.

### Casi d'uso

- **Selettori di elemento**: Per stili di base e reset CSS
- **Selettori di classe**: Per componenti riutilizzabili e la maggior parte degli stili
- **Selettori di ID**: Per elementi unici e punti di riferimento nella pagina
- **Selettore universale**: Per reset CSS e impostazioni globali

## Domande di autovalutazione

1. Qual è la differenza principale tra selettori di classe e selettori di ID?
2. Come si seleziona un elemento che ha due classi specifiche contemporaneamente?
3. Perché è generalmente consigliato usare classi invece di ID per la maggior parte degli stili CSS?
4. Cosa significa "specificità" nel contesto dei selettori CSS e come viene calcolata per i selettori di base?
5. In quale situazione è appropriato usare il selettore universale (`*`)?
6. Come si applica uno stile a tutti gli elementi `<a>` che hanno anche una classe `button`?
7. Quali sono i potenziali problemi di performance nell'uso eccessivo di selettori di elemento?
8. Come si può sovrascrivere uno stile applicato tramite un selettore di ID?

## Esercizi pratici

1. **Creazione di un sistema di bottoni**:
   - Crea diversi stili di bottoni usando classi
   - Implementa varianti come primario, secondario, di successo, di avviso, ecc.
   - Aggiungi stati hover e active

2. **Stilizzazione di una pagina di blog**:
   - Usa selettori di elemento per gli stili di base del testo
   - Usa classi per componenti come card degli articoli, barre laterali, ecc.
   - Usa ID per sezioni uniche come header e footer

3. **Analisi della specificità**:
   - Dato un set di regole CSS in conflitto, determina quale stile verrà applicato
   - Riscrivi le regole per ottenere lo stesso risultato visivo ma con una migliore organizzazione

4. **Refactoring del CSS**:
   - Prendi un foglio di stile esistente che usa principalmente ID
   - Refactorizzalo per usare principalmente classi
   - Assicurati che l'aspetto visivo rimanga identico

5. **Creazione di un layout responsive**:
   - Usa una combinazione di selettori di elemento, classe e ID
   - Implementa un layout che si adatta a diverse dimensioni dello schermo

## Risorse aggiuntive

1. **Documentazione ufficiale**:
   - [MDN Web Docs - Selettori CSS](https://developer.mozilla.org/it/docs/Web/CSS/CSS_Selectors)
   - [W3C - Selectors Level 3](https://www.w3.org/TR/selectors-3/)

2. **Tutorial e guide**:
   - [CSS-Tricks - The Difference Between ID and Class](https://css-tricks.com/the-difference-between-id-and-class/)
   - [Smashing Magazine - Writing CSS With Specificity In Mind](https://www.smashingmagazine.com/2007/07/css-specificity-things-you-should-know/)

3. **Strumenti**:
   - [Specificity Calculator](https://specificity.keegan.st/) - Calcola la specificità dei selettori CSS
   - [CSS Diner](https://flukeout.github.io/) - Gioco per imparare i selettori CSS

---

**Navigazione**
- [📑 Indice](../README.md)
- [⬅️ 05. Strumenti per lavorare con il CSS](<../01. Introduzione al CSS/05_Strumenti_per_lavorare_con_il_CSS.md>)
- [➡️ 02. Selettori avanzati](02_Selettori_avanzati.md)
