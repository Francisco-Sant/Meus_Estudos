#!/usr/bin/env bash
#-----------------------------------------------------------------------
# Script    : Checapid
# Descrição : Compara PID do sricpt e do shell no terminal
# Versão    : 0.1
# Autor     : Francisco Santos
# Data      : 25/04/2025
# Licença   : GNU/GPL v3.0
#-----------------------------------------------------------------------
# Uso: /caminho/checapid ou ./checapid
#-----------------------------------------------------------------------

clear

# sep é uma variável que contém uma linha de separação
sep="___________________________________________________________________________"

# ps é um comando que exibe informações sobre os processos em execução 
# -p é uma opção que especifica quais processos exibir
# $$ é o PID do processo atual (o script)
# $PPID é o PID do processo pai (o shell que executou o script)
# -o é uma opção que especifica quais informações exibir ao colocar o = no final do "user" por exemplo ele não exibe o cabeçalho 
# args é uma opção que exibe os argumentos do comando
echo "$sep
COMPARANDO PID DAS SESSÔES DO BASH NO SCRIPT E NO TERMINAL
$sep
PID da sessão do bash do script  :  $$
PID da sessão do bash no terminal:  $PPID                                                                                   $sep
$( ps -p $$,$PPID -o pid=,user=,tty=,args=)
$sep
"
exit 0
