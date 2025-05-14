#!/usr/bin/env bash

for n in {1..10}; do
    [[ $n -gt 5 ]] && break || echo $n
done

echo "-----------------"

for n in {1..10}; do
    [[ $n -lt 6 ]] && continue || echo $n
done

# Descrição:

# O loop for itera sobre os números de 1 a 10 ({1..10}).
# Para cada valor de n, a condição [[ $n -gt 5 ]] é avaliada:
# Se n for maior que 5, o comando break é executado, encerrando o loop.
# Caso contrário, o número atual ($n) é exibido com echo $n.

#Comportamento:
# O loop imprime os números de 1 a 5.
# Quando n atinge 6, a condição [[ $n -gt 5 ]] é verdadeira, e o loop é interrompido.

# Descrição:

# O loop for novamente itera sobre os números de 1 a 10.
# Para cada valor de n, a condição [[ $n -lt 6 ]] é avaliada:
# Se n for menor que 6, o comando continue é executado, pulando para a próxima iteração do loop.
# Caso contrário, o número atual ($n) é exibido com echo $n.

# Comportamento:
# O loop ignora os números de 1 a 5 (devido ao continue).
# Quando n atinge 6 ou mais, a condição [[ $n -lt 6 ]] é falsa, e o número é exibido.
