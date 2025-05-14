# Guida Approfondita: Networking di Base in Linux

Questa guida fornisce una panoramica dettagliata dei concetti e degli strumenti fondamentali per comprendere e gestire il networking in ambiente Linux. È essenziale per amministratori di sistema, sviluppatori e chiunque desideri avere una solida base sul funzionamento delle reti.

## 1. Concetti di Base del Networking

Prima di addentrarci nei comandi specifici, è importante comprendere alcuni concetti chiave.

### Indirizzi IP (Internet Protocol Address)
-   **IPv4:** Un indirizzo IPv4 è un numero a 32 bit, solitamente rappresentato in notazione decimale puntata (es. `192.168.1.10`). Identifica univocamente un host su una rete IP.
    -   **Classi di Indirizzi (obsolete ma utili per capire):** A, B, C, D (multicast), E (sperimentale).
    -   **Indirizzi Privati:** Intervalli riservati per reti locali (LAN) e non instradabili su Internet (es. `10.0.0.0/8`, `172.16.0.0/12`, `192.168.0.0/16`).
-   **IPv6:** Un indirizzo IPv6 è un numero a 128 bit, rappresentato in notazione esadecimale (es. `2001:0db8:85a3:0000:0000:8a2e:0370:7334`). Introdotto per sopperire all'esaurimento degli indirizzi IPv4.

### Subnet Mask (Maschera di Sottorete)
-   Utilizzata con IPv4, la subnet mask (es. `255.255.255.0`) distingue la parte dell'indirizzo IP che identifica la rete da quella che identifica l'host all'interno di quella rete.
-   **Notazione CIDR (Classless Inter-Domain Routing):** Un modo più moderno e flessibile per rappresentare la subnet mask, indicando il numero di bit iniziali dell'indirizzo IP che costituiscono il prefisso di rete (es. `192.168.1.0/24`, dove `/24` corrisponde a `255.255.255.0`).

### Gateway Predefinito (Default Gateway)
-   È l'indirizzo IP del router sulla rete locale a cui un host invia tutto il traffico destinato a reti esterne (es. Internet).

### DNS (Domain Name System)
-   Un sistema gerarchico distribuito che traduce i nomi di dominio leggibili dall'uomo (es. `www.google.com`) nei corrispondenti indirizzi IP numerici (es. `172.217.16.36`) e viceversa.
-   Gli host sono configurati con gli indirizzi IP di uno o più server DNS.

### Porte
-   Un numero a 16 bit (da 0 a 65535) utilizzato per identificare specifici processi o servizi su un host all'interno di una connessione di rete.
-   **Porte Note (Well-known Ports):** 0-1023, assegnate a servizi comuni (es. HTTP porta 80, HTTPS porta 443, SSH porta 22).
-   **Porte Registrate (Registered Ports):** 1024-49151.
-   **Porte Dinamiche/Private (Dynamic/Private Ports):** 49152-65535.

### Protocolli TCP/IP
La suite di protocolli TCP/IP è il fondamento di Internet e della maggior parte delle reti moderne.
-   **IP (Internet Protocol):** Protocollo di livello rete responsabile dell'indirizzamento e dell'instradamento dei pacchetti di dati (datagrammi) attraverso le reti.
-   **TCP (Transmission Control Protocol):** Protocollo di livello trasporto orientato alla connessione. Fornisce una trasmissione affidabile, ordinata e con controllo degli errori dei dati tra applicazioni. Utilizza un handshake a tre vie per stabilire una connessione.
-   **UDP (User Datagram Protocol):** Protocollo di livello trasporto non orientato alla connessione. Fornisce una trasmissione veloce ma non affidabile (best-effort) dei datagrammi. Non garantisce l'ordine o la consegna dei pacchetti. Usato per applicazioni come streaming video, DNS, giochi online.
-   **ICMP (Internet Control Message Protocol):** Utilizzato da dispositivi di rete, come i router, per inviare messaggi di errore o operativi (es. host non raggiungibile). `ping` utilizza ICMP.

## 2. Configurazione di Rete

Linux offre diversi strumenti per visualizzare e modificare la configurazione di rete.

