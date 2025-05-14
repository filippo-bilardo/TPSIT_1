# Networking di Base in Linux - Guida Completa

Il networking è una componente fondamentale di qualsiasi sistema Linux moderno. Questa guida esplora i concetti fondamentali, i comandi e le tecniche per configurare, monitorare e risolvere problemi di rete in un ambiente Linux.

## 1. Concetti Fondamentali di Networking

### 1.1 Modello OSI e TCP/IP

Il networking in Linux segue i principi del modello di riferimento OSI (Open Systems Interconnection) e del modello TCP/IP:

**Modello OSI (7 livelli):**
1. Fisico - Trasmissione di bit sul mezzo fisico
2. Data Link - Gestione accesso al mezzo, framing
3. Rete - Routing e indirizzamento logico (IP)
4. Trasporto - Consegna end-to-end (TCP/UDP)
5. Sessione - Gestione delle sessioni di comunicazione
6. Presentazione - Conversione, crittografia, compressione
7. Applicazione - Interfacce e servizi per applicazioni

**Modello TCP/IP (4 livelli):**
1. Accesso alla Rete (≈ Fisico + Data Link)
2. Internet (≈ Rete)
3. Trasporto (≈ Trasporto)
4. Applicazione (≈ Sessione + Presentazione + Applicazione)

### 1.2 Indirizzi IP

Gli indirizzi IP sono identificatori numerici per interfacce di rete:

**IPv4:**
- Formato: 4 ottetti (32 bit) separati da punti (es. 192.168.1.1)
- Classi tradizionali: A (1-126.x.x.x), B (128-191.x.x.x), C (192-223.x.x.x)
- Indirizzi privati: 10.0.0.0/8, 172.16.0.0/12, 192.168.0.0/16
- Limitato a circa 4,3 miliardi di indirizzi

**IPv6:**
- Formato: 8 gruppi di 4 cifre esadecimali separati da ":" (es. 2001:0db8:85a3:0000:0000:8a2e:0370:7334)
- Abbreviazioni consentite (rimozione zeri iniziali, sostituzione gruppi di zeri con ::)
- 128 bit = circa 3.4 × 10^38 indirizzi

### 1.3 Subnet Mask e CIDR

La subnet mask determina quali bit dell'indirizzo rappresentano la rete e quali l'host:

**Subnet mask tradizionale:**
- Formato: 4 ottetti (es. 255.255.255.0)
- 1 per bit di rete, 0 per bit di host

**Notazione CIDR (Classless Inter-Domain Routing):**
- Formato: /n dove n è il numero di bit di rete
- Esempio: 192.168.1.0/24 equivale a 192.168.1.0 con subnet mask 255.255.255.0

### 1.4 Porte e Socket

- **Porte**: Identificativi numerici (0-65535) che differenziano servizi sulla stessa macchina
  - Porte well-known (0-1023): HTTP (80), HTTPS (443), SSH (22), FTP (21), ecc.
  - Porte registrate (1024-49151): spesso usate da applicazioni
  - Porte dinamiche/private (49152-65535): assegnate temporaneamente

- **Socket**: Combinazione di indirizzo IP e porta (es. 192.168.1.1:80)

### 1.5 Protocolli Comuni

- **TCP (Transmission Control Protocol)**: Orientato alla connessione, affidabile
- **UDP (User Datagram Protocol)**: Senza connessione, non affidabile ma veloce
- **ICMP (Internet Control Message Protocol)**: Messaggi di controllo/errore
- **HTTP/HTTPS**: Trasferimento ipertesti (web)
- **DNS (Domain Name System)**: Risoluzione nomi in indirizzi IP
- **SSH (Secure Shell)**: Accesso remoto sicuro
- **FTP/SFTP/SCP**: Trasferimento file

## 2. Configurazione di Rete in Linux

### 2.1 Interfacce di Rete

