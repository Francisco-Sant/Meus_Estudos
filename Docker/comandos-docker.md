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
- [Gerenciamento Docker Compose](#gerenciamento-docker-compose)
- [Comandos Avançados Docker Compose](#comandos-avançados-docker-compose)

---

## Gerenciamento do Serviço Docker

| Comando                        | Detalhes                                      |
|--------------------------------|-----------------------------------------------|
| `sudo service docker status`   | Verifica o status do Docker                   |
| `sudo service docker start`    | Inicia o serviço do Docker                    |
| `sudo systemctl stop docker`   | Para o serviço do Docker no host              |
| `sudo systemctl start docker`  | Inicia o serviço do Docker no host            |
| `sudo systemctl status docker` | Visualiza o status do Docker                  |

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
| `docker container rm "hash do container" -f`                 | Força a exclusão de um contêiner                             |
| `docker start -ai "nome ou hash"`                            | Inicia um contêiner existente                                |
| `docker container prune`                                     | Remove todos os contêineres sem uso (parados)                |
| `docker run -dit "nome_do_container"`                        | Roda contêiner em background                                 |
| `docker stop $(docker ps -q)`                                | Para todos os containers em execução                         |
| `docker ps -f "status=exited"`                               | Lista apenas os containers parados                           |
| `docker exec -it container bash`                             | Acessa o terminal do container                               |
| `docker rm "name-container ou ID-container"`                 | Deleta container pausado                                     |
| `docker rm -f "name-container ou ID-container"`              | Deleta container que esteja UP                               |
| `docker container rm -f $(docker container ls -qa)`          | Deleta todos os containers parados ou em execução            |
| `docker run -d --restart=on-failure "image name"`            | Reinicia o container em caso de falha                        |
| `docker run -d --restart=on-failure:3 "image name"`          | Reinicia até 3 vezes em caso de falha                        |
| `docker run -d --restart=unless-stopped "image name"`        | Reinicia em caso de falha ou parada do serviço               |
| `docker run -d --restart=always "image name"`                | Reinicia em qualquer situação                                |
| `watch 'docker container ls -a'`                             | Monitora status dos containers a cada 2 segundos             |

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
| `docker save -o imagem.docker imagem`                        | Salva uma imagem em um arquivo                               |
| `docker load -i imagem.docker`                               | Carrega uma imagem salva de um arquivo                       |
| `docker image history "name image"`                          | Mostra todas as camadas de construção da imagem e metadados  |

---

## Gerenciamento de Redes

| Comando                                                      | Detalhes                                  |
|--------------------------------------------------------------|-------------------------------------------|
| `docker network create --driver bridge "nome da rede"`       | Cria uma rede isolada                     |
| `docker network ls`                                          | Lista as redes no Docker                  |
| `docker network inspect "name-rede"`                         | Inspeciona a rede e mostra containers conectados |
| `docker network disconnect "name-rede" "name-container"`     | Desconecta um container da rede atual     |
| `docker network connect "name-rede" "name-container"`        | Conecta um container à rede desejada      |
| `docker run -it --network "name-rede" "name-image"`          | Cria um container em uma rede específica  |


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
| `docker logs -f "container_name"`                            | Recupera os logs do container                           |
| `docker container run --rm -v /usr/share/nginx/html --name "name-container" "image name" ` | Cria um volume em determinado contêiner                 |
| `docker system prune`                                        | Remove recursos não utilizados: redes, containers, volumes, imagens dangling |

---

## Monitoramento

| Comando                                                      | Detalhes                                                     |
|--------------------------------------------------------------|--------------------------------------------------------------|
| `docker stats $(docker ps --format {{.Names}})`              | Mostra uso de recursos dos containers rodando                |
| `docker stats --no-stream`                                   | Mostra o consumo de recursos dos containers sem atualização contínua |
| `docker stats "ID container"`                                | Mostra o consumo de recursos do container informado          |
| `docker stats --no-trunc`                                    | Mostra o consumo de recursos dos containers sem truncar saída|
| `docker top "ID container"`                                  | Verifica os serviços rodando dentro do container             |
| `docker events --since 2h --filter type=network`             | Filtra eventos de rede das últimas 2 horas                   |
| `docker container logs --since 1m "ID do container"`         | Mostra os logs do container há um minuto atrás               |
| `docker events`      | Informa todos os eventos em tempo real no docker, como criação de container, network, exclusão, etc. |

---

## Gerenciamento de Volumes

| Comando                                                      | Detalhes                                                     |
|--------------------------------------------------------------|--------------------------------------------------------------|
| `docker volume prune`                                        | Remove volumes “órfãos” (não utilizados por nenhum container)|
| `docker volume ls`                                           | Lista todos os volumes criados                               |
| `docker volume create "volume_name"`                         | Cria um volume                                               |
| `docker volume rm "volume_name"`                             | Remove um volume desejado                                    |
| `docker run -it -v "dir_volume" "image_name"`                | Cria um container com um diretório onde o volume será persistido |
| `docker inspect "name_container"`                            | Analisa o container e mostra o caminho do volume em "Mounts" |
| `docker run -it -v "/dir-docker-host:""/dir-do-container" "image"` | Define diretório do host e do container para persistência de volume|
| `docker run -it --tmpfs="/name-dir" "name-image"`            | Cria diretório de persistência volátil (dados removidos ao parar o container)|
| `docker run -it --mount type=tmpfs,destination="name-dir" "name-image"` | Mesmo exemplo acima usando --mount                           |
| `docker volume inspect "volume_name"`                        | Exibe detalhes sobre um volume específico                    |
| `docker run -it --mount source="volume_name",target="/app" "image_name"` | Monta um volume existente em um diretório do container       |
| `docker run -it -v "volume_name:/app" "image_name"`          | Monta um volume existente usando a flag -v                   |
| `docker volume rm $(docker volume ls -qf dangling=true)`     | Remove todos os volumes dangling (não utilizados)            |

---

## Gerenciamento Docker Compose

| Comando                                                      | Detalhes                                                     |
|--------------------------------------------------------------|--------------------------------------------------------------|
| `docker compose up`                                          | Roda o docker-compose no diretório atual                     |
| `docker compose up -d`                                       | Roda o docker-compose no diretório atual em background        |
| `docker compose stop`                                        | Para o docker-compose em execução                            |
| `docker compose down`                                        | Remove tudo que foi declarado no compose que está em execução|
| `docker compose start`                                       | Inicia o container criado pelo compose que estava parado     |
| `docker compose up -d --remove-orphans`                      | Remove todos os containers órfãos                            |

---

## Comandos Avançados Docker Compose

| Comando | Detalhes |
|---|---|
| `docker compose up -d --build` | Sobe a aplicação construindo a imagem |
| `docker compose build` | Criação de imagem |
| `docker compose push` | Sobe as imagens do projeto direto para o repositório |
| `docker compose pull` | Baixa as imagens referentes à aplicação |
| `docker compose config` | Exibe toda a configuração do compose para confirmar se os parâmetros estão corretos |
| `docker compose --env-file "arquivo .env" config` | Exibe toda a configuração do compose para confirmar se os parâmetros do arquivo .env informado |
| `docker compose --env-file "arquivo .env" up -d` | Sobe a aplicação definindo os parâmetros do arquivo .env caso tenha mais de um arquivo .env |
| `VAR_VER=v3 docker compose --env-file "arquivo .env" build` | Criação de imagem com o docker compose usando variável de ambiente |
| `docker compose up -d --build --remove-orphans` | Builda a imagem, sobe a aplicação e remove contêineres órfãos |
| `docker compose -f compose.yaml -f "name other compose" up -d` | Faz o merge de arquivos compose |
| `docker compose --profile dev up -d` | Sobe a aplicação informando o ambiente definido no profile |
| `docker compose ps` | Exibe todos os contêineres que fazem parte do compose |
| `docker compose logs` | Exibe todos os logs dos containers que fazem parte do compose |
| `docker compose logs "container name"` | Exibe apenas os logs do contêiner informado que faz parte do compose |
| `docker compose exec "container name" "comando"` | Executa um comando ou ação no container informado |
| `docker info` | Informa configurações do docker e dados como quantidade de container, imagem, etc. |


---

### Observações

- Sempre adapte os comandos conforme sua necessidade.
- Consulte a [Documentação Oficial do Docker](https://docs.docker.com/) para mais detalhes e exemplos atualizados.