### `ip` (da `iproute2`)
Il comando `ip` è lo strumento moderno e preferito per la gestione delle interfacce di rete, degli indirizzi IP, delle tabelle di routing e altro ancora. Sostituisce i vecchi comandi come `ifconfig`, `route`, `netstat` (in parte).

-   **Visualizzare le interfacce di rete e gli indirizzi IP:**
    ```bash
    ip addr show
    # o abbreviato
    ip a
    ```
    Output tipico per un'interfaccia (es. `eth0`):
    `2: eth0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc fq_codel state UP group default qlen 1000
        link/ether 00:1a:2b:3c:4d:5e brd ff:ff:ff:ff:ff:ff
        inet 192.168.1.10/24 brd 192.168.1.255 scope global dynamic eth0
           valid_lft 85656sec preferred_lft 85656sec
        inet6 fe80::21a:2bff:fe3c:4d5e/64 scope link
           valid_lft forever preferred_lft forever`

-   **Aggiungere un indirizzo IP a un'interfaccia:**
    ```bash
    sudo ip addr add 192.168.1.100/24 dev eth0
    ```

-   **Rimuovere un indirizzo IP da un'interfaccia:**
    ```bash
    sudo ip addr del 192.168.1.100/24 dev eth0
    ```

-   **Attivare/Disattivare un'interfaccia di rete:**
    ```bash
    sudo ip link set eth0 up
    sudo ip link set eth0 down
    ```

-   **Visualizzare la tabella di routing:**
    ```bash
    ip route show
    # o abbreviato
    ip r
    ```
    Output tipico:
    `default via 192.168.1.1 dev eth0 proto dhcp metric 100
    192.168.1.0/24 dev eth0 proto kernel scope link src 192.168.1.10 metric 100`

-   **Aggiungere una rotta statica (es. per una rete specifica via un gateway specifico):**
    ```bash
    sudo ip route add 10.0.0.0/8 via 192.168.1.254 dev eth0
    ```

-   **Rimuovere una rotta statica:**
    ```bash
    sudo ip route del 10.0.0.0/8 via 192.168.1.254 dev eth0
    ```

-   **Aggiungere un gateway predefinito:**
    ```bash
    sudo ip route add default via 192.168.1.1 dev eth0
    ```

### `ifconfig` (obsoleto)
Il comando `ifconfig` (interface configuration) era lo strumento tradizionale per configurare le interfacce di rete. È deprecato in favore di `ip` ma potrebbe essere ancora presente su alcuni sistemi.
-   **Visualizzare tutte le interfacce attive:**
    ```bash
    ifconfig -a
    ```
-   **Configurare un indirizzo IP e una netmask:**
    ```bash
    sudo ifconfig eth0 192.168.1.10 netmask 255.255.255.0 up
    ```

### `route` (obsoleto)
Il comando `route` era usato per visualizzare e manipolare la tabella di routing IP. Anche questo è deprecato.
-   **Visualizzare la tabella di routing:**
    ```bash
    route -n
    ```

### `netstat` (parzialmente obsoleto, sostituito da `ss` e `ip`)
`netstat` (network statistics) visualizza connessioni di rete, tabelle di routing, statistiche delle interfacce, ecc.
-   **Visualizzare tutte le porte in ascolto (TCP e UDP):**
    ```bash
    sudo netstat -tulnp
    ```
    -   `-t`: TCP, `-u`: UDP, `-l`: listening, `-n`: numerico (non risolvere nomi), `-p`: mostra PID/nome programma.

### `ss` (Socket Statistics)
`ss` è il sostituto moderno di `netstat` per investigare i socket.
-   **Visualizzare tutte le porte TCP in ascolto:**
    ```bash
    sudo ss -tlpn
    ```
-   **Visualizzare tutte le connessioni TCP stabilite:**
    ```bash
    ss -tpn state established
    ```

