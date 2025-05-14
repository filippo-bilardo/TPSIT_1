#!/bin/bash
# Esempio di utilizzo di set -u

echo "Questo script dimostra l'effetto di 'set -u'."
echo "Se si tenta di usare una variabile non definita, lo script terminerà."
echo ""

# Abilita l'uscita se si usa una variabile non definita
set -u

DEFINED_VAR="Questo è un valore definito."
echo "Variabile definita: $DEFINED_VAR"

echo ""
echo "Ora tento di accedere a una variabile non definita (UNDEFINED_VAR)..."

# Il seguente comando causerà un errore e lo script terminerà
# perché UNDEFINED_VAR non è stata inizializzata.
echo "Valore della variabile non definita: $UNDEFINED_VAR"

# Questa riga non verrà eseguita se 'set -u' è attivo
echo "Questo messaggio NON verrà visualizzato."
echo "Fine dello script."

# Nota: Per vedere l'effetto, esegui lo script.
# Se commenti 'set -u', lo script tenterà di stampare una stringa vuota
# per $UNDEFINED_VAR e continuerà l'esecuzione.
