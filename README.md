# Aula de Banco de Dados

## Descrição

Este repositório contém materiais e recursos para uma aula completa sobre bancos de dados.
A aula abrange desde conceitos básicos até tópicos mais avançados relacionados a modelos conceituais, lógicos e físicos, além de consultas e controle transacional.

## Tópicos Abordados

- Aula 01 - Apresentação
- Aula 02 - Introdução a Bancos de Dados
- Aula 03 - Elaboração de um Banco de Dados
- Aula 04 - Modelo Conceitual - Introdução
- Aula 05 - Modelo Conceitual - Cardinalidade
- Aula 06 - Modelo Lógico - Estrutura das Tabelas
- Aula 07 - Modelo Físico - Comandos DDL
- Aula 08 - Modelo Físico - Comandos DML
- Aula 09 - Controle Transacional
- Aula 10 - LAB - Criando um banco de dados MySQL na AWS
- Aula 11 - LAB - Modelo Conceitual - Entidades com draw.io
- Aula 12 - LAB - Modelo Conceitual - Relacionamentos com draw.io
- Aula 13 - LAB - Modelo Conceitual - Cardinalidade com draw.io
- Aula 14 - LAB - Modelo Lógico - Criando o DER com MySQL Workbench
- Aula 15 - LAB - Modelo Físico - Usando os comandos DDL e DML com MySQL
- Aula 16 - LAB - Modelo Físico - Usando os comandos DDL e DML com AWS RDS e AWS Cloud9

## Tutoriais

### Step by Step – Implantando um banco de dados MySQL com AWS RDS
- https://thomasdacosta.com.br/2023/09/09/step-by-step-implantando-um-banco-de-dado-mysql-com-aws-rds/

### Step by Step: Criando um banco de dados através de um diagrama DER no MySQL

- https://thomasdacosta.com.br/2024/05/12/step-by-step-criando-um-banco-de-dados-atraves-de-um-diagrama-der-no-mysql/

---

## Comando Docker para iniciar o MySQL

```bash
docker run --name mysql-container -e MYSQL_ROOT_PASSWORD=123456 -p 3306:3306 -d mysql:latest
```

## Executar um script SQL através da linha de comando
```bash
mysql -u USUARIO -pSENHA -h SERVIDOR < SCRIPT.sql
```

---

Thomás da Costa - [https://thomasdacosta.com.br](https://thomasdacosta.com.br)