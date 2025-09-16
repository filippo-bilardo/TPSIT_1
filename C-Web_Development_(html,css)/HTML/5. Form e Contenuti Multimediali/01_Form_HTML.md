# Form HTML

## Introduzione ai form HTML

I form HTML rappresentano uno strumento fondamentale per l'interazione tra utenti e siti web, permettendo la raccolta di dati e input. Questi elementi costituiscono l'interfaccia principale attraverso cui gli utenti possono comunicare con le applicazioni web, inviando informazioni che verranno elaborate dal server.

L'elemento `<form>` è il contenitore principale che racchiude tutti gli elementi interattivi. La sua sintassi base richiede almeno gli attributi `action` (che specifica dove inviare i dati) e `method` (che definisce il metodo HTTP da utilizzare):

```html
<form action="/processa-dati.php" method="post">
  <!-- Elementi del form -->
</form>
```

I metodi HTTP più comuni utilizzati nei form sono:
- **GET**: i dati vengono aggiunti all'URL come parametri di query string. Utile per richieste non sensibili e che non modificano dati sul server.
- **POST**: i dati vengono inviati nel corpo della richiesta HTTP. Appropriato per dati sensibili o quando si modificano dati sul server.

L'attributo `enctype` definisce come i dati del form vengono codificati quando vengono inviati al server:
- `application/x-www-form-urlencoded`: il valore predefinito, adatto per la maggior parte dei dati di testo
- `multipart/form-data`: necessario quando il form include file da caricare
- `text/plain`: raramente utilizzato, invia i dati come testo semplice

## Elementi di input e controlli

HTML offre una vasta gamma di elementi di input per raccogliere diversi tipi di dati dagli utenti. L'elemento `<input>` è il più versatile e può assumere diverse forme in base all'attributo `type`:

```html
<input type="text" name="username" placeholder="Inserisci username">
<input type="password" name="password" placeholder="Inserisci password">
<input type="email" name="email" placeholder="Inserisci email">
<input type="number" name="età" min="18" max="100">
<input type="date" name="data_nascita">
<input type="checkbox" name="accetto" value="si"> Accetto i termini e condizioni
<input type="radio" name="genere" value="m"> Maschio
<input type="radio" name="genere" value="f"> Femmina
<input type="file" name="documento" accept=".pdf,.doc,.docx">
<input type="submit" value="Invia">
<input type="reset" value="Reimposta">
```

Oltre all'elemento `<input>`, esistono altri controlli specifici per determinati tipi di dati:

```html
<!-- Area di testo multi-linea -->
<textarea name="commento" rows="4" cols="50" placeholder="Inserisci il tuo commento"></textarea>

<!-- Menu a discesa -->
<select name="paese">
  <option value="">Seleziona un paese</option>
  <option value="it">Italia</option>
  <option value="fr">Francia</option>
  <option value="de">Germania</option>
</select>

<!-- Gruppo di opzioni in un menu a discesa -->
<select name="città">
  <optgroup label="Italia">
    <option value="rm">Roma</option>
    <option value="mi">Milano</option>
  </optgroup>
  <optgroup label="Francia">
    <option value="pa">Parigi</option>
    <option value="ly">Lione</option>
  </optgroup>
</select>

<!-- Selezione di colore -->
<input type="color" name="colore_preferito">

<!-- Slider -->
<input type="range" name="volume" min="0" max="100" step="1">
```

## Etichette, raggruppamento e accessibilità

Per migliorare l'usabilità e l'accessibilità dei form, è importante utilizzare etichette e strutture di raggruppamento appropriate.

L'elemento `<label>` associa un'etichetta di testo a un controllo del form, migliorando sia l'usabilità (area cliccabile più ampia) che l'accessibilità (per screen reader):

```html
<!-- Metodo 1: usando l'attributo for -->
<label for="email">Indirizzo email:</label>
<input type="email" id="email" name="email">

<!-- Metodo 2: racchiudendo l'input -->
<label>
  Indirizzo email:
  <input type="email" name="email">
</label>
```

L'elemento `<fieldset>` permette di raggruppare controlli correlati, mentre `<legend>` fornisce una descrizione per il gruppo:

```html
<fieldset>
  <legend>Informazioni personali</legend>
  <label for="nome">Nome:</label>
  <input type="text" id="nome" name="nome"><br>
  <label for="cognome">Cognome:</label>
  <input type="text" id="cognome" name="cognome">
</fieldset>

<fieldset>
  <legend>Preferenze di contatto</legend>
  <input type="checkbox" id="email_contact" name="contatto[]" value="email">
  <label for="email_contact">Email</label><br>
  <input type="checkbox" id="tel_contact" name="contatto[]" value="telefono">
  <label for="tel_contact">Telefono</label>
</fieldset>
```

Per migliorare ulteriormente l'accessibilità, è possibile utilizzare attributi ARIA (Accessible Rich Internet Applications):

```html
<div role="group" aria-labelledby="preferenze-titolo">
  <h3 id="preferenze-titolo">Preferenze di notifica</h3>
  <input type="checkbox" id="notifica_news" name="notifiche[]" value="news">
  <label for="notifica_news">Notizie e aggiornamenti</label><br>
  <input type="checkbox" id="notifica_promo" name="notifiche[]" value="promo">
  <label for="notifica_promo">Offerte e promozioni</label>
</div>
```

## Validazione e attributi di controllo

HTML5 ha introdotto potenti funzionalità di validazione lato client che permettono di verificare i dati inseriti prima dell'invio al server, migliorando l'esperienza utente e riducendo il carico sul server.

