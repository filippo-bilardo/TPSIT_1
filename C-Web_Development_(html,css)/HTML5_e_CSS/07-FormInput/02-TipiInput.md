# Tipi di Input in HTML5

## Introduzione ai Tipi di Input

HTML5 ha introdotto numerosi nuovi tipi di input che migliorano significativamente l'esperienza utente nei form web. Questi tipi specializzati offrono validazione integrata, interfacce utente appropriate e funzionalità specifiche per diversi tipi di dati, rendendo i form più intuitivi e facili da usare su diversi dispositivi.

## Input di Testo Base

### Input di Tipo Testo (`type="text"`)

L'input di tipo testo è il tipo più comune e versatile, utilizzato per raccogliere testo generico.

```html
<label for="nome">Nome:</label>
<input type="text" id="nome" name="nome" placeholder="Inserisci il tuo nome">
```

Attributi comuni per input di tipo testo:

- `placeholder`: Fornisce un suggerimento sul formato previsto
- `maxlength`: Limita il numero massimo di caratteri
- `minlength`: Specifica il numero minimo di caratteri richiesti
- `size`: Definisce la larghezza visibile del campo in caratteri
- `readonly`: Rende il campo non modificabile ma inviabile con il form
- `disabled`: Disabilita completamente il campo (non viene inviato)
- `value`: Imposta un valore predefinito

### Input di Tipo Password (`type="password"`)

Utilizzato per raccogliere informazioni sensibili, nasconde i caratteri digitati.

```html
<label for="password">Password:</label>
<input type="password" id="password" name="password">
```

Caratteristiche specifiche:

- I caratteri vengono visualizzati come asterischi o punti
- Supporta gli stessi attributi dell'input di tipo testo
- Alcuni browser offrono funzionalità di gestione password

## Input per Dati Specifici

### Input di Tipo Email (`type="email"`)

Specifico per indirizzi email, offre validazione automatica del formato.

```html
<label for="email">Email:</label>
<input type="email" id="email" name="email" required>
```

Vantaggi:

- Validazione automatica del formato email
- Tastiera ottimizzata per email su dispositivi mobili
- Supporto per l'attributo `multiple` per accettare più email

### Input di Tipo URL (`type="url"`)

Per la raccolta di URL (indirizzi web).

```html
<label for="sito">Sito web:</label>
<input type="url" id="sito" name="sito" placeholder="https://esempio.com">
```

Caratteristiche:

