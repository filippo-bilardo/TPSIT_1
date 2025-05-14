#!/bin/bash

# ================================================================
# Esempio di Manipolazione Avanzata di Stringhe in Bash
# ================================================================

# Questo script dimostra tecniche avanzate per la manipolazione di stringhe
# utilizzando regex, sed e awk in Bash

echo "=== MANIPOLAZIONE AVANZATA DI STRINGHE IN BASH ==="

# -----------------------------
# 1. Operazioni base su stringhe
# -----------------------------
echo -e "\n1. OPERAZIONI BASE SU STRINGHE"

testo="Linux Essential with Bash"
echo "Testo originale: $testo"

# Lunghezza della stringa
echo "Lunghezza: ${#testo}"

# Estrazione di sottostringhe
echo "Primi 5 caratteri: ${testo:0:5}"
echo "Dalla posizione 6 in poi: ${testo:6}"

# Sostituzione di sottostringhe
echo "Sostituzione 'Bash' con 'Shell': ${testo/Bash/Shell}"

# Maiuscolo e minuscolo
echo "Tutto maiuscolo: ${testo^^}"
echo "Tutto minuscolo: ${testo,,}"

# -----------------------------
# 2. Espressioni regolari (regex)
# -----------------------------
echo -e "\n2. ESPRESSIONI REGOLARI (REGEX)"

# Creiamo un file di esempio
cat > /tmp/esempio.txt << EOF
Nome: Mario Rossi, Email: mario.rossi@example.com, Tel: 123-456-7890
Nome: Anna Verdi, Email: anna.verdi@example.org, Tel: +39 02 1234567
Nome: Luca Bianchi, Email: luca.b@example.net, Tel: 333.1234567
Informazioni varie senza email o telefono
Un indirizzo email non valido: non.è.una@email
EOF

echo "File di esempio creato in /tmp/esempio.txt"

# Estrazione di email con grep e regex
echo -e "\nEmail estratte con grep:"
grep -E -o "[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}" /tmp/esempio.txt

# Estrazione di numeri di telefono con grep e regex
echo -e "\nNumeri di telefono estratti con grep:"
grep -E -o "[+]?[0-9. -]{7,}" /tmp/esempio.txt

# -----------------------------
# 3. Utilizzo di sed per manipolazione testo
# -----------------------------
echo -e "\n3. UTILIZZO DI SED"

# Sostituzione base
echo -e "\nSostituzione di 'Nome:' con 'Utente:'"
sed 's/Nome:/Utente:/g' /tmp/esempio.txt

# Estrazione di informazioni specifiche
echo -e "\nEstrazione solo delle righe con email:"
sed -n '/Email/p' /tmp/esempio.txt

# Eliminazione di parti di testo
echo -e "\nEliminazione dei numeri di telefono:"
sed 's/Tel: [^,]*//' /tmp/esempio.txt

# Inserimento di testo
echo -e "\nAggiunta di un prefisso a ogni riga:"
sed 's/^/[RECORD] /' /tmp/esempio.txt

# -----------------------------
# 4. Utilizzo di awk per elaborazione dati
# -----------------------------
echo -e "\n4. UTILIZZO DI AWK"

# Estrazione di colonne
echo -e "\nEstrazione dei nomi:"
awk -F'[,:]' '{print $2}' /tmp/esempio.txt

# Elaborazione condizionale
echo -e "\nSolo righe con email @example.com:"
awk '/example\.com/ {print $0}' /tmp/esempio.txt

# Calcoli e statistiche
echo -e "\nNumero di caratteri per riga:"
awk '{print NR ": " length($0) " caratteri"}' /tmp/esempio.txt

# Formattazione dell'output
echo -e "\nFormattazione in tabella:"
awk -F'[,:]' '{
    if (NF > 5) {
        printf "| %-20s | %-30s | %-15s |\n", $2, $4, $6
    }
}' /tmp/esempio.txt

# -----------------------------
# 5. Combinazione di tecniche
# -----------------------------
echo -e "\n5. COMBINAZIONE DI TECNICHE"

# Pipeline di comandi
echo -e "\nEstrazione e formattazione di email:"
grep -E -o "[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}" /tmp/esempio.txt | \
sed 's/@/ [at] /g' | \
awk '{print "Email: " $0}'

# Elaborazione avanzata con più strumenti
echo -e "\nCreazione di un report strutturato:"
echo "=== REPORT CONTATTI ===" > /tmp/report.txt
grep "Nome:" /tmp/esempio.txt | \
sed 's/Nome: \([^,]*\), Email: \([^,]*\), Tel: \(.*\)/\1|\2|\3/' | \
awk -F'|' '{
    printf "Contatto: %s\nEmail: %s\nTelefono: %s\n\n", $1, $2, $3
}' >> /tmp/report.txt

echo "Report creato in /tmp/report.txt:"
cat /tmp/report.txt

# -----------------------------
# 6. Pulizia
# -----------------------------
echo -e "\n6. PULIZIA"
rm -f /tmp/esempio.txt /tmp/report.txt
echo "File temporanei rimossi"

echo -e "\n=== FINE DELL'ESEMPIO ==="