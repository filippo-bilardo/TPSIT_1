# Esercizi del Modulo 3: Gestione di Utenti e Permessi

Questa cartella contiene esercizi pratici per consolidare la comprensione della gestione degli utenti, dei gruppi e dei permessi dei file in ambiente Linux.

## Elenco degli Esercizi e Script:

1.  **`01_crea_utente_fittizio.sh`**:
    *   **Scopo:** Questo script probabilmente contiene i comandi per creare un utente fittizio nel sistema. Potrebbe essere un esercizio che richiede di analizzare lo script, completarlo, o eseguirlo (con i dovuti privilegi) per poi svolgere altre operazioni sull'utente creato.
    *   **Come utilizzarlo:** Analizzare lo script. Se l'esercizio lo richiede, eseguirlo con `sudo bash 01_crea_utente_fittizio.sh`. Assicurarsi di capire come rimuovere l'utente (`userdel`) al termine dell'esercizio.

2.  **`01_gestione_utenti_permessi_esercizi.sh`** (o file Markdown se il nome è fuorviante):
    *   **Scopo:** Questo file (che sia uno script o un Markdown con istruzioni) dovrebbe contenere una serie di esercizi pratici.
        *   Se è uno **script**, potrebbe essere uno script interattivo che guida l'utente attraverso vari task, oppure uno script da completare.
        *   Se fosse un **file Markdown** (nonostante l'estensione `.sh`), conterrebbe le istruzioni testuali per gli esercizi.
    *   **Obiettivi Comuni:** Creare utenti e gruppi, modificare appartenenze ai gruppi, impostare e verificare permessi su file e directory, utilizzare `sudo`.
    *   **Come Svolgerlo:** Seguire le istruzioni contenute nel file. Potrebbe essere necessario creare file e directory di prova.

## Suggerimenti per Esercizi Aggiuntivi (da creare come file `.md`):

*   **Esercizio sui Permessi di Base:**
    *   Creare una struttura di file e directory.
    *   Impostare permessi specifici (es. una directory accessibile solo da un utente, un file leggibile da un gruppo ma scrivibile solo dal proprietario).
    *   Verificare i permessi usando `ls -l` e tentare accessi (leciti e illeciti).
*   **Esercizio su `chmod` (Notazione Ottale e Simbolica):**
    *   Dato un set di permessi desiderati (es. `rwxr-x--x`), tradurli in notazione ottale e applicarli a un file.
    *   Viceversa, data una notazione ottale, descrivere i permessi risultanti.
    *   Usare la notazione simbolica per aggiungere/rimuovere permessi specifici senza alterare gli altri.
*   **Esercizio su `chown` e `chgrp`:**
    *   Creare file e directory.
    *   Cambiare il proprietario e il gruppo di questi file/directory (potrebbe richiedere `sudo` o la creazione di utenti/gruppi fittizi).
*   **Esercizio sui Permessi Speciali (SUID, SGID, Sticky Bit):**
    *   Spiegare lo scopo di ciascun permesso speciale.
    *   Trovare esempi di file di sistema che usano questi permessi (es. `passwd` per SUID, `/var/mail` o directory condivise per SGID/Sticky Bit) e spiegare perché.
    *   (Avanzato) Creare uno scenario di test per dimostrare l'effetto di SUID/SGID.
*   **Esercizio su `sudo`:**
    *   (Teorico o pratico se si ha accesso a `sudoers`) Spiegare come `sudo` permette a utenti normali di eseguire comandi come root.
    *   Analizzare una semplice regola in `/etc/sudoers`.

## Ambiente di Lavoro Sicuro:

*   Quando si eseguono comandi che modificano utenti, gruppi o permessi di sistema (specialmente con `sudo`), è fondamentale capire cosa fa ogni comando.
*   Per gli esercizi di creazione utenti/gruppi, usare nomi fittizi e ricordarsi di eliminarli al termine (`userdel nome_utente`, `groupdel nome_gruppo`).
*   Per gli esercizi sui permessi, operare all'interno di una directory di test creata appositamente (es. `mkdir ~/esercizi_permessi && cd ~/esercizi_permessi`).

Buona sperimentazione!
