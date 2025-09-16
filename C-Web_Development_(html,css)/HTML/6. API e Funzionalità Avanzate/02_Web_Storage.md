# Web Storage

## Introduzione al Web Storage

Il Web Storage è una delle funzionalità più utili introdotte con HTML5, che consente alle applicazioni web di memorizzare dati localmente nel browser dell'utente. Prima dell'introduzione di questa tecnologia, gli sviluppatori erano limitati principalmente all'uso dei cookie HTTP, che presentavano diverse limitazioni in termini di dimensioni, sicurezza e facilità d'uso.

Il Web Storage offre diversi vantaggi rispetto ai cookie tradizionali:
- Maggiore capacità di archiviazione (generalmente 5-10 MB per dominio)
- Migliore performance, poiché i dati non vengono inviati ad ogni richiesta HTTP
- API più semplice e intuitiva
- Maggiore sicurezza, poiché i dati sono accessibili solo da pagine dello stesso dominio

HTML5 introduce due meccanismi principali per il Web Storage:
- **localStorage**: memorizza i dati senza data di scadenza
- **sessionStorage**: memorizza i dati per la durata della sessione del browser

## localStorage

Il localStorage permette di memorizzare coppie chiave-valore che persistono anche dopo la chiusura del browser. I dati rimangono disponibili finché non vengono esplicitamente rimossi tramite JavaScript o l'utente non cancella i dati di navigazione.

```javascript
// Salvataggio di dati
localStorage.setItem('username', 'mario_rossi');

// Recupero di dati
const username = localStorage.getItem('username'); // 'mario_rossi'

// Verifica dell'esistenza di una chiave
if (localStorage.getItem('preferenze')) {
  // La chiave esiste
}

// Rimozione di un singolo item
localStorage.removeItem('username');

// Pulizia completa del localStorage
localStorage.clear();

// Accesso diretto come proprietà di un oggetto (sconsigliato)
localStorage.lastVisit = new Date().toISOString();
const lastVisit = localStorage.lastVisit;
```

È importante notare che localStorage può memorizzare solo stringhe. Per salvare oggetti o array, è necessario convertirli in formato JSON:

```javascript
// Salvataggio di un oggetto
const userPreferences = {
  theme: 'dark',
  fontSize: 16,
  notifications: true
};

localStorage.setItem('preferences', JSON.stringify(userPreferences));

// Recupero e parsing dell'oggetto
const storedPreferences = JSON.parse(localStorage.getItem('preferences'));
console.log(storedPreferences.theme); // 'dark'
```

## sessionStorage

Il sessionStorage funziona in modo simile al localStorage, ma i dati vengono mantenuti solo per la durata della sessione del browser. Quando l'utente chiude la scheda o la finestra, i dati vengono automaticamente eliminati.

```javascript
// Salvataggio di dati temporanei
sessionStorage.setItem('carrello', JSON.stringify([{id: 1, nome: 'Prodotto 1', prezzo: 29.99}]));

// Recupero dei dati
const carrello = JSON.parse(sessionStorage.getItem('carrello'));

// Rimozione di un item
sessionStorage.removeItem('carrello');

// Pulizia completa
sessionStorage.clear();
```

Il sessionStorage è particolarmente utile per:
- Dati temporanei di navigazione
- Stato di form non completati
- Carrelli della spesa temporanei
- Dati di autenticazione temporanei

## Eventi di storage

Una caratteristica importante del Web Storage è la possibilità di rilevare modifiche ai dati memorizzati attraverso l'evento `storage`. Questo evento viene attivato in tutte le finestre/schede aperte dello stesso dominio (eccetto quella che ha effettuato la modifica) quando i dati nel localStorage o sessionStorage vengono modificati.

