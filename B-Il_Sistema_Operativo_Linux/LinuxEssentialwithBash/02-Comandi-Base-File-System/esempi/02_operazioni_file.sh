#!/bin/bash
# Script di esempio: operazioni base su file e directory

# Crea una directory di test per gli esperimenti
echo "Creazione di una struttura di directory per test..."
mkdir -p test_filesystem/dir1 test_filesystem/dir2/subdir

# Crea alcuni file di test con contenuto
echo "Creazione di file di esempio..."
echo "Questo è il file 1" > test_filesystem/file1.txt
echo "Questo è il file 2" > test_filesystem/file2.txt
echo "Questo è un file nella dir1" > test_filesystem/dir1/file_dir1.txt
echo "Questo è un file nella subdir" > test_filesystem/dir2/subdir/file_subdir.txt

# Mostra la struttura creata
echo -e "\nStruttura creata:"
find test_filesystem -type f | sort

# Esempi di operazioni su file
echo -e "\nEsempi di manipolazione file:"
echo "- Copiamo file1.txt in file1_copia.txt"
cp test_filesystem/file1.txt test_filesystem/file1_copia.txt

echo "- Rinominiamo file2.txt in file2_rinominato.txt"
mv test_filesystem/file2.txt test_filesystem/file2_rinominato.txt

echo "- Creiamo un link simbolico a file1.txt"
ln -s test_filesystem/file1.txt test_filesystem/link_a_file1

echo "- Aggiungiamo testo a file1.txt"
echo "Testo aggiunto!" >> test_filesystem/file1.txt

# Mostra la struttura aggiornata
echo -e "\nStruttura aggiornata:"
find test_filesystem -type f -o -type l | sort

# Esempi di visualizzazione contenuto dei file
echo -e "\nContenuto di file1.txt:"
cat test_filesystem/file1.txt

# Pulizia (commentata per default)
# echo -e "\nPulizia della directory di test..."
# rm -rf test_filesystem

echo -e "\nScript completato. Puoi esaminare i file nella directory 'test_filesystem'."
echo "Per rimuovere i file di test, esegui: rm -rf test_filesystem"
