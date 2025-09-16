

# Form e input in CSS

## Indice dei contenuti

- [Introduzione ai form in CSS](#introduzione-ai-form-in-css)
- [Struttura HTML dei form](#struttura-html-dei-form)
- [Stilizzazione degli elementi form](#stilizzazione-degli-elementi-form)
  - [Input di testo](#input-di-testo)
  - [Textarea](#textarea)
  - [Select e option](#select-e-option)
  - [Checkbox e radio button](#checkbox-e-radio-button)
  - [Button](#button)
  - [Fieldset e legend](#fieldset-e-legend)
  - [Label](#label)
- [Pseudo-classi per i form](#pseudo-classi-per-i-form)
  - [:focus](#focus)
  - [:valid e :invalid](#valid-e-invalid)
  - [:checked](#checked)
  - [:disabled e :enabled](#disabled-e-enabled)
  - [:required e :optional](#required-e-optional)
- [Layout dei form](#layout-dei-form)
  - [Form a una colonna](#form-a-una-colonna)
  - [Form a più colonne](#form-a-più-colonne)
  - [Form responsive](#form-responsive)
- [Feedback visivo e validazione](#feedback-visivo-e-validazione)
- [Accessibilità nei form](#accessibilità-nei-form)
- [Best practice](#best-practice)
- [Domande di autovalutazione](#domande-di-autovalutazione)
- [Esercizi pratici](#esercizi-pratici)
- [Risorse aggiuntive](#risorse-aggiuntive)

## Introduzione ai form in CSS

I form sono elementi fondamentali per l'interazione utente nelle pagine web, permettendo la raccolta di dati e l'invio di informazioni. La stilizzazione dei form con CSS è essenziale per migliorare l'usabilità, l'accessibilità e l'estetica dell'interfaccia utente. Un form ben progettato non solo appare visivamente gradevole, ma guida anche l'utente attraverso il processo di compilazione in modo intuitivo.

In questa guida, esploreremo come utilizzare CSS per trasformare i form HTML standard in componenti interattivi moderni e user-friendly.

## Struttura HTML dei form

Prima di applicare stili CSS, è importante comprendere la struttura base di un form HTML:

```html
<form action="/submit" method="post">
  <fieldset>
    <legend>Informazioni personali</legend>
    
    <div class="form-group">
      <label for="nome">Nome:</label>
      <input type="text" id="nome" name="nome" required>
    </div>
    
    <div class="form-group">
      <label for="email">Email:</label>
      <input type="email" id="email" name="email" required>
    </div>
    
    <div class="form-group">
      <label for="messaggio">Messaggio:</label>
      <textarea id="messaggio" name="messaggio" rows="4"></textarea>
    </div>
    
    <div class="form-group">
      <label for="paese">Paese:</label>
      <select id="paese" name="paese">
        <option value="">Seleziona un paese</option>
        <option value="it">Italia</option>
        <option value="fr">Francia</option>
        <option value="de">Germania</option>
      </select>
    </div>
    
    <div class="form-group">
      <label>Interessi:</label>
      <div class="checkbox-group">
        <input type="checkbox" id="interesse1" name="interessi[]" value="design">
        <label for="interesse1">Design</label>
      </div>
      <div class="checkbox-group">
        <input type="checkbox" id="interesse2" name="interessi[]" value="sviluppo">
        <label for="interesse2">Sviluppo</label>
      </div>
    </div>
    
    <div class="form-group">
      <button type="submit">Invia</button>
      <button type="reset">Cancella</button>
    </div>
  </fieldset>
</form>
```

## Stilizzazione degli elementi form

### Input di testo

```css
input[type="text"],
input[type="email"],
input[type="password"],
input[type="number"],
input[type="tel"] {
  width: 100%;
  padding: 12px 15px;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
  font-size: 16px;
  transition: border-color 0.3s ease, box-shadow 0.3s ease;
}

input[type="text"]:focus,
input[type="email"]:focus,
input[type="password"]:focus,
input[type="number"]:focus,
input[type="tel"]:focus {
  border-color: #4a90e2;
  box-shadow: 0 0 0 3px rgba(74, 144, 226, 0.25);
  outline: none;
}
```

### Textarea

```css
textarea {
  width: 100%;
  padding: 12px 15px;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
  font-size: 16px;
  font-family: inherit; /* Importante per mantenere la coerenza del font */
  resize: vertical; /* Permette il ridimensionamento solo verticale */
  min-height: 100px;
  transition: border-color 0.3s ease, box-shadow 0.3s ease;
}

textarea:focus {
  border-color: #4a90e2;
  box-shadow: 0 0 0 3px rgba(74, 144, 226, 0.25);
  outline: none;
}
```

### Select e option

```css
select {
  width: 100%;
  padding: 12px 15px;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
  font-size: 16px;
  appearance: none; /* Rimuove lo stile nativo del browser */
  background-image: url('data:image/svg+xml;utf8,<svg fill="%23333" height="24" viewBox="0 0 24 24" width="24" xmlns="http://www.w3.org/2000/svg"><path d="M7 10l5 5 5-5z"/></svg>');
  background-repeat: no-repeat;
  background-position: right 10px center;
  background-size: 20px;
  cursor: pointer;
}

select:focus {
  border-color: #4a90e2;
  box-shadow: 0 0 0 3px rgba(74, 144, 226, 0.25);
  outline: none;
}

option {
  padding: 10px;
}
```

### Checkbox e radio button

```css
/* Stile base */
input[type="checkbox"],
input[type="radio"] {
  margin-right: 8px;
  cursor: pointer;
}

/* Stile personalizzato (richiede JavaScript per funzionare completamente) */
.custom-checkbox,
.custom-radio {
  position: relative;
  padding-left: 30px;
  cursor: pointer;
  display: inline-block;
  margin-right: 15px;
}

.custom-checkbox input,
.custom-radio input {
  position: absolute;
  opacity: 0;
  cursor: pointer;
}

.checkmark {
  position: absolute;
  top: 0;
  left: 0;
  height: 20px;
  width: 20px;
  background-color: #eee;
  border: 1px solid #ccc;
}

.custom-radio .checkmark {
  border-radius: 50%;
}

.custom-checkbox:hover input ~ .checkmark,
.custom-radio:hover input ~ .checkmark {
  background-color: #f5f5f5;
}

.custom-checkbox input:checked ~ .checkmark,
.custom-radio input:checked ~ .checkmark {
  background-color: #4a90e2;
  border-color: #4a90e2;
}

.checkmark:after {
  content: "";
  position: absolute;
  display: none;
}

.custom-checkbox input:checked ~ .checkmark:after,
.custom-radio input:checked ~ .checkmark:after {
  display: block;
}

.custom-checkbox .checkmark:after {
  left: 7px;
  top: 3px;
  width: 5px;
  height: 10px;
  border: solid white;
  border-width: 0 2px 2px 0;
  transform: rotate(45deg);
}

.custom-radio .checkmark:after {
  top: 6px;
  left: 6px;
  width: 8px;
  height: 8px;
  border-radius: 50%;
  background: white;
}
```

### Button

```css
button,
input[type="submit"],
input[type="reset"],
input[type="button"] {
  background-color: #4a90e2;
  color: white;
  padding: 12px 20px;
  margin: 8px 0;
  border: none;
  border-radius: 4px;
  cursor: pointer;
  font-size: 16px;
  font-weight: 500;
  text-transform: uppercase;
  letter-spacing: 0.5px;
  transition: background-color 0.3s ease, transform 0.1s ease;
}

button:hover,
input[type="submit"]:hover,
input[type="reset"]:hover,
input[type="button"]:hover {
  background-color: #357ae8;
}

button:active,
input[type="submit"]:active,
input[type="reset"]:active,
input[type="button"]:active {
  transform: scale(0.98);
}

button[type="reset"],
input[type="reset"] {
  background-color: #f5f5f5;
  color: #333;
  border: 1px solid #ddd;
}

button[type="reset"]:hover,
input[type="reset"]:hover {
  background-color: #e5e5e5;
}
```

### Fieldset e legend

```css
fieldset {
  border: 1px solid #ddd;
  border-radius: 4px;
  padding: 20px;
  margin-bottom: 20px;
}

legend {
  padding: 0 10px;
  font-weight: bold;
  font-size: 18px;
  color: #333;
}
```

### Label

```css
label {
  display: block;
  margin-bottom: 5px;
  font-weight: 500;
  color: #333;
}

/* Per checkbox e radio inline */
.checkbox-group label,
.radio-group label {
  display: inline-block;
  margin-right: 15px;
  font-weight: normal;
}
```

## Pseudo-classi per i form

### :focus

```css
input:focus,
textarea:focus,
select:focus {
  border-color: #4a90e2;
  box-shadow: 0 0 0 3px rgba(74, 144, 226, 0.25);
  outline: none;
}
```

### :valid e :invalid

```css
input:valid {
  border-color: #4CAF50;
}

input:invalid {
  border-color: #f44336;
}

/* Mostra l'errore solo dopo l'interazione dell'utente */
input:not(:focus):invalid {
  border-color: #f44336;
  background-color: rgba(244, 67, 54, 0.05);
}
```

### :checked

```css
input[type="checkbox"]:checked + label,
input[type="radio"]:checked + label {
  color: #4a90e2;
  font-weight: 500;
}
```

### :disabled e :enabled

```css
input:disabled,
textarea:disabled,
select:disabled,
button:disabled {
  opacity: 0.6;
  cursor: not-allowed;
  background-color: #f5f5f5;
}
```

### :required e :optional

```css
input:required {
  border-left: 3px solid #f44336;
}

input:optional {
  border-left: 3px solid #ddd;
}

/* Indicatore visivo per campi obbligatori */
label.required:after {
  content: " *";
  color: #f44336;
}
```

## Layout dei form

### Form a una colonna

```css
.form-group {
  margin-bottom: 20px;
}

.form-group label {
  display: block;
  margin-bottom: 5px;
}

.form-group input,
.form-group textarea,
.form-group select {
  width: 100%;
}

.form-actions {
  margin-top: 30px;
}
```

### Form a più colonne

```css
.form-row {
  display: flex;
  flex-wrap: wrap;
  margin-right: -10px;
  margin-left: -10px;
}

.form-col {
  flex: 1 0 0%;
  padding-right: 10px;
  padding-left: 10px;
  min-width: 200px; /* Evita colonne troppo strette */
}

/* Colonne di larghezza specifica */
.form-col-half {
  flex: 0 0 50%;
  max-width: 50%;
  padding-right: 10px;
  padding-left: 10px;
}

@media (max-width: 768px) {
  .form-col,
  .form-col-half {
    flex: 0 0 100%;
    max-width: 100%;
  }
}
```

### Form responsive

```css
.form-container {
  max-width: 800px;
  margin: 0 auto;
  padding: 20px;
}

@media (max-width: 576px) {
  .form-container {
    padding: 10px;
  }
  
  input,
  textarea,
  select,
  button {
    padding: 10px;
    font-size: 14px;
  }
  
  fieldset {
    padding: 15px;
  }
}
```

## Feedback visivo e validazione

```css
.form-group {
  position: relative;
}

.form-feedback {
  display: none;
  font-size: 14px;
  margin-top: 5px;
}

.form-group.success input {
  border-color: #4CAF50;
}

.form-group.error input {
  border-color: #f44336;
}

.form-group.success .form-feedback.success {
  display: block;
  color: #4CAF50;
}

.form-group.error .form-feedback.error {
  display: block;
  color: #f44336;
}

/* Icone di feedback */
.form-group.success::after,
.form-group.error::after {
  position: absolute;
  top: 38px;
  right: 10px;
  font-family: "Font Awesome 5 Free";
  font-weight: 900;
}

.form-group.success::after {
  content: "\f00c"; /* Icona di spunta */
  color: #4CAF50;
}

.form-group.error::after {
  content: "\f00d"; /* Icona X */
  color: #f44336;
}
```

## Accessibilità nei form

L'accessibilità è fondamentale per garantire che i form possano essere utilizzati da tutti, incluse le persone con disabilità:

```css
/* Migliorare il contrasto per la leggibilità */
label {
  color: #333;
  font-weight: 500;
}

/* Aumentare l'area cliccabile */
label {
  cursor: pointer;
}

/* Stato focus ben visibile */
input:focus,
textarea:focus,
select:focus,
button:focus {
  outline: 2px solid #4a90e2;
  outline-offset: 2px;
}

/* Nascondere visivamente le label ma mantenerle accessibili per screen reader */
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

## Best practice

1. **Usa `box-sizing: border-box`** per tutti gli elementi del form per un calcolo più intuitivo delle dimensioni.
2. **Mantieni la coerenza visiva** in tutti gli elementi del form (padding, bordi, colori).
3. **Fornisci feedback visivo** per tutti gli stati (focus, hover, error, success).
4. **Usa label esplicite** per tutti gli input e collegale con l'attributo `for`.
5. **Implementa un design responsive** che funzioni bene su tutti i dispositivi.
6. **Considera l'accessibilità** utilizzando contrasti adeguati e supporto per tastiera.
7. **Usa fieldset e legend** per raggruppare logicamente i campi correlati.
8. **Mantieni i form semplici e concisi** chiedendo solo le informazioni necessarie.
9. **Fornisci istruzioni chiare** su come compilare i campi complessi.
10. **Testa i form** con diversi browser, dispositivi e tecnologie assistive.

## Domande di autovalutazione

1. Quali sono i vantaggi dell'utilizzo di `box-sizing: border-box` negli elementi dei form?
2. Come si può migliorare l'accessibilità di un form per gli utenti che utilizzano screen reader?
3. Quali pseudo-classi CSS sono particolarmente utili per la stilizzazione dei form?
4. Come si può implementare un layout a due colonne per un form che diventa a una colonna su dispositivi mobili?
5. Quali sono le migliori pratiche per fornire feedback visivo sulla validazione dei form?

## Esercizi pratici

1. **Form di contatto**: Crea un form di contatto completo con validazione visiva e layout responsive.
2. **Form di registrazione**: Implementa un form di registrazione con campi obbligatori e feedback visivo.
3. **Checkout e-commerce**: Progetta un form di checkout multi-step con indicatori di progresso.
4. **Personalizzazione avanzata**: Crea checkbox e radio button personalizzati utilizzando solo CSS.
5. **Form accessibile**: Implementa un form che rispetti le linee guida WCAG per l'accessibilità.

## Risorse aggiuntive

- [MDN Web Docs: Styling HTML forms](https://developer.mozilla.org/en-US/docs/Learn/Forms/Styling_web_forms)
- [CSS-Tricks: Form Validation UX](https://css-tricks.com/form-validation-ux-in-html-and-css/)
- [Smashing Magazine: Form Design Patterns](https://www.smashingmagazine.com/2018/10/form-design-patterns-book-excerpt/)
- [W3C: Forms Concepts](https://www.w3.org/WAI/tutorials/forms/)
- [A11Y Project: Accessible Forms](https://www.a11yproject.com/posts/how-to-write-accessible-forms/)

---

[📑 Indice](../README.md)
[◀ Vai a Layout con colonne](./04_Layout_con_colonne.md)
[▶ Vai a Concetti di layout](<../07. Layout e Posizionamento/01_Concetti_di_layout.md>)

