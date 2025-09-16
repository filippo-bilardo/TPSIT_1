# Sviluppo HTML con Visual Studio Code e GitHub Pages

## Introduzione
Visual Studio Code (VS Code) è uno degli editor di codice più popolari per lo sviluppo web, grazie alla sua leggerezza, estensibilità e potenti funzionalità. Questo documento ti guiderà nell'utilizzo di VS Code per lo sviluppo HTML e nella pubblicazione dei tuoi progetti su GitHub Pages.

## Configurazione di VS Code per lo Sviluppo HTML

### Estensioni Essenziali

1. **Live Server**
   - Nome: `ritwickdey.LiveServer`
   - Funzionalità: Avvia un server di sviluppo locale con ricarica automatica della pagina
   - Utilizzo: Click destro su file HTML -> "Open with Live Server"

2. **HTML CSS Support**
   - Nome: `ecmel.vscode-html-css`
   - Funzionalità: Autocompletamento per HTML e CSS
   - Suggerimenti intelligenti per classi e ID

3. **IntelliSense for CSS**
   - Nome: `Zignd.html-css-class-completion`
   - Funzionalità: Completamento automatico per classi CSS
   - Supporto per framework CSS popolari

4. **Prettier - Code formatter**
   - Nome: `esbenp.prettier-vscode`
   - Funzionalità: Formattazione automatica del codice
   - Configurabile secondo le preferenze del team

5. **Auto Rename Tag**
   - Nome: `formulahendry.auto-rename-tag`
   - Funzionalità: Rinomina automaticamente i tag HTML corrispondenti

6. **HTML Snippets**
   - Nome: `abusaidm.html-snippets`
   - Funzionalità: Snippet predefiniti per HTML5

### Configurazione Consigliata

```json
{
    "editor.formatOnSave": true,
    "editor.defaultFormatter": "esbenp.prettier-vscode",
    "liveServer.settings.donotShowInfoMsg": true,
    "html.format.indentInnerHtml": true
}
```

## Lavorare con GitHub e GitHub Pages

### Configurazione Iniziale

1. **Installazione dell'estensione GitHub**
   - Nome: `GitHub.vscode-pull-request-github`
   - Integrazione diretta con GitHub da VS Code

2. **Autenticazione**
   - Accedi al tuo account GitHub in VS Code
   - Configura le credenziali Git globali

### Workflow per GitHub Pages

1. **Creazione Repository GitHub**
   - Nome formato: `username.github.io` per sito personale
   - Altri progetti: nome repository qualsiasi

2. **Clonare il Repository in VS Code**
   ```bash
   git clone https://github.com/username/repository-name.git
   cd repository-name
   ```

3. **Struttura Base del Progetto**
   ```plaintext
   repository-name/
   ├── index.html
   ├── css/
   │   └── style.css
   ├── js/
   │   └── main.js
   └── README.md
   ```

4. **Commit e Push da VS Code**
   - Utilizza il controllo versione integrato
   - Stage -> Commit -> Push

### Pubblicazione su GitHub Pages

1. **Configurazione Repository**
   - Vai su Settings -> Pages
   - Seleziona branch (main/master)
   - Scegli cartella root o /docs

2. **URL del Sito**
   - Sito personale: `https://username.github.io`
   - Progetti: `https://username.github.io/repository-name`

## Best Practices

### Organizzazione del Codice
- Usa una struttura di cartelle chiara
- Mantieni file HTML, CSS e JS separati
- Segui le convenzioni di naming

### Versionamento
- Commit frequenti e atomici
- Messaggi di commit descrittivi
- Usa branch per nuove funzionalità

### Sviluppo
- Testa su Live Server prima del deploy
- Valida il codice HTML
- Ottimizza immagini e risorse

## Risoluzione Problemi Comuni

### Live Server non si avvia
- Verifica che la porta non sia in uso
- Riavvia VS Code
- Controlla le impostazioni del firewall

### Problemi con GitHub Pages
- Verifica il branch corretto
- Controlla il file index.html nella root
- Attendi alcuni minuti per il deploy

---

### Navigazione
- [📑 Indice](<../README.md>)
- [⬅️ Git e Controllo Versione](<07_Git_controllo_versione.md>)
- [➡️ Servizi di Hosting per Siti Web](<08_Servizi_hosting.md>)