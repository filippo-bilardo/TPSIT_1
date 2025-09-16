# Esercitazione 4: Multimedia e API HTML5

## Obiettivi
In questa esercitazione imparerai a:
- Incorporare elementi multimediali (audio e video) in una pagina web
- Utilizzare le API HTML5 per creare applicazioni web interattive
- Implementare funzionalità di geolocalizzazione
- Utilizzare l'API Canvas per disegnare grafici e animazioni
- Implementare il drag and drop nativo di HTML5

## Prerequisiti
- Conoscenza base di HTML5 (completamento delle Esercitazioni 1, 2 e 3)
- Conoscenza base di CSS
- Conoscenza base di JavaScript
- Un editor di testo (VS Code, Sublime Text, Notepad++, ecc.)
- Un browser web moderno (Chrome, Firefox, Edge, ecc.)

## Esercizio 1: Incorporare elementi multimediali

### Istruzioni
1. Crea un nuovo file chiamato `index.html`
2. Inserisci la struttura base di una pagina HTML5
3. Crea una sezione per incorporare un video con controlli personalizzati
4. Crea una sezione per incorporare un audio player con controlli personalizzati

### Esempio di codice
```html
<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Multimedia HTML5</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <header>
        <h1>Multimedia e API HTML5</h1>
    </header>
    
    <main>
        <section id="video-section">
            <h2>Video Player HTML5</h2>
            <div class="video-container">
                <video id="myVideo" width="640" height="360" poster="poster.jpg">
                    <source src="video.mp4" type="video/mp4">
                    <source src="video.webm" type="video/webm">
                    Il tuo browser non supporta il tag video.
                </video>
                
                <div class="custom-controls">
                    <button id="playPauseBtn" class="control-btn">Play</button>
                    <input type="range" id="progressBar" min="0" value="0" step="0.1">
                    <button id="muteBtn" class="control-btn">Mute</button>
                    <input type="range" id="volumeBar" min="0" max="1" step="0.1" value="1">
                    <button id="fullscreenBtn" class="control-btn">Fullscreen</button>
                </div>
            </div>
        </section>
        
        <section id="audio-section">
            <h2>Audio Player HTML5</h2>
            <div class="audio-container">
                <audio id="myAudio">
                    <source src="audio.mp3" type="audio/mpeg">
                    <source src="audio.ogg" type="audio/ogg">
                    Il tuo browser non supporta il tag audio.
                </audio>
                
                <div class="custom-controls">
                    <button id="audioPlayPauseBtn" class="control-btn">Play</button>
                    <input type="range" id="audioProgressBar" min="0" value="0" step="0.1">
                    <button id="audioMuteBtn" class="control-btn">Mute</button>
                    <input type="range" id="audioVolumeBar" min="0" max="1" step="0.1" value="1">
                </div>
            </div>
        </section>
    </main>
    
    <footer>
        <p>&copy; 2023 Multimedia HTML5. Tutti i diritti riservati.</p>
    </footer>
    
    <script src="media-controls.js"></script>
</body>
</html>
```

