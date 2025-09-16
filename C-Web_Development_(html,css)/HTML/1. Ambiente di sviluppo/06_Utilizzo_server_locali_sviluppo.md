# Utilizzo di server locali per lo sviluppo

## Introduzione
L'utilizzo di un server locale è fondamentale nello sviluppo web moderno. Anche se i file HTML possono essere aperti direttamente nel browser (protocollo `file://`), molte funzionalità web richiedono un vero server HTTP (protocollo `http://`). Questo documento esplora le opzioni disponibili per configurare e utilizzare server locali durante lo sviluppo.

## Perché utilizzare un server locale

### Limitazioni dell'apertura diretta dei file
- **Restrizioni di sicurezza**: I browser limitano alcune funzionalità quando i file sono aperti direttamente, come le richieste AJAX cross-origin.
- **API moderne**: Molte API HTML5 (come Fetch, Service Workers, ecc.) funzionano solo in un contesto sicuro (HTTPS) o almeno HTTP.
- **Moduli ES**: L'importazione di moduli JavaScript richiede un server HTTP.
- **Percorsi relativi**: I percorsi relativi funzionano in modo più prevedibile quando serviti da un server.

### Vantaggi di un server locale
- **Ambiente realistico**: Simula meglio l'ambiente di produzione.
- **Testing accurato**: Permette di testare funzionalità che richiedono un server HTTP.
- **Sviluppo di API**: Facilita lo sviluppo e il test di API backend.
- **Supporto per URL rewriting**: Utile per applicazioni a pagina singola (SPA).

## Opzioni per server locali

### Server integrati negli editor

#### Live Server (VS Code)
- **Installazione**: Disponibile come estensione per Visual Studio Code.
- **Utilizzo**: Dopo l'installazione, fare clic su "Go Live" nella barra di stato o aprire il menu contestuale su un file HTML e selezionare "Open with Live Server".
- **Caratteristiche**: Auto-refresh del browser quando i file vengono modificati, supporto per percorsi relativi.

#### Browser-sync
- **Installazione**:
  ```bash
  npm install -g browser-sync
  ```
- **Utilizzo base**:
  ```bash
  browser-sync start --server --files "*.html, css/*.css, js/*.js"
  ```
- **Caratteristiche**: Sincronizzazione tra più browser, supporto per dispositivi mobili, UI di controllo.

### Server HTTP semplici

#### http-server
- **Installazione**:
  ```bash
  npm install -g http-server
  ```
- **Utilizzo base**:
  ```bash
  http-server -p 8080
  ```
- **Caratteristiche**: Server leggero e veloce, supporto per CORS, caching configurabile.

#### Python SimpleHTTPServer
- **Prerequisito**: Python installato.
- **Utilizzo (Python 2)**:
  ```bash
  python -m SimpleHTTPServer 8000
  ```
- **Utilizzo (Python 3)**:
  ```bash
  python -m http.server 8000
  ```
- **Caratteristiche**: Disponibile in qualsiasi sistema con Python, nessuna installazione aggiuntiva richiesta.

### Server di sviluppo avanzati

#### Node.js con Express
- **Installazione**:
  ```bash
  npm init -y
  npm install express
  ```
