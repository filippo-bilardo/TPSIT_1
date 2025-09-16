# Stili CSS per Form

## Introduzione

L'aspetto visivo dei form è fondamentale per garantire una buona esperienza utente. Un form ben progettato non solo è esteticamente gradevole, ma migliora anche l'usabilità, l'accessibilità e il tasso di completamento. In questa guida, esploreremo come utilizzare CSS per personalizzare l'aspetto dei form HTML.

## Principi di Design per i Form

Prima di iniziare con il CSS, è importante considerare alcuni principi di design:

1. **Chiarezza**: Gli utenti devono capire facilmente cosa viene richiesto
2. **Semplicità**: Evitare elementi distrattivi o non necessari
3. **Coerenza**: Mantenere uno stile uniforme in tutto il form
4. **Feedback**: Fornire riscontri visivi sulle azioni dell'utente
5. **Accessibilità**: Garantire che il form sia utilizzabile da tutti

## Struttura Base di un Form Stilizzato

```html
<form class="form-container">
  <div class="form-group">
    <label for="nome">Nome</label>
    <input type="text" id="nome" name="nome">
    <span class="form-hint">Inserisci il tuo nome completo</span>
  </div>
  
  <div class="form-group">
    <label for="email">Email</label>
    <input type="email" id="email" name="email">
  </div>
  
  <div class="form-group">
    <label for="messaggio">Messaggio</label>
    <textarea id="messaggio" name="messaggio"></textarea>
  </div>
  
  <div class="form-actions">
    <button type="reset" class="btn-secondary">Annulla</button>
    <button type="submit" class="btn-primary">Invia</button>
  </div>
</form>
```

## Stili CSS di Base

```css
/* Stili generali del form */
.form-container {
  max-width: 600px;
  margin: 0 auto;
  padding: 20px;
  background-color: #f9f9f9;
  border-radius: 8px;
  box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
}

/* Gruppi di form (label + input) */
.form-group {
  margin-bottom: 20px;
}

/* Stili per le etichette */
label {
  display: block;
  margin-bottom: 5px;
  font-weight: bold;
  color: #333;
}

/* Stili per i campi di input */
input, textarea, select {
  width: 100%;
  padding: 10px;
  border: 1px solid #ddd;
  border-radius: 4px;
  font-size: 16px;
  transition: border-color 0.3s, box-shadow 0.3s;
}

/* Stili per i suggerimenti */
.form-hint {
  display: block;
  margin-top: 5px;
  font-size: 12px;
  color: #666;
}

/* Stili per i pulsanti */
button {
  padding: 10px 15px;
  border: none;
  border-radius: 4px;
  font-size: 16px;
  cursor: pointer;
  transition: background-color 0.3s;
}

.btn-primary {
  background-color: #4a90e2;
  color: white;
}

.btn-secondary {
  background-color: #f5f5f5;
  color: #333;
}

.form-actions {
  display: flex;
  justify-content: flex-end;
  gap: 10px;
}

/* Stati degli input */
input:focus, textarea:focus, select:focus {
  outline: none;
  border-color: #4a90e2;
  box-shadow: 0 0 5px rgba(74, 144, 226, 0.5);
}
```

## Personalizzazione degli Elementi di Form

### Checkbox e Radio Button Personalizzati

```css
/* Nascondi i checkbox/radio originali */
input[type="checkbox"],
input[type="radio"] {
  position: absolute;
  opacity: 0;
  width: 0;
  height: 0;
}

/* Crea checkbox/radio personalizzati */
input[type="checkbox"] + label,
input[type="radio"] + label {
  position: relative;
  padding-left: 30px;
  cursor: pointer;
  display: inline-block;
  line-height: 20px;
}

/* Stile per il "falso" checkbox/radio */
input[type="checkbox"] + label:before,
input[type="radio"] + label:before {
  content: '';
  position: absolute;
  left: 0;
  top: 0;
  width: 18px;
  height: 18px;
  border: 1px solid #ddd;
  background: #fff;
  transition: all 0.3s;
}

/* Forma rotonda per i radio button */
input[type="radio"] + label:before {
  border-radius: 50%;
}

/* Stile per checkbox/radio selezionati */
input[type="checkbox"]:checked + label:before {
  background: #4a90e2;
  border-color: #4a90e2;
}

input[type="radio"]:checked + label:before {
  border-width: 5px;
  border-color: #4a90e2;
}

/* Aggiungi un segno di spunta per i checkbox */
input[type="checkbox"]:checked + label:after {
  content: '';
  position: absolute;
  left: 6px;
  top: 2px;
  width: 6px;
  height: 12px;
  border: solid white;
  border-width: 0 2px 2px 0;
  transform: rotate(45deg);
}
```