### Configurazione DNS
La configurazione dei server DNS avviene solitamente nel file `/etc/resolv.conf`.
```
# Esempio /etc/resolv.conf
nameserver 8.8.8.8       # Google Public DNS
nameserver 8.8.4.4       # Google Public DNS
nameserver 1.1.1.1       # Cloudflare DNS
search miodominio.local  # Dominio di ricerca (opzionale)
```
Nelle distribuzioni moderne che usano `systemd-resolved` o `NetworkManager`, questo file potrebbe essere gestito automaticamente. Per configurazioni permanenti, si agisce sui file di configurazione di questi gestori (es. Netplan su Ubuntu, file in `/etc/NetworkManager/` o `/etc/systemd/network/`).

## 3. Diagnosi dei Problemi di Rete

Questi comandi sono fondamentali per il troubleshooting.

### `ping`
Invia pacchetti ICMP Echo Request a un host di destinazione per verificarne la raggiungibilità e misurare il tempo di round-trip.
```bash
ping google.com
ping 192.168.1.1

# Inviare un numero specifico di pacchetti (es. 5)
ping -c 5 google.com
```

### `traceroute` (o `tracepath`)
Mostra il percorso (la sequenza di router) che i pacchetti seguono per raggiungere un host di destinazione. Utile per identificare colli di bottiglia o interruzioni nel percorso.
```bash
traceroute google.com

# traceroute potrebbe richiedere privilegi di root su alcuni sistemi per usare ICMP
# tracepath è un'alternativa simile che non sempre richiede root
tracepath google.com
```

### `nslookup` (Name Server Lookup)
Interroga i server DNS per ottenere informazioni sulla mappatura nome-indirizzo IP o altre informazioni DNS.
```bash
nslookup google.com

# Interrogare un server DNS specifico
nslookup google.com 8.8.8.8

# Ottenere record MX (Mail Exchange)
nslookup -query=mx google.com
```

### `dig` (Domain Information Groper)
Uno strumento più potente e flessibile di `nslookup` per interrogare i server DNS.
```bash
dig google.com

# Ottenere solo la risposta breve (indirizzo IP)
dig +short google.com

# Interrogare un server DNS specifico
dig @8.8.8.8 google.com

# Ottenere record MX
dig google.com MX

# Tracciare la risoluzione DNS completa
dig +trace google.com
```

### `mtr` (My Traceroute)
Combina le funzionalità di `ping` e `traceroute` in un unico strumento diagnostico di rete, fornendo statistiche continue sul percorso.
```bash
mtr google.com
```

## 4. Firewall di Base

Un firewall è un sistema di sicurezza di rete che monitora e controlla il traffico di rete in entrata e in uscita basandosi su regole di sicurezza predeterminate.

### `iptables`
Lo strumento tradizionale per la gestione del firewall a livello di kernel Linux (Netfilter). È potente ma ha una sintassi complessa.
-   **Concetti base di `iptables`:**
    -   **Tabelle:** `filter` (default, per filtrare pacchetti), `nat` (Network Address Translation), `mangle` (modifica intestazioni IP).
    -   **Catene (Chains):** Sequenze di regole. Catene predefinite nella tabella `filter`: `INPUT` (pacchetti destinati al firewall stesso), `OUTPUT` (pacchetti generati dal firewall), `FORWARD` (pacchetti che attraversano il firewall).
    -   **Regole (Rules):** Criteri per matchare i pacchetti e un'azione (target) da intraprendere (es. `ACCEPT`, `DROP`, `REJECT`).
-   **Visualizzare le regole correnti (tabella filter):**
    ```bash
    sudo iptables -L -v -n
    ```
-   **Esempio: Permettere traffico SSH in entrata (porta 22):**
    ```bash
    sudo iptables -A INPUT -p tcp --dport 22 -j ACCEPT
    ```
-   **Esempio: Bloccare tutto il traffico in entrata non esplicitamente permesso (politica di default):**
    ```bash
    sudo iptables -P INPUT DROP
    ```
    **Attenzione:** Impostare una politica di `DROP` senza prima aver permesso le connessioni necessarie (es. SSH) può bloccare l'accesso al server.

