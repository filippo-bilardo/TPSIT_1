# Offline Web Applications

## Introduzione alle applicazioni web offline

Le applicazioni web offline rappresentano un'evoluzione significativa nello sviluppo web, consentendo agli utenti di continuare a utilizzare un'applicazione anche in assenza di connessione Internet. Questa funzionalità, resa possibile da diverse tecnologie HTML5, ha trasformato il web da una piattaforma che richiedeva una connessione costante a un ambiente in grado di offrire esperienze simili alle applicazioni native.

I vantaggi delle applicazioni web offline includono:
- Miglioramento dell'esperienza utente, eliminando le interruzioni dovute a connessioni instabili
- Riduzione del consumo di dati, poiché le risorse vengono caricate una sola volta
- Maggiore velocità di caricamento dopo la prima visita
- Possibilità di utilizzo in ambienti con connettività limitata o assente

In questo capitolo esploreremo le principali tecnologie che consentono lo sviluppo di applicazioni web offline, con particolare attenzione ai Service Workers, al Cache API e al manifest delle applicazioni web.

## Service Workers

I Service Workers rappresentano il fondamento delle moderne applicazioni web offline. Si tratta di script JavaScript che operano in background, separatamente dalla pagina web, e fungono da proxy di rete programmabile tra l'applicazione e il server.

### Ciclo di vita di un Service Worker

Il ciclo di vita di un Service Worker comprende diverse fasi:

1. **Registrazione**: l'applicazione registra il Service Worker
2. **Installazione**: il browser scarica, analizza ed esegue il Service Worker
3. **Attivazione**: il Service Worker diventa attivo e può controllare le pagine
4. **Inattività**: il Service Worker entra in uno stato di inattività per risparmiare risorse
5. **Terminazione**: il browser può terminare il Service Worker quando non è in uso

```javascript
// Registrazione di un Service Worker
if ('serviceWorker' in navigator) {
  window.addEventListener('load', function() {
    navigator.serviceWorker.register('/service-worker.js')
      .then(function(registration) {
        console.log('Service Worker registrato con successo:', registration.scope);
      })
      .catch(function(error) {
        console.error('Errore nella registrazione del Service Worker:', error);
      });
  });
}
```

### Intercettazione delle richieste di rete

Una delle funzionalità più potenti dei Service Workers è la capacità di intercettare e gestire le richieste di rete attraverso l'evento `fetch`:

```javascript
// File: service-worker.js
self.addEventListener('fetch', function(event) {
  event.respondWith(
    caches.match(event.request)
      .then(function(response) {
        // Restituisce la risorsa dalla cache se presente
        if (response) {
          return response;
        }
        
        // Altrimenti effettua la richiesta di rete
        return fetch(event.request)
          .then(function(networkResponse) {
            // Clona la risposta perché può essere consumata una sola volta
            const responseClone = networkResponse.clone();
            
            // Aggiunge la risposta alla cache per usi futuri
            caches.open('v1').then(function(cache) {
              cache.put(event.request, responseClone);
            });
            
            return networkResponse;
          })
          .catch(function() {
            // Se sia la cache che la rete falliscono, restituisce una pagina di fallback
            return caches.match('/offline.html');
          });
      })
  );
});
```

### Strategie di caching

Esistono diverse strategie per gestire il caching delle risorse con i Service Workers:

1. **Cache First**: controlla prima la cache e ricorre alla rete solo se necessario
2. **Network First**: tenta prima la richiesta di rete e utilizza la cache come fallback
3. **Stale While Revalidate**: serve la versione in cache mentre aggiorna la cache in background
4. **Cache Only**: serve solo risorse dalla cache, senza mai accedere alla rete
5. **Network Only**: utilizza sempre la rete, senza mai accedere alla cache

```javascript
// Strategia Cache First
function cacheFirst(request) {
  return caches.match(request)
    .then(function(response) {
      return response || fetch(request)
        .then(function(networkResponse) {
          caches.open('v1').then(function(cache) {
            cache.put(request, networkResponse.clone());
          });
          return networkResponse;
        });
    });
}

// Strategia Network First
function networkFirst(request) {
  return fetch(request)
    .then(function(response) {
      caches.open('v1').then(function(cache) {
        cache.put(request, response.clone());
      });
      return response;
    })
    .catch(function() {
      return caches.match(request);
    });
}
```

