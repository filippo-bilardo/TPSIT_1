# Utilizzo di GitHub Pages

## Introduzione
GitHub Pages è un servizio di hosting gratuito offerto da GitHub che permette di pubblicare siti web statici direttamente da un repository GitHub. È una soluzione ideale per progetti personali, documentazione, portfolio e siti web di piccole dimensioni che non richiedono un backend.

## Vantaggi di GitHub Pages
- **Gratuito**: Hosting completamente gratuito per siti statici.
- **Facile da usare**: Integrazione diretta con i repository GitHub.
- **Supporto per domini personalizzati**: Possibilità di utilizzare un dominio proprio.
- **HTTPS**: Supporto automatico per connessioni sicure.
- **Integrazione con Jekyll**: Supporto nativo per il generatore di siti statici Jekyll.
- **Controllo versione**: Ogni modifica al sito è tracciata attraverso Git.

## Configurazione di base

### 1. Creazione di un repository
Per iniziare con GitHub Pages, è necessario creare un repository su GitHub:

1. Accedi al tuo account GitHub.
2. Crea un nuovo repository con il nome `username.github.io` (sostituisci "username" con il tuo nome utente GitHub).
3. Questo sarà il repository principale per il tuo sito GitHub Pages.

Se invece stai facendo un sito per un progetto specifico, puoi chiamarlo ad esempio: `nomeprogetto.github.io`.

### 2. Clonare il repository in locale
```bash
git clone https://github.com/username/username.github.io.git
cd username.github.io
```

### 3. Creazione di una pagina HTML di base
Crea un file `index.html` nella directory principale del repository:

```html
<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Il mio sito GitHub Pages</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            line-height: 1.6;
            margin: 0;
            padding: 20px;
            max-width: 800px;
            margin: 0 auto;
        }
        header {
            background-color: #f4f4f4;
            padding: 20px;
            text-align: center;
            margin-bottom: 20px;
        }
        footer {
            background-color: #f4f4f4;
            padding: 10px;
            text-align: center;
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <header>
        <h1>Benvenuto nel mio sito GitHub Pages</h1>
    </header>
    
    <main>
        <h2>Chi sono</h2>
        <p>Questa è la mia prima pagina pubblicata con GitHub Pages.</p>
        
        <h2>I miei progetti</h2>
        <p>Qui elencherò i miei progetti futuri.</p>
    </main>
    
    <footer>
        <p>&copy; 2023 Il mio sito GitHub Pages</p>
    </footer>
</body>
</html>
```

### 4. Pubblicazione del sito
```bash
git add index.html
git commit -m "Aggiungi pagina iniziale"
git branch -M main  # Assicurati di essere sul branch main
git push -u origin main
```

### 5. Attivazione di GitHub Pages
1. Vai alle impostazioni del repository su GitHub.
2. Scorri fino alla sezione "GitHub Pages".
3. Nella sezione "Source", seleziona il branch "main" (o "master" nelle versioni precedenti).
4. Clicca su "Save".
5. Dopo alcuni minuti, il tuo sito sarà disponibile all'indirizzo `https://username.github.io`.

Ogni volta che fai modifiche e fai un nuovo push su GitHub, il sito si aggiorna automaticamente.

## Consigli utili
- Puoi usare GitHub Pages per ospitare blog (con Jekyll), portfolio, app statiche ecc.
- Se usi framework come React/Vue/Angular, devi generare un build (dist/, build/) e caricare solo quella.
- GitHub Pages non supporta PHP o backend; è solo per siti statici.


## Best Practices per GitHub Pages

1. **Ottimizzazione delle immagini**: Riduci le dimensioni delle immagini per migliorare i tempi di caricamento.
2. **Minificazione di CSS e JavaScript**: Utilizza versioni minificate per ridurre le dimensioni dei file.
3. **Utilizzo di CDN**: Considera l'utilizzo di CDN per librerie comuni come Bootstrap o jQuery.
4. **Responsive Design**: Assicurati che il tuo sito funzioni bene su dispositivi mobili.
5. **Limiti di GitHub Pages**: Tieni presente che i repository GitHub Pages hanno un limite di 1GB e una larghezza di banda mensile consigliata di 100GB.
6. **Contenuti dinamici**: Anche se GitHub Pages supporta solo contenuti statici, puoi integrare servizi di terze parti per funzionalità come moduli di contatto o commenti.

## Casi d'uso comuni

1. **Portfolio personale**: Mostra i tuoi progetti e competenze.
2. **Blog tecnico**: Condividi le tue conoscenze e esperienze.
3. **Documentazione di progetti**: Crea documentazione dettagliata per i tuoi progetti open source.
4. **Landing page**: Crea pagine di destinazione per i tuoi prodotti o servizi.
5. **Siti per eventi**: Promuovi eventi, conferenze o meetup.

## Risoluzione dei problemi comuni

1. **Il sito non si aggiorna**: Assicurati che i file siano stati correttamente committati e pushati al branch corretto.
2. **Problemi con i domini personalizzati**: Verifica la configurazione DNS e assicurati che il file CNAME sia corretto.
3. **Errori 404**: Controlla che i percorsi dei file e i link siano corretti.
4. **Problemi con Jekyll**: Verifica che il tuo sito Jekyll sia compatibile con la versione supportata da GitHub Pages.

## Conclusione
GitHub Pages è uno strumento potente e gratuito per la pubblicazione di siti web statici. La sua integrazione con GitHub lo rende particolarmente utile per sviluppatori e progetti open source. Con un po' di conoscenza di HTML, CSS e Git, è possibile creare e gestire facilmente un sito web professionale senza costi di hosting.

---

## Risorse aggiuntive
- [Documentazione ufficiale di GitHub Pages](https://docs.github.com/en/pages)
- [Temi Jekyll supportati da GitHub Pages](https://pages.github.com/themes/)
- [Jekyll Documentation](https://jekyllrb.com/docs/)
- [GitHub Pages Examples](https://github.com/collections/github-pages-examples)

---

### Navigazione
- [📑 Indice](<../README.md>)
- [⬅️ Editor WYSIWYG per lo Sviluppo Web](<10_Editor_WYSIWYG.md>)
- [➡️ Struttura di base di una pagina HTML5](<../2. Fondamenti di HTML5/01_Struttura_base_HTML5.md>)