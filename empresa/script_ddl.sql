DROP DATABASE IF EXISTS bd_empresa;

CREATE DATABASE IF NOT EXISTS bd_empresa;

USE bd_empresa;

CREATE TABLE alocacao (
    num_matricula INT NOT NULL,
    cod_projeto INT NOT NULL,
    num_horas INT NOT NULL,
    PRIMARY KEY (num_matricula, cod_projeto)
);

CREATE TABLE departamento (
    cod_depto INT NOT NULL,
    nom_depto VARCHAR(100) NOT NULL,
    num_matricula_gerente INT NULL,
    dat_inicio_gerente DATETIME NULL,
    PRIMARY KEY (cod_depto)
);

CREATE TABLE departamento_local (
    cod_depto INT NOT NULL,
    nom_local VARCHAR(50) NOT NULL
);

CREATE TABLE dependente (
    num_matricula INT NOT NULL,
    nom_dependente VARCHAR(100) NOT NULL,
    sex_dependente CHAR(1) NOT NULL,
    dsc_parentesco CHAR(10) NOT NULL
);

CREATE TABLE empregado (
    num_matricula INT NOT NULL,
    nom_empregado VARCHAR(100) NOT NULL,
    dat_nascimento DATETIME NULL,
    dsc_endereco VARCHAR(100) NULL,
    nom_cidade VARCHAR(100) NULL,
    sig_uf CHAR(2) NULL,
    sex_empregado CHAR(1) NOT NULL,
    val_salario NUMERIC(7, 2) NOT NULL,
    num_matricula_supervisor INT NULL,
    cod_depto INT NULL,
    PRIMARY KEY (num_matricula)
);

CREATE TABLE projeto (
    cod_projeto INT NOT NULL,
    nom_projeto VARCHAR(100) NOT NULL,
    nom_local VARCHAR(50) NULL,
    cod_depto INT NOT NULL,
    PRIMARY KEY (cod_projeto)
);

ALTER TABLE dependente
ADD CONSTRAINT CK_dependente_sexo CHECK (sex_dependente = 'M' OR sex_dependente = 'F');

ALTER TABLE empregado
ADD CONSTRAINT CK_empregado_sexo CHECK (sex_empregado = 'M' OR sex_empregado = 'F');

ALTER TABLE alocacao
ADD CONSTRAINT FK_alocacao_empregado FOREIGN KEY (num_matricula)
REFERENCES empregado (num_matricula),
ADD CONSTRAINT FK_alocacao_projeto FOREIGN KEY (cod_projeto)
REFERENCES projeto (cod_projeto)
ON DELETE CASCADE
ON UPDATE CASCADE;

ALTER TABLE departamento
ADD CONSTRAINT FK_gerencia FOREIGN KEY (num_matricula_gerente)
REFERENCES empregado (num_matricula);

ALTER TABLE departamento_local
ADD CONSTRAINT FK_esta_localizado FOREIGN KEY (cod_depto)
REFERENCES departamento (cod_depto)
ON DELETE CASCADE
ON UPDATE CASCADE;

ALTER TABLE dependente
ADD CONSTRAINT FK_possui FOREIGN KEY (num_matricula)
REFERENCES empregado (num_matricula)
ON DELETE CASCADE
ON UPDATE CASCADE;

ALTER TABLE empregado
ADD CONSTRAINT FK_supervisiona FOREIGN KEY (num_matricula_supervisor)
REFERENCES empregado (num_matricula),
ADD CONSTRAINT FK_trabalha_para FOREIGN KEY (cod_depto)
REFERENCES departamento (cod_depto);

ALTER TABLE projeto
ADD CONSTRAINT FK_projeto_departamento FOREIGN KEY (cod_depto)
REFERENCES departamento (cod_depto);