### Select Personalizzati

```css
/* Contenitore per il select personalizzato */
.custom-select {
  position: relative;
  display: block;
  width: 100%;
}

/* Stile per il select nativo (nascosto visivamente ma accessibile) */
.custom-select select {
  display: block;
  width: 100%;
  padding: 10px 40px 10px 10px;
  border: 1px solid #ddd;
  border-radius: 4px;
  background-color: white;
  appearance: none;
  -webkit-appearance: none;
  -moz-appearance: none;
}

/* Freccia personalizzata */
.custom-select:after {
  content: '▼';
  position: absolute;
  right: 15px;
  top: 50%;
  transform: translateY(-50%);
  pointer-events: none;
  color: #666;
  font-size: 12px;
}

/* Stile per il focus */
.custom-select select:focus {
  outline: none;
  border-color: #4a90e2;
  box-shadow: 0 0 5px rgba(74, 144, 226, 0.5);
}
```

## Stili per Stati e Feedback

### Validazione e Errori

```css
/* Campi validi */
input:valid:not(:placeholder-shown) {
  border-color: #4CAF50;
}

/* Campi non validi */
input:invalid:not(:placeholder-shown) {
  border-color: #f44336;
}

/* Messaggio di errore */
.error-message {
  display: none;
  color: #f44336;
  font-size: 12px;
  margin-top: 5px;
}

/* Mostra il messaggio di errore solo quando il campo è non valido e non in focus */
input:invalid:not(:focus):not(:placeholder-shown) + .error-message {
  display: block;
}

/* Icone di validazione */
input:valid:not(:placeholder-shown) + .icon:after {
  content: '✓';
  color: #4CAF50;
  position: absolute;
  right: 10px;
  top: 50%;
  transform: translateY(-50%);
}

input:invalid:not(:placeholder-shown) + .icon:after {
  content: '✗';
  color: #f44336;
  position: absolute;
  right: 10px;
  top: 50%;
  transform: translateY(-50%);
}
```

### Stati Disabilitati

```css
input:disabled,
textarea:disabled,
select:disabled,
button:disabled {
  opacity: 0.6;
  cursor: not-allowed;
  background-color: #f5f5f5;
}

button:disabled {
  background-color: #cccccc;
  color: #666;
}
```

## Layout Responsive per Form

```css
/* Layout di base */
@media (min-width: 768px) {
  .form-row {
    display: flex;
    gap: 20px;
  }
  
  .form-col {
    flex: 1;
  }
}

/* Adattamento per schermi piccoli */
@media (max-width: 767px) {
  .form-container {
    padding: 15px;
  }
  
  input, textarea, select, button {
    padding: 8px;
    font-size: 14px;
  }
  
  .form-actions {
    flex-direction: column;
  }
  
  .form-actions button {
    width: 100%;
    margin-bottom: 10px;
  }
}
```

## Esempi di Temi per Form

### Tema Minimalista

```css
/* Tema minimalista */
.form-minimal {
  background-color: transparent;
  box-shadow: none;
  padding: 0;
}

.form-minimal input,
.form-minimal textarea,
.form-minimal select {
  border: none;
  border-bottom: 1px solid #ddd;
  border-radius: 0;
  padding: 10px 0;
  background-color: transparent;
}

.form-minimal input:focus,
.form-minimal textarea:focus,
.form-minimal select:focus {
  border-bottom-color: #4a90e2;
  box-shadow: none;
}

.form-minimal label {
  font-weight: normal;
  color: #999;
  transition: all 0.3s;
}

.form-minimal input:focus + label,
.form-minimal textarea:focus + label,
.form-minimal select:focus + label {
  color: #4a90e2;
  font-size: 12px;
  transform: translateY(-20px);
}
```

