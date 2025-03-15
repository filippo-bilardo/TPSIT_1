### Capitolo 1: Fondamenti del Prompt dei comandi

#### Cos'è il Prompt dei comandi

Il Prompt dei comandi, spesso abbreviato come CMD, è un'interfaccia a riga di comando integrata nei sistemi operativi Windows. Consente agli utenti di impartire comandi direttamente al sistema operativo tramite l'input di testo. A differenza delle interfacce grafiche (GUI), che sono visivamente intuitive ma spesso limitate nelle funzionalità avanzate, il Prompt dei comandi offre un controllo dettagliato e preciso sulle operazioni di sistema. È uno strumento potente per utenti avanzati e professionisti IT che necessitano di eseguire compiti complessi, automatizzare processi e risolvere problemi di sistema.

#### Come accedere al Prompt dei comandi

Accedere al Prompt dei comandi è semplice e può essere fatto in diversi modi:

1. **Menu Start**: Clicca sul pulsante Start e digita "cmd" nella barra di ricerca. Seleziona "Prompt dei comandi" dai risultati.
2. **Esegui**: Premi `Win + R` per aprire la finestra di dialogo Esegui, digita "cmd" e premi Invio.
3. **Esplora File**: Naviga in una cartella qualsiasi, tieni premuto il tasto `Shift` e fai clic con il tasto destro del mouse in uno spazio vuoto. Seleziona "Apri finestra Prompt dei comandi qui" dal menu contestuale.

#### Interfaccia e navigazione base

Quando apri il Prompt dei comandi, vedrai una finestra nera con del testo bianco. La riga che inizia con il percorso del disco (ad esempio, `C:\>`) è il prompt, dove digiterai i tuoi comandi.

- **Percorso attuale**: Il percorso mostrato nel prompt indica la directory corrente in cui ti trovi.
- **Navigazione**: Puoi spostarti tra le directory usando il comando `cd` (change directory). Ad esempio, `cd nomecartella` ti porterà nella cartella specificata.
- **Elenco dei file**: Il comando `dir` elenca i file e le directory nella posizione corrente.

#### Esempi di comandi di base

Ecco alcuni comandi di base che puoi utilizzare nel Prompt dei comandi:

- `echo`: Visualizza un messaggio di testo. Ad esempio, `echo Ciao, mondo!`.
- `cls`: Pulisce lo schermo, rimuovendo tutto il testo visualizzato.
- `copy`: Copia un file da una posizione a un'altra. Ad esempio, `copy file.txt C:\Destinazione`.
- `del`: Cancella uno o più file. Ad esempio, `del file.txt`.
- `mkdir`: Crea una nuova directory. Ad esempio, `mkdir NuovaCartella`.
- `rmdir`: Rimuove una directory vuota. Ad esempio, `rmdir NuovaCartella`.

#### Best practice per l'uso del Prompt dei comandi

- **Conosci i tuoi comandi**: Familiarizza con i comandi di base e le loro opzioni per essere più efficiente.
- **Usa il tasto Tab**: Il completamento automatico con il tasto Tab può risparmiare tempo e ridurre gli errori di battitura.
- **Documenta gli script**: Se scrivi script batch, documenta il codice per renderlo più comprensibile a te e agli altri.
- **Esegui come amministratore**: Alcuni comandi richiedono privilegi elevati. In questi casi, esegui il Prompt dei comandi come amministratore.

#### Tip and tricks per principianti

- **Usa i tasti freccia**: I tasti freccia su e giù ti permettono di scorrere tra i comandi precedentemente eseguiti.
- **Comandi di aiuto**: La maggior parte dei comandi supporta l'opzione `/?` per visualizzare la guida. Ad esempio, `dir /?`.
- **Personalizza il prompt**: Puoi personalizzare l'aspetto del prompt usando il comando `prompt`. Ad esempio, `prompt $p$g` mostra il percorso corrente e il simbolo `>`.

#### Domande di autovalutazione

1. Qual è il comando utilizzato per cambiare directory nel Prompt dei comandi?
   a) `move`
   b) `cd`
   c) `dir`
   d) `copy`

2. Come si cancella un file nel Prompt dei comandi?
   a) `delete`
   b) `del`
   c) `remove`
   d) `erase`

3. Quale comando elenca i file e le directory nella posizione corrente?
   a) `list`
   b) `dir`
   c) `show`
   d) `view`

#### Esercizi pratici

1. Apri il Prompt dei comandi e naviga fino alla directory `Documenti`.
2. Crea una nuova directory chiamata `Test` all'interno della directory `Documenti`.
3. Copia un file dalla tua scrivania alla directory `Test`.
4. Elenca i file nella directory `Test` e poi cancella il file che hai copiato.
5. Personalizza il prompt per mostrare solo il simbolo `>`.

Questi esercizi ti aiuteranno a familiarizzare con i comandi di base e a migliorare la tua efficienza nell'uso del Prompt dei comandi. Buon lavoro!