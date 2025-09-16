## I protocolli del WWW e messaggi HTTP

### Introduzione ai protocolli web
Il World Wide Web (WWW) si basa su una serie di protocolli standardizzati che permettono la comunicazione e lo scambio di informazioni tra client e server attraverso Internet. Questi protocolli definiscono le regole e i formati per la trasmissione dei dati, garantendo l'interoperabilità tra sistemi diversi. Tra questi, il protocollo HTTP (HyperText Transfer Protocol) riveste un ruolo fondamentale, essendo il principale meccanismo di trasferimento per il web. Comprendere questi protocolli è essenziale per chiunque voglia approfondire il funzionamento del web e sviluppare applicazioni web efficaci.

### Il modello client-server
Prima di approfondire i protocolli specifici, è importante comprendere il modello client-server su cui si basa il web:

1. **Client**: È l'applicazione (tipicamente un browser web) che richiede risorse o servizi. Il client invia richieste al server e riceve risposte.

2. **Server**: È il computer o il programma che ospita le risorse o i servizi richiesti dal client. Il server elabora le richieste e invia risposte appropriate.

3. **Comunicazione**: Client e server comunicano attraverso protocolli standardizzati, principalmente HTTP, che definiscono il formato e la sequenza dei messaggi scambiati.

Questo modello permette una chiara separazione delle responsabilità e consente la scalabilità del sistema, poiché un singolo server può servire molti client contemporaneamente.

### HTTP: il protocollo fondamentale del web

#### Cos'è HTTP
HTTP (HyperText Transfer Protocol) è un protocollo a livello applicativo progettato per il trasferimento di documenti ipertestuali, come le pagine HTML. Sviluppato da Tim Berners-Lee al CERN nei primi anni '90, HTTP è diventato il fondamento del World Wide Web, permettendo ai browser di comunicare con i server web per richiedere e ricevere pagine web e altre risorse.

HTTP è un protocollo stateless (senza stato), il che significa che ogni richiesta è indipendente e il server non mantiene informazioni sulle richieste precedenti. Questa caratteristica semplifica l'implementazione del protocollo ma richiede meccanismi aggiuntivi (come i cookie) per mantenere lo stato della sessione nelle applicazioni web.

#### Evoluzione di HTTP
- **HTTP/0.9 (1991)**: La prima versione, estremamente semplice, supportava solo richieste GET e risposte HTML senza header.
- **HTTP/1.0 (1996)**: Introdusse header, metodi aggiuntivi (POST, HEAD) e codici di stato.
- **HTTP/1.1 (1997)**: Aggiunse connessioni persistenti, virtual hosting, chunked transfer encoding e altri miglioramenti.
- **HTTP/2 (2015)**: Introdusse multiplexing delle richieste, compressione degli header e server push per migliorare le prestazioni.
- **HTTP/3 (in sviluppo)**: Basato su QUIC invece di TCP, mira a ridurre ulteriormente la latenza e migliorare la sicurezza.

### Anatomia dei messaggi HTTP

#### Richieste HTTP
Una richiesta HTTP dal client al server include:

1. **Linea di richiesta**: Contiene il metodo HTTP, l'URI della risorsa richiesta e la versione del protocollo.
   ```
   GET /index.html HTTP/1.1
   ```

2. **Header della richiesta**: Forniscono informazioni aggiuntive sulla richiesta o sul client stesso.
   ```
   Host: www.example.com
   User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64)
   Accept: text/html,application/xhtml+xml
   Accept-Language: it-IT,it;q=0.9,en-US;q=0.8,en;q=0.7
   Connection: keep-alive
   ```

3. **Corpo della richiesta** (opzionale): Contiene dati inviati al server, come i dati di un form.
   ```
   username=utente&password=12345
   ```

#### Metodi HTTP
I metodi HTTP definiscono l'azione che il client vuole che il server esegua sulla risorsa specificata:

- **GET**: Richiede una rappresentazione della risorsa specificata. Le richieste GET dovrebbero solo recuperare dati.
- **POST**: Invia dati al server per creare o aggiornare una risorsa.
- **PUT**: Sostituisce tutte le rappresentazioni correnti della risorsa target con il payload della richiesta.
- **DELETE**: Rimuove la risorsa specificata.
- **HEAD**: Simile a GET ma richiede solo gli header, non il corpo della risposta.
- **OPTIONS**: Descrive le opzioni di comunicazione disponibili per la risorsa target.
- **PATCH**: Applica modifiche parziali a una risorsa.
- **TRACE**: Esegue un test di loop-back lungo il percorso verso la risorsa target.
- **CONNECT**: Stabilisce un tunnel verso il server identificato dalla risorsa target.

