# Introduzione all'accessibilità web (WCAG e ARIA)

## Fondamenti dell'accessibilità web

L'accessibilità web si riferisce alla pratica di rendere i siti web e le applicazioni utilizzabili da tutte le persone, indipendentemente dalle loro capacità o disabilità. Questo concetto fondamentale si basa sul principio che il web dovrebbe essere uno spazio inclusivo, dove tutti possono percepire, comprendere, navigare e interagire con i contenuti digitali senza barriere.

Le disabilità che possono influenzare l'accesso al web sono diverse e comprendono:

- **Disabilità visive**: cecità, ipovisione, daltonismo
- **Disabilità uditive**: sordità e ipoacusia
- **Disabilità motorie**: difficoltà nei movimenti, paralisi, condizioni che limitano la destrezza
- **Disabilità cognitive**: disturbi dell'apprendimento, deficit di attenzione, dislessia
- **Disabilità neurologiche**: epilessia, sclerosi multipla, autismo

Ogni categoria di disabilità presenta sfide specifiche nell'interazione con i contenuti web. Ad esempio, le persone non vedenti utilizzano screen reader per navigare, mentre le persone con mobilità ridotta potrebbero utilizzare dispositivi di input alternativi come switch o comandi vocali.

L'accessibilità web non beneficia solo le persone con disabilità permanenti, ma anche:

- Utenti con disabilità temporanee (come un braccio rotto)
- Persone anziane con capacità in cambiamento
- Utenti in situazioni limitanti (ambienti rumorosi, connessioni lente)
- Utenti di dispositivi mobili o con schermi piccoli
- Persone che utilizzano tecnologie obsolete

Dal punto di vista legale e normativo, molti paesi hanno adottato leggi che richiedono l'accessibilità dei siti web, specialmente per i servizi pubblici e governativi. Negli Stati Uniti, l'Americans with Disabilities Act (ADA) e la Section 508 regolano l'accessibilità digitale, mentre in Europa la Direttiva sull'Accessibilità del Web (WAD) stabilisce requisiti per i siti del settore pubblico. In Italia, la Legge Stanca (Legge 4/2004) definisce le regole per l'accessibilità dei siti della pubblica amministrazione.

## Web Content Accessibility Guidelines (WCAG)

Le Web Content Accessibility Guidelines (WCAG) rappresentano lo standard internazionale per l'accessibilità web, sviluppate dal Web Accessibility Initiative (WAI) del World Wide Web Consortium (W3C). Queste linee guida forniscono un framework completo per rendere i contenuti web accessibili a persone con diverse abilità.

Le WCAG hanno attraversato diverse versioni nel tempo:
- WCAG 1.0: pubblicate nel 1999, rappresentavano il primo tentativo di standardizzazione
- WCAG 2.0: rilasciate nel 2008, hanno introdotto i quattro principi fondamentali
- WCAG 2.1: pubblicate nel 2018, hanno aggiunto criteri per dispositivi mobili e disabilità cognitive
- WCAG 2.2: l'ultima versione, con ulteriori miglioramenti e aggiornamenti

I quattro principi fondamentali delle WCAG, spesso ricordati con l'acronimo POUR, sono:

1. **Percepibile**: le informazioni e i componenti dell'interfaccia utente devono essere presentati in modi che gli utenti possano percepire.
   - Fornire alternative testuali per contenuti non testuali
   - Fornire sottotitoli e trascrizioni per contenuti audio
   - Creare contenuti che possano essere presentati in modi diversi
   - Facilitare la visualizzazione e l'ascolto dei contenuti

2. **Utilizzabile**: i componenti dell'interfaccia e la navigazione devono essere utilizzabili da tutti.
   - Rendere tutte le funzionalità disponibili da tastiera
   - Dare agli utenti tempo sufficiente per leggere e utilizzare i contenuti
   - Non progettare contenuti che possano causare attacchi epilettici
   - Aiutare gli utenti a navigare e trovare i contenuti

3. **Comprensibile**: le informazioni e il funzionamento dell'interfaccia utente devono essere comprensibili.
   - Rendere il testo leggibile e comprensibile
   - Fare in modo che le pagine web appaiano e funzionino in modo prevedibile
   - Aiutare gli utenti a evitare e correggere gli errori

4. **Robusto**: il contenuto deve essere sufficientemente robusto da poter essere interpretato da una vasta gamma di user agent, comprese le tecnologie assistive.
   - Massimizzare la compatibilità con user agent attuali e futuri
   - Utilizzare markup valido e ben formato

