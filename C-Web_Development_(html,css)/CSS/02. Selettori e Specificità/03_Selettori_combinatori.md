# Selettori combinatori in CSS

## Indice dei contenuti
- [Introduzione ai selettori combinatori](#introduzione-ai-selettori-combinatori)
- [Selettore discendente (spazio)](#selettore-discendente-spazio)
- [Selettore figlio diretto (>)](#selettore-figlio-diretto-)
- [Selettore fratello adiacente (+)](#selettore-fratello-adiacente-)
- [Selettore fratello generale (~)](#selettore-fratello-generale-)
- [Combinare più combinatori](#combinare-più-combinatori)
- [Best Practice](#best-practice)
- [Domande di autovalutazione](#domande-di-autovalutazione)
- [Esercizi proposti](#esercizi-proposti)
- [Risorse esterne](#risorse-esterne)

## Introduzione ai selettori combinatori

I selettori combinatori permettono di selezionare elementi in base alla loro relazione con altri elementi nel documento HTML. Questi selettori sono potenti strumenti per creare regole CSS mirate e specifiche senza dover aggiungere classi o ID aggiuntivi agli elementi HTML.

I selettori combinatori sono particolarmente utili quando si lavora con strutture HTML complesse e si desidera applicare stili a elementi specifici in base alla loro posizione nel DOM (Document Object Model).

## Selettore discendente (spazio)

Il selettore discendente seleziona tutti gli elementi che sono discendenti di un elemento specificato, indipendentemente dal livello di nidificazione.

```css
/* Seleziona tutti i paragrafi all'interno di un div */
div p {
    color: blue;
}
```

In questo esempio, tutti i paragrafi (`<p>`) che sono all'interno di un `<div>`, a qualsiasi livello di nidificazione, avranno il testo di colore blu.

```html
<div>
    <p>Questo paragrafo sarà blu.</p>
    <section>
        <p>Anche questo paragrafo sarà blu, nonostante sia all'interno di una section.</p>
    </section>
</div>
<p>Questo paragrafo NON sarà blu perché non è all'interno di un div.</p>
```

## Selettore figlio diretto (>)

Il selettore figlio diretto seleziona elementi che sono figli diretti di un elemento specificato, escludendo i discendenti più profondi.

```css
/* Seleziona solo i paragrafi che sono figli diretti di un div */
div > p {
    font-weight: bold;
}
```

In questo esempio, solo i paragrafi che sono figli diretti di un `<div>` (cioè, al primo livello di nidificazione) avranno il testo in grassetto.

```html
<div>
    <p>Questo paragrafo sarà in grassetto.</p>
    <section>
        <p>Questo paragrafo NON sarà in grassetto perché è figlio di section, non di div.</p>
    </section>
</div>
```

## Selettore fratello adiacente (+)

Il selettore fratello adiacente seleziona un elemento che è immediatamente preceduto da un elemento specificato, quando entrambi condividono lo stesso genitore.

```css
/* Seleziona il paragrafo che viene immediatamente dopo un h2 */
h2 + p {
    font-style: italic;
}
```

In questo esempio, solo il paragrafo che segue immediatamente un `<h2>` avrà il testo in corsivo.

```html
<section>
    <h2>Titolo</h2>
    <p>Questo paragrafo sarà in corsivo perché segue immediatamente un h2.</p>
    <p>Questo paragrafo NON sarà in corsivo perché non segue immediatamente un h2.</p>
</section>
```

## Selettore fratello generale (~)

Il selettore fratello generale seleziona tutti gli elementi che sono preceduti da un elemento specificato, quando condividono lo stesso genitore.

```css
/* Seleziona tutti i paragrafi che vengono dopo un h2 */
h2 ~ p {
    text-decoration: underline;
}
```

In questo esempio, tutti i paragrafi che seguono un `<h2>` all'interno dello stesso genitore avranno il testo sottolineato.

```html
<section>
    <p>Questo paragrafo NON sarà sottolineato perché viene prima dell'h2.</p>
    <h2>Titolo</h2>
    <p>Questo paragrafo sarà sottolineato.</p>
    <div>Un div intermedio</div>
    <p>Anche questo paragrafo sarà sottolineato, nonostante ci sia un div tra questo e l'h2.</p>
</section>
```

## Combinare più combinatori

I selettori combinatori possono essere combinati tra loro per creare selettori più specifici e potenti.

```css
/* Seleziona i paragrafi che sono figli diretti di un div e seguono immediatamente un h3 */
div > h3 + p {
    color: red;
    background-color: lightyellow;
}
```

In questo esempio, solo i paragrafi che sono figli diretti di un `<div>` e seguono immediatamente un `<h3>` avranno il testo rosso su sfondo giallo chiaro.

```html
<div>
    <h3>Sottotitolo</h3>
    <p>Questo paragrafo sarà rosso su sfondo giallo chiaro.</p>
    <p>Questo paragrafo NON avrà lo stile speciale perché non segue immediatamente un h3.</p>
</div>
```

## Best Practice

- **Evitare selettori troppo complessi**: Selettori combinatori molto lunghi e complessi possono essere difficili da leggere e mantenere.
- **Considerare la specificità**: I selettori combinatori aumentano la specificità delle regole CSS, il che può rendere più difficile sovrascrivere gli stili in seguito.
- **Usare con moderazione**: Preferire l'uso di classi per stili riutilizzabili e utilizzare i selettori combinatori per relazioni strutturali specifiche.
- **Testare su diverse strutture HTML**: Assicurarsi che i selettori combinatori funzionino come previsto anche se la struttura HTML cambia leggermente.

## Suggerimenti

> **Suggerimento**: Utilizzare gli strumenti di sviluppo del browser per ispezionare gli elementi e verificare quali selettori CSS si applicano a un elemento specifico.

> **Suggerimento**: Quando si utilizzano selettori combinatori, è utile commentare il codice CSS per spiegare la logica dietro selettori particolarmente complessi.

## Domande di autovalutazione

1. Qual è la differenza tra il selettore discendente (spazio) e il selettore figlio diretto (>)?
2. In quale scenario è più appropriato utilizzare il selettore fratello adiacente (+) rispetto al selettore fratello generale (~)?
3. Come influiscono i selettori combinatori sulla specificità delle regole CSS?
4. Quali sono i potenziali svantaggi dell'utilizzo di selettori combinatori complessi?
5. Come si può combinare un selettore di classe con un selettore combinatore?

## Esercizi proposti

1. **Esercizio base**: Crea una struttura HTML con elementi nidificati e utilizza i diversi selettori combinatori per applicare stili diversi a elementi simili in posizioni diverse.

2. **Esercizio intermedio**: Implementa un menu a discesa utilizzando solo HTML e CSS, dove gli elementi del sottomenu sono visualizzati solo quando l'elemento principale è in hover, utilizzando selettori combinatori appropriati.

3. **Esercizio avanzato**: Crea un layout di articolo con intestazioni, paragrafi, immagini e didascalie, e utilizza selettori combinatori per stilizzare automaticamente gli elementi in base alla loro posizione relativa (ad esempio, paragrafi dopo immagini, didascalie sotto immagini, ecc.).

---

- [📑 Indice](../README.md)
- [⬅️ Selettori avanzati](02_Selettori_avanzati.md)
- [➡️ Specificità e cascata](04_Specificità_e_cascata.md)