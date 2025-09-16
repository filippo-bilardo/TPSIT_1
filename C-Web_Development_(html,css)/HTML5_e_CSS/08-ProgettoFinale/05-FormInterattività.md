# Form e Interattività nel Progetto Finale

## Introduzione

I form sono elementi essenziali per l'interazione con gli utenti, permettendo la raccolta di dati, feedback e facilitando la comunicazione. In questo modulo, esploreremo come implementare form interattivi, accessibili e funzionali per il nostro progetto finale.

## Struttura Base di un Form

Un form ben strutturato inizia con elementi HTML semantici:

```html
<form action="process.php" method="post" id="contact-form">
  <div class="form-group">
    <label for="name">Nome</label>
    <input type="text" id="name" name="name" required>
  </div>
  
  <div class="form-group">
    <label for="email">Email</label>
    <input type="email" id="email" name="email" required>
  </div>
  
  <div class="form-group">
    <label for="message">Messaggio</label>
    <textarea id="message" name="message" rows="5" required></textarea>
  </div>
  
  <button type="submit" class="btn-primary">Invia</button>
</form>
```

## Stili Responsive per Form

Rendere i form responsive è fondamentale per una buona esperienza utente su tutti i dispositivi:

```css
.form-group {
  margin-bottom: 20px;
}

label {
  display: block;
  margin-bottom: 5px;
  font-weight: 600;
}

input, textarea, select {
  width: 100%;
  padding: 10px;
  border: 1px solid #ddd;
  border-radius: 4px;
  font-size: 16px; /* Previene lo zoom automatico su iOS */
}

.btn-primary {
  display: inline-block;
  padding: 10px 20px;
  background-color: #0066cc;
  color: white;
  border: none;
  border-radius: 4px;
  cursor: pointer;
  font-size: 16px;
  transition: background-color 0.3s ease;
}

.btn-primary:hover {
  background-color: #0052a3;
}

/* Stili per dispositivi mobili */
@media (max-width: 768px) {
  input, textarea, select, .btn-primary {
    padding: 12px; /* Aumenta l'area cliccabile su mobile */
  }
}
```

## Validazione dei Form

### Validazione HTML5

Utilizza gli attributi di validazione HTML5 per un primo livello di controllo:

```html
<input type="email" id="email" name="email" required>
<input type="tel" id="phone" name="phone" pattern="[0-9]{10}" title="Inserisci un numero di telefono di 10 cifre">
<input type="text" id="username" name="username" minlength="3" maxlength="20">
```

### Validazione con JavaScript

Per una validazione più complessa e personalizzata, utilizza JavaScript:

```javascript
document.getElementById('contact-form').addEventListener('submit', function(event) {
  let valid = true;
  const email = document.getElementById('email');
  const name = document.getElementById('name');
  const message = document.getElementById('message');
  
  // Reset errori precedenti
  document.querySelectorAll('.error-message').forEach(el => el.remove());
  document.querySelectorAll('.error').forEach(el => el.classList.remove('error'));
  
  // Validazione email
  const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
  if (!emailRegex.test(email.value)) {
    showError(email, 'Inserisci un indirizzo email valido');
    valid = false;
  }
  
  // Validazione nome
  if (name.value.trim().length < 2) {
    showError(name, 'Il nome deve contenere almeno 2 caratteri');
    valid = false;
  }
  
  // Validazione messaggio
  if (message.value.trim().length < 10) {
    showError(message, 'Il messaggio deve contenere almeno 10 caratteri');
    valid = false;
  }
  
  if (!valid) {
    event.preventDefault();
  }
});

function showError(input, message) {
  input.classList.add('error');
  const errorDiv = document.createElement('div');
  errorDiv.className = 'error-message';
  errorDiv.textContent = message;
  input.parentNode.appendChild(errorDiv);
}
```

E gli stili corrispondenti:

