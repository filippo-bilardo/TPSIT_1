# Guida Avanzata alla Gestione di Utenti, Gruppi e Permessi in Linux

## Introduzione

La gestione di utenti, gruppi e permessi è un aspetto fondamentale dell'amministrazione di sistemi Linux. Un sistema di permessi ben configurato garantisce che gli utenti possano accedere solo alle risorse necessarie, proteggendo al contempo il sistema e i dati sensibili. Questa guida approfondisce i concetti e i comandi necessari per gestire efficacemente utenti, gruppi e permessi in un ambiente Linux.

## Utenti e Gruppi in Linux

### Concetti Fondamentali

In Linux, ogni utente è identificato da:
- **Nome utente (username)**: Identificativo testuale (es: mario)
- **User ID (UID)**: Identificativo numerico
  - 0: root (superuser)
  - 1-999: account di sistema (servizi, daemons)
  - 1000+: account utente regolari (il valore iniziale può variare tra distribuzioni)
- **Gruppo primario**: Ogni utente appartiene a un gruppo primario
- **Gruppi secondari**: Un utente può appartenere a più gruppi secondari

I gruppi sono identificati da:
- **Nome gruppo**: Identificativo testuale
- **Group ID (GID)**: Identificativo numerico

### File di Configurazione

I dati degli utenti e dei gruppi sono memorizzati in diversi file di sistema:

- **/etc/passwd**: Contiene informazioni sugli utenti
  ```
  username:x:UID:GID:GECOS:home_directory:shell
  ```
  - username: nome utente
  - x: posizione della password (ora in /etc/shadow)
  - UID: User ID
  - GID: Group ID primario
  - GECOS: informazioni utente (nome completo, telefono, ecc.)
  - home_directory: percorso della home directory
  - shell: shell predefinita

- **/etc/shadow**: Contiene le password crittografate e le informazioni sulla scadenza
  ```
  username:password_hash:lastchange:min:max:warn:inactive:expire:reserved
  ```
  - password_hash: hash della password
  - lastchange: giorni dalla modifica della password (dal 1 gennaio 1970)
  - min: giorni minimi prima di poter cambiare password
  - max: giorni massimi di validità della password
  - warn: giorni di preavviso prima della scadenza
  - inactive: giorni di inattività prima che l'account venga disabilitato
  - expire: data di scadenza assoluta (giorni dal 1 gennaio 1970)

- **/etc/group**: Contiene informazioni sui gruppi
  ```
  group_name:x:GID:user_list
  ```
  - group_name: nome del gruppo
  - x: posizione della password (obsoleto)
  - GID: Group ID
  - user_list: lista degli utenti nel gruppo, separati da virgole

- **/etc/gshadow**: Contiene password e amministratori di gruppo
  ```
  group_name:password:administrators:members
  ```

## Gestione degli Utenti

### Creazione di Utenti

Il comando principale per creare utenti è `useradd`:

```bash
# Sintassi base
sudo useradd nuovoutente

# Creazione completa con opzioni
sudo useradd -m -d /home/mario -s /bin/bash -c "Mario Rossi" -G sudo,developers mario
```

Opzioni principali:
- `-m`: Crea la home directory
- `-d /path`: Specifica un percorso custom per la home
- `-s /path/to/shell`: Imposta la shell di login
- `-c "commento"`: Aggiunge un commento (campo GECOS)
- `-G group1,group2`: Assegna gruppi secondari
- `-g group`: Imposta il gruppo primario
- `-e YYYY-MM-DD`: Imposta la data di scadenza
- `-p password`: Imposta la password (sconsigliato, meglio usare passwd)

Alternativamente, si può usare il comando più user-friendly `adduser` (disponibile principalmente su Debian/Ubuntu):

```bash
sudo adduser nuovoutente
```

Questo comando è interattivo e guida l'amministratore nel processo di creazione.

### Impostazione e Modifica della Password

```bash
# Impostare la password per un utente (richiede privilegi root)
sudo passwd username

# L'utente può cambiare la propria password
passwd
```

### Modifica degli Utenti

