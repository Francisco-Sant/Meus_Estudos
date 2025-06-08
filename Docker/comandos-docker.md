#Comandos	                                               #Detalhes  
sudo service docker status	                               Verifica o status do Docker 
sudo service docker start	                               Inicia o serviço do docker caso este desativado
docker container ps	                                       Verifica os containes em execução ou ativos
docker os -a 	                                           Verifica todos os containes criados pausados
docker container run --name "Nome do container" "imagem"   Criação simples de uma container 
docker images	                                           Verifica as imagens atuais 
docker stop "nome ou inciais do hash do container"	       Paraliza o docker que esta em execução
docker container rm "hash do container" -f	               Utilizado para forçar a exclusão de um container 
docker start -ai "nome ou hash do container existente"	   Usado para iniciar um container existente
docker container prune	                                   Deleta todos os container do docker em stop
docker run -dit "nome do container	                       Roda container em backgraund
docker rmi "nome da imagem"	                               Exclui a imagem
docker images -q	                                       Retorna apenas os Ids das imagens existentes
docker rmi $(docker images -q)	                           Deleta todas as imagens existentes
docker kill "nome de container"	                           Mata de uma vez o container em execução
docker paused "nome de container"	                       Pausa o container mais mantem os processos 
docker restart "nome de container"	                       Reincia o container e seus processos
docker exec -it "nome do container" top	comando para       Verificar todos os processos do container em execução
docker stop "nome de container"	                           Pausa o container mais não mantem os processos 
docker port "ID do container"	                           Verifica as portas disponives para o container
docker run -p "defina uma porta" -d "nome da imagem"	   Este comando ira definir a porta da sua preferencia  para o seu conteiner
docker run -p "porta" -d -e AUTHOR="nome" "nome do conteiner"	Exemplo de comando para definir porta e Autor.
docker commit "nome de conteiner onde foi feita alteração" "nome da imagem que você quer criar"	Vai criar uma imagem com base nas auterações no conteiner informando
docker run -P -d "nome da imagem"	                       O docker vai criar um conteiner e vai definir uma portal aleatoria 
docker images | grep "nome da imagem ou TAG | awk '{print $3}' | xargs docker rmi	Deleta varias imagens de um determiando grupo
docker network create  --driver bridger "nome da rede isolada"	Cria uma rede isolada criada pelo o usuario
docker network list	                                       Lista as redes no docker
