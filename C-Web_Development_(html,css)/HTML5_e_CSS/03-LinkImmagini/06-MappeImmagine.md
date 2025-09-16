# Mappe Immagine in HTML5

## Introduzione

Le mappe immagine permettono di creare aree cliccabili all'interno di un'immagine, trasformando diverse regioni dell'immagine in collegamenti ipertestuali. Questa funzionalità è particolarmente utile quando si desidera creare interfacce interattive basate su immagini, come mappe geografiche, diagrammi o illustrazioni con più punti di interesse.

In HTML5, esistono due tipi di mappe immagine:

1. **Mappe lato client**: Definite interamente nel codice HTML e gestite dal browser
2. **Mappe lato server**: Richiedono un server per elaborare le coordinate del clic

In questa guida ci concentreremo principalmente sulle mappe lato client, che sono le più comuni e facili da implementare.

## Elementi per Creare Mappe Immagine

Per creare una mappa immagine lato client, sono necessari tre elementi:

1. `<img>`: L'immagine di base
2. `<map>`: Definisce la mappa e contiene le aree cliccabili
3. `<area>`: Definisce le singole aree cliccabili all'interno della mappa

## Sintassi Base

```html
<img src="immagine.jpg" alt="Descrizione immagine" usemap="#nomeMappa">

<map name="nomeMappa">
  <area shape="tipo" coords="coordinate" href="destinazione.html" alt="Descrizione area">
  <!-- Altre aree... -->
</map>
```

Dove:
- `usemap` nell'elemento `<img>` collega l'immagine alla mappa (il valore deve iniziare con `#`)
- `name` nell'elemento `<map>` identifica la mappa (deve corrispondere al valore di `usemap` senza il `#`)
- `shape` nell'elemento `<area>` definisce la forma dell'area cliccabile
- `coords` specifica le coordinate dell'area
- `href` è la destinazione del link
- `alt` fornisce un testo alternativo per l'area

## Tipi di Forme (Attributo `shape`)

L'attributo `shape` può avere i seguenti valori:

1. `rect` (rettangolo)
2. `circle` (cerchio)
3. `poly` (poligono)
4. `default` (intera immagine)

### Rettangolo (`rect`)

Per un rettangolo, le coordinate sono specificate come `x1,y1,x2,y2`, dove:
- `x1,y1` sono le coordinate dell'angolo superiore sinistro
- `x2,y2` sono le coordinate dell'angolo inferiore destro

```html
<area shape="rect" coords="10,10,100,100" href="pagina1.html" alt="Area 1">
```

### Cerchio (`circle`)

Per un cerchio, le coordinate sono specificate come `x,y,r`, dove:
- `x,y` sono le coordinate del centro del cerchio
- `r` è il raggio del cerchio in pixel

```html
<area shape="circle" coords="200,200,50" href="pagina2.html" alt="Area 2">
```

### Poligono (`poly`)

Per un poligono, le coordinate sono specificate come una serie di punti `x1,y1,x2,y2,...,xn,yn`, dove ogni coppia `x,y` rappresenta un vertice del poligono:

```html
<area shape="poly" coords="100,100,200,50,300,100,250,200,150,200" href="pagina3.html" alt="Area 3">
```

### Default (`default`)

L'area predefinita copre l'intera immagine e viene utilizzata quando nessun'altra area corrisponde al punto di clic:

```html
<area shape="default" href="default.html" alt="Area predefinita">
```

## Esempio Completo

Ecco un esempio di una mappa immagine che utilizza diverse forme:

```html
<img src="mappa-italia.jpg" alt="Mappa dell'Italia" usemap="#mappaItalia" width="600" height="800">

<map name="mappaItalia">
  <!-- Regione Nord (rettangolo) -->
  <area shape="rect" coords="100,50,300,200" href="nord.html" alt="Italia settentrionale">
  
  <!-- Roma (cerchio) -->
  <area shape="circle" coords="250,400,30" href="roma.html" alt="Roma">
  
  <!-- Sicilia (poligono) -->
  <area shape="poly" coords="200,650,300,630,350,680,280,720,180,700" href="sicilia.html" alt="Sicilia">
  
  <!-- Resto d'Italia (default) -->
  <area shape="default" href="italia.html" alt="Altre regioni d'Italia">
</map>
```

## Attributi Aggiuntivi per l'Elemento `<area>`

Oltre agli attributi base, l'elemento `<area>` supporta diversi altri attributi:

### Attributo `target`

Specifica dove aprire la pagina collegata:

```html
<area shape="rect" coords="10,10,100,100" href="pagina.html" target="_blank" alt="Apri in nuova finestra">
```

### Attributo `rel`

Specifica la relazione tra la pagina corrente e la pagina collegata:

