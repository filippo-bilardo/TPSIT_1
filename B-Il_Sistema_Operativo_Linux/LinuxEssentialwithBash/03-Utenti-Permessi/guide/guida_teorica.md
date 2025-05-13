# Guida Teorica: Gestione di Utenti e Permessi

Questa guida spiega i concetti fondamentali relativi agli utenti, ai gruppi e ai permessi in Linux.

## Utenti e Gruppi
- Ogni utente ha un identificativo (UID) e appartiene a uno o più gruppi (GID).
- Il file `/etc/passwd` contiene le informazioni sugli utenti.
- Il file `/etc/group` contiene le informazioni sui gruppi.

## Comandi Principali
- `id`: Visualizza UID, GID e gruppi dell'utente corrente.
- `whoami`: Mostra il nome dell'utente attuale.
- `groups`: Elenca i gruppi di appartenenza.
- `chmod`: Modifica i permessi di file e directory.
- `chown`: Cambia il proprietario di file e directory.
- `chgrp`: Cambia il gruppo di file e directory.

## Permessi
- I permessi principali sono: lettura (r), scrittura (w), esecuzione (x).
- I permessi sono assegnati a proprietario, gruppo e altri.

Questi concetti sono fondamentali per la sicurezza e la gestione multiutente di Linux.