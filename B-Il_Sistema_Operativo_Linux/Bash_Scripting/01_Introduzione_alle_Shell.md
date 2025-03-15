# 1. Introduzione alle Shell

## 1.1 Storia delle shell Unix

Le shell Unix hanno una storia ricca che risale agli albori del sistema operativo Unix negli anni '70. La prima shell, chiamata **Thompson shell** (sh), fu sviluppata da Ken Thompson nel 1971 per il sistema Unix originale. Questa shell primitiva offriva funzionalità di base per l'esecuzione di comandi.

La vera evoluzione iniziò con la **Bourne shell** (sh), sviluppata da Stephen Bourne nei Bell Labs nel 1977, che introdusse molte delle caratteristiche fondamentali che utilizziamo ancora oggi:
- Variabili d'ambiente
- Controllo di flusso (if/then/else)
- Cicli (for, while)
- Funzioni

Nel corso degli anni '80, diverse shell alternative furono sviluppate:
- **C shell** (csh): creata da Bill Joy all'Università di California, Berkeley, con una sintassi simile al linguaggio C
- **Korn shell** (ksh): sviluppata da David Korn nei Bell Labs, che estendeva la Bourne shell con funzionalità aggiuntive
- **TENEX C shell** (tcsh): una versione migliorata della C shell

## 1.2 L'evoluzione di Bash

La **Bourne Again SHell** (Bash) fu creata da Brian Fox per il Progetto GNU nel 1989 come alternativa libera alla Bourne shell. Il nome "Bash" è un gioco di parole che significa "Bourne Again SHell".

Bash ha combinato le migliori caratteristiche delle shell precedenti:
- La sintassi di base della Bourne shell
- La cronologia dei comandi e il completamento dalla C shell
- Funzionalità avanzate dalla Korn shell

Nel corso degli anni, Bash è diventata la shell predefinita per la maggior parte delle distribuzioni Linux e per macOS (fino a Catalina). Oggi, Bash è disponibile praticamente su ogni sistema Unix-like e persino su Windows tramite WSL (Windows Subsystem for Linux).

### Versioni principali di Bash:
- **Bash 1.0**: Rilasciata nel 1989
- **Bash 2.0**: Rilasciata nel 1996, ha introdotto array e completamento programmabile
- **Bash 3.0**: Rilasciata nel 2004, ha aggiunto supporto per espressioni regolari e miglioramenti alla programmazione
- **Bash 4.0**: Rilasciata nel 2009, ha introdotto array associativi e altre funzionalità avanzate
- **Bash 5.0**: Rilasciata nel 2019, con miglioramenti alle performance e nuove funzionalità

## 1.3 Differenze tra shell e altri linguaggi di programmazione

Le shell, inclusa Bash, differiscono dai linguaggi di programmazione tradizionali in diversi aspetti fondamentali:

### Orientamento ai comandi
- Le shell sono progettate principalmente per eseguire comandi e programmi esterni
- I linguaggi di programmazione tradizionali sono orientati all'elaborazione dei dati

### Gestione del testo
- Le shell eccellono nella manipolazione di testo e nell'elaborazione di flussi di dati
- Utilizzano ampiamente pipe e redirezione per collegare comandi

### Tipizzazione
- Bash ha un sistema di tipi molto semplice (principalmente stringhe)
- I linguaggi moderni offrono sistemi di tipi complessi (int, float, oggetti, ecc.)

### Performance
- Le shell sono interpretate e generalmente più lente dei linguaggi compilati
- Sono ottimizzate per l'automazione di attività del sistema, non per calcoli intensivi

### Interattività
- Le shell sono progettate per essere utilizzate sia interattivamente che in script
- La maggior parte dei linguaggi di programmazione è orientata principalmente all'esecuzione non interattiva

## 1.4 Installazione e configurazione di Bash

### Installazione

Bash è preinstallato sulla maggior parte dei sistemi Unix-like:
- **Linux**: Praticamente tutte le distribuzioni Linux includono Bash
- **macOS**: Bash è incluso (versione 3.2 per motivi di licenza)
- **Windows**: Disponibile tramite:
  - Windows Subsystem for Linux (WSL)
  - Git Bash (parte di Git for Windows)
  - Cygwin
  - MinGW/MSYS2

#### Installazione su Windows tramite WSL:

```bash
# Abilitare WSL da PowerShell con privilegi di amministratore
Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux

# Riavviare il sistema e installare una distribuzione Linux dal Microsoft Store
```

### Configurazione

Bash utilizza diversi file di configurazione:

