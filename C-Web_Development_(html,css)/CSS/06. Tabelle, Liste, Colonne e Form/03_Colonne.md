# Colonne in CSS

## Indice dei contenuti

- [Introduzione alle colonne in CSS](#introduzione-alle-colonne-in-css)
- [Proprietà CSS per le colonne](#proprietà-css-per-le-colonne)
  - [column-count](#column-count)
  - [column-width](#column-width)
  - [columns (shorthand)](#columns-shorthand)
  - [column-gap](#column-gap)
  - [column-rule](#column-rule)
  - [column-span](#column-span)
  - [column-fill](#column-fill)
- [Interruzioni di colonna](#interruzioni-di-colonna)
  - [break-before, break-after, break-inside](#break-before-break-after-break-inside)
- [Casi d'uso comuni](#casi-duso-comuni)
  - [Layout di articoli e blog](#layout-di-articoli-e-blog)
  - [Gallerie di immagini](#gallerie-di-immagini)
  - [Form multi-colonna](#form-multi-colonna)
- [Compatibilità con i browser](#compatibilità-con-i-browser)
- [Colonne vs altri metodi di layout](#colonne-vs-altri-metodi-di-layout)
- [Best practice](#best-practice)
- [Domande di autovalutazione](#domande-di-autovalutazione)
- [Esercizi pratici](#esercizi-pratici)
- [Risorse aggiuntive](#risorse-aggiuntive)

## Introduzione alle colonne in CSS

Le colonne CSS permettono di dividere il contenuto in più colonne, simili a quelle che si trovano nei giornali o nelle riviste. Questa funzionalità è particolarmente utile per migliorare la leggibilità di testi lunghi, organizzare elenchi o creare layout complessi senza dover ricorrere a strutture HTML aggiuntive.

Le proprietà multi-colonna di CSS consentono di specificare il numero di colonne, la loro larghezza, lo spazio tra di esse e persino di aggiungere linee divisorie, offrendo un controllo preciso sul flusso del contenuto.

## Proprietà CSS per le colonne

### column-count

Specifica il numero di colonne in cui dividere il contenuto:

```css
.contenuto {
  column-count: 3; /* Divide il contenuto in 3 colonne */
}
```

### column-width

Specifica la larghezza ideale per ogni colonna:

```css
.contenuto {
  column-width: 250px; /* Ogni colonna avrà circa 250px di larghezza */
}
```

Quando si utilizza `column-width`, il browser creerà automaticamente il numero di colonne che si adattano allo spazio disponibile, mantenendo ciascuna colonna vicina alla larghezza specificata.

### columns (shorthand)

Combina `column-count` e `column-width` in una sola proprietà:

```css
.contenuto {
  columns: 3 250px; /* 3 colonne di circa 250px ciascuna */
}
```

Se lo spazio disponibile non è sufficiente per contenere il numero specificato di colonne con la larghezza indicata, il browser darà priorità alla larghezza delle colonne, riducendo il loro numero.

### column-gap

Controlla lo spazio tra le colonne:

```css
.contenuto {
  column-count: 3;
  column-gap: 40px; /* 40px di spazio tra le colonne */
}
```

### column-rule

Aggiunge una linea divisoria tra le colonne:

```css
.contenuto {
  column-count: 3;
  column-rule: 1px solid #ddd; /* Linea divisoria grigia */
}
```

La proprietà `column-rule` è una shorthand che combina:
- `column-rule-width`: spessore della linea
- `column-rule-style`: stile della linea (solid, dashed, dotted, ecc.)
- `column-rule-color`: colore della linea

### column-span

Permette a un elemento di estendersi su più colonne:

```css
.titolo {
  column-span: all; /* L'elemento si estende su tutte le colonne */
}
```

Valori possibili:
- `none`: l'elemento rimane all'interno della sua colonna (predefinito)
- `all`: l'elemento si estende su tutte le colonne

### column-fill

Controlla come il contenuto viene bilanciato tra le colonne:

```css
.contenuto {
  column-count: 3;
  column-fill: balance; /* Distribuisce il contenuto equamente */
}
```

Valori possibili:
- `balance`: il browser tenta di bilanciare la quantità di contenuto in ogni colonna (predefinito)
- `auto`: le colonne vengono riempite sequenzialmente

## Interruzioni di colonna

### break-before, break-after, break-inside

Queste proprietà controllano dove avvengono le interruzioni di colonna:

```css
h2 {
  break-after: column; /* Forza un'interruzione di colonna dopo ogni h2 */
}

.no-break {
  break-inside: avoid; /* Evita interruzioni all'interno dell'elemento */
}
```

Valori comuni:
- `auto`: comportamento predefinito
- `avoid`: evita interruzioni
- `column`: forza un'interruzione di colonna
- `avoid-column`: evita interruzioni di colonna

## Casi d'uso comuni

### Layout di articoli e blog

```css
.articolo {
  columns: 2 300px;
  column-gap: 40px;
  column-rule: 1px solid #eee;
}

.articolo h2 {
  column-span: all;
  margin-bottom: 20px;
}
```

### Gallerie di immagini

```css
.galleria {
  columns: 4 200px;
  column-gap: 20px;
}

.galleria img {
  width: 100%;
  margin-bottom: 20px;
  display: block;
}
```

### Form multi-colonna

```css
.form-container {
  columns: 2 300px;
  column-gap: 30px;
}

.form-group {
  break-inside: avoid; /* Evita che i gruppi di form vengano divisi tra colonne */
  margin-bottom: 20px;
}
```

## Compatibilità con i browser

Le proprietà multi-colonna sono ben supportate nei browser moderni, ma potrebbero richiedere prefissi vendor per browser più datati:

```css
.contenuto {
  -webkit-column-count: 3; /* Safari e Chrome */
  -moz-column-count: 3; /* Firefox */
  column-count: 3;
}
```

È consigliabile verificare la compatibilità su [Can I Use](https://caniuse.com/?search=column) prima di implementare layout basati su colonne in progetti che richiedono supporto per browser meno recenti.

## Colonne vs altri metodi di layout

| Metodo | Vantaggi | Svantaggi |
|--------|----------|------------|
| **Colonne CSS** | - Flusso automatico del contenuto<br>- Facile da implementare<br>- Ideale per contenuti testuali | - Controllo limitato sul posizionamento<br>- Non ideale per layout complessi<br>- Problemi con elementi di altezza variabile |
| **Flexbox** | - Controllo preciso sull'allineamento<br>- Adatto a layout unidimensionali<br>- Ottimo per componenti UI | - Meno adatto per layout di pagina completi<br>- Non gestisce automaticamente il flusso del testo |
| **Grid** | - Layout bidimensionale<br>- Controllo preciso sul posizionamento<br>- Ideale per layout di pagina | - Curva di apprendimento più ripida<br>- Potrebbe essere eccessivo per layout semplici |

## Best practice

1. **Usa `column-width` invece di `column-count`** quando possibile, per layout più adattivi.
2. **Evita contenuti che potrebbero rompersi** tra le colonne (come immagini o tabelle) utilizzando `break-inside: avoid`.
3. **Testa su dispositivi mobili** per assicurarti che il layout rimanga leggibile.
4. **Considera l'accessibilità** - assicurati che l'ordine di lettura sia logico anche con screen reader.
5. **Usa `column-span: all`** per titoli o elementi che devono estendersi su tutte le colonne.
6. **Imposta una larghezza minima ragionevole** per le colonne per evitare colonne troppo strette su schermi piccoli.
7. **Combina con media queries** per adattare il numero di colonne in base alle dimensioni dello schermo.

## Domande di autovalutazione

1. Qual è la differenza tra `column-count` e `column-width`?
2. Come si può evitare che un elemento venga diviso tra due colonne?
3. Quali sono i vantaggi e gli svantaggi dell'utilizzo delle colonne CSS rispetto a Flexbox o Grid?
4. Come si può fare in modo che un titolo si estenda su tutte le colonne?
5. Quali problemi di accessibilità potrebbero sorgere con i layout multi-colonna?

## Esercizi pratici

1. **Layout articolo**: Crea un layout per un articolo di blog con un titolo che si estende su tutte le colonne e un testo diviso in due colonne.
2. **Galleria di immagini**: Implementa una galleria di immagini responsive utilizzando le colonne CSS.
3. **Form multi-colonna**: Progetta un modulo di contatto diviso in due colonne, assicurandoti che i campi correlati rimangano nella stessa colonna.
4. **Layout adattivo**: Crea un layout che passi da tre colonne su desktop a due colonne su tablet e una colonna su mobile.
5. **Newsletter**: Progetta il layout di una newsletter con colonne, titoli che si estendono e linee divisorie personalizzate.

## Risorse aggiuntive

- [MDN Web Docs: Multiple-column Layout](https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_Columns)
- [CSS-Tricks: Guide to CSS Columns](https://css-tricks.com/guide-responsive-friendly-css-columns/)
- [W3C: CSS Multi-column Layout Module](https://www.w3.org/TR/css-multicol-1/)
- [Smashing Magazine: Responsive Multi-Column Lists](https://www.smashingmagazine.com/2019/01/css-multiple-column-layout-multicol/)

---

[◀ Torna all'indice](../README.md#06-tabelle-liste-colonne-e-form)
[◀ Vai a Liste](./02_Liste.md)
[▶ Vai a Layout con colonne](./04_Layout_con_colonne.md)