Le interfacce di rete in Linux hanno nomi specifici:
- **eth0, eth1**: Interfacce Ethernet tradizionali
- **enp0s3, enp5s0**: Nuove convenzioni di denominazione (Predictable Network Interface Names)
- **lo**: Loopback (127.0.0.1 - localhost)
- **wlan0, wlp3s0**: Interfacce wireless
- **br0, docker0**: Bridge virtuali

### 2.2 Visualizzazione Configurazione di Rete

**Comando `ip` (preferito):**
```bash
# Visualizza tutte le interfacce
ip address show
ip a

# Visualizza un'interfaccia specifica
ip address show dev eth0

# Visualizza statistiche interfaccia
ip -s link show dev eth0

# Visualizza routing
ip route show
ip r
```

**Comando `ifconfig` (legacy):**
```bash
# Visualizza tutte le interfacce attive
ifconfig

# Visualizza tutte le interfacce (anche disattive)
ifconfig -a

# Visualizza un'interfaccia specifica
ifconfig eth0
```

### 2.3 Configurazione Manuale

**Configurazione temporanea (con `ip`):**
```bash
# Imposta un indirizzo IP
sudo ip address add 192.168.1.100/24 dev eth0

# Imposta lo stato up/down
sudo ip link set dev eth0 up
sudo ip link set dev eth0 down

# Aggiungi una rotta predefinita (gateway)
sudo ip route add default via 192.168.1.1

# Aggiungi una rotta specifica
sudo ip route add 10.0.0.0/8 via 192.168.1.254
```

**Configurazione temporanea (con `ifconfig`):**
```bash
# Imposta indirizzo IP e subnet mask
sudo ifconfig eth0 192.168.1.100 netmask 255.255.255.0

# Imposta lo stato up/down
sudo ifconfig eth0 up
sudo ifconfig eth0 down

# Imposta gateway predefinito
sudo route add default gw 192.168.1.1
```

### 2.4 Configurazione Permanente

La configurazione permanente dipende dalla distribuzione Linux:

**Debian/Ubuntu (con `/etc/network/interfaces`):**
```
# Interfaccia loopback
auto lo
iface lo inet loopback

# Interfaccia Ethernet con DHCP
auto eth0
iface eth0 inet dhcp

# Interfaccia Ethernet con IP statico
auto eth0
iface eth0 inet static
    address 192.168.1.100
    netmask 255.255.255.0
    gateway 192.168.1.1
    dns-nameservers 8.8.8.8 8.8.4.4
```

**RHEL/CentOS/Fedora (con file in `/etc/sysconfig/network-scripts/`):**
```
# /etc/sysconfig/network-scripts/ifcfg-eth0
DEVICE=eth0
BOOTPROTO=static
IPADDR=192.168.1.100
NETMASK=255.255.255.0
GATEWAY=192.168.1.1
DNS1=8.8.8.8
DNS2=8.8.4.4
ONBOOT=yes
```

**Configurazione con NetworkManager:**
```bash
# Modifica connessione con nmcli
nmcli connection modify eth0 ipv4.addresses 192.168.1.100/24
nmcli connection modify eth0 ipv4.gateway 192.168.1.1
nmcli connection modify eth0 ipv4.dns "8.8.8.8 8.8.4.4"
nmcli connection modify eth0 ipv4.method manual
nmcli connection up eth0
```

### 2.5 Configurazione DNS

**File di configurazione `/etc/resolv.conf`:**
```
nameserver 8.8.8.8
nameserver 8.8.4.4
search example.com
```

**File `/etc/hosts` per risoluzione statica:**
```
127.0.0.1 localhost
192.168.1.10 server.example.com server
```

## 3. Strumenti di Diagnostica di Rete

### 3.1 Verifica di Connettività

**ping:**
```bash
# Test connettività base
ping google.com

# Specifica numero di pacchetti
ping -c 4 8.8.8.8

# Intervallo più veloce
ping -i 0.2 192.168.1.1
```

