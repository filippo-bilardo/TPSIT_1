#!/bin/bash
# Script di esempio: interazione con l'utente
echo "Come ti chiami?"
read nome
echo "Ciao $nome! Benvenuto nel corso Linux Essential with Bash."
echo "Quale distribuzione Linux stai utilizzando?"
read distro
echo "Ottima scelta! $distro è una buona distribuzione per imparare."
echo "Quanta esperienza hai con Linux? (principiante/intermedio/avanzato)"
read esperienza
case $esperienza in
    principiante)
        echo "Non preoccuparti, questo corso è progettato per aiutarti a partire da zero!"
        ;;
    intermedio)
        echo "Fantastico! Questo corso ti aiuterà a consolidare le tue conoscenze."
        ;;
    avanzato)
        echo "Ottimo! Potrai approfondire ulteriormente i tuoi skill con questo corso."
        ;;
    *)
        echo "Non ho riconosciuto la tua risposta, ma va bene comunque! Buon apprendimento!"
        ;;
esac
