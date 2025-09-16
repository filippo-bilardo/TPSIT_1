# Esercitazione 3: Form e validazione

## Obiettivi
In questa esercitazione imparerai a:
- Creare form HTML per la raccolta di dati
- Utilizzare i diversi tipi di input disponibili in HTML5
- Implementare la validazione lato client con HTML5
- Aggiungere stili CSS ai form per migliorarne l'usabilità

## Prerequisiti
- Conoscenza base di HTML5 (completamento delle Esercitazioni 1 e 2)
- Conoscenza base di CSS
- Un editor di testo (VS Code, Sublime Text, Notepad++, ecc.)
- Un browser web moderno (Chrome, Firefox, Edge, ecc.)

## Esercizio 1: Creazione di un form di contatto

### Istruzioni
1. Crea un nuovo file chiamato `index.html`
2. Inserisci la struttura base di una pagina HTML5
3. Crea un form di contatto con i seguenti campi:
   - Nome (campo di testo)
   - Email (campo email)
   - Telefono (campo tel)
   - Oggetto (campo di testo)
   - Messaggio (area di testo)
   - Pulsante di invio
4. Utilizza gli attributi di validazione HTML5 come `required`, `pattern`, `minlength`, ecc.

### Esempio di codice
```html
<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Form di Contatto</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <header>
        <h1>Form di Contatto</h1>
    </header>
    
    <main>
        <section class="contact-form">
            <h2>Contattaci</h2>
            <p>Compila il form sottostante per inviarci un messaggio.</p>
            
            <form action="#" method="post" id="contactForm">
                <div class="form-group">
                    <label for="name">Nome completo:</label>
                    <input type="text" id="name" name="name" required minlength="3" maxlength="50">
                    <span class="error-message"></span>
                </div>
                
                <div class="form-group">
                    <label for="email">Email:</label>
                    <input type="email" id="email" name="email" required>
                    <span class="error-message"></span>
                </div>
                
                <div class="form-group">
                    <label for="phone">Telefono:</label>
                    <input type="tel" id="phone" name="phone" pattern="[0-9]{10}" placeholder="10 cifre">
                    <span class="error-message">Inserisci un numero di 10 cifre</span>
                </div>
                
                <div class="form-group">
                    <label for="subject">Oggetto:</label>
                    <input type="text" id="subject" name="subject" required minlength="5" maxlength="100">
                    <span class="error-message"></span>
                </div>
                
                <div class="form-group">
                    <label for="message">Messaggio:</label>
                    <textarea id="message" name="message" rows="5" required minlength="10"></textarea>
                    <span class="error-message"></span>
                </div>
                
                <div class="form-group">
                    <button type="submit">Invia messaggio</button>
                </div>
            </form>
        </section>
    </main>
    
    <footer>
        <p>&copy; 2023 Form e Validazione. Tutti i diritti riservati.</p>
    </footer>
</body>
</html>
```

## Esercizio 2: Stili CSS per il form

### Istruzioni
1. Crea un nuovo file chiamato `style.css`
2. Implementa stili per rendere il form più attraente e user-friendly
3. Aggiungi stili per gli stati di focus, hover e validazione
4. Assicurati che il form sia responsive

### Esempio di codice CSS
```css
/* Reset CSS di base */
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

body {
    font-family: Arial, sans-serif;
    line-height: 1.6;
    color: #333;
    background-color: #f5f5f5;
}

header {
    background-color: #4CAF50;
    color: white;
    padding: 1rem;
    text-align: center;
}

main {
    max-width: 800px;
    margin: 2rem auto;
    padding: 1rem;
}

.contact-form {
    background-color: white;
    padding: 2rem;
    border-radius: 8px;
    box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
}

h2 {
    color: #4CAF50;
    margin-bottom: 1rem;
}

/* Stili del form */
.form-group {
    margin-bottom: 1.5rem;
}

label {
    display: block;
    margin-bottom: 0.5rem;
    font-weight: bold;
}

input, textarea {
    width: 100%;
    padding: 0.8rem;
    border: 1px solid #ddd;
    border-radius: 4px;
    font-size: 1rem;
    transition: border-color 0.3s;
}

input:focus, textarea:focus {
    border-color: #4CAF50;
    outline: none;
    box-shadow: 0 0 0 2px rgba(76, 175, 80, 0.2);
}

/* Stili di validazione */
input:invalid, textarea:invalid {
    border-color: #f44336;
}

input:valid, textarea:valid {
    border-color: #4CAF50;
}

.error-message {
    display: none;
    color: #f44336;
    font-size: 0.8rem;
    margin-top: 0.3rem;
}

input:invalid + .error-message, textarea:invalid + .error-message {
    display: block;
}

/* Stile del pulsante */
button {
    background-color: #4CAF50;
    color: white;
    border: none;
    padding: 0.8rem 1.5rem;
    font-size: 1rem;
    border-radius: 4px;
    cursor: pointer;
    transition: background-color 0.3s;
}

button:hover {
    background-color: #45a049;
}

button:focus {
    outline: none;
    box-shadow: 0 0 0 2px rgba(76, 175, 80, 0.4);
}

/* Footer */
footer {
    text-align: center;
    padding: 1rem;
    margin-top: 2rem;
    background-color: #333;
    color: white;
}

/* Responsive */
@media (max-width: 768px) {
    .contact-form {
        padding: 1rem;
    }
}
```

