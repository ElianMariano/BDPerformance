-- http://www.portaltransparencia.gov.br/download-de-dados/despesas-execucao

TRUNCATE TABLE importar_dados3;

--Mysql
-- LOAD DATA LOCAL INFILE 'c:/download/201904_Despesas.csv' INTO TABLE importar_dados FIELDS TERMINATED BY '\t';
-- LOAD DATA LOCAL INFILE 'c:/download/201904_Despesas.csv' INTO TABLE importar_dados FIELDS TERMINATED BY ';';
-- PostgreSQL

SET CLIENT_ENCODING TO 'WIN1252';

-- DELETE FROM importar_dados3;

COPY importar_dados3 FROM '/202101_Despesas.csv' with (format csv, delimiter E';', NULL '', HEADER TRUE, ENCODING WIN1252);


CREATE INDEX ind_cod_orgao_subordinado ON  importar_dados3 (cod_orgao_subordinado);


INSERT INTO orgao_superior 
  SELECT DISTINCT ON (id.cod_orgao_superior) CAST(TRIM(id.cod_orgao_superior) AS INTEGER),
         id.nome_orgao_superior,
         SUBSTRING(id.nome_orgao_superior,1,20)
    FROM importar_dados3 id
    WHERE NOT EXISTS (SELECT os.cod_orgao_superior
                        FROM orgao_superior os
                        WHERE os.cod_orgao_superior = CAST(TRIM(id.cod_orgao_superior) AS INTEGER)
                        LIMIT 1)
      AND LENGTH(TRIM(id.cod_orgao_superior)) > 0
    ORDER BY id.cod_orgao_superior;
   
    
INSERT INTO orgao_subordinado 
  SELECT DISTINCT ON (id.cod_orgao_subordinado) CAST(TRIM(id.cod_orgao_subordinado) AS INTEGER),
         id.nome_orgao_subordinado,
         SUBSTRING(id.nome_orgao_subordinado,1,20)
    FROM importar_dados3 id
    WHERE NOT EXISTS (SELECT os.cod_orgao_subordinado
                        FROM orgao_subordinado os
                        WHERE os.cod_orgao_subordinado = CAST(TRIM(id.cod_orgao_subordinado) AS INTEGER)
                        LIMIT 1)
      AND LENGTH(TRIM(id.cod_orgao_subordinado)) > 0
    ORDER BY id.cod_orgao_subordinado;

INSERT INTO unidade_gestora 
  SELECT DISTINCT ON (id.cod_unidade_gestora) CAST(TRIM(id.cod_unidade_gestora) AS INTEGER),
         id.nome_unidade_gestora,
         SUBSTRING(id.nome_unidade_gestora,1,20)
    FROM importar_dados3 id
    WHERE NOT EXISTS (SELECT ug.cod_unidade_gestora
                        FROM unidade_gestora ug
                        WHERE ug.cod_unidade_gestora = CAST(TRIM(id.cod_unidade_gestora) AS INTEGER)
                        LIMIT 1)
      AND LENGTH(TRIM(id.cod_unidade_gestora)) > 0
    ORDER BY id.cod_unidade_gestora;

INSERT INTO gestao 
  SELECT DISTINCT ON (id.cod_gestao) CAST(TRIM(id.cod_gestao) AS INTEGER),
         id.nome_gestao,
         SUBSTRING(id.nome_gestao,1,20)
    FROM importar_dados3 id
    WHERE NOT EXISTS (SELECT g.cod_gestao
                        FROM gestao g
                        WHERE g.cod_gestao = CAST(TRIM(id.cod_gestao) AS INTEGER)
                        LIMIT 1)
      AND LENGTH(TRIM(id.cod_gestao)) > 0
    ORDER BY id.cod_gestao;

