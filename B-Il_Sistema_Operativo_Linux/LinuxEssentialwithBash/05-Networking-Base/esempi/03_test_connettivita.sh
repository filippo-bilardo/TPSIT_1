#!/bin/bash
# 03_test_connettivita.sh

TARGET_HOST="${1:-google.com}" # Usa il primo argomento o google.com come default
PACKET_COUNT=4

echo "Test di connettività verso: $TARGET_HOST con $PACKET_COUNT pacchetti..."

ping -c $PACKET_COUNT $TARGET_HOST

# Controlla l'exit status dell'ultimo comando (ping)
if [ $? -eq 0 ]; then
  echo "
$TARGET_HOST è raggiungibile."
else
  echo "
$TARGET_HOST non è raggiungibile o si è verificato un errore."
fi
