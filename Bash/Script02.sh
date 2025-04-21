# Testando as variáveis $$, $?, $0, $n, $#

# $$ - armazena o PID da sessão corrente do Shell
# $? - armazena o status de saída do último comando executado
# $0 - armazena o nome do programa executado
# $n - (1 - ...) é o número atribuido aos argumentos pela ordem de execução
# $# - armazena o número de argumentos passados para o script
# Exemplo de uso
#===================================================================================

#!/bin/bash

echo "PID da sessão do shell do script: $$"

# Testa se foi passado um argumento...
msg="È preciso informar um único nome de comando válido!"
[[ $# -ne 1 ]] && echo $msg && exit 1

# Executa "help" para verificar se vai conseguir mostrar a ajuda do comando (sucesso) ou não (erro)
help $1 &> /dev/null

# Usar comando "test" para avaliar a expressão...
[[ $? -eq 0 ]] && echo "È builtin!" || echo "Não é builtin... :-("

exit 0

# Executando o script scrit que foi nomeado como builtin seguido do comando help ele deve retorna com o PID da sessão e a informação " È builtin!"
# Executando o script scrit que foi nomeado como builtin sem nenhum argumento ele deve retorna com o PID da sessão e a informação" È preciso informar um único nome de comando válido!"
# Executando o script scrit que foi nomeado como builtin seguido de um comando que não seja builtin como o "ls" ele deve retorna com o PID da sessão e a informação " Não é builtin... :-("

# Exemplos de execução:

# $ ./builtin help
# PID da sessão do shell do script: 12345
# È builtin!

# $ ./builtin
# PID da sessão do shell do script: 12345
# È preciso informar um único nome de comando válido!

# $ ./builtin ls
# PID da sessão do shell do script: 12345
# Não é builtin... :-(

#=========================================================================