# Tabelle in CSS

## Indice dei contenuti

- [Introduzione alle tabelle in CSS](#introduzione-alle-tabelle-in-css)
- [Struttura HTML di una tabella](#struttura-html-di-una-tabella)
- [Proprietà CSS per le tabelle](#proprietà-css-per-le-tabelle)
  - [Bordi delle tabelle](#bordi-delle-tabelle)
  - [Spaziatura e dimensionamento](#spaziatura-e-dimensionamento)
  - [Allineamento del contenuto](#allineamento-del-contenuto)
  - [Collasso dei bordi](#collasso-dei-bordi)
- [Stilizzazione avanzata delle tabelle](#stilizzazione-avanzata-delle-tabelle)
  - [Righe alternate](#righe-alternate)
  - [Hover e stati interattivi](#hover-e-stati-interattivi)
  - [Intestazioni fisse](#intestazioni-fisse)
- [Responsive design per tabelle](#responsive-design-per-tabelle)
- [Best practice](#best-practice)
- [Domande di autovalutazione](#domande-di-autovalutazione)
- [Esercizi pratici](#esercizi-pratici)
- [Risorse aggiuntive](#risorse-aggiuntive)

## Introduzione alle tabelle in CSS

Le tabelle sono elementi fondamentali per la presentazione di dati strutturati in righe e colonne. Sebbene in passato venissero utilizzate impropriamente per il layout delle pagine web, oggi il loro uso è correttamente limitato alla visualizzazione di dati tabulari. CSS offre numerose proprietà per personalizzare l'aspetto delle tabelle, rendendole più leggibili e esteticamente gradevoli.

## Struttura HTML di una tabella

Prima di applicare stili CSS, è importante comprendere la struttura base di una tabella HTML:

```html
<table>
  <caption>Titolo della tabella</caption>
  <thead>
    <tr>
      <th>Intestazione 1</th>
      <th>Intestazione 2</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>Dato 1</td>
      <td>Dato 2</td>
    </tr>
    <tr>
      <td>Dato 3</td>
      <td>Dato 4</td>
    </tr>
  </tbody>
  <tfoot>
    <tr>
      <td>Piè di pagina 1</td>
      <td>Piè di pagina 2</td>
    </tr>
  </tfoot>
</table>
```

Gli elementi principali sono:
- `<table>`: contenitore principale
- `<caption>`: titolo della tabella
- `<thead>`: sezione delle intestazioni
- `<tbody>`: corpo principale con i dati
- `<tfoot>`: piè di pagina della tabella
- `<tr>`: riga della tabella
- `<th>`: cella di intestazione
- `<td>`: cella di dati

## Proprietà CSS per le tabelle

### Bordi delle tabelle

```css
table {
  border: 1px solid #ddd;
}

th, td {
  border: 1px solid #ddd;
  padding: 8px;
}
```

### Spaziatura e dimensionamento

```css
table {
  width: 100%;
  table-layout: fixed; /* Controlla l'algoritmo di layout della tabella */
}

th, td {
  padding: 12px 15px;
}

/* Spazio tra le celle */
table {
  border-spacing: 2px;
}
```

### Allineamento del contenuto

```css
th {
  text-align: left;
  vertical-align: middle;
}

td {
  text-align: right; /* Utile per valori numerici */
  vertical-align: top;
}
```

### Collasso dei bordi

```css
table {
  border-collapse: collapse; /* Unisce i bordi adiacenti */
  /* Alternativa: border-collapse: separate; */
}
```

## Stilizzazione avanzata delle tabelle

### Righe alternate

```css
tr:nth-child(even) {
  background-color: #f2f2f2;
}
```

### Hover e stati interattivi

```css
tr:hover {
  background-color: #ddd;
}

tbody tr:hover td {
  color: #333;
}
```

### Intestazioni fisse

```css
thead {
  position: sticky;
  top: 0;
  background-color: #f1f1f1;
}
```

## Responsive design per tabelle

Le tabelle possono essere problematiche su dispositivi mobili. Ecco alcune tecniche per renderle responsive:

```css
/* Approccio 1: Scroll orizzontale */
.table-container {
  overflow-x: auto;
}

/* Approccio 2: Tabella reattiva */
@media screen and (max-width: 600px) {
  table, thead, tbody, th, td, tr {
    display: block;
  }
  
  thead tr {
    position: absolute;
    top: -9999px;
    left: -9999px;
  }
  
  tr {
    margin-bottom: 15px;
    border: 1px solid #ccc;
  }
  
  td {
    border: none;
    position: relative;
    padding-left: 50%;
  }
  
  td:before {
    position: absolute;
    left: 6px;
    width: 45%;
    padding-right: 10px;
    white-space: nowrap;
    content: attr(data-label);
    font-weight: bold;
  }
}
```

Per utilizzare l'approccio 2, è necessario aggiungere attributi `data-label` alle celle:

```html
<td data-label="Nome">Mario Rossi</td>
```

## Best practice

1. **Usa le tabelle solo per dati tabulari**, non per il layout della pagina.
2. **Includi sempre elementi `<thead>`, `<tbody>` e `<tfoot>`** per una migliore struttura semantica.
3. **Utilizza `caption`** per fornire un titolo accessibile alla tabella.
4. **Imposta `table-layout: fixed`** per prestazioni migliori con tabelle grandi.
5. **Considera l'accessibilità** utilizzando attributi come `scope` per le intestazioni.
6. **Testa le tabelle su dispositivi mobili** e implementa soluzioni responsive.
7. **Limita l'uso di bordi pesanti** che possono rendere la tabella visivamente sovraccarica.

## Domande di autovalutazione

1. Qual è la differenza tra `border-collapse: collapse` e `border-collapse: separate`?
2. Come si possono creare righe di tabella con colori alternati?
3. Quali sono le principali sfide nel rendere le tabelle responsive?
4. Perché è importante utilizzare `<thead>`, `<tbody>` e `<tfoot>` nella struttura HTML?
5. Come si può mantenere visibile l'intestazione di una tabella durante lo scorrimento?

## Esercizi pratici

1. **Tabella base**: Crea una tabella semplice con bordi collassati e righe alternate.
2. **Tabella interattiva**: Implementa effetti hover sulle righe della tabella.
3. **Tabella responsive**: Trasforma una tabella normale in una tabella responsive utilizzando CSS.
4. **Tabella di dati complessa**: Crea una tabella con intestazioni fisse e colonne di larghezza variabile.
5. **Tabella stilizzata**: Progetta una tabella con un design moderno, utilizzando ombre, bordi arrotondati e transizioni.

## Risorse aggiuntive

- [MDN Web Docs: Styling Tables](https://developer.mozilla.org/en-US/docs/Learn/CSS/Building_blocks/Styling_tables)
- [CSS-Tricks: A Complete Guide to the Table Element](https://css-tricks.com/complete-guide-table-element/)
- [Responsive Tables](https://css-tricks.com/responsive-data-tables/)
- [W3C: Tables in HTML documents](https://www.w3.org/TR/html401/struct/tables.html)

---

[◀ Torna all'indice](../README.md#06-tabelle-liste-colonne-e-form)
[▶ Vai a Liste](./02_Liste.md)