DROP TABLE IF EXISTS importar_dados3;
DROP TABLE IF EXISTS gastos_diretos2;
DROP TABLE IF EXISTS dados_ifes3;

DROP TABLE IF EXISTS subtituto;
DROP TABLE IF EXISTS localizador;
DROP TABLE IF EXISTS autor_ementa;
DROP TABLE IF EXISTS cad_economica;

DROP TABLE IF EXISTS modalidade_despesa;
DROP TABLE IF EXISTS plano_orcamentario;
DROP TABLE IF EXISTS acao;
DROP TABLE IF EXISTS programa_governo;
DROP TABLE IF EXISTS programa_orcamentario;
DROP TABLE IF EXISTS subfuncao;
DROP TABLE IF EXISTS funcao;
DROP TABLE IF EXISTS elemento_despesa;
DROP TABLE IF EXISTS grupo_despesa;
DROP TABLE IF EXISTS unidade_orcamentaria;
DROP TABLE IF EXISTS gestao;
DROP TABLE IF EXISTS unidade_gestora;
DROP TABLE IF EXISTS orgao_subordinado;
DROP TABLE IF EXISTS orgao_superior;

CREATE TABLE orgao_superior (
  cod_orgao_superior      INTEGER NOT NULL,
  nome_orgao_superior     VARCHAR(300) NOT NULL,
  abrev_orgao_superior    VARCHAR(20) NOT NULL,
  CONSTRAINT pk_orgao_superior
    PRIMARY KEY (cod_orgao_superior)
);


CREATE TABLE orgao_subordinado (
  cod_orgao_subordinado   INTEGER NOT NULL,
  nome_orgao_subordinado  VARCHAR(300) NOT NULL,
  abrev_orgao_subordinado VARCHAR(20) NOT NULL,
  CONSTRAINT pk_orgao_subordinado
    PRIMARY KEY (cod_orgao_subordinado)
);


CREATE TABLE unidade_gestora (
  cod_unidade_gestora     INTEGER NOT NULL,
  nome_unidade_gestora    VARCHAR(300) NOT NULL,
  abrev_unidade_gestora   VARCHAR(20) NOT NULL,
  CONSTRAINT pk_unidade_gestora
    PRIMARY KEY (cod_unidade_gestora)
);

CREATE TABLE gestao (
  cod_gestao        INTEGER NOT NULL,
  nome_gestao       VARCHAR(300) NOT NULL,
  abrev_gestao      VARCHAR(20) NOT NULL,
  CONSTRAINT pk_gestao
    PRIMARY KEY (cod_gestao)
);

CREATE TABLE unidade_orcamentaria (
  cod_unidade_orcamentaria     INTEGER NOT NULL,
  nome_unidade_orcamentaria    VARCHAR(300) NOT NULL,
  abrev_unidade_orcamentaria   VARCHAR(20) NOT NULL,
  CONSTRAINT pk_unidade_orcamentaria
    PRIMARY KEY (cod_unidade_orcamentaria)
);

CREATE TABLE grupo_despesa (
  cod_grupo_despesa       VARCHAR(10) NOT NULL,
  nome_grupo_despesa      VARCHAR(300) NOT NULL,
  abrev_grupo_despesa     VARCHAR(20) NOT NULL,
  CONSTRAINT pk_grupo_despesa
    PRIMARY KEY (cod_grupo_despesa)
);


CREATE TABLE elemento_despesa (
  cod_elemento_despesa    INTEGER NOT NULL,
  nome_elemento_despesa   VARCHAR(300) NOT NULL,
  abrev_elemento_despesa  VARCHAR(20) NOT NULL,
  CONSTRAINT pk_elemento_despesa
    PRIMARY KEY (cod_elemento_despesa)
);


CREATE TABLE funcao (
  cod_funcao              INTEGER NOT NULL,
  nome_funcao             VARCHAR(300) NOT NULL,
  abrev_funcao            VARCHAR(20) NOT NULL,
  CONSTRAINT pk_funcao
    PRIMARY KEY (cod_funcao)
);


