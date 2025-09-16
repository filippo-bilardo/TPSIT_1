# Progressive Web Apps

## Introduzione alle Progressive Web Apps

Le Progressive Web Apps (PWA) rappresentano un'evoluzione delle tradizionali applicazioni web, combinando il meglio del web e delle app native. Questo approccio allo sviluppo web, promosso inizialmente da Google nel 2015, mira a creare esperienze utente di alta qualità che siano affidabili, veloci e coinvolgenti, indipendentemente dal dispositivo o dalla connessione di rete.

Le PWA si basano su tecnologie web standard e seguono un approccio progressivo all'esperienza utente, migliorando gradualmente in base alle capacità del browser e del dispositivo. Questo significa che funzionano per tutti gli utenti, ma offrono funzionalità avanzate quando supportate.

I principali vantaggi delle Progressive Web Apps includono:

- **Affidabilità**: funzionano anche in condizioni di rete instabili o assenti
- **Velocità**: caricamento rapido e interazioni fluide
- **Coinvolgimento**: offrono un'esperienza simile alle app native, con notifiche push e installazione sulla schermata home
- **Aggiornamenti automatici**: gli utenti hanno sempre l'ultima versione
- **Sicurezza**: vengono servite tramite HTTPS
- **Reperibilità**: sono indicizzabili dai motori di ricerca
- **Condivisibilità**: possono essere condivise tramite URL
- **Installabilità**: possono essere aggiunte alla schermata home senza passare per gli app store

## Caratteristiche fondamentali delle PWA

### Responsive Design

Le PWA devono adattarsi a qualsiasi dispositivo, offrendo un'esperienza utente ottimale indipendentemente dalle dimensioni dello schermo. Questo richiede l'implementazione di tecniche di design responsive:

```css
/* Esempio di media query per design responsive */
.app-container {
  width: 100%;
  padding: 15px;
}

@media (min-width: 768px) {
  .app-container {
    max-width: 750px;
    margin: 0 auto;
  }
}

@media (min-width: 992px) {
  .app-container {
    max-width: 970px;
  }
}

/* Utilizzo di unità relative per la tipografia */
body {
  font-size: 16px;
}

h1 {
  font-size: 2rem; /* 32px se il font-size del body è 16px */
}

/* Immagini responsive */
img {
  max-width: 100%;
  height: auto;
}
```

### Service Worker

I Service Worker sono script che il browser esegue in background, separatamente dalla pagina web, permettendo funzionalità che non richiedono interazione con l'utente o la pagina web. Sono fondamentali per le PWA, in quanto consentono:

- Caching delle risorse per l'accesso offline
- Sincronizzazione in background
- Notifiche push
- Aggiornamenti in background

```javascript
// Registrazione del Service Worker
if ('serviceWorker' in navigator) {
  window.addEventListener('load', () => {
    navigator.serviceWorker.register('/sw.js')
      .then(registration => {
        console.log('Service Worker registrato con successo:', registration.scope);
      })
      .catch(error => {
        console.error('Errore nella registrazione del Service Worker:', error);
      });
  });
}

// File sw.js (Service Worker)
const CACHE_NAME = 'my-pwa-cache-v1';
const urlsToCache = [
  '/',
  '/index.html',
  '/styles/main.css',
  '/scripts/main.js',
  '/images/logo.png'
];

// Installazione e caching delle risorse
self.addEventListener('install', event => {
  event.waitUntil(
    caches.open(CACHE_NAME)
      .then(cache => {
        console.log('Cache aperta');
        return cache.addAll(urlsToCache);
      })
  );
});

// Strategia di caching: Cache First, poi Network
self.addEventListener('fetch', event => {
  event.respondWith(
    caches.match(event.request)
      .then(response => {
        // Restituisce la risorsa dalla cache se presente
        if (response) {
          return response;
        }
        
        // Altrimenti effettua la richiesta di rete
        return fetch(event.request)
          .then(response => {
            // Verifica che la risposta sia valida
            if (!response || response.status !== 200 || response.type !== 'basic') {
              return response;
            }
            
            // Clona la risposta perché può essere consumata una sola volta
            const responseToCache = response.clone();
            
            caches.open(CACHE_NAME)
              .then(cache => {
                cache.put(event.request, responseToCache);
              });
            
            return response;
          });
      })
  );
});
```

### Web App Manifest

Il Web App Manifest è un file JSON che fornisce informazioni sull'applicazione web, consentendo l'installazione sul dispositivo dell'utente. Definisce l'aspetto e il comportamento dell'app quando viene installata:

