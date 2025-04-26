#!/usr/bin/env bash
#-----------------------------------------------------------------------
# Script    : condicionais
# Descrição : Exemplos de testes de expressões condicionais
# Versão    : 0.1
# Autor     : Francisco Santos
# Data      : 25/04/2025
# Licença   : GNU/GPL v3.0
#-----------------------------------------------------------------------
# Uso: ./condicionais ou /caminho/condicionais
#-----------------------------------------------------------------------


clear

#Mensagem...

echo "O objetivo desse script é comparar o seu número com o número '5'."
read -p "Entre com um número de 1 a 10: " numero

# Tratar erros...

# =~ indica que a expressão da direita é uma REGEX
# ! negação ou inverso...
# ^ - indica o inicio da expressão, [0-9]- é uma lista de números que são permitidos, o + incica que há mais de um caracter  na lista, o $ indica o final da expressão.
[[ ! $numero =~ ^[0-9]+$ ]] && echo "Erro! Digite um *numero*!" && exit 1

# -le = less or equal
[[ $numero -gt 10 || $numero -le 0 ]] && echo " Erro! Seu número deve ser entre 1-10" && exit 1

# Respostas normais...

# -eq = equal
[[ $numero -eq 5 ]] &&  echo  "Seu número é igual a 5!" && exit 0

# -lt = less than
[[ $numero -lt 5 ]] &&  echo  "Seu número é menor que 5!" && exit 0

# -gt = greater than
[[ $numero -gt 5 ]] &&  echo  "Seu número é maior que 5!" && exit 0