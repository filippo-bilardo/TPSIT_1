# Audio e Video in HTML5

## Introduzione agli elementi multimediali

HTML5 ha rivoluzionato la gestione dei contenuti multimediali sul web, introducendo elementi nativi per l'incorporamento di audio e video senza la necessità di plugin di terze parti come Flash. Questa innovazione ha reso più semplice, efficiente e accessibile l'integrazione di contenuti multimediali nelle pagine web.

Prima di HTML5, l'incorporamento di contenuti audio e video richiedeva l'utilizzo di tecnologie esterne come Flash, QuickTime o Windows Media Player, che presentavano diversi svantaggi:
- Necessità di installare plugin
- Problemi di compatibilità tra browser
- Vulnerabilità di sicurezza
- Scarso supporto su dispositivi mobili

Con l'introduzione degli elementi `<audio>` e `<video>` in HTML5, questi problemi sono stati in gran parte risolti, offrendo un'alternativa standardizzata e nativa per tutti i browser moderni.

## L'elemento Audio

L'elemento `<audio>` permette di incorporare contenuti audio direttamente nelle pagine web. La sua sintassi base è semplice e intuitiva:

```html
<audio src="file-audio.mp3" controls></audio>
```

È possibile specificare più sorgenti per garantire la compatibilità con diversi browser, poiché non tutti supportano gli stessi formati audio:

```html
<audio controls>
  <source src="file-audio.mp3" type="audio/mpeg">
  <source src="file-audio.ogg" type="audio/ogg">
  <p>Il tuo browser non supporta l'elemento audio HTML5. <a href="file-audio.mp3">Scarica il file audio</a>.</p>
</audio>
```

Gli attributi principali dell'elemento `<audio>` includono:

- `controls`: mostra i controlli di riproduzione (play, pausa, volume)
- `autoplay`: avvia automaticamente la riproduzione quando la pagina viene caricata
- `loop`: riproduce l'audio in loop
- `muted`: imposta l'audio inizialmente disattivato
- `preload`: suggerisce al browser come precaricare l'audio (auto, metadata, none)

```html
<audio controls autoplay muted preload="metadata">
  <source src="background-music.mp3" type="audio/mpeg">
  <source src="background-music.ogg" type="audio/ogg">
</audio>
```

I formati audio più comuni supportati dai browser moderni sono:

- **MP3** (MPEG Audio Layer III): supportato da tutti i browser moderni
- **OGG Vorbis**: supportato da Chrome, Firefox e Opera
- **WAV** (Waveform Audio Format): supportato da Chrome, Firefox, Safari e Opera
- **AAC** (Advanced Audio Coding): supportato principalmente da Safari

## L'elemento Video

L'elemento `<video>` funziona in modo simile all'elemento `<audio>`, ma con alcune opzioni aggiuntive specifiche per i contenuti video. La sintassi base è:

```html
<video src="file-video.mp4" controls width="640" height="360"></video>
```

Anche per i video è consigliabile specificare più sorgenti per garantire la compatibilità con diversi browser:

```html
<video controls width="640" height="360">
  <source src="file-video.mp4" type="video/mp4">
  <source src="file-video.webm" type="video/webm">
  <p>Il tuo browser non supporta l'elemento video HTML5. <a href="file-video.mp4">Scarica il file video</a>.</p>
</video>
```

Oltre agli attributi comuni con l'elemento `<audio>` (`controls`, `autoplay`, `loop`, `muted`, `preload`), l'elemento `<video>` supporta attributi specifici:

- `width` e `height`: dimensioni del player video
- `poster`: URL dell'immagine da mostrare prima che il video venga riprodotto
- `playsinline`: permette la riproduzione inline su iOS (invece che a schermo intero)

```html
<video controls width="640" height="360" poster="anteprima.jpg" playsinline>
  <source src="presentazione.mp4" type="video/mp4">
  <source src="presentazione.webm" type="video/webm">
  <track kind="subtitles" src="sottotitoli-it.vtt" srclang="it" label="Italiano">
  <track kind="subtitles" src="sottotitoli-en.vtt" srclang="en" label="English">
</video>
```

I formati video più comuni supportati dai browser moderni sono:

- **MP4** (H.264): supportato da tutti i browser moderni
- **WebM** (VP8/VP9): supportato da Chrome, Firefox e Opera
- **Ogg Theora**: supportato principalmente da Firefox e Opera

## Tracce e sottotitoli

L'elemento `<track>` permette di aggiungere sottotitoli, didascalie, descrizioni audio e altri metadati temporizzati ai contenuti video. Questo elemento utilizza il formato WebVTT (Web Video Text Tracks) per definire i sottotitoli:

```html
<video controls>
  <source src="video.mp4" type="video/mp4">
  <track kind="subtitles" src="sottotitoli-it.vtt" srclang="it" label="Italiano" default>
  <track kind="subtitles" src="sottotitoli-en.vtt" srclang="en" label="English">
  <track kind="descriptions" src="descrizioni.vtt" srclang="it" label="Descrizioni audio">
</video>
```

L'attributo `kind` può assumere diversi valori:
- `subtitles`: sottotitoli, generalmente traduzioni del dialogo
- `captions`: didascalie, includono anche descrizioni di suoni non verbali
- `descriptions`: descrizioni audio per non vedenti
- `chapters`: titoli di capitoli per la navigazione
- `metadata`: metadati non visibili all'utente

Esempio di file WebVTT (sottotitoli-it.vtt):

