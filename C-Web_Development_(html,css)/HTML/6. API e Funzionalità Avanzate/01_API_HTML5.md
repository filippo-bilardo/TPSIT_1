# API HTML5

## Introduzione alle API HTML5

HTML5 non è solo un linguaggio di markup, ma un ecosistema completo che include numerose API (Application Programming Interfaces) JavaScript che consentono di creare applicazioni web più ricche e interattive. Queste API estendono significativamente le capacità del browser, permettendo agli sviluppatori di implementare funzionalità avanzate che in precedenza richiedevano plugin o tecnologie proprietarie.

Le API HTML5 rappresentano un importante passo avanti nell'evoluzione del web, consentendo lo sviluppo di applicazioni web che possono competere con le applicazioni native in termini di funzionalità e esperienza utente. Queste interfacce di programmazione sono standardizzate dal W3C e implementate nei browser moderni, garantendo compatibilità e interoperabilità.

In questo capitolo esploreremo alcune delle API HTML5 più importanti e utili, con esempi pratici di implementazione.

## API di Storage

Le API di Storage permettono di memorizzare dati sul dispositivo dell'utente, consentendo la persistenza delle informazioni anche dopo la chiusura del browser. Esistono due principali meccanismi di storage:

### localStorage e sessionStorage

Queste API offrono un semplice sistema chiave-valore per memorizzare dati nel browser:

```javascript
// Salvataggio di dati in localStorage (persistenti anche dopo la chiusura del browser)
localStorage.setItem('username', 'mario_rossi');
localStorage.setItem('preferenze', JSON.stringify({tema: 'scuro', notifiche: true}));

// Recupero di dati da localStorage
const username = localStorage.getItem('username');
const preferenze = JSON.parse(localStorage.getItem('preferenze'));

// Rimozione di dati
localStorage.removeItem('username');

// Pulizia completa
localStorage.clear();

// sessionStorage funziona allo stesso modo, ma i dati persistono solo per la durata della sessione
sessionStorage.setItem('temporaryToken', 'abc123');
```

Le principali differenze tra localStorage e sessionStorage sono:
- **localStorage**: i dati persistono anche dopo la chiusura del browser e non hanno una data di scadenza
- **sessionStorage**: i dati persistono solo per la durata della sessione del browser (finché la finestra/tab rimane aperta)

Entrambi hanno un limite di storage di circa 5-10 MB, a seconda del browser.

### IndexedDB

Per applicazioni che necessitano di memorizzare grandi quantità di dati strutturati, IndexedDB offre un database NoSQL completo all'interno del browser:

```javascript
// Apertura del database
const request = indexedDB.open('MyDatabase', 1);

// Gestione della creazione/aggiornamento della struttura
request.onupgradeneeded = function(event) {
  const db = event.target.result;
  
  // Creazione di un object store (simile a una tabella)
  const notesStore = db.createObjectStore('notes', { keyPath: 'id', autoIncrement: true });
  
  // Creazione di indici per ricerche veloci
  notesStore.createIndex('title', 'title', { unique: false });
  notesStore.createIndex('date', 'date', { unique: false });
};

// Gestione degli errori
request.onerror = function(event) {
  console.error('Errore nell\'apertura del database:', event.target.error);
};

// Operazioni sul database una volta aperto
request.onsuccess = function(event) {
  const db = event.target.result;
  
  // Aggiunta di dati
  const transaction = db.transaction(['notes'], 'readwrite');
  const notesStore = transaction.objectStore('notes');
  
  const newNote = {
    title: 'Promemoria',
    content: 'Completare il progetto entro venerdì',
    date: new Date()
  };
  
  const addRequest = notesStore.add(newNote);
  
  addRequest.onsuccess = function() {
    console.log('Nota aggiunta con successo!');
  };
  
  // Lettura di dati
  const getRequest = notesStore.get(1); // Recupera la nota con id 1
  
  getRequest.onsuccess = function() {
    if (getRequest.result) {
      console.log('Nota trovata:', getRequest.result);
    } else {
      console.log('Nota non trovata');
    }
  };
};
```

IndexedDB è più complesso da utilizzare rispetto a localStorage, ma offre maggiore flessibilità e prestazioni per applicazioni che necessitano di gestire grandi quantità di dati strutturati.

## API di Geolocalizzazione

L'API di Geolocalizzazione permette di ottenere la posizione geografica dell'utente, consentendo lo sviluppo di applicazioni basate sulla localizzazione:

```javascript
// Verifica se la geolocalizzazione è supportata
if ('geolocation' in navigator) {
  // Richiesta della posizione corrente
  navigator.geolocation.getCurrentPosition(
    // Callback di successo
    function(position) {
      const latitude = position.coords.latitude;
      const longitude = position.coords.longitude;
      const accuracy = position.coords.accuracy; // precisione in metri
      
      console.log(`Posizione: ${latitude}, ${longitude} (precisione: ${accuracy}m)`);
      
      // Esempio: visualizzazione su una mappa
      displayMap(latitude, longitude);
    },
    // Callback di errore
    function(error) {
      switch(error.code) {
        case error.PERMISSION_DENIED:
          console.error('L\'utente ha negato la richiesta di geolocalizzazione');
          break;
        case error.POSITION_UNAVAILABLE:
          console.error('Informazioni sulla posizione non disponibili');
          break;
        case error.TIMEOUT:
          console.error('Timeout nella richiesta di posizione');
          break;
        case error.UNKNOWN_ERROR:
          console.error('Errore sconosciuto');
          break;
      }
    },
    // Opzioni
    {
      enableHighAccuracy: true, // richiede la massima precisione possibile
      timeout: 5000, // timeout in millisecondi
      maximumAge: 0 // non utilizzare posizioni memorizzate nella cache
    }
  );
  
  // Monitoraggio continuo della posizione
  const watchId = navigator.geolocation.watchPosition(
    function(position) {
      // Aggiorna la posizione quando cambia
      updatePosition(position.coords.latitude, position.coords.longitude);
    }
  );
  
  // Interruzione del monitoraggio
  // navigator.geolocation.clearWatch(watchId);
} else {
  console.error('La geolocalizzazione non è supportata da questo browser');
}
```

L'API di Geolocalizzazione richiede sempre il consenso esplicito dell'utente per motivi di privacy. È importante notare che la precisione può variare significativamente in base al dispositivo e al contesto (GPS, Wi-Fi, triangolazione cellulare).

## API Canvas

L'elemento `<canvas>` e la relativa API JavaScript permettono di disegnare grafica 2D (e con WebGL anche 3D) direttamente nel browser, consentendo la creazione di grafici, animazioni, giochi e visualizzazioni interattive:

```html
<canvas id="myCanvas" width="600" height="400"></canvas>

<script>
  // Recupero del contesto di disegno
  const canvas = document.getElementById('myCanvas');
  const ctx = canvas.getContext('2d');
  
  // Disegno di forme base
  
  // Rettangolo pieno
  ctx.fillStyle = 'blue';
  ctx.fillRect(50, 50, 100, 80); // x, y, larghezza, altezza
  
  // Rettangolo con solo bordo
  ctx.strokeStyle = 'red';
  ctx.lineWidth = 3;
  ctx.strokeRect(200, 50, 100, 80);
  
  // Linea
  ctx.beginPath();
  ctx.moveTo(50, 200); // punto di partenza
  ctx.lineTo(350, 200); // punto di arrivo
  ctx.stroke();
  
  // Cerchio
  ctx.beginPath();
  ctx.arc(200, 300, 50, 0, Math.PI * 2); // x, y, raggio, angolo iniziale, angolo finale
  ctx.fillStyle = 'green';
  ctx.fill();
  
  // Testo
  ctx.font = '24px Arial';
  ctx.fillStyle = 'black';
  ctx.fillText('Hello Canvas!', 400, 100);
  
  // Immagine
  const img = new Image();
  img.onload = function() {
    ctx.drawImage(img, 400, 200, 150, 100); // x, y, larghezza, altezza
  };
  img.src = 'example.jpg';
  
  // Animazione semplice
  let x = 0;
  function animate() {
    // Pulisce il canvas
    ctx.clearRect(0, 0, canvas.width, canvas.height);
    
    // Disegna un cerchio in movimento
    ctx.beginPath();
    ctx.arc(x, 150, 20, 0, Math.PI * 2);
    ctx.fillStyle = 'purple';
    ctx.fill();
    
    // Aggiorna la posizione
    x = (x + 2) % canvas.width;
    
    // Richiama l'animazione
    requestAnimationFrame(animate);
  }
  
  animate();
</script>
```

L'API Canvas è estremamente potente e versatile, consentendo di creare qualsiasi tipo di grafica 2D. Per applicazioni più complesse, è spesso utilizzata insieme a librerie come Chart.js (per grafici) o Pixi.js (per giochi e animazioni).

## API Drag and Drop

L'API Drag and Drop consente di implementare funzionalità di trascinamento degli elementi, migliorando l'interattività delle interfacce utente:

