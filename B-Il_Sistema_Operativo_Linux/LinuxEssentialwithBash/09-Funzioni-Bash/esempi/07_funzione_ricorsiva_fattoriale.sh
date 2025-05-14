#!/bin/bash
# 07_funzione_ricorsiva_fattoriale.sh

echo "Esempio di Funzione Ricorsiva: Calcolo del Fattoriale"

# Funzione ricorsiva per calcolare il fattoriale di un numero
# Fattoriale(n) = n * Fattoriale(n-1)
# Fattoriale(0) = 1
# Fattoriale(1) = 1
fattoriale() {
  local n=$1

  # Controllo per input non valido (non numerico o negativo)
  if ! [[ "$n" =~ ^[0-9]+$ ]]; then
    echo "Errore: L'input deve essere un numero intero non negativo." >&2
    return 1 # Status di errore
  fi

  # Caso base della ricorsione
  if [ "$n" -eq 0 ] || [ "$n" -eq 1 ]; then
    echo 1
    return 0
  fi

  # Passo ricorsivo
  # Prima calcola il fattoriale di (n-1)
  local temp_risultato
  temp_risultato=$(fattoriale $((n - 1)))
  local status_ricorsione=$?

  if [ $status_ricorsione -ne 0 ]; then
    # Propaga l'errore se la chiamata ricorsiva fallisce
    return $status_ricorsione
  fi

  # Poi moltiplica per n
  echo $((n * temp_risultato))
  return 0
}

# Test della funzione fattoriale
NUMERI_DA_TESTARE=(5 0 1 7 "ciao" -3 10)

for num in "${NUMERI_DA_TESTARE[@]}"; do
  echo "
Calcolo del fattoriale di '$num':"
  RISULTATO=$(fattoriale "$num")
  STATO=$?

  if [ $STATO -eq 0 ]; then
    echo "Fattoriale($num) = $RISULTATO"
  else
    echo "Impossibile calcolare il fattoriale di '$num'. (Stato: $STATO)"
  fi
done

# Attenzione con numeri grandi: Bash fa aritmetica intera e può andare in overflow
# o la ricorsione può diventare troppo profonda.
# echo "
Test con un numero più grande (potrebbe richiedere tempo o fallire):"
# RIS_GRANDE=$(fattoriale 20)
# if [ $? -eq 0 ]; then
#   echo "Fattoriale(20) = $RIS_GRANDE"
# else
#   echo "Errore nel calcolo di Fattoriale(20)."
# fi

echo "
Script terminato."
