DROP TYPE TP_PESSOA FORCE;




--Criação de TIPOS
CREATE OR REPLACE TYPE TP_FONE AS OBJECT(--Criando o tipo de telefone para depois criar NT
    NUMERO NUMBER
);
/
CREATE OR REPLACE TYPE TP_FONES AS VARRAY(5) OF TP_FONE;
/
CREATE OR REPLACE TYPE TP_ENDERECO AS OBJECT(
    CEP VARCHAR2(9),
    RUA VARCHAR2(30),
    BAIRRO VARCHAR2(30),
    CIDADE VARCHAR2(30),
    NUMERO_ENDERECO NUMBER,
);
/
CREATE OR REPLACE TYPE TP_PESSOA AS OBJECT(
    CPF NUMBER,
    NOME_PESSOA VARCHAR2(30) NOT NULL,
    DATA_NASC DATE,
    ENDERECO TP_ENDERECO,
    L_FONES TP_FONES
)NOT FINAL;
/
CREATE OR REPLACE TYPE TP_FUNCIONARIO UNDER TP_PESSOA(
    ID_FUNCIONARIO NUMBER NOT NULL,
    ID_SUPERVISOR NUMBER,
    SALARIO DECIMAL(6,2)
);--Não tenho certeza se seria dessa forma, 
/
CREATE OR REPLACE TYPE TP_CINEMA AS OBJECT(
    CNPJ NUMBER,
    NUMERO_SALAS NUMBER,
    NOME_CINEMA VARCHAR2(30) NOT NULL,
    ENDERECO_CINE TP_ENDERECO
);
/
CREATE OR REPLACE TYPE TP_SETOR AS OBJECT(
    ID_SETOR NUMBER,
    NOME_SETOR VARCHAR2(30) NOT NULL,
    L_FONES TP_FONES
);
/
CREATE OR REPLACE TYPE TP_SETOR_FUNC AS OBJECT( --RELACAO SETOR-FUNC
    ID_Setor NUMBER, --refers tp_setor
    ID_Funcionario NUMBER, --refers tp_funcionario
);
/
CREATE OR REPLACE TYPE TP_TRABALHA AS OBJECT(
    CNPJ_Trabalha NUMBER, --refers TP_CINEMA
    ID_Funcionario NUMBER --refers TP_FUNCIONARIO
);
/
CREATE OR REPLACE TYPE TP_SNACK_BAR AS OBJECT(
    ID_Snack_Bar NUMBER,
    CNPJ NUMBER, --refers TP_CINEMA
    Horario_Abre TIMESTAMP, --no oracle live time nao é um tipo de dado caso forem fazer testes modificar.
    Horario_Fecha TIMESTAMP, -- pode colocar timestamp pra rodar... mas ai esse tipo de dado tem a data + hora :/
);
/
CREATE OR REPLACE TYPE TP_PRODUTO AS OBJECT(
    ID_Produto NUMBER,
    ID_Snack_Bar NUMBER, --refers TP_SNACK_BAR
    CNPJ_Snack_Bar NUMBER, --refers TP_SNACK_BAR
    Nome_Produto VARCHAR2(30) NOT NULL,
    Preco DECIMAL(6,2),
);
/
CREATE OR REPLACE TYPE TP_PRODUTO AS OBJECT(
    ID_Produto NUMBER,
    ID_Snack_Bar NUMBER, --refers TP_SNACK_BAR
    CNPJ_Snack_Bar NUMBER, --refers TP_SNACK_BAR
    Nome_Produto VARCHAR2(30) NOT NULL,
    Preco DECIMAL(6,2),
);
/
CREATE OR REPLACE TYPE TP_SALA AS OBJECT(
    ID_SALA NUMBER,
    CAPACIDADE NUMBER
);
/
CREATE OR REPLACE TYPE TP_FILME AS OBJECT(
    ID_Filme NUMBER,
    Faixa_Etaria NUMBER,
    Data_Inicio DATE,
    Data_Fim DATE,
    --Diretor VARCHAR2(30) NOT NULL,
    --Ator VARCHAR2(30) NOT NULL,
    --Genero VARCHAR
    Nome_Filme VARCHAR2(30) NOT NULL
);
/
CREATE OR REPLACE TYPE TP_FILME_SALA AS OBJECT(
    ID_FILME NUMBER, --refers TP_FILME
    ID_SALA NUMBER --refers TP_SALA
);
/

CREATE OR REPLACE TYPE TP_TRABALHA AS OBJECT(
    CNPJ_Trabalha NUMBER, --refers TP_CINEMA
    ID_Funcionario NUMBER --refers TP_FUNCIONARIO
);
/



--Criacao de TABELAS
CREATE TABLE TB_PESSOA OF TP_PESSOA(
    CPF PRIMARY KEY
);
/