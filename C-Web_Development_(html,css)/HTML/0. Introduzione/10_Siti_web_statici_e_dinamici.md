## Siti web statici e dinamici

### Introduzione ai tipi di siti web
Nel panorama dello sviluppo web, i siti possono essere classificati in due categorie principali: statici e dinamici. Questa distinzione fondamentale influenza non solo il modo in cui i siti vengono creati e gestiti, ma anche l'esperienza utente, le prestazioni, la sicurezza e i costi di sviluppo e manutenzione. Comprendere le differenze tra questi due approcci è essenziale per scegliere la soluzione più adatta alle proprie esigenze progettuali.

### Siti web statici

#### Caratteristiche principali
I siti web statici sono composti da pagine HTML predefinite che vengono inviate al browser dell'utente esattamente come sono memorizzate sul server web. Ogni pagina è un file separato con contenuto fisso che rimane invariato finché lo sviluppatore non lo modifica manualmente. Questi siti utilizzano principalmente HTML e CSS, con eventuale JavaScript per aggiungere interattività lato client.

#### Vantaggi dei siti statici
1. **Velocità**: I siti statici caricano rapidamente poiché non richiedono elaborazione lato server o query al database per generare contenuti.
2. **Sicurezza**: Offrono una superficie di attacco ridotta, essendo privi di database o logica server complessa vulnerabile a exploit.
3. **Affidabilità**: Con meno componenti che potrebbero guastarsi, i siti statici tendono ad essere più stabili.
4. **Costi di hosting ridotti**: Richiedono risorse server minime e possono essere ospitati su servizi economici o gratuiti come GitHub Pages o Netlify.
5. **SEO**: Spesso ottengono buoni risultati nei motori di ricerca grazie ai tempi di caricamento rapidi e alla struttura semplice.

#### Limitazioni dei siti statici
1. **Contenuto fisso**: Ogni modifica richiede l'aggiornamento manuale dei file HTML.
2. **Funzionalità limitate**: Non possono offrire funzionalità avanzate come account utente, carrelli della spesa o contenuti personalizzati senza integrazioni esterne.
3. **Scalabilità dei contenuti**: La gestione diventa complessa con l'aumentare del numero di pagine.
4. **Interattività limitata**: L'interazione con l'utente è limitata a ciò che può essere implementato con JavaScript lato client.

#### Casi d'uso ideali
- Siti personali e portfolio
- Siti vetrina aziendali di piccole dimensioni
- Landing page
- Documentazione tecnica
- Blog semplici (usando generatori di siti statici)

### Siti web dinamici

#### Caratteristiche principali
I siti web dinamici generano contenuti in tempo reale in risposta alle richieste degli utenti. Utilizzano linguaggi di programmazione lato server (come PHP, Python, Ruby, Node.js) per elaborare dati, interagire con database e creare pagine HTML personalizzate al momento della richiesta. Il contenuto può variare in base a diversi fattori come l'identità dell'utente, l'ora del giorno o le azioni precedenti.

#### Vantaggi dei siti dinamici
1. **Contenuto personalizzato**: Possono mostrare informazioni diverse a utenti diversi in base a preferenze, comportamenti o altri parametri.
2. **Funzionalità avanzate**: Supportano funzionalità complesse come registrazione utenti, e-commerce, forum, sistemi di prenotazione e altro.
3. **Gestione dei contenuti semplificata**: Utilizzano sistemi di gestione dei contenuti (CMS) che permettono aggiornamenti facili anche per utenti non tecnici.
4. **Scalabilità**: Possono gestire grandi quantità di contenuti organizzati in database.
5. **Interattività**: Offrono esperienze utente ricche e interattive con feedback in tempo reale.

