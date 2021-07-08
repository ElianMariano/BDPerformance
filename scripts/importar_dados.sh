#!/bin/bash
set -e

# Comandos
sqld=$(cat /importar_dados_postgreSQL_2021.sql)

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
	$(echo "$sqld")
EOSQL
