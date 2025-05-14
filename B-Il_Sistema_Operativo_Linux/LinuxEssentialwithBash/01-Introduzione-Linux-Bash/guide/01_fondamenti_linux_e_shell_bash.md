# Fondamenti di Linux e della Shell Bash

Linux è un sistema operativo open source molto diffuso, noto per la sua stabilità, sicurezza e flessibilità. Viene utilizzato su server, desktop, dispositivi embedded e supercomputer. Comprendere Linux significa conoscere la sua architettura, il funzionamento del kernel, le distribuzioni e le modalità di interazione tramite shell.

## Storia e Filosofia di Linux
Linux nasce nel 1991 grazie a Linus Torvalds come alternativa libera e gratuita ai sistemi UNIX. La filosofia open source permette a chiunque di studiare, modificare e distribuire il codice, favorendo una comunità globale di sviluppatori e utenti.

## Architettura di Linux
- **Kernel**: il cuore del sistema operativo, gestisce risorse hardware, processi, memoria e dispositivi.
- **Shell**: l'interfaccia che permette all'utente di comunicare con il kernel tramite comandi testuali.
- **File System**: struttura gerarchica che organizza file e directory.
- **Utility e Applicazioni**: strumenti e programmi che estendono le funzionalità di base.

## Distribuzioni Linux
Una distribuzione (distro) è un insieme di software che include kernel, shell, utility e strumenti di gestione. Esempi: Ubuntu, Fedora, Debian, CentOS, Arch Linux. Ogni distribuzione può differire per gestione dei pacchetti, strumenti di amministrazione e filosofia. Alcune sono pensate per utenti alle prime armi (Ubuntu), altre per esperti (Arch Linux).

### Differenze tra distribuzioni
- **Gestione dei pacchetti**: apt (Debian/Ubuntu), yum/dnf (Fedora/CentOS), pacman (Arch)
- **Target di utilizzo**: desktop, server, embedded
- **Ciclo di rilascio**: rolling release vs. versioni stabili

## Shell e Bash
- **Shell**: interprete dei comandi che consente l'interazione tra utente e sistema. Esistono diverse shell: Bash, Zsh, Fish, Dash, ecc.
- **Bash** (Bourne Again SHell): la shell più diffusa su Linux, potente e flessibile, ideale per scripting e automazione.

### Differenze tra shell
- **Bash**: compatibile con la Bourne Shell, supporta scripting avanzato.
- **Zsh**: offre funzionalità avanzate come il completamento automatico esteso.
- **Fish**: user-friendly, con sintassi moderna.

## Perché imparare Bash?
- Automatizzazione di compiti ripetitivi
- Maggiore controllo sul sistema
- Fondamentale per amministratori di sistema e sviluppatori
- Possibilità di scrivere script per gestire backup, monitoraggio, installazioni, ecc.

## Il Prompt della Shell
Il prompt della shell è la stringa di testo visualizzata dalla shell che indica che è pronta a ricevere un comando. Solitamente include informazioni utili come il nome utente, il nome dell'host e la directory corrente.

Esempio di prompt comune:
```
utente@host:~/percorso/corrente$
```
- `utente`: il nome dell'utente loggato.
- `host`: il nome del computer.
- `~/percorso/corrente`: la directory di lavoro attuale (`~` rappresenta la home directory dell'utente).
- `$`: un carattere che indica che la shell è pronta per un input da un utente non privilegiato (per l'utente root, di solito è `#`).

### Personalizzazione del Prompt (Variabile PS1)
In Bash, il prompt è controllato principalmente dalla variabile d'ambiente `PS1`. Modificando il valore di `PS1`, è possibile personalizzare l'aspetto e le informazioni visualizzate nel prompt.

Ad esempio, per visualizzare solo il nome utente e la directory corrente:
```bash
export PS1="\u:\w\$ "
```
- `\u`: nome utente
- `\w`: directory di lavoro corrente (completa)
- `\$`: mostra `$` per utenti normali, `#` per root

Esistono molte altre sequenze speciali per personalizzare `PS1`. Puoi rendere il tuo prompt colorato, aggiungere l'ora, lo stato di Git e molto altro.

## Ciclo di vita di un comando
1. L'utente digita un comando nella shell.
2. La shell interpreta il comando e lo passa al kernel.
3. Il kernel esegue il comando e restituisce l'output.
4. La shell mostra l'output all'utente.

## Comandi di base e casi pratici
- `pwd`: mostra la directory corrente
- `ls`: elenca i file nella directory
- `cd`: cambia directory
- `echo`: stampa testo a schermo
- `man <comando>`: mostra il manuale del comando

### Esempio pratico
```bash
pwd
ls -l
cd /tmp
echo "Benvenuto su Linux!"
man ls
```

## Casi d'uso reali
- Navigare tra directory e file
- Automatizzare backup con script Bash
- Monitorare risorse di sistema con comandi come `top`, `htop`, `free`, `df`
- Gestire permessi e utenti

## Approfondimenti
- Esplora la differenza tra shell interattiva e shell di scripting
- Prova a installare una nuova shell (es. zsh) e confrontala con Bash
- Consulta la documentazione ufficiale di Bash: https://www.gnu.org/software/bash/manual/bash.html

## Domande di riflessione
- Quali vantaggi offre Linux rispetto ad altri sistemi operativi?
- In quali ambiti è preferibile utilizzare Linux?
- Quali sono le principali differenze tra le shell disponibili?

## Risorse utili
- [Linux Journey](https://linuxjourney.com/)
- [The Linux Command Line](https://linuxcommand.org/)
- [Bash Guide for Beginners](https://tldp.org/LDP/Bash-Beginners-Guide/html/)