# Guia de Comandos Git

## 1. Configuração Inicial

| Comando                                         | Detalhes                                                                                 |
|-------------------------------------------------|------------------------------------------------------------------------------------------|
| `git config --global user.name "Seu Nome"`      | Define o nome do usuário globalmente                                                     |
| `git config --global user.email "seu@email.com"`| Define o e-mail do usuário globalmente                                                   |
| `git config --list`                             | Mostra as configurações atuais do Git                                                    |

## 2. Repositório

| Comando                                    | Detalhes                                                                                     |
|---------------------------------------------|----------------------------------------------------------------------------------------------|
| `git init`                                 | Cria um repositório e automaticamente a branch main ou master                                |
| `git init --bare`                          | Cria um repositório que será compartilhado com outras máquinas na rede local                 |
| `git clone <endereço do repositório>`       | Clona o repositório remoto para sua máquina local                                            |

## 3. Status e Histórico

| Comando                           | Detalhes                                                                                      |
|-----------------------------------|-----------------------------------------------------------------------------------------------|
| `git status`                      | Verifica se há alguma ação pendente (commit, add, push, etc.)                                 |
| `git log`                         | Mostra o histórico dos commits                                                                 |
| `git log --oneline`               | Mostra o log de cada commit com apenas o início do código e a mensagem                         |
| `git log -p`                      | Mostra o histórico dos commits com detalhes das alterações                                     |
| `git log -p -1`                   | Mostra apenas o log do último commit (`-2`, `-3` para mais)                                    |
| `git log --pretty=oneline`        | Mostra os commits em uma linha                                                                 |
| `gitk`                            | Abre o visualizador gráfico de logs                                                            |
| `git show <versão da tag>`        | Mostra detalhes da tag: autor, data, hora, commit, arquivos, etc.                              |
| `git diff`                        | Mostra as alterações feitas nos arquivos que precisam ser adicionadas ou commitadas            |
| `git diff --staged`               | Mostra as alterações feitas nos arquivos na staging area, prontos para commit                  |
| `git blame <arquivo>`             | Mostra o autor de cada linha no arquivo                                                        |

## 4. Adicionar, Remover e Descartar Arquivos

| Comando                                         | Detalhes                                                                                     |
|-------------------------------------------------|----------------------------------------------------------------------------------------------|
| `git add <arquivo>`                             | Adiciona apenas o arquivo desejado ao repositório                                            |
| `git add *.<extensão>`                          | Adiciona todos os arquivos do tipo desejado (ex: txt, php, java, etc.)                       |
| `git add .`                                     | Adiciona todos os arquivos modificados/criados                                               |
| `git rm <arquivo>`                              | Remove o arquivo do repositório                                                              |
| `git rm <arquivo>`                              | Remove arquivos que foram deletados localmente do seu diretório                              |
| `git reset HEAD <arquivo>`                      | Remove o arquivo da staging area                                                             |
| `git checkout -- <arquivo>`                     | Descarta as mudanças feitas no arquivo antes de adicionar/commitar                           |

## 5. Commit

| Comando                                                         | Detalhes                                                                                     |
|-----------------------------------------------------------------|----------------------------------------------------------------------------------------------|
| `git commit -m "mensagem"`                                      | Salva as alterações feitas nos arquivos; o comentário é importante para controle do trabalho  |
| `git commit -am "mensagem"`                                     | Adiciona arquivos rastreados e faz commit                                                    |
| `git commit -a -m "mensagem"`                                   | Evita usar o git add; adiciona e commita arquivos rastreados                                 |
| `git commit --amend -m "mensagem"`                              | Edita o último commit                                                                        |
| `git commit -m "mensagem" --author="nome <email>"`              | Informa que o commit foi feito por outro autor                                               |
| `git add . && git commit -m "mensagem"`                         | Executa dois comandos em sequência na mesma linha                                            |

## 6. Branches (Ramificações)

| Comando                                           | Detalhes                                                                                     |
|---------------------------------------------------|----------------------------------------------------------------------------------------------|
| `git branch`                                      | Lista todas as branches no repositório                                                       |
| `git branch <nome>`                               | Cria uma nova branch                                                                         |
| `git checkout <nome da branch>`                   | Troca para uma branch já criada                                                              |
| `git checkout -b "<nome da branch>"`              | Cria uma branch copiando tudo da branch anterior                                             |
| `git merge <nome da branch>`                      | Mescla uma branch na branch atual                                                            |
| `git branch -d <nome da branch>`                  | Deleta a branch desejada                                                                     |
| `git branch -D <nome da branch>`                  | Força a exclusão da branch mesmo sem merge                                                   |

## 7. Tags

| Comando                                                         | Detalhes                                                                                     |
|-----------------------------------------------------------------|----------------------------------------------------------------------------------------------|
| `git tag`                                                       | Lista as tags existentes                                                                     |
| `git tag -a <versão> -m "mensagem"`                             | Cria uma tag anotada (com autor, data, hora, etc.)                                           |
| `git tag -a <versão> <ID do commit> -m "mensagem"`              | Cria uma tag em um commit específico                                                         |
| `git tag -d <versão>`                                           | Deleta a tag desejada                                                                        |
| `git checkout <versão da tag>`                                  | Volta o repositório para a versão da tag (ponto específico do projeto)                       |

## 8. Sincronização Remota

| Comando                                               | Detalhes                                                                                     |
|-------------------------------------------------------|----------------------------------------------------------------------------------------------|
| `git remote`                                          | Mostra o nome do servidor remoto (por padrão, "origin")                                      |
| `git remote add origin <endereço do repositório>`     | Cria um apelido para o repositório remoto                                                    |
| `git fetch`                                           | Busca atualizações do repositório remoto                                                     |
| `git pull origin <nome da branch>`                    | Traz os dados do repositório remoto para o local                                             |
| `git push origin <nome da branch>`                    | Envia os arquivos da branch local para o repositório remoto                                  |
| `git push --set-upstream origin <branch>`             | Cria uma branch no repositório remoto e faz push dos commits                                 |

## 9. Outros Comandos

| Comando                                      | Detalhes                                                                                     |
|----------------------------------------------|----------------------------------------------------------------------------------------------|
| `ssh-keygen`                                | Cria um par de chaves SSH                                                                    |
| `git checkout <ID do commit>`                | Permite "voltar no tempo" para ver o estado do projeto em um commit específico               |
| `git revert <ID do commit>`                  | Reverte um commit, criando um novo commit que desfaz as alterações                           |
| `git reset <ID do commit>`                   | Apaga todos os commits posteriores, mas as alterações permanecem como não commitadas         |
| `git reset <ID do commit> --hard`            | Apaga todo o histórico e trabalho, indo apenas para o commit desejado (use com cautela)      |

---

## Dicas Úteis

- `git diff` — Mostra diferenças nos arquivos.
- `git cherry-pick <commit>` — Aplica um commit específico em outra branch.

---

> Para mais detalhes sobre cada comando:  
> [Documentação Oficial do Git](https://git-scm.com/docs)