```html
<area shape="rect" coords="10,10,100,100" href="pagina.html" rel="nofollow" alt="Link nofollow">
```

### Attributo `title`

Fornisce informazioni aggiuntive visualizzate come tooltip:

```html
<area shape="rect" coords="10,10,100,100" href="pagina.html" title="Clicca per maggiori informazioni" alt="Informazioni">
```

## Strumenti per Creare Mappe Immagine

Creare manualmente le coordinate per le mappe immagine può essere complesso. Esistono diversi strumenti online che semplificano questo processo:

1. **Image Map Generator**: Strumenti online che permettono di disegnare aree su un'immagine e generare automaticamente il codice HTML
2. **Editor di immagini**: Software come GIMP o Photoshop possono mostrare le coordinate dei pixel, facilitando la creazione manuale delle coordinate

## Accessibilità delle Mappe Immagine

Per garantire che le mappe immagine siano accessibili:

1. **Usa sempre l'attributo `alt`** per ogni area, fornendo una descrizione significativa
2. **Considera alternative testuali** per l'intera mappa, come una lista di link equivalenti
3. **Usa nomi descrittivi** per le destinazioni dei link

```html
<!-- Mappa immagine accessibile -->
<img src="mappa-prodotti.jpg" alt="Categorie di prodotti" usemap="#mappaProdotti">

<map name="mappaProdotti">
  <area shape="rect" coords="10,10,100,100" href="elettronica.html" alt="Elettronica">
  <area shape="rect" coords="110,10,200,100" href="abbigliamento.html" alt="Abbigliamento">
  <area shape="rect" coords="210,10,300,100" href="casa.html" alt="Casa e Giardino">
</map>

<!-- Alternative testuale -->
<div class="alternative-links">
  <p>Naviga per categoria:</p>
  <ul>
    <li><a href="elettronica.html">Elettronica</a></li>
    <li><a href="abbigliamento.html">Abbigliamento</a></li>
    <li><a href="casa.html">Casa e Giardino</a></li>
  </ul>
</div>
```

## Responsive Mappe Immagine

Le mappe immagine tradizionali non sono naturalmente responsive, poiché le coordinate sono specificate in pixel assoluti. Per creare mappe immagine responsive:

1. **Usa percentuali invece di pixel** (supportato solo in alcuni browser)
2. **Implementa soluzioni JavaScript** che ricalcolano le coordinate in base alle dimensioni attuali dell'immagine
3. **Considera l'uso di SVG** come alternativa alle mappe immagine tradizionali

## Esempi Pratici

### Mappa Geografica Interattiva

```html
<figure>
  <img src="mappa-europa.jpg" alt="Mappa dell'Europa" usemap="#mappaEuropa" width="800" height="600">
  <figcaption>Clicca su un paese per maggiori informazioni</figcaption>
</figure>

<map name="mappaEuropa">
  <area shape="poly" coords="150,100,200,80,250,100,230,150,170,160" href="francia.html" alt="Francia">
  <area shape="poly" coords="300,150,350,130,400,150,380,200,320,210" href="germania.html" alt="Germania">
  <area shape="poly" coords="350,250,400,230,450,250,430,300,370,310" href="italia.html" alt="Italia">
  <!-- Altri paesi... -->
</map>
```

### Diagramma Tecnico Interattivo

```html
<figure>
  <img src="diagramma-computer.jpg" alt="Componenti di un computer" usemap="#mappaComputer" width="600" height="400">
  <figcaption>Clicca su un componente per i dettagli</figcaption>
</figure>

<map name="mappaComputer">
  <area shape="rect" coords="100,50,200,100" href="cpu.html" alt="CPU">
  <area shape="rect" coords="220,50,320,100" href="ram.html" alt="Memoria RAM">
  <area shape="rect" coords="100,150,200,200" href="hdd.html" alt="Disco rigido">
  <area shape="rect" coords="220,150,320,200" href="gpu.html" alt="Scheda video">
  <!-- Altri componenti... -->
</map>
```

## Best Practices

1. **Semplicità**: Mantieni le aree cliccabili semplici e facilmente identificabili
2. **Feedback visivo**: Fornisci un feedback visivo quando l'utente passa il mouse sopra un'area cliccabile (usando CSS o JavaScript)
3. **Alternative**: Offri sempre alternative testuali alle mappe immagine
4. **Test**: Verifica che le coordinate siano accurate e che tutte le aree funzionino correttamente
5. **Accessibilità**: Assicurati che la mappa immagine sia utilizzabile anche da utenti che utilizzano tecnologie assistive

## Navigazione del Corso
- [📑 Indice](../README.md)
- [⬅️ Figure e Didascalie](./05-FigureDidascalie.md)
- [➡️ Ottimizzazione delle Immagini](./07-OttimizzazioneImmagini.md)