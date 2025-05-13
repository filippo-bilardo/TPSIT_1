# Guida: Input, Output e Redirezione in Bash

Questa guida spiega come gestire l'input e l'output nei comandi Bash e come utilizzare la redirezione per lavorare con file e flussi di dati.

## Input e Output standard
- **stdin**: flusso di input standard (tastiera)
- **stdout**: flusso di output standard (schermo)
- **stderr**: flusso di errore standard

## Redirezione dell'output
- `>`: sovrascrive un file con l'output
- `>>`: aggiunge l'output alla fine di un file
Esempio:
```bash
echo "Ciao" > output.txt
echo "Altro" >> output.txt
```

## Redirezione dell'input
- `<`: prende l'input da un file
Esempio:
```bash
cat < input.txt
```

## Pipe
- `|`: collega l'output di un comando all'input di un altro
Esempio:
```bash
ls | grep "txt"
```

## Redirezione degli errori
- `2>`: redirige stderr
Esempio:
```bash
ls file_inesistente 2> errori.txt
```

## Approfondimenti
Consulta le pagine man di Bash (`man bash`) per ulteriori dettagli su input, output e redirezione.