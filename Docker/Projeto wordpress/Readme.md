# Projeto WordPress com Docker Compose

Este projeto demonstra como criar e orquestrar um ambiente WordPress e MySQL utilizando Docker Compose.

## Por que usar Docker Compose?

Subir cada serviço manualmente com `docker run` pode ser trabalhoso, sujeito a erros e difícil de manter, especialmente quando há múltiplos containers e configurações envolvidas. O Docker Compose resolve esse problema ao permitir que você defina todos os serviços, redes e volumes em um único arquivo, facilitando o gerenciamento, a reprodução do ambiente e a escalabilidade.

## Serviços Utilizados

- **WordPress**: Plataforma de gerenciamento de conteúdo.
- **MySQL**: Banco de dados relacional utilizado pelo WordPress.

## Como usar

1. **Clone este repositório**
   ```sh
   git clone <url-do-repositorio>
   cd Projeto\ wordpress
   ```

2. **Configure as variáveis de ambiente**
   Edite o arquivo `.env` conforme necessário para definir usuários, senhas e nomes de banco de dados.

3. **Suba os containers**
   ```sh
   docker-compose up -d
   ```

4. **Acesse o WordPress**
   Abra seu navegador e acesse [http://localhost:8081](http://localhost:8081)

## Exemplo: Forma Manual (não recomendada)

Executar os containers manualmente exige muitos comandos e atenção aos detalhes, como variáveis de ambiente, volumes e redes. Veja um exemplo:

```sh
# Subir MySQL
docker run -dit --name mysql \
  -e MYSQL_DATABASE=wp-example \
  -e MYSQL_USER="your-name" \
  -e MYSQL_PASSWORD="password" \
  -e MYSQL_ROOT_PASSWORD="password" \
  --mount source=db,target=/var/lib/mysql \
  --network meu-blog \
  -p 3306:3306 \
  mysql:5.7

# Subir WordPress
docker run -dit --name wordpress \
  -e WORDPRESS_DB_HOST=mysql \
  -e WORDPRESS_DB_USER="your-name" \
  -e WORDPRESS_DB_PASSWORD="password" \
  -e WORDPRESS_DB_NAME=wp-example \
  --mount source=wordpress,target=/var/www/html \
  --network meu-blog \
  -p 8081:80 \
  wordpress:6.2.2
```

**Desvantagens da forma manual:**
- Mais propenso a erros de digitação ou configuração
- Difícil de manter e replicar em outros ambientes
- Não escala facilmente

**Por isso, prefira o uso do Docker Compose!**

## Estrutura dos arquivos

- `docker-compose.yml`: Define os serviços, volumes e redes.
- `.env`: Variáveis de ambiente sensíveis (não versionar em produção).
- `README.md`: Este guia.

## Observações

- Certifique-se de que as portas 8081 (WordPress) e 3306 (MySQL) estejam livres.
- Os dados do banco e do WordPress são persistidos em volumes Docker.
- Para remover tudo: `docker-compose down -v`

---

Feito para fins de estudo. Consulte a [Documentação Oficial do Docker](https://docs.docker.com/) para mais detalhes.