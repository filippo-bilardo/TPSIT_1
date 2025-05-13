# Guida Teorica: Processi e Gestione dei Servizi

Questa guida introduce i concetti fondamentali relativi ai processi e ai servizi in Linux.

## Processi
- Un processo è un programma in esecuzione.
- Ogni processo ha un identificativo (PID).
- Comandi utili:
  - `ps`: mostra i processi attivi
  - `top`: visualizza i processi in tempo reale
  - `kill`: termina un processo

## Servizi
- I servizi sono processi che girano in background (daemon).
- Comandi utili:
  - `systemctl status nome_servizio`: stato di un servizio
  - `systemctl start|stop|restart nome_servizio`: gestisce l'avvio/arresto/riavvio

Questi strumenti sono essenziali per monitorare e gestire il sistema Linux.