- Validazione automatica del formato URL
- Richiede un protocollo valido (http://, https://)
- Tastiera ottimizzata su dispositivi mobili

### Input di Tipo Tel (`type="tel"`)

Specifico per numeri di telefono.

```html
<label for="telefono">Telefono:</label>
<input type="tel" id="telefono" name="telefono" pattern="[0-9]{10}">
```

Note:

- Non impone un formato specifico senza l'attributo `pattern`
- Mostra una tastiera numerica su dispositivi mobili
- Spesso utilizzato con `pattern` per validazione personalizzata

## Input Numerici

### Input di Tipo Number (`type="number"`)

Per l'inserimento di valori numerici.

```html
<label for="quantita">Quantità:</label>
<input type="number" id="quantita" name="quantita" min="1" max="100" step="1">
```

Attributi specifici:

- `min`: Valore minimo accettato
- `max`: Valore massimo accettato
- `step`: Incremento/decremento per i controlli di spin
- Fornisce controlli di incremento/decremento (spinner)

### Input di Tipo Range (`type="range"`)

Permette la selezione di un valore numerico tramite slider.

```html
<label for="valutazione">Valutazione:</label>
<input type="range" id="valutazione" name="valutazione" min="0" max="10" step="1" value="5">
<output for="valutazione">5</output>
```

Caratteristiche:

- Interfaccia a slider intuitiva
- Utile quando il valore esatto è meno importante dell'intervallo
- Spesso utilizzato con elemento `<output>` per mostrare il valore selezionato

## Input per Data e Ora

### Input di Tipo Date (`type="date"`)

Per la selezione di una data.

```html
<label for="data_nascita">Data di nascita:</label>
<input type="date" id="data_nascita" name="data_nascita" min="1900-01-01" max="2023-12-31">
```

Attributi specifici:

- `min`: Data minima selezionabile
- `max`: Data massima selezionabile
- `step`: Incremento in giorni (default: 1)

### Input di Tipo Time (`type="time"`)

Per la selezione di un orario.

```html
<label for="orario">Orario:</label>
<input type="time" id="orario" name="orario">
```

### Altri Input per Data e Ora

- `datetime-local`: Combina data e ora
- `month`: Permette di selezionare mese e anno
- `week`: Permette di selezionare una settimana specifica dell'anno

```html
<label for="appuntamento">Appuntamento:</label>
<input type="datetime-local" id="appuntamento" name="appuntamento">

<label for="mese">Mese:</label>
<input type="month" id="mese" name="mese">

<label for="settimana">Settimana:</label>
<input type="week" id="settimana" name="settimana">
```

## Input per Colori e File

### Input di Tipo Color (`type="color"`)

Permette la selezione di un colore tramite color picker.

```html
<label for="colore">Colore preferito:</label>
<input type="color" id="colore" name="colore" value="#ff0000">
```

Caratteristiche:

- Fornisce un'interfaccia per la selezione del colore
- Restituisce un valore in formato esadecimale
- Supporta l'attributo `value` per impostare un colore predefinito

### Input di Tipo File (`type="file"`)

Permette il caricamento di file.

```html
<label for="documento">Carica documento:</label>
<input type="file" id="documento" name="documento" accept=".pdf,.doc,.docx">
```

Attributi specifici:

- `accept`: Specifica i tipi di file accettati
- `multiple`: Permette la selezione di più file
- `capture`: Su dispositivi mobili, può attivare la fotocamera o il microfono

## Input Nascosti e di Ricerca

### Input di Tipo Hidden (`type="hidden"`)

Campo invisibile all'utente ma inviato con il form.

```html
<input type="hidden" id="timestamp" name="timestamp" value="1634567890">
```

Utilizzo:

- Memorizzare dati che devono essere inviati ma non modificati dall'utente
- Mantenere lo stato tra diverse richieste
- Memorizzare token di sicurezza o identificatori di sessione

### Input di Tipo Search (`type="search"`)

Specifico per campi di ricerca.

```html
<label for="ricerca">Cerca:</label>
<input type="search" id="ricerca" name="ricerca">
```

Caratteristiche:

- Aspetto ottimizzato per la ricerca (spesso con pulsante di cancellazione)
- Comportamento specifico per dispositivi mobili
- Cronologia delle ricerche in alcuni browser

## Attributi Comuni per Tutti i Tipi di Input

### Attributi di Validazione

- `required`: Rende il campo obbligatorio
- `pattern`: Specifica un'espressione regolare per la validazione
- `min` e `max`: Definiscono valori minimi e massimi (per numeri e date)
- `minlength` e `maxlength`: Definiscono lunghezze minime e massime per il testo

### Attributi di Comportamento

- `autocomplete`: Controlla il completamento automatico (`on` o `off`)
- `autofocus`: Imposta il focus automatico sul campo al caricamento della pagina
- `form`: Associa l'input a un form specifico tramite ID
- `formaction`, `formmethod`, `formenctype`: Sovrascrivono gli attributi del form per input di tipo submit

## Esempio Completo con Diversi Tipi di Input

```html
<form action="/registrazione" method="post">
  <fieldset>
    <legend>Informazioni Personali</legend>
    
    <div class="form-group">
      <label for="nome">Nome:</label>
      <input type="text" id="nome" name="nome" required>
    </div>
    
    <div class="form-group">
      <label for="email">Email:</label>
      <input type="email" id="email" name="email" required>
    </div>
    
    <div class="form-group">
      <label for="password">Password:</label>
      <input type="password" id="password" name="password" 
             minlength="8" required>
    </div>
    
    <div class="form-group">
      <label for="data_nascita">Data di nascita:</label>
      <input type="date" id="data_nascita" name="data_nascita">
    </div>
    
    <div class="form-group">
      <label for="telefono">Telefono:</label>
      <input type="tel" id="telefono" name="telefono" 
             pattern="[0-9]{10}">
    </div>
  </fieldset>
  
  <fieldset>
    <legend>Preferenze</legend>
    
    <div class="form-group">
      <label for="colore">Colore preferito:</label>
      <input type="color" id="colore" name="colore">
    </div>
    
    <div class="form-group">
      <label for="soddisfazione">Livello di soddisfazione:</label>
      <input type="range" id="soddisfazione" name="soddisfazione" 
             min="0" max="10" value="5">
      <output for="soddisfazione">5</output>
    </div>
  </fieldset>
  
  <fieldset>
    <legend>Documenti</legend>
    
    <div class="form-group">
      <label for="cv">Curriculum Vitae:</label>
      <input type="file" id="cv" name="cv" 
             accept=".pdf,.doc,.docx">
    </div>
  </fieldset>
  
  <div class="form-actions">
    <button type="reset">Cancella</button>
    <button type="submit">Invia</button>
  </div>
</form>
```

## Best Practices per l'Utilizzo dei Tipi di Input

1. **Scegliere il tipo appropriato**: Utilizzare il tipo di input più adatto al tipo di dati richiesto
2. **Fornire feedback visivo**: Utilizzare CSS per indicare stati come focus, errore e successo
3. **Utilizzare placeholder significativi**: Fornire esempi o indicazioni sul formato atteso
4. **Implementare validazione lato client e server**: Non affidarsi solo alla validazione HTML5
5. **Considerare l'accessibilità**: Assicurarsi che tutti i campi siano utilizzabili con tecnologie assistive
6. **Testare su diversi browser e dispositivi**: Il supporto per alcuni tipi di input può variare
7. **Fornire alternative**: Per browser che non supportano tipi specifici, questi vengono interpretati come `type="text"`

## Esempio di Stile CSS per Diversi Tipi di Input

```css
/* Stile base per tutti gli input */
input {
  padding: 8px;
  border: 1px solid #ccc;
  border-radius: 4px;
  font-size: 16px;
  transition: border-color 0.3s;
}

/* Stile per input di tipo testo, email, password, tel, url */
input[type="text"],
input[type="email"],
input[type="password"],
input[type="tel"],
input[type="url"] {
  width: 100%;
}

/* Stile per input di tipo numerico */
input[type="number"] {
  width: 80px;
}

/* Stile per input di tipo range */
input[type="range"] {
  width: 100%;
  margin: 10px 0;
}

/* Stile per input di tipo colore */
input[type="color"] {
  width: 50px;
  height: 30px;
  padding: 0;
  cursor: pointer;
}

/* Stile per input di tipo file */
input[type="file"] {
  padding: 5px 0;
  border: none;
}

/* Stile per input di tipo data e ora */
input[type="date"],
input[type="time"],
input[type="datetime-local"] {
  padding: 7px;
}

/* Stile per input con focus */
input:focus {
  border-color: #4a90e2;
  outline: none;
  box-shadow: 0 0 3px rgba(74, 144, 226, 0.5);
}

/* Stile per input validi e invalidi */
input:valid {
  border-color: #4CAF50;
}

input:invalid {
  border-color: #f44336;
}

/* Stile per input disabilitati */
input:disabled {
  background-color: #f5f5f5;
  cursor: not-allowed;
  opacity: 0.7;
}
```

## Conclusione

I diversi tipi di input HTML5 offrono un'ampia gamma di opzioni per raccogliere dati dagli utenti in modo efficiente e user-friendly. Scegliendo il tipo di input appropriato per ogni campo, è possibile migliorare significativamente l'usabilità dei form, ridurre gli errori di inserimento e semplificare la validazione dei dati. Nei prossimi capitoli, esploreremo gli elementi di selezione come select, radio e checkbox, che completano le opzioni disponibili per la creazione di form interattivi.

## Navigazione del Corso
- [📑 Indice](../README.md)
- [⬅️ Struttura Base dei Form](./01-StrutturaForm.md)
- [➡️ Elementi di Selezione](./03-ElementiSelezione.md)