### Capitolo 7: Comandi avanzati e personalizzazione

Questo capitolo esplora l'uso di strumenti avanzati e tecniche di personalizzazione per migliorare l'efficienza e la potenza del Prompt dei comandi. Scoprirai come utilizzare PowerShell per eseguire comandi avanzati, personalizzare il Prompt dei comandi e integrare strumenti di terze parti per estendere le funzionalità.

#### Utilizzo di PowerShell per comandi avanzati

Windows PowerShell è un potente strumento a riga di comando e un linguaggio di scripting progettato per l'amministrazione di sistema. Offre funzionalità avanzate rispetto al Prompt dei comandi tradizionale.

- **Esecuzione di cmdlet**: I cmdlet sono comandi leggeri che eseguono operazioni specifiche. Ad esempio, `Get-Process` elenca i processi in esecuzione.
  ```powershell
  Get-Process
  ```

- **Pipeline**: PowerShell consente di passare l'output di un cmdlet come input a un altro cmdlet utilizzando il pipeline (`|`).
  ```powershell
  Get-Process | Where-Object { $_.CPU -gt 100 }
  ```

- **Scripting avanzato**: PowerShell supporta script complessi con controllo del flusso, variabili e funzioni.

#### Personalizzazione del Prompt dei comandi

- **Modifica del prompt**: Puoi personalizzare l'aspetto del prompt utilizzando il comando `prompt`.
  ```batch
  PROMPT $P$G
  ```
  - `$P`: Mostra il percorso corrente.
  - `$G`: Mostra il simbolo `>`.

- **Colori**: Utilizza il comando `color` per cambiare i colori del testo e dello sfondo.
  ```batch
  COLOR 0A
  ```
  - `0`: Sfondo nero.
  - `A`: Testo verde chiaro.

#### Gestione del prompt di PowerShell con profili

PowerShell permette di personalizzare il proprio ambiente attraverso l'uso dei profili:

```powershell
# Creare un nuovo profilo PowerShell se non esiste
if (!(Test-Path -Path $PROFILE)) {
    New-Item -ItemType File -Path $PROFILE -Force
}

# Modificare il profilo con Notepad
notepad $PROFILE
```

Esempio di contenuto del profilo:

```powershell
# Personalizzazione del prompt
function prompt {
    $currentDir = (Get-Location).Path
    $time = Get-Date -Format "HH:mm:ss"
    $prompt = "[$time] "
    $prompt += "PS $currentDir> "
    return $prompt
}

# Alias personalizzati
Set-Alias -Name ll -Value Get-ChildItem
Set-Alias -Name gs -Value git-status

# Funzioni di utilità
function git-status { git status }
function admin { Start-Process powershell -Verb RunAs }
```

#### Estensione delle funzionalità con strumenti di terze parti

- **Strumenti di terze parti**: Esistono numerosi strumenti che possono essere integrati con il Prompt dei comandi per estendere le sue funzionalità, come `Cygwin` per un ambiente Unix-like o `Git Bash` per l'uso di Git.

- **Plugin e script**: Puoi scaricare e utilizzare script e plugin creati dalla community per automatizzare compiti specifici.

#### Integrazione tra PowerShell e CMD

È possibile eseguire comandi CMD da PowerShell e viceversa:

- **Eseguire comandi CMD da PowerShell**:
  ```powershell
  cmd /c "dir /b"
  ```

- **Eseguire comandi PowerShell da CMD**:
  ```batch
  powershell -Command "Get-Process | Where-Object { $_.CPU -gt 100 }"
  ```

#### Personalizzazione avanzata di ConEmu/Cmder

[ConEmu](https://conemu.github.io/) e [Cmder](https://cmder.net/) sono applicazioni console avanzate che offrono un'esperienza migliorata rispetto al prompt dei comandi standard di Windows:

- Multiple schede e split-screen
- Supporto per temi e colori personalizzati
- Integrazione con Git e altri strumenti
- Shortcut personalizzabili
- Support per vari shell (CMD, PowerShell, Bash, ecc.)

#### Esempi di utilizzo avanzato

1. **Monitoraggio delle risorse di sistema**: Utilizza PowerShell per monitorare l'utilizzo della CPU e della memoria.
   ```powershell
   Get-WmiObject -Class Win32_OperatingSystem | Select-Object FreePhysicalMemory, TotalVisibleMemorySize
   ```

2. **Gestione remota**: Esegui comandi su computer remoti utilizzando PowerShell Remoting.
   ```powershell
   Enter-PSSession -ComputerName RemotePC -Credential Username
   ```

3. **Automazione delle attività di rete**: Configura e gestisci le impostazioni di rete utilizzando script PowerShell.

#### Best practice per l'uso avanzato

- **Sicurezza**: Esegui script e comandi avanzati con privilegi minimi necessari per ridurre i rischi di sicurezza.
- **Test**: Prova sempre gli script in un ambiente di test prima di eseguirli in produzione.
- **Documentazione**: Documenta le modifiche apportate al sistema e gli script utilizzati per facilitare la manutenzione e la risoluzione dei problemi.

#### Domande di autovalutazione

1. Quale strumento offre funzionalità avanzate rispetto al Prompt dei comandi tradizionale?
   a) CMD
   b) PowerShell
   c) Bash
   d) DOS

2. Quale comando viene utilizzato per personalizzare l'aspetto del prompt?
   a) `customize`
   b) `prompt`
   c) `format`
   d) `style`

3. Quale comando viene utilizzato per cambiare i colori del testo e dello sfondo nel Prompt dei comandi?
   a) `color`
   b) `theme`
   c) `display`
   d) `style`

#### Esercizi pratici

1. Crea uno script PowerShell che elenca tutti i processi in esecuzione e li filtra per quelli che utilizzano più di 100 MB di memoria.
2. Personalizza il prompt per mostrare solo il percorso corrente e il simbolo `>`.
3. Configura PowerShell Remoting per eseguire comandi su un computer remoto.
4. Utilizza uno strumento di terze parti per eseguire un'operazione avanzata, come la gestione delle versioni con Git.
5. Scrivi uno script PowerShell che monitora l'utilizzo della CPU e invia un avviso se supera una soglia specificata.

Questi esercizi ti aiuteranno a esplorare le funzionalità avanzate del Prompt dei comandi e di PowerShell, migliorando la tua capacità di gestire e automatizzare compiti complessi sui sistemi Windows. Buon lavoro!

---

**Navigazione:**
- [◀ Guida precedente: Risoluzione dei problemi con il Prompt dei comandi](<07 Risoluzione dei problemi con il Prompt dei comandi.md>)
- [🔼 Indice](<README.md>)
- [▶ Guida successiva: Glossario](<09 Glossario.md>)