### `firewalld`
Un frontend dinamico per la gestione del firewall, che utilizza `nftables` (il successore di `iptables`) o `iptables` come backend. È lo strumento predefinito su molte distribuzioni moderne (es. CentOS/RHEL, Fedora).
-   **Concetti base di `firewalld`:**
    -   **Zone:** Set di regole predefinite per diversi livelli di fiducia della rete (es. `public`, `home`, `work`, `drop`). Le interfacce di rete sono assegnate a una zona.
    -   **Servizi:** Definizioni preconfigurate per servizi comuni (es. `ssh`, `http`).
-   **Visualizzare la zona attiva e le regole:**
    ```bash
    sudo firewall-cmd --get-active-zones
    sudo firewall-cmd --list-all
    ```
-   **Esempio: Permettere il servizio HTTP nella zona `public` (permanentemente):**
    ```bash
    sudo firewall-cmd --zone=public --add-service=http --permanent
    sudo firewall-cmd --reload # Per applicare le modifiche permanenti
    ```
-   **Esempio: Aprire una porta specifica (es. 8080/tcp) nella zona `public`:**
    ```bash
    sudo firewall-cmd --zone=public --add-port=8080/tcp --permanent
    sudo firewall-cmd --reload
    ```

### `ufw` (Uncomplicated Firewall)
Un frontend più semplice per `iptables`, progettato per essere facile da usare. Comune su Ubuntu.
-   **Verificare lo stato:**
    ```bash
    sudo ufw status verbose
    ```
-   **Abilitare `ufw`:**
    ```bash
    sudo ufw enable
    ```
-   **Esempio: Permettere SSH:**
    ```bash
    sudo ufw allow ssh
    # o
    sudo ufw allow 22/tcp
    ```
-   **Esempio: Negare traffico sulla porta 80:**
    ```bash
    sudo ufw deny 80/tcp
    ```
-   **Impostare politiche di default (es. negare tutto in entrata, permettere tutto in uscita):**
    ```bash
    sudo ufw default deny incoming
    sudo ufw default allow outgoing
    ```

## 5. Connessioni Remote

### `ssh` (Secure Shell)
Protocollo e strumento per accedere in modo sicuro a un host remoto su una rete non sicura. Cifra tutto il traffico.
-   **Connettersi a un server remoto:**
    ```bash
    ssh utente@hostname_o_indirizzo_ip
    # Esempio:
    ssh john@192.168.1.100
    ssh jane@server.example.com
    ```
-   **Connettersi usando una porta specifica:**
    ```bash
    ssh -p 2222 utente@hostname
    ```
-   **Autenticazione basata su chiavi (più sicura delle password):**
    1.  Generare una coppia di chiavi (pubblica e privata) sul client:
        ```bash
        ssh-keygen -t rsa -b 4096
        ```
    2.  Copiare la chiave pubblica sul server remoto:
        ```bash
        ssh-copy-id utente@hostname
        ```
        Ora le connessioni SSH non richiederanno la password.

### `scp` (Secure Copy)
Comando per copiare file in modo sicuro tra host su una rete, utilizzando SSH.
-   **Copiare un file locale su un host remoto:**
    ```bash
    scp /path/locale/file.txt utente@hostname:/path/remoto/
    ```
-   **Copiare un file da un host remoto a locale:**
    ```bash
    scp utente@hostname:/path/remoto/file.txt /path/locale/
    ```
-   **Copiare una directory ricorsivamente:**
    ```bash
    scp -r /path/locale/directory utente@hostname:/path/remoto/
    ```

### `sftp` (SSH File Transfer Protocol)
Un protocollo di trasferimento file sicuro che gira su SSH. Fornisce un'interfaccia interattiva simile a FTP.
-   **Avviare una sessione SFTP:**
    ```bash
    sftp utente@hostname
    ```
-   **Comandi comuni in SFTP:** `ls`, `cd`, `pwd`, `get` (scarica file), `put` (carica file), `mkdir`, `rm`, `help`, `exit`.

## Conclusione

Questa guida ha coperto i concetti di base del networking in Linux e i comandi essenziali per la configurazione, la diagnosi e la gestione delle connessioni di rete e della sicurezza. La pratica con questi strumenti è fondamentale per acquisire padronanza. Consulta sempre le pagine `man` (`man nome_comando`) per dettagli approfonditi su ciascun comando.