- **Esempio di codice base** (server.js):
  ```javascript
  const express = require('express');
  const app = express();
  const port = 3000;
  
  // Servire file statici dalla directory corrente
  app.use(express.static('.'));
  
  app.listen(port, () => {
    console.log(`Server in esecuzione su http://localhost:${port}`);
  });
  ```
- **Avvio**:
  ```bash
  node server.js
  ```
- **Caratteristiche**: Altamente configurabile, supporto per middleware, routing avanzato.

#### Webpack Dev Server
- **Installazione**:
  ```bash
  npm install --save-dev webpack webpack-cli webpack-dev-server
  ```
- **Configurazione base** (webpack.config.js):
  ```javascript
  module.exports = {
    mode: 'development',
    devServer: {
      contentBase: './',
      port: 8080,
      open: true
    }
  };
  ```
- **Avvio**:
  ```bash
  npx webpack serve
  ```
- **Caratteristiche**: Hot Module Replacement, integrazione con il sistema di bundling, proxy per API.

#### Vite
- **Installazione e creazione progetto**:
  ```bash
  npm create vite@latest my-project
  cd my-project
  npm install
  ```
- **Avvio**:
  ```bash
  npm run dev
  ```
- **Caratteristiche**: Estremamente veloce, supporto nativo per ES modules, hot module replacement avanzato.

## Configurazione avanzata dei server locali

### HTTPS locale
- **Generazione di certificati self-signed**:
  ```bash
  openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout key.pem -out cert.pem
  ```
- **Configurazione HTTPS con http-server**:
  ```bash
  http-server -S -C cert.pem -K key.pem
  ```
- **Configurazione HTTPS con Express**:
  ```javascript
  const https = require('https');
  const fs = require('fs');
  const express = require('express');
  const app = express();
  
  const options = {
    key: fs.readFileSync('key.pem'),
    cert: fs.readFileSync('cert.pem')
  };
  
  app.use(express.static('.'));
  
  https.createServer(options, app).listen(443, () => {
    console.log('Server HTTPS in esecuzione su https://localhost');
  });
  ```

### Proxy API
- **Configurazione proxy con Webpack Dev Server**:
  ```javascript
  module.exports = {
    // ...
    devServer: {
      proxy: {
        '/api': {
          target: 'http://localhost:3000',
          pathRewrite: {'^/api' : ''}
        }
      }
    }
  };
  ```

### Virtual Hosts
- **Configurazione in hosts file**:
  - Windows: `C:\Windows\System32\drivers\etc\hosts`
  - macOS/Linux: `/etc/hosts`
  
  Aggiungere: `127.0.0.1 miosito.local`

- **Configurazione in Apache**:
  ```apache
  <VirtualHost *:80>
      ServerName miosito.local
      DocumentRoot "/percorso/al/progetto"
  </VirtualHost>
  ```

## Best practices

### Sicurezza
- **Limitare l'accesso**: Configurare il server per accettare connessioni solo da localhost.
- **Dati sensibili**: Non utilizzare dati reali o sensibili nell'ambiente di sviluppo.
- **Certificati**: Per HTTPS locale, utilizzare certificati self-signed solo per sviluppo.

### Performance
- **Caching**: Disabilitare la cache del browser durante lo sviluppo.
- **Compressione**: Testare con e senza compressione gzip/brotli.
- **Ottimizzazione**: Utilizzare strumenti di ottimizzazione solo in fase di build, non durante lo sviluppo.

### Workflow
- **Auto-refresh**: Utilizzare server con capacità di live reload per aumentare la produttività.
- **Configurazione condivisa**: Documentare e versionare la configurazione del server locale.
- **Parità con produzione**: Cercare di mantenere l'ambiente di sviluppo il più simile possibile a quello di produzione.

## Conclusione
L'utilizzo di un server locale è un aspetto fondamentale dello sviluppo web moderno. La scelta del server dipende dalle esigenze specifiche del progetto, dalla complessità dell'applicazione e dalle preferenze personali. Investire tempo nella configurazione di un ambiente di sviluppo locale efficiente può migliorare significativamente la produttività e ridurre i problemi in fase di deployment.

---

## Risorse aggiuntive
- [MDN: Setting Up a Local Testing Server](https://developer.mozilla.org/en-US/docs/Learn/Common_questions/set_up_a_local_testing_server)
- [Browser-sync Documentation](https://browsersync.io/docs)
- [Express.js Documentation](https://expressjs.com/)
- [Webpack Dev Server Documentation](https://webpack.js.org/configuration/dev-server/)

---

### Navigazione
- [📑 Indice](<../README.md>)
- [⬅️ Configurazione dell'ambiente locale](<05_Configurazione_ambiente_locale.md>)
- [➡️ Git e Controllo Versione per Progetti Web](<07_Git_controllo_versione.md>)