INSERT INTO unidade_orcamentaria 
  SELECT DISTINCT ON (id.cod_unidade_orcamentaria) CAST(TRIM(id.cod_unidade_orcamentaria) AS INTEGER),
         id.nome_unidade_orcamentaria,
         SUBSTRING(id.nome_unidade_orcamentaria,1,20)
    FROM importar_dados3 id
    WHERE NOT EXISTS (SELECT u.cod_unidade_orcamentaria
                        FROM unidade_orcamentaria u
                        WHERE u.cod_unidade_orcamentaria = CAST(TRIM(id.cod_unidade_orcamentaria) AS INTEGER)
                        LIMIT 1)
      AND LENGTH(TRIM(id.cod_unidade_orcamentaria)) > 0
    ORDER BY id.cod_unidade_orcamentaria;



INSERT INTO grupo_despesa 
  SELECT DISTINCT ON (id.cod_grupo_despesa) TRIM(id.cod_grupo_despesa),
         id.nome_grupo_despesa,
         SUBSTRING(id.nome_grupo_despesa,1,20)
    FROM importar_dados3 id
    WHERE NOT EXISTS (SELECT gd.cod_grupo_despesa
                        FROM grupo_despesa gd
                        WHERE gd.cod_grupo_despesa = TRIM(id.cod_grupo_despesa)
                        LIMIT 1)
      AND LENGTH(TRIM(id.cod_grupo_despesa)) > 0
    ORDER BY id.cod_grupo_despesa;

	
INSERT INTO elemento_despesa 
  SELECT DISTINCT ON (id.cod_elemento_despesa) CAST(TRIM(id.cod_elemento_despesa) AS INTEGER),
         id.nome_elemento_despesa,
         SUBSTRING(id.nome_elemento_despesa,1,20)
    FROM importar_dados3 id
    WHERE NOT EXISTS (SELECT ed.cod_elemento_despesa
                        FROM elemento_despesa ed
                        WHERE ed.cod_elemento_despesa = CAST(TRIM(id.cod_elemento_despesa) AS INTEGER)
                        LIMIT 1)
      AND LENGTH(TRIM(id.cod_elemento_despesa)) > 0
	ORDER BY id.cod_elemento_despesa;
	

INSERT INTO funcao 
  SELECT DISTINCT ON (id.cod_funcao) CAST(TRIM(id.cod_funcao) AS INTEGER),
         id.nome_funcao,
         SUBSTRING(id.nome_funcao,1,20)
    FROM importar_dados3 id
    WHERE NOT EXISTS (SELECT f.cod_funcao
                        FROM funcao f
                        WHERE f.cod_funcao = CAST(TRIM(id.cod_funcao) AS INTEGER)
                        LIMIT 1)
      AND LENGTH(TRIM(id.cod_funcao)) > 0
    ORDER BY id.cod_funcao;
	
INSERT INTO subfuncao 
  SELECT DISTINCT ON (id.cod_subfuncao) CAST(TRIM(id.cod_subfuncao) AS INTEGER),
         id.nome_subfuncao,
         SUBSTRING(id.nome_subfuncao,1,20)
    FROM importar_dados3 id
    WHERE NOT EXISTS (SELECT s.cod_subfuncao
                        FROM subfuncao s
                        WHERE s.cod_subfuncao = CAST(TRIM(id.cod_subfuncao) AS INTEGER)
                        LIMIT 1)
      AND LENGTH(TRIM(id.cod_subfuncao)) > 0
    ORDER BY id.cod_subfuncao;

INSERT INTO programa_orcamentario 
  SELECT DISTINCT ON (id.cod_programa_orcamentario) CAST(TRIM(id.cod_programa_orcamentario) AS INTEGER),
         id.nome_programa_orcamentario,
         SUBSTRING(id.nome_programa_orcamentario,1,20)
    FROM importar_dados3 id
    WHERE NOT EXISTS (SELECT p.cod_programa_orcamentario
                        FROM programa_orcamentario p
                        WHERE p.cod_programa_orcamentario = CAST(TRIM(id.cod_programa_orcamentario) AS INTEGER)
                        LIMIT 1)
      AND LENGTH(TRIM(id.cod_programa_orcamentario)) > 0
    ORDER BY id.cod_programa_orcamentario;
	