CREATE TABLE subfuncao (
  cod_subfuncao           INTEGER NOT NULL,
  nome_subfuncao          VARCHAR(300) NOT NULL,
  abrev_subfuncao         VARCHAR(20) NOT NULL,
  CONSTRAINT pk_subfuncao
    PRIMARY KEY (cod_subfuncao)
);


CREATE TABLE programa_orcamentario (
  cod_programa_orcamentario   INTEGER NOT NULL,
  nome_programa_orcamentario  VARCHAR(300) NOT NULL,
  abrev_programa_orcamentario VARCHAR(20) NOT NULL,
  CONSTRAINT pk_programa_orcamentario
    PRIMARY KEY (cod_programa_orcamentario)
);

CREATE TABLE programa_governo (
  cod_programa_governo            VARCHAR(10) NOT NULL,
  nome_programa_governo           VARCHAR(300) NOT NULL,
  abrev_programa_governo          VARCHAR(20) NOT NULL,
  CONSTRAINT pk_programa_governo
    PRIMARY KEY (cod_programa_governo)
);


CREATE TABLE acao (
  cod_acao                VARCHAR(10) NOT NULL,
  nome_acao               VARCHAR(300) NOT NULL,
  abrev_acao              VARCHAR(20) NOT NULL,
  CONSTRAINT pk_acao
    PRIMARY KEY (cod_acao)
);


CREATE TABLE subtituto (
  cod_subtituto             VARCHAR(10) NULL,
  nome_subtituto            VARCHAR(300) NULL,
  CONSTRAINT pk_subtituto
    PRIMARY KEY (cod_subtituto)
);

CREATE TABLE localizador (
  cod_localizador         INTEGER NOT NULL,
  nome_localizador        VARCHAR(300) NOT NULL,
  sigla_localizador       VARCHAR(300) NULL,
  desc_compl_localizador  VARCHAR(300) NULL,
  abrev_localizador       VARCHAR(20) NOT NULL,

  CONSTRAINT pk_localizador
    PRIMARY KEY (cod_localizador)
);

CREATE TABLE autor_ementa (
  cod_autor_ementa        VARCHAR(20) NOT NULL,
  nome_autor_ementa       VARCHAR(300) NOT NULL,
  abrev_autor_ementa      VARCHAR(20) NOT NULL,
  CONSTRAINT pk_autor_ementa
    PRIMARY KEY (cod_autor_ementa)
);

CREATE TABLE cad_economica (
  cod_cad_economica        VARCHAR(10) NOT NULL,
  nome_cad_economica       VARCHAR(300) NOT NULL,
  abrev_cad_economica      VARCHAR(20) NOT NULL,
  CONSTRAINT pk_cad_economica
    PRIMARY KEY (cod_cad_economica)
);


CREATE TABLE plano_orcamentario (
  cod_plano_orcamentario    VARCHAR(10) NOT NULL,
  nome_plano_orcamentario   VARCHAR(300) NOT NULL,
  abrev_plano_orcamentario  VARCHAR(20) NOT NULL,
  CONSTRAINT pk_plano_orcamentario
    PRIMARY KEY (cod_plano_orcamentario)
);


CREATE TABLE modalidade_despesa (
  cod_modalidade_despesa     INTEGER NOT NULL,
  nome_modalidade_despesa    VARCHAR(80) NOT NULL,
  abrev_modalidade_despesa   VARCHAR(20) NOT NULL,
  CONSTRAINT pk_modalidade_despesa
    PRIMARY KEY (cod_modalidade_despesa)
);


