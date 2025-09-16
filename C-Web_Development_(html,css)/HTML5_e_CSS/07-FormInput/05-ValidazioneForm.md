# Validazione dei Form

## Introduzione

La validazione dei form è un processo fondamentale per garantire che i dati inseriti dagli utenti siano corretti, completi e sicuri prima di essere inviati al server. HTML5 ha introdotto numerosi strumenti per la validazione lato client, che permettono di verificare i dati in tempo reale senza dover attendere una risposta dal server.

## Vantaggi della Validazione Lato Client

1. **Feedback immediato**: Gli utenti ricevono notifiche immediate sugli errori
2. **Riduzione del carico sul server**: I dati vengono filtrati prima dell'invio
3. **Migliore esperienza utente**: Previene la frustrazione di dover reinserire i dati dopo un errore
4. **Risparmio di banda**: Riduce il traffico di rete evitando invii non necessari

> **Importante**: La validazione lato client non sostituisce mai la validazione lato server, che rimane essenziale per la sicurezza. La validazione HTML5 è facilmente aggirabile e deve essere considerata solo come un primo livello di controllo.

## Attributi di Validazione HTML5

### Required

L'attributo `required` indica che un campo deve essere compilato prima di poter inviare il form.

```html
<input type="text" id="nome" name="nome" required>
```

### Min e Max

Definiscono i valori minimo e massimo per campi numerici o date.

```html
<input type="number" id="età" name="età" min="18" max="120">
<input type="date" id="appuntamento" name="appuntamento" min="2023-01-01" max="2023-12-31">
```

### MinLength e MaxLength

Definiscono la lunghezza minima e massima per i campi di testo.

```html
<input type="text" id="username" name="username" minlength="3" maxlength="20">
<textarea id="bio" name="bio" minlength="50" maxlength="500"></textarea>
```

### Pattern

Permette di specificare un'espressione regolare che il valore del campo deve rispettare.

```html
<input type="text" id="codice-postale" name="codice-postale" 
       pattern="[0-9]{5}" 
       title="Il codice postale deve essere composto da 5 cifre">
```

Esempi comuni di pattern:

- **Codice fiscale italiano**: `pattern="[A-Z]{6}[0-9]{2}[A-Z][0-9]{2}[A-Z][0-9]{3}[A-Z]"`
- **Numero di telefono**: `pattern="[0-9]{10}"`
- **Password sicura**: `pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}"`

### Step

Definisce l'incremento consentito per i campi numerici.

```html
<input type="number" id="quantità" name="quantità" min="0" max="100" step="5">
```

### Multiple

Consente di selezionare più file o inserire più email.

```html
<input type="file" id="documenti" name="documenti" multiple>
<input type="email" id="cc" name="cc" multiple>
```

## Tipi di Input con Validazione Integrata

Alcuni tipi di input HTML5 includono già una validazione integrata:

### Email

```html
<input type="email" id="email" name="email">
```

Verifica che il valore inserito sia un indirizzo email valido (contenga @ e un dominio).

### URL

```html
<input type="url" id="sito" name="sito">
```

