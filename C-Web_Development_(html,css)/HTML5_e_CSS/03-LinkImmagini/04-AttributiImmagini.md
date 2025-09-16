# Attributi delle Immagini in HTML5

## Introduzione

Gli attributi delle immagini in HTML5 permettono di controllare vari aspetti di come le immagini vengono visualizzate e interpretate. Questi attributi sono fondamentali per migliorare l'accessibilità, l'usabilità e le prestazioni delle pagine web. In questa guida, esploreremo i principali attributi dell'elemento `<img>` e come utilizzarli correttamente.

## Attributo `alt`

L'attributo `alt` (testo alternativo) è uno degli attributi più importanti per le immagini. Fornisce una descrizione testuale dell'immagine che viene utilizzata:

- Quando l'immagine non può essere caricata
- Da screen reader per utenti con disabilità visive
- Da motori di ricerca per comprendere il contenuto dell'immagine

```html
<img src="logo-azienda.png" alt="Logo di Azienda XYZ">
```

### Best Practices per l'attributo `alt`

1. **Sii descrittivo ma conciso**: Il testo alternativo dovrebbe descrivere accuratamente l'immagine senza essere eccessivamente lungo
2. **Considera il contesto**: La descrizione dovrebbe essere rilevante per il contesto in cui l'immagine è utilizzata
3. **Immagini decorative**: Per immagini puramente decorative, usa `alt=""` (non omettere l'attributo)
4. **Immagini con testo**: Includi il testo presente nell'immagine nel valore di `alt`

```html
<!-- Immagine informativa -->
<img src="grafico-vendite.png" alt="Grafico delle vendite trimestrali 2023 con aumento del 15%">

<!-- Immagine decorativa -->
<img src="separatore.png" alt="">

<!-- Immagine con testo -->
<img src="banner.jpg" alt="Offerta speciale: 30% di sconto su tutti i prodotti">
```

## Attributi `width` e `height`

Gli attributi `width` (larghezza) e `height` (altezza) specificano le dimensioni dell'immagine. Possono essere espressi in pixel o in percentuale:

```html
<!-- Dimensioni in pixel -->
<img src="prodotto.jpg" alt="Prodotto XYZ" width="300" height="200">

<!-- Larghezza in percentuale -->
<img src="banner.jpg" alt="Banner promozionale" width="100%">
```

### Vantaggi di specificare le dimensioni

1. **Prevenzione del layout shift**: Il browser riserva lo spazio corretto prima che l'immagine sia caricata
2. **Migliori prestazioni**: Aiuta il browser a calcolare il layout della pagina più velocemente
3. **Controllo del design**: Permette di controllare con precisione le dimensioni delle immagini

## Attributo `title`

L'attributo `title` fornisce informazioni aggiuntive sull'immagine. Viene visualizzato come tooltip quando l'utente passa il mouse sopra l'immagine:

```html
<img src="foto-prodotto.jpg" alt="Smartphone XYZ" title="Smartphone XYZ - Disponibile in nero, bianco e blu">
```

**Nota**: Non utilizzare `title` come sostituto di `alt`. Hanno scopi diversi: `alt` è essenziale per l'accessibilità, mentre `title` è supplementare.

## Attributo `loading`

L'attributo `loading` controlla quando il browser deve caricare l'immagine. È particolarmente utile per migliorare le prestazioni della pagina:

```html
<!-- Caricamento lazy: l'immagine viene caricata solo quando si avvicina al viewport -->
<img src="immagine-grande.jpg" alt="Descrizione" loading="lazy">

<!-- Caricamento immediato (comportamento predefinito) -->
<img src="logo-header.png" alt="Logo" loading="eager">
```

## Attributo `srcset`

L'attributo `srcset` permette di specificare diverse versioni della stessa immagine per diverse risoluzioni o dimensioni dello schermo:

```html
<img src="immagine-base.jpg" 
     alt="Descrizione immagine"
     srcset="immagine-small.jpg 500w,
             immagine-medium.jpg 1000w,
             immagine-large.jpg 1500w"
     sizes="(max-width: 600px) 100vw, 50vw">
```

Dove:
- `500w`, `1000w`, `1500w` indicano la larghezza in pixel di ciascuna immagine
- `sizes` definisce la larghezza dell'immagine in relazione al viewport

## Attributo `decoding`

L'attributo `decoding` suggerisce al browser come decodificare l'immagine:

```html
<!-- Decodifica asincrona (non blocca il rendering della pagina) -->
<img src="immagine.jpg" alt="Descrizione" decoding="async">

<!-- Decodifica sincrona (blocca il rendering fino a quando l'immagine non è decodificata) -->
<img src="immagine-critica.jpg" alt="Descrizione" decoding="sync">

<!-- Lascia decidere al browser (comportamento predefinito) -->
<img src="immagine.jpg" alt="Descrizione" decoding="auto">
```

## Attributo `crossorigin`

L'attributo `crossorigin` specifica se l'immagine deve essere caricata con una richiesta CORS (Cross-Origin Resource Sharing):

```html
<!-- Richiesta CORS con credenziali -->
<img src="https://altro-dominio.com/immagine.jpg" alt="Descrizione" crossorigin="use-credentials">

<!-- Richiesta CORS senza credenziali -->
<img src="https://altro-dominio.com/immagine.jpg" alt="Descrizione" crossorigin="anonymous">
```

## Attributo `ismap` e `usemap`

Questi attributi sono utilizzati per le mappe immagine:

- `ismap`: Dichiara un'immagine come mappa lato server
- `usemap`: Collega l'immagine a una mappa lato client

```html
<!-- Mappa lato server -->
<a href="server-map-handler.php">
  <img src="mappa.jpg" alt="Mappa cliccabile" ismap>
</a>

<!-- Mappa lato client -->
<img src="mappa.jpg" alt="Mappa cliccabile" usemap="#mappaRegioni">
<map name="mappaRegioni">
  <area shape="rect" coords="0,0,100,100" href="regione1.html" alt="Regione 1">
  <area shape="circle" coords="200,200,50" href="regione2.html" alt="Regione 2">
</map>
```

## Esempi Pratici

### Immagine Completamente Accessibile

```html
<img src="prodotto-principale.jpg" 
     alt="Smartphone XYZ con display da 6.5 pollici e tripla fotocamera" 
     width="400" 
     height="300" 
     loading="lazy" 
     decoding="async">
```

### Immagine Responsive con Set Completo di Attributi

```html
<img src="foto-default.jpg" 
     alt="Vista panoramica delle montagne al tramonto" 
     srcset="foto-small.jpg 500w,
             foto-medium.jpg 1000w,
             foto-large.jpg 1500w" 
     sizes="(max-width: 600px) 100vw, (max-width: 1200px) 50vw, 33vw" 
     width="100%" 
     loading="lazy" 
     decoding="async">
```

## Best Practices

1. **Accessibilità**: Usa sempre l'attributo `alt` con un testo descrittivo appropriato
2. **Prestazioni**: Specifica `width` e `height`, usa `loading="lazy"` per immagini non critiche
3. **Responsive**: Utilizza `srcset` e `sizes` per fornire immagini ottimizzate per diverse dimensioni dello schermo
4. **Semantica**: Usa l'elemento `<figure>` con `<figcaption>` per immagini che richiedono una didascalia
5. **Ottimizzazione**: Fornisci immagini nel formato più appropriato e ottimizzato

## Navigazione del Corso
- [📑 Indice](../README.md)
- [⬅️ Immagini](./03-Immagini.md)
- [➡️ Figure e Didascalie](./05-FigureDidascalie.md)