# Sintassi di base e regole CSS

## Indice dei contenuti
- [Struttura di una regola CSS](#struttura-di-una-regola-css)
  - [Selettori](#selettori)
  - [Dichiarazioni](#dichiarazioni)
- [Proprietà CSS comuni](#proprietà-css-comuni)
- [Valori e unità di misura](#valori-e-unità-di-misura)
- [Shorthand properties](#shorthand-properties)
- [Commenti in CSS](#commenti-in-css)
- [Best Practice](#best-practice)
- [Domande di autovalutazione](#domande-di-autovalutazione)
- [Esercizi proposti](#esercizi-proposti)
- [Risorse esterne](#risorse-esterne)

La sintassi CSS è progettata per essere semplice e leggibile, permettendo agli sviluppatori di definire come gli elementi HTML devono essere visualizzati. Comprendere la struttura di base delle regole CSS è fondamentale per creare fogli di stile efficaci.

## Struttura di una regola CSS

Una regola CSS è composta da due parti principali: un **selettore** e un **blocco di dichiarazioni**.

```css
selettore {
    proprietà: valore;    /* Questa è una dichiarazione */
    proprietà2: valore2;  /* Un'altra dichiarazione */
}
```

### Selettori

I selettori indicano a quale elemento HTML si applica lo stile. Possono essere:

- **Selettori di elemento**: puntano a elementi HTML specifici
  ```css
  p { color: blue; }  /* Tutti i paragrafi saranno blu */
  ```

- **Selettori di classe**: puntano a elementi con una specifica classe
  ```css
  .nota { font-style: italic; }  /* Tutti gli elementi con class="nota" saranno in corsivo */
  ```

- **Selettori di ID**: puntano a un elemento con un ID specifico
  ```css
  #intestazione { font-size: 24px; }  /* L'elemento con id="intestazione" avrà dimensione 24px */
  ```

### Dichiarazioni

Le dichiarazioni sono composte da una coppia **proprietà:valore** e definiscono come l'elemento selezionato deve essere stilizzato.

- La **proprietà** è un attributo dell'elemento che si desidera modificare (come `color`, `font-size`, `margin`)
- Il **valore** è l'impostazione specifica per quella proprietà
- Ogni dichiarazione termina con un punto e virgola (`;`)

```css
h1 {
    color: #333;        /* Colore del testo */
    font-size: 2em;     /* Dimensione del font */
    margin-bottom: 20px; /* Margine inferiore */
}
```

## Valori e unità di misura

I valori CSS possono essere espressi in diverse forme:

### Colori
- **Nomi dei colori**: `red`, `blue`, `transparent`
- **Valori esadecimali**: `#ff0000` (rosso), `#00ff00` (verde)
- **RGB**: `rgb(255, 0, 0)` (rosso)
- **RGBA**: `rgba(255, 0, 0, 0.5)` (rosso con 50% di opacità)
- **HSL**: `hsl(0, 100%, 50%)` (rosso)
- **HSLA**: `hsla(0, 100%, 50%, 0.5)` (rosso con 50% di opacità)

### Unità di lunghezza
- **Assolute**:
  - `px` (pixel)
  - `pt` (punti)
  - `in` (pollici)
  - `cm` (centimetri)
  - `mm` (millimetri)

- **Relative**:
  - `em` (relativa alla dimensione del font dell'elemento)
  - `rem` (relativa alla dimensione del font dell'elemento root)
  - `%` (percentuale relativa all'elemento genitore)
  - `vw` (1% della larghezza della viewport)
  - `vh` (1% dell'altezza della viewport)

### Altri valori
- **Numeri**: `0`, `1`, `2.5`
- **Stringhe**: `"Helvetica, Arial, sans-serif"`
- **Funzioni**: `url()`, `calc()`, `rotate()`
- **Parole chiave**: `auto`, `none`, `inherit`

## Regole di shorthand

CSS offre proprietà shorthand che permettono di impostare più valori con una singola dichiarazione:

```css
/* Invece di scrivere: */
margin-top: 10px;
margin-right: 15px;
margin-bottom: 10px;
margin-left: 15px;

/* Si può usare la shorthand: */
margin: 10px 15px 10px 15px;

/* O ancora più conciso (top/bottom e left/right uguali): */
margin: 10px 15px;
```

Esempi comuni di proprietà shorthand:
- `margin` e `padding`: definiscono i margini e il padding in un'unica dichiarazione
- `border`: combina `border-width`, `border-style` e `border-color`
- `font`: combina diverse proprietà del font come `font-size`, `font-family`, `font-weight`
- `background`: combina proprietà come `background-color`, `background-image`, `background-position`

## Commenti in CSS

I commenti in CSS sono racchiusi tra `/*` e `*/` e possono estendersi su più righe:

```css
/* Questo è un commento CSS */

body {
    color: black;  /* Colore del testo */
    /* Questa dichiarazione è commentata e non avrà effetto
    background-color: white; */
}
```

## Regole @

Le regole @ (at-rules) forniscono istruzioni su come il CSS deve comportarsi. Alcune delle più comuni sono:

- **@import**: importa un foglio di stile esterno
  ```css
  @import url('typography.css');
  ```

- **@media**: applica stili solo in determinate condizioni (come dimensioni dello schermo)
  ```css
  @media screen and (max-width: 600px) {
      body { font-size: 14px; }
  }
  ```

- **@font-face**: definisce font personalizzati
  ```css
  @font-face {
      font-family: 'MyCustomFont';
      src: url('fonts/custom-font.woff2');
  }
  ```

- **@keyframes**: definisce animazioni
  ```css
  @keyframes slide-in {
      from { transform: translateX(-100%); }
      to { transform: translateX(0); }
  }
  ```

## Best Practice

- **Mantenere la specificità bassa**: evitare selettori eccessivamente specifici
- **Usare classi invece di ID** quando possibile per maggiore riutilizzabilità
- **Organizzare le dichiarazioni** in modo logico (es. raggruppare proprietà correlate)
- **Utilizzare shorthand** per codice più conciso
- **Commentare il codice** per spiegare sezioni complesse o decisioni di design
- **Evitare l'uso di `!important`** a meno che non sia assolutamente necessario

## Suggerimenti

> **Suggerimento**: Utilizzate strumenti di validazione CSS come il [W3C CSS Validator](https://jigsaw.w3.org/css-validator/) per verificare che il vostro CSS sia corretto e privo di errori.

> **Suggerimento**: Quando si lavora con progetti complessi, considerare l'adozione di metodologie CSS come BEM, SMACSS o OOCSS per mantenere il codice organizzato e scalabile.

## Domande di autovalutazione

1. Quali sono le due parti principali di una regola CSS?
2. Qual è la differenza tra un selettore di classe e un selettore di ID?
3. Elenca tre tipi di unità di misura relative in CSS e spiega quando è appropriato usarle.
4. Cosa sono le proprietà shorthand e perché sono utili?
5. Quali sono i vantaggi dell'utilizzo di commenti nel codice CSS?

## Esercizi

1. **Esercizio base**: Crea un foglio di stile che definisca colori, dimensioni dei font e margini per elementi HTML di base (h1, h2, p, a).

2. **Esercizio intermedio**: Implementa un sistema di colori utilizzando variabili CSS (custom properties) per creare un tema coerente con colori primari, secondari e di accento.

3. **Esercizio avanzato**: Crea un foglio di stile che utilizzi diverse regole @media per adattare il layout a diverse dimensioni dello schermo (desktop, tablet, mobile).

---

- [📑 Indice](../README.md)
- [⬅️ Selettori e Specificità](02_Come_collegare_CSS_a_HTML.md)
- [➡️ Commenti e organizzazione del codice](04_Commenti_e_organizzazione_del_codice.md)