```html
<div id="draggable" draggable="true">Trascinami</div>

<div id="dropzone">Zona di rilascio</div>

<script>
  const draggable = document.getElementById('draggable');
  const dropzone = document.getElementById('dropzone');
  
  // Eventi sull'elemento trascinabile
  draggable.addEventListener('dragstart', function(event) {
    // Imposta i dati da trasferire
    event.dataTransfer.setData('text/plain', event.target.id);
    
    // Imposta l'effetto di trascinamento
    event.dataTransfer.effectAllowed = 'move';
    
    // Cambia l'aspetto dell'elemento durante il trascinamento
    this.style.opacity = '0.4';
  });
  
  draggable.addEventListener('dragend', function() {
    // Ripristina l'aspetto dell'elemento
    this.style.opacity = '1';
  });
  
  // Eventi sulla zona di rilascio
  dropzone.addEventListener('dragover', function(event) {
    // Previene il comportamento predefinito che impedirebbe il drop
    event.preventDefault();
    
    // Specifica l'effetto di drop consentito
    event.dataTransfer.dropEffect = 'move';
    
    // Evidenzia la zona di rilascio
    this.style.background = '#f0f0f0';
  });
  
  dropzone.addEventListener('dragleave', function() {
    // Ripristina l'aspetto della zona di rilascio
    this.style.background = '';
  });
  
  dropzone.addEventListener('drop', function(event) {
    // Previene il comportamento predefinito (come l'apertura di link)
    event.preventDefault();
    
    // Ottiene l'ID dell'elemento trascinato
    const id = event.dataTransfer.getData('text/plain');
    const draggableElement = document.getElementById(id);
    
    // Aggiunge l'elemento alla zona di rilascio
    this.appendChild(draggableElement);
    
    // Ripristina l'aspetto della zona di rilascio
    this.style.background = '';
    
    // Notifica l'utente
    console.log('Elemento rilasciato con successo!');
  });
</script>

<style>
  #draggable {
    width: 150px;
    height: 50px;
    background-color: #4CAF50;
    color: white;
    padding: 10px;
    margin: 10px;
    cursor: move;
    text-align: center;
    line-height: 50px;
  }
  
  #dropzone {
    width: 300px;
    height: 200px;
    border: 2px dashed #ccc;
    margin: 20px;
    padding: 10px;
    text-align: center;
  }
</style>
```

L'API Drag and Drop è particolarmente utile per interfacce che richiedono la riorganizzazione di elementi, come kanban board, editor di layout o interfacce di caricamento file.

## API Web Workers

I Web Workers consentono di eseguire script JavaScript in background, senza bloccare l'interfaccia utente, migliorando le prestazioni delle applicazioni web che necessitano di elaborazioni intensive:

```javascript
// File principale: main.js

// Creazione di un nuovo worker
const worker = new Worker('worker.js');

// Invio di un messaggio al worker
worker.postMessage({
  command: 'calculate',
  data: {
    numbers: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10],
    iterations: 10000000
  }
});

// Ricezione dei risultati dal worker
worker.onmessage = function(event) {
  console.log('Risultati ricevuti dal worker:', event.data);
  // Aggiornamento dell'interfaccia con i risultati
  document.getElementById('result').textContent = event.data.result;
};

// File worker: worker.js
self.addEventListener('message', function(event) {
  const data = event.data;
  
  if (data.command === 'calculate') {
    // Simulazione di un'operazione intensiva
    let result = 0;
    const numbers = data.data.numbers;
    const iterations = data.data.iterations;
    
    for (let i = 0; i < iterations; i++) {
      for (let j = 0; j < numbers.length; j++) {
        result += Math.sqrt(numbers[j]) * Math.random();
      }
    }
    
    // Invio dei risultati al thread principale
    self.postMessage({
      result: result,
      timeElapsed: new Date().getTime()
    });
  }
});


  console.log('Risultato ricevuto dal worker:', event.data);
  // Aggiornamento dell'interfaccia con i risultati
  document.getElementById('result').textContent = event.data.result;
};
```

I Web Workers sono particolarmente utili per:
- Calcoli complessi e intensivi
- Elaborazione di grandi quantità di dati
- Operazioni di crittografia
- Analisi di testo e immagini
- Simulazioni e animazioni complesse

## Conclusione

Le API HTML5 hanno trasformato il web da una semplice piattaforma di documenti a un ambiente ricco e interattivo per applicazioni sofisticate. Queste interfacce di programmazione consentono agli sviluppatori di creare esperienze web che in passato erano possibili solo con applicazioni native, mantenendo al contempo i vantaggi di accessibilità, compatibilità e distribuzione del web.

Dalle API di Storage che permettono la persistenza dei dati, alle API di Geolocalizzazione che abilitano servizi basati sulla posizione, fino ai Web Workers che migliorano le performance delle applicazioni complesse, HTML5 offre un ricco ecosistema di strumenti per lo sviluppo web moderno.

Padroneggiare queste API è essenziale per qualsiasi sviluppatore web che desideri creare applicazioni all'avanguardia. Sebbene in questo capitolo abbiamo esplorato solo alcune delle API più importanti, il panorama è in continua evoluzione, con nuove interfacce che vengono regolarmente standardizzate per rispondere alle esigenze crescenti delle applicazioni web moderne.

---

### Navigazione
- [📑 Indice](<../README.md>)
- [⬅️ Audio e Video in HTML5](<../5. Form e Contenuti Multimediali/02_Audio_Video_HTML5.md>)
- [➡️ Web Storage](<02_Web_Storage.md>)