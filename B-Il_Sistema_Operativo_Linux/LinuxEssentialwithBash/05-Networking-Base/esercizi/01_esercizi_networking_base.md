# Esercizi Pratici sul Networking in Linux

Questa serie di esercizi è progettata per farti acquisire familiarità con i concetti e gli strumenti di networking in Linux. Completa ogni esercizio nell'ordine indicato.

## Esercizio 1: Scoprire la Configurazione di Rete

1. Apri un terminale
2. Visualizza informazioni sulle interfacce di rete con il comando moderno:
   ```bash
   ip address show
   ```
3. Se disponibile, prova anche il comando legacy:
   ```bash
   ifconfig
   ```
4. Identifica:
   - L'indirizzo MAC delle tue interfacce di rete
   - L'indirizzo IPv4 (e IPv6, se presente)
   - La subnet mask
   - Lo stato della connessione (UP/DOWN)
5. Visualizza la tabella di routing:
   ```bash
   ip route show
   ```
6. Annota il gateway predefinito (default route)
7. Visualizza la configurazione DNS:
   ```bash
   cat /etc/resolv.conf
   ```

## Esercizio 2: Test di Connettività di Base

1. Testa la connettività con localhost:
   ```bash
   ping -c 4 127.0.0.1
   ```
2. Testa la connettività con il gateway (sostituisci con il tuo gateway):
   ```bash
   ping -c 4 192.168.1.1
   ```
3. Testa la connettività con un server DNS pubblico:
   ```bash
   ping -c 4 8.8.8.8
   ```
4. Testa la risoluzione DNS e la connettività Internet:
   ```bash
   ping -c 4 google.com
   ```
5. Sperimenta con diverse opzioni di ping:
   ```bash
   # Pacchetti più grandi
   ping -c 4 -s 1000 google.com
   
   # Intervallo più breve
   ping -c 10 -i 0.2 google.com
   ```

## Esercizio 3: Tracciamento del Percorso

1. Traccia il percorso verso un server locale (gateway):
   ```bash
   traceroute 192.168.1.1
   ```
2. Traccia il percorso verso un server Internet:
   ```bash
   traceroute google.com
   ```
3. Utilizza diverse varianti:
   ```bash
   # Usando ICMP anziché UDP
   traceroute -I google.com
   
   # Usando TCP
   traceroute -T -p 80 google.com
   ```
4. Se disponibile, prova la versione migliorata:
   ```bash
   tracepath google.com
   ```
5. Se disponibile, usa lo strumento combinato:
   ```bash
   mtr google.com
   ```
6. Analizza i risultati e identifica:
   - Dove si verificano ritardi significativi
   - Se ci sono punti in cui i pacchetti vengono persi
   - Il numero totale di hop fino alla destinazione

## Esercizio 4: Risoluzione DNS

1. Esegui una ricerca DNS base:
   ```bash
   host google.com
   ```
2. Usa nslookup per query interattive:
   ```bash
   nslookup
   > server 8.8.8.8
   > google.com
   > amazon.com
   > exit
   ```
3. Usa dig per query dettagliate:
   ```bash
   # Ricerca standard
   dig google.com
   
   # Ricerca di record MX (mail)
   dig google.com MX
   
   # Ricerca di record NS (name server)
   dig google.com NS
   
   # Ricerca di record TXT
   dig google.com TXT
   
   # Ricerca breve
   dig +short google.com
   ```
4. Sperimenta con la ricerca inversa (da IP a nome):
   ```bash
   host 8.8.8.8
   dig -x 8.8.8.8
   ```
5. Crea una voce temporanea nel file hosts:
   ```bash
   # Aggiungi una riga a /etc/hosts (richiede permessi root)
   echo "127.0.0.1 test.local" | sudo tee -a /etc/hosts
   
   # Verifica che la risoluzione funzioni
   ping -c 2 test.local
   
   # Rimuovi la riga alla fine dell'esercizio
   sudo sed -i '/test.local/d' /etc/hosts
   ```

## Esercizio 5: Scansione di Porte e Servizi

1. Verifica le porte aperte e in ascolto sul sistema:
   ```bash
   # Con ss (moderno)
   ss -tuln
   
   # Con netstat (legacy)
   netstat -tuln
   ```
2. Identifica a quali processi sono associate le porte aperte:
   ```bash
   # Con ss
   sudo ss -tulnp
   
   # Con netstat
   sudo netstat -tulnp
   ```
3. Se disponibile, utilizza nmap per una scansione locale:
   ```bash
   # Scansione di base dell'host locale
   nmap -v localhost
   
   # Scansione del gateway (sostituisci con il tuo gateway)
   nmap -v 192.168.1.1
   ```
4. Utilizza telnet o nc per testare una connessione a una porta specifica:
   ```bash
   # Test di una porta HTTP
   nc -zv google.com 80
   
   # Test di una porta HTTPS
   nc -zv google.com 443
   ```

## Esercizio 6: Analisi del Traffico di Rete

1. Monitora il traffico di rete con il comando `ifstat` (se disponibile):
   ```bash
   ifstat -i eth0 1
   ```
2. Usa `iftop` per visualizzare l'utilizzo della banda in tempo reale (se disponibile):
   ```bash
   sudo iftop -i eth0
   ```
3. Cattura pacchetti con tcpdump (richiede permessi root):
   ```bash
   # Cattura base su un'interfaccia
   sudo tcpdump -i eth0 -c 10
   
   # Filtra per host e porta
   sudo tcpdump -i eth0 -c 20 host google.com and port 443
   
   # Salva la cattura su file
   sudo tcpdump -i eth0 -c 50 -w /tmp/capture.pcap
   ```
