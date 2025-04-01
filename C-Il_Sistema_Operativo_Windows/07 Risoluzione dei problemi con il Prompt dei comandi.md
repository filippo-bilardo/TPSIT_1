### Capitolo 6: Risoluzione dei problemi con il Prompt dei comandi

Il Prompt dei comandi è uno strumento potente per la diagnostica e la risoluzione dei problemi di sistema. Questo capitolo esplora i comandi e le tecniche utilizzati per identificare e risolvere problemi comuni sui sistemi Windows.

#### Comandi per la diagnostica di sistema

- **`chkdsk`**: Controlla l'integrità del disco e ripara eventuali errori.
  ```batch
  CHKDSK C: /F /R
  ```
  - `/F`: Ripara gli errori sul disco.
  - `/R`: Localizza i settori danneggiati e recupera i dati leggibili.

- **`sfc` (System File Checker)**: Verifica e ripara i file di sistema corrotti.
  ```batch
  SFC /SCANNOW
  ```

- **`DISM` (Deployment Imaging Service and Management Tool)**: Utilizzato per riparare l'immagine di sistema.
  ```batch
  DISM /Online /Cleanup-Image /RestoreHealth
  ```

#### Risoluzione dei problemi di rete

- **`ping`**: Testa la connettività di rete verso un host specifico.
  ```batch
  PING google.com
  ```

- **`ipconfig`**: Visualizza la configurazione di rete corrente.
  ```batch
  IPCONFIG /ALL
  ```

- **`netstat`**: Mostra le connessioni di rete attive e le porte di ascolto.
  ```batch
  NETSTAT -AN
  ```

- **`tracert`**: Traccia il percorso verso un host per identificare punti di interruzione.
  ```batch
  TRACERT google.com
  ```

#### Utilizzo di log e report per la risoluzione dei problemi

- **Event Viewer**: Utilizza `wevtutil` per esportare i log degli eventi di sistema.
  ```batch
  WEVTUTIL EPL System C:\Logs\System.evtx
  ```

- **Report di sistema**: Genera un report di sistema utilizzando `systeminfo`.
  ```batch
  SYSTEMINFO > report_sistema.txt
  ```

#### Tool di diagnostica avanzati

Windows include diversi strumenti di diagnostica avanzata che possono essere eseguiti dal Prompt dei comandi:

- **Memory Diagnostic Tool**:
  ```batch
  mdsched
  ```

- **DirectX Diagnostic Tool**:
  ```batch
  dxdiag
  ```

- **Resource Monitor**:
  ```batch
  resmon
  ```

- **Performance Monitor**:
  ```batch
  perfmon
  ```

#### Risoluzione dei problemi di avvio

Se Windows non si avvia normalmente, è possibile utilizzare il Prompt dei comandi da una console di ripristino:

- **Riparazione del boot record**:
  ```batch
  bootrec /rebuildbcd
  bootrec /fixmbr
  bootrec /fixboot
  ```

- **Ripristino di Windows Update**:
  ```batch
  net stop wuauserv
  net stop cryptSvc
  net stop bits
  net stop msiserver
  ren C:\Windows\SoftwareDistribution SoftwareDistribution.old
  ren C:\Windows\System32\catroot2 catroot2.old
  net start wuauserv
  net start cryptSvc
  net start bits
  net start msiserver
  ```

#### Script per la raccolta di informazioni diagnostiche

```batch
@echo off
SET reportfile=C:\diagnostics_%computername%_%date:~-4%-%date:~7,2%-%date:~4,2%.txt

ECHO Creazione del report diagnostico in %reportfile%
ECHO ========== INFORMAZIONI DI SISTEMA ========== > %reportfile%
systeminfo >> %reportfile%

ECHO ========== SERVIZI IN ESECUZIONE ========== >> %reportfile%
net start >> %reportfile%

ECHO ========== CONNESSIONI DI RETE ========== >> %reportfile%
ipconfig /all >> %reportfile%
netstat -an >> %reportfile%

ECHO ========== TABELLA DI ROUTING ========== >> %reportfile%
route print >> %reportfile%

ECHO ========== PROCESSI IN ESECUZIONE ========== >> %reportfile%
tasklist /v >> %reportfile%

ECHO ========== DRIVER INSTALLATI ========== >> %reportfile%
driverquery >> %reportfile%

ECHO Report diagnostico completato.
```

#### Esempi di risoluzione dei problemi comuni

1. **File di sistema corrotti**: Esegui `sfc /scannow` per riparare i file di sistema corrotti.
2. **Errori del disco**: Utilizza `chkdsk` per riparare errori del disco.
3. **Problemi di connettività**: Usa `ping` e `tracert` per diagnosticare problemi di rete.

#### Best practice per la risoluzione dei problemi

- **Documentazione**: Documenta sempre i passaggi eseguiti durante la risoluzione dei problemi.
- **Backup**: Esegui un backup dei dati importanti prima di eseguire comandi di riparazione.
- **Test**: Testa le soluzioni in un ambiente sicuro prima di applicarle su un sistema di produzione.

#### Domande di autovalutazione

1. Quale comando viene utilizzato per controllare l'integrità del disco?
   a) `chkdsk`
   b) `diskcheck`
   c) `fsck`
   d) `diskrepair`

2. Quale strumento viene utilizzato per riparare i file di sistema corrotti?
   a) `sfc`
   b) `repair`
   c) `fixsys`
   d) `chkfile`

3. Quale comando viene utilizzato per tracciare il percorso verso un host?
   a) `tracert`
   b) `pathping`
   c) `route`
   d) `nettrace`

#### Esercizi pratici

1. Esegui `chkdsk` su una partizione non di sistema per verificare e riparare eventuali errori.
2. Utilizza `sfc /scannow` per controllare e riparare i file di sistema corrotti.
3. Diagnostica un problema di connettività di rete utilizzando `ping` e `tracert`.
4. Esporta i log degli eventi di sistema utilizzando `wevtutil`.
5. Genera un report di sistema completo utilizzando `systeminfo`.

Questi esercizi ti aiuteranno a migliorare le tue competenze nella risoluzione dei problemi utilizzando il Prompt dei comandi, rendendoti più sicuro nell'affrontare e risolvere problemi comuni sui sistemi Windows. Buon lavoro!

---

**Navigazione:**
- [◀ Guida precedente: Automazione e pianificazione dei task](<06 Automazione e pianificazione dei task.md>)
- [🔼 Indice](<README.md>)
- [▶ Guida successiva: Comandi avanzati e personalizzazione](<08 Comandi avanzati e personalizzazione.md>)