# Accessibilità nel Progetto Finale

## Introduzione

L'accessibilità web è l'arte di creare siti web che possono essere utilizzati da tutti, indipendentemente dalle loro capacità o disabilità. In questo modulo, esploreremo i principi fondamentali dell'accessibilità web e come implementarli nel nostro progetto finale per garantire che il nostro sito sia inclusivo e conforme alle linee guida WCAG (Web Content Accessibility Guidelines).

## Principi Fondamentali dell'Accessibilità

Le linee guida WCAG si basano su quattro principi fondamentali, noti come POUR:

1. **Percepibile**: Le informazioni e i componenti dell'interfaccia utente devono essere presentati in modi che gli utenti possano percepire.
2. **Utilizzabile**: I componenti dell'interfaccia e la navigazione devono essere utilizzabili da tutti.
3. **Comprensibile**: Le informazioni e il funzionamento dell'interfaccia utente devono essere comprensibili.
4. **Robusto**: Il contenuto deve essere sufficientemente robusto da poter essere interpretato da una vasta gamma di user agent, incluse le tecnologie assistive.

## Implementazione dell'Accessibilità

### Struttura Semantica

Utilizza elementi HTML semantici per fornire significato e struttura al tuo contenuto:

```html
<header>
  <h1>Titolo del Sito</h1>
  <nav>
    <!-- Navigazione principale -->
  </nav>
</header>

<main>
  <article>
    <h2>Titolo dell'Articolo</h2>
    <section>
      <h3>Sottosezione</h3>
      <p>Contenuto...</p>
    </section>
  </article>
  
  <aside>
    <h2>Contenuto Correlato</h2>
    <!-- Contenuto secondario -->
  </aside>
</main>

<footer>
  <!-- Informazioni di piè di pagina -->
</footer>
```

### Testo Alternativo per le Immagini

Fornisci sempre un testo alternativo descrittivo per le immagini:

```html
<!-- Immagine informativa -->
<img src="grafico-vendite.jpg" alt="Grafico che mostra l'aumento delle vendite del 25% nel 2023">

<!-- Immagine decorativa -->
<img src="decorazione.jpg" alt="" role="presentation">
```

### Contrasto dei Colori

Assicurati che ci sia un contrasto sufficiente tra testo e sfondo:

```css
/* Buon contrasto */
.text-content {
  color: #333; /* Testo scuro */
  background-color: #fff; /* Sfondo chiaro */
}

/* Per elementi importanti, considera un contrasto ancora maggiore */
.important-notice {
  color: #000;
  background-color: #f8f8f8;
  border: 2px solid #000;
}
```

