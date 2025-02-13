#!/bin/bash
#
#   Questo file stampa molti codici-colore sul terminale per
#   mostrare quali sono disponibili. Ogni linea e` un colore su sfondo
#   nero o grigio, con il colore nel mezzo. E` verificato che funziona con 
#   sfondo bianco, nero e verde (2 dic 98).
#
# http://www.pluto.it/sites/default/files/ildp/HOWTO/Bash-Prompt-HOWTO/Bash-Prompt-HOWTO-5.html
#
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