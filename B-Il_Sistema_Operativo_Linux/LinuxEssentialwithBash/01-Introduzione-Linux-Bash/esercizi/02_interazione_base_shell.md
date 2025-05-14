# Esercizio: Interazione di Base con la Shell

**Obiettivo:** Approfondire l'interazione con la shell Bash, includendo l'uso dell'history dei comandi, il completamento automatico e la gestione di output semplici.

## Parte 1: Cronologia dei Comandi (History)

1.  **Apri il terminale.**
2.  **Esegui alcuni comandi:** Digita ed esegui i seguenti comandi, uno alla volta:
    *   `pwd`
    *   `ls`
    *   `date`
    *   `whoami`
    *   `echo "Sto imparando la Bash!"`
3.  **Visualizzare la cronologia:**
    *   Usa il comando `history` per visualizzare l'elenco dei comandi che hai appena eseguito.
    *   Nota i numeri associati a ciascun comando.
4.  **Richiamare comandi dalla cronologia:**
    *   Premi il tasto **Freccia Su** più volte. Cosa succede? Riesci a navigare tra i comandi precedenti?
    *   Premi il tasto **Freccia Giù** per tornare ai comandi più recenti.
    *   Digita `!numero` (sostituendo `numero` con il numero di un comando visualizzato da `history`, ad esempio `!5` se il quinto comando era `date`) e premi Invio. Cosa succede?
    *   Digita `!!` e premi Invio. Quale comando viene eseguito?
    *   Digita `!echo` (o le prime lettere di un comando precedente, come `!ls`) e premi Invio. Cosa fa?
5.  **Cercare nella cronologia:**
    *   Premi `Ctrl+R`. Inizia a digitare una parte di un comando che hai usato prima (es. `dat`). Cosa vedi? Premi Invio per eseguirlo o `Ctrl+C` per annullare.

## Parte 2: Completamento Automatico (Tab Completion)

1.  **Navigare con il completamento:**
    *   Assicurati di essere nella tua directory home (`cd ~`).
    *   Digita `cd Doc` e premi il tasto **Tab**. Se hai una directory che inizia con "Doc" (es. Documenti), la shell dovrebbe completare il nome. Se ce ne sono più, premi Tab due volte per vederle tutte.
    *   Prova a navigare in altre directory usando il completamento con Tab (es. `/usr/bi` e poi Tab).
2.  **Completamento dei comandi:**
    *   Digita `mkd` e premi **Tab**. La shell dovrebbe completare a `mkdir`.
    *   Digita `tou` e premi **Tab**.
3.  **Completamento delle opzioni dei comandi:**
    *   Digita `ls -` e premi **Tab** due volte. Dovresti vedere un elenco di possibili opzioni per il comando `ls`.

## Parte 3: Gestione Semplice dell'Output

1.  **Comandi con output lungo:**
    *   Esegui `ls /etc`. L'output potrebbe essere molto lungo.
2.  **Paginazione dell'output con `less`:**
    *   Esegui `ls /etc | less`. Ora puoi scorrere l'output usando i tasti freccia, PagSu/PagGiù. Premi `q` per uscire da `less`.
    *   Il simbolo `|` (pipe) reindirizza l'output del comando `ls /etc` come input per il comando `less`.
3.  **Contare le righe con `wc -l`:**
    *   Esegui `history | wc -l`. Cosa mostra questo comando?
    *   `wc -l` conta il numero di righe dell'input che riceve.

## Domande di Riflessione

*   Quanto può essere utile la cronologia dei comandi per evitare di ridigitare comandi lunghi o complessi?
*   In che modo il completamento automatico con Tab può accelerare il tuo lavoro e ridurre gli errori di battitura?
*   Cosa significa il simbolo `|` (pipe) in Bash? Prova a pensare ad altri usi.
*   Come potresti usare `less` per visualizzare il contenuto di un file di testo molto lungo?

## Obiettivi di Apprendimento

Al termine di questo esercizio, dovresti essere in grado di:

*   Utilizzare e navigare la cronologia dei comandi (`history`, Freccia Su/Giù, `!n`, `!!`, `!stringa`, `Ctrl+R`).
*   Sfruttare il completamento automatico con il tasto Tab per comandi, percorsi e opzioni.
*   Comprendere il concetto base di reindirizzamento dell'output usando la pipe (`|`).
*   Utilizzare `less` per visualizzare output lunghi in modo paginato.
*   Utilizzare `wc -l` per contare le righe di un output.