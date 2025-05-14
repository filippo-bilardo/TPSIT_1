# Esercizi Pratici - Modulo 1

## Esercizio 1: Esplorazione del Terminale
1. Apri un terminale utilizzando la scorciatoia da tastiera del tuo sistema (spesso Ctrl+Alt+T)
2. Esegui il comando `echo $SHELL` per verificare quale shell stai utilizzando
3. Esegui il comando `bash --version` per vedere la versione di Bash installata
4. Usa `help` per visualizzare i comandi Bash integrati
5. Usa `history` per vedere i comandi recentemente digitati

## Esercizio 2: Navigazione Base del Filesystem
1. Esegui `pwd` per vedere in quale directory ti trovi attualmente
2. Usa `ls` per elencare i file nella directory corrente
3. Esegui `ls -la` per vedere tutti i file (inclusi quelli nascosti) con dettagli
4. Naviga alla directory home con `cd ~` o semplicemente `cd`
5. Naviga alla directory root con `cd /` e osserva i contenuti con `ls`
6. Torna alla directory precedente con `cd -`

## Esercizio 3: Uso della Documentazione
1. Usa `man ls` per leggere il manuale del comando ls
2. Premi `q` per uscire dalla pagina man
3. Usa `ls --help` per vedere una spiegazione concisa delle opzioni
4. Esegui `apropos directory` per vedere i comandi correlati alle directory
5. Usa `whatis pwd` per vedere una breve descrizione del comando pwd

## Esercizio 4: Prima Interazione con i File
1. Crea una directory di prova con `mkdir test_linux`
2. Naviga in quella directory con `cd test_linux`
3. Crea un file vuoto con `touch mio_primo_file.txt`
4. Aggiungi del testo al file con `echo "Sto imparando Linux!" > mio_primo_file.txt`
5. Visualizza il contenuto del file con `cat mio_primo_file.txt`
6. Aggiungi altra testo senza sovrascrivere con `echo "La shell Bash è potente." >> mio_primo_file.txt`
7. Visualizza di nuovo il contenuto del file con `cat mio_primo_file.txt`

## Esercizio 5: Informazioni di Sistema
1. Esegui `uname -a` per vedere informazioni complete sul kernel
2. Usa `lsb_release -a` o `cat /etc/os-release` per vedere la distribuzione in uso
3. Visualizza l'uso della memoria con `free -h`
4. Controlla lo spazio su disco con `df -h`
5. Verifica quanto tempo è passato dall'ultimo riavvio con `uptime`

## Sfida Bonus: Personalizzazione
1. Crea un alias per un comando comune:
   ```bash
   alias ll='ls -la'
   ```
2. Usa il nuovo alias e verifica che funzioni
3. Aggiungi questo alias al file `~/.bashrc` per renderlo permanente:
   ```bash
   echo "alias ll='ls -la'" >> ~/.bashrc
   ```
4. Forza il ricaricamento del file .bashrc con `source ~/.bashrc`

## Verifica di Apprendimento
- Quali sono i comandi principali che hai imparato?
- Qual è la differenza tra `>` e `>>`?
- Come si ottiene aiuto su un comando specifico?
- Quale comando mostra la directory di lavoro corrente?
- Come si creano nuove directory in Linux?
