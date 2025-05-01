#!/usr/bin/env bash


read -p "Digite um nome: " nome
read -p "Digite o nome de um jornal: " jornal
read -p "Digite o nome de uma eça de roupa: " roupa


echo "
Você escolheu: $nome, $jornal, $roupa.
"

read -p "Digite um número de 1 a 3: " numero

frase[1]="$nome foi ao $jornal só de $roupa!"
frase[2]="$nome só consegui ver $jornal de $roupa!"
frase[3]="$nome viu no $jornal que usar $roupa esta na moda!"

echo "
${frase[$numero]}
"

exit 0