Utilizza strumenti come il [WebAIM Contrast Checker](https://webaim.org/resources/contrastchecker/) per verificare che il tuo contrasto soddisfi le linee guida WCAG.

### Navigazione da Tastiera

Assicurati che tutti gli elementi interattivi siano accessibili tramite tastiera:

```css
/* Stile per il focus visibile */
:focus {
  outline: 3px solid #4a90e2;
  outline-offset: 2px;
}

/* Mai nascondere completamente l'outline del focus */
:focus:not(:focus-visible) {
  outline: 1px solid #4a90e2;
}
```

### Attributi ARIA

Utilizza gli attributi ARIA quando necessario per migliorare l'accessibilità:

```html
<!-- Menu a discesa -->
<button aria-expanded="false" aria-controls="dropdown-menu">Menu</button>
<ul id="dropdown-menu" aria-hidden="true">
  <!-- Elementi del menu -->
</ul>

<!-- Notifiche di errore -->
<div role="alert" aria-live="assertive">
  Si è verificato un errore. Riprova più tardi.
</div>

<!-- Tabs -->
<div role="tablist">
  <button role="tab" aria-selected="true" aria-controls="panel-1" id="tab-1">Tab 1</button>
  <button role="tab" aria-selected="false" aria-controls="panel-2" id="tab-2">Tab 2</button>
</div>
<div id="panel-1" role="tabpanel" aria-labelledby="tab-1">Contenuto Tab 1</div>
<div id="panel-2" role="tabpanel" aria-labelledby="tab-2" hidden>Contenuto Tab 2</div>
```

### Form Accessibili

Crea form che siano facili da usare per tutti:

```html
<form>
  <div class="form-group">
    <label for="name">Nome</label>
    <input type="text" id="name" name="name" aria-required="true">
  </div>
  
  <div class="form-group">
    <label for="email">Email</label>
    <input type="email" id="email" name="email" aria-required="true" aria-describedby="email-help">
    <div id="email-help" class="help-text">Inserisci il tuo indirizzo email per ricevere la nostra newsletter.</div>
  </div>
  
  <fieldset>
    <legend>Preferenze di contatto</legend>
    <div>
      <input type="radio" id="contact-email" name="contact" value="email">
      <label for="contact-email">Email</label>
    </div>
    <div>
      <input type="radio" id="contact-phone" name="contact" value="phone">
      <label for="contact-phone">Telefono</label>
    </div>
  </fieldset>
  
  <button type="submit">Invia</button>
</form>
```

### Contenuti Multimediali Accessibili

Rendi accessibili video e audio:

```html
<video controls>
  <source src="video.mp4" type="video/mp4">
  <track src="sottotitoli.vtt" kind="subtitles" srclang="it" label="Italiano">
  <track src="descrizioni.vtt" kind="descriptions" srclang="it" label="Descrizioni audio">
  Il tuo browser non supporta il tag video.
</video>
```

## Test di Accessibilità

### Strumenti Automatici

Utilizza strumenti di test automatici per identificare problemi di accessibilità:

1. **Lighthouse** (integrato in Chrome DevTools)
2. **WAVE** (Web Accessibility Evaluation Tool)
3. **axe DevTools** (estensione per browser)

### Test Manuali

I test automatici non possono rilevare tutti i problemi. Esegui anche test manuali:

1. **Navigazione da tastiera**: Naviga nel tuo sito utilizzando solo la tastiera (Tab, Shift+Tab, Enter, frecce)
2. **Screen reader**: Testa il tuo sito con uno screen reader (NVDA, VoiceOver, JAWS)
3. **Zoom del browser**: Verifica che il tuo sito funzioni correttamente con zoom al 200%
4. **Contrasto dei colori**: Controlla il contrasto con strumenti dedicati

## Checklist di Accessibilità per il Progetto Finale

### Struttura e Semantica
- [ ] Utilizzo corretto di elementi HTML semantici (header, nav, main, footer, ecc.)
- [ ] Struttura gerarchica dei titoli (h1, h2, h3, ecc.)
- [ ] Landmark ARIA quando necessario

### Contenuti
- [ ] Testo alternativo per tutte le immagini
- [ ] Trascrizioni e sottotitoli per contenuti audio/video
- [ ] Contrasto sufficiente tra testo e sfondo
- [ ] Testo ridimensionabile senza perdita di funzionalità

### Interazione
- [ ] Tutti gli elementi interattivi accessibili da tastiera
- [ ] Focus visibile per elementi interattivi
- [ ] Ordine di tabulazione logico
- [ ] Nessuna trappola per la tastiera

### Form
- [ ] Etichette associate correttamente agli input
- [ ] Messaggi di errore chiari e accessibili
- [ ] Gruppi di input logici (fieldset/legend)
- [ ] Istruzioni chiare per la compilazione

### Navigazione
- [ ] Skip link per saltare ai contenuti principali
- [ ] Breadcrumb per siti complessi
- [ ] Link con testo descrittivo (evitare "clicca qui")
- [ ] Stato corrente indicato nella navigazione

## Conclusione

L'accessibilità non è un optional, ma una componente essenziale di un sito web di qualità. Implementando le pratiche descritte in questo modulo, non solo renderai il tuo progetto finale accessibile a un pubblico più ampio, ma migliorerai anche l'esperienza utente per tutti.

Ricorda che l'accessibilità è un processo continuo: testa regolarmente il tuo sito, raccogli feedback dagli utenti e apporta miglioramenti quando necessario.

## Esercizio Pratico

Per il tuo progetto finale, implementa le seguenti funzionalità di accessibilità:

1. Struttura semantica completa con landmark appropriati
2. Skip link per saltare alla navigazione e ai contenuti principali
3. Form completamente accessibile con etichette, feedback e navigazione da tastiera
4. Test di accessibilità con almeno uno strumento automatico e correzione dei problemi identificati
5. Verifica della navigazione da tastiera in tutto il sito

## Risorse Aggiuntive

- [W3C Web Accessibility Initiative (WAI)](https://www.w3.org/WAI/)
- [WebAIM: Web Accessibility In Mind](https://webaim.org/)
- [The A11Y Project](https://www.a11yproject.com/)
- [MDN Web Docs: Accessibilità](https://developer.mozilla.org/en-US/docs/Web/Accessibility)

## Navigazione
- [Indice del Progetto Finale](./README.md)
- [⬅️ Form e Interattività](./05-FormInterattività.md)
- [➡️ Performance](./07-Performance.md)