```
WEBVTT

00:00:01.000 --> 00:00:04.000
Benvenuti al nostro video tutorial su HTML5!

00:00:05.000 --> 00:00:09.000
Oggi parleremo degli elementi audio e video.
```

## Controllo tramite JavaScript

Gli elementi `<audio>` e `<video>` possono essere controllati programmaticamente tramite JavaScript, offrendo maggiore flessibilità nella creazione di player personalizzati:

```html
<video id="myVideo" src="video.mp4"></video>
<button onclick="document.getElementById('myVideo').play()">Play</button>
<button onclick="document.getElementById('myVideo').pause()">Pause</button>
<button onclick="document.getElementById('myVideo').currentTime += 10">Avanti 10s</button>
<button onclick="document.getElementById('myVideo').volume += 0.1">Volume +</button>
```

Esempio più completo di player personalizzato:

```html
<div class="custom-player">
  <video id="myVideo" src="video.mp4"></video>
  <div class="controls">
    <button id="playBtn">Play</button>
    <input type="range" id="progress" min="0" value="0" step="0.1">
    <button id="muteBtn">Mute</button>
    <input type="range" id="volume" min="0" max="1" step="0.1" value="1">
  </div>
</div>

<script>
  const video = document.getElementById('myVideo');
  const playBtn = document.getElementById('playBtn');
  const progress = document.getElementById('progress');
  const muteBtn = document.getElementById('muteBtn');
  const volume = document.getElementById('volume');
  
  // Aggiorna la durata massima quando i metadati sono caricati
  video.addEventListener('loadedmetadata', function() {
    progress.max = video.duration;
  });
  
  // Aggiorna la progress bar durante la riproduzione
  video.addEventListener('timeupdate', function() {
    progress.value = video.currentTime;
  });
  
  // Toggle play/pause
  playBtn.addEventListener('click', function() {
    if (video.paused) {
      video.play();
      playBtn.textContent = 'Pause';
    } else {
      video.pause();
      playBtn.textContent = 'Play';
    }
  });
  
  // Permette di cercare nel video
  progress.addEventListener('input', function() {
    video.currentTime = progress.value;
  });
  
  // Toggle mute
  muteBtn.addEventListener('click', function() {
    video.muted = !video.muted;
    muteBtn.textContent = video.muted ? 'Unmute' : 'Mute';
  });
  
  // Controllo volume
  volume.addEventListener('input', function() {
    video.volume = volume.value;
  });
</script>
```

## Responsive video

Per rendere i video responsive, adattandoli alle dimensioni del contenitore e mantenendo il corretto rapporto d'aspetto, è possibile utilizzare tecniche CSS:

```html
<div class="video-container">
  <video controls>
    <source src="video.mp4" type="video/mp4">
  </video>
</div>

<style>
  .video-container {
    position: relative;
    width: 100%;
    padding-bottom: 56.25%; /* Rapporto 16:9 */
    height: 0;
    overflow: hidden;
  }
  
  .video-container video {
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
  }
</style>
```

Un'alternativa più moderna utilizza l'attributo `aspect-ratio` di CSS:

```css
.video-container {
  width: 100%;
  max-width: 800px; /* Larghezza massima */
}

.video-container video {
  width: 100%;
  aspect-ratio: 16 / 9;
  object-fit: cover;
}
```

## Best practice e considerazioni

Quando si incorporano elementi multimediali nelle pagine web, è importante seguire alcune best practice:

1. **Accessibilità**: fornire sempre alternative testuali e sottotitoli per i contenuti audio e video.

2. **Performance**: ottimizzare i file multimediali per il web, utilizzando formati e codec efficienti.

3. **Autoplay responsabile**: evitare l'autoplay con audio, che può risultare fastidioso per gli utenti. Se necessario, utilizzare `autoplay muted`.

4. **Precaricamento**: utilizzare l'attributo `preload="metadata"` per caricare solo le informazioni essenziali inizialmente.

5. **Fallback**: fornire sempre alternative per browser che non supportano HTML5.

6. **Responsive design**: assicurarsi che i contenuti multimediali si adattino a diverse dimensioni dello schermo.

7. **Hosting**: considerare servizi di streaming dedicati per video di grandi dimensioni o con molte visualizzazioni.

```html
<!-- Esempio di implementazione ottimale -->
<figure class="video-figure">
  <div class="video-container">
    <video controls preload="metadata" poster="thumbnail.jpg">
      <source src="video-small.mp4" type="video/mp4" media="(max-width: 767px)">
      <source src="video.mp4" type="video/mp4">
      <source src="video.webm" type="video/webm">
      <track kind="subtitles" src="captions-it.vtt" srclang="it" label="Italiano" default>
      <track kind="subtitles" src="captions-en.vtt" srclang="en" label="English">
      <p>Il tuo browser non supporta i video HTML5. <a href="video.mp4">Scarica il video</a>.</p>
    </video>
  </div>
  <figcaption>Figura 1: Dimostrazione degli elementi multimediali in HTML5</figcaption>
</figure>
```

L'introduzione degli elementi multimediali nativi in HTML5 ha rappresentato un importante passo avanti per il web, rendendo più accessibile e standardizzata l'incorporazione di contenuti audio e video. Sfruttando appieno le potenzialità di questi elementi, è possibile creare esperienze multimediali ricche e coinvolgenti, mantenendo al contempo l'accessibilità e le performance del sito.

---

### Navigazione
- [📑 Indice](<../README.md>)
- [⬅️ Form HTML](<01_Form_HTML.md>)
- [➡️ API HTML5](<../6. API e Funzionalità Avanzate/01_API_HTML5.md>)