## Cache API

La Cache API è un'interfaccia di storage dedicata per le risorse delle richieste HTTP, progettata specificamente per l'uso con i Service Workers. Consente di memorizzare coppie di oggetti Request/Response per un accesso offline.

```javascript
// Memorizzazione di risorse nella cache durante l'installazione del Service Worker
self.addEventListener('install', function(event) {
  event.waitUntil(
    caches.open('app-static-v1')
      .then(function(cache) {
        return cache.addAll([
          '/',
          '/index.html',
          '/styles/main.css',
          '/scripts/main.js',
          '/images/logo.png',
          '/offline.html'
        ]);
      })
  );
});

// Gestione della cache obsoleta durante l'attivazione
self.addEventListener('activate', function(event) {
  const cacheWhitelist = ['app-static-v1', 'app-dynamic'];
  
  event.waitUntil(
    caches.keys().then(function(cacheNames) {
      return Promise.all(
        cacheNames.map(function(cacheName) {
          if (cacheWhitelist.indexOf(cacheName) === -1) {
            // Elimina le cache obsolete
            return caches.delete(cacheName);
          }
        })
      );
    })
  );
});
```

## Web App Manifest

Il Web App Manifest è un file JSON che fornisce informazioni sull'applicazione web, consentendo l'installazione sul dispositivo dell'utente come un'app nativa. Questo migliora l'esperienza offline e l'integrazione con il sistema operativo.

```json
// File: manifest.json
{
  "name": "La Mia Applicazione",
  "short_name": "MiaApp",
  "description": "Una fantastica applicazione web progressiva",
  "start_url": "/index.html",
  "display": "standalone",
  "background_color": "#ffffff",
  "theme_color": "#4285f4",
  "icons": [
    {
      "src": "/images/icon-192.png",
      "sizes": "192x192",
      "type": "image/png"
    },
    {
      "src": "/images/icon-512.png",
      "sizes": "512x512",
      "type": "image/png"
    }
  ]
}
```

Per collegare il manifest alla pagina HTML, si utilizza un tag `<link>` nell'intestazione del documento:

```html
<link rel="manifest" href="/manifest.json">
```

È consigliabile aggiungere anche meta tag per migliorare l'esperienza su diverse piattaforme:

```html
<!-- iOS -->
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta name="apple-mobile-web-app-title" content="MiaApp">
<link rel="apple-touch-icon" href="/images/icon-152.png">

<!-- Windows -->
<meta name="msapplication-TileImage" content="/images/icon-144.png">
<meta name="msapplication-TileColor" content="#4285f4">
```

## IndexedDB per la persistenza dei dati

Mentre il Web Storage è utile per piccole quantità di dati, IndexedDB è più adatto per applicazioni offline che necessitano di memorizzare grandi quantità di dati strutturati. È un database NoSQL completo integrato nel browser.

```javascript
// Apertura di un database IndexedDB
const dbPromise = idb.open('my-database', 1, function(upgradeDb) {
  if (!upgradeDb.objectStoreNames.contains('tasks')) {
    const tasksStore = upgradeDb.createObjectStore('tasks', { keyPath: 'id', autoIncrement: true });
    tasksStore.createIndex('status', 'status');
    tasksStore.createIndex('created', 'created');
  }
});

// Aggiunta di dati
function addTask(task) {
  return dbPromise.then(function(db) {
    const tx = db.transaction('tasks', 'readwrite');
    const store = tx.objectStore('tasks');
    store.add(task);
    return tx.complete;
  });
}

// Recupero di dati
function getTasks() {
  return dbPromise.then(function(db) {
    const tx = db.transaction('tasks', 'readonly');
    const store = tx.objectStore('tasks');
    return store.getAll();
  });
}

// Sincronizzazione con il server quando la connessione è disponibile
function syncTasks() {
  if (navigator.onLine) {
    getTasks().then(function(tasks) {
      const unsynced = tasks.filter(task => !task.synced);
      
      if (unsynced.length > 0) {
        fetch('/api/tasks', {
          method: 'POST',
          headers: { 'Content-Type': 'application/json' },
          body: JSON.stringify({ tasks: unsynced })
        })
        .then(response => response.json())
        .then(function(data) {
          // Aggiorna lo stato di sincronizzazione nel database locale
          dbPromise.then(function(db) {
            const tx = db.transaction('tasks', 'readwrite');
            const store = tx.objectStore('tasks');
            
            unsynced.forEach(function(task) {
              task.synced = true;
              store.put(task);
            });
            
            return tx.complete;
          });
        });
      }
    });
  }
}

// Ascolta gli eventi online/offline
window.addEventListener('online', syncTasks);
```

