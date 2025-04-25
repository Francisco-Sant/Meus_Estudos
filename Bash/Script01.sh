# Este é o meu primieriro script em bash, de como usuar alguns comandos básicos agrupados e como usar e "echo"
# Neste exemplo vamos usar os comandos clear, whoami,hostname, uptime e uname -rms

#!/bin/bash

clear
echo " Informações importantes!"
echo "==============================================="

echo -n "Usuário : "
whoami

echo -n "Hostname: "
hostname

echo -n "Uptime  : "
uptime -p

echo -n "kernel  : "
uname -rms
echo "==============================================="

# Ao executar o script, ele irá limpar a tela e exibir as informações do usuário logado, nome do computador, tempo de atividade do sistema e versão do kernel.
# segui o retorno do script

#Informações importantes!
#========================================================    
#Usuário : santos
#Hostname: WINAPQO0zcR7gaU
#Uptime  : up 1 day, 20 minutes
#Kernel  : Linux 5.15.167.4-microsoft-standard-WSL2 x86_64
#=========================================================