# Comandos Docker

## Sumário

- [Gerenciamento do Serviço Docker](#gerenciamento-do-serviço-docker)
- [Gerenciamento de Contêineres](#gerenciamento-de-contêineres)
- [Gerenciamento de Imagens](#gerenciamento-de-imagens)
- [Gerenciamento de Redes](#gerenciamento-de-redes)
- [Portas e Execução](#portas-e-execução)
- [Comandos Avançados](#comandos-avançados)

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
| `docker container prune`                                     | Deleta todos os contêineres em stop                          |
| `docker run -dit "nome_do_container"`                        | Roda contêiner em background                                 |

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

---

## Gerenciamento de Redes

| Comando                                                      | Detalhes                                  |
|--------------------------------------------------------------|-------------------------------------------|
| `docker network create --driver bridge "nome da rede"`       | Cria uma rede isolada criada pelo usuário |
| `docker network list`                                        | Lista as redes no Docker                  |

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

---

### Observações

- Sempre adapte os comandos conforme sua necessidade.
- Consulte a [Documentação Oficial do Docker](https://docs.docker.com/) para mais detalhes e exemplos atualizados.