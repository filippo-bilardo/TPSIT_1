# Accessibilità dei Form

## Introduzione

Creare form accessibili è fondamentale per garantire che tutti gli utenti, inclusi quelli con disabilità, possano interagire efficacemente con le tue pagine web. L'accessibilità non è solo una questione etica o legale, ma migliora anche l'esperienza utente per tutti. In questa guida, esploreremo le best practices per rendere i form HTML accessibili.

## Perché l'Accessibilità è Importante

- **Inclusività**: Permette a tutti gli utenti di accedere e utilizzare i tuoi form
- **Conformità legale**: Molti paesi hanno leggi che richiedono l'accessibilità dei siti web
- **SEO**: I siti accessibili tendono ad avere un migliore posizionamento nei motori di ricerca
- **Usabilità universale**: Le pratiche di accessibilità migliorano l'esperienza per tutti gli utenti

## Principi Fondamentali

### 1. Struttura Semantica

Utilizza elementi HTML semantici per strutturare i form in modo logico e comprensibile.

```html
<form>
  <fieldset>
    <legend>Informazioni Personali</legend>
    
    <div>
      <label for="nome">Nome</label>
      <input type="text" id="nome" name="nome">
    </div>
    
    <div>
      <label for="email">Email</label>
      <input type="email" id="email" name="email">
    </div>
  </fieldset>
</form>
```

### 2. Etichette Esplicite

Ogni campo di input deve avere un'etichetta associata esplicitamente tramite l'attributo `for`.

```html
<!-- Corretto: etichetta associata esplicitamente -->
<label for="nome">Nome</label>
<input type="text" id="nome" name="nome">

<!-- Errato: etichetta non associata -->
<label>Nome</label>
<input type="text" name="nome">
```

### 3. Istruzioni Chiare

Fornisci istruzioni chiare su come compilare il form e su quali campi sono obbligatori.

```html
<label for="password">Password</label>
<input type="password" id="password" name="password" aria-describedby="password-help" required>
<p id="password-help">La password deve contenere almeno 8 caratteri, inclusi numeri e lettere maiuscole.</p>
```

### 4. Gestione degli Errori

Fornisci messaggi di errore chiari e accessibili.

```html
<label for="email">Email</label>
<input type="email" id="email" name="email" aria-describedby="email-error" required>
<p id="email-error" role="alert" class="error-message">Inserisci un indirizzo email valido.</p>
```

## Tecniche di Accessibilità

### ARIA (Accessible Rich Internet Applications)

Gli attributi ARIA migliorano l'accessibilità dei form moderni.

#### Attributi ARIA Comuni

- **aria-required**: Indica che un campo è obbligatorio
- **aria-describedby**: Collega un campo a un testo descrittivo
- **aria-invalid**: Indica se un campo contiene un valore non valido
- **aria-labelledby**: Collega un campo a un'etichetta o a più elementi di etichetta

```html
<label id="email-label">Email</label>
<input type="email" aria-labelledby="email-label" aria-required="true" aria-describedby="email-tip" aria-invalid="false">
<p id="email-tip">Inserisci il tuo indirizzo email personale.</p>
```

### Gruppi di Campi

Utilizza `<fieldset>` e `<legend>` per raggruppare campi correlati, particolarmente utile per checkbox e radio button.

```html
<fieldset>
  <legend>Preferenze di contatto</legend>
  
  <div>
    <input type="radio" id="contatto-email" name="contatto" value="email">
    <label for="contatto-email">Email</label>
  </div>
  
  <div>
    <input type="radio" id="contatto-telefono" name="contatto" value="telefono">
    <label for="contatto-telefono">Telefono</label>
  </div>
</fieldset>
```

### Ordine di Tabulazione

Assicurati che l'ordine di tabulazione (navigazione tramite tastiera) sia logico e segua il flusso visuale del form.

```html
<!-- L'ordine di tabulazione segue l'ordine degli elementi nel DOM -->
<div>
  <label for="nome">Nome</label>
  <input type="text" id="nome" name="nome" tabindex="1">
</div>

<div>
  <label for="email">Email</label>
  <input type="email" id="email" name="email" tabindex="2">
</div>

<!-- Usa tabindex solo quando necessario per modificare l'ordine naturale -->
```

> **Nota**: È generalmente consigliato evitare l'uso di `tabindex` con valori positivi, poiché può creare confusione nell'ordine di navigazione. Lascia che l'ordine naturale del DOM determini l'ordine di tabulazione quando possibile.

### Contrasto di Colore

Assicurati che ci sia un contrasto sufficiente tra il testo e lo sfondo per garantire la leggibilità.

