#!/bin/bash
# 05_risolvi_dns.sh

DOMAIN_NAME="${1:-wikipedia.org}" # Usa il primo argomento o wikipedia.org come default

echo "Risoluzione DNS per: $DOMAIN_NAME"

echo "
--- Usando 'host' --- (semplice e comune)"
host $DOMAIN_NAME

echo "
--- Usando 'dig' (Domain Information Groper) --- (più dettagliato)"
# dig fornisce molte informazioni, qui mostriamo solo la sezione ANSWER di default
dig $DOMAIN_NAME +short

echo "
Query per record MX (Mail Exchange) con 'dig':"
dig MX $DOMAIN_NAME +short

echo "
Query per record NS (Name Server) con 'dig':"
dig NS $DOMAIN_NAME +short

echo "
Reverse DNS lookup (da IP a nome) - Esempio con un IP di Google DNS:"
GOOGLE_DNS_IP="8.8.8.8"
echo "Reverse lookup per $GOOGLE_DNS_IP con 'host':"
host $GOOGLE_DNS_IP
echo "Reverse lookup per $GOOGLE_DNS_IP con 'dig -x':"
dig -x $GOOGLE_DNS_IP +short