#### Limitazioni dei siti dinamici
1. **Prestazioni**: Generalmente più lenti dei siti statici a causa del tempo necessario per l'elaborazione lato server e le query al database.
2. **Complessità**: Richiedono competenze tecniche più avanzate per lo sviluppo e la manutenzione.
3. **Costi maggiori**: Necessitano di hosting più potenti e costosi per gestire l'elaborazione lato server.
4. **Sicurezza**: Presentano una superficie di attacco più ampia, richiedendo maggiore attenzione alla sicurezza.
5. **Dipendenza dal server**: Non funzionano senza una connessione attiva al server backend.

#### Casi d'uso ideali
- E-commerce
- Social media
- Portali di notizie
- Applicazioni web
- Siti con contenuti frequentemente aggiornati
- Piattaforme che richiedono autenticazione utente

### Approcci ibridi e tendenze moderne

#### Generatori di siti statici (SSG)
I generatori di siti statici come Jekyll, Hugo, Gatsby e Next.js rappresentano un approccio ibrido che combina i vantaggi di entrambi i mondi. Questi strumenti generano pagine HTML statiche in fase di build a partire da contenuti strutturati (spesso archiviati in database o file markdown), offrendo la velocità e la sicurezza dei siti statici con la gestibilità dei contenuti tipica dei siti dinamici.

#### Jamstack
L'architettura Jamstack (JavaScript, API, Markup) è un approccio moderno che separa il frontend dal backend, utilizzando API e servizi di terze parti per le funzionalità dinamiche. I siti Jamstack sono pre-renderizzati in fase di build e distribuiti su CDN (Content Delivery Network), risultando in prestazioni eccellenti, alta sicurezza e scalabilità.

#### Single Page Applications (SPA) con API
Le SPA costruite con framework come React, Vue o Angular possono sembrare dinamiche all'utente, ma spesso sono distribuite come bundle statici che comunicano con API separate per i dati dinamici. Questo approccio offre un'esperienza utente fluida mantenendo molti vantaggi dei siti statici.

### Criteri di scelta tra statico e dinamico

Nella scelta tra un sito statico e dinamico, è importante considerare:

1. **Natura del contenuto**: Quanto spesso cambia il contenuto e chi lo gestisce?
2. **Complessità funzionale**: Quali funzionalità sono necessarie (autenticazione, e-commerce, contenuti personalizzati)?
3. **Budget e risorse**: Quali sono i vincoli di tempo, denaro e competenze tecniche disponibili?
4. **Prestazioni richieste**: Quanto è importante la velocità di caricamento per il pubblico target?
5. **Scalabilità futura**: Come potrebbe evolversi il sito nel tempo?

### Server Web

#### Cosa sono i server web
I server web sono software specializzati che gestiscono la distribuzione di contenuti web ai client (tipicamente browser) che ne fanno richiesta attraverso il protocollo HTTP. Rappresentano l'infrastruttura fondamentale che permette il funzionamento del World Wide Web, rispondendo alle richieste degli utenti e servendo le pagine web appropriate.

#### Funzionamento di base
Il processo di funzionamento di un server web segue generalmente questi passaggi:

1. **Ricezione della richiesta**: Il server riceve una richiesta HTTP da un browser client.
2. **Elaborazione**: Il server interpreta la richiesta per determinare quale risorsa è stata richiesta.
3. **Recupero della risorsa**: Il server recupera il file richiesto dal filesystem o genera dinamicamente il contenuto.
4. **Invio della risposta**: Il server invia la risorsa al client insieme a un codice di stato HTTP appropriato.

#### Principali server web

1. **Apache HTTP Server**
   - Il più diffuso e longevo server web al mondo
   - Open source e multipiattaforma
   - Altamente configurabile tramite moduli
   - Eccellente per l'hosting di siti sia statici che dinamici
   - Supporta numerosi linguaggi di scripting lato server (PHP, Perl, Python)

2. **Nginx**
   - Server web leggero e ad alte prestazioni
   - Eccellente per la gestione di connessioni simultanee
   - Spesso utilizzato come reverse proxy e load balancer
   - Particolarmente efficiente per contenuti statici
   - Consumo di memoria inferiore rispetto ad Apache