Verifica che il valore inserito sia un URL valido (includa http:// o https:// e un dominio).

### Number

```html
<input type="number" id="età" name="età">
```

Accetta solo valori numerici e può essere combinato con min, max e step.

### Tel

```html
<input type="tel" id="telefono" name="telefono">
```

Non ha una validazione integrata specifica, ma è ottimizzato per i dispositivi mobili e può essere combinato con pattern.

## Pseudo-classi CSS per la Validazione

CSS offre pseudo-classi che permettono di stilizzare i campi in base al loro stato di validazione:

```css
/* Campi validi */
input:valid {
  border-color: green;
  background-color: #f0fff0;
}

/* Campi non validi */
input:invalid {
  border-color: red;
  background-color: #fff0f0;
}

/* Campi richiesti */
input:required {
  border-left: 4px solid blue;
}

/* Campi opzionali */
input:optional {
  border-left: 4px solid gray;
}

/* Campi fuori range */
input:out-of-range {
  background-color: #ffcccc;
}
```

### Controllo della Visualizzazione dei Messaggi di Errore

Per evitare di mostrare errori prima che l'utente abbia interagito con il form:

```css
input:not(:focus):invalid {
  /* Stili per campi non validi quando non sono in focus */
  background-color: transparent;
  border-color: inherit;
}

input:focus:invalid {
  /* Stili per campi non validi quando sono in focus */
  background-color: #fff0f0;
  border-color: red;
}
```

## Validazione con JavaScript

Per casi più complessi, è possibile implementare la validazione personalizzata con JavaScript.

### Constraint Validation API

HTML5 fornisce un'API per la validazione dei vincoli che può essere utilizzata con JavaScript:

```javascript
// Riferimento al form e al campo da validare
const form = document.getElementById('mioForm');
const password = document.getElementById('password');
const confermaPassword = document.getElementById('conferma-password');

// Evento di invio del form
form.addEventListener('submit', function(event) {
  // Verifica se le password corrispondono
  if (password.value !== confermaPassword.value) {
    // Imposta un messaggio di errore personalizzato
    confermaPassword.setCustomValidity('Le password non corrispondono');
    // Impedisce l'invio del form
    event.preventDefault();
  } else {
    // Resetta il messaggio di errore
    confermaPassword.setCustomValidity('');
  }
});

// Resetta il messaggio di errore quando l'utente modifica il campo
confermaPassword.addEventListener('input', function() {
  if (password.value === confermaPassword.value) {
    confermaPassword.setCustomValidity('');
  } else {
    confermaPassword.setCustomValidity('Le password non corrispondono');
  }
});
```

### Metodi Utili dell'API

- `checkValidity()`: Verifica se un elemento è valido
- `setCustomValidity(message)`: Imposta un messaggio di errore personalizzato
- `validity`: Oggetto che contiene informazioni dettagliate sulla validità

## Esempio Completo di Form con Validazione

```html
<!DOCTYPE html>
<html lang="it">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Registrazione Utente</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      line-height: 1.6;
      max-width: 600px;
      margin: 0 auto;
      padding: 20px;
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
      padding: 8px;
      border: 1px solid #ddd;
      border-radius: 4px;
    }
    
    input:focus, select:focus, textarea:focus {
      outline: none;
      border-color: #4a90e2;
      box-shadow: 0 0 5px rgba(74, 144, 226, 0.5);
    }
    
    input:valid {
      border-left: 4px solid #4CAF50;
    }
    
    input:invalid:not(:focus):not(:placeholder-shown) {
      border-left: 4px solid #f44336;
    }
    
    .error-message {
      color: #f44336;
      font-size: 0.8em;
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
      padding: 10px 15px;
      border-radius: 4px;
      cursor: pointer;
      font-size: 16px;
    }
    
    button:hover {
      background-color: #357ae8;
    }
  </style>
</head>
<body>
  <h1>Registrazione Utente</h1>
  
  <form id="registrationForm" novalidate>
    <div class="form-group">
      <label for="nome">Nome</label>
      <input type="text" id="nome" name="nome" required minlength="2" maxlength="50" placeholder="Il tuo nome">
      <div class="error-message">Il nome deve contenere almeno 2 caratteri.</div>
    </div>
    
    <div class="form-group">
      <label for="cognome">Cognome</label>
      <input type="text" id="cognome" name="cognome" required minlength="2" maxlength="50" placeholder="Il tuo cognome">
      <div class="error-message">Il cognome deve contenere almeno 2 caratteri.</div>
    </div>
    
    <div class="form-group">
      <label for="email">Email</label>
      <input type="email" id="email" name="email" required placeholder="La tua email">
      <div class="error-message">Inserisci un indirizzo email valido.</div>
    </div>
    
    <div class="form-group">
      <label for="telefono">Telefono</label>
      <input type="tel" id="telefono" name="telefono" pattern="[0-9]{10}" placeholder="Numero di telefono (10 cifre)">
      <div class="error-message">Inserisci un numero di telefono valido (10 cifre).</div>
    </div>
    
    <div class="form-group">
      <label for="data-nascita">Data di nascita</label>
      <input type="date" id="data-nascita" name="data-nascita" required max="2005-01-01">
      <div class="error-message">Devi avere almeno 18 anni per registrarti.</div>
    </div>
    
    <div class="form-group">
      <label for="password">Password</label>
      <input type="password" id="password" name="password" required 
             pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" 
             placeholder="La tua password">
      <div class="error-message">La password deve contenere almeno 8 caratteri, una lettera maiuscola, una minuscola e un numero.</div>
    </div>
    
    <div class="form-group">
      <label for="conferma-password">Conferma Password</label>
      <input type="password" id="conferma-password" name="conferma-password" required placeholder="Conferma la tua password">
      <div class="error-message" id="password-error">Le password non corrispondono.</div>
    </div>
    
    <div class="form-group">
      <button type="submit">Registrati</button>
    </div>
  </form>

  <script>
    const form = document.getElementById('registrationForm');
    const password = document.getElementById('password');
    const confermaPassword = document.getElementById('conferma-password');
    const passwordError = document.getElementById('password-error');
    
    // Validazione della corrispondenza delle password
    function validatePassword() {
      if (password.value !== confermaPassword.value) {
        confermaPassword.setCustomValidity('Le password non corrispondono');
      } else {
        confermaPassword.setCustomValidity('');
      }
    }
    
    password.addEventListener('change', validatePassword);
    confermaPassword.addEventListener('keyup', validatePassword);
    
    // Validazione del form all'invio
    form.addEventListener('submit', function(event) {
      if (!form.checkValidity()) {
        event.preventDefault();
        alert('Per favore, correggi gli errori nel form prima di inviarlo.');
      }
    });
    
    // Validazione della data di nascita (almeno 18 anni)
    const dataNascita = document.getElementById('data-nascita');
    dataNascita.addEventListener('change', function() {
      const oggi = new Date();
      const dataNascitaValue = new Date(dataNascita.value);
      let età = oggi.getFullYear() - dataNascitaValue.getFullYear();
      const m = oggi.getMonth() - dataNascitaValue.getMonth();
      
      if (m < 0 || (m === 0 && oggi.getDate() < dataNascitaValue.getDate())) {
        età--;
      }
      
      if (età < 18) {
        dataNascita.setCustomValidity('Devi avere almeno 18 anni per registrarti.');
      } else {
        dataNascita.setCustomValidity('');
      }
    });
  </script>
</body>
</html>
```

## Best Practices per la Validazione dei Form

1. **Combina validazione client e server**: Usa HTML5 per il feedback immediato, ma implementa sempre controlli lato server.

2. **Fornisci messaggi di errore chiari**: Spiega esattamente cosa c'è di sbagliato e come correggerlo.

3. **Mostra gli errori al momento giusto**: Evita di mostrare errori prima che l'utente abbia interagito con il campo.

4. **Usa pattern con moderazione**: Le espressioni regolari complesse possono essere difficili da mantenere e da comprendere.

5. **Testa su diversi browser**: La validazione HTML5 può comportarsi in modo diverso su browser diversi.

6. **Considera l'accessibilità**: Assicurati che i messaggi di errore siano accessibili anche agli utenti di screen reader.

7. **Mantieni la flessibilità**: Quando possibile, accetta diversi formati di input (es. numeri di telefono con o senza trattini).

8. **Valida progressivamente**: Valida i campi man mano che l'utente li compila, non solo al momento dell'invio.

## Navigazione del Corso
- [📑 Indice](../README.md)
- [⬅️ Elementi Avanzati](./04-ElementiAvanzati.md)
- [➡️ Stili CSS per Form](./06-StiliForm.md)