```css
/* Buon contrasto */
input {
  color: #333; /* Testo scuro */
  background-color: #fff; /* Sfondo chiaro */
  border: 1px solid #666; /* Bordo visibile */
}

/* Contrasto per stati di focus */
input:focus {
  outline: 2px solid #0066cc; /* Outline ben visibile */
  box-shadow: 0 0 3px #0066cc; /* Effetto aggiuntivo */
}
```

### Dimensioni dei Target di Click

Assicurati che i pulsanti e altri elementi interattivi siano sufficientemente grandi per essere facilmente selezionabili.

```css
button, 
input[type="submit"], 
input[type="reset"], 
input[type="button"] {
  min-width: 44px;
  min-height: 44px;
  padding: 10px 15px;
}

/* Rendi le etichette dei checkbox/radio cliccabili e sufficientemente grandi */
label {
  display: inline-block;
  padding: 5px;
  cursor: pointer;
}
```

## Gestione Avanzata dell'Accessibilità

### Form Dinamici

Quando aggiorni dinamicamente il contenuto di un form con JavaScript, assicurati che le tecnologie assistive siano informate dei cambiamenti.

```html
<!-- Regione live che annuncia i cambiamenti -->
<div aria-live="polite" id="form-feedback"></div>

<script>
  // Esempio di aggiornamento di un feedback
  function updateFeedback(message) {
    document.getElementById('form-feedback').textContent = message;
  }
  
  // Dopo la validazione di un campo
  document.getElementById('email').addEventListener('blur', function() {
    if (!this.validity.valid) {
      updateFeedback('L\'indirizzo email inserito non è valido.');
    } else {
      updateFeedback('Email valida!');
    }
  });
</script>
```

### Nascondere Visivamente Mantenendo l'Accessibilità

A volte è necessario nascondere elementi visivamente ma mantenerli accessibili per le tecnologie assistive.

```css
.visually-hidden {
  position: absolute;
  width: 1px;
  height: 1px;
  margin: -1px;
  padding: 0;
  overflow: hidden;
  clip: rect(0, 0, 0, 0);
  border: 0;
}
```

```html
<label for="ricerca">
  <span class="visually-hidden">Cerca nel sito</span>
</label>
<input type="search" id="ricerca" name="q">
```

### Placeholder e Accessibilità

I placeholder non sostituiscono le etichette, poiché scompaiono quando l'utente inizia a digitare e possono avere un contrasto insufficiente.

```html
<!-- Corretto: etichetta + placeholder -->
<label for="telefono">Numero di telefono</label>
<input type="tel" id="telefono" name="telefono" placeholder="Es. 123-456-7890">

<!-- Errato: solo placeholder -->
<input type="tel" name="telefono" placeholder="Numero di telefono">
```

## Esempio di Form Completamente Accessibile