```css
.error {
  border-color: #ff3860;
}

.error-message {
  color: #ff3860;
  font-size: 14px;
  margin-top: 5px;
}
```

## Feedback Interattivo

Fornire feedback visivo durante l'interazione migliora l'esperienza utente:

```css
input:focus, textarea:focus {
  outline: none;
  border-color: #0066cc;
  box-shadow: 0 0 0 2px rgba(0, 102, 204, 0.2);
}

input:valid, textarea:valid {
  border-color: #22c55e;
}

input:invalid, textarea:invalid {
  border-color: #ff3860;
}
```

## Form Avanzati

### Form Multi-step

Per form complessi, considera un approccio multi-step:

```html
<form id="multi-step-form">
  <!-- Step 1: Informazioni personali -->
  <div class="form-step" id="step1">
    <h2>Informazioni Personali</h2>
    <!-- Campi del form -->
    <button type="button" class="next-btn">Avanti</button>
  </div>
  
  <!-- Step 2: Dettagli progetto -->
  <div class="form-step" id="step2" style="display: none;">
    <h2>Dettagli Progetto</h2>
    <!-- Campi del form -->
    <button type="button" class="prev-btn">Indietro</button>
    <button type="button" class="next-btn">Avanti</button>
  </div>
  
  <!-- Step 3: Conferma -->
  <div class="form-step" id="step3" style="display: none;">
    <h2>Conferma</h2>
    <!-- Riepilogo -->
    <button type="button" class="prev-btn">Indietro</button>
    <button type="submit">Invia</button>
  </div>
</form>
```

```javascript
document.querySelectorAll('.next-btn').forEach(button => {
  button.addEventListener('click', function() {
    // Validazione dello step corrente
    const currentStep = this.closest('.form-step');
    const nextStep = currentStep.nextElementSibling;
    
    // Logica di validazione qui
    
    currentStep.style.display = 'none';
    nextStep.style.display = 'block';
  });
});

document.querySelectorAll('.prev-btn').forEach(button => {
  button.addEventListener('click', function() {
    const currentStep = this.closest('.form-step');
    const prevStep = currentStep.previousElementSibling;
    
    currentStep.style.display = 'none';
    prevStep.style.display = 'block';
  });
});
```

### Caricamento File

Per implementare un caricamento file con anteprima:

```html
<div class="form-group">
  <label for="file-upload">Carica un'immagine</label>
  <input type="file" id="file-upload" name="file" accept="image/*">
  <div id="file-preview" class="file-preview"></div>
</div>
```

```javascript
document.getElementById('file-upload').addEventListener('change', function() {
  const preview = document.getElementById('file-preview');
  preview.innerHTML = '';
  
  if (this.files && this.files[0]) {
    const reader = new FileReader();
    
    reader.onload = function(e) {
      const img = document.createElement('img');
      img.src = e.target.result;
      img.alt = 'Anteprima';
      preview.appendChild(img);
    }
    
    reader.readAsDataURL(this.files[0]);
  }
});
```

## Accessibilità dei Form

Rendere i form accessibili è fondamentale per garantire che tutti gli utenti possano interagire con il tuo sito:

### Etichette e Associazioni

```html
<!-- Usa sempre label associate agli input -->
<label for="email">Email</label>
<input type="email" id="email" name="email">

<!-- Per gruppi di input come radio buttons -->
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
```

### Attributi ARIA

```html
<div class="form-group">
  <label for="password">Password</label>
  <input type="password" id="password" name="password" aria-describedby="password-help">
  <div id="password-help" class="help-text">La password deve contenere almeno 8 caratteri, inclusi numeri e simboli.</div>
</div>

<!-- Per errori di validazione -->
<input type="email" id="email" name="email" aria-invalid="true" aria-describedby="email-error">
<div id="email-error" class="error-message" role="alert">Inserisci un indirizzo email valido</div>
```

## Integrazione con Backend

Per il progetto finale, puoi simulare l'invio del form con JavaScript:

