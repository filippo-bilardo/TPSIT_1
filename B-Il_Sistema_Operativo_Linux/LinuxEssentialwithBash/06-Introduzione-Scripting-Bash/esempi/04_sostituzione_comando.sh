#!/bin/bash
# 04_sostituzione_comando.sh

echo "Questo script dimostra la sostituzione di comando."

# Esempio 1: Ottenere la data corrente
DATA_CORRENTE=$(date)
echo "La data e ora corrente sono: $DATA_CORRENTE"

# Esempio 2: Ottenere l'utente corrente
UTENTE_CORRENTE=`whoami`
echo "L'utente corrente è: $UTENTE_CORRENTE"

# Esempio 3: Contare i file nella directory corrente
NUMERO_FILE=$(ls -1 | wc -l)
echo "Ci sono $NUMERO_FILE file/directory nella directory corrente (output di 'ls -1 | wc -l')."

# Esempio 4: Usare l'output di un comando direttamente in una stringa
echo "La versione del kernel è: $(uname -r)"

# Esempio 5: Creare un nome di file univoco con la data
NOME_FILE_BACKUP="backup_$(date +%Y-%m-%d_%H-%M-%S).tar.gz"
echo "Un possibile nome per un file di backup potrebbe essere: $NOME_FILE_BACKUP"

echo "
Script terminato."