```javascript
// Ascolto delle modifiche al localStorage
window.addEventListener('storage', function(event) {
  console.log('Chiave modificata:', event.key);
  console.log('Vecchio valore:', event.oldValue);
  console.log('Nuovo valore:', event.newValue);
  console.log('URL della pagina che ha effettuato la modifica:', event.url);
  console.log('Area di storage modificata:', event.storageArea); // localStorage o sessionStorage
  
  // Esempio: aggiornamento dell'interfaccia in base ai nuovi dati
  if (event.key === 'theme') {
    applyTheme(event.newValue);
  }
});
```

Questo meccanismo è particolarmente utile per sincronizzare lo stato dell'applicazione tra diverse schede o finestre aperte contemporaneamente.

## Limiti e considerazioni

Nonostante i numerosi vantaggi, il Web Storage presenta alcune limitazioni da tenere in considerazione:

1. **Limiti di spazio**: la maggior parte dei browser limita lo storage a circa 5-10 MB per dominio.

2. **Solo stringhe**: come menzionato, è possibile memorizzare solo stringhe, richiedendo conversioni per dati strutturati.

3. **Operazioni sincrone**: le operazioni di lettura/scrittura sono sincrone e possono bloccare il thread principale se si manipolano grandi quantità di dati.

4. **Nessun supporto per query**: a differenza dei database, non è possibile eseguire query complesse sui dati memorizzati.

5. **Sicurezza**: i dati sono accessibili tramite JavaScript, quindi non sono adatti per informazioni sensibili come password o token di autenticazione non criptati.

6. **Modalità privata**: in modalità di navigazione privata/incognito, alcuni browser potrebbero limitare o disabilitare completamente il Web Storage.

## Pattern e best practice

Ecco alcune best practice per l'utilizzo efficace del Web Storage:

### 1. Verifica del supporto

Prima di utilizzare il Web Storage, è buona pratica verificare che sia supportato dal browser:

```javascript
function isStorageSupported(type) {
  try {
    const storage = window[type];
    const testKey = '__storage_test__';
    storage.setItem(testKey, testKey);
    storage.removeItem(testKey);
    return true;
  } catch (e) {
    return false;
  }
}

if (isStorageSupported('localStorage')) {
  // localStorage disponibile
} else {
  // Fallback ad altri metodi
}
```

### 2. Wrapper per gestire errori e conversioni

Creare un wrapper può semplificare l'uso del Web Storage e gestire automaticamente la conversione JSON e gli errori:

```javascript
const storageUtil = {
  set: function(key, value) {
    try {
      const serializedValue = JSON.stringify(value);
      localStorage.setItem(key, serializedValue);
      return true;
    } catch (e) {
      console.error('Errore nel salvataggio dei dati:', e);
      return false;
    }
  },
  
  get: function(key, defaultValue = null) {
    try {
      const serializedValue = localStorage.getItem(key);
      if (serializedValue === null) return defaultValue;
      return JSON.parse(serializedValue);
    } catch (e) {
      console.error('Errore nel recupero dei dati:', e);
      return defaultValue;
    }
  },
  
  remove: function(key) {
    try {
      localStorage.removeItem(key);
      return true;
    } catch (e) {
      console.error('Errore nella rimozione dei dati:', e);
      return false;
    }
  },
  
  clear: function() {
    try {
      localStorage.clear();
      return true;
    } catch (e) {
      console.error('Errore nella pulizia dello storage:', e);
      return false;
    }
  }
};

// Utilizzo
storageUtil.set('user', { id: 1, name: 'Mario' });
const user = storageUtil.get('user');
```

### 3. Gestione dello spazio limitato

Per gestire il limite di spazio, è possibile implementare strategie come la pulizia automatica dei dati meno recenti:

```javascript
function storeWithExpiry(key, value, ttl) {
  const item = {
    value: value,
    expiry: Date.now() + ttl,
  };
  localStorage.setItem(key, JSON.stringify(item));
}

function getWithExpiry(key) {
  const itemStr = localStorage.getItem(key);
  if (!itemStr) return null;
  
  const item = JSON.parse(itemStr);
  if (Date.now() > item.expiry) {
    localStorage.removeItem(key);
    return null;
  }
  return item.value;
}

// Utilizzo: memorizza per 24 ore
storeWithExpiry('authToken', 'xyz123', 24 * 60 * 60 * 1000);
```

