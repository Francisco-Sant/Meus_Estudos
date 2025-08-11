# Comandos Docker

## Sumário

- [Gerenciamento do Serviço Docker](#gerenciamento-do-serviço-docker)
- [Gerenciamento de Contêineres](#gerenciamento-de-contêineres)
- [Gerenciamento de Imagens](#gerenciamento-de-imagens)
- [Gerenciamento de Redes](#gerenciamento-de-redes)
- [Portas e Execução](#portas-e-execução)
- [Comandos Avançados](#comandos-avançados)
- [Monitoramento](#monitoramento)
- [Gerenciamento de Volumes](#gerenciamento-de-volumes)

---

## Gerenciamento do Serviço Docker

| Comando                        | Detalhes                                      |
|--------------------------------|-----------------------------------------------|
| `sudo service docker status`   | Verifica o status do Docker                   |
| `sudo service docker start`    | Inicia o serviço do Docker                    |

---

## Gerenciamento de Contêineres

| Comando                                                      | Detalhes                                                     |
|--------------------------------------------------------------|--------------------------------------------------------------|
| `docker container ps`                                        | Verifica os contêineres em execução ou ativos                |
| `docker ps -a`                                               | Verifica todos os contêineres criados, inclusive pausados    |
| `docker container run --name "Nome do container" "imagem"`   | Criação simples de um contêiner                              |
| `docker stop "nome ou hash"`                                 | Para o contêiner em execução                                 |
| `docker kill "nome do container"`                            | Mata de uma vez o contêiner em execução                      |
| `docker paused "nome do container"`                          | Pausa o contêiner, mas mantém os processos                   |
| `docker restart "nome do container"`                         | Reinicia o contêiner e seus processos                        |
| `docker exec -it "nome do container" top`                    | Verifica todos os processos do contêiner em execução         |
| `docker container rm "hash do container" -f`                 | Força a exclusão de um contêiner                             |
| `docker start -ai "nome ou hash"`                            | Inicia um contêiner existente                                |
| `docker container prune`                                     | Remove todos os contêineres sem uso (parados)                |
| `docker run -dit "nome_do_container"`                        | Roda contêiner em background                                 |
| `docker stop $(docker ps -q)`                                | Para todos os containers em execução                         |
| `docker ps -f "status=exited"`                               | Lista apenas os containers parados                           |
| `docker exec -it container bash`                             | Acessa o terminal do container                               |
| `docker rm "name-container ou ID-container"`                 | Deleta container pausado                                     |
| `docker rm -f "name-container ou ID-container"`              | Deleta containe que esteja UP                                |

---

## Gerenciamento de Imagens

| Comando                                                      | Detalhes                                                     |
|--------------------------------------------------------------|--------------------------------------------------------------|
| `docker images`                                              | Lista as imagens atuais                                      |
| `docker images -q`                                           | Retorna apenas os IDs das imagens existentes                 |
| `docker rmi "nome da imagem"`                                | Exclui uma imagem                                            |
| `docker rmi $(docker images -q)`                             | Deleta todas as imagens existentes                           |
| `docker commit "nome do contêiner" "nome da nova imagem"`    | Cria uma imagem com base nas alterações no contêiner         |
| `docker images \| grep "nome" \| awk '{print $3}' \| xargs docker rmi` | Deleta várias imagens de um determinado grupo        |
| `docker image prune`                                         | Remove todas as imagens locais não utilizadas                |
| `docker save -o imagem.docker imagem`                        | Salva uma imagem em um arquivo                               |
| `docker load -i imagem.docker`                               | Carrega uma imagem salva de um arquivo                       |

---

## Gerenciamento de Redes

| Comando                                                      | Detalhes                                  |
|--------------------------------------------------------------|-------------------------------------------|
| `docker network create --driver bridge "nome da rede"`       | Cria uma rede isolada                     |
| `docker network ls`                                          | Lista as redes no Docker                  |
| `docker network inspect "name-rede"`                         | Ao inspecionar a rede bridger você consegue verificar todos so containes que estão na rede |
| `docker network disconnect "name-rede" "name-container"`     | Disconecta um conteiner da rede atual     |
| `docker network connect "name-rede" "name-container"`        | Conecta um conteiner a rede que você deseja |
| `docker run -it --network "name-rede" "name-image"`          | Cria um container em uma rede especifica  |


---

## Portas e Execução

| Comando                                                      | Detalhes                                                             |
|--------------------------------------------------------------|----------------------------------------------------------------------|
| `docker port "ID do container"`                              | Verifica as portas disponíveis para o contêiner                      |
| `docker run -p PORTA:PORTA -d "nome da imagem"`              | Define a porta do host para o contêiner                              |
| `docker run -p PORTA -d -e AUTHOR="nome" "nome do contêiner"`| Define porta e variável de ambiente AUTHOR para o contêiner          |
| `docker run -P -d "nome da imagem"`                          | Cria um contêiner com porta aleatória definida pelo Docker           |

---

## Comandos Avançados

| Comando                                                      | Detalhes                                                |
|--------------------------------------------------------------|---------------------------------------------------------|
| `docker stop "nome de contêiner"`                            | Pausa o contêiner, mas não mantém os processos          |
| `docker logs -f "container_name"`                            | Comando para recuperar os logs                          |
| `docker container run --rm -v /usr/share/nginx/html --name nginx_teste nginx` | Para criar um volume em determinado contêiner |
| `docker system prune`                                        | Deleta todas as redes que não estão em uso por ao menos um container, Deleta todos os contêineres que não estão em uso no momento, Deleta todos os volumes que não estão em uso por ao menos um contêiner, Deleta todas as imagens danglin |
                                                                            
---

## Monitoramento

| Comando                                                      | Detalhes                                                     |
|--------------------------------------------------------------|--------------------------------------------------------------|
| `docker stats $(docker ps --format {{.Names}})`              | Mostra uso de recursos dos containers rodando                |

---

## Gerenciamento de Volumes

| Comando                                                      | Detalhes                                                     |
|--------------------------------------------------------------|--------------------------------------------------------------|
| `docker volume prune`                                        | Remove volumes “órfãos” (não utilizados por nenhum container)|
| `docker volume ls`                                           | Lista todos os volumes criados                               |
| `docker volume create "volume_name"`                         | Cria um volume                                               |
| `docker volume rm "volume_name"`                             | Remove um volume desejado                                    |
| `docker run -it -v "dir_volume" "image_name"`                | Cria um container com um diretorio onde o volume sera persistido |
| `docker inspect "name_container"`                            | Este comando é usado para analizar o container, mas nesse caso você pode usar para procurar a flag  "Mounts", nessa aréa você vera o caminho onde o volume esta sendo persistido |
| `docker run -it -v "/dir-docker-host:""/dir-do-container" "image"`      | Cria um container onde você define uma local no docker-host e no container para percistencia de volume|
| `docker run -it --tmpfs="/name-dir" "name-image"`                       | Cria um container com um diretorio de persistencia de volumes volatil, pois ai derrubar o container os dados criados neste local seram deletados| 
| `docker run -it --mount type=tmpfs,destination="name-dir" "name-image"` | Este é o mesmo exemplo do caso acima mas usando o -mount | 

---

## Gerenciamento Docker Compose

| Comando                                                      | Detalhes                                                     |
|--------------------------------------------------------------|--------------------------------------------------------------|
| `docker compose up`                                          | Roda o docker-compose no diretorio atual                     |
| `docker compose up -d`                                       | Roda o docker-compose no diretorio atual em backgrund        |
| `docker compose stop`                                        | Para o docker-compose em execução                            |
| `docker compose down`                                        | Remove tudo que foi declarodo compose que esta em execução   |
| `docker compose start`                                       | Inicia o container criado pelo compose que estava parado     |
| `docker compose up -d --remove-orphans`                      | Romove todos os containes orfãos                             |
       
---

### Observações

- Sempre adapte os comandos conforme sua necessidade.
- Consulte a [Documentação Oficial do Docker](https://docs.docker.com/) para mais detalhes e exemplos atualizados.
