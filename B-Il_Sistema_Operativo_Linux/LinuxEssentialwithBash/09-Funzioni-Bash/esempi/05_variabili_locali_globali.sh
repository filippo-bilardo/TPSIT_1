#!/bin/bash
# 05_variabili_locali_globali.sh

echo "Esempio di Scope delle Variabili (Locali e Globali)"

# Variabile globale
VAR_GLOBALE="Sono globale"

funzione_con_variabili() {
  # Questa variabile è globale per default se non dichiarata 'local'
  VAR_FUNZIONE_GLOBALE="Sono globale, definita dentro la funzione"

  # Questa variabile è locale alla funzione grazie a 'local'
  local VAR_FUNZIONE_LOCALE="Sono locale, definita dentro la funzione"

  echo "Dentro la funzione:"
  echo "  VAR_GLOBALE: $VAR_GLOBALE (accessibile)"
  echo "  VAR_FUNZIONE_GLOBALE: $VAR_FUNZIONE_GLOBALE"
  echo "  VAR_FUNZIONE_LOCALE: $VAR_FUNZIONE_LOCALE"

  # Modifichiamo la variabile globale
  VAR_GLOBALE="Globale modificata dalla funzione"
}

funzione_locale_con_stesso_nome() {
  local VAR_GLOBALE="Sono una variabile locale con lo stesso nome di una globale!"
  echo "Dentro funzione_locale_con_stesso_nome:"
  echo "  VAR_GLOBALE (locale qui): $VAR_GLOBALE"
}

echo "Prima della chiamata alla funzione:"
echo "  VAR_GLOBALE: $VAR_GLOBALE"
# echo "  VAR_FUNZIONE_GLOBALE: $VAR_FUNZIONE_GLOBALE" # Errore: non ancora definita
# echo "  VAR_FUNZIONE_LOCALE: $VAR_FUNZIONE_LOCALE"   # Errore: non accessibile e non definita globalmente

echo "
Chiamo funzione_con_variabili..."
funzione_con_variabili

echo "
Dopo la chiamata a funzione_con_variabili:"
echo "  VAR_GLOBALE: $VAR_GLOBALE (modificata)"
echo "  VAR_FUNZIONE_GLOBALE: $VAR_FUNZIONE_GLOBALE (accessibile perché globale)"
# echo "  VAR_FUNZIONE_LOCALE: $VAR_FUNZIONE_LOCALE" # Errore: non accessibile, era locale alla funzione
if [ -z "${VAR_FUNZIONE_LOCALE+x}" ]; then
    echo "  VAR_FUNZIONE_LOCALE non è settata globalmente (come atteso)."
else
    echo "  VAR_FUNZIONE_LOCALE è settata a: $VAR_FUNZIONE_LOCALE (inatteso)."
fi

echo "
Chiamo funzione_locale_con_stesso_nome..."
funzione_locale_con_stesso_nome

echo "
Dopo la chiamata a funzione_locale_con_stesso_nome:"
echo "  VAR_GLOBALE: $VAR_GLOBALE (non modificata dalla seconda funzione, perché quella usava una locale)"

echo "
Script terminato."
