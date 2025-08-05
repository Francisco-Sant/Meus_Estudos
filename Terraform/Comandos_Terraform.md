# Comandos Principais do Terraform

## Inicialização
| Comando              | Descrição                                                                 |
|----------------------|---------------------------------------------------------------------------|
| `terraform init`     | Inicializa o diretório de trabalho com os arquivos de configuração do Terraform. |

## Formatação e Validação
| Comando              | Descrição                                                                 |
|----------------------|---------------------------------------------------------------------------|
| `terraform fmt`      | Formata os arquivos de configuração para o padrão do Terraform.           |
| `terraform validate` | Valida a sintaxe dos arquivos de configuração.                            |

## Execução e Planejamento
| Comando              | Descrição                                                                 |
|----------------------|---------------------------------------------------------------------------|
| `terraform plan`     | Mostra as ações que o Terraform realizará sem aplicar mudanças.           |
| `terraform apply`    | Aplica as mudanças necessárias para atingir o estado desejado.            |

## Gerenciamento e Visualização
| Comando                  | Descrição                                                            |
|--------------------------|----------------------------------------------------------------------|
| `terraform destroy`      | Remove todos os recursos gerenciados pelo Terraform.                 |
| `terraform show`         | Mostra o estado atual dos recursos gerenciados.                      |
| `terraform state list`   | Lista todos os recursos presentes no arquivo de estado.              |

## Ajuda
| Comando              | Descrição                                                                 |
|----------------------|---------------------------------------------------------------------------|
| `terraform --help`   | Exibe a ajuda com