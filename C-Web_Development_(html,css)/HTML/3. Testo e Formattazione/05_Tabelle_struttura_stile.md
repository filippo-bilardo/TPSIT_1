# Tabelle: struttura e stile

## Elementi base delle tabelle

Le tabelle in HTML sono strutture fondamentali per presentare dati in formato tabulare, organizzati in righe e colonne. L'elemento principale `<table>` funge da contenitore per tutti gli altri elementi che compongono la tabella.

La struttura base di una tabella HTML è composta da righe (`<tr>` - table row) che contengono celle. Esistono due tipi di celle: celle di intestazione (`<th>` - table header) e celle di dati (`<td>` - table data):

```html
<table>
  <tr>
    <th>Nome</th>
    <th>Cognome</th>
    <th>Età</th>
  </tr>
  <tr>
    <td>Mario</td>
    <td>Rossi</td>
    <td>35</td>
  </tr>
  <tr>
    <td>Giulia</td>
    <td>Bianchi</td>
    <td>28</td>
  </tr>
</table>
```

Le celle di intestazione (`<th>`) hanno un significato semantico importante: identificano il tipo di dati contenuti nella colonna o nella riga. Per impostazione predefinita, i browser visualizzano il testo nelle celle `<th>` in grassetto e centrato, ma questo comportamento può essere modificato con CSS.

Gli attributi di base delle tabelle includono:
- `border`: specifica lo spessore del bordo (sebbene sia preferibile usare CSS)
- `cellspacing`: definisce lo spazio tra le celle (preferibile CSS)
- `cellpadding`: definisce lo spazio interno alle celle (preferibile CSS)
- `width` e `height`: definiscono dimensioni della tabella (preferibile CSS)

## Elementi strutturali avanzati

Per tabelle più complesse, HTML offre elementi strutturali che migliorano l'organizzazione e la semantica. I gruppi di righe permettono di suddividere logicamente la tabella in sezioni:

```html
<table>
  <thead>
    <tr>
      <th>Prodotto</th>
      <th>Prezzo</th>
      <th>Disponibilità</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>Smartphone XYZ</td>
      <td>499€</td>
      <td>In stock</td>
    </tr>
    <tr>
      <td>Tablet ABC</td>
      <td>329€</td>
      <td>Esaurito</td>
    </tr>
  </tbody>
  <tfoot>
    <tr>
      <td colspan="3">Prezzi aggiornati al 01/01/2023</td>
    </tr>
  </tfoot>
</table>
```

L'elemento `<thead>` contiene le righe di intestazione, `<tbody>` racchiude il corpo principale della tabella, e `<tfoot>` contiene le righe di piè di pagina. Questi elementi non solo migliorano la struttura semantica, ma offrono vantaggi pratici: ad esempio, in tabelle molto lunghe, il browser può mantenere visibili le intestazioni durante lo scorrimento.

Per controllare gruppi di colonne, HTML fornisce gli elementi `<colgroup>` e `<col>`, che permettono di applicare stili a intere colonne senza dover selezionare singolarmente ogni cella:

```html
<table>
  <colgroup>
    <col style="background-color: #f2f2f2">
    <col span="2" style="background-color: #e6f7ff">
  </colgroup>
  <tr>
    <th>Nome</th>
    <th>Matematica</th>
    <th>Scienze</th>
  </tr>
  <tr>
    <td>Marco</td>
    <td>85</td>
    <td>92</td>
  </tr>
</table>
```

L'elemento `<caption>` fornisce un titolo o una didascalia per la tabella, migliorando la comprensione del suo contenuto:

```html
<table>
  <caption>Risultati esami primo semestre</caption>
  <!-- contenuto della tabella -->
</table>
```

Per tabelle complesse, gli attributi `headers` e `scope` stabiliscono relazioni esplicite tra celle di intestazione e celle di dati, migliorando l'accessibilità:

```html
<table>
  <tr>
    <th id="nome">Nome</th>
    <th id="matematica">Matematica</th>
    <th id="scienze">Scienze</th>
  </tr>
  <tr>
    <td headers="nome">Laura</td>
    <td headers="matematica">78</td>
    <td headers="scienze">85</td>
  </tr>
</table>
```

Alternativamente, l'attributo `scope` indica se un'intestazione si riferisce a una riga o a una colonna:

