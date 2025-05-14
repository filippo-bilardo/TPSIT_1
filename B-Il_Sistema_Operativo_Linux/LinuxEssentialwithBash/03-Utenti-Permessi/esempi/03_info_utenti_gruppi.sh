#!/bin/bash
# Script di esempio: informazioni su utenti e gruppi

echo "===== INFORMAZIONI UTENTI E GRUPPI ====="

# Informazioni sull'utente corrente
echo -e "\n== Informazioni sull'utente corrente =="
echo "Nome utente: $(whoami)"
echo "ID utente (UID): $(id -u)"
echo "ID gruppo primario (GID): $(id -g)"
echo "Nome gruppo primario: $(id -gn)"
echo "Gruppi a cui appartiene l'utente: $(id -Gn | tr ' ' ',')"
echo "Directory home: $HOME"
echo "Shell di login: $SHELL"

# Utenti presenti nel sistema
echo -e "\n== Primi 10 utenti presenti nel sistema =="
head -10 /etc/passwd | awk -F: '{print $1 "\t" $3 "\t" $6 "\t" $7}'
echo "(Usa 'cat /etc/passwd' per vedere tutti gli utenti)"

# Gruppi presenti nel sistema
echo -e "\n== Primi 10 gruppi presenti nel sistema =="
head -10 /etc/group | awk -F: '{print $1 "\t" $3 "\t" $4}'
echo "(Usa 'cat /etc/group' per vedere tutti i gruppi)"

# Utenti attualmente loggati
echo -e "\n== Utenti attualmente loggati =="
who

# Informazioni complete sull'utente corrente
echo -e "\n== Informazioni complete sull'utente corrente =="
id

# Ultimo login degli utenti
echo -e "\n== Ultimi login (primi 5) =="
last | head -5

# Visualizzazione degli utenti con shell di login valida
echo -e "\n== Utenti con shell di login valida =="
grep -v '/sbin/nologin\|/bin/false' /etc/passwd | cut -d: -f1,7 | head -10
echo "(Output limitato ai primi 10 utenti)"

# Informazioni sugli account di sistema vs utente
echo -e "\n== Account di sistema vs account utente =="
echo "Account di sistema (UID < 1000):"
awk -F: '$3 < 1000 {print $1}' /etc/passwd | head -5
echo "(Output limitato ai primi 5 account)"

echo "Account utente (UID >= 1000):"
awk -F: '$3 >= 1000 {print $1 " (UID: " $3 ")"}' /etc/passwd

echo -e "\n===== FINE INFORMAZIONI ====="
