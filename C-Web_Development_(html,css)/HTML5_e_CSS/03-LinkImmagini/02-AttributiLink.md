# Attributi dei Link in HTML5

## Introduzione

Gli attributi dei link permettono di controllare il comportamento e le proprietà dei collegamenti ipertestuali. In HTML5, esistono diversi attributi che possono essere applicati all'elemento `<a>` per specificare come il link deve comportarsi, dove aprire la risorsa collegata e fornire informazioni aggiuntive sia agli utenti che ai motori di ricerca.

## Attributo `target`

L'attributo `target` specifica dove aprire il documento collegato. I valori più comuni sono:

```html
<!-- Apre il link nella stessa finestra/tab (comportamento predefinito) -->
<a href="https://example.com" target="_self">Link esempio</a>

<!-- Apre il link in una nuova finestra/tab -->
<a href="https://example.com" target="_blank">Link in nuova finestra</a>

<!-- Apre il link nel frame padre (se presente) -->
<a href="https://example.com" target="_parent">Link nel frame padre</a>

<!-- Apre il link nel frame principale (se presente) -->
<a href="https://example.com" target="_top">Link nel frame principale</a>
```

### Considerazioni di Sicurezza con `target="_blank"`

Quando si utilizza `target="_blank"`, è consigliabile aggiungere anche l'attributo `rel="noopener noreferrer"` per motivi di sicurezza:

```html
<a href="https://example.com" target="_blank" rel="noopener noreferrer">Link sicuro</a>
```

Questo previene che la pagina aperta possa accedere alla finestra originale attraverso l'oggetto `window.opener`, proteggendo da potenziali attacchi di phishing.

## Attributo `rel`

L'attributo `rel` specifica la relazione tra la pagina corrente e la pagina collegata. I valori più comuni includono:

- `nofollow`: Indica ai motori di ricerca di non seguire il link
- `noopener`: Previene che la pagina aperta possa accedere alla finestra originale
- `noreferrer`: Impedisce di inviare l'informazione di provenienza alla pagina di destinazione
- `alternate`: Indica una versione alternativa del documento
- `author`: Indica un link all'autore del documento
- `help`: Indica un link a una pagina di aiuto
- `license`: Indica un link alla licenza del documento

```html
<a href="https://example.com" rel="nofollow">Link non seguito dai motori di ricerca</a>
<a href="/licenza.html" rel="license">Licenza</a>
<a href="/autore.html" rel="author">Autore</a>
```

## Attributo `title`

L'attributo `title` fornisce informazioni aggiuntive sul link. Questo testo viene visualizzato come tooltip quando l'utente passa il mouse sopra il link:

```html
<a href="https://example.com" title="Visita il sito di Example.com per maggiori informazioni">Example</a>
```

## Attributo `download`

L'attributo `download` indica che il link dovrebbe scaricare la risorsa invece di navigare ad essa. Può includere un valore che sarà il nome del file scaricato:

```html
<a href="/files/report.pdf" download>Scarica il report</a>
<a href="/files/report.pdf" download="report-annuale-2023.pdf">Scarica il report annuale</a>
```

## Attributo `hreflang`

L'attributo `hreflang` specifica la lingua della risorsa collegata:

```html
<a href="https://example.com/fr/" hreflang="fr">Version française</a>
<a href="https://example.com/de/" hreflang="de">Deutsche Version</a>
```

## Attributo `type`

L'attributo `type` specifica il tipo MIME della risorsa collegata:

```html
<a href="report.pdf" type="application/pdf">Report PDF</a>
<a href="presentation.pptx" type="application/vnd.openxmlformats-officedocument.presentationml.presentation">Presentazione</a>
```

## Link con attributi multipli

Spesso è necessario combinare più attributi per ottenere il comportamento desiderato:

```html
<a href="https://example.com" 
   target="_blank" 
   rel="noopener noreferrer" 
   title="Visita Example.com in una nuova finestra">
   Visita Example.com
</a>
```

## Best Practices

1. **Sicurezza**: Usa sempre `rel="noopener noreferrer"` con `target="_blank"`
2. **Accessibilità**: Fornisci testi descrittivi per i link e usa l'attributo `title` per informazioni aggiuntive
3. **Chiarezza**: Il testo del link dovrebbe indicare chiaramente dove porterà l'utente
4. **Consistenza**: Mantieni uno stile coerente per i link in tutto il sito
5. **Internazionalizzazione**: Usa `hreflang` quando colleghi a contenuti in altre lingue

## Esempi Pratici

### Link a Email

```html
<a href="mailto:info@example.com" title="Inviaci un'email">Contattaci</a>
```

### Link a Numero di Telefono

```html
<a href="tel:+391234567890" title="Chiamaci">+39 123 456 7890</a>
```

### Link a File da Scaricare

```html
<a href="/files/brochure.pdf" download="brochure-2023.pdf" type="application/pdf" title="Dimensione: 2.5MB">Scarica la nostra brochure</a>
```

## Navigazione del Corso
- [📑 Indice](../README.md)
- [⬅️ Collegamenti Ipertestuali](./01-Collegamenti.md)
- [➡️ Immagini](./03-Immagini.md)