```html
<table>
  <tr>
    <th scope="col">Nome</th>
    <th scope="col">Matematica</th>
    <th scope="col">Scienze</th>
  </tr>
  <tr>
    <th scope="row">Laura</th>
    <td>78</td>
    <td>85</td>
  </tr>
</table>
```

## Styling delle tabelle con CSS

Il CSS offre numerose proprietà specifiche per personalizzare l'aspetto delle tabelle. Le proprietà di base includono:

```css
table {
  width: 100%;
  border-collapse: collapse;
  margin-bottom: 20px;
}

th, td {
  padding: 12px;
  text-align: left;
  border-bottom: 1px solid #ddd;
}

th {
  background-color: #f2f2f2;
  font-weight: bold;
}
```

La proprietà `border-collapse` controlla come vengono visualizzati i bordi adiacenti delle celle. I valori principali sono:
- `separate`: i bordi delle celle sono separati (comportamento predefinito)
- `collapse`: i bordi adiacenti vengono uniti in un unico bordo

Quando si utilizza `border-collapse: separate`, la proprietà `border-spacing` controlla la distanza tra i bordi delle celle:

```css
table {
  border-collapse: separate;
  border-spacing: 5px;
}
```

Per l'allineamento e il dimensionamento delle celle, CSS offre diverse proprietà:

```css
th, td {
  text-align: center; /* allineamento orizzontale: left, center, right */
  vertical-align: middle; /* allineamento verticale: top, middle, bottom */
  width: 25%; /* larghezza fissa o percentuale */
  height: 50px; /* altezza fissa */
}
```

Un pattern visivo comune è lo "zebra striping", che alterna colori di sfondo per le righe, migliorando la leggibilità:

```css
tr:nth-child(even) {
  background-color: #f2f2f2;
}

tr:hover {
  background-color: #e6f7ff;
}
```

## Tabelle responsive

Le tabelle rappresentano una sfida particolare per il design responsive, poiché contengono dati strutturati che perdono significato se non visualizzati correttamente. Esistono diverse tecniche per rendere le tabelle responsive.

L'approccio più semplice è utilizzare un contenitore con overflow orizzontale:

```css
.table-container {
  width: 100%;
  overflow-x: auto;
}
```

```html
<div class="table-container">
  <table><!-- contenuto della tabella --></table>
</div>
```

Per schermi molto piccoli, è possibile riorganizzare completamente la visualizzazione dei dati, trasformando ogni riga in un blocco verticale:

```css
@media (max-width: 600px) {
  table, thead, tbody, th, td, tr {
    display: block;
  }
  
  thead tr {
    position: absolute;
    top: -9999px;
    left: -9999px;
  }
  
  td {
    position: relative;
    padding-left: 50%;
  }
  
  td:before {
    position: absolute;
    left: 6px;
    content: attr(data-label);
    font-weight: bold;
  }
}
```

```html
<table>
  <tr>
    <th>Nome</th>
    <th>Email</th>
    <th>Telefono</th>
  </tr>
  <tr>
    <td data-label="Nome">Mario Rossi</td>
    <td data-label="Email">mario@esempio.it</td>
    <td data-label="Telefono">123-456789</td>
  </tr>
</table>
```

Un'altra tecnica è nascondere colonne meno importanti su schermi piccoli:

```css
@media (max-width: 600px) {
  .priority-low {
    display: none;
  }
}

@media (max-width: 400px) {
  .priority-medium {
    display: none;
  }
}
```

```html
<table>
  <tr>
    <th>Nome</th>
    <th class="priority-medium">Email</th>
    <th class="priority-low">Indirizzo</th>
  </tr>
</table>
```

## Accessibilità delle tabelle

Le tabelle accessibili permettono a tutti gli utenti, inclusi quelli che utilizzano tecnologie assistive, di comprendere i dati presentati. Il markup semantico è fondamentale:

- Utilizzare `<th>` per le intestazioni e `<td>` per i dati
- Includere un elemento `<caption>` che descriva il contenuto della tabella
- Utilizzare attributi `scope` per associare celle di intestazione e celle di dati
- Implementare `<thead>`, `<tbody>` e `<tfoot>` per strutturare logicamente la tabella

Per tabelle complesse, gli attributi ARIA possono migliorare ulteriormente l'accessibilità:

```html
<table aria-label="Risultati esami studenti" aria-describedby="table-desc">
  <!-- contenuto della tabella -->
</table>
<div id="table-desc" class="sr-only">Questa tabella mostra i risultati degli esami di matematica e scienze per gli studenti del primo anno.</div>
```

