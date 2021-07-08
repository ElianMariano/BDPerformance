FROM postgres:12

# Define a senha
ENV POSTGRES_PASSWORD=password

# Define o nome do banco de dados
ENV POSTGRES_DB=database

# Define usuario padrão do postgre
USER postgres

# Copia os arquivos do host para o container
COPY 202101_Despesas.csv /
COPY bd_demostrativo_de_gastos.sql /
COPY importar_dados_postgreSQL_2021.sql /

# Copia os scripts para o diretorio
COPY scripts/criar_tabelas.sh /docker-entrypoint-initdb.d/
COPY scripts/importar_dados.sh /docker-entrypoint-initdb.d/

EXPOSE 5435:5432