3. **Microsoft IIS (Internet Information Services)**
   - Server web proprietario di Microsoft
   - Integrato con l'ecosistema Windows
   - Ottimizzato per tecnologie Microsoft (.NET, ASP.NET)
   - Include funzionalità di sicurezza avanzate
   - Interfaccia grafica per la configurazione

4. **LiteSpeed**
   - Server web commerciale ad alte prestazioni
   - Compatibile con la configurazione di Apache
   - Ottimizzato per PHP e WordPress
   - Consumo di risorse ridotto

5. **Node.js con Express**
   - Ambiente di runtime JavaScript lato server
   - Ideale per applicazioni in tempo reale
   - Architettura event-driven e non bloccante
   - Particolarmente adatto per API e applicazioni single-page

#### Server web per siti statici vs dinamici

**Per siti statici:**
- I server web servono direttamente i file HTML, CSS, JavaScript e altri asset
- Non è richiesta elaborazione lato server per generare contenuti
- Qualsiasi server web può gestire efficacemente contenuti statici
- Nginx è particolarmente efficiente per questo scopo grazie alla sua ottimizzazione per file statici

**Per siti dinamici:**
- I server web devono interfacciarsi con interpreti di linguaggi (PHP, Python, Ruby) o application server
- Spesso utilizzano moduli o configurazioni specifiche per supportare tecnologie dinamiche
- Apache con mod_php è una combinazione comune per siti PHP
- IIS è ottimizzato per applicazioni ASP.NET
- Node.js funge sia da server web che da ambiente di esecuzione

#### Configurazione di base

La configurazione di un server web tipicamente include:

1. **Document root**: La directory da cui vengono serviti i file
2. **Virtual hosts**: Configurazione per ospitare più siti sullo stesso server
3. **MIME types**: Definizione dei tipi di contenuto supportati
4. **Regole di sicurezza**: Limitazioni di accesso e protezioni
5. **Moduli e estensioni**: Funzionalità aggiuntive per supportare vari linguaggi e tecnologie
6. **Logging**: Configurazione della registrazione degli accessi e degli errori

#### Tendenze moderne

1. **Serverless**: Architetture che astraggono completamente l'infrastruttura del server
2. **Containerizzazione**: Utilizzo di Docker per impacchettare server web e dipendenze
3. **Edge computing**: Distribuzione di contenuti e logica più vicino agli utenti finali
4. **HTTP/2 e HTTP/3**: Supporto per protocolli più recenti e performanti
5. **Microservizi**: Architetture distribuite con server web specializzati per funzioni specifiche

### Conclusione
La distinzione tra siti web statici e dinamici rappresenta una decisione architetturale fondamentale nello sviluppo web. Mentre i siti statici offrono semplicità, velocità e sicurezza, i siti dinamici forniscono flessibilità, funzionalità avanzate e contenuti personalizzati. Con l'evoluzione delle tecnologie web, i confini tra queste categorie stanno diventando sempre più sfumati, con approcci ibridi che cercano di combinare i vantaggi di entrambi.

La scelta del server web appropriato è altrettanto importante quanto la decisione tra un approccio statico o dinamico. Il server web deve essere selezionato in base alle esigenze specifiche del progetto, alle tecnologie utilizzate e ai requisiti di prestazioni e sicurezza.

La scelta migliore dipende dalle specifiche esigenze del progetto, dal pubblico target e dalle risorse disponibili. In molti casi, un approccio ibrido o progressivo può rappresentare la soluzione ottimale, permettendo di iniziare con un sito statico e aggiungere gradualmente funzionalità dinamiche secondo necessità.

---

### Navigazione
- [📑 Indice](<../README.md>)
- [⬅️ Front-end e Back-end nello sviluppo web](<09_Front_end_e_Back_end.md>)
- [➡️ Le tecnologie web: HTML, CSS e JavaScript](<11_Tecnologie_web.md>)