## Esercizio 3: Validazione avanzata con JavaScript

### Istruzioni
1. Crea un nuovo file chiamato `validation.js`
2. Implementa la validazione lato client con JavaScript per:
   - Verificare che il nome contenga solo lettere e spazi
   - Verificare che l'email sia in un formato valido
   - Verificare che il numero di telefono contenga solo cifre
   - Mostrare messaggi di errore personalizzati
3. Aggiungi feedback visivo durante la validazione

### Esempio di codice JavaScript
```javascript
document.addEventListener('DOMContentLoaded', function() {
    const contactForm = document.getElementById('contactForm');
    const nameInput = document.getElementById('name');
    const emailInput = document.getElementById('email');
    const phoneInput = document.getElementById('phone');
    const subjectInput = document.getElementById('subject');
    const messageInput = document.getElementById('message');
    
    // Funzione per mostrare messaggi di errore
    function showError(input, message) {
        const formGroup = input.parentElement;
        const errorMessage = formGroup.querySelector('.error-message');
        errorMessage.textContent = message;
        formGroup.classList.add('error');
    }
    
    // Funzione per rimuovere messaggi di errore
    function removeError(input) {
        const formGroup = input.parentElement;
        const errorMessage = formGroup.querySelector('.error-message');
        errorMessage.textContent = '';
        formGroup.classList.remove('error');
    }
    
    // Validazione del nome
    nameInput.addEventListener('input', function() {
        const nameRegex = /^[A-Za-z\s]+$/;
        if (!nameRegex.test(nameInput.value.trim())) {
            showError(nameInput, 'Il nome deve contenere solo lettere e spazi');
        } else {
            removeError(nameInput);
        }
    });
    
    // Validazione dell'email
    emailInput.addEventListener('input', function() {
        const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        if (!emailRegex.test(emailInput.value.trim())) {
            showError(emailInput, 'Inserisci un indirizzo email valido');
        } else {
            removeError(emailInput);
        }
    });
    
    // Validazione del telefono
    phoneInput.addEventListener('input', function() {
        const phoneRegex = /^\d{10}$/;
        if (phoneInput.value.trim() !== '' && !phoneRegex.test(phoneInput.value.trim())) {
            showError(phoneInput, 'Il numero di telefono deve contenere 10 cifre');
        } else {
            removeError(phoneInput);
        }
    });
    
    // Validazione dell'oggetto
    subjectInput.addEventListener('input', function() {
        if (subjectInput.value.trim().length < 5) {
            showError(subjectInput, 'L\'oggetto deve contenere almeno 5 caratteri');
        } else {
            removeError(subjectInput);
        }
    });
    
    // Validazione del messaggio
    messageInput.addEventListener('input', function() {
        if (messageInput.value.trim().length < 10) {
            showError(messageInput, 'Il messaggio deve contenere almeno 10 caratteri');
        } else {
            removeError(messageInput);
        }
    });
    
    // Validazione al submit
    contactForm.addEventListener('submit', function(event) {
        let isValid = true;
        
        // Validazione del nome
        if (nameInput.value.trim() === '') {
            showError(nameInput, 'Il nome è obbligatorio');
            isValid = false;
        }
        
        // Validazione dell'email
        if (emailInput.value.trim() === '') {
            showError(emailInput, 'L\'email è obbligatoria');
            isValid = false;
        }
        
        // Validazione dell'oggetto
        if (subjectInput.value.trim() === '') {
            showError(subjectInput, 'L\'oggetto è obbligatorio');
            isValid = false;
        }
        
        // Validazione del messaggio
        if (messageInput.value.trim() === '') {
            showError(messageInput, 'Il messaggio è obbligatorio');
            isValid = false;
        }
        
        if (!isValid) {
            event.preventDefault();
        } else {
            alert('Form inviato con successo!');
            // In un'applicazione reale, qui invieresti i dati al server
        }
    });
});
```

## Esercizio 4: Form avanzato con diversi tipi di input