```html
<!DOCTYPE html>
<html lang="it">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Form Accessibile</title>
  <style>
    /* Stili di base */
    body {
      font-family: Arial, sans-serif;
      line-height: 1.6;
      color: #333;
      max-width: 600px;
      margin: 0 auto;
      padding: 20px;
    }
    
    /* Stili per il form */
    form {
      background-color: #f9f9f9;
      padding: 20px;
      border-radius: 5px;
      border: 1px solid #ddd;
    }
    
    fieldset {
      margin-bottom: 20px;
      border: 1px solid #ccc;
      border-radius: 4px;
      padding: 15px;
    }
    
    legend {
      font-weight: bold;
      padding: 0 10px;
    }
    
    .form-group {
      margin-bottom: 15px;
    }
    
    label {
      display: block;
      margin-bottom: 5px;
      font-weight: bold;
    }
    
    input, select, textarea {
      width: 100%;
      padding: 10px;
      border: 1px solid #ccc;
      border-radius: 4px;
      font-size: 16px;
    }
    
    input:focus, select:focus, textarea:focus {
      outline: 2px solid #4a90e2;
      border-color: #4a90e2;
    }
    
    .checkbox-group, .radio-group {
      margin-bottom: 10px;
    }
    
    .checkbox-label, .radio-label {
      display: flex;
      align-items: center;
      font-weight: normal;
      cursor: pointer;
    }
    
    input[type="checkbox"], input[type="radio"] {
      width: auto;
      margin-right: 10px;
    }
    
    .help-text {
      display: block;
      margin-top: 5px;
      font-size: 14px;
      color: #666;
    }
    
    .error-message {
      color: #d9534f;
      font-size: 14px;
      margin-top: 5px;
      display: none;
    }
    
    input:invalid:not(:focus):not(:placeholder-shown) + .error-message {
      display: block;
    }
    
    button {
      background-color: #4a90e2;
      color: white;
      border: none;
      padding: 12px 20px;
      border-radius: 4px;
      cursor: pointer;
      font-size: 16px;
      min-width: 44px;
      min-height: 44px;
    }
    
    button:hover, button:focus {
      background-color: #357ae8;
    }
    
    button:focus {
      outline: 2px solid #1c4f93;
      outline-offset: 2px;
    }
    
    .required-field::after {
      content: " *";
      color: #d9534f;
    }
    
    .visually-hidden {
      position: absolute;
      width: 1px;
      height: 1px;
      margin: -1px;
      padding: 0;
      overflow: hidden;
      clip: rect(0, 0, 0, 0);
      border: 0;
    }
    
    .status-area {
      margin-top: 20px;
      padding: 10px;
      border-radius: 4px;
    }
  </style>
</head>
<body>
  <main>
    <h1>Modulo di Contatto Accessibile</h1>
    
    <p>Compila il modulo sottostante per contattarci. I campi contrassegnati con * sono obbligatori.</p>
    
    <div aria-live="polite" id="form-status" class="status-area"></div>
    
    <form id="contact-form" novalidate>
      <fieldset>
        <legend>Informazioni Personali</legend>
        
        <div class="form-group">
          <label for="nome" class="required-field">Nome</label>
          <input type="text" id="nome" name="nome" required 
                 aria-required="true" 
                 aria-describedby="nome-help nome-error"
                 placeholder="Il tuo nome">
          <span id="nome-help" class="help-text">Inserisci il tuo nome completo</span>
          <div id="nome-error" class="error-message" role="alert">Il nome è obbligatorio</div>
        </div>
        
        <div class="form-group">
          <label for="email" class="required-field">Email</label>
          <input type="email" id="email" name="email" required 
                 aria-required="true" 
                 aria-describedby="email-help email-error"
                 placeholder="La tua email">
          <span id="email-help" class="help-text">Inserisci un indirizzo email valido</span>
          <div id="email-error" class="error-message" role="alert">Inserisci un indirizzo email valido</div>
        </div>
        
        <div class="form-group">
          <label for="telefono">Telefono</label>
          <input type="tel" id="telefono" name="telefono" 
                 aria-describedby="telefono-help"
                 placeholder="Es. 123-456-7890">
          <span id="telefono-help" class="help-text">Formato: 123-456-7890 (opzionale)</span>
        </div>
      </fieldset>
      
      <fieldset>
        <legend>Il Tuo Messaggio</legend>
        
        <div class="form-group">
          <label for="oggetto" class="required-field">Oggetto</label>
          <select id="oggetto" name="oggetto" required 
                  aria-required="true">
            <option value="" disabled selected>Seleziona un oggetto</option>
            <option value="informazioni">Richiesta informazioni</option>
            <option value="supporto">Supporto tecnico</option>
            <option value="feedback">Feedback</option>
            <option value="altro">Altro</option>
          </select>
        </div>
        
        <div class="form-group">
          <label for="messaggio" class="required-field">Messaggio</label>
          <textarea id="messaggio" name="messaggio" rows="5" required 
                    aria-required="true" 
                    aria-describedby="messaggio-help messaggio-error"
                    placeholder="Scrivi qui il tuo messaggio"></textarea>
          <span id="messaggio-help" class="help-text">Sii il più specifico possibile</span>
          <div id="messaggio-error" class="error-message" role="alert">Il messaggio è obbligatorio</div>
        </div>
      </fieldset>
      
      <fieldset>
        <legend>Preferenze</legend>
        
        <div class="form-group">
          <p id="contatto-group-label">Come preferisci essere contattato?</p>
          
          <div class="radio-group" role="radiogroup" aria-labelledby="contatto-group-label">
            <label class="radio-label">
              <input type="radio" name="contatto" value="email" checked>
              Via email
            </label>
            
            <label class="radio-label">
              <input type="radio" name="contatto" value="telefono">
              Via telefono
            </label>
          </div>
        </div>
        
        <div class="form-group">
          <p id="interessi-group-label">Quali argomenti ti interessano? (opzionale)</p>
          
          <div class="checkbox-group">
            <label class="checkbox-label">
              <input type="checkbox" name="interessi[]" value="prodotti">
              Prodotti
            </label>
            
            <label class="checkbox-label">
              <input type="checkbox" name="interessi[]" value="servizi">
              Servizi
            </label>
            
            <label class="checkbox-label">
              <input type="checkbox" name="interessi[]" value="supporto">
              Supporto
            </label>
          </div>
        </div>
      </fieldset>
      
      <div class="form-group">
        <label class="checkbox-label">
          <input type="checkbox" name="privacy" required aria-required="true">
          <span>Accetto la <a href="#" target="_blank">Privacy Policy</a></span>
        </label>
      </div>
      
      <div class="form-actions">
        <button type="reset">Annulla</button>
        <button type="submit">Invia Messaggio</button>
      </div>
    </form>
  </main>
  
  <script>
    // Script per migliorare l'accessibilità
    document.addEventListener('DOMContentLoaded', function() {
      const form = document.getElementById('contact-form');
      const statusArea = document.getElementById('form-status');
      
      // Gestione degli errori di validazione
      const inputs = form.querySelectorAll('input, textarea, select');
      
      inputs.forEach(input => {
        input.addEventListener('blur', function() {
          validateInput(this);
        });
        
        input.addEventListener('input', function() {
          if (this.getAttribute('aria-invalid') === 'true') {
            validateInput(this);
          }
        });
      });
      
      function validateInput(input) {
        if (input.hasAttribute('required') && input.value.trim() === '') {
          input.setAttribute('aria-invalid', 'true');
        } else if (input.type === 'email' && input.value.trim() !== '' && !isValidEmail(input.value)) {
          input.setAttribute('aria-invalid', 'true');
        } else {
          input.setAttribute('aria-invalid', 'false');
        }
      }
      
      function isValidEmail(email) {
        const regex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        return regex.test(email);
      }
      
      // Gestione dell'invio del form
      form.addEventListener('submit', function(event) {
        event.preventDefault();
        
        let isValid = true;
        let firstInvalidField = null;
        
        inputs.forEach(input => {
          if (input.hasAttribute('required')) {
            validateInput(input);
            
            if (input.getAttribute('aria-invalid') === 'true' && !firstInvalidField) {
              firstInvalidField = input;
              isValid = false;
            }
          }
        });
        
        if (!isValid) {
          statusArea.textContent = 'Si prega di correggere gli errori nel form prima di inviarlo.';
          statusArea.style.backgroundColor = '#f8d7da';
          statusArea.style.color = '#721c24';
          
          // Focus sul primo campo non valido
          if (firstInvalidField) {
            firstInvalidField.focus();
          }
        } else {
          // Simulazione di invio del form
          statusArea.textContent = 'Grazie! Il tuo messaggio è stato inviato con successo.';
          statusArea.style.backgroundColor = '#d4edda';
          statusArea.style.color = '#155724';
          form.reset();
        }
      });
    });
  </script>
</body>
</html>
```