```json
{
  "name": "La Mia PWA",
  "short_name": "MiaPWA",
  "description": "Una fantastica Progressive Web App di esempio",
  "start_url": "/index.html",
  "display": "standalone",
  "background_color": "#ffffff",
  "theme_color": "#2196f3",
  "orientation": "portrait-primary",
  "icons": [
    {
      "src": "/images/icon-192.png",
      "sizes": "192x192",
      "type": "image/png",
      "purpose": "any maskable"
    },
    {
      "src": "/images/icon-512.png",
      "sizes": "512x512",
      "type": "image/png",
      "purpose": "any maskable"
    }
  ],
  "screenshots": [
    {
      "src": "/images/screenshot1.png",
      "sizes": "1280x720",
      "type": "image/png"
    }
  ]
}
```

Per collegare il manifest alla pagina HTML:

```html
<link rel="manifest" href="/manifest.json">
<meta name="theme-color" content="#2196f3">
```

## Funzionalità avanzate delle PWA

### Notifiche Push

Le notifiche push permettono di coinvolgere nuovamente gli utenti anche quando non stanno attivamente utilizzando l'applicazione:

```javascript
// Richiesta del permesso per le notifiche
function requestNotificationPermission() {
  if ('Notification' in window) {
    Notification.requestPermission().then(permission => {
      if (permission === 'granted') {
        console.log('Permesso per le notifiche concesso');
        subscribeUserToPush();
      }
    });
  }
}

// Sottoscrizione dell'utente alle notifiche push
function subscribeUserToPush() {
  navigator.serviceWorker.ready
    .then(registration => {
      const subscribeOptions = {
        userVisibleOnly: true,
        applicationServerKey: urlBase64ToUint8Array('your-public-vapid-key')
      };
      
      return registration.pushManager.subscribe(subscribeOptions);
    })
    .then(pushSubscription => {
      console.log('Sottoscrizione ricevuta:', JSON.stringify(pushSubscription));
      // Invia la sottoscrizione al server
      return sendSubscriptionToServer(pushSubscription);
    });
}

// Nel Service Worker
self.addEventListener('push', event => {
  const data = event.data.json();
  
  const options = {
    body: data.body,
    icon: '/images/notification-icon.png',
    badge: '/images/badge-icon.png',
    vibrate: [100, 50, 100],
    data: {
      url: data.url
    },
    actions: [
      {
        action: 'explore',
        title: 'Visualizza',
        icon: '/images/checkmark.png'
      },
      {
        action: 'close',
        title: 'Chiudi',
        icon: '/images/xmark.png'
      }
    ]
  };
  
  event.waitUntil(
    self.registration.showNotification(data.title, options)
  );
});

// Gestione del click sulla notifica
self.addEventListener('notificationclick', event => {
  event.notification.close();
  
  if (event.action === 'explore') {
    clients.openWindow(event.notification.data.url);
  }
});
```

### Background Sync

La sincronizzazione in background permette di posticipare le azioni fino a quando l'utente non ha una connessione stabile:

```javascript
// Registrazione di un evento di sincronizzazione
function registerSync() {
  if ('serviceWorker' in navigator && 'SyncManager' in window) {
    navigator.serviceWorker.ready
      .then(registration => {
        // Registra un tag di sincronizzazione
        return registration.sync.register('sync-messages');
      })
      .catch(err => {
        console.error('Errore nella registrazione della sincronizzazione:', err);
      });
  } else {
    // Fallback per browser che non supportano Background Sync
    sendMessagesImmediately();
  }
}

// Nel Service Worker
self.addEventListener('sync', event => {
  if (event.tag === 'sync-messages') {
    event.waitUntil(
      syncMessages()
    );
  }
});

// Funzione per sincronizzare i messaggi
async function syncMessages() {
  try {
    // Recupera i messaggi non sincronizzati dal database locale
    const db = await openDatabase();
    const messages = await getUnsyncedMessages(db);
    
    // Invia i messaggi al server
    for (const message of messages) {
      await sendMessageToServer(message);
      await markMessageAsSynced(db, message.id);
    }
    
    return true;
  } catch (error) {
    console.error('Errore nella sincronizzazione dei messaggi:', error);
    return false;
  }
}
```

### App Shell Architecture

L'architettura App Shell separa l'infrastruttura dell'applicazione dal contenuto, permettendo caricamenti più rapidi e un'esperienza simile alle app native:

```html
<!DOCTYPE html>
<html lang="it">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>La Mia PWA</title>
  <link rel="stylesheet" href="/styles/shell.css">
  <link rel="manifest" href="/manifest.json">
</head>
<body>
  <!-- App Shell (struttura statica) -->
  <header class="app-header">
    <div class="logo">La Mia PWA</div>
    <nav class="main-nav">
      <ul>
        <li><a href="/">Home</a></li>
        <li><a href="/about">Chi siamo</a></li>
        <li><a href="/contact">Contatti</a></li>
      </ul>
    </nav>
  </header>
  
  <!-- Contenitore per il contenuto dinamico -->
  <main id="content">
    <!-- Il contenuto verrà caricato dinamicamente qui -->
    <div class="loading-spinner"></div>
  </main>
  
  <footer class="app-footer">
    <p>&copy; 2023 La Mia PWA</p>
  </footer>
  
  <script src="/scripts/app-shell.js"></script>
  <script>
    // Registrazione del Service Worker
    if ('serviceWorker' in navigator) {
      navigator.serviceWorker.register('/sw.js');
    }
    
    // Caricamento del contenuto in base alla route
    function loadContent(route) {
      const contentElement = document.getElementById('content');
      contentElement.innerHTML = '<div class="loading-spinner"></div>';
      
      fetch(`/api/content${route}`)
        .then(response => response.json())
        .then(data => {
          contentElement.innerHTML = data.html;
        })
        .catch(error => {
          contentElement.innerHTML = '<p>Errore nel caricamento del contenuto.</p>';
          console.error('Errore:', error);
        });
    }
    
    // Gestione della navigazione
    window.addEventListener('popstate', event => {
      loadContent(window.location.pathname);
    });
    
    // Intercetta i click sui link interni
    document.addEventListener('click', event => {
      if (event.target.tagName === 'A' && event.target.origin === window.location.origin) {
        event.preventDefault();
        const route = event.target.pathname;
        history.pushState(null, '', route);
        loadContent(route);
      }
    });
    
    // Carica il contenuto iniziale
    loadContent(window.location.pathname);
  </script>
</body>
</html>
```

## Strategie di implementazione

### Approccio PRPL

Il pattern PRPL (Push, Render, Pre-cache, Lazy-load) è una strategia per strutturare e servire Progressive Web Apps, ottimizzando per prestazioni e interattività:

- **Push**: utilizzare HTTP/2 server push per inviare le risorse critiche al browser il più rapidamente possibile
- **Render**: renderizzare il percorso iniziale il più rapidamente possibile
- **Pre-cache**: utilizzare un Service Worker per memorizzare nella cache le risorse per altri percorsi
- **Lazy-load**: caricare on-demand le risorse necessarie per i percorsi rimanenti

Questo approccio garantisce un caricamento iniziale rapido e un'esperienza fluida durante la navigazione successiva.

### App Shell Model

Il modello App Shell separa l'infrastruttura dell'applicazione (shell) dal contenuto dinamico, permettendo di caricare rapidamente l'interfaccia di base e poi popolarla con i dati:

- La shell include l'HTML, CSS e JavaScript minimi necessari per l'interfaccia utente
- Viene memorizzata nella cache e caricata istantaneamente nelle visite successive
- Il contenuto viene caricato dinamicamente tramite API

Questo approccio migliora significativamente la percezione di velocità dell'applicazione.

## Conclusione

Le Progressive Web Apps rappresentano un'evoluzione significativa nello sviluppo web, combinando il meglio delle applicazioni native e delle pagine web tradizionali. Offrono un'esperienza utente di alta qualità che è affidabile, veloce e coinvolgente, indipendentemente dal dispositivo o dalle condizioni di rete.

Implementare una PWA non richiede necessariamente una completa riscrittura dell'applicazione esistente, ma può essere un processo graduale di miglioramento, aggiungendo funzionalità come Service Workers, manifest e altre caratteristiche progressive. Questo approccio incrementale permette di ottenere benefici immediati in termini di performance, engagement e conversione.

Con il crescente supporto dei browser e l'adozione da parte di grandi aziende, le PWA stanno diventando sempre più mainstream, offrendo un'alternativa valida alle app native in molti scenari. Seguendo le best practice e le strategie discusse in questo capitolo, è possibile creare applicazioni web che non solo soddisfano le aspettative degli utenti moderni, ma le superano, offrendo esperienze veloci, affidabili e coinvolgenti su qualsiasi piattaforma.

---

### Navigazione
- [📑 Indice](<../README.md>)
- [⬅️ Offline Web Applications](<03_Offline_Web_Applications.md>)
- [➡️ Web Components](<05_Web_Components.md>)