Il comando per modificare utenti esistenti è `usermod`:

```bash
# Cambiare la shell
sudo usermod -s /bin/bash username

# Aggiungere l'utente a gruppi supplementari
sudo usermod -aG gruppo1,gruppo2 username

# Cambiare il nome utente
sudo usermod -l nuovo_nome vecchio_nome

# Bloccare/sbloccare account
sudo usermod -L username  # blocca
sudo usermod -U username  # sblocca

# Impostare data di scadenza
sudo usermod -e 2023-12-31 username
```

Opzioni principali:
- `-s shell`: Cambia la shell
- `-c "commento"`: Modifica il campo commento
- `-d home_dir`: Cambia la home directory (senza spostare i file)
- `-m -d home_dir`: Cambia la home e sposta i file
- `-g gruppo`: Cambia il gruppo primario
- `-G gruppo1,gruppo2`: Sostituisce tutti i gruppi secondari
- `-aG gruppo1,gruppo2`: Aggiunge ai gruppi secondari
- `-l nuovo_nome`: Cambia il nome utente
- `-L`: Blocca l'account
- `-U`: Sblocca l'account
- `-e YYYY-MM-DD`: Imposta la data di scadenza

### Cancellazione di Utenti

```bash
# Cancellare l'utente senza rimuovere la home directory
sudo userdel username

# Cancellare l'utente e la sua home directory
sudo userdel -r username
```

Nelle distribuzioni Debian/Ubuntu, si può usare anche:

```bash
sudo deluser username
sudo deluser --remove-home username
```

### Visualizzazione degli Utenti

```bash
# Visualizzare tutti gli utenti
cat /etc/passwd

# Estrarre solo i nomi utente
cut -d: -f1 /etc/passwd

# Visualizzare gli utenti con una shell valida
grep -v '/sbin/nologin\|/bin/false' /etc/passwd

# Visualizzare informazioni sull'utente corrente
id
whoami
```

## Gestione dei Gruppi

### Creazione di Gruppi

```bash
# Creare un nuovo gruppo
sudo groupadd nome_gruppo

# Creare un gruppo con GID specifico
sudo groupadd -g 1100 nome_gruppo
```

### Modifica dei Gruppi

```bash
# Cambiare il nome di un gruppo
sudo groupmod -n nuovo_nome vecchio_nome

# Cambiare il GID di un gruppo
sudo groupmod -g 1200 nome_gruppo
```

### Eliminazione di Gruppi

```bash
# Eliminare un gruppo
sudo groupdel nome_gruppo
```

### Gestione degli Utenti nei Gruppi

```bash
# Aggiungere un utente a un gruppo
sudo usermod -aG nome_gruppo username
# oppure
sudo gpasswd -a username nome_gruppo

# Rimuovere un utente da un gruppo
sudo gpasswd -d username nome_gruppo

# Impostare gli amministratori di un gruppo
sudo gpasswd -A user1,user2 nome_gruppo
```

### Visualizzazione dei Gruppi

```bash
# Visualizzare tutti i gruppi
cat /etc/group

# Visualizzare i gruppi di cui fa parte l'utente corrente
groups

# Visualizzare i gruppi di un utente specifico
groups username
```

## Permessi dei File

### Comprensione dei Permessi

In Linux, ogni file e directory ha tre livelli di permessi:
- **Proprietario (Owner)**: L'utente che possiede il file
- **Gruppo (Group)**: Il gruppo associato al file
- **Altri (Others)**: Tutti gli altri utenti

Per ciascuno di questi livelli, ci sono tre tipi di permessi:
- **Lettura (Read, r)**: Permette di leggere il contenuto
- **Scrittura (Write, w)**: Permette di modificare il contenuto
- **Esecuzione (Execute, x)**: Permette di eseguire il file se è uno script o un binario

Per le directory, questi permessi hanno un significato diverso:
- **Lettura (r)**: Permette di visualizzare il contenuto della directory
- **Scrittura (w)**: Permette di creare, cancellare o rinominare file nella directory
- **Esecuzione (x)**: Permette di accedere alla directory e ai file al suo interno