## Casi d'uso comuni

Il Web Storage è particolarmente adatto per diversi scenari applicativi:

### Persistenza delle preferenze utente

```javascript
// Salvataggio delle preferenze
function saveUserPreferences() {
  const preferences = {
    theme: document.getElementById('theme-selector').value,
    fontSize: document.getElementById('font-size').value,
    notifications: document.getElementById('notifications').checked
  };
  localStorage.setItem('userPreferences', JSON.stringify(preferences));
}

// Applicazione delle preferenze salvate
function applyUserPreferences() {
  const preferences = JSON.parse(localStorage.getItem('userPreferences'));
  if (preferences) {
    document.body.className = preferences.theme;
    document.body.style.fontSize = preferences.fontSize + 'px';
    // Altre applicazioni...
  }
}

// Applicazione all'avvio
document.addEventListener('DOMContentLoaded', applyUserPreferences);
```

### Salvataggio automatico di form

```javascript
const form = document.getElementById('registration-form');
const formFields = form.querySelectorAll('input, select, textarea');

// Salvataggio automatico dei campi del form
formFields.forEach(field => {
  field.addEventListener('input', () => {
    sessionStorage.setItem('form_' + field.name, field.value);
  });
});

// Ripristino dei valori salvati
function restoreFormValues() {
  formFields.forEach(field => {
    const savedValue = sessionStorage.getItem('form_' + field.name);
    if (savedValue) {
      field.value = savedValue;
    }
  });
}

// Pulizia dopo l'invio
form.addEventListener('submit', () => {
  formFields.forEach(field => {
    sessionStorage.removeItem('form_' + field.name);
  });
});

// Ripristino all'avvio
document.addEventListener('DOMContentLoaded', restoreFormValues);
```

### Memorizzazione della cronologia di navigazione

```javascript
function addToHistory(pageTitle, pageUrl) {
  let history = JSON.parse(localStorage.getItem('browsingHistory')) || [];
  
  // Aggiungi la nuova pagina all'inizio dell'array
  history.unshift({
    title: pageTitle,
    url: pageUrl,
    timestamp: Date.now()
  });
  
  // Limita la cronologia a 20 elementi
  if (history.length > 20) {
    history = history.slice(0, 20);
  }
  
  localStorage.setItem('browsingHistory', JSON.stringify(history));
}

function displayHistory() {
  const history = JSON.parse(localStorage.getItem('browsingHistory')) || [];
  const historyContainer = document.getElementById('history-container');
  
  historyContainer.innerHTML = '';
  
  history.forEach(item => {
    const entry = document.createElement('div');
    const date = new Date(item.timestamp).toLocaleString();
    entry.innerHTML = `<a href="${item.url}">${item.title}</a> <span>${date}</span>`;
    historyContainer.appendChild(entry);
  });
}

// Registra la visita corrente
document.addEventListener('DOMContentLoaded', () => {
  addToHistory(document.title, window.location.href);
});
```

## Conclusione

Il Web Storage rappresenta un potente strumento per migliorare l'esperienza utente nelle applicazioni web moderne, consentendo la persistenza dei dati e riducendo la necessità di continue richieste al server. Sebbene presenti alcune limitazioni, con le giuste strategie e pattern di implementazione, può essere utilizzato efficacemente in una vasta gamma di scenari applicativi.

Per applicazioni che necessitano di funzionalità più avanzate, come la gestione di grandi quantità di dati strutturati o query complesse, è consigliabile considerare alternative come IndexedDB o soluzioni basate su cloud. Tuttavia, per molti casi d'uso comuni, il Web Storage offre un equilibrio ottimale tra semplicità, performance e funzionalità.

---

### Navigazione
- [📑 Indice](<../README.md>)
- [⬅️ API HTML5](<01_API_HTML5.md>)
- [➡️ Offline Web Applications](<03_Offline_Web_Applications.md>)