### JavaScript per i controlli personalizzati
```javascript
// Crea un file chiamato media-controls.js
document.addEventListener('DOMContentLoaded', function() {
    // Video controls
    const video = document.getElementById('myVideo');
    const playPauseBtn = document.getElementById('playPauseBtn');
    const progressBar = document.getElementById('progressBar');
    const muteBtn = document.getElementById('muteBtn');
    const volumeBar = document.getElementById('volumeBar');
    const fullscreenBtn = document.getElementById('fullscreenBtn');
    
    // Set max value for progress bar
    video.addEventListener('loadedmetadata', function() {
        progressBar.max = video.duration;
    });
    
    // Play/Pause
    playPauseBtn.addEventListener('click', function() {
        if (video.paused) {
            video.play();
            playPauseBtn.textContent = 'Pause';
        } else {
            video.pause();
            playPauseBtn.textContent = 'Play';
        }
    });
    
    // Update progress bar
    video.addEventListener('timeupdate', function() {
        progressBar.value = video.currentTime;
    });
    
    // Seek video
    progressBar.addEventListener('input', function() {
        video.currentTime = progressBar.value;
    });
    
    // Mute/Unmute
    muteBtn.addEventListener('click', function() {
        video.muted = !video.muted;
        muteBtn.textContent = video.muted ? 'Unmute' : 'Mute';
        volumeBar.value = video.muted ? 0 : video.volume;
    });
    
    // Volume control
    volumeBar.addEventListener('input', function() {
        video.volume = volumeBar.value;
        video.muted = (volumeBar.value === 0);
        muteBtn.textContent = (volumeBar.value === 0) ? 'Unmute' : 'Mute';
    });
    
    // Fullscreen
    fullscreenBtn.addEventListener('click', function() {
        if (video.requestFullscreen) {
            video.requestFullscreen();
        } else if (video.webkitRequestFullscreen) { /* Safari */
            video.webkitRequestFullscreen();
        } else if (video.msRequestFullscreen) { /* IE11 */
            video.msRequestFullscreen();
        }
    });
    
    // Audio controls
    const audio = document.getElementById('myAudio');
    const audioPlayPauseBtn = document.getElementById('audioPlayPauseBtn');
    const audioProgressBar = document.getElementById('audioProgressBar');
    const audioMuteBtn = document.getElementById('audioMuteBtn');
    const audioVolumeBar = document.getElementById('audioVolumeBar');
    
    // Set max value for audio progress bar
    audio.addEventListener('loadedmetadata', function() {
        audioProgressBar.max = audio.duration;
    });
    
    // Play/Pause audio
    audioPlayPauseBtn.addEventListener('click', function() {
        if (audio.paused) {
            audio.play();
            audioPlayPauseBtn.textContent = 'Pause';
        } else {
            audio.pause();
            audioPlayPauseBtn.textContent = 'Play';
        }
    });
    
    // Update audio progress bar
    audio.addEventListener('timeupdate', function() {
        audioProgressBar.value = audio.currentTime;
    });
    
    // Seek audio
    audioProgressBar.addEventListener('input', function() {
        audio.currentTime = audioProgressBar.value;
    });
    
    // Mute/Unmute audio
    audioMuteBtn.addEventListener('click', function() {
        audio.muted = !audio.muted;
        audioMuteBtn.textContent = audio.muted ? 'Unmute' : 'Mute';
        audioVolumeBar.value = audio.muted ? 0 : audio.volume;
    });
    
    // Audio volume control
    audioVolumeBar.addEventListener('input', function() {
        audio.volume = audioVolumeBar.value;
        audio.muted = (audioVolumeBar.value === 0);
        audioMuteBtn.textContent = (audioVolumeBar.value === 0) ? 'Unmute' : 'Mute';
    });
});
```

## Esercizio 2: Geolocalizzazione

### Istruzioni
1. Crea un nuovo file chiamato `geolocation.html`
2. Utilizza l'API di geolocalizzazione di HTML5 per ottenere la posizione dell'utente
3. Visualizza la posizione su una mappa utilizzando un servizio come Google Maps o Leaflet

### Esempio di codice
```html
<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Geolocalizzazione HTML5</title>
    <link rel="stylesheet" href="https://unpkg.com/leaflet@1.7.1/dist/leaflet.css" />
    <style>
        #map {
            height: 400px;
            width: 100%;
            margin-top: 20px;
            border-radius: 8px;
        }
        .location-info {
            margin: 20px 0;
            padding: 15px;
            background-color: #f5f5f5;
            border-radius: 8px;
        }
        button {
            padding: 10px 15px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        button:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <header>
        <h1>Geolocalizzazione HTML5</h1>
    </header>
    
    <main>
        <section>
            <h2>La tua posizione attuale</h2>
            <button id="getLocationBtn">Ottieni posizione</button>
            
            <div class="location-info" id="locationInfo">
                <p>Clicca sul pulsante per ottenere la tua posizione.</p>
            </div>
            
            <div id="map"></div>
        </section>
    </main>
    
    <footer>
        <p>&copy; 2023 Geolocalizzazione HTML5. Tutti i diritti riservati.</p>
    </footer>
    
    <script src="https://unpkg.com/leaflet@1.7.1/dist/leaflet.js"></script>
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            const getLocationBtn = document.getElementById('getLocationBtn');
            const locationInfo = document.getElementById('locationInfo');
            let map = null;
            
            getLocationBtn.addEventListener('click', function() {
                if (navigator.geolocation) {
                    locationInfo.innerHTML = '<p>Ottenimento della posizione in corso...</p>';
                    
                    navigator.geolocation.getCurrentPosition(showPosition, showError, {
                        enableHighAccuracy: true,
                        timeout: 5000,
                        maximumAge: 0
                    });
                } else {
                    locationInfo.innerHTML = '<p>La geolocalizzazione non è supportata dal tuo browser.</p>';
                }
            });
            
            function showPosition(position) {
                const latitude = position.coords.latitude;
                const longitude = position.coords.longitude;
                const accuracy = position.coords.accuracy;
                
                locationInfo.innerHTML = `
                    <p><strong>Latitudine:</strong> ${latitude}</p>
                    <p><strong>Longitudine:</strong> ${longitude}</p>
                    <p><strong>Precisione:</strong> ${accuracy} metri</p>
                `;
                
                // Initialize map if not already initialized
                if (!map) {
                    map = L.map('map').setView([latitude, longitude], 13);
                    
                    L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
                        attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors'
                    }).addTo(map);
                } else {
                    map.setView([latitude, longitude], 13);
                }
                
                // Add marker
                L.marker([latitude, longitude]).addTo(map)
                    .bindPopup('La tua posizione attuale').openPopup();
                
                // Add accuracy circle
                L.circle([latitude, longitude], {
                    radius: accuracy,
                    color: '#4CAF50',
                    fillColor: '#4CAF50',
                    fillOpacity: 0.2
                }).addTo(map);
            }
            
            function showError(error) {
                switch(error.code) {
                    case error.PERMISSION_DENIED:
                        locationInfo.innerHTML = '<p>L\'utente ha negato la richiesta di geolocalizzazione.</p>';
                        break;
                    case error.POSITION_UNAVAILABLE:
                        locationInfo.innerHTML = '<p>Le informazioni sulla posizione non sono disponibili.</p>';
                        break;
                    case error.TIMEOUT:
                        locationInfo.innerHTML = '<p>La richiesta di geolocalizzazione è scaduta.</p>';
                        break;
                    case error.UNKNOWN_ERROR:
                        locationInfo.innerHTML = '<p>Si è verificato un errore sconosciuto.</p>';
                        break;
                }
            }
        });
    </script>
</body>
</html>
```

