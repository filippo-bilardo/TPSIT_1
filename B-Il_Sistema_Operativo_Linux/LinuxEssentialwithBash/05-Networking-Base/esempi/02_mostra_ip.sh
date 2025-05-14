#!/bin/bash
# 02_mostra_ip.sh

echo "Indirizzi IP delle interfacce di rete attive:
"
# Mostra le informazioni sugli indirizzi IP, filtrando per le righe che contengono 'inet'
# e escludendo l'indirizzo di loopback (127.0.0.1)
# ip addr show | grep 'inet ' | grep -v '127.0.0.1'
ip addr show

echo "
Alternativa più concisa per IPv4 (potrebbe necessitare di Gawk):
"
# awk '/inet / && !/127.0.0.1/ {print $2}' <(ip addr show)

echo "
Per visualizzare solo gli indirizzi IPv4 delle interfacce UP:
"
# ip -4 addr show scope global up | awk '{print $2}'
