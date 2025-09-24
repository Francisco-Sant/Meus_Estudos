# Comandos k3d

- `k3d cluster create "name-cluster"`  
  Cria um cluster com um container e executa a configuração do kubectl.

- `k3d cluster create "name-cluster" --no-lb`  
  Cria um cluster sem o balanceamento de carga.

- `k3d cluster list`  
  Lista os clusters com nome, servidor, agentes e loadbalancer.

- `k3d cluster delete "name-cluster"`  
  Deleta o cluster.

- `k3d cluster create meu-cluster --servers <valor> --agents <valor>`  
  Cria um cluster mais complexo, especificando a quantidade de servidores e agentes, com loadbalancer.


# Comandos kubectl

## Listagem e informações
- `kubectl api-resources`  
  Lista todos os objetos que podem ser criados no cluster Kubernetes.
- `kubectl get nodes`  
  Visualiza os nodes (containers) criados.
- `kubectl get pod`  
  Exibe os pods criados e em execução.
- `kubectl get pods -o wide`  
  Exibe informações detalhadas dos pods, como nome, status, tempo de criação, IP, etc.
- `kubectl get all`  
  Lista todos os objetos do cluster.
- `kubectl describe pod "name-pod"`  
  Mostra todas as configurações do pod, como quando foi criado, em que nó está sendo executado, etc.
- `kubectl describe deploy "namedeployment"`  
  Exibe a descrição do deployment criado.
- `kubectl rollout history deployment "nome do deployment criado"`  
  Exibe as últimas versões do deployment que foram criados.

## Criação, aplicação e atualização
- `kubectl apply -f "name-manifest"`  
  Cria, aplica e atualiza o objeto caso ele já esteja criado.
- `kubectl create -f "name-manifest"`  
  Cria o objeto, mas não atualiza se já existir.
- `kubectl apply -f "name-do-objeto"`  
  Roda o arquivo como replicaset ou deployment.

## Exclusão
- `kubectl delete -f "name-do-replicaset"`  
  Força a exclusão do replicaset.

## Port-forward
- `kubectl port-forward pod/"name-pod"`  
  Faz o redirecionamento de porta do host para o cluster, útil para verificar se o pod está rodando.

## Rollback
- `kubectl rollout undo deploy "nome do deployment criado"`  
  Faz o rollback da versão do deployment.