4. Analizza la cattura (opzionale, se disponibile Wireshark):
   ```bash
   # Visualizza la cattura
   tcpdump -r /tmp/capture.pcap
   ```

## Esercizio 7: Configurazione di Rete Temporanea

**ATTENZIONE**: Questi comandi possono interrompere la connettività di rete. Eseguili solo se sei connesso direttamente alla macchina o sei sicuro di poter ripristinare la connessione.

1. Visualizza la configurazione attuale e prendine nota:
   ```bash
   ip address show dev eth0
   ip route show
   ```
2. Aggiungi un indirizzo IP secondario:
   ```bash
   sudo ip address add 192.168.5.10/24 dev eth0
   ```
3. Verifica che l'indirizzo sia stato aggiunto:
   ```bash
   ip address show dev eth0
   ```
4. Aggiungi una rotta statica (sostituisci con indirizzi appropriati):
   ```bash
   sudo ip route add 10.0.0.0/24 via 192.168.1.254
   ```
5. Verifica la nuova rotta:
   ```bash
   ip route show
   ```
6. Alla fine, rimuovi l'indirizzo e la rotta temporanei:
   ```bash
   sudo ip address del 192.168.5.10/24 dev eth0
   sudo ip route del 10.0.0.0/24
   ```

## Esercizio 8: Download e Gestione File via HTTP/FTP

1. Scarica un file usando curl:
   ```bash
   # Download semplice
   curl -O https://releases.ubuntu.com/jammy/SHA256SUMS
   
   # Mostra informazioni durante il download
   curl -# -O https://releases.ubuntu.com/jammy/SHA256SUMS
   ```
2. Scarica un file usando wget:
   ```bash
   # Download semplice
   wget https://releases.ubuntu.com/jammy/SHA256SUMS
   
   # Riprendi download interrotto
   wget -c https://releases.ubuntu.com/jammy/SHA256SUMS
   ```
3. Esegui una richiesta HTTP e visualizza le informazioni di risposta:
   ```bash
   curl -I https://www.google.com
   ```
4. Scarica contenuto e salvalo con nome diverso:
   ```bash
   curl -o checksum.txt https://releases.ubuntu.com/jammy/SHA256SUMS
   ```
5. Simula un form POST:
   ```bash
   curl -X POST -d "name=test&email=test@example.com" https://httpbin.org/post
   ```

## Esercizio 9: Configurazione di SSH

1. Verifica se SSH è installato e in esecuzione:
   ```bash
   systemctl status ssh
   ```
2. Genera una coppia di chiavi SSH (se non ne hai già una):
   ```bash
   ssh-keygen -t ed25519 -C "esercizio-ssh"
   ```
3. Visualizza la tua chiave pubblica:
   ```bash
   cat ~/.ssh/id_ed25519.pub
   ```
4. Configura un file di configurazione SSH:
   ```bash
   mkdir -p ~/.ssh
   # Crea un file ~/.ssh/config con un host di esempio
   cat > ~/.ssh/config << EOF
   Host esempio
       HostName example.com
       User username
       Port 22
       IdentityFile ~/.ssh/id_ed25519
   EOF
   ```
5. Testa la connessione SSH usando un comando nullo (ma non connetterti effettivamente):
   ```bash
   ssh -v -o "StrictHostKeyChecking=no" -o "ConnectTimeout=5" user@localhost echo "Test SSH" 2>&1 | grep -i "connect"
   ```

## Esercizio 10: Creare uno Script per il Monitoraggio di Rete

Crea uno script chiamato `network_monitor.sh` che esegue verifiche di rete di base:

```bash
#!/bin/bash
# Script di monitoraggio di rete base

# Funzione per il test di ping
test_ping() {
    echo "Test di connettività per $1..."
    ping -c 4 $1 > /dev/null 2>&1
    if [ $? -eq 0 ]; then
        echo "✅ $1 è raggiungibile"
    else
        echo "❌ $1 non è raggiungibile"
    fi
}

# Titolo
echo "======================="
echo "MONITORAGGIO RETE BASE"
echo "======================="
echo "Data: $(date)"
echo "Hostname: $(hostname)"

# Informazioni di rete
echo -e "\nINFORMAZIONI DI RETE:"
echo "----------------------"
ip -br address show

echo -e "\nROUTING:"
echo "--------"
ip -br route show

echo -e "\nDNS CONFIG:"
echo "-----------"
cat /etc/resolv.conf

# Test di connettività
echo -e "\nTEST DI CONNETTIVITÀ:"
echo "--------------------"
test_ping 127.0.0.1
test_ping $(ip route | grep default | awk '{print $3}')
test_ping 8.8.8.8
test_ping google.com

# Statistiche di latenza
echo -e "\nSTATISTICHE DI LATENZA:"
echo "----------------------"
ping -c 10 8.8.8.8 | tail -2

# Porte in ascolto
echo -e "\nPORTE IN ASCOLTO:"
echo "----------------"
ss -tuln | head -20

echo -e "\nFine del monitoraggio"
echo "======================="
```

Rendi lo script eseguibile ed eseguilo:

```bash
chmod +x network_monitor.sh
./network_monitor.sh
```

## Verifica di Apprendimento

Rispondi alle seguenti domande:

1. Quale comando useresti per visualizzare l'indirizzo IP delle tue interfacce di rete?
2. Come testeresti la connettività di rete verso un server specifico?
3. Cosa indica un timeout in un comando `traceroute`?
4. Quali informazioni puoi ottenere con il comando `dig`?
5. Come puoi verificare quali porte sono in ascolto sul tuo sistema?
6. Qual è la differenza tra una porta TCP e una porta UDP?
7. Come puoi modificare temporaneamente l'indirizzo IP di un'interfaccia di rete?
8. Quali sono i vantaggi dell'utilizzo di curl rispetto a wget?