#### Risposte HTTP
Una risposta HTTP dal server al client include:

1. **Linea di stato**: Contiene la versione del protocollo, un codice di stato numerico e una breve descrizione testuale.
   ```
   HTTP/1.1 200 OK
   ```

2. **Header della risposta**: Forniscono informazioni aggiuntive sulla risposta o sul server.
   ```
   Date: Mon, 23 May 2023 22:38:34 GMT
   Server: Apache/2.4.41 (Ubuntu)
   Content-Type: text/html; charset=UTF-8
   Content-Length: 138
   Last-Modified: Wed, 08 Jan 2023 23:11:55 GMT
   ```

3. **Corpo della risposta** (opzionale): Contiene i dati richiesti, come una pagina HTML.
   ```html
   <!DOCTYPE html>
   <html>
   <head>
       <title>Esempio</title>
   </head>
   <body>
       <h1>Hello, World!</h1>
   </body>
   </html>
   ```

#### Codici di stato HTTP
I codici di stato HTTP indicano il risultato di una richiesta HTTP. Sono raggruppati in cinque classi:

1. **1xx (Informational)**: La richiesta è stata ricevuta e il processo continua.
   - 100 Continue
   - 101 Switching Protocols

2. **2xx (Success)**: La richiesta è stata ricevuta, compresa e accettata con successo.
   - 200 OK
   - 201 Created
   - 204 No Content

3. **3xx (Redirection)**: Ulteriori azioni sono necessarie per completare la richiesta.
   - 301 Moved Permanently
   - 302 Found
   - 304 Not Modified

4. **4xx (Client Error)**: La richiesta contiene errori o non può essere soddisfatta.
   - 400 Bad Request
   - 401 Unauthorized
   - 403 Forbidden
   - 404 Not Found

5. **5xx (Server Error)**: Il server ha fallito nel soddisfare una richiesta apparentemente valida.
   - 500 Internal Server Error
   - 502 Bad Gateway
   - 503 Service Unavailable

### HTTPS: HTTP Sicuro

#### Cos'è HTTPS
HTTPS (HTTP Secure) è l'implementazione sicura di HTTP, che utilizza il protocollo SSL/TLS per crittografare la comunicazione tra client e server. HTTPS protegge l'integrità e la riservatezza dei dati scambiati, impedendo intercettazioni, manipolazioni e attacchi man-in-the-middle.

#### Funzionamento di HTTPS
1. **Handshake TLS**: Client e server stabiliscono una connessione sicura attraverso un processo di handshake che include la verifica dell'identità del server tramite certificati digitali.

2. **Crittografia**: Una volta stabilita la connessione, tutti i dati scambiati sono crittografati, rendendo impossibile per terze parti leggere o modificare le informazioni.

3. **Certificati SSL/TLS**: I certificati, rilasciati da Autorità di Certificazione (CA) fidate, confermano l'identità del server e contengono la chiave pubblica utilizzata per la crittografia.

#### Vantaggi di HTTPS
- **Sicurezza**: Protegge dati sensibili come credenziali di login, informazioni di pagamento e dati personali.
- **Integrità**: Garantisce che i dati non siano stati alterati durante la trasmissione.
- **Autenticazione**: Verifica l'identità del server, proteggendo gli utenti da siti fraudolenti.
- **SEO**: I motori di ricerca come Google favoriscono i siti HTTPS nei risultati di ricerca.
- **Funzionalità moderne**: Alcune API web moderne (come geolocalizzazione e notifiche push) sono disponibili solo su connessioni sicure.

### Altri protocolli web importanti

#### DNS (Domain Name System)
Il DNS è il "sistema di nomi di dominio" che traduce i nomi di dominio leggibili dall'uomo (come www.example.com) in indirizzi IP numerici (come 93.184.216.34) che i computer utilizzano per identificarsi sulla rete. Senza DNS, gli utenti dovrebbero ricordare indirizzi IP numerici invece di nomi di dominio.

