# Esercizi: Networking di Base in Linux

Questi esercizi sono progettati per aiutarti a consolidare la tua comprensione dei concetti e dei comandi di networking di base in Linux. Prova a risolverli utilizzando le conoscenze acquisite dalla guida e dagli esempi del modulo.

## Esercizio 1: Esplorazione della Configurazione di Rete Locale

1.  **Visualizza le tue interfacce di rete:**
    *   Utilizza il comando `ip addr show` (o `ip a`) per elencare tutte le interfacce di rete sul tuo sistema.
    *   Identifica la tua interfaccia di rete principale (spesso `eth0`, `ensXX`, `wlan0`, o `wlpXsY`).
    *   Prendi nota del tuo indirizzo IPv4, indirizzo IPv6 (se presente), e indirizzo MAC.
2.  **Visualizza la tua tabella di routing:**
    *   Utilizza il comando `ip route show` (o `ip r`) per visualizzare la tabella di routing del kernel.
    *   Identifica il tuo gateway predefinito.
3.  **Visualizza i server DNS configurati:**
    *   Controlla il contenuto del file `/etc/resolv.conf`.
    *   Se il tuo sistema usa `systemd-resolved`, potresti dover usare `resolvectl status` o `resolvectl query <hostname>` per vedere i server DNS effettivi.

**Domande:**
*   Qual è l'indirizzo IP della tua macchina?
*   Qual è l'indirizzo IP del tuo gateway predefinito?
*   Quali server DNS sta utilizzando il tuo sistema?

## Esercizio 2: Diagnosi della Connettività di Rete

1.  **Testa la connettività a un host locale:**
    *   Esegui il comando `ping <indirizzo_IP_del_gateway>` (sostituisci con l'IP del tuo gateway trovato nell'Esercizio 1).
    *   Osserva i tempi di risposta.
2.  **Testa la connettività a un host remoto (Internet):**
    *   Esegui `ping -c 5 www.google.com`.
    *   Cosa succede se provi a pingare un hostname che non esiste (es. `ping www.dominioinesistente123abc.com`)?
3.  **Traccia il percorso verso un host remoto:**
    *   Utilizza `traceroute www.kernel.org` (o `tracepath www.kernel.org`).
    *   Analizza l'output. Quanti "hop" (salti) ci sono tra te e il server di `kernel.org`?
4.  **Risoluzione dei nomi DNS:**
    *   Usa `nslookup www.debian.org` per trovare l'indirizzo IP di `www.debian.org`.
    *   Usa `dig www.debian.org A` e `dig www.debian.org AAAA` per trovare gli indirizzi IPv4 e IPv6.
    *   Usa `dig debian.org MX` per trovare i server di posta (Mail Exchange) per il dominio `debian.org`.

**Domande:**
*   Il ping verso il tuo gateway ha avuto successo? Qual era il tempo medio di risposta?
*   Il ping verso `www.google.com` ha avuto successo?
*   Qual è il primo hop (router) dopo la tua macchina quando tracci il percorso verso `www.kernel.org`?

## Esercizio 3: Visualizzazione delle Connessioni Attive

1.  **Porte in ascolto:**
    *   Utilizza `sudo ss -tulnp` per visualizzare tutte le porte TCP e UDP in ascolto sul tuo sistema.
    *   Identifica alcuni servizi comuni in ascolto (es. porta 22 per SSH, porta 80/443 se hai un server web locale, porta 53 per DNS se hai un resolver locale).
2.  **Connessioni stabilite:**
    *   Apri un browser web e naviga su un sito (es. `https://www.fsf.org`).
    *   Mentre la pagina è aperta, esegui `ss -tpn state established | grep ':443'` (o `:80` se il sito è HTTP).
    *   Riesci a identificare la connessione stabilita dal tuo browser al server web?

**Domande:**
*   Quali servizi sono in ascolto sulla tua macchina sulla porta TCP 22 (se SSH è attivo)?
*   Quando ti connetti a un sito HTTPS, quale porta remota viene tipicamente utilizzata dal server?

## Esercizio 4: Concetti di Firewall (Teorico/Simulato)

Questo esercizio è più teorico, dato che la modifica delle regole del firewall può avere impatti sul sistema. **Non modificare le regole del firewall a meno che tu non sappia cosa stai facendo e come ripristinare le modifiche.**

1.  **Verifica lo stato del tuo firewall:**
    *   Se usi `ufw` (comune su Ubuntu): `sudo ufw status verbose`
    *   Se usi `firewalld` (comune su Fedora/CentOS): `sudo firewall-cmd --state` e `sudo firewall-cmd --list-all`
    *   Se usi `iptables` direttamente: `sudo iptables -L -v -n`
2.  **Pensa a come permetteresti il traffico:**
    *   Come permetteresti il traffico in entrata sulla porta TCP 8080 se avessi un'applicazione web in ascolto su quella porta?
        *   Con `ufw`: `sudo ufw allow 8080/tcp`
        *   Con `firewalld`: `sudo firewall-cmd --permanent --add-port=8080/tcp; sudo firewall-cmd --reload`
        *   Con `iptables`: `sudo iptables -A INPUT -p tcp --dport 8080 -j ACCEPT`

**Domande (teoriche):**
*   Qual è la differenza tra una politica di firewall `DROP` e una `REJECT`?
*   Perché è importante avere una regola che permetta il traffico SSH *prima* di impostare una politica di default `DROP` sulla catena `INPUT`?

## Esercizio 5: Connessioni Remote (se hai accesso a un altro host Linux)

Se hai accesso a un altro computer Linux (o una macchina virtuale) a cui puoi connetterti via SSH:

1.  **Connessione SSH:**
    *   Dal tuo computer locale, connettiti all'host remoto: `ssh utente@host_remoto_ip_o_hostname`
    *   Esegui alcuni comandi sull'host remoto (es. `ls`, `pwd`, `uname -a`).
    *   Disconnettiti (`exit`).
2.  **Copia di file con `scp`:**
    *   Crea un file di testo sul tuo computer locale: `echo "Test per scp" > test_scp.txt`
    *   Copia il file sull'host remoto nella home directory dell'utente remoto: `scp test_scp.txt utente@host_remoto_ip_o_hostname:~/`
    *   Verifica (connettendoti di nuovo via SSH o se hai già una sessione aperta) che il file sia stato copiato.
    *   Copia un file dall'host remoto al tuo computer locale: `scp utente@host_remoto_ip_o_hostname:~/nome_file_remoto.txt .` (il `.` indica la directory corrente locale).
3.  **Trasferimento file con `sftp`:**
    *   Avvia una sessione `sftp`: `sftp utente@host_remoto_ip_o_hostname`
    *   Usa comandi come `ls`, `pwd`, `cd` per navigare sul filesystem remoto.
    *   Usa `put test_scp.txt` per caricare un file (se non l'hai già fatto con scp).
    *   Usa `get nome_file_remoto.txt` per scaricare un file.
    *   Esci da `sftp` (`exit` o `bye`).

**Domande:**
*   Qual è il vantaggio principale dell'usare l'autenticazione a chiave SSH rispetto all'autenticazione a password?
*   Cosa fa l'opzione `-r` nel comando `scp`?

---

Buon divertimento con gli esercizi! Ricorda di consultare le pagine `man` per maggiori dettagli sui comandi.