### Visualizzazione dei Permessi

Usando il comando `ls -l` si ottiene una rappresentazione dei permessi:

```
-rwxr-xr-- 1 mario developers 5369 Apr 23 10:25 script.sh
```

La prima colonna mostra:
- Primo carattere: tipo di file (`-` = file regolare, `d` = directory, `l` = link simbolico)
- Caratteri 2-4: permessi per il proprietario (`rwx`)
- Caratteri 5-7: permessi per il gruppo (`r-x`)
- Caratteri 8-10: permessi per gli altri (`r--`)

### Modifica dei Permessi con chmod

#### Notazione Simbolica

```bash
# Aggiungere permesso di esecuzione per il proprietario
chmod u+x file.sh

# Rimuovere permesso di scrittura per gli altri
chmod o-w file.txt

# Impostare lettura e scrittura per il gruppo
chmod g=rw file.txt

# Impostare permessi per tutti i livelli
chmod a=r file.txt

# Combinare modifiche
chmod u+rwx,g+rx,o-rwx file.sh
```

Operatori:
- `+`: Aggiunge permessi
- `-`: Rimuove permessi
- `=`: Imposta esattamente i permessi specificati

Target:
- `u`: Proprietario (user)
- `g`: Gruppo (group)
- `o`: Altri (others)
- `a`: Tutti (all)

Permessi:
- `r`: Lettura (read)
- `w`: Scrittura (write)
- `x`: Esecuzione (execute)

#### Notazione Ottale

I permessi possono essere rappresentati come numeri ottali:
- `4`: Lettura (r)
- `2`: Scrittura (w)
- `1`: Esecuzione (x)

Combinando questi valori:
- `7` (4+2+1) = rwx
- `6` (4+2) = rw-
- `5` (4+1) = r-x
- `4` (4) = r--
- `0` (0) = ---

```bash
# Imposta rwxr-xr-- (proprietario: tutto, gruppo: lettura+esecuzione, altri: solo lettura)
chmod 754 file.sh

# Imposta rw-rw-r-- (lettura e scrittura per proprietario e gruppo, solo lettura per altri)
chmod 664 file.txt

# Imposta rwx------ (tutto per il proprietario, niente per gruppo e altri)
chmod 700 script.sh
```

### Modifica del Proprietario con chown

```bash
# Cambiare il proprietario
sudo chown username file.txt

# Cambiare proprietario e gruppo
sudo chown username:groupname file.txt

# Cambiare ricorsivamente per una directory
sudo chown -R username:groupname directory/
```

### Modifica del Gruppo con chgrp

```bash
# Cambiare il gruppo
sudo chgrp groupname file.txt

# Cambiare ricorsivamente per una directory
sudo chgrp -R groupname directory/
```

## Permessi Speciali

### SUID (Set User ID)

Quando applicato a un eseguibile, permette di eseguirlo con i privilegi del proprietario del file.

```bash
# Impostare SUID
chmod u+s file
# o in notazione ottale (4 davanti ai permessi normali)
chmod 4755 file
```

Nell'output di `ls -l`, appare come `s` al posto di `x` nei permessi del proprietario: `-rwsr-xr-x`.

### SGID (Set Group ID)

Quando applicato a un eseguibile, permette di eseguirlo con i privilegi del gruppo del file.
Quando applicato a una directory, i nuovi file creati erediteranno il gruppo della directory.

```bash
# Impostare SGID
chmod g+s file_or_directory
# o in notazione ottale (2 davanti ai permessi normali)
chmod 2755 file_or_directory
```

Nell'output di `ls -l`, appare come `s` al posto di `x` nei permessi del gruppo: `-rwxr-sr-x`.

### Sticky Bit

Quando applicato a una directory, impedisce agli utenti di cancellare o rinominare i file creati da altri utenti all'interno di quella directory, anche se hanno permessi di scrittura sulla directory stessa. Comune in /tmp.

```bash
# Impostare Sticky Bit
chmod +t directory
# o in notazione ottale (1 davanti ai permessi normali)
chmod 1777 directory
```