### Tema Materiale

```css
/* Tema materiale */
.form-material .form-group {
  position: relative;
  margin-bottom: 30px;
}

.form-material input,
.form-material textarea,
.form-material select {
  padding: 10px 0;
  border: none;
  border-bottom: 1px solid #ddd;
  border-radius: 0;
  background-color: transparent;
  transition: all 0.3s;
}

.form-material label {
  position: absolute;
  top: 10px;
  left: 0;
  transition: all 0.3s;
  pointer-events: none;
}

.form-material input:focus,
.form-material textarea:focus,
.form-material select:focus {
  border-bottom: 2px solid #4a90e2;
  box-shadow: none;
}

.form-material input:focus + label,
.form-material textarea:focus + label,
.form-material select:focus + label,
.form-material input:not(:placeholder-shown) + label,
.form-material textarea:not(:placeholder-shown) + label,
.form-material select:not(:placeholder-shown) + label {
  top: -20px;
  font-size: 12px;
  color: #4a90e2;
}

.form-material .bar {
  position: relative;
  display: block;
  width: 100%;
}

.form-material .bar:before,
.form-material .bar:after {
  content: '';
  height: 2px;
  width: 0;
  bottom: 0;
  position: absolute;
  background: #4a90e2;
  transition: all 0.3s;
}

.form-material .bar:before {
  left: 50%;
}

.form-material .bar:after {
  right: 50%;
}

.form-material input:focus ~ .bar:before,
.form-material input:focus ~ .bar:after,
.form-material textarea:focus ~ .bar:before,
.form-material textarea:focus ~ .bar:after {
  width: 50%;
}
```

## Esempio Completo di Form Stilizzato

