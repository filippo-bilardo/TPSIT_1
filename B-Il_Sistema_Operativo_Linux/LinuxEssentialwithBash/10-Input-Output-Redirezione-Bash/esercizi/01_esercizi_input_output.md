# Esercizi: Input/Output e Redirezione in Bash

Questi esercizi ti aiuteranno a praticare e consolidare le tue conoscenze su input, output e redirezione in Bash. Completa ogni esercizio creando uno script separato e testalo nel tuo ambiente Linux.

## Esercizio 1: Redirezione Base

Crea uno script che:
1. Crei un file chiamato `dati.txt` contenente i numeri da 1 a 10 (uno per riga)
2. Crei un secondo file chiamato `quadrati.txt` che contenga il quadrato di ogni numero in `dati.txt`
3. Crei un terzo file chiamato `risultato.txt` che contenga sia il numero originale che il suo quadrato, formattati come "Numero: X, Quadrato: Y"

Utilizza la redirezione dell'output e le pipe per completare l'esercizio.

## Esercizio 2: Gestione degli Errori

Crea uno script che:
1. Tenti di leggere tre file: `esistente.txt` (che dovrai creare), `inesistente1.txt` e `inesistente2.txt` (che non esistono)
2. Rediriga l'output standard in un file chiamato `successo.log`
3. Rediriga gli errori in un file chiamato `errori.log`
4. Alla fine, mostri il contenuto di entrambi i file

## Esercizio 3: Contatore di Parole

Crea uno script che:
1. Chieda all'utente di inserire una frase
2. Conti il numero di parole nella frase usando `wc -w`
3. Conti il numero di caratteri nella frase usando `wc -c`
4. Mostri entrambi i conteggi

Utilizza here strings (`<<<`) per passare l'input dell'utente ai comandi.

## Esercizio 4: Generatore di Report

Crea uno script che generi un report sul sistema usando here documents (`<<EOF`). Il report dovrebbe includere:
1. Data e ora correnti
2. Nome dell'utente corrente
3. Spazio disco disponibile
4. Memoria RAM disponibile
5. Processi in esecuzione dell'utente corrente

Il report dovrebbe essere salvato in un file chiamato `report_sistema.txt` e avere una formattazione leggibile.

## Esercizio 5: Filtro di Log

Crea uno script che:
1. Generi un file di log di esempio con almeno 20 righe, alcune contenenti la parola "ERROR", altre "WARNING" e altre "INFO"
2. Utilizzi `grep` e la redirezione per creare tre file separati: `errori.log`, `avvisi.log` e `info.log`, contenenti solo le righe corrispondenti
3. Alla fine, mostri il conteggio delle righe in ciascun file

## Sfida Avanzata: Processore di CSV

Crea uno script che:
1. Accetti un file CSV come input (crea un file di esempio con almeno 10 righe e 3 colonne)
2. Permetta all'utente di selezionare una colonna (1, 2 o 3)
3. Calcoli la somma, la media, il valore minimo e il valore massimo per quella colonna
4. Salvi i risultati in un file chiamato `statistiche.txt`

Utilizza comandi come `cut`, `sort`, `head`, `tail` e operatori di redirezione per manipolare i dati.