## Esercizio 3: Canvas API

### Istruzioni
1. Crea un nuovo file chiamato `canvas.html`
2. Utilizza l'API Canvas di HTML5 per creare un'area di disegno interattiva
3. Implementa funzionalità come disegno a mano libera, forme geometriche e colori

### Esempio di codice
```html
<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Canvas HTML5</title>
    <style>
        #canvas {
            border: 1px solid #000;
            display: block;
            margin: 20px auto;
            background-color: #fff;
            cursor: crosshair;
        }
        .controls {
            display: flex;
            justify-content: center;
            gap: 10px;
            margin-bottom: 20px;
            flex-wrap: wrap;
        }
        .color-picker {
            display: flex;
            align-items: center;
            gap: 5px;
        }
        button {
            padding: 8px 12px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        button:hover {
            background-color: #45a049;
        }
        .tool-active {
            background-color: #2E7D32;
            box-shadow: 0 0 5px rgba(0, 0, 0, 0.3);
        }
    </style>
</head>
<body>
    <header>
        <h1>Canvas HTML5</h1>
    </header>
    
    <main>
        <section>
            <h2>Area di disegno</h2>
            
            <div class="controls">
                <div class="tools">
                    <button id="pencilBtn" class="tool-active">Matita</button>
                    <button id="lineBtn">Linea</button>
                    <button id="rectBtn">Rettangolo</button>
                    <button id="circleBtn">Cerchio</button>
                    <button id="eraserBtn">Gomma</button>
                </div>
                
                <div class="color-picker">
                    <label for="colorPicker">Colore:</label>
                    <input type="color" id="colorPicker" value="#000000">
                </div>
                
                <div class="line-width">
                    <label for="lineWidth">Spessore:</label>
                    <input type="range" id="lineWidth" min="1" max="50" value="5">
                </div>
                
                <button id="clearBtn">Cancella tutto</button>
                <button id="saveBtn">Salva immagine</button>
            </div>
            
            <canvas id="canvas" width="800" height="500"></canvas>
        </section>
    </main>
    
    <footer>
        <p>&copy; 2023 Canvas HTML5. Tutti i diritti riservati.</p>
    </footer>
    
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            const canvas = document.getElementById('canvas');
            const ctx = canvas.getContext('2d');
            const pencilBtn = document.getElementById('pencilBtn');
            const lineBtn = document.getElementById('lineBtn');
            const rectBtn = document.getElementById('rectBtn');
            const circleBtn = document.getElementById('circleBtn');
            const eraserBtn = document.getElementById('eraserBtn');
            const colorPicker = document.getElementById('colorPicker');
            const lineWidthInput = document.getElementById('lineWidth');
            const clearBtn = document.getElementById('clearBtn');
            const saveBtn = document.getElementById('saveBtn');
            
            let isDrawing = false;
            let lastX = 0;
            let lastY = 0;
            let currentTool = 'pencil';
            let startX, startY;
            
            // Set initial drawing style
            ctx.strokeStyle = colorPicker.value;
            ctx.lineJoin = 'round';
            ctx.lineCap = 'round';
            ctx.lineWidth = lineWidthInput.value;
            
            // Tool selection
            const tools = [pencilBtn, lineBtn, rectBtn, circleBtn, eraserBtn];
            
            function setActiveTool(tool) {
                tools.forEach(t => t.classList.remove('tool-active'));
                tool.classList.add('tool-active');
            }
            
            pencilBtn.addEventListener('click', () => {
                currentTool = 'pencil';
                setActiveTool(pencilBtn);
            });
            
            lineBtn.addEventListener('click', () => {
                currentTool = 'line';
                setActiveTool(lineBtn);
            });
            
            rectBtn.addEventListener('click', () => {
                currentTool = 'rect';
                setActiveTool(rectBtn);
            });
            
            circleBtn.addEventListener('click', () => {
                currentTool = 'circle';
                setActiveTool(circleBtn);
            });
            
            eraserBtn.addEventListener('click', () => {
                currentTool = 'eraser';
                setActiveTool(eraserBtn);
            });
            
            // Color and line width change
            colorPicker.addEventListener('change', () => {
                ctx.strokeStyle = colorPicker.value;
                ctx.fillStyle = colorPicker.value;
            });
            
            lineWidthInput.addEventListener('input', () => {
                ctx.lineWidth = lineWidthInput.value;
            });
            
            // Clear canvas
            clearBtn.addEventListener('click', () => {
                ctx.clearRect(0, 0, canvas.width, canvas.height);
            });
            
            // Save image
            saveBtn.addEventListener('click', () => {
                const image = canvas.toDataURL('image/png');
                const link = document.createElement('a');
                link.href = image;
                link.download = 'canvas-drawing.png';
                link.click();
            });
            
            // Drawing functions
            function startDrawing(e) {
                isDrawing = true;
                [lastX, lastY] = [e.offsetX, e.offsetY];
                [startX, startY] = [e.offsetX, e.offsetY];
                
                // For pencil and eraser, start a new path immediately
                if (currentTool === 'pencil' || currentTool === 'eraser') {
                    ctx.beginPath();
                    ctx.moveTo(lastX, lastY);
                    ctx.lineTo(e.offsetX, e.offsetY);
                    ctx.stroke();
                }
            }
            
            function draw(e) {
                if (!isDrawing) return;
                
                if (currentTool === 'pencil') {
                    ctx.strokeStyle = colorPicker.value;
                    ctx.beginPath();
                    ctx.moveTo(lastX, lastY);
                    ctx.lineTo(e.offsetX, e.offsetY);
                    ctx.stroke();
                    [lastX, lastY] = [e.offsetX, e.offsetY];
                } else if (currentTool === 'eraser') {
                    ctx.strokeStyle = '#FFFFFF';
                    ctx.beginPath();
                    ctx.moveTo(lastX, lastY);
                    ctx.lineTo(e.offsetX, e.offsetY);
                    ctx.stroke();
                    [lastX, lastY] = [e.offsetX, e.offsetY];
                }
            }
            
            function stopDrawing(e) {
                if (!isDrawing) return;
                
                if (currentTool === 'line') {
                    ctx.beginPath();
                    ctx.moveTo(startX, startY);
                    ctx.lineTo(e.offsetX, e.offsetY);
                    ctx.stroke();
                } else if (currentTool === 'rect') {
                    const width = e.offsetX - startX;
                    const height = e.offsetY - startY;
                    ctx.strokeRect(startX, startY, width, height);
                } else if (currentTool === 'circle') {
                    const radius = Math.sqrt(
                        Math.pow(e.offsetX - startX, 2) + Math.pow(e.offsetY - startY, 2)
                    );
                    ctx.beginPath();
                    ctx.arc(startX, startY, radius, 0, Math.PI * 2);
                    ctx.stroke();
                }
                
                isDrawing = false;
            }
            
            // Event listeners
            canvas.addEventListener('mousedown', startDrawing);
            canvas.addEventListener('mousemove', draw);
            canvas.addEventListener('mouseup', stopDrawing);
            canvas.addEventListener('mouseout', stopDrawing);
            
            // Touch support
            canvas.addEventListener('touchstart', function(e) {
                e.preventDefault();
                const touch = e.touches[0];
                const mouseEvent = new MouseEvent('mousedown', {
                    clientX: touch.clientX,
                    clientY: touch.clientY
                });
                canvas.dispatchEvent(mouseEvent);
            }, { passive: false });
            
            canvas.addEventListener('touchmove', function(e) {
                e.preventDefault();
                const touch = e.touches[0];
                const mouseEvent = new MouseEvent('mousemove', {
                    clientX: touch.clientX,
                    clientY: touch.clientY
                });
                canvas.dispatchEvent(mouseEvent);
            }, { passive: false });
            
            canvas.addEventListener('touchend', function(e) {
                const mouseEvent = new MouseEvent('mouseup', {});
                canvas.dispatchEvent(mouseEvent);
            }, { passive: false });
        });
    </script>
</body>
</html>
```

