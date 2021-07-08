# BDPerformance
Imagem Docker que inicia um SGBD postgresql com dados pré-inseridos do Portal da Transparência com o objetivo de estudar performance de Banco de Dados.

## Como Criar a imagem
Para criar uma imagem com o *SGBD* *PostgreSQL* e os *scripts* necessários para a importação dos dados, basta executar o seguinte comando:
> sudo docker build -t postgre-docker .

## Executar um container a partir da imagem
Uma vez criada a imagem, é necessário iniciar o container a partir dessa imagem. Para fazer isso utilize o comando:
> sudo docker run -p 5435:5432 postgre-docker

Perceba que através do comando acima o *PostgreSQL* iniciará utilizando a porta *5435*.

## Origem dos dados
Os dados utilizados neste projeto tem origem no [**Portal da Transparência**](http://www.portaltransparencia.gov.br/download-de-dados/despesas-execucao), mas especificamente do período de Janeiro de 2021.
