# Esercizio: Comandi Shell Essenziali

**Obiettivo:** Familiarizzare con alcuni dei comandi Bash più comuni e utili per l'interazione quotidiana con il sistema Linux.

## Parte 1: Informazioni di Sistema e Utente

1.  **Apri il terminale.**
2.  **Chi sei?**
    *   Usa il comando `whoami` per visualizzare il tuo nome utente corrente.
3.  **Dove sei?**
    *   Usa il comando `pwd` per stampare la directory di lavoro corrente.
4.  **Che ore sono?**
    *   Usa il comando `date` per visualizzare la data e l'ora correnti.
    *   Prova `date +%Y-%m-%d` per un formato specifico. Cosa noti?
5.  **Informazioni sul sistema:**
    *   Usa `uname` per visualizzare il nome del sistema operativo.
    *   Prova `uname -a` per informazioni più dettagliate (kernel, architettura, ecc.).

## Parte 2: Visualizzare Contenuto e Manuali

1.  **Visualizzare un messaggio:**
    *   Usa il comando `echo "Ciao Mondo!"` per stampare una stringa sul terminale.
    *   Prova `echo "La mia directory corrente è: $(pwd)"`. Cosa fa `$(pwd)`?
2.  **Pulire lo schermo:**
    *   Usa il comando `clear` per pulire la finestra del terminale.
3.  **Ottenere aiuto (Manuali):**
    *   Visualizza la pagina di manuale per il comando `ls` usando `man ls`.
    *   Scorri la pagina usando i tasti freccia, PagSu/PagGiù. Esci premendo `q`.
    *   Cerca una parola chiave all'interno del manuale (es. `/sort` per cercare "sort").
    *   Prova a visualizzare il manuale di `echo` e `date`.

## Parte 3: Creazione e Gestione Semplice di File e Directory

1.  **Creare una directory:**
    *   Crea una nuova directory chiamata `miadir_esercizi` usando `mkdir miadir_esercizi`.
2.  **Entrare nella directory:**
    *   Spostati nella directory `miadir_esercizi` con `cd miadir_esercizi`.
    *   Verifica di essere nella directory corretta con `pwd`.
3.  **Creare un file vuoto:**
    *   Crea un file vuoto chiamato `miofile.txt` usando `touch miofile.txt`.
4.  **Elencare il contenuto:**
    *   Usa `ls` per vedere il file appena creato.
    *   Prova `ls -l` per un output più dettagliato. Cosa significano le colonne?
5.  **Tornare indietro:**
    *   Torna alla directory precedente (quella da cui hai creato `miadir_esercizi`) usando `cd ..`.

## Domande di Riflessione

*   Qual è la differenza tra `uname` e `uname -a`?
*   Come puoi usare `echo` per visualizzare il valore di una variabile d'ambiente come `USER` o `HOME`? (Suggerimento: `echo $NOME_VARIABILE`)
*   Perché le pagine `man` sono così importanti quando si lavora con la shell?
*   Cosa succede se provi a creare una directory che esiste già con `mkdir`?

## Obiettivi di Apprendimento

Al termine di questo esercizio, dovresti essere in grado di:

*   Utilizzare comandi per ottenere informazioni sull'utente e sul sistema (`whoami`, `pwd`, `date`, `uname`).
*   Stampare messaggi sul terminale (`echo`).
*   Consultare la documentazione dei comandi (`man`).
*   Creare directory (`mkdir`) e file vuoti (`touch`).
*   Navigare tra directory (`cd`).
*   Elencare il contenuto delle directory (`ls`).
*   Comprendere l'importanza di esplorare le opzioni dei comandi.