CREATE TABLE gastos_diretos2 (
  id_gastos_diretos          SERIAL,
  exercicio                  VARCHAR(10) NULL,
  cod_orgao_superior         INTEGER NULL,
  cod_orgao_subordinado      INTEGER NULL,
  cod_unidade_gestora        INTEGER NULL,
  cod_gestao                 INTEGER NULL,
  cod_unidade_orcamentaria   INTEGER NULL,
  cod_funcao                 INTEGER NULL,
  cod_subfuncao              INTEGER NULL,
  cod_programa_orcamentario  INTEGER NULL,
  cod_acao                   VARCHAR(10) NULL,
  cod_plano_orcamentario     VARCHAR(10) NULL, 
  cod_programa_governo       VARCHAR(10) NULL,
  cod_grupo_despesa          VARCHAR(10) NULL,
  cod_elemento_despesa       INTEGER NULL,
  cod_modalidade_despesa     INTEGER NULL,
  cod_subtituto              VARCHAR(10) NULL,
  cod_localizador            INTEGER     NULL,
  cod_autor_ementa           VARCHAR(20) NULL,
  cod_cad_economica          VARCHAR(10) NULL,
  valor_empenhado            NUMERIC(15,2) NULL,
  valor_liquidado            NUMERIC(15,2) NULL,
  valor_pago                 NUMERIC(15,2) NULL,
  valor_resto_a_pagar_insc   NUMERIC(15,2) NULL,
  valor_resto_a_pagar_canc   NUMERIC(15,2) NULL,
  valor_resto_a_pagar_pago   NUMERIC(15,2) NULL,
  CONSTRAINT pk_gastos_diretos2
    PRIMARY KEY (id_gastos_diretos),
  CONSTRAINT fk_gastos_diretos2_orgao_superior
    FOREIGN KEY (cod_orgao_superior)
    REFERENCES orgao_superior (cod_orgao_superior),
  CONSTRAINT fk_gastos_diretos2_orgao_subordinado
    FOREIGN KEY (cod_orgao_subordinado)
    REFERENCES orgao_subordinado (cod_orgao_subordinado),
  CONSTRAINT fk_gastos_diretos2_unidade_gestora
    FOREIGN KEY (cod_unidade_gestora)
    REFERENCES unidade_gestora (cod_unidade_gestora),
  CONSTRAINT fk_gastos_diretos2_gestao
    FOREIGN KEY (cod_gestao)
    REFERENCES gestao (cod_gestao),
  CONSTRAINT fk_gastos_diretos2_unidade_orcamentaria
    FOREIGN KEY (cod_unidade_orcamentaria)
    REFERENCES unidade_orcamentaria (cod_unidade_orcamentaria),
  CONSTRAINT fk_gastos_diretos_acao
    FOREIGN KEY (cod_acao)
    REFERENCES acao (cod_acao),
  CONSTRAINT fk_gastos_diretos_plano_orcamentario
    FOREIGN KEY (cod_plano_orcamentario)
    REFERENCES plano_orcamentario (cod_plano_orcamentario),
  CONSTRAINT fk_gastos_diretos2_programa_governo
    FOREIGN KEY (cod_programa_governo)
    REFERENCES programa_governo (cod_programa_governo),
  CONSTRAINT fk_gastos_diretos2_localizador
    FOREIGN KEY (cod_localizador)
    REFERENCES localizador (cod_localizador),
  CONSTRAINT fk_gastos_diretos2_autor_ementa
    FOREIGN KEY (cod_autor_ementa)
    REFERENCES autor_ementa (cod_autor_ementa),
  CONSTRAINT fk_gastos_diretos2_cad_economica
    FOREIGN KEY (cod_cad_economica)
    REFERENCES cad_economica (cod_cad_economica),

	
  CONSTRAINT fk_gastos_diretos2_grupo_despesas
    FOREIGN KEY (cod_grupo_despesa)
    REFERENCES grupo_despesa (cod_grupo_despesa),
  CONSTRAINT fk_gastos_diretos2_elemento_despesa
    FOREIGN KEY (cod_elemento_despesa)
    REFERENCES elemento_despesa (cod_elemento_despesa),
  CONSTRAINT fk_gastos_diretos2_modalidade_despesa
    FOREIGN KEY (cod_modalidade_despesa)
    REFERENCES modalidade_despesa (cod_modalidade_despesa),
  CONSTRAINT fk_gastos_diretos2_subtituto
    FOREIGN KEY (cod_subtituto)
    REFERENCES subtituto (cod_subtituto)
 
);