**arping (ping a livello Ethernet):**
```bash
# Ping ARP
sudo arping -I eth0 192.168.1.1
```

### 3.2 Tracciamento del Percorso

**traceroute/tracepath:**
```bash
# Traccia il percorso verso un host
traceroute google.com

# Usa ICMP invece di UDP
traceroute -I google.com

# Versione più moderna
tracepath google.com
```

**mtr (My Traceroute - combinazione di ping e traceroute):**
```bash
# Avvia mtr in modalità testuale
mtr google.com

# Genera report
mtr -r -c 10 google.com
```

### 3.3 Risoluzione DNS

**nslookup:**
```bash
# Risolvi un nome host
nslookup google.com

# Specifica server DNS
nslookup google.com 8.8.8.8

# Lookup inverso
nslookup 8.8.8.8
```

**dig (DNS Information Groper):**
```bash
# Query DNS dettagliata
dig google.com

# Specifica tipo di record
dig google.com MX
dig google.com NS

# Query breve
dig +short google.com

# Specifica server DNS
dig @8.8.8.8 google.com
```

**host:**
```bash
# Semplice risoluzione
host google.com

# Risoluzione inversa
host 8.8.8.8
```

### 3.4 Verifica Servizi di Rete

**netstat (legacy):**
```bash
# Mostra tutte le connessioni
netstat -a

# Mostra connessioni TCP/UDP + processi
netstat -tupl

# Mostra statistiche di rete
netstat -s
```

**ss (sostituto moderno di netstat):**
```bash
# Mostra tutte le connessioni
ss -a

# Mostra connessioni TCP/UDP + processi
ss -tupl

# Mostra statistiche
ss -s

# Filtra per porta
ss -t state established '( dport = :ssh or sport = :ssh )'
```

**netcat/nc (toolkit di rete):**
```bash
# Test connessione a una porta
nc -zv google.com 443

# Server semplice
nc -l -p 1234

# Client
nc 192.168.1.100 1234
```

**lsof (lista file aperti, incluse connessioni):**
```bash
# Mostra file di rete
lsof -i

# Filtra per porta
lsof -i :22

# Filtra per protocollo
lsof -i tcp
```

### 3.5 Analisi di Pacchetti

**tcpdump:**
```bash
# Cattura pacchetti su un'interfaccia
sudo tcpdump -i eth0

# Filtra per host
sudo tcpdump -i eth0 host 192.168.1.1

# Filtra per porta
sudo tcpdump -i eth0 port 80

# Espressione complessa
sudo tcpdump -i eth0 'tcp port 80 and (host google.com or host facebook.com)'

# Salva la cattura su file
sudo tcpdump -i eth0 -w capture.pcap
```

**tshark (versione cli di Wireshark):**
```bash
# Cattura base
sudo tshark -i eth0

# Mostra campi specifici
sudo tshark -i eth0 -T fields -e ip.src -e ip.dst -e http.request.method
```

## 4. Firewall in Linux

### 4.1 iptables

Il firewall tradizionale in Linux, basato su tabelle:

```bash
# Visualizza regole attuali
sudo iptables -L -v

# Struttura base:
# iptables -A|-I CHAIN -p PROTO -s SOURCE -d DEST --dport PORT -j ACTION

# Esempi:
# Blocca traffico in ingresso da un IP
sudo iptables -A INPUT -s 10.0.0.5 -j DROP

# Consenti ingresso sulla porta 22 (SSH)
sudo iptables -A INPUT -p tcp --dport 22 -j ACCEPT

# Consenti traffico già stabilito
sudo iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT

# Blocca tutto il resto
sudo iptables -A INPUT -j DROP

# Salva regole (dipende dalla distro)
sudo iptables-save > /etc/iptables/rules.v4
```

### 4.2 nftables

Sostituto moderno di iptables:

```bash
# Visualizza regole
sudo nft list ruleset

# Aggiungi tabella e chain
sudo nft add table inet filter
sudo nft add chain inet filter input { type filter hook input priority 0 \; policy drop \; }

# Aggiungi regole
sudo nft add rule inet filter input iif lo accept
sudo nft add rule inet filter input ct state established,related accept
sudo nft add rule inet filter input tcp dport 22 accept
```

### 4.3 firewalld (Fedora/RHEL/CentOS)

Interfaccia di alto livello per nftables/iptables:

```bash
# Stato
sudo firewall-cmd --state

# Elenca zone
sudo firewall-cmd --get-active-zones

# Elenca servizi permessi
sudo firewall-cmd --zone=public --list-services

# Abilita servizio temporaneamente
sudo firewall-cmd --zone=public --add-service=http

# Abilita servizio permanentemente
sudo firewall-cmd --zone=public --add-service=http --permanent

# Abilita porta
sudo firewall-cmd --zone=public --add-port=8080/tcp --permanent

# Ricarica configurazione
sudo firewall-cmd --reload
```

### 4.4 ufw (Uncomplicated Firewall - Ubuntu)

Interfaccia semplificata per iptables:

```bash
# Stato
sudo ufw status

# Abilita
sudo ufw enable

# Blocca/permetti tutto
sudo ufw default deny
sudo ufw default allow

# Aggiungi regole
sudo ufw allow 22/tcp
sudo ufw allow ssh
sudo ufw deny 23/tcp

# Regole con origine
sudo ufw allow from 192.168.1.0/24 to any port 22
```

## 5. Connessioni Remote

### 5.1 SSH (Secure Shell)

```bash
# Connessione base
ssh username@host

# Specifica porta
ssh -p 2222 username@host

# Utilizza chiave privata
ssh -i ~/.ssh/id_rsa username@host

# Abilita inoltro X11
ssh -X username@host

# Tunnel SSH (locale)
ssh -L 8080:localhost:80 username@host

# Tunnel SSH (remoto)
ssh -R 8080:localhost:80 username@host

# Crea un proxy SOCKS
ssh -D 9090 username@host
```

### 5.2 Trasferimento File con SSH

**scp (Secure Copy):**
```bash
# Upload di file
scp file.txt username@host:/path/to/destination/

# Download di file
scp username@host:/path/to/file.txt .

# Copia ricorsiva (directory)
scp -r local_dir username@host:/path/to/remote_dir

# Specifica porta
scp -P 2222 file.txt username@host:/path/to/destination/
```

**sftp (Secure FTP):**
```bash
# Avvia sessione
sftp username@host

# Comandi interattivi
help
ls
cd remote_dir
lcd local_dir
get file.txt
put file.txt
bye
```

**rsync (sincronizzazione efficiente):**
```bash
# Sincronizza directory locale con remota (via SSH)
rsync -avz -e ssh local_dir/ username@host:/path/to/remote_dir/

# Sincronizza remoto a locale
rsync -avz -e ssh username@host:/path/to/remote_dir/ local_dir/

# Sincronizza preservando permessi, elimina file non presenti nell'origine
rsync -avz --delete -e ssh local_dir/ username@host:/path/to/remote_dir/
```

### 5.3 SSH Avanzato

**Configurazione SSH client (`~/.ssh/config`):**
```
# Host singolo
Host myserver
    HostName 192.168.1.100
    User admin
    Port 2222
    IdentityFile ~/.ssh/id_rsa_server

# Wildcard
Host *.example.com
    User deployer
    IdentityFile ~/.ssh/id_rsa_example

# ProxyJump (Bastion host)
Host private
    HostName 10.0.0.10
    User admin
    ProxyJump bastion
```

**Generazione chiavi SSH:**
```bash
# Genera coppia di chiavi (algoritmo ed-25519, più sicuro)
ssh-keygen -t ed25519 -C "commento/email"

# Genera chiave RSA con 4096 bit
ssh-keygen -t rsa -b 4096 -C "commento/email"

# Copia la chiave pubblica su un server
ssh-copy-id username@host
```

