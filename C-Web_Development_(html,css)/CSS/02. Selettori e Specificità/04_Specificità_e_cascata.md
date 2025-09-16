# Specificità e cascata in CSS

## Indice dei contenuti
- [Introduzione alla cascata CSS](#introduzione-alla-cascata-css)
- [Specificità dei selettori](#specificità-dei-selettori)
  - [Come calcolare la specificità](#come-calcolare-la-specificità)
  - [Tabella di specificità](#tabella-di-specificità)
- [Ordine di applicazione delle regole](#ordine-di-applicazione-delle-regole)
- [L'attributo !important](#lattributo-important)
- [Ereditarietà in CSS](#ereditarietà-in-css)
  - [Proprietà che si ereditano](#proprietà-che-si-ereditano)
  - [Proprietà che non si ereditano](#proprietà-che-non-si-ereditano)
- [Risoluzione dei conflitti](#risoluzione-dei-conflitti)
- [Best Practice](#best-practice)
- [Domande di autovalutazione](#domande-di-autovalutazione)
- [Esercizi proposti](#esercizi-proposti)
- [Risorse esterne](#risorse-esterne)

## Introduzione alla cascata CSS

La "C" in CSS sta per "Cascading" (a cascata), un concetto fondamentale che determina quali stili vengono applicati agli elementi quando più regole potrebbero influenzare lo stesso elemento. La cascata è un algoritmo che definisce come combinare le proprietà provenienti da diverse fonti e come risolvere i conflitti tra di esse.

La cascata si basa su tre fattori principali, in ordine di importanza:

1. **Importanza**: Dichiarazioni con `!important` hanno la precedenza
2. **Specificità**: Selettori più specifici hanno la precedenza
3. **Ordine di apparizione**: L'ultima dichiarazione ha la precedenza

## Specificità dei selettori

La specificità è un peso assegnato a un selettore CSS che determina quale regola viene applicata quando più regole potrebbero influenzare lo stesso elemento. Più specifico è un selettore, maggiore è il suo "peso" nella cascata.

### Come calcolare la specificità

La specificità viene calcolata come un valore a quattro parti, spesso rappresentato come quattro numeri separati da virgole (a,b,c,d):

- **a**: Stili inline (`style="..."`) - il valore è 1 se presente, 0 altrimenti
- **b**: Numero di selettori ID (`#id`)
- **c**: Numero di selettori di classe (`.classe`), selettori di attributo (`[attr=value]`) e pseudo-classi (`:hover`)
- **d**: Numero di selettori di elemento (`div`, `p`) e pseudo-elementi (`::before`)

### Tabella di specificità

| Selettore | Specificità (a,b,c,d) | Valore decimale |
|-----------|----------------------|----------------|
| `style="color: red"` | 1,0,0,0 | 1000 |
| `#header` | 0,1,0,0 | 100 |
| `.menu` | 0,0,1,0 | 10 |
| `div` | 0,0,0,1 | 1 |
| `*` | 0,0,0,0 | 0 |

Esempi di calcolo della specificità:

```css
/* Specificità: 0,0,0,1 */
p { color: black; }

/* Specificità: 0,0,1,1 */
p.nota { color: blue; }

/* Specificità: 0,1,0,1 */
#contenuto p { color: red; }

/* Specificità: 0,1,1,1 */
#contenuto p.speciale { color: green; }
```

In questo esempio, `#contenuto p.speciale` ha la specificità più alta (0,1,1,1), quindi il suo colore (verde) prevarrà sugli altri.

## Ordine di applicazione delle regole

Quando due selettori hanno la stessa specificità, l'ordine di apparizione determina quale regola viene applicata. La regola che appare per ultima nel foglio di stile ha la precedenza.

```css
p { color: red; }
/* Questo colore prevarrà perché appare dopo */
p { color: blue; }
```

L'ordine di applicazione considera anche l'origine delle regole CSS:

1. Stili del browser (user agent)
2. Stili dell'utente
3. Stili dell'autore (il tuo CSS)
4. Stili dell'autore con `!important`
5. Stili dell'utente con `!important`

## L'attributo !important

L'attributo `!important` può essere aggiunto alla fine di una dichiarazione CSS per darle la massima priorità, ignorando le normali regole di specificità e ordine.

```css
p { color: red !important; } /* Questa regola prevarrà */
#contenuto p { color: blue; } /* Anche se questo selettore è più specifico */
```

L'uso di `!important` dovrebbe essere limitato a casi eccezionali, poiché complica la manutenzione del codice e può portare a una "guerra di importanza" dove più regole competono con `!important`.

## Ereditarietà in CSS

L'ereditarietà è un meccanismo attraverso il quale alcune proprietà CSS vengono trasmesse dagli elementi genitori ai loro discendenti. Non tutte le proprietà CSS si ereditano automaticamente.

### Proprietà che si ereditano

Alcune proprietà che si ereditano naturalmente includono:

- `color`
- `font-family`, `font-size`, `font-style`, `font-weight`
- `line-height`
- `text-align`, `text-indent`
- `letter-spacing`, `word-spacing`
- `visibility`

```css
body {
    color: #333;
    font-family: Arial, sans-serif;
}

/* Tutti gli elementi all'interno del body erediteranno queste proprietà */
```

### Proprietà che non si ereditano

Alcune proprietà che non si ereditano includono:

- `margin`, `padding`
- `border`
- `background`
- `height`, `width`
- `position`
- `display`

È possibile forzare l'ereditarietà di qualsiasi proprietà utilizzando il valore `inherit`:

```css
.box {
    border: 1px solid black;
}

.box-child {
    /* Forza l'ereditarietà del bordo dal genitore */
    border: inherit;
}
```

## Risoluzione dei conflitti

Quando si verificano conflitti tra regole CSS, il browser li risolve seguendo questi passaggi:

1. Identifica tutte le dichiarazioni che si applicano all'elemento
2. Ordina le dichiarazioni in base all'importanza (`!important`)
3. Ordina le dichiarazioni in base all'origine (utente, autore, browser)
4. Ordina le dichiarazioni in base alla specificità
5. Se la specificità è uguale, ordina in base all'ordine di apparizione

Esempio di risoluzione dei conflitti:

```css
/* Regola 1 - Specificità: 0,0,1,0 */
.paragrafo { color: blue; }

/* Regola 2 - Specificità: 0,0,0,1 */
p { color: red; }

/* Regola 3 - Specificità: 0,0,1,1 */
p.speciale { color: green; }

/* Regola 4 - Specificità: 0,0,0,1 ma con !important */
p { color: purple !important; }
```

Per un elemento `<p class="paragrafo speciale">`, il colore applicato sarà `purple` perché la Regola 4 ha `!important`, anche se la Regola 3 ha una specificità maggiore.

## Best Practice

- **Evitare l'uso di `!important`**: Utilizzarlo solo come ultima risorsa
- **Mantenere bassa la specificità**: Preferire classi a ID quando possibile
- **Utilizzare una metodologia CSS**: Come BEM, SMACSS o OOCSS per evitare conflitti
- **Organizzare il CSS in modo logico**: Raggruppare le regole correlate
- **Commentare i casi complessi**: Spiegare perché si è scelto un approccio particolare
- **Utilizzare strumenti di analisi**: Per identificare e risolvere problemi di specificità

## Suggerimenti

> **Suggerimento**: Quando si verificano problemi di stile, utilizzare gli strumenti di sviluppo del browser per ispezionare l'elemento e vedere quali regole vengono applicate e quali vengono sovrascritte.

> **Suggerimento**: Per evitare problemi di specificità, è consigliabile utilizzare selettori di classe piuttosto che selettori di elemento o selettori combinatori complessi.

## Domande di autovalutazione

1. Quali sono i tre fattori principali che determinano la cascata CSS e in quale ordine di importanza?
2. Come si calcola la specificità di un selettore CSS?
3. Quale selettore ha la specificità maggiore: `#header .nav li` o `body #header ul li.active`?
4. Quando è appropriato utilizzare l'attributo `!important`?
5. Quali proprietà CSS si ereditano naturalmente e quali no?

## Esercizi proposti

1. **Esercizio base**: Crea un foglio di stile con regole in conflitto e analizza quale viene applicata in base alla specificità e all'ordine.

2. **Esercizio intermedio**: Implementa un sistema di temi per un sito web utilizzando l'ereditarietà CSS per propagare i colori e gli stili del tema a tutti i componenti.

3. **Esercizio avanzato**: Riscrivi un foglio di stile esistente per ridurre la specificità dei selettori e migliorare la manutenibilità, seguendo una metodologia CSS come BEM.

---

- [📑 Indice](../README.md)
- [⬅️ Selettori combinatori](03_Selettori_combinatori.md)
- [➡️ Pseudo-classi e pseudo-elementi](05_Pseudo-classi_e_pseudo-elementi.md)