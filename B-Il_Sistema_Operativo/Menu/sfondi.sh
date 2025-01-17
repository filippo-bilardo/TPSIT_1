#!/bin/bash
#
#   Questo file stampa molti codici-colore sul terminale per
#   mostrare quali sono disponibili. Ogni linea e` un colore su sfondo
#   nero o grigio, con il colore nel mezzo. E` verificato che funziona con
#   sfondo bianco, nero e verde (2 dic 98).
#
# definiamo delle variabili per i vari colori foreground
# e background
# per i colori di sfondo, aggiungiamo 10 al codice colore
# per i colori in grassetto, aggiungiamo 1 al codice colore
# per i colori sottolineati, aggiungiamo 4 al codice colore
# per i colori lampeggianti, aggiungiamo 5 al codice colore
# per i colori invertiti, aggiungiamo 7 al codice colore
# per i colori nascosti, aggiungiamo 8 al codice colore
# per i colori barrati, aggiungiamo 9 al codice colore
# per i colori cancellati, aggiungiamo 29 al codice colore
RED='\033[0;31m'
NC='\033[0m' # No Color
echo -e "${RED}Hello, World!${NC}"



echo "  On Light Gray:        On Black:"
echo -e "\033[47m\033[1;37m  White        \033[0m\
  1;37m \
\033[40m\033[1;37m  White        \033[0m"
echo -e "\033[47m\033[37m  Light Gray   \033[0m\
    37m \
\033[40m\033[37m  Light Gray   \033[0m"
echo -e "\033[47m\033[1;30m  Gray         \033[0m\
  1;30m \
\033[40m\033[1;30m  Gray         \033[0m"
echo -e "\033[47m\033[30m  Black        \033[0m\
    30m \
\033[40m\033[30m  Black        \033[0m"
echo -e "\033[47m\033[31m  Red          \033[0m\
    31m \
\033[40m\033[31m  Red          \033[0m"
echo -e "\033[47m\033[1;31m  Light Red    \033[0m\
  1;31m \
\033[40m\033[1;31m  Light Red    \033[0m"
echo -e "\033[47m\033[32m  Green        \033[0m\
    32m \
\033[40m\033[32m  Green        \033[0m"
echo -e "\033[47m\033[1;32m  Light Green  \033[0m\
  1;32m \
\033[40m\033[1;32m  Light Green  \033[0m"
echo -e "\033[47m\033[33m  Brown        \033[0m\
    33m \
\033[40m\033[33m  Brown        \033[0m"
echo -e "\033[47m\033[1;33m  Yellow       \033[0m\
  1;33m \
\033[40m\033[1;33m  Yellow       \033[0m"
echo -e "\033[47m\033[34m  Blue         \033[0m\
    34m \
\033[40m\033[34m  Blue         \033[0m"
echo -e "\033[47m\033[1;34m  Light Blue   \033[0m\
  1;34m \
\033[40m\033[1;34m  Light Blue   \033[0m"
echo -e "\033[47m\033[35m  Purple       \033[0m\
    35m \
\033[40m\033[35m  Purple       \033[0m"
echo -e "\033[47m\033[1;35m  Pink         \033[0m\
  1;35m \
\033[40m\033[1;35m  Pink         \033[0m"
echo -e "\033[47m\033[36m  Cyan         \033[0m\
    36m \
\033[40m\033[36m  Cyan         \033[0m"
echo -e "\033[47m\033[1;36m  Light Cyan   \033[0m\
  1;36m \
\033[40m\033[1;36m  Light Cyan   \033[0m"
# End of TPSIT_1/Menu/colori.sh


# Ciclo for per stampare uno spazio di vari colori
# ogni riga stampa un colore diverso

# Ciclo for per stampare uno spazio di vari colori
# ogni riga stampa un colore diverso
for i in {40..47}; do
    for j in {30..37}; do
        echo -en "\033[${i};${j}m ${i};${j} \033[0m"
    done
    echo
done