#### TCP/IP (Transmission Control Protocol/Internet Protocol)
TCP/IP è la suite di protocolli di comunicazione su cui si basa Internet. HTTP opera al livello applicativo di questa suite, mentre TCP gestisce la trasmissione affidabile dei dati e IP si occupa dell'indirizzamento e dell'instradamento dei pacchetti attraverso la rete.

#### WebSocket
WebSocket è un protocollo che fornisce un canale di comunicazione bidirezionale full-duplex su una singola connessione TCP. A differenza di HTTP, che segue un modello richiesta-risposta, WebSocket permette una comunicazione in tempo reale tra client e server, ideale per applicazioni come chat, giochi online e aggiornamenti in tempo reale.

### Esempi pratici di comunicazione HTTP

#### Esempio 1: Richiesta GET semplice

**Richiesta:**
```
GET /index.html HTTP/1.1
Host: www.example.com
User-Agent: Mozilla/5.0
Accept: text/html
```

**Risposta:**
```
HTTP/1.1 200 OK
Date: Mon, 23 May 2023 22:38:34 GMT
Server: Apache/2.4.41
Content-Type: text/html; charset=UTF-8
Content-Length: 138

<!DOCTYPE html>
<html>
<head>
    <title>Esempio</title>
</head>
<body>
    <h1>Hello, World!</h1>
</body>
</html>
```

#### Esempio 2: Invio di dati con POST

**Richiesta:**
```
POST /login HTTP/1.1
Host: www.example.com
Content-Type: application/x-www-form-urlencoded
Content-Length: 33

username=utente&password=12345
```

**Risposta:**
```
HTTP/1.1 302 Found
Date: Mon, 23 May 2023 22:40:12 GMT
Location: /dashboard
Set-Cookie: session=abc123; Path=/; HttpOnly
Content-Length: 0
```

#### Esempio 3: Richiesta API con JSON

**Richiesta:**
```
POST /api/users HTTP/1.1
Host: api.example.com
Content-Type: application/json
Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...
Content-Length: 45

{
  "name": "Mario Rossi",
  "email": "mario@example.com"
}
```

**Risposta:**
```
HTTP/1.1 201 Created
Date: Mon, 23 May 2023 22:42:53 GMT
Content-Type: application/json
Content-Length: 83

{
  "id": 12345,
  "name": "Mario Rossi",
  "email": "mario@example.com",
  "created_at": "2023-05-23T22:42:53Z"
}
```

### Strumenti per l'analisi del traffico HTTP

#### Browser Developer Tools
Tutti i browser moderni includono strumenti di sviluppo che permettono di ispezionare le richieste e le risposte HTTP. La scheda "Network" di questi strumenti mostra dettagli come metodo, URL, codice di stato, header e corpo delle richieste e delle risposte.

#### Postman
Postman è un'applicazione che permette di creare, testare e documentare API. Offre un'interfaccia user-friendly per inviare richieste HTTP personalizzate e analizzare le risposte, supportando vari metodi, header e formati di dati.

#### Wireshark
Wireshark è un analizzatore di protocollo di rete che permette di catturare e ispezionare i pacchetti di rete in tempo reale. È uno strumento potente per il debugging di problemi di rete e per l'analisi dettagliata del traffico HTTP.

### Conclusione
I protocolli web, in particolare HTTP, costituiscono l'infrastruttura di comunicazione su cui si basa il World Wide Web. La comprensione di come funzionano questi protocolli, della struttura dei messaggi HTTP e dei vari codici di stato è fondamentale per lo sviluppo web efficace e per il debugging di problemi di comunicazione.

Con l'evoluzione continua del web, anche i protocolli si stanno evolvendo per migliorare prestazioni, sicurezza e funzionalità. HTTP/2 e HTTP/3 stanno introducendo ottimizzazioni significative, mentre HTTPS è diventato lo standard de facto per le comunicazioni web sicure. La padronanza di questi protocolli e delle loro caratteristiche rappresenta una competenza essenziale per chiunque lavori nel campo dello sviluppo web e delle tecnologie Internet.

---

### Navigazione
- [📑 Indice](<../README.md>)
- [⬅️ Le tecnologie web: HTML, CSS e JavaScript](<11_Tecnologie_web.md>)
- [➡️ Editor HTML e IDE](<../1. Ambiente di sviluppo/01_Editor_HTML_e_IDE.md>)