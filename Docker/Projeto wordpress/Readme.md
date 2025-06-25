Esse é um projeto simples de como criar um docker compose.

Imagina você ter que subir todas as suas aplicações ou serviços da forma tradicional uma por uma no exemplo abaixo.
Vamos subir esses mesmos serviços mas usando o compose, uma forma mais rapida, com uma letura melhor e com a possibilidade de erro baixa.

Container MySQL: docker run -dit --name mysql -e MYSQL_DATABASE=wp-example -e MYSQL_USER="your-name" -e MYSQL_PASSWORD="password" -e MYSQL_ROOT_PASSWORD="password" --mount source=db,target=/var/lib/mysql --network meu-blog -p 3306:3306 mysql:5.7

Container Wordpress: docker run -dit --name wordpress -e WORDPRESS_DB_HOST=mysql -e WORDPRESS_DB_USER="your-name" -e WORDPRESS_DB_PASSWORD="password" -e WORDPRESS_DB_NAME=wp-example --mount source=wordpress,target=/var/www/html --network meu-blog -p 8081:80 wordpress:6.2.2​​