- **~/.bashrc**: Script eseguito per shell interattive non di login
- **~/.bash_profile**: Script eseguito per shell di login
- **~/.bash_logout**: Script eseguito quando si esce da una shell di login
- **~/.bash_history**: Memorizza la cronologia dei comandi
- **~/.inputrc**: Configura la libreria readline (utilizzata per l'input da tastiera)

#### Esempio di personalizzazione del prompt in ~/.bashrc:

```bash
# Personalizzazione del prompt con colori
export PS1="\[\033[38;5;11m\]\u@\h:\[\033[38;5;6m\]\w\[\033[38;5;15m\]\$ "

# Alias utili
alias ll='ls -la'
alias update='sudo apt update && sudo apt upgrade'

# Impostazione dell'editor predefinito
export EDITOR=nano
```

## Best Practices

1. **Utilizzare la versione più recente di Bash** quando possibile per sfruttare le nuove funzionalità e correzioni di bug
2. **Mantenere i file di configurazione organizzati** e ben commentati
3. **Creare un backup dei file di configurazione** prima di apportare modifiche significative
4. **Utilizzare il controllo di versione** (come Git) per tenere traccia delle modifiche ai file di configurazione
5. **Separare le configurazioni specifiche della macchina** in file separati che vengono inclusi dal file principale

## Tips and Tricks

1. **Visualizzare la versione di Bash**:
   ```bash
   echo $BASH_VERSION
   ```

2. **Verificare quale shell è in esecuzione**:
   ```bash
   echo $SHELL
   ```

3. **Cambiare temporaneamente shell**:
   ```bash
   exec zsh  # Passa a Zsh
   ```

4. **Eseguire un comando con una shell specifica**:
   ```bash
   bash -c "echo 'Questo comando è eseguito in Bash'"
   ```

5. **Verificare se uno script è eseguito in Bash**:
   ```bash
   if [ -z "${BASH_VERSION}" ]; then
     echo "Questo script richiede Bash"
     exit 1
   fi
   ```

## Domande di Autovalutazione

1. **Quale shell ha preceduto direttamente Bash e ha influenzato maggiormente la sua progettazione?**
   - A) C shell (csh)
   - B) Bourne shell (sh)
   - C) Korn shell (ksh)
   - D) TENEX C shell (tcsh)

2. **In che anno è stata rilasciata la prima versione di Bash?**
   - A) 1971
   - B) 1977
   - C) 1989
   - D) 1996

3. **Quale delle seguenti NON è una caratteristica che distingue le shell dai linguaggi di programmazione tradizionali?**
   - A) Orientamento ai comandi
   - B) Tipizzazione forte
   - C) Gestione del testo tramite pipe
   - D) Interattività

4. **Quale file di configurazione viene eseguito per le shell interattive non di login?**
   - A) ~/.bash_profile
   - B) ~/.bashrc
   - C) ~/.bash_logout
   - D) ~/.inputrc

5. **Quale comando permette di verificare la versione di Bash in uso?**
   - A) bash --version
   - B) echo $BASH
   - C) echo $BASH_VERSION
   - D) which bash

## Esercizi Proposti

1. **Installazione e verifica**: Installa Bash sul tuo sistema (se non è già presente) e verifica quale versione è installata.

2. **Personalizzazione del prompt**: Modifica il tuo prompt di Bash per includere l'ora corrente, la directory di lavoro e il nome utente, utilizzando colori diversi per ciascun elemento.

3. **Esplorazione dei file di configurazione**: Esamina i file di configurazione di Bash sul tuo sistema. Identifica quali alias e variabili d'ambiente sono già definiti.

4. **Shell switching**: Scrivi uno script che determini quale shell è attualmente in uso e mostri un messaggio appropriato.

5. **Ricerca storica**: Utilizza le risorse online per creare una timeline dell'evoluzione delle shell Unix, evidenziando le principali innovazioni introdotte da ciascuna.

## Risposte alle Domande di Autovalutazione

1. **B) Bourne shell (sh)** - La Bourne shell è stata il predecessore diretto di Bash, come suggerisce il nome "Bourne Again SHell".

2. **C) 1989** - Bash fu creata da Brian Fox per il Progetto GNU nel 1989.

3. **B) Tipizzazione forte** - Le shell, inclusa Bash, utilizzano principalmente stringhe e hanno un sistema di tipi molto semplice, non una tipizzazione forte.

4. **B) ~/.bashrc** - Questo file viene eseguito per le shell interattive non di login.

5. **C) echo $BASH_VERSION** - Questo comando mostra la versione di Bash attualmente in uso.