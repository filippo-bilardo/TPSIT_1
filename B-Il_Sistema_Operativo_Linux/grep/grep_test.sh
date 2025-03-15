#!/bin/bash

echo "Cerca tutte le righe che iniziano con foo:"
grep "^foo" file.txt
echo "-------------------"
echo "Cerca tutte le righe che contengono bar alla fine:"
grep "bar$" file.txt
echo "-------------------"
echo "Cerca tutte le righe che iniziano con abc o def:"
grep "^abc\|^def" file.txt
echo "-------------------"
echo "Cerca tutte le righe che contengono esattamente tre cifre numeriche:"
grep "[0-9][0-9][0-9]" file.txt
echo "-------------------"
echo "Cerca tutte le righe che contengono almeno quattro cifre numeriche:"
grep "[0-9]\{4\}" file.txt