## Rilevamento dello stato della connessione

Per offrire un'esperienza utente ottimale, è importante rilevare lo stato della connessione e adattare l'interfaccia di conseguenza:

```javascript
function updateOnlineStatus() {
  const statusIndicator = document.getElementById('status-indicator');
  
  if (navigator.onLine) {
    statusIndicator.textContent = 'Online';
    statusIndicator.className = 'online';
    // Tenta di sincronizzare i dati
    syncData();
  } else {
    statusIndicator.textContent = 'Offline';
    statusIndicator.className = 'offline';
    // Mostra notifica all'utente
    showNotification('Sei offline. I dati verranno sincronizzati quando tornerai online.');
  }
}

// Ascolta gli eventi di connessione
window.addEventListener('online', updateOnlineStatus);
window.addEventListener('offline', updateOnlineStatus);

// Controlla lo stato iniziale
document.addEventListener('DOMContentLoaded', updateOnlineStatus);
```

## Best practice per applicazioni web offline

Per creare applicazioni web offline efficaci, è consigliabile seguire queste best practice:

1. **Approccio offline-first**: progettare l'applicazione assumendo che la connessione possa non essere disponibile, piuttosto che trattare l'offline come un caso eccezionale.

2. **Feedback chiaro**: informare l'utente sullo stato della connessione e sulle operazioni che possono o non possono essere eseguite offline.

3. **Sincronizzazione intelligente**: implementare strategie di sincronizzazione che minimizzino il consumo di dati e gestiscano correttamente i conflitti.

4. **Caching selettivo**: memorizzare nella cache solo le risorse necessarie per il funzionamento offline, evitando di sovraccaricare lo storage del dispositivo.

5. **Gestione degli errori**: prevedere e gestire in modo elegante i casi in cui le risorse non sono disponibili offline.

6. **Test approfonditi**: testare l'applicazione in vari scenari di connettività, inclusi passaggi da online a offline e viceversa.

```javascript
// Esempio di implementazione di un indicatore di stato offline/online
function createConnectivityIndicator() {
  const indicator = document.createElement('div');
  indicator.id = 'connectivity-status';
  document.body.appendChild(indicator);
  
  function updateStatus() {
    if (navigator.onLine) {
      indicator.textContent = '✓ Online';
      indicator.className = 'status-online';
      setTimeout(() => {
        indicator.style.display = 'none';
      }, 3000);
    } else {
      indicator.textContent = '✗ Offline - I dati verranno salvati localmente';
      indicator.className = 'status-offline';
      indicator.style.display = 'block';
    }
  }
  
  window.addEventListener('online', updateStatus);
  window.addEventListener('offline', updateStatus);
  updateStatus();
}
```

## Conclusione

Le applicazioni web offline rappresentano un'importante passo avanti nell'evoluzione del web, avvicinando l'esperienza utente a quella delle applicazioni native. Grazie a tecnologie come Service Workers, Cache API, Web App Manifest e IndexedDB, è possibile creare applicazioni web che funzionano anche in assenza di connessione internet, offrendo un'esperienza utente fluida e continua.

---

### Navigazione
- [📑 Indice](<../README.md>)
- [⬅️ Web Storage](<02_Web_Storage.md>)
- [➡️ Progressive Web Apps](<04_Progressive_Web_Apps.md>)