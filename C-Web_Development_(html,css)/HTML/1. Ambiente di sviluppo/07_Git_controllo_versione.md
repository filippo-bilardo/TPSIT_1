# Git e Controllo Versione per Progetti Web

## Introduzione
Il controllo versione è un aspetto fondamentale dello sviluppo web moderno, permettendo ai team di collaborare efficacemente e mantenere una cronologia completa delle modifiche al codice. Git è diventato lo standard de facto per il controllo versione distribuito.

## Cos'è Git

### Concetti fondamentali
- **Sistema di controllo versione distribuito**: A differenza dei sistemi centralizzati, ogni sviluppatore ha una copia completa del repository.
- **Snapshot vs differenze**: Git memorizza "snapshot" completi del progetto invece che solo le differenze tra i file.
- **Integrità dei dati**: Ogni oggetto in Git ha un checksum che garantisce l'integrità dei dati.
- **Stati dei file**: I file in Git possono trovarsi in tre stati principali: modificati, staged (pronti per il commit) e committati.

### Vantaggi per lo sviluppo web
- Tracciamento completo delle modifiche al codice
- Facilità di collaborazione tra sviluppatori
- Possibilità di lavorare su branch separati per nuove funzionalità
- Ripristino semplice a versioni precedenti in caso di problemi
- Integrazione con workflow di continuous integration/deployment

## Configurazione iniziale di Git

### Installazione
- **Windows**: Scarica e installa Git da [git-scm.com](https://git-scm.com/)
- **macOS**: Installa tramite Homebrew con `brew install git` o scarica l'installer
- **Linux**: Usa il gestore pacchetti della tua distribuzione (es. `apt-get install git` per Ubuntu)

### Configurazione base
```bash
# Configurazione dell'identità
git config --global user.name "Il tuo nome"
git config --global user.email "tua.email@esempio.com"

# Configurazione dell'editor predefinito
git config --global core.editor "code --wait"  # Per Visual Studio Code
```

## Comandi Git essenziali

### Inizializzazione e clonazione
- `git init`: Inizializza un nuovo repository Git
- `git clone [url]`: Clona un repository esistente

### Operazioni base
- `git status`: Mostra lo stato dei file nel repository
- `git add [file]`: Aggiunge file all'area di staging
- `git commit -m "messaggio"`: Crea un nuovo commit con i file nell'area di staging
- `git pull`: Scarica e integra le modifiche dal repository remoto
- `git push`: Carica i commit locali sul repository remoto

### Branching e merging
- `git branch`: Elenca i branch disponibili
- `git branch [nome-branch]`: Crea un nuovo branch
- `git checkout [nome-branch]`: Passa a un altro branch
- `git merge [nome-branch]`: Unisce un branch nel branch corrente

## Workflow Git per progetti web

### Gitflow Workflow
Un modello popolare che definisce ruoli specifici per diversi branch:
- **master**: Contiene solo codice di produzione stabile
- **develop**: Branch principale di sviluppo
- **feature/**: Branch per nuove funzionalità
- **release/**: Branch per preparare il rilascio
- **hotfix/**: Branch per correzioni urgenti in produzione

### GitHub Flow
Un workflow più semplice basato su:
- Branch principale (main) sempre deployabile
- Creazione di branch per nuove funzionalità
- Pull request per revisione del codice
- Merge nel main dopo approvazione

## Piattaforme di hosting Git

### GitHub
- La piattaforma più popolare per l'hosting di repository Git
- Offre funzionalità come issue tracking, pull request, GitHub Pages
- Integrazione con CI/CD tramite GitHub Actions

### GitLab
- Alternativa completa con funzionalità di CI/CD integrate
- Disponibile come servizio cloud o self-hosted

### Bitbucket
- Soluzione di Atlassian con integrazione con altri prodotti come Jira
- Adatto per team che utilizzano già l'ecosistema Atlassian

## Git per lo sviluppo web collaborativo

### Best practices
- Commit frequenti e atomici (una modifica logica per commit)
- Messaggi di commit descrittivi e strutturati
- Utilizzo di .gitignore per escludere file non necessari
- Code review tramite pull request
- Risoluzione dei conflitti in modo collaborativo

### Integrazione con editor e IDE
La maggior parte degli editor moderni offre integrazione con Git:
- **Visual Studio Code**: Integrazione Git nativa con interfaccia grafica
- **Sublime Text**: Supporto Git tramite plugin
- **WebStorm**: Supporto Git completo integrato

## Conclusione
Git è uno strumento essenziale per qualsiasi sviluppatore web moderno. Padroneggiare Git non solo migliora l'efficienza individuale, ma facilita anche la collaborazione in team e garantisce un processo di sviluppo più robusto e sicuro.

---

## Risorse aggiuntive
- [Pro Git Book](https://git-scm.com/book/en/v2) - Guida completa e gratuita
- [Learn Git Branching](https://learngitbranching.js.org/) - Tutorial interattivo
- [GitHub Learning Lab](https://lab.github.com/) - Corsi pratici su Git e GitHub
- [Atlassian Git Tutorials](https://www.atlassian.com/git/tutorials) - Guide dettagliate su Git

---

### Navigazione
- [📑 Indice](<../README.md>)
- [⬅️ Utilizzo di server locali per lo sviluppo](<06_Utilizzo_server_locali_sviluppo.md>)
- [➡️ Servizi di Hosting per Siti Web](<08_Servizi_hosting.md>)