## Esercizio 4: Drag and Drop

### Istruzioni
1. Crea un nuovo file chiamato `drag-drop.html`
2. Implementa funzionalità di drag and drop utilizzando l'API nativa di HTML5
3. Crea un'interfaccia che permetta di trascinare elementi da una lista a un'altra

### Esempio di codice
```html
<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Drag and Drop HTML5</title>
    <style>
        .container {
            display: flex;
            justify-content: space-between;
            margin: 20px 0;
            gap: 20px;
        }
        
        .drop-zone {
            width: 48%;
            min-height: 300px;
            border: 2px dashed #ccc;
            border-radius: 8px;
            padding: 10px;
            background-color: #f9f9f9;
        }
        
        .drop-zone h3 {
            text-align: center;
            color: #555;
            margin-top: 0;
        }
        
        .draggable {
            padding: 10px;
            margin: 10px 0;
            background-color: #4CAF50;
            color: white;
            border-radius: 4px;
            cursor: move;
            transition: all 0.3s;
        }
        
        .draggable:hover {
            background-color: #45a049;
            transform: scale(1.02);
        }
        
        .dragging {
            opacity: 0.5;
        }
        
        .drop-zone.highlight {
            background-color: #e8f5e9;
            border-color: #4CAF50;
        }
        
        .reset-btn {
            display: block;
            margin: 20px auto;
            padding: 10px 20px;
            background-color: #f44336;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        
        .reset-btn:hover {
            background-color: #d32f2f;
        }
    </style>
</head>
<body>
    <header>
        <h1>Drag and Drop HTML5</h1>
    </header>
    
    <main>
        <section>
            <h2>Gestione delle attività</h2>
            <p>Trascina le attività da "Da fare" a "Completate" quando le hai terminate.</p>
            
            <div class="container">
                <div class="drop-zone" id="todo">
                    <h3>Da fare</h3>
                    <div class="draggable" draggable="true">Studiare HTML5</div>
                    <div class="draggable" draggable="true">Imparare CSS3</div>
                    <div class="draggable" draggable="true">Praticare JavaScript</div>
                    <div class="draggable" draggable="true">Creare un progetto web</div>
                    <div class="draggable" draggable="true">Testare su diversi browser</div>
                </div>
                
                <div class="drop-zone" id="completed">
                    <h3>Completate</h3>
                </div>
            </div>
            
            <button class="reset-btn" id="resetBtn">Reimposta attività</button>
        </section>
    </main>
    
    <footer>
        <p>&copy; 2023 Drag and Drop HTML5. Tutti i diritti riservati.</p>
    </footer>
    
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            const draggables = document.querySelectorAll('.draggable');
            const dropZones = document.querySelectorAll('.drop-zone');
            const resetBtn = document.getElementById('resetBtn');
            const todoZone = document.getElementById('todo');
            
            // Save initial state
            const initialState = todoZone.innerHTML;
            
            // Add event listeners to draggable items
            draggables.forEach(draggable => {
                draggable.addEventListener('dragstart', () => {
                    draggable.classList.add('dragging');
                });
                
                draggable.addEventListener('dragend', () => {
                    draggable.classList.remove('dragging');
                });
            });
            
            // Add event listeners to drop zones
            dropZones.forEach(zone => {
                zone.addEventListener('dragover', e => {
                    e.preventDefault();
                    zone.classList.add('highlight');
                    const dragging = document.querySelector('.dragging');
                    const afterElement = getDragAfterElement(zone, e.clientY);
                    
                    if (afterElement == null) {
                        zone.appendChild(dragging);
                    } else {
                        zone.insertBefore(dragging, afterElement);
                    }
                });
                
                zone.addEventListener('dragleave', () => {
                    zone.classList.remove('highlight');
                });
                
                zone.addEventListener('drop', () => {
                    zone.classList.remove('highlight');
                });
            });
            
            // Reset button
            resetBtn.addEventListener('click', () => {
                todoZone.innerHTML = initialState;
                document.getElementById('completed').innerHTML = '<h3>Completate</h3>';
                
                // Re-add event listeners to new draggable elements