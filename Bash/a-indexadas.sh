#!/usr/bin/env bash
#-----------------------------------------------------------------------
# Script    : Arrays indexads
# Descrição : Exemplos de arrays indexadas
# Versão    : 0.1
# Autor     : Francisco Santos
# Data      : 28/04/2025
# Licença   : GNU/GPL v3.0
#-----------------------------------------------------------------------
# Uso: Servi para dar varios valores a uma saida.
#-----------------------------------------------------------------------

echo "\
Exemplos de trabalho com arrays indexadas...
"

frutas=("banana" "laranja" "abacate" "limão" "cereja"   "abacaxi")
Cores=("amarela" "laranja" "verde"   "verde" "vernelha" "amarelo")

read -p "Digite um número entre 0 e 5 : " numero

[[ ! $numero =~ ^[0-5]$ ]] \
   && echo -e "\nTem que ser um número entre 0 e 5! Saindo... \n" \
   && exit 1

echo "
Você escolheu ${frutas[$numero]}, que é uma fruta ${Cores[$numero]}.
"

exit 0