## Strumenti per Testare l'Accessibilità

1. **Screen Reader**:
   - NVDA (Windows, gratuito)
   - VoiceOver (macOS, integrato)
   - JAWS (Windows, commerciale)

2. **Strumenti di Validazione**:
   - WAVE Web Accessibility Evaluation Tool
   - Axe DevTools
   - Lighthouse (integrato in Chrome DevTools)

3. **Test da Tastiera**:
   - Naviga il form usando solo la tastiera (Tab, Shift+Tab, Spazio, Invio)
   - Verifica che tutti gli elementi siano raggiungibili e utilizzabili

## Checklist per l'Accessibilità dei Form

- [ ] Tutti i campi hanno etichette associate esplicitamente
- [ ] I campi obbligatori sono chiaramente indicati
- [ ] I messaggi di errore sono chiari e accessibili
- [ ] Il form è navigabile tramite tastiera
- [ ] I gruppi di campi correlati sono racchiusi in `<fieldset>` con `<legend>`
- [ ] C'è un contrasto sufficiente tra testo e sfondo
- [ ] Gli elementi interattivi hanno dimensioni adeguate
- [ ] I placeholder non sostituiscono le etichette
- [ ] Gli attributi ARIA sono utilizzati correttamente
- [ ] Il form funziona con screen reader

## Conclusione

Creare form accessibili richiede attenzione ai dettagli e comprensione delle diverse esigenze degli utenti. Seguendo le best practices descritte in questa guida, potrai creare form che non solo rispettano gli standard di accessibilità, ma offrono anche un'esperienza migliore per tutti gli utenti.

Ricorda che l'accessibilità è un processo continuo: testa regolarmente i tuoi form con diversi strumenti e, se possibile, con utenti reali che utilizzano tecnologie assistive.

## Navigazione del Corso
- [📑 Indice](../README.md)
- [⬅️ Stili CSS per Form](./06-StiliForm.md)
- [➡️ Progetto Finale](../08-ProgettoFinale/README.md)