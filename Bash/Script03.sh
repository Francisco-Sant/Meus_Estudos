#!/usr/bin/env bash

#Opções...

editor="nano" # Aqui você pode colocar o editor da sua preferência (nano, vim, vi, etc...)

#Variaveis
# Cria uma variável com a data de hoje no formato dd/mm/aaaa
# Cria uma variável com o cabeçalho do script que será gerado
dia_de_hoje=$( date +'%d/%m/%Y' ) 

header="#!/usr/bin/env bash
#-----------------------------------------------------------------------
# Script    :
# Descrição :
# Versão    : 0.1
# Autor     : Francisco Santos
# Data      : $dia_de_hoje
# Licença   : GNU/GPL v3.0
#-----------------------------------------------------------------------
# Uso:
#-----------------------------------------------------------------------
"

# Testar se usuário passou o número certo de argumentos... (1 argumento)

# Aqui estamos testando se o número de argumentos passados é diferente de 1
# Se for diferente de 1, exibe uma mensagem e sai do script com código de erro 1
# A variável $# armazena o número de argumentos passados para o script
# A variável $1 armazena o primeiro argumento passado para o script
# O -ne é um operador lógico que significa "não"
# O [[ ]] é uma construção do bash que permite fazer testes lógicos
# O && é um operador lógico que significa "e"
[[ $# -ne 1 ]] && echo "Opa! Informe o nome do arquivo!" && exit 1

# Testar se o arquivo ja existe...

# O -f é um operador lógico que verifica se o arquivo existe
[[ -f $1 ]] && echo "O arquivo ja existe!" && exit 1

# Cria o arquivo com o cabeçalho do argumento passado
# O > é um operador que redireciona a saída do comando para o arquivo
echo "$header" > $1 

# Aqui deixando o arquivo executável
chmod +x $1
$editor $1

exit 0