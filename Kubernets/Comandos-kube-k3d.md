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

# Comandos úteis e avançados

## Endpoints e Logs
- `kubectl get endpoints`  
  Exibe os IPs e portas vinculadas aos services.
- `kubectl get endpointslice`  
  Exibe a mesma informação do endpoints, mas em arrays.
- `kubectl logs "pod-name"`  
  Exibe os logs do pod em execução.
- `kubectl exec "pod-name"`  
  Permite executar comandos dentro do pod.
- `kubectl exec -it "pod-name" -- /bin/bash`  
  Permite acessar o pod via terminal.

## Cluster e Gerenciamento
- `kubeadm init`  
  Inicia o cluster Kubernetes admin da forma mais simples.
- `kind create cluster`  
  Criação do cluster com kind.
- `kind create cluster --name "cluster-name"`  
  Cria um cluster especificando o nome.
- `kind get clusters`  
  Verifica os nomes dos clusters criados.
- `kind delete cluster --name "cluster-name"`  
  Deleta o cluster.
- `kind create cluster --name "cluster-name" --config "manifetos.yaml"`  
  Criação do cluster com alguns nodes, pois o kind trabalha com configuração de arquivos para subir um cluster com redundância.
- `kind load --name "name-do-cluster-criado" docker-image "name-da-imagem-criada"`  
  Usado para criar os pods com a imagem local. Depois que rodar este comando é preciso rodar o manifesto de criação dos containers (pods).
- `code ~/.kube/config`  
  Abre as configurações do cluster no VS Code para modificação.

## ConfigMap
- `kubectl get configmap`  
  Retorna os configmaps existentes no cluster Kubernetes.
- `kubectl create configmap "name-do-configmap" --from-literal=CHAVE="valor"`  
  Cria um configmap (variável de ambiente do pod). OBS: não recomendado em produção pois não oculta as informações.
- `kubectl describe configmap "name-do-configmap"`  
  Exibe as informações do configmap como chave e valor.
- `kubectl delete configmap "name-configmap"`  
  Deleta o configmap.
- `kubectl create configmap "name-do-configmap" --from-literal=CHAVE="valor" --from-literal=CHAVE="valor" --from-file arquivo.config`  
  Exemplo de criação de dois configmaps usando um arquivo.
- `kubectl apply -f "configmap.yaml"`  
  Cria configmap a partir de um manifesto de configuração.

## Secrets
- `kubectl get secrets`  
  Verifica os secrets.
- `kubectl create secret generic "name-secret" --from-literal=CHAVE="valor" --from-file arquivo.config`  
  Criação de secrets de forma imperativa.
- `kubectl apply -f secret.yaml`  
  Criação de secrets via manifesto.

## Namespace e Outros
- `kubectl get namespace`  
  Verifica os namespaces no cluster.
- `kubectl get all -n kube-system`  
  Verifica todos os elementos rodando no namespace kube-system (pode verificar qualquer namespace existente).
- `kubectl delete -f .`  
  Deleta todas as configurações em manifestos, como clusters, pods, etc.
- `kubectl apply -f .`  
  Cria todas as configurações em manifestos, como clusters, pods, etc.