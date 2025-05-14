#!/bin/bash

# Esempio di input/output e redirezione in Bash
# Questo script dimostra vari metodi di redirezione e gestione I/O

# 1. Redirezione dell'output (stdout) a un file
echo "=== Redirezione dell'output (>) ==="
echo "Questo testo verrà scritto in un file" > output.txt
echo "File creato: output.txt"

# 2. Aggiunta (append) dell'output a un file
echo "\n=== Aggiunta dell'output (>>) ==="
echo "Questo testo verrà aggiunto al file" >> output.txt
echo "Contenuto aggiornato in output.txt"

# 3. Visualizzazione del contenuto del file
echo "\n=== Contenuto del file ==="
cat output.txt

# 4. Redirezione dell'errore standard (stderr)
echo "\n=== Redirezione dell'errore standard (2>) ==="
ls file_inesistente 2> errori.txt
echo "Errori salvati in errori.txt:"
cat errori.txt

# 5. Redirezione di stdout e stderr in file separati
echo "\n=== Redirezione di stdout e stderr in file separati ==="
ls -la output.txt file_inesistente > risultati.txt 2> errori2.txt
echo "Output standard in risultati.txt:"
cat risultati.txt
echo "Errori in errori2.txt:"
cat errori2.txt

# 6. Redirezione di stdout e stderr nello stesso file
echo "\n=== Redirezione di stdout e stderr nello stesso file (&>) ==="
ls -la output.txt file_inesistente &> tutto.txt
echo "Tutto l'output in tutto.txt:"
cat tutto.txt

# 7. Utilizzo di pipe (|)
echo "\n=== Utilizzo di pipe (|) ==="
echo "Conteggio delle righe nel file output.txt:"
cat output.txt | wc -l

# 8. Utilizzo del comando tee
echo "\n=== Utilizzo del comando tee ==="
echo "Questo testo va sia a schermo che nel file" | tee tee_output.txt
echo "Contenuto di tee_output.txt:"
cat tee_output.txt

# 9. Lettura dell'input utente con read
echo "\n=== Lettura dell'input utente con read ==="
echo -n "Inserisci il tuo nome: "
read nome
echo "Ciao, $nome!"

# 10. Here document (<<EOF)
echo "\n=== Here document (<<EOF) ==="
cat <<EOF > documento.txt
Questo è un esempio di here document.
Permette di scrivere testo su più righe
direttamente nello script.
EOF
echo "Contenuto di documento.txt:"
cat documento.txt

# 11. Here string (<<<)
echo "\n=== Here string (<<<) ==="
grep "esempio" <<< "Questo è un esempio di here string"

# 12. Redirezione dell'input da file
echo "\n=== Redirezione dell'input da file (<) ==="
echo "Conteggio delle parole in output.txt:"
wc -w < output.txt

# Pulizia dei file creati
echo "\n=== Pulizia dei file creati ==="
rm output.txt errori.txt errori2.txt risultati.txt tutto.txt tee_output.txt documento.txt
echo "File temporanei rimossi."

echo "\nEsempio completato!"