```javascript
document.getElementById('contact-form').addEventListener('submit', function(event) {
  event.preventDefault();
  
  // Mostra indicatore di caricamento
  const submitBtn = this.querySelector('button[type="submit"]');
  const originalText = submitBtn.textContent;
  submitBtn.disabled = true;
  submitBtn.innerHTML = '<span class="spinner"></span> Invio in corso...';
  
  // Simula una richiesta AJAX
  setTimeout(() => {
    // Nascondi il form
    this.style.display = 'none';
    
    // Mostra messaggio di successo
    const successMessage = document.createElement('div');
    successMessage.className = 'success-message';
    successMessage.innerHTML = '<h3>Grazie per il tuo messaggio!</h3><p>Ti risponderemo al più presto.</p>';
    this.parentNode.appendChild(successMessage);
  }, 2000);
});
```

## Altre Forme di Interattività

### Tooltip

```html
<button class="tooltip-trigger">Aiuto
  <span class="tooltip">Questo è un messaggio di aiuto che fornisce informazioni aggiuntive.</span>
</button>
```

```css
.tooltip-trigger {
  position: relative;
  display: inline-block;
}

.tooltip {
  visibility: hidden;
  width: 200px;
  background-color: #333;
  color: #fff;
  text-align: center;
  border-radius: 4px;
  padding: 5px;
  position: absolute;
  z-index: 1;
  bottom: 125%;
  left: 50%;
  transform: translateX(-50%);
  opacity: 0;
  transition: opacity 0.3s;
}

.tooltip-trigger:hover .tooltip {
  visibility: visible;
  opacity: 1;
}
```

### Accordion

```html
<div class="accordion">
  <div class="accordion-item">
    <button class="accordion-header">Sezione 1</button>
    <div class="accordion-content">
      <p>Contenuto della sezione 1...</p>
    </div>
  </div>
  
  <div class="accordion-item">
    <button class="accordion-header">Sezione 2</button>
    <div class="accordion-content">
      <p>Contenuto della sezione 2...</p>
    </div>
  </div>
</div>
```

```javascript
document.querySelectorAll('.accordion-header').forEach(button => {
  button.addEventListener('click', function() {
    this.classList.toggle('active');
    const content = this.nextElementSibling;
    
    if (content.style.maxHeight) {
      content.style.maxHeight = null;
    } else {
      content.style.maxHeight = content.scrollHeight + 'px';
    }
  });
});
```

## Conclusione

I form e gli elementi interattivi sono componenti cruciali di un sito web moderno. Implementandoli correttamente, puoi migliorare significativamente l'esperienza utente e facilitare la comunicazione con i visitatori del tuo sito.

Per il progetto finale, assicurati che i tuoi form siano non solo funzionali, ma anche accessibili, responsive e forniscano un feedback chiaro agli utenti durante l'interazione.

## Esercizio Pratico

Implementa un form di contatto completo per il tuo progetto finale che includa:

1. Validazione client-side con feedback visivo immediato
2. Design responsive che funzioni bene su tutti i dispositivi
3. Accessibilità completa (etichette, attributi ARIA, navigazione da tastiera)
4. Feedback di successo dopo l'invio (simulato)
5. Almeno un elemento interattivo aggiuntivo (tooltip, accordion, tabs, ecc.)

## Risorse Aggiuntive

- [MDN Web Docs: Validazione dei Form](https://developer.mozilla.org/en-US/docs/Learn/Forms/Form_validation)
- [W3C: Accessibilità dei Form](https://www.w3.org/WAI/tutorials/forms/)
- [CSS-Tricks: Styling Form Controls](https://css-tricks.com/styling-form-controls-planet-earth/)

## Navigazione
- [Indice del Progetto Finale](./README.md)
- [⬅️ Contenuti Multimediali](./04-ContenutiMultimediali.md)
- [➡️ Accessibilità](./06-Accessibilità.md)