CREATE TABLE dados_ifes3 (
  id_dados_ifes              SERIAL,
  exercicio                  VARCHAR(10) NULL,
  cod_orgao_superior         INTEGER NULL,
  cod_orgao_subordinado      INTEGER NULL,
  cod_unidade_gestora        INTEGER NULL,
  cod_gestao                 INTEGER NULL,
  cod_unidade_orcamentaria   INTEGER NULL,
  cod_funcao                 INTEGER NULL,
  cod_subfuncao              INTEGER NULL,
  cod_programa_orcamentario  INTEGER NULL,
  cod_acao                   VARCHAR(10) NULL,
  
  cod_plano_orcamentario	 VARCHAR(10) NULL,
  
  cod_programa_governo       VARCHAR(10) NULL,
  
  cod_subtituto              VARCHAR(10) NULL,
  cod_localizador            INTEGER     NULL,
  cod_autor_ementa           VARCHAR(20) NULL,
  cod_cad_economica          VARCHAR(10) NULL,
  
  cod_grupo_despesa          VARCHAR(10) NULL,
  cod_elemento_despesa       INTEGER NULL,
  cod_modalidade_despesa     INTEGER NULL,
  valor_empenhado            NUMERIC(15,2) NULL,
  valor_liquidado            NUMERIC(15,2) NULL,
  valor_pago                 NUMERIC(15,2) NULL,
  valor_resto_a_pagar_insc   NUMERIC(15,2) NULL,
  valor_resto_a_pagar_canc   NUMERIC(15,2) NULL,
  valor_resto_a_pagar_pago   NUMERIC(15,2) NULL,
  CONSTRAINT pk_dados_ifes3
    PRIMARY KEY (id_dados_ifes),
  CONSTRAINT fk_dados_ifes3_orgao_superior
    FOREIGN KEY (cod_orgao_superior)
    REFERENCES orgao_superior (cod_orgao_superior),
  CONSTRAINT fk_dados_ifes3_orgao_subordinado
    FOREIGN KEY (cod_orgao_subordinado)
    REFERENCES orgao_subordinado (cod_orgao_subordinado),
  CONSTRAINT fk_dados_ifes3_unidade_gestora
    FOREIGN KEY (cod_unidade_gestora)
    REFERENCES unidade_gestora (cod_unidade_gestora),
  CONSTRAINT fk_dados_ifes3_gestao
    FOREIGN KEY (cod_gestao)
    REFERENCES gestao (cod_gestao),
  CONSTRAINT fk_dados_ifes3_unidade_orcamentaria
    FOREIGN KEY (cod_unidade_orcamentaria)
    REFERENCES unidade_orcamentaria (cod_unidade_orcamentaria),
  CONSTRAINT fk_dados_ifes3_acao
    FOREIGN KEY (cod_acao)
    REFERENCES acao (cod_acao),
  CONSTRAINT fk_dados_ifes3_diretos_plano_orcamentario
    FOREIGN KEY (cod_plano_orcamentario)
    REFERENCES plano_orcamentario (cod_plano_orcamentario),
  CONSTRAINT fk_dados_ifes3_programa_governo
    FOREIGN KEY (cod_programa_governo)
    REFERENCES programa_governo (cod_programa_governo),

  CONSTRAINT fk_dados_ifes3_subtitulo
    FOREIGN KEY (cod_subtituto)
    REFERENCES subtituto (cod_subtituto),

  CONSTRAINT fk_dados_ifes3_localizador
    FOREIGN KEY (cod_localizador)
    REFERENCES localizador (cod_localizador),
  CONSTRAINT fk_dados_ifes3_autor_ementa
    FOREIGN KEY (cod_autor_ementa)
    REFERENCES autor_ementa (cod_autor_ementa),
  CONSTRAINT fk_dados_ifes3_cad_economica
    FOREIGN KEY (cod_cad_economica)
    REFERENCES cad_economica (cod_cad_economica),


  CONSTRAINT fk_dados_ifes3_grupo_despesas
    FOREIGN KEY (cod_grupo_despesa)
    REFERENCES grupo_despesa (cod_grupo_despesa),
  CONSTRAINT fk_dados_ifes3_elemento_despesa
    FOREIGN KEY (cod_elemento_despesa)
    REFERENCES elemento_despesa (cod_elemento_despesa),
  CONSTRAINT fk_dados_ifes3_modalidade_despesa
    FOREIGN KEY (cod_modalidade_despesa)
    REFERENCES modalidade_despesa (cod_modalidade_despesa)
 
);