INSERT INTO programa_governo 
  SELECT DISTINCT ON (id.cod_programa_governo) TRIM(id.cod_programa_governo),
         id.nome_programa_governo,
         SUBSTRING(id.nome_programa_governo,1,20)
    FROM importar_dados3 id
    WHERE NOT EXISTS (SELECT p.cod_programa_governo
                        FROM programa_governo p
                        WHERE p.cod_programa_governo = TRIM(id.cod_programa_governo)
                        LIMIT 1)
      AND LENGTH(TRIM(id.cod_programa_governo)) > 0
	ORDER BY id.cod_programa_governo;

INSERT INTO acao 
  SELECT DISTINCT ON (id.cod_acao) id.cod_acao,
         id.nome_acao,
         SUBSTRING(id.nome_acao,1,20)
    FROM importar_dados3 id
    WHERE NOT EXISTS (SELECT a.cod_acao
                        FROM acao a
                        WHERE a.cod_acao = id.cod_acao
                        LIMIT 1)
      AND LENGTH(TRIM(id.cod_acao)) > 0
    ORDER BY id.cod_acao;


INSERT INTO modalidade_despesa 
  SELECT DISTINCT ON (id.cod_modalidade_despesa) CAST(TRIM(id.cod_modalidade_despesa) AS INTEGER),
         id.nome_modalidade_despesa,
         SUBSTRING(id.nome_modalidade_despesa,1,20)
    FROM importar_dados3 id
    WHERE NOT EXISTS (SELECT m.cod_modalidade_despesa
                        FROM modalidade_despesa m
                        WHERE m.cod_modalidade_despesa = CAST(TRIM(id.cod_modalidade_despesa) AS INTEGER)
                        LIMIT 1)
      AND LENGTH(TRIM(id.cod_modalidade_despesa)) > 0
    ORDER BY id.cod_modalidade_despesa;


INSERT INTO subtituto 
  SELECT DISTINCT ON (id.cod_subtituto)  TRIM(id.cod_subtituto),
        id.nome_subtituto
    FROM importar_dados3 id
    WHERE NOT EXISTS (SELECT s.cod_subtituto
                        FROM subtituto s
                        WHERE s.cod_subtituto = TRIM(id.cod_subtituto)
                        LIMIT 1)
      AND LENGTH(TRIM(id.cod_subtituto)) > 0
    ORDER BY id.cod_subtituto;
	

INSERT INTO localizador
  SELECT DISTINCT ON (id.cod_localizador) CAST(TRIM(id.cod_localizador) AS INTEGER),
         id.nome_localizador,
         id.sigla_localizador,
         id.desc_compl_localizador,
		 SUBSTRING(id.nome_localizador,1,20)
    FROM importar_dados3 id
    WHERE NOT EXISTS (SELECT l.cod_localizador
                        FROM localizador l
                        WHERE l.cod_localizador = CAST(TRIM(id.cod_localizador) AS INTEGER)
                        LIMIT 1)
      AND LENGTH(TRIM(id.cod_localizador)) > 0
    ORDER BY id.cod_localizador;


INSERT INTO autor_ementa
  SELECT DISTINCT ON (id.cod_autor_ementa) TRIM(id.cod_autor_ementa),
         id.nome_autor_ementa,
         SUBSTRING(nome_autor_ementa,1,20)
    FROM importar_dados3 id
    WHERE NOT EXISTS (SELECT a.cod_autor_ementa
                        FROM autor_ementa a
                        WHERE a.cod_autor_ementa = id.cod_autor_ementa
                        LIMIT 1)
      AND LENGTH(TRIM(id.cod_autor_ementa)) > 0
    ORDER BY id.cod_autor_ementa;
    

INSERT INTO cad_economica
  SELECT DISTINCT ON (id.cod_cad_economica)  TRIM(id.cod_cad_economica),
         id.nome_cad_economica,
         SUBSTRING(nome_cad_economica,1,20)
    FROM importar_dados3 id
    WHERE NOT EXISTS (SELECT c.cod_cad_economica
                        FROM cad_economica c
                        WHERE c.cod_cad_economica = TRIM(id.cod_cad_economica)
                        LIMIT 1)
      AND LENGTH(TRIM(id.cod_cad_economica)) > 0
    ORDER BY id.cod_cad_economica;
   




