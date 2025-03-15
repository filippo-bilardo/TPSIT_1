# Guida allo scripting con Bash

## Indice

### Parte I: Fondamenti

#### Capitolo 1: Introduzione alle Shell
- Storia delle shell Unix
- L'evoluzione di Bash
- Differenze tra shell e altri linguaggi di programmazione
- Installazione e configurazione di Bash

#### Capitolo 2: Primi passi con Bash
- La struttura di uno script Bash
- Shebang e permessi di esecuzione
- Commenti e documentazione
- Esecuzione di comandi e script
- Debugging di base

#### Capitolo 3: Variabili e Tipi di Dati
- Dichiarazione e assegnazione di variabili
- Tipi di dati in Bash
- Variabili d'ambiente
- Variabili speciali ($0, $1, $#, $@, $?, $$)
- Espansione delle variabili

#### Capitolo 4: Operatori e Espressioni
- Operatori aritmetici
- Operatori di confronto
- Operatori logici
- Espressioni regolari
- Espansione aritmetica

### Parte II: Strutture di Controllo

#### Capitolo 5: Strutture Condizionali
- Il costrutto if-then-else
- Test e confronti
- Il comando test e le parentesi quadre
- Operatori di confronto per stringhe e numeri
- Il costrutto case

#### Capitolo 6: Cicli
- Il ciclo for
- Il ciclo while
- Il ciclo until
- Comandi break e continue
- Cicli infiniti e come evitarli

#### Capitolo 7: Funzioni
- Definizione e chiamata di funzioni
- Passaggio di parametri
- Variabili locali e globali
- Valore di ritorno e stato di uscita
- Ricorsione

### Parte III: Input e Output

#### Capitolo 8: Gestione dell'Input
- Il comando read
- Lettura da file
- Argomenti da riga di comando
- Parametri posizionali
- Opzioni e getopt

#### Capitolo 9: Gestione dell'Output
- Redirezione standard (stdout, stderr)
- Pipe e filtri
- Formattazione dell'output con printf
- Colori e stili ANSI
- Logging

#### Capitolo 10: Manipolazione di File e Directory
- Operazioni su file e directory
- Test su file
- Permessi e proprietà
- Ricerca di file con find
- Archivi e compressione

### Parte IV: Tecniche Avanzate

#### Capitolo 11: Manipolazione del Testo
- Utilizzo di grep
- Utilizzo di sed
- Utilizzo di awk
- Elaborazione di CSV e dati strutturati
- Espressioni regolari avanzate

#### Capitolo 12: Processi e Job Control
- Creazione e gestione di processi
- Esecuzione in background
- Job control
- Segnali e trap
- Comunicazione tra processi

#### Capitolo 13: Networking con Bash
- Comandi di rete (ping, netstat, curl)
- Comunicazione client-server
- Trasferimento di file (scp, rsync)
- Automazione SSH
- Web scraping basilare

#### Capitolo 14: Interazione con il Sistema
- Informazioni di sistema
- Gestione degli utenti
- Scheduling con cron
- Monitoraggio delle risorse
- Integrazione con systemd

### Parte V: Best Practices e Applicazioni Reali

#### Capitolo 15: Sicurezza e Robustezza
- Gestione degli errori
- Validazione degli input
- Pratiche di sicurezza
- Hardening degli script
- Gestione dei permessi

#### Capitolo 16: Ottimizzazione e Performance
- Tecniche di ottimizzazione
- Profiling e benchmarking
- Alternative a Bash per task intensivi
- Parallelizzazione
- Gestione della memoria

#### Capitolo 17: Progetti Pratici
- Automazione di backup
- Monitoraggio di sistema
- Deployment automatizzato
- Elaborazione batch di file
- Creazione di menu interattivi

#### Capitolo 18: Integrazione con Altri Linguaggi
- Chiamare programmi esterni
- Integrazione con Python
- Integrazione con Perl
- Integrazione con C/C++
- Quando non usare Bash

### Appendici

#### Appendice A: Riferimento Rapido dei Comandi
- Comandi di sistema
- Utility di testo
- Comandi di rete
- Comandi di file system
- Comandi di processo

#### Appendice B: Variabili d'Ambiente Comuni
- Variabili di sistema
- Variabili di shell
- PATH e altre variabili critiche
- Configurazione della shell
- Personalizzazione del prompt

#### Appendice C: Compatibilità tra Shell
- Differenze tra Bash e altre shell
- Portabilità degli script
- POSIX compliance
- Bash su sistemi non-Unix
- Bash su Windows (WSL)

#### Appendice D: Risorse e Strumenti
- Documentazione ufficiale
- Strumenti di debugging
- Editor e IDE
- Comunità e forum
- Libri e tutorial consigliati