Nell'output di `ls -l`, appare come `t` al posto di `x` nei permessi degli altri: `drwxrwxrwt`.

## Access Control Lists (ACL)

Le ACL permettono un controllo dei permessi più granulare rispetto al modello tradizionale.

### Installazione degli Strumenti ACL

```bash
# Debian/Ubuntu
sudo apt install acl

# CentOS/RHEL/Fedora
sudo dnf install acl
```

### Visualizzazione delle ACL

```bash
# Visualizzare le ACL di un file
getfacl file.txt
```

### Impostazione delle ACL

```bash
# Dare permessi di lettura e scrittura a un utente specifico
setfacl -m u:username:rw file.txt

# Dare permessi a un gruppo specifico
setfacl -m g:groupname:rx file.txt

# Impostare ACL predefinite per nuovi file in una directory
setfacl -d -m u:username:rw directory/

# Rimuovere ACL specifiche
setfacl -x u:username file.txt

# Rimuovere tutte le ACL
setfacl -b file.txt
```

## Sudo e Privilegi Amministrativi

### Il Comando sudo

`sudo` (Superuser Do) permette a utenti autorizzati di eseguire comandi con i privilegi di un altro utente, tipicamente root.

```bash
# Eseguire un comando come root
sudo comando

# Eseguire un comando come un altro utente
sudo -u username comando

# Aprire una shell con privilegi di root
sudo -i
```

### Configurazione di sudo

La configurazione principale è in `/etc/sudoers` e in `/etc/sudoers.d/`.
È fortemente consigliato modificare questi file con il comando `visudo` che controlla la sintassi prima di salvare.

```bash
# Modificare il file sudoers
sudo visudo
```

Esempio di regole in sudoers:

```
# Permettere all'utente 'mario' di eseguire qualsiasi comando come root senza password
mario ALL=(ALL) NOPASSWD: ALL

# Permettere agli utenti del gruppo 'developers' di eseguire solo specifici comandi
%developers ALL=(ALL) /bin/ls, /bin/cat
```

## Tecniche Avanzate

### umask (User Mask)

`umask` controlla i permessi predefiniti per i nuovi file e directory.

```bash
# Visualizzare umask corrente
umask

# Impostare nuovo umask (limita i permessi sottraendo dal valore massimo)
umask 022  # Risulta in 755 per directory e 644 per file
```

### chattr (Change Attributes)

`chattr` modifica attributi estesi dei file su filesystem ext2/3/4.

```bash
# Rendere un file immutabile (nemmeno root può modificarlo)
sudo chattr +i file.txt

# Rimuovere l'attributo immutabile
sudo chattr -i file.txt

# Visualizzare attributi
lsattr file.txt
```

### Controllo di Accesso Obbligatorio (MAC)

Sistemi come SELinux e AppArmor implementano controlli di accesso obbligatorio che vanno oltre il sistema di permessi tradizionale.

#### SELinux
```bash
# Visualizzare stato SELinux
getenforce

# Visualizzare contesto di sicurezza
ls -Z file.txt

# Modificare contesto
chcon -t httpd_sys_content_t file.txt
```

#### AppArmor
```bash
# Visualizzare stato
aa-status

# Modificare profilo
sudo apparmor_parser -r /etc/apparmor.d/profile
```

## Conclusione

La gestione di utenti, gruppi e permessi è essenziale per mantenere un sistema Linux sicuro ed efficiente. Combinando i comandi e le tecniche descritte in questa guida, gli amministratori possono:

1. Creare e gestire account utente in modo efficace
2. Organizzare gli utenti in gruppi logici
3. Applicare permessi appropriati a file e directory
4. Implementare controlli di accesso granulari attraverso ACL
5. Delegare privilegi amministrativi in modo sicuro con sudo

Ricordate che una buona pratica è seguire il principio del privilegio minimo: dare agli utenti solo i permessi strettamente necessari per svolgere le loro attività.

Con la pratica e la comprensione approfondita di questi concetti, sarete in grado di implementare una solida strategia di gestione degli accessi adatta alle vostre esigenze specifiche.