INSERT INTO dados_ifes3 (exercicio, cod_orgao_superior, cod_orgao_subordinado, cod_unidade_gestora, cod_gestao,                
                        cod_unidade_orcamentaria, cod_funcao, cod_subfuncao, cod_programa_orcamentario, 
                        cod_acao, cod_programa_governo, cod_grupo_despesa, cod_elemento_despesa, cod_modalidade_despesa,
                        cod_subtituto,cod_localizador,cod_autor_ementa,cod_cad_economica,						
                        valor_empenhado, valor_liquidado, valor_pago, valor_resto_a_pagar_insc, valor_resto_a_pagar_canc,
                        valor_resto_a_pagar_pago)
   (SELECT id.exercicio, 
           CAST(TRIM(id.cod_orgao_superior) AS INTEGER),
           CAST(TRIM(id.cod_orgao_subordinado) AS INTEGER),
           CAST(TRIM(id.cod_unidade_gestora) AS INTEGER),
           CAST(TRIM(id.cod_gestao) AS INTEGER),
           CAST(TRIM(id.cod_unidade_orcamentaria) AS INTEGER),
           CAST(TRIM(id.cod_funcao) AS INTEGER),
           CAST(TRIM(id.cod_subfuncao) AS INTEGER),
           CAST(TRIM(id.cod_programa_orcamentario) AS INTEGER),
           TRIM(id.cod_acao),
           TRIM(id.cod_programa_governo),
           TRIM(id.cod_grupo_despesa),
           CAST(TRIM(id.cod_elemento_despesa) AS INTEGER),
           CAST(TRIM(id.cod_modalidade_despesa) AS INTEGER),
		   
		   TRIM(cod_subtituto),
           CAST(TRIM(cod_localizador) AS INTEGER),
           TRIM(cod_autor_ementa),
           TRIM(cod_cad_economica),
		   
           CAST(TRIM(REPLACE(valor_empenhado,',','.')) AS DECIMAL(12,2)),
           CAST(TRIM(REPLACE(valor_liquidado,',','.')) AS DECIMAL(12,2)),
           CAST(TRIM(REPLACE(valor_pago,',','.')) AS DECIMAL(12,2)),
           CAST(TRIM(REPLACE(valor_resto_a_pagar_insc,',','.')) AS DECIMAL(12,2)),
           CAST(TRIM(REPLACE(valor_resto_a_pagar_canc,',','.')) AS DECIMAL(12,2)),
           CAST(TRIM(REPLACE(valor_resto_a_pagar_pago,',','.')) AS DECIMAL(12,2))
     FROM importar_dados3 id
     WHERE cod_orgao_subordinado = '26406'
       AND LENGTH(TRIM(id.cod_orgao_superior)) > 0
       AND LENGTH(TRIM(id.cod_orgao_subordinado)) > 0
       AND LENGTH(TRIM(id.cod_unidade_gestora)) > 0
       AND LENGTH(TRIM(id.cod_gestao)) > 0
       AND LENGTH(TRIM(id.cod_unidade_orcamentaria)) > 0
       AND LENGTH(TRIM(id.cod_grupo_despesa)) > 0
       AND LENGTH(TRIM(id.cod_elemento_despesa)) > 0
       AND LENGTH(TRIM(id.cod_funcao)) > 0
       AND LENGTH(TRIM(id.cod_subfuncao)) > 0
       AND LENGTH(TRIM(id.cod_programa_orcamentario)) > 0
       AND LENGTH(TRIM(id.cod_programa_governo)) > 0
	   AND LENGTH(TRIM(id.cod_acao)) > 0
	   AND LENGTH(TRIM(id.cod_modalidade_despesa)) > 0
       AND LENGTH(TRIM(id.cod_subtituto)) > 0
       AND LENGTH(TRIM(id.cod_localizador)) > 0
       AND LENGTH(TRIM(id.cod_autor_ementa)) > 0
       AND LENGTH(TRIM(id.cod_cad_economica)) > 0
   );

