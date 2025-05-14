#!/bin/bash
# Script di esempio: ricerca di file

# Crea una directory di test se non esiste e alcuni file per la dimostrazione
if [ ! -d "demo_find" ]; then
    echo "Creazione directory di dimostrazione..."
    mkdir -p demo_find/dir1/subdir1 demo_find/dir2 demo_find/dir3/subdir2
    
    # Crea file di vari tipi
    echo "Creazione file di esempio..."
    touch demo_find/file1.txt
    touch demo_find/file2.log
    touch demo_find/dir1/file3.txt
    touch demo_find/dir1/file4.log
    touch demo_find/dir1/subdir1/file5.txt
    touch demo_find/dir1/subdir1/file6.conf
    touch demo_find/dir2/file7.txt
    touch demo_find/dir2/file8.md
    touch demo_find/dir3/file9.txt
    touch demo_find/dir3/subdir2/file10.log
    
    # Crea alcuni file con permessi speciali
    chmod 600 demo_find/file1.txt
    chmod 755 demo_find/dir1/file3.txt
    chmod 444 demo_find/dir2/file7.txt
    
    # Crea alcuni file con date diverse
    touch -d "2 days ago" demo_find/file2.log
    touch -d "1 week ago" demo_find/dir1/file4.log
    
    echo "Directory di dimostrazione creata."
fi

echo -e "\n=== ESEMPI DI RICERCA CON FIND ==="

echo -e "\n1. Trova tutti i file .txt:"
find demo_find -name "*.txt"

echo -e "\n2. Trova tutti i file .log nelle sottodirectory:"
find demo_find -name "*.log" -type f

echo -e "\n3. Trova tutte le directory:"
find demo_find -type d

echo -e "\n4. Trova file modificati meno di 3 giorni fa:"
find demo_find -type f -mtime -3

echo -e "\n5. Trova file di dimensione zero (vuoti):"
find demo_find -type f -size 0

echo -e "\n6. Trova file con permessi di sola lettura:"
find demo_find -type f -perm -444 ! -perm /222

echo -e "\n7. Trova ed esegui un comando sui file trovati (mostra i file .txt):"
find demo_find -name "*.txt" -exec ls -l {} \;

echo -e "\n=== ESEMPI DI RICERCA CON LOCATE (se installato) ==="
if command -v locate >/dev/null 2>&1; then
    echo -e "\nPrima di usare locate, aggiorniamo il database:"
    sudo updatedb
    echo -e "\nCerca file con 'txt' nel nome:"
    locate txt | grep demo_find
else
    echo -e "\nIl comando 'locate' non è installato. Puoi installarlo con:"
    echo "sudo apt-get install mlocate  # per Debian/Ubuntu"
    echo "sudo yum install mlocate      # per CentOS/RHEL"
fi

echo -e "\n=== ESEMPI DI UTILIZZO DI GREP ==="

echo -e "\n1. Cerca in tutti i file .txt contenenti la parola 'file':"
grep -l "file" demo_find/*.txt 2>/dev/null

echo -e "\n=== ESEMPIO DI RICERCA AVANZATA ==="
echo -e "\nCerca tutti i file .log modificati nell'ultima settimana e mostra i dettagli:"
find demo_find -name "*.log" -type f -mtime -7 -exec ls -lh {} \;

echo -e "\nScript completato. I file di dimostrazione si trovano nella directory 'demo_find'."