```html
<!DOCTYPE html>
<html lang="it">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Form Stilizzato</title>
  <style>
    /* Reset e stili di base */
    * {
      box-sizing: border-box;
      margin: 0;
      padding: 0;
    }
    
    body {
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
      line-height: 1.6;
      color: #333;
      background-color: #f5f7fa;
      padding: 20px;
    }
    
    h1 {
      text-align: center;
      margin-bottom: 30px;
      color: #2c3e50;
    }
    
    /* Stili del form */
    .form-container {
      max-width: 600px;
      margin: 0 auto;
      background-color: white;
      border-radius: 8px;
      box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
      padding: 30px;
    }
    
    .form-header {
      margin-bottom: 25px;
      text-align: center;
    }
    
    .form-header h2 {
      color: #2c3e50;
      margin-bottom: 10px;
    }
    
    .form-header p {
      color: #7f8c8d;
    }
    
    .form-group {
      margin-bottom: 20px;
      position: relative;
    }
    
    .form-row {
      display: flex;
      gap: 15px;
    }
    
    .form-col {
      flex: 1;
    }
    
    label {
      display: block;
      margin-bottom: 8px;
      font-weight: 600;
      color: #2c3e50;
    }
    
    input, textarea, select {
      width: 100%;
      padding: 12px;
      border: 1px solid #ddd;
      border-radius: 4px;
      font-size: 16px;
      color: #2c3e50;
      transition: all 0.3s;
    }
    
    input:focus, textarea:focus, select:focus {
      outline: none;
      border-color: #3498db;
      box-shadow: 0 0 0 3px rgba(52, 152, 219, 0.2);
    }
    
    .form-hint {
      display: block;
      margin-top: 6px;
      font-size: 12px;
      color: #7f8c8d;
    }
    
    /* Checkbox e radio personalizzati */
    .checkbox-group, .radio-group {
      margin-bottom: 15px;
    }
    
    .checkbox-label, .radio-label {
      position: relative;
      padding-left: 30px;
      margin-bottom: 12px;
      cursor: pointer;
      display: block;
      font-weight: normal;
    }
    
    .checkbox-input, .radio-input {
      position: absolute;
      opacity: 0;
      cursor: pointer;
      height: 0;
      width: 0;
    }
    
    .checkbox-custom, .radio-custom {
      position: absolute;
      top: 0;
      left: 0;
      height: 20px;
      width: 20px;
      background-color: #fff;
      border: 1px solid #ddd;
      border-radius: 3px;
      transition: all 0.3s;
    }
    
    .radio-custom {
      border-radius: 50%;
    }
    
    .checkbox-label:hover .checkbox-input ~ .checkbox-custom,
    .radio-label:hover .radio-input ~ .radio-custom {
      border-color: #3498db;
    }
    
    .checkbox-input:checked ~ .checkbox-custom,
    .radio-input:checked ~ .radio-custom {
      background-color: #3498db;
      border-color: #3498db;
    }
    
    .checkbox-custom:after,
    .radio-custom:after {
      content: "";
      position: absolute;
      display: none;
    }
    
    .checkbox-input:checked ~ .checkbox-custom:after,
    .radio-input:checked ~ .radio-custom:after {
      display: block;
    }
    
    .checkbox-label .checkbox-custom:after {
      left: 7px;
      top: 3px;
      width: 5px;
      height: 10px;
      border: solid white;
      border-width: 0 2px 2px 0;
      transform: rotate(45deg);
    }
    
    .radio-label .radio-custom:after {
      top: 6px;
      left: 6px;
      width: 8px;
      height: 8px;
      border-radius: 50%;
      background: white;
    }
    
    /* Select personalizzato */
    .select-wrapper {
      position: relative;
    }
    
    .select-wrapper:after {
      content: '▼';
      font-size: 12px;
      color: #7f8c8d;
      position: absolute;
      right: 15px;
      top: 50%;
      transform: translateY(-50%);
      pointer-events: none;
    }
    
    select {
      appearance: none;
      -webkit-appearance: none;
      -moz-appearance: none;
      padding-right: 30px;
    }
    
    /* Validazione */
    input:valid:not(:placeholder-shown) {
      border-color: #2ecc71;
    }
    
    input:invalid:not(:placeholder-shown) {
      border-color: #e74c3c;
    }
    
    .error-message {
      display: none;
      color: #e74c3c;
      font-size: 12px;
      margin-top: 5px;
    }
    
    input:invalid:not(:focus):not(:placeholder-shown) + .error-message {
      display: block;
    }
    
    /* Pulsanti */
    .form-actions {
      display: flex;
      justify-content: flex-end;
      gap: 10px;
      margin-top: 30px;
    }
    
    button {
      padding: 12px 20px;
      border: none;
      border-radius: 4px;
      font-size: 16px;
      font-weight: 600;
      cursor: pointer;
      transition: all 0.3s;
    }
    
    .btn-primary {
      background-color: #3498db;
      color: white;
    }
    
    .btn-primary:hover {
      background-color: #2980b9;
    }
    
    .btn-secondary {
      background-color: #ecf0f1;
      color: #7f8c8d;
    }
    
    .btn-secondary:hover {
      background-color: #bdc3c7;
      color: #2c3e50;
    }
    
    /* Responsive */
    @media (max-width: 768px) {
      .form-row {
        flex-direction: column;
        gap: 0;
      }
      
      .form-actions {
        flex-direction: column-reverse;
      }
      
      button {
        width: 100%;
      }
    }
  </style>
</head>
<body>
  <h1>Contattaci</h1>
  
  <div class="form-container">
    <div class="form-header">
      <h2>Inviaci un messaggio</h2>
      <p>Compila il form sottostante e ti risponderemo al più presto</p>
    </div>
    
    <form id="contactForm">
      <div class="form-row">
        <div class="form-col">
          <div class="form-group">
            <label for="nome">Nome</label>
            <input type="text" id="nome" name="nome" placeholder="Il tuo nome" required minlength="2">
            <div class="error-message">Inserisci un nome valido</div>
          </div>
        </div>
        
        <div class="form-col">
          <div class="form-group">
            <label for="cognome">Cognome</label>
            <input type="text" id="cognome" name="cognome" placeholder="Il tuo cognome" required minlength="2">
            <div class="error-message">Inserisci un cognome valido</div>
          </div>
        </div>
      </div>
      
      <div class="form-group">
        <label for="email">Email</label>
        <input type="email" id="email" name="email" placeholder="La tua email" required>
        <div class="error-message">Inserisci un indirizzo email valido</div>
      </div>
      
      <div class="form-group">
        <label for="telefono">Telefono (opzionale)</label>
        <input type="tel" id="telefono" name="telefono" placeholder="Il tuo numero di telefono">
        <span class="form-hint">Formato: 123-456-7890</span>
      </div>
      
      <div class="form-group">
        <label for="oggetto">Oggetto</label>
        <div class="select-wrapper">
          <select id="oggetto" name="oggetto" required>
            <option value="" disabled selected>Seleziona un oggetto</option>
            <option value="informazioni">Richiesta informazioni</option>
            <option value="supporto">Supporto tecnico</option>
            <option value="feedback">Feedback</option>
            <option value="altro">Altro</option>
          </select>
        </div>
      </div>
      
      <div class="form-group">
        <label>Come preferisci essere contattato?</label>
        
        <div class="radio-group">
          <label class="radio-label">
            <input type="radio" name="contatto" value="email" class="radio-input" checked>
            <span class="radio-custom"></span>
            Email
          </label>
          
          <label class="radio-label">
            <input type="radio" name="contatto" value="telefono" class="radio-input">
            <span class="radio-custom"></span>
            Telefono
          </label>
        </div>
      </div>
      
      <div class="form-group">
        <label>Servizi di interesse</label>
        
        <div class="checkbox-group">
          <label class="checkbox-label">
            <input type="checkbox" name="servizi[]" value="web" class="checkbox-input">
            <span class="checkbox-custom"></span>
            Sviluppo Web
          </label>
          
          <label class="checkbox-label">
            <input type="checkbox" name="servizi[]" value="app" class="checkbox-input">
            <span class="checkbox-custom"></span>
            Sviluppo App
          </label>
          
          <label class="checkbox-label">
            <input type="checkbox" name="servizi[]" value="design" class="checkbox-input">
            <span class="checkbox-custom"></span>
            Design UI/UX
          </label>
          
          <label class="checkbox-label">
            <input type="checkbox" name="servizi[]" value="marketing" class="checkbox-input">
            <span class="checkbox-custom"></span>
            Digital Marketing
          </label>
        </div>
      </div>
      
      <div class="form-group">
        <label for="messaggio">Messaggio</label>
        <textarea id="messaggio" name="messaggio" rows="5" placeholder="Scrivi qui il tuo messaggio" required></textarea>
      </div>
      
      <div class="form-group">
        <label class="checkbox-label">
          <input type="checkbox" name="privacy" class="checkbox-input" required>
          <span class="checkbox-custom"></span>
          Ho letto e accetto la <a href="#">Privacy Policy</a>
        </label>
      </div>
      
      <div class="form-actions">
        <button type="reset" class="btn-secondary">Annulla</button>
        <button type="submit" class="btn-primary">Invia Messaggio</button>
      </div>
    </form>
  </div>
</body>
</html>
```