## 6. Configurazione Server di Rete Base

### 6.1 Server SSH

Configurazione base (`/etc/ssh/sshd_config`):
```
# Cambia porta (sicurezza)
Port 2222

# Disabilita accesso root
PermitRootLogin no

# Autenticazione con sola chiave
PasswordAuthentication no
PubkeyAuthentication yes

# Limita utenti
AllowUsers user1 user2

# Timeout
ClientAliveInterval 300
ClientAliveCountMax 2
```

Riavvio del servizio:
```bash
sudo systemctl restart sshd
```

### 6.2 Condivisione Web Semplice

Server HTTP veloce con Python:
```bash
# Python 3
python3 -m http.server 8000

# Python 2
python -m SimpleHTTPServer 8000
```

### 6.3 Condivisione File con NFS

Configurazione server NFS (`/etc/exports`):
```
/shared 192.168.1.0/24(rw,sync,no_subtree_check)
```

Operazioni:
```bash
# Avvia server
sudo systemctl start nfs-server

# Client: monta share
sudo mount -t nfs 192.168.1.100:/shared /mnt/nfs
```

### 6.4 Condivisione File con Samba (SMB)

Configurazione base (`/etc/samba/smb.conf`):
```
[shared]
   path = /path/to/shared
   browseable = yes
   read only = no
   guest ok = no
   valid users = user1 user2
```

## 7. Networking Avanzato

### 7.1 Network Namespaces

Isolamento di rete a livello kernel:
```bash
# Crea namespace
sudo ip netns add test

# Esegui comando in namespace
sudo ip netns exec test ip a

# Crea veth pair
sudo ip link add veth0 type veth peer name veth1

# Sposta un'estremità in namespace
sudo ip link set veth1 netns test

# Configura interfacce
sudo ip addr add 192.168.100.1/24 dev veth0
sudo ip netns exec test ip addr add 192.168.100.2/24 dev veth1

# Attiva interfacce
sudo ip link set veth0 up
sudo ip netns exec test ip link set veth1 up
```

### 7.2 Bridge Virtuali

```bash
# Crea bridge
sudo ip link add br0 type bridge
sudo ip link set br0 up

# Aggiungi interfacce al bridge
sudo ip link set eth0 master br0
sudo ip link set veth0 master br0
```

### 7.3 Network Bonding (Aggregazione Link)

Configurazione in `/etc/network/interfaces` o equivalente:
```
auto bond0
iface bond0 inet static
    address 192.168.1.10
    netmask 255.255.255.0
    gateway 192.168.1.1
    bond-slaves eth0 eth1
    bond-mode 802.3ad
    bond-miimon 100
```

## 8. Strumenti Avanzati

### 8.1 curl e wget

**curl:**
```bash
# GET semplice
curl https://example.com

# Download file con nome specifico
curl -o filename.txt https://example.com/file

# POST con dati
curl -X POST -d "param1=value1&param2=value2" https://example.com/api

# POST con JSON
curl -X POST -H "Content-Type: application/json" -d '{"key":"value"}' https://example.com/api

# Autenticazione
curl -u username:password https://example.com

# Seguire redirect
curl -L https://example.com
```

**wget:**
```bash
# Download file
wget https://example.com/file.txt

# Download ricorsivo (sito web)
wget -r -np -k https://example.com/

# Download in background
wget -b https://example.com/largefile.iso
```

### 8.2 Analisi HTTP/HTTPS

**httping:**
```bash
# Ping HTTP
httping -g https://google.com
```

**OpenSSL (verifica HTTPS):**
```bash
# Verifica certificato
openssl s_client -connect google.com:443
```

### 8.3 VPN e Tunneling

