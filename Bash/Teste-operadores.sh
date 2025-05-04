#!/usr/bin/env bash


clear

echo "\
Operadores Aritimeticos Básicos:

**            exponeciação
+, /, %       multiplicação, divisão, resto de divisão
+, -          adição, subtração

Digite qualquer expressão com os operadores acima
e tecle enter para efetuar o cálculo

Exemplo: 2 + 2
"

read -p "Sua expressão: " expressao

[[ ${#expressao} -lt 1 ]] && exit

# Utilizando o comando 'let'...

let calc="$expressao"

echo "
- Utilizando o comando 'let \"$expressao\"':

$expresao = $calc
"
# Ultilizando o comando composto (( EXPRESSÃO ))...

((calc = $expressao))

echo "
- Utilizando o comando '(( $expressao ))':

$expressao = $calc
"

# Utilizando a expansão aritimética...

calc=$(( $expressao ))

echo "
- Utilizando a expansão aritimética '\$(( $expressao ))':

$expressao = $calc
"

# Alterando atribuição de inteiro 'declare -i var=EXPRESSÃO'...

declare -i calc="$expressao"

echo "
Alternando atribuição de inteiro 'declare -i var=\"$expressao\"':

$expressao = $calc
"
declare +i calc

exit