### Istruzioni
1. Crea un nuovo file chiamato `advanced-form.html`
2. Implementa un form più complesso con diversi tipi di input HTML5:
   - Checkbox
   - Radio button
   - Select dropdown
   - Range slider
   - Date picker
   - Color picker
   - File upload

### Esempio di codice
```html
<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Form Avanzato</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <header>
        <h1>Form Avanzato HTML5</h1>
    </header>
    
    <main>
        <section class="contact-form">
            <h2>Registrazione evento</h2>
            <p>Compila il form per registrarti all'evento.</p>
            
            <form action="#" method="post" id="advancedForm">
                <div class="form-group">
                    <label for="fullname">Nome completo:</label>
                    <input type="text" id="fullname" name="fullname" required>
                </div>
                
                <div class="form-group">
                    <label for="birthdate">Data di nascita:</label>
                    <input type="date" id="birthdate" name="birthdate" required>
                </div>
                
                <div class="form-group">
                    <label>Genere:</label>
                    <div class="radio-group">
                        <label>
                            <input type="radio" name="gender" value="male" required> Maschio
                        </label>
                        <label>
                            <input type="radio" name="gender" value="female"> Femmina
                        </label>
                        <label>
                            <input type="radio" name="gender" value="other"> Altro
                        </label>
                    </div>
                </div>
                
                <div class="form-group">
                    <label for="tshirt-size">Taglia T-shirt:</label>
                    <select id="tshirt-size" name="tshirt-size" required>
                        <option value="">Seleziona una taglia</option>
                        <option value="S">S</option>
                        <option value="M">M</option>
                        <option value="L">L</option>
                        <option value="XL">XL</option>
                        <option value="XXL">XXL</option>
                    </select>
                </div>
                
                <div class="form-group">
                    <label for="tshirt-color">Colore T-shirt preferito:</label>
                    <input type="color" id="tshirt-color" name="tshirt-color" value="#4CAF50">
                </div>
                
                <div class="form-group">
                    <label for="experience">Esperienza (1-10):</label>
                    <input type="range" id="experience" name="experience" min="1" max="10" value="5">
                    <output for="experience">5</output>
                </div>
                
                <div class="form-group">
                    <label for="profile-pic">Foto profilo:</label>
                    <input type="file" id="profile-pic" name="profile-pic" accept="image/*">
                </div>
                
                <div class="form-group">
                    <label>Interessi:</label>
                    <div class="checkbox-group">
                        <label>
                            <input type="checkbox" name="interests" value="html"> HTML
                        </label>
                        <label>
                            <input type="checkbox" name="interests" value="css"> CSS
                        </label>
                        <label>
                            <input type="checkbox" name="interests" value="javascript"> JavaScript
                        </label>
                        <label>
                            <input type="checkbox" name="interests" value="design"> Web Design
                        </label>
                    </div>
                </div>
                
                <div class="form-group">
                    <label for="comments">Note aggiuntive:</label>
                    <textarea id="comments" name="comments" rows="4"></textarea>
                </div>
                
                <div class="form-group">
                    <label>
                        <input type="checkbox" name="terms" required>
                        Accetto i termini e le condizioni
                    </label>
                </div>
                
                <div class="form-group">
                    <button type="submit">Registrati</button>
                    <button type="reset">Cancella</button>
                </div>
            </form>
        </section>
    </main>
    
    <footer>
        <p>&copy; 2023 Form Avanzato HTML5. Tutti i diritti riservati.</p>
    </footer>
    
    <script>
        // Script per aggiornare il valore del range slider
        document.getElementById('experience').addEventListener('input', function() {
            document.querySelector('output[for="experience"]').textContent = this.value;
        });
    </script>
</body>
</html>
```

## Verifica e test
1. Apri i file HTML nel tuo browser
2. Testa la validazione dei form inserendo dati validi e non validi
3. Verifica che i messaggi di errore vengano visualizzati correttamente
4. Testa la responsività dei form su diverse dimensioni dello schermo

## Consegna
Al termine dell'esercitazione, dovresti avere:
- Un form di contatto base con validazione HTML5
- Stili CSS per migliorare l'aspetto e l'usabilità del form
- Validazione JavaScript avanzata
- Un form avanzato con diversi tipi di input HTML5

## Risorse aggiuntive
- [MDN Web Docs - HTML Forms](https://developer.mozilla.org/it/docs/Learn/Forms)
- [MDN Web Docs - Form Validation](https://developer.mozilla.org/it/docs/Learn/Forms/Form_validation)
- [HTML5 Forms: New Input Types and Attributes](https://www.sitepoint.com/html5-forms-input-types/)
- [CSS-Tricks - Form Styling](https://css-tricks.com/custom-styling-form-inputs-with-modern-css-features/)

---
[Torna all'indice delle esercitazioni](../README.md)