**SSH Tunneling (già visto in precedenza):**
```bash
# Local forwarding: accedi a servizio remoto attraverso porta locale
ssh -L 8080:localhost:80 user@remote_host

# Remote forwarding: esponi servizio locale a host remoto
ssh -R 8080:localhost:80 user@remote_host
```

**OpenVPN:**
```bash
# Connessione client
sudo openvpn --config client.ovpn
```

**WireGuard:**
```bash
# Attiva/disattiva
sudo wg-quick up wg0
sudo wg-quick down wg0

# Visualizza stato
sudo wg show
```

## 9. Best Practices di Sicurezza di Rete

1. **Minimizzare superficie di attacco**:
   - Disattiva servizi non necessari
   - Esponi solo le porte necessarie
   - Utilizza firewall con policy di default restrittive

2. **Autenticazione sicura**:
   - Utilizza chiavi SSH invece di password
   - Implementa autenticazione a più fattori dove possibile
   - Usa password forti e uniche

3. **Mantenere sistemi aggiornati**:
   - Applica regolarmente patch di sicurezza
   - Aggiorna firmware di router e dispositivi di rete

4. **Monitoraggio e logging**:
   - Configura logging centralizzato
   - Monitora tentativi di accesso falliti
   - Configura allarmi per attività sospette

5. **Segmentazione**:
   - Separa reti e servizi critici
   - Utilizza VLAN per isolare traffico
   - Implementa controlli di accesso tra segmenti

6. **Comunicazioni cifrate**:
   - Utilizza sempre HTTPS, SSH, SFTP invece di HTTP, Telnet, FTP
   - Configura TLS/SSL con cifrari sicuri e aggiornati

7. **Gestione dei DNS**:
   - Usa DNS affidabili
   - Considera l'uso di DoT (DNS over TLS) o DoH (DNS over HTTPS)

## 10. Troubleshooting di Rete

### 10.1 Strategia Generale

1. **Identifica il problema**:
   - È un problema di connettività locale, remota o intermediaria?
   - È un problema di risoluzione nomi o di routing?
   - Quali sono i sintomi precisi?

2. **Isola il livello del problema** (dal basso all'alto):
   - Fisico: cavi, connessioni
   - Data Link: interfacce up/down, MAC
   - Rete: IP, routing
   - Trasporto: porte, firewall
   - Applicazione: configurazione servizio

3. **Strumenti di diagnostica** (per livello):
   - Fisico/Data Link: `ip link`, `ethtool`
   - Rete: `ip address`, `ip route`, `ping`, `traceroute`
   - Trasporto: `ss`, `netstat`, verifica firewall
   - Applicazione: log specifici dell'applicazione

4. **Documenta e risolvi**:
   - Registra le modifiche apportate
   - Verifica che la soluzione sia persistente
   - Implementa monitoraggio per prevenire ricorrenze

### 10.2 Problemi Comuni e Soluzioni

**Problema**: Non può raggiungere host locale.
**Soluzioni**:
1. Verifica stato interfaccia: `ip link show`
2. Verifica configurazione IP: `ip address show`
3. Verifica conflitti IP: `arping -D -I eth0 192.168.1.x`

**Problema**: Può raggiungere LAN ma non Internet.
**Soluzioni**:
1. Verifica routing predefinito: `ip route show`
2. Verifica DNS: `ping 8.8.8.8` vs `ping google.com`
3. Verifica NAT e gateway

**Problema**: Connessione lenta o instabile.
**Soluzioni**:
1. Verifica utilizzo interfaccia: `ifstat`, `iftop`
2. Controlla collisioni/errori: `ip -s link show`
3. Analizza MTU e frammentazione: `ping -M do -s 1500 host`
4. Verifica qualità link: `mtr host`

**Problema**: Nome host non risolto.
**Soluzioni**:
1. Verifica `/etc/resolv.conf`
2. Prova resolver alternativi: `dig @8.8.8.8 example.com`
3. Controlla `/etc/hosts`
4. Verifica DNS del router/provider