Gli attributi di validazione più comuni includono:

```html
<!-- Campo obbligatorio -->
<input type="text" name="username" required>

<!-- Pattern di validazione (espressione regolare) -->
<input type="text" name="codice_postale" pattern="[0-9]{5}" title="Inserisci un codice postale valido di 5 cifre">

<!-- Lunghezza minima e massima -->
<input type="password" name="password" minlength="8" maxlength="20">

<!-- Intervallo numerico -->
<input type="number" name="età" min="18" max="100">

<!-- Suggerimenti di completamento automatico -->
<input type="email" name="email" autocomplete="email">
```

È possibile personalizzare i messaggi di errore utilizzando JavaScript e l'API di validazione dei form:

```html
<form id="registrazione">
  <input type="email" id="email" name="email" required>
  <span id="email-error"></span>
  <button type="submit">Registrati</button>
</form>

<script>
  const form = document.getElementById('registrazione');
  const emailInput = document.getElementById('email');
  const emailError = document.getElementById('email-error');
  
  emailInput.addEventListener('input', function() {
    if (emailInput.validity.valid) {
      emailError.textContent = '';
    } else if (emailInput.validity.valueMissing) {
      emailError.textContent = 'L\'email è obbligatoria';
    } else if (emailInput.validity.typeMismatch) {
      emailError.textContent = 'Inserisci un indirizzo email valido';
    }
  });
  
  form.addEventListener('submit', function(event) {
    if (!emailInput.validity.valid) {
      event.preventDefault();
      // Mostra messaggi di errore
    }
  });
</script>
```

## Best practice per i form

Per creare form efficaci e user-friendly, è importante seguire alcune best practice:

1. **Mantenere i form semplici e concisi**: richiedere solo le informazioni necessarie e organizzare i campi in modo logico.

2. **Fornire feedback chiaro**: indicare chiaramente quali campi sono obbligatori, mostrare messaggi di errore specifici e confermare quando il form è stato inviato con successo.

3. **Utilizzare i tipi di input appropriati**: sfruttare i tipi di input HTML5 specifici per attivare tastiere appropriate su dispositivi mobili e facilitare l'inserimento dei dati.

4. **Implementare un design responsivo**: assicurarsi che i form siano utilizzabili su tutti i dispositivi, con dimensioni di input adeguate per il touch.

5. **Considerare la sicurezza**: proteggere i form da attacchi come CSRF (Cross-Site Request Forgery) e XSS (Cross-Site Scripting).

```html
<!-- Esempio di form ben strutturato -->
<form action="/registrazione" method="post" class="form-responsive">
  <h2>Registrazione</h2>
  
  <div class="form-group">
    <label for="nome">Nome <span class="required">*</span></label>
    <input type="text" id="nome" name="nome" required autocomplete="given-name">
    <span class="error" id="nome-error"></span>
  </div>
  
  <div class="form-group">
    <label for="email">Email <span class="required">*</span></label>
    <input type="email" id="email" name="email" required autocomplete="email">
    <span class="error" id="email-error"></span>
  </div>
  
  <div class="form-group">
    <label for="password">Password <span class="required">*</span></label>
    <input type="password" id="password" name="password" required minlength="8" autocomplete="new-password">
    <span class="hint">Almeno 8 caratteri, inclusi numeri e simboli</span>
    <span class="error" id="password-error"></span>
  </div>
  
  <div class="form-group checkbox">
    <input type="checkbox" id="termini" name="termini" required>
    <label for="termini">Accetto i <a href="/termini">termini e condizioni</a> <span class="required">*</span></label>
    <span class="error" id="termini-error"></span>
  </div>
  
  <div class="form-actions">
    <button type="reset" class="btn-secondary">Annulla</button>
    <button type="submit" class="btn-primary">Registrati</button>
  </div>
  
  <p class="form-note"><span class="required">*</span> Campi obbligatori</p>
</form>
```

Implementando queste pratiche, è possibile creare form che non solo raccolgono dati in modo efficiente, ma offrono anche un'esperienza utente positiva, aumentando il tasso di completamento e la soddisfazione degli utenti.

## Conclusione

I form HTML rappresentano uno degli elementi più importanti per l'interazione tra utenti e siti web, consentendo la raccolta di dati e input in modo strutturato. HTML5 ha notevolmente migliorato questa esperienza, introducendo nuovi tipi di input, validazione nativa e funzionalità avanzate che semplificano sia lo sviluppo che l'utilizzo dei form.

Un form ben progettato non è solo funzionale, ma anche accessibile, user-friendly e sicuro. Prestare attenzione alla struttura semantica, all'etichettatura appropriata, alla validazione efficace e al feedback chiaro può trasformare un semplice modulo in uno strumento potente che migliora significativamente l'esperienza utente.

Ricordate che i form sono spesso il punto di conversione cruciale nei siti web, sia che si tratti di registrazioni, acquisti, richieste di informazioni o altre azioni importanti. Investire tempo nella progettazione e nell'implementazione di form ottimali, seguendo le best practice discusse in questo capitolo, può portare a risultati tangibili in termini di engagement, conversioni e soddisfazione degli utenti.

---

### Navigazione
- [📑 Indice](<../README.md>)
- [⬅️ Tecniche di posizionamento con CSS](<../4. Struttura e Layout delle Pagine/03_Tecniche_posizionamento_CSS.md>)
- [➡️ Audio e Video in HTML5](<02_Audio_Video_HTML5.md>)
