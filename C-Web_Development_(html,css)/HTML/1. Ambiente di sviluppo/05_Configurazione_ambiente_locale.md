# Configurazione dell'ambiente locale

## Introduzione
La configurazione di un ambiente di sviluppo locale efficiente è un passo fondamentale per qualsiasi sviluppatore web. Un ambiente ben configurato aumenta la produttività, facilita il testing e permette di lavorare anche offline.

## Requisiti di base

### Hardware
- **Processore**: Qualsiasi CPU moderna è sufficiente per lo sviluppo web di base.
- **RAM**: Minimo 4GB, consigliati 8GB o più per progetti complessi o per l'utilizzo di macchine virtuali.
- **Spazio di archiviazione**: SSD consigliato per prestazioni migliori, con almeno 20GB di spazio libero.

### Software essenziale
- **Sistema operativo**: Windows, macOS o Linux (tutte le principali distribuzioni sono supportate).
- **Browser web**: Installare i principali browser (Chrome, Firefox, Safari, Edge) per il testing cross-browser.
- **Editor di codice o IDE**: Come discusso nel documento [Editor HTML e IDE](01.01_Editor_HTML_e_IDE.md).

## Installazione degli strumenti di sviluppo

### Editor di codice
1. **Visual Studio Code**:
   - Scaricare da [code.visualstudio.com](https://code.visualstudio.com/)
   - Installare le estensioni consigliate per HTML/CSS:
     - HTML CSS Support
     - HTML Snippets
     - Live Server
     - Prettier - Code formatter
     - ESLint

2. **Sublime Text**:
   - Scaricare da [sublimetext.com](https://www.sublimetext.com/)
   - Installare Package Control
   - Aggiungere pacchetti utili come Emmet, HTML5, CSS3, etc.

### Controllo versione
1. **Git**:
   - Windows: Scaricare da [git-scm.com](https://git-scm.com/)
   - macOS: Installare tramite Homebrew (`brew install git`) o Xcode Command Line Tools
   - Linux: Utilizzare il gestore pacchetti della distribuzione (es. `apt install git`)

2. **Client Git grafici** (opzionali):
   - GitHub Desktop
   - GitKraken
   - SourceTree

### Node.js e npm
1. **Installazione di Node.js**:
   - Scaricare da [nodejs.org](https://nodejs.org/)
   - Verificare l'installazione con `node -v` e `npm -v` nel terminale

2. **Pacchetti globali utili**:
   ```bash
   npm install -g live-server
   npm install -g http-server
   npm install -g browser-sync
   ```

## Configurazione dell'ambiente di sviluppo

### Configurazione di Visual Studio Code
1. **Impostazioni generali**:
   - Abilitare l'auto-save: File > Preferences > Settings > Auto Save
   - Configurare l'indentazione: Spaces o Tabs secondo le preferenze

2. **Configurazione per HTML/CSS**:
   - Impostare la formattazione automatica al salvataggio
   - Configurare regole di linting personalizzate

### Configurazione di Git
```bash
# Configurazione dell'identità
git config --global user.name "Il tuo nome"
git config --global user.email "tua.email@esempio.com"

# Configurazione dell'editor predefinito
git config --global core.editor "code --wait"

# Configurazione del merge tool
git config --global merge.tool vscode
```

### Configurazione del terminale
- **Windows**: Considerare l'installazione di Windows Terminal o Git Bash
- **macOS/Linux**: Personalizzare il terminale predefinito con alias e prompt utili

## Strumenti di produttività

### Task runner
- **npm scripts**: Definire script personalizzati nel file `package.json`
- **Gulp**: Per automazione di task più complessi
  ```bash
  npm install -g gulp-cli
  ```

### Preprocessori CSS
- **Sass**:
  ```bash
  npm install -g sass
  ```
- **Less**:
  ```bash
  npm install -g less
  ```

### Strumenti di bundling
- **Webpack** (per progetti più complessi):
  ```bash
  npm install -g webpack webpack-cli
  ```

## Configurazione per progetti specifici

### Progetto HTML/CSS di base
1. Creare la struttura delle directory come descritto in [Gestione dei file e organizzazione del progetto](01.04_Gestione_file_organizzazione_progetto.md)
2. Inizializzare un repository Git:
   ```bash
   git init
   ```
3. Creare un file `.gitignore` di base:
   ```
   node_modules/
   .DS_Store
   .vscode/
   .idea/
   *.log
   ```
4. Configurare un server locale (opzione 1: Live Server in VS Code):
   - Installare l'estensione Live Server
   - Aprire `index.html` e cliccare su "Go Live" nella barra di stato

5. Configurare un server locale (opzione 2: npm package):
   ```bash
   # Inizializzare un progetto npm
   npm init -y
   
   # Installare http-server localmente
   npm install --save-dev http-server
   
   # Aggiungere script al package.json
   # "scripts": {
   #   "start": "http-server -p 8080"
   # }
   
   # Avviare il server
   npm start
   ```

## Ottimizzazione dell'ambiente

### Performance
- Mantenere aggiornati sistema operativo e software
- Chiudere applicazioni non necessarie durante lo sviluppo
- Utilizzare strumenti di caching quando possibile

### Backup e sincronizzazione
- Configurare backup automatici del codice
- Utilizzare servizi cloud (GitHub, GitLab, Bitbucket) per il backup remoto
- Considerare soluzioni di sincronizzazione per lavorare su più dispositivi

## Conclusione
Un ambiente di sviluppo locale ben configurato è la base per un flusso di lavoro efficiente. Investire tempo nella configurazione iniziale ripaga in termini di produttività e riduzione degli errori. Personalizzare l'ambiente in base alle proprie esigenze e al tipo di progetti su cui si lavora è fondamentale per massimizzare l'efficienza.

---

## Risorse aggiuntive
- [VS Code Setup for Web Development](https://www.freecodecamp.org/news/how-to-set-up-vs-code-for-web-development/)
- [Git and GitHub for Beginners](https://www.freecodecamp.org/news/git-and-github-for-beginners/)
- [Modern Web Development Setup](https://www.smashingmagazine.com/2021/06/web-development-setup/)

---

### Navigazione
- [📑 Indice](<../README.md>)
- [⬅️ Gestione dei file e organizzazione del progetto](<04_Gestione_file_organizzazione_progetto.md>)
- [➡️ Utilizzo di server locali per lo sviluppo](<06_Utilizzo_server_locali_sviluppo.md>)