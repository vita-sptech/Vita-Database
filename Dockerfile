# Dockerfile para criar um container com o MySQL
# Definindo a imagem base
FROM mysql:5.7

# Definindo através de uma variável de ambiente a senha do Root
ENV MYSQL_ROOT_PASSWORD=vitadbdocker

# Adicionando o arquivo init.sql (Nossas tabelas do banco de dados) para ser executado na criação do container
ADD ScriptDatabaseVita.sql /docker-entrypoint-initdb.d/

# Expõe a porta 3306 para o host
EXPOSE 3306
