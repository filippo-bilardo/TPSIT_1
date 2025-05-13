# Guida: Networking di Base in Linux

Questa guida introduce i concetti fondamentali del networking in ambiente Linux. Imparerai a visualizzare e configurare le interfacce di rete, a utilizzare i principali comandi per il troubleshooting e a comprendere il funzionamento di base dei protocolli di rete.

## Concetti chiave
- **Indirizzo IP**: Identifica univocamente un dispositivo in una rete.
- **Subnet mask**: Definisce la porzione di rete e di host di un indirizzo IP.
- **Gateway**: Dispositivo che instrada il traffico verso altre reti.
- **DNS**: Sistema che traduce i nomi di dominio in indirizzi IP.

## Comandi principali
- `ifconfig` / `ip addr`: Visualizza e configura le interfacce di rete.
- `ping`: Verifica la raggiungibilità di un host.
- `traceroute`: Mostra il percorso dei pacchetti verso una destinazione.
- `netstat` / `ss`: Visualizza le connessioni di rete attive.
- `route`: Mostra e modifica la tabella di routing.

## Esempio di utilizzo
Per visualizzare le interfacce di rete:
```bash
ip addr
```
Per verificare la connessione a un sito:
```bash
ping www.google.com
```

## Approfondimenti
Consulta la documentazione ufficiale di Linux e le pagine man (`man nome_comando`) per ulteriori dettagli sui comandi.