## Best Practices per Stilizzare i Form

1. **Mantieni la coerenza**: Usa stili coerenti per tutti gli elementi del form.

2. **Fornisci feedback visivo**: Usa colori, icone e animazioni per indicare stati diversi (focus, errore, successo).

3. **Considera l'accessibilità**: Assicurati che il contrasto sia sufficiente e che gli elementi siano navigabili da tastiera.

4. **Usa etichette chiare**: Le etichette devono essere visibili e descrittive.

5. **Raggruppa logicamente**: Organizza i campi correlati in gruppi logici.

6. **Rendi i pulsanti riconoscibili**: I pulsanti di invio devono essere facilmente identificabili.

7. **Testa su diversi dispositivi**: Assicurati che il form sia utilizzabile su desktop, tablet e smartphone.

8. **Considera gli stati disabilitati**: Fornisci stili chiari per gli elementi disabilitati.

9. **Usa transizioni fluide**: Le transizioni morbide migliorano l'esperienza utente.

10. **Evita form troppo lunghi**: Dividi i form lunghi in passaggi o sezioni.

## Navigazione del Corso
- [📑 Indice](../README.md)
- [⬅️ Validazione dei Form](./05-ValidazioneForm.md)
- [➡️ Accessibilità dei Form](./07-AccessibilitàForm.md)