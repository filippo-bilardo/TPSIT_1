#!/bin/bash
# Script di esempio: gestione dei permessi file

# Crea una directory di test per gli esperimenti
echo "Creazione di una directory di test..."
mkdir -p test_permessi

# Crea file con diversi permessi
echo "Creando file con diversi permessi..."
echo "File con permessi standard (644)" > test_permessi/file_standard.txt
echo "File di sola lettura" > test_permessi/file_read_only.txt
echo "File eseguibile" > test_permessi/file_executable.sh
echo "echo 'Questo script funziona!'" > test_permessi/script_test.sh

# Imposta i permessi
echo "Impostazione permessi sui file..."
chmod 644 test_permessi/file_standard.txt     # rw-r--r--
chmod 444 test_permessi/file_read_only.txt    # r--r--r--
chmod 755 test_permessi/file_executable.sh    # rwxr-xr-x
chmod +x test_permessi/script_test.sh         # Aggiunge permesso di esecuzione

# Mostra i permessi impostati
echo -e "\nPermessi dei file creati:"
ls -l test_permessi/

# Tenta operazioni con diversi permessi
echo -e "\nTest di operazioni con diversi permessi:"

echo "1. Lettura di file con permessi standard:"
cat test_permessi/file_standard.txt

echo -e "\n2. Tentativo di scrittura su file di sola lettura:"
echo "Questa operazione fallirà" >> test_permessi/file_read_only.txt 2>&1 || echo "Errore: Non è possibile scrivere su un file di sola lettura"

echo -e "\n3. Esecuzione di script con permesso di esecuzione:"
test_permessi/script_test.sh

# Mostra come modificare i permessi
echo -e "\nModifica dei permessi:"
echo "1. Aggiunta permesso di scrittura al file di sola lettura"
chmod u+w test_permessi/file_read_only.txt
echo "Ora possiamo scrivere" >> test_permessi/file_read_only.txt
echo "Contenuto aggiornato:"
cat test_permessi/file_read_only.txt

# Permessi speciali
echo -e "\nPermessi speciali:"
echo "1. Creazione file con SUID bit (permesso speciale s)"
echo "File con SUID bit" > test_permessi/file_suid.txt
chmod u+s test_permessi/file_suid.txt
ls -l test_permessi/file_suid.txt

echo "2. Creazione file con Sticky bit (permesso speciale t)"
mkdir test_permessi/sticky_dir
chmod 1777 test_permessi/sticky_dir
ls -ld test_permessi/sticky_dir

# Ripristino permessi
echo -e "\nRipristino permessi standard su tutti i file:"
chmod 644 test_permessi/*.txt
ls -l test_permessi/

echo -e "\nScript completato. I file di test si trovano nella directory 'test_permessi'."
