#!/usr/bin/env bash
#-----------------------------------------------------------------------
# Script    : Arrays Associativas
# Descrição : Exemplos de Arrays associativas
# Versão    : 0.1
# Autor     : Francisco Santos
# Data      : 28/04/2025
# Licença   : GNU/GPL v3.0
#-----------------------------------------------------------------------
# Uso:
#-----------------------------------------------------------------------

# Este script esta incompleto vai ser um desafio de treinamento

echo "\
Exemplos de trabalho com arrays associativas
"

declare -A aluno
declare -A nota

aluno[joao]="joão Paulo"
aluno[jose]="jose Antonio"
aluno[maria]="Maria de Fatima"
aluno[sofia]="Sofia Vitoria"
aluno[fatima]="Fatima Bernades"
aluno[antonio]="Antonio Fagundes"

nota[joao]=10
nota[jose]=9
nota[maria]=10
nota[sofia]=9
nota[fatima]=8
nota[antonio]=7

echo "\
Os indentificados (índices) dos alunos são:
${!aluno[*]}

E os seus nomes são:
${aluno[*]}
"

exit 0