/*
DROP TABLE IF EXISTS importar_dados;
*/
CREATE TABLE importar_dados3 (
exercicio                  VARCHAR(300) NULL,
cod_orgao_superior         VARCHAR(300) NULL,
nome_orgao_superior        VARCHAR(300) NULL,
cod_orgao_subordinado      VARCHAR(300) NULL,
nome_orgao_subordinado     VARCHAR(300) NULL,
cod_unidade_gestora        VARCHAR(300) NULL,
nome_unidade_gestora       VARCHAR(300) NULL,
cod_gestao                 VARCHAR(300) NULL,
nome_gestao                VARCHAR(300) NULL,
cod_unidade_orcamentaria   VARCHAR(300) NULL,
nome_unidade_orcamentaria  VARCHAR(300) NULL,
cod_funcao                 VARCHAR(300) NULL,
nome_funcao                VARCHAR(300) NULL,
cod_subfuncao              VARCHAR(300) NULL,
nome_subfuncao             VARCHAR(300) NULL,
cod_programa_orcamentario  VARCHAR(300) NULL,
nome_programa_orcamentario VARCHAR(300) NULL,
cod_acao                   VARCHAR(300) NULL,
nome_acao                  VARCHAR(300) NULL,
cod_plano_orcamentario	   VARCHAR(300) NULL,
nome_plano_orcamentario	   VARCHAR(300) NULL,
cod_programa_governo       VARCHAR(300) NULL,
nome_programa_governo      VARCHAR(300) NULL,
uf                         VARCHAR(300) NULL,
municipio                  VARCHAR(300) NULL,

cod_subtituto              VARCHAR(300) NULL,
nome_subtituto             VARCHAR(300) NULL,

cod_localizador            VARCHAR(300) NULL,
nome_localizador           VARCHAR(300) NULL,
sigla_localizador          VARCHAR(300) NULL,
desc_compl_localizador     VARCHAR(300) NULL,

cod_autor_ementa           VARCHAR(300) NULL,
nome_autor_ementa          VARCHAR(300) NULL,

cod_cad_economica          VARCHAR(300) NULL,
nome_cad_economica         VARCHAR(300) NULL,

cod_grupo_despesa          VARCHAR(300) NULL,
nome_grupo_despesa         VARCHAR(300) NULL,
cod_elemento_despesa       VARCHAR(300) NULL,
nome_elemento_despesa      VARCHAR(300) NULL,
cod_modalidade_despesa     VARCHAR(300) NULL,
nome_modalidade_despesa    VARCHAR(300) NULL,
valor_empenhado            VARCHAR(300) NULL,
valor_liquidado            VARCHAR(300) NULL,
valor_pago                 VARCHAR(300) NULL,
valor_resto_a_pagar_insc   VARCHAR(300) NULL,
valor_resto_a_pagar_canc   VARCHAR(300) NULL,
valor_resto_a_pagar_pago   VARCHAR(300) NULL
);