Per testare l'accessibilità delle tabelle:
- Utilizzare screen reader per verificare come vengono letti i dati
- Controllare che la navigazione da tastiera funzioni correttamente
- Verificare che il contrasto dei colori sia sufficiente
- Testare con strumenti di validazione dell'accessibilità come WAVE o Axe

## Casi d'uso e pattern comuni

Le tabelle dovrebbero essere utilizzate solo per dati tabulari, non per layout. Alcuni casi d'uso comuni includono:

**Tabelle di dati**: presentano informazioni strutturate come elenchi di prodotti, risultati, statistiche:

```html
<table>
  <caption>Vendite trimestrali 2023</caption>
  <thead>
    <tr>
      <th scope="col">Prodotto</th>
      <th scope="col">Q1</th>
      <th scope="col">Q2</th>
      <th scope="col">Q3</th>
      <th scope="col">Q4</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th scope="row">Smartphone</th>
      <td>1245</td>
      <td>1350</td>
      <td>1480</td>
      <td>2100</td>
    </tr>
    <!-- altre righe -->
  </tbody>
</table>
```

**Tabelle di prezzi e confronto**: confrontano caratteristiche e prezzi di prodotti o servizi:

```html
<table class="pricing-table">
  <thead>
    <tr>
      <th>Piano</th>
      <th>Base</th>
      <th>Premium</th>
      <th>Enterprise</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>Prezzo</th>
      <td>9,99€/mese</td>
      <td>19,99€/mese</td>
      <td>49,99€/mese</td>
    </tr>
    <tr>
      <th>Utenti</th>
      <td>1</td>
      <td>5</td>
      <td>Illimitati</td>
    </tr>
    <!-- altre caratteristiche -->
  </tbody>
</table>
```

**Calendari e orari**: presentano informazioni temporali in formato tabulare:

```html
<table class="calendar">
  <caption>Giugno 2023</caption>
  <thead>
    <tr>
      <th>Lun</th>
      <th>Mar</th>
      <th>Mer</th>
      <th>Gio</th>
      <th>Ven</th>
      <th>Sab</th>
      <th>Dom</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>1</td>
      <td>2</td>
      <td>3</td>
      <td>4</td>
      <td>5</td>
      <td>6</td>
      <td>7</td>
    </tr>
    <!-- altre settimane -->
  </tbody>
</table>
```

## Best practices e performance

Per creare tabelle efficaci e performanti, è importante seguire alcune best practices:

1. **Utilizzare tabelle solo per dati tabulari**: le tabelle dovrebbero essere utilizzate esclusivamente per presentare dati che hanno una relazione bidimensionale, non per il layout della pagina.

2. **Mantenere la struttura semplice**: evitare tabelle eccessivamente complesse con troppe righe e colonne annidate.

3. **Fornire intestazioni chiare**: utilizzare sempre elementi `<th>` per le intestazioni di riga e colonna, con l'attributo `scope` appropriato.

4. **Includere didascalie**: utilizzare l'elemento `<caption>` per fornire un titolo descrittivo della tabella.

5. **Garantire l'accessibilità**: utilizzare attributi come `scope`, `headers` e `id` per migliorare la navigazione con screen reader.

6. **Ottimizzare per dispositivi mobili**: implementare tecniche responsive per garantire che le tabelle siano utilizzabili su schermi di piccole dimensioni.

7. **Evitare celle vuote**: utilizzare `&nbsp;` o indicare esplicitamente "Nessun dato" quando necessario.

8. **Limitare l'uso di `colspan` e `rowspan`**: questi attributi possono rendere le tabelle più difficili da comprendere e mantenere.

- Specificare `width` e `height` delle celle quando possibile

## Conclusione

Le tabelle HTML forniscono un potente strumento per presentare dati strutturati. Sebbene il loro uso puramente per scopi di layout sia ormai scoraggiato (in favore di CSS Grid e Flexbox), rimangono essenziali per la presentazione di dati tabulari. Seguendo le best practices e utilizzando tutti gli elementi strutturali forniti da HTML5, è possibile creare tabelle accessibili, semanticamente corrette e visivamente gradevoli.

---

### Navigazione
- [📑 Indice](<../README.md>)
- [⬅️ Inserimento e gestione di immagini](<04_Inserimento_gestione_immagini.md>)
- [➡️ Struttura delle pagine con HTML5](<../4. Struttura e Layout delle Pagine/01_Struttura_pagine_HTML5.md>)