Le WCAG definiscono tre livelli di conformità:

- **Livello A**: soddisfa i requisiti minimi di accessibilità (barriere più significative)
- **Livello AA**: affronta le barriere più comuni e significative (livello generalmente richiesto per la conformità legale)
- **Livello AAA**: il più alto livello di accessibilità (non sempre raggiungibile per tutti i tipi di contenuto)

Esempio di implementazione del criterio 1.1.1 (Alternative testuali, Livello A):

```html
<!-- Corretto: immagine con testo alternativo -->
<img src="logo.png" alt="Logo aziendale XYZ Corp">

<!-- Corretto: immagine decorativa con alt vuoto -->
<img src="decorazione.png" alt="">

<!-- Scorretto: immagine senza testo alternativo -->
<img src="grafico.png">
```

## Implementazione pratica delle WCAG

L'implementazione delle WCAG richiede un approccio sistematico che coinvolge diverse aree dello sviluppo web. Ecco alcune linee guida pratiche per soddisfare i criteri più importanti:

**Fornire alternative testuali per contenuti non testuali** (1.1.1, Livello A):

```html
<!-- Immagini informative -->
<img src="grafico-vendite.png" alt="Grafico delle vendite 2023: incremento del 25% nel Q3">

<!-- Immagini complesse con descrizione estesa -->
<img src="mappa.jpg" alt="Mappa del campus" aria-describedby="desc-mappa">
<div id="desc-mappa" class="sr-only">Descrizione dettagliata della mappa del campus...</div>

<!-- Video con sottotitoli e trascrizione -->
<video controls>
  <source src="presentazione.mp4" type="video/mp4">
  <track kind="subtitles" src="sottotitoli.vtt" srclang="it" label="Italiano">
  <a href="trascrizione.html">Trascrizione del video</a>
</video>
```

**Garantire la navigabilità da tastiera** (2.1.1, Livello A):

```html
<!-- Assicurarsi che tutti gli elementi interattivi siano raggiungibili con il tab -->
<button type="button">Pulsante accessibile</button>

<!-- Non usare eventi solo per mouse -->
<button onclick="doSomething()" onkeydown="if(event.key==='Enter') doSomething()">Azione</button>

<!-- Ordine di tabulazione logico -->
<div>
  <a href="#" tabindex="1">Prima opzione</a>
  <a href="#" tabindex="2">Seconda opzione</a>
</div>
```

**Dare agli utenti tempo sufficiente** (2.2.1, Livello A):

```html
<!-- Permettere di estendere il timeout -->
<div role="alert" id="timeout-warning">
  La sessione scadrà tra <span id="countdown">60</span> secondi.
  <button onclick="extendSession()">Estendi sessione</button>
</div>
```

**Rendere il contenuto leggibile e comprensibile** (3.1.1, Livello A):

```html
<!-- Specificare la lingua della pagina -->
<html lang="it">

<!-- Specificare cambiamenti di lingua nel contenuto -->
<p>Questo è un testo in italiano. <span lang="en">This is in English.</span></p>
```

**Aiutare gli utenti a evitare e correggere gli errori** (3.3.1, Livello A):

```html
<!-- Identificare errori nei form -->
<label for="email">Email:</label>
<input type="email" id="email" aria-describedby="email-error">
<div id="email-error" class="error" role="alert" aria-live="assertive">Inserire un indirizzo email valido</div>

<!-- Fornire suggerimenti -->
<label for="password">Password:</label>
<input type="password" id="password" aria-describedby="password-hint">
<div id="password-hint">La password deve contenere almeno 8 caratteri, inclusi numeri e simboli</div>
```

**Assicurare la compatibilità con tecnologie assistive** (4.1.2, Livello A):

```html
<!-- Utilizzare elementi HTML semantici -->
<button type="button" aria-pressed="false">Attiva modalità scura</button>

<!-- Fornire nome, ruolo e valore per componenti personalizzati -->
<div role="button" tabindex="0" aria-pressed="false" onclick="toggleDarkMode()" onkeydown="if(event.key==='Enter') toggleDarkMode()">Attiva modalità scura</div>
```

## Accessible Rich Internet Applications (ARIA)

