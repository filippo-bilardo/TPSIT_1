# Esercizi Pratici sui Comandi del File System

## Esercizio 1: Navigazione e Visualizzazione
1. Apri un terminale
2. Naviga alla tua directory home (`cd ~`)
3. Crea una directory chiamata `esercizi_linux` (`mkdir esercizi_linux`)
4. Entra nella directory appena creata (`cd esercizi_linux`)
5. Crea tre sottodirectory: `documenti`, `immagini` e `script` (`mkdir documenti immagini script`)
6. Verifica la struttura creata usando il comando `ls -la`
7. Visualizza il percorso completo della directory corrente (`pwd`)
8. Torna alla directory superiore (`cd ..`) e poi rientra in `esercizi_linux` usando un percorso relativo

## Esercizio 2: Creazione e Manipolazione di File
1. Entra nella directory `documenti` (`cd documenti`)
2. Crea un file di testo vuoto chiamato `note.txt` (`touch note.txt`)
3. Aggiungi del testo al file (`echo "Questo è un file di esercizio." > note.txt`)
4. Visualizza il contenuto del file (`cat note.txt`)
5. Aggiungi una seconda riga al file senza sovrascrivere la prima (`echo "Sto imparando i comandi Linux." >> note.txt`)
6. Visualizza nuovamente il contenuto del file
7. Crea un secondo file chiamato `note2.txt` con una riga di testo
8. Concatena i due file e visualizza il risultato (`cat note.txt note2.txt`)

## Esercizio 3: Copia, Spostamento e Rinomina
1. Torna alla directory `esercizi_linux` (`cd ..`)
2. Copia il file `note.txt` dalla directory `documenti` alla directory `immagini` (`cp documenti/note.txt immagini/`)
3. Entra nella directory `immagini` e rinomina il file in `appunti.txt` (`mv note.txt appunti.txt`)
4. Torna alla directory `esercizi_linux`
5. Sposta il file `note2.txt` dalla directory `documenti` alla directory `script` (`mv documenti/note2.txt script/`)
6. Verifica che i file siano nelle nuove posizioni usando comandi `ls`

## Esercizio 4: Ricerca di File
1. Crea diversi file in diverse sottodirectory:
   ```bash
   touch documenti/doc1.txt documenti/doc2.txt
   touch immagini/img1.jpg immagini/img2.jpg
   touch script/script1.sh script/script2.sh
   ```
2. Rendi eseguibili i file script:
   ```bash
   chmod +x script/script1.sh script/script2.sh
   ```
3. Cerca tutti i file `.txt` nella directory `esercizi_linux` e sottodirectory (`find . -name "*.txt"`)
4. Cerca tutti i file che sono stati modificati nelle ultime 24 ore (`find . -type f -mtime -1`)
5. Cerca tutti i file eseguibili (`find . -type f -executable`)
6. Se hai installato `locate`, aggiorna il database (`sudo updatedb`) e usa `locate` per trovare alcuni dei file creati

## Esercizio 5: Visualizzazione Avanzata dei File
1. Crea un file di testo con almeno 20 righe:
   ```bash
   for i in {1..20}; do
       echo "Questa è la riga numero $i del file di test." >> documenti/file_lungo.txt
   done
   ```
2. Visualizza le prime 5 righe del file (`head -n 5 documenti/file_lungo.txt`)
3. Visualizza le ultime 3 righe del file (`tail -n 3 documenti/file_lungo.txt`)
4. Visualizza il file con numerazione di riga (`cat -n documenti/file_lungo.txt`)
5. Apri il file con `less` e prova a navigare (usa q per uscire)

## Esercizio 6: Archiviazione e Compressione
1. Crea un archivio tar contenente la directory `documenti`:
   ```bash
   tar -cvf documenti.tar documenti/
   ```
2. Visualizza il contenuto dell'archivio senza estrarlo:
   ```bash
   tar -tvf documenti.tar
   ```
3. Crea una directory `estratti` e estrai l'archivio in quella directory:
   ```bash
   mkdir estratti
   tar -xvf documenti.tar -C estratti/
   ```
4. Crea un archivio compresso della directory `immagini`:
   ```bash
   tar -czvf immagini.tar.gz immagini/
   ```
5. Confronta le dimensioni dei due archivi:
   ```bash
   ls -lh documenti.tar immagini.tar.gz
   ```

## Esercizio 7: Link e Permessi
1. Crea un file di testo chiamato `originale.txt` con del contenuto:
   ```bash
   echo "Questo è il file originale" > originale.txt
   ```
2. Crea un hard link a questo file:
   ```bash
   ln originale.txt hard_link.txt
   ```
3. Crea un link simbolico allo stesso file:
   ```bash
   ln -s originale.txt symbolic_link.txt
   ```
4. Modifica il contenuto del file originale e verifica che i cambiamenti siano visibili attraverso entrambi i link
5. Cambia i permessi del file originale per renderlo di sola lettura:
   ```bash
   chmod 444 originale.txt
   ```
6. Prova a modificare il file e osserva cosa succede
7. Ripristina i permessi per consentire la scrittura:
   ```bash
   chmod 644 originale.txt
   ```

## Esercizio 8: Pipeline e Redirezione
1. Crea un file con un elenco di nomi (uno per riga):
   ```bash
   cat > nomi.txt << EOF
   Marco
   Giulia
   Andrea
   Marco
   Sofia
   Luca
   Andrea
   EOF
   ```
2. Conta quante righe contiene il file:
   ```bash
   wc -l nomi.txt
   ```
3. Ordina i nomi alfabeticamente e salva il risultato in un nuovo file:
   ```bash
   sort nomi.txt > nomi_ordinati.txt
   ```
4. Rimuovi i duplicati dall'elenco ordinato:
   ```bash
   sort nomi.txt | uniq > nomi_unici.txt
   ```
5. Conta quanti nomi unici ci sono:
   ```bash
   wc -l nomi_unici.txt
   ```
6. Cerca un nome specifico nel file e redirigi eventuali errori:
   ```bash
   grep "Marco" nomi.txt > trovati.txt 2> errori.txt
   ```

## Esercizio Bonus: Script di Automazione
1. Crea uno script Bash che automatizzi la creazione di una struttura di directory:
   ```bash
   cat > crea_struttura.sh << 'EOF'
   #!/bin/bash
   # Script per creare una struttura di directory per un progetto

   if [ $# -ne 1 ]; then
       echo "Uso: $0 nome_progetto"
       exit 1
   fi

   PROGETTO=$1
   echo "Creazione struttura per il progetto: $PROGETTO"

   mkdir -p $PROGETTO/{src,docs,tests,resources}
   touch $PROGETTO/README.md
   echo "# Progetto $PROGETTO" > $PROGETTO/README.md
   echo "Creato il: $(date)" >> $PROGETTO/README.md

   echo "Struttura creata con successo:"
   find $PROGETTO -type d | sort
   echo ""
   echo "File creati:"
   find $PROGETTO -type f | sort

   echo "Fatto!"
   EOF
   ```

2. Rendi lo script eseguibile:
   ```bash
   chmod +x crea_struttura.sh
   ```

3. Esegui lo script per creare un nuovo progetto:
   ```bash
   ./crea_struttura.sh mio_progetto
   ```

4. Esplora la struttura creata

## Verifica di Apprendimento
- Quali comandi hai trovato più utili?
- Quali sono le differenze tra hard link e symbolic link?
- Come puoi trovare rapidamente file in base a criteri specifici?
- Come puoi combinare comandi per eseguire operazioni complesse?
- Quali opzioni dei comandi hai trovato più utili?
