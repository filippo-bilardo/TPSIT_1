# Liste Ordinate e Non Ordinate in HTML5

## Introduzione

Le liste sono elementi fondamentali in HTML che permettono di organizzare e strutturare le informazioni in modo chiaro e leggibile. HTML5 offre diversi tipi di liste, ciascuna con uno scopo specifico e caratteristiche proprie.

## Liste Non Ordinate

Le liste non ordinate (unordered lists) sono utilizzate quando l'ordine degli elementi non è rilevante. Vengono create con il tag `<ul>` e ogni elemento della lista è definito con il tag `<li>` (list item).

```html
<ul>
  <li>Mele</li>
  <li>Banane</li>
  <li>Arance</li>
</ul>
```

Per impostazione predefinita, i browser visualizzano le liste non ordinate con un punto (bullet) prima di ogni elemento, ma questo può essere modificato con CSS.

### Personalizzazione con CSS

```css
ul {
  list-style-type: circle; /* Cerchio vuoto */
}
```

Altre opzioni per `list-style-type` includono:
- `disc` (punto pieno, predefinito)
- `circle` (cerchio vuoto)
- `square` (quadrato)
- `none` (nessun simbolo)

## Liste Ordinate

Le liste ordinate (ordered lists) sono utilizzate quando l'ordine degli elementi è importante. Vengono create con il tag `<ol>` e, come per le liste non ordinate, ogni elemento è definito con il tag `<li>`.

```html
<ol>
  <li>Primo passo: preparare gli ingredienti</li>
  <li>Secondo passo: mescolare gli ingredienti</li>
  <li>Terzo passo: cuocere l'impasto</li>
</ol>
```

Per impostazione predefinita, i browser visualizzano le liste ordinate con numeri progressivi, ma è possibile modificare questo comportamento.

### Attributi delle Liste Ordinate

#### Tipo di Numerazione

L'attributo `type` definisce il tipo di numerazione:

```html
<ol type="A">
  <li>Elemento A</li>
  <li>Elemento B</li>
  <li>Elemento C</li>
</ol>
```

Valori possibili per l'attributo `type`:
- `1`: Numeri (predefinito)
- `A`: Lettere maiuscole
- `a`: Lettere minuscole
- `I`: Numeri romani maiuscoli
- `i`: Numeri romani minuscoli

#### Valore Iniziale

L'attributo `start` definisce il valore iniziale della numerazione:

```html
<ol start="10">
  <li>Elemento 10</li>
  <li>Elemento 11</li>
  <li>Elemento 12</li>
</ol>
```

#### Ordine Inverso

L'attributo `reversed` inverte l'ordine della numerazione:

```html
<ol reversed>
  <li>Terzo elemento (sarà numerato come 3)</li>
  <li>Secondo elemento (sarà numerato come 2)</li>
  <li>Primo elemento (sarà numerato come 1)</li>
</ol>
```

## Liste Annidate

È possibile annidare liste all'interno di altre liste per creare strutture gerarchiche:

```html
<ul>
  <li>Frutta
    <ul>
      <li>Agrumi
        <ul>
          <li>Limoni</li>
          <li>Arance</li>
        </ul>
      </li>
      <li>Frutti di bosco</li>
    </ul>
  </li>
  <li>Verdura</li>
</ul>
```

## Best Practices

1. **Usa il tipo di lista appropriato**: Scegli liste ordinate quando la sequenza è importante, altrimenti usa liste non ordinate.

2. **Mantieni la coerenza**: Usa lo stesso tipo di lista per elementi simili all'interno del documento.

3. **Evita liste troppo profonde**: Limitare l'annidamento a 2-3 livelli per mantenere la leggibilità.

4. **Usa CSS per lo stile**: Personalizza l'aspetto delle liste con CSS invece di utilizzare attributi HTML deprecati.

5. **Considera l'accessibilità**: Le liste sono importanti per gli screen reader, quindi usale in modo semanticamente corretto.

## Esempi Pratici

### Menu di Navigazione

```html
<nav>
  <ul>
    <li><a href="#home">Home</a></li>
    <li><a href="#about">Chi siamo</a></li>
    <li><a href="#services">Servizi</a>
      <ul>
        <li><a href="#web">Web Design</a></li>
        <li><a href="#app">App Development</a></li>
      </ul>
    </li>
    <li><a href="#contact">Contatti</a></li>
  </ul>
</nav>
```

### Istruzioni Passo-Passo

```html
<ol>
  <li>Accendi il computer</li>
  <li>Apri il browser
    <ol type="a">
      <li>Fai doppio clic sull'icona</li>
      <li>Attendi il caricamento</li>
    </ol>
  </li>
  <li>Naviga al sito web desiderato</li>
</ol>
```

## Conclusione

Le liste in HTML5 sono strumenti potenti per organizzare e presentare informazioni in modo strutturato. Utilizzando il tipo di lista appropriato e sfruttando le opzioni di personalizzazione, è possibile creare contenuti ben organizzati e facilmente comprensibili per gli utenti.

## Navigazione del Corso
- [📑 Indice](../README.md)
- [⬅️ Formattazione Semantica del Testo](./02-FormattazioneSemantica.md)
- [➡️ Liste di Definizioni](./04-ListeDefinizioni.md)