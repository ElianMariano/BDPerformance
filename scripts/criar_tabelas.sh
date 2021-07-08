#!/bin/bash
set -e

# Comandos
sql=$(cat /bd_demostrativo_de_gastos.sql)

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
	$(echo "$sql")
EOSQL