WAI-ARIA (Web Accessibility Initiative - Accessible Rich Internet Applications) è una specifica tecnica che fornisce un modo per migliorare l'accessibilità di contenuti e applicazioni web dinamiche. ARIA è particolarmente utile per componenti interattivi complessi e widget che non possono essere creati con elementi HTML nativi o che richiedono stati e proprietà dinamiche.

I componenti principali di ARIA sono:

1. **Ruoli**: definiscono cosa fa un elemento
2. **Stati**: descrivono le condizioni attuali di un elemento
3. **Proprietà**: forniscono informazioni aggiuntive sugli elementi

Ecco alcuni esempi di ruoli ARIA comuni:

```html
<!-- Menu di navigazione -->
<nav role="navigation" aria-label="Menu principale">
  <ul>
    <li><a href="/">Home</a></li>
    <li><a href="/prodotti">Prodotti</a></li>
  </ul>
</nav>

<!-- Regione con contenuto principale -->
<main role="main">
  <!-- Contenuto principale -->
</main>

<!-- Finestra di dialogo modale -->
<div role="dialog" aria-labelledby="dialog-title" aria-modal="true">
  <h2 id="dialog-title">Conferma azione</h2>
  <p>Sei sicuro di voler procedere?</p>
  <button>Conferma</button>
  <button>Annulla</button>
</div>
```

Gli stati ARIA comunicano le condizioni dinamiche degli elementi:

```html
<!-- Pulsante di attivazione/disattivazione -->
<button aria-pressed="false">Modalità scura</button>

<!-- Casella di controllo personalizzata -->
<div role="checkbox" tabindex="0" aria-checked="false">Accetto i termini</div>

<!-- Menu espandibile -->
<button aria-expanded="false" aria-controls="submenu">Categorie</button>
<ul id="submenu" hidden>
  <li><a href="#">Categoria 1</a></li>
  <li><a href="#">Categoria 2</a></li>
</ul>
```

Le proprietà ARIA forniscono informazioni aggiuntive sugli elementi:

```html
<!-- Etichetta per un campo di ricerca -->
<input type="text" aria-label="Cerca nel sito">

<!-- Descrizione aggiuntiva per un elemento -->
<button aria-describedby="tooltip-1">Salva</button>
<div id="tooltip-1" role="tooltip" hidden>Salva le modifiche al documento</div>

<!-- Relazione tra elementi -->
<div role="tablist">
  <button role="tab" aria-selected="true" aria-controls="panel-1">Tab 1</button>
  <button role="tab" aria-selected="false" aria-controls="panel-2">Tab 2</button>
</div>
<div id="panel-1" role="tabpanel" aria-labelledby="tab-1">Contenuto tab 1</div>
<div id="panel-2" role="tabpanel" aria-labelledby="tab-2" hidden>Contenuto tab 2</div>
```

Per implementare widget interattivi accessibili, è importante seguire i pattern ARIA stabiliti. Ad esempio, un menu a discesa accessibile:

```html
<div class="dropdown">
  <button aria-haspopup="true" aria-expanded="false" aria-controls="dropdown-menu">Menu</button>
  <ul id="dropdown-menu" role="menu" hidden>
    <li role="menuitem"><a href="#">Opzione 1</a></li>
    <li role="menuitem"><a href="#">Opzione 2</a></li>
    <li role="menuitem"><a href="#">Opzione 3</a></li>
  </ul>
</div>
```

È importante ricordare che ARIA non modifica il comportamento o l'aspetto degli elementi, ma solo come vengono interpretati dalle tecnologie assistive. È necessario implementare anche il comportamento JavaScript appropriato e lo styling CSS.

## Tecnologie assistive

Le tecnologie assistive sono dispositivi, software o strumenti che aiutano le persone con disabilità a utilizzare computer e navigare sul web. Comprendere come funzionano queste tecnologie è fondamentale per creare contenuti web veramente accessibili.

Gli screen reader sono software che leggono ad alta voce il contenuto dello schermo, permettendo alle persone non vedenti o ipovedenti di accedere alle informazioni digitali. I più diffusi includono:

- NVDA (NonVisual Desktop Access): gratuito e open source, popolare su Windows
- JAWS (

---

### Navigazione
- [📑 Indice](<../README.md>)
- [⬅️ Best practice per un markup semantico](<02_Best_practice_markup_semantico.md>)
- [➡️ Riferimento completo ai tag HTML5](<../Appendici/01_Riferimento_completo_tag_HTML5.md>)