# Esercitazione 1: Primi passi con HTML5

## Obiettivi
In questa esercitazione imparerai a:
- Creare la struttura base di una pagina HTML5
- Utilizzare i tag principali per formattare il testo
- Inserire collegamenti ipertestuali e immagini
- Validare il codice HTML

## Prerequisiti
- Conoscenza base dei concetti di HTML5 (vedi sezioni 1 e 2 del corso)
- Un editor di testo (VS Code, Sublime Text, Notepad++, ecc.)
- Un browser web moderno (Chrome, Firefox, Edge, ecc.)

## Esercizio 1: La tua prima pagina HTML

### Istruzioni
1. Crea un nuovo file chiamato `index.html`
2. Inserisci la struttura base di una pagina HTML5 con i tag `<!DOCTYPE html>`, `<html>`, `<head>` e `<body>`
3. Nel tag `<head>`, aggiungi:
   - Un titolo appropriato usando il tag `<title>`
   - Il tag `<meta charset="UTF-8">`
   - Il tag `<meta name="viewport" content="width=device-width, initial-scale=1.0">`
4. Nel tag `<body>`, aggiungi:
   - Un titolo principale (h1) con il tuo nome
   - Un sottotitolo (h2) con "Il mio primo sito web"
   - Un paragrafo che descrive brevemente i tuoi interessi

### Esempio di codice
```html
<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>La mia prima pagina</title>
</head>
<body>
    <h1>Mario Rossi</h1>
    <h2>Il mio primo sito web</h2>
    <p>Benvenuti nel mio primo sito web! Mi piace la programmazione, la musica e lo sport.</p>
</body>
</html>
```

## Esercizio 2: Formattazione del testo

### Istruzioni
1. Continua a lavorare sul file `index.html` creato nell'esercizio precedente
2. Aggiungi una sezione "Chi sono" con:
   - Un titolo di livello 3 (h3)
   - Un paragrafo con testo formattato usando i tag `<strong>`, `<em>`, `<mark>` e `<br>`
3. Aggiungi una lista non ordinata dei tuoi hobby usando il tag `<ul>`
4. Aggiungi una lista ordinata delle tue competenze usando il tag `<ol>`

## Esercizio 3: Collegamenti e immagini

### Istruzioni
1. Aggiungi una sezione "Collegamenti utili" con:
   - Un titolo di livello 3 (h3)
   - Una lista di almeno 3 collegamenti a siti web che ti interessano usando il tag `<a>`
   - Assicurati che i collegamenti si aprano in una nuova scheda usando l'attributo `target="_blank"`
2. Aggiungi un'immagine che ti rappresenta o che ti piace usando il tag `<img>`
   - Assicurati di aggiungere l'attributo `alt` con una descrizione appropriata
   - Imposta una larghezza appropriata usando l'attributo `width`

## Verifica e validazione
1. Apri il file `index.html` nel tuo browser per verificare che tutto funzioni correttamente
2. Utilizza il validatore W3C (https://validator.w3.org/) per verificare che il tuo codice HTML sia valido
3. Correggi eventuali errori o avvisi segnalati dal validatore

## Consegna
Al termine dell'esercitazione, dovresti avere un file `index.html` che contiene:
- La struttura base di una pagina HTML5
- Titoli di diversi livelli
- Paragrafi con testo formattato
- Liste ordinate e non ordinate
- Collegamenti ipertestuali
- Un'immagine

## Risorse aggiuntive
- [MDN Web Docs - HTML](https://developer.mozilla.org/it/docs/Web/HTML)
- [W3Schools - HTML Tutorial](https://www.w3schools.com/html/)
- [HTML5 Doctor](http://html5doctor.com/)

---
[Torna all'indice delle esercitazioni](../README.md)