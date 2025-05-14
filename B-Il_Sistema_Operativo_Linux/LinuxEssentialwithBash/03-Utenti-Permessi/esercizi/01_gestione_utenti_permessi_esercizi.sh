#!/bin/bash

# Esercizio Pratico: Gestione di Utenti, Gruppi e Permessi
# Obiettivo: Familiarizzare con i comandi per visualizzare informazioni su utenti e gruppi,
# e per comprendere e modificare i permessi di file e directory.

# NOTA IMPORTANTE:
# Molti comandi per la gestione di utenti e gruppi (useradd, usermod, userdel, groupadd, etc.)
# e per cambiare proprietario (chown, chgrp) richiedono privilegi di root (sudo).
# In questo script, ci concentreremo sulla visualizzazione e sulla simulazione,
# oppure opereremo su file e directory creati da noi stessi per i permessi.
# NON eseguire comandi con sudo a meno che tu non sappia esattamente cosa stai facendo
# e sia in un ambiente di test sicuro.

echo "-----------------------------------------------------"
echo "Parte 1: Visualizzazione Informazioni Utente e Gruppi"
echo "-----------------------------------------------------"

echo "1. Chi sono? (Comando: whoami)"
whoami
echo "---"

echo "2. Mostra il mio ID utente, ID gruppo e gruppi di appartenenza (Comando: id)"
id
echo "---"

echo "3. Elenca i gruppi a cui appartengo (Comando: groups)"
groups
echo "---"

# Simulazione lettura file di sistema (richiederebbe permessi)
echo "4. Visualizza le prime 5 righe di /etc/passwd (simulazione, il comando reale è 'head -n 5 /etc/passwd')"
echo "root:x:0:0:root:/root:/bin/bash"
echo "daemon:x:1:1:daemon:/usr/sbin:/usr/sbin/nologin"
echo "bin:x:2:2:bin:/bin:/usr/sbin/nologin"
echo "sys:x:3:3:sys:/dev:/usr/sbin/nologin"
echo "sync:x:4:65534:sync:/bin:/bin/sync"
echo "(Questo è un output di esempio)"
echo "---"

echo "5. Visualizza le prime 3 righe di /etc/group (simulazione, il comando reale è 'head -n 3 /etc/group')"
echo "root:x:0:"
echo "daemon:x:1:"
echo "bin:x:2:"
echo "(Questo è un output di esempio)"
echo "---"


echo "-----------------------------------------------------"
echo "Parte 2: Gestione dei Permessi (chmod)"
echo "-----------------------------------------------------"

# Creiamo alcuni file e directory di test
mkdir -p ./test_permessi/sottodir
touch ./test_permessi/mio_file.txt
touch ./test_permessi/script_test.sh
echo "File e directory di test creati in ./test_permessi"

echo "
6. Visualizza i permessi iniziali dei file e directory creati (Comando: ls -l ./test_permessi)"
ls -l ./test_permessi
ls -l ./test_permessi/sottodir
echo "---"

echo "7. Rendi 'script_test.sh' eseguibile per il proprietario (Comando: chmod u+x ./test_permessi/script_test.sh)"
chmod u+x ./test_permessi/script_test.sh
ls -l ./test_permessi/script_test.sh
echo "---"

echo "8. Rimuovi il permesso di scrittura per il gruppo da 'mio_file.txt' (Comando: chmod g-w ./test_permessi/mio_file.txt)"
chmod g-w ./test_permessi/mio_file.txt
ls -l ./test_permessi/mio_file.txt
echo "---"

echo "9. Imposta i permessi di 'mio_file.txt' a rw-r----- (proprietario: rw, gruppo: r, altri: nessuno) usando la notazione ottale (Comando: chmod 640 ./test_permessi/mio_file.txt)"
chmod 640 ./test_permessi/mio_file.txt
ls -l ./test_permessi/mio_file.txt
echo "---"

echo "10. Imposta i permessi della directory 'sottodir' a rwxr-x--- (proprietario: rwx, gruppo: rx, altri: nessuno) (Comando: chmod 750 ./test_permessi/sottodir)"
chmod 750 ./test_permessi/sottodir
ls -ld ./test_permessi/sottodir # Usiamo -d per visualizzare i permessi della directory stessa
echo "---"

echo "-----------------------------------------------------"
echo "Parte 3: Proprietario e Gruppo (chown, chgrp - Simulazione)"
echo "-----------------------------------------------------"

echo "NOTA: chown e chgrp richiedono privilegi di root per cambiare proprietario/gruppo a file non propri."
echo "Qui simuliamo i comandi."

echo "11. Simula il cambio di proprietario di 'mio_file.txt' a 'nuovoutente' (Comando: sudo chown nuovoutente ./test_permessi/mio_file.txt)"
echo "$ sudo chown nuovoutente ./test_permessi/mio_file.txt  # Esempio, non eseguito"
ls -l ./test_permessi/mio_file.txt # Il proprietario non cambierà senza sudo e utente esistente
echo "---"

echo "12. Simula il cambio di gruppo di 'mio_file.txt' a 'nuovogruppo' (Comando: sudo chgrp nuovogruppo ./test_permessi/mio_file.txt)"
echo "$ sudo chgrp nuovogruppo ./test_permessi/mio_file.txt # Esempio, non eseguito"
ls -l ./test_permessi/mio_file.txt # Il gruppo non cambierà senza sudo e gruppo esistente
echo "---"


echo "-----------------------------------------------------"
echo "Parte 4: umask"
echo "-----------------------------------------------------"

echo "13. Visualizza l'umask corrente (Comando: umask)"
umask
echo "---"

echo "14. Simula l'impostazione di un umask e la creazione di un file per vedere i permessi risultanti."
echo "(umask 022 è comune: file=644, dir=755)"
echo "(umask 027: file=640, dir=750)"
echo "Puoi provare a impostare un umask diverso in un'altra shell e creare file per vedere l'effetto."
echo "Esempio: (in un'altra shell) umask 077; touch file_privato.txt; ls -l file_privato.txt"
echo "---"


echo "-----------------------------------------------------"
echo "Parte 5: Permessi Speciali (SUID, SGID, Sticky Bit - Osservazione)"
echo "-----------------------------------------------------"

echo "15. Osserva i permessi di comandi comuni che potrebbero avere SUID/SGID."
echo "(Attenzione: l'output può variare a seconda del sistema)"
echo "Comando: ls -l /usr/bin/passwd /usr/bin/sudo /usr/bin/crontab"
ls -l /usr/bin/passwd /usr/bin/sudo /usr/bin/crontab 2>/dev/null || echo "Uno o più file non trovati o permessi negati per ls."
echo "Cerca la 's' nei permessi del proprietario (SUID) o del gruppo (SGID)."
echo "---"

echo "16. Osserva i permessi della directory /tmp (che di solito ha lo Sticky Bit)."
echo "Comando: ls -ld /tmp"
ls -ld /tmp
echo "Cerca la 't' nei permessi degli 'altri'."
echo "---"


echo "-----------------------------------------------------"
echo "Parte 6: sudo (Simulazione)"
echo "-----------------------------------------------------"

echo "17. Simula l'esecuzione di un comando con sudo."
echo "Il comando 'sudo nome_comando' esegue 'nome_comando' con i privilegi di root,"
echo "se l'utente è autorizzato nel file /etc/sudoers."
echo "Esempio: $ sudo apt update # Aggiornerebbe la lista dei pacchetti (richiede password)"
echo "---"


echo "
Esercizio completato. Ricorda di pulire i file di test se necessario:"
echo "rm -rf ./test_permessi"