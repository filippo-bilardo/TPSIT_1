#!/bin/bash
# 04_traccia_percorso.sh

TARGET_HOST="${1:-google.com}" # Usa il primo argomento o google.com come default

echo "Tracciamento del percorso di rete verso: $TARGET_HOST..."

# traceroute è il comando classico, potrebbe richiedere sudo.
# tracepath è un'alternativa che solitamente non richiede sudo e funziona anche con IPv6.
if command -v tracepath &> /dev/null; then
  echo "Utilizzo di tracepath:"
  tracepath $TARGET_HOST
elif command -v traceroute &> /dev/null; then
  echo "Utilizzo di traceroute (potrebbe richiedere sudo per alcune funzionalità):"
  traceroute $TARGET_HOST
else
  echo "Né tracepath né traceroute trovati. Impossibile tracciare il percorso."
  exit 1
fi
