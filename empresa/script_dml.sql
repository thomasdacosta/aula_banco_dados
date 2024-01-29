USE bd_empresa;

insert into departamento values (1,'Informática',null,null);
insert into departamento values (2,'Vendas',null,null);
insert into departamento values (3,'Compras',null,null);
insert into departamento values (4,'RH',null,null);
insert into departamento values (5,'Novo Depto',null,null);

insert into departamento_local values (1,'BH');
insert into departamento_local values (1,'RJ');
insert into departamento_local values (2,'RJ');
insert into departamento_local values (2,'SP');
insert into departamento_local values (3,'BH');
insert into departamento_local values (3,'RJ');
insert into departamento_local values (4,'SP');

insert into empregado values (1,'José da Silva','1954-04-01 00:00:00','Rua dos Aflitos, 54 - Bom Retiro','São Paulo','SP','M',4500.00,NULL,1);
insert into empregado values (2,'João Oliveira','1972-08-08 00:00:00','Rua da Liberdade, 92 - Alambique','São Paulo','SP','M',2500.00,1,1);
insert into empregado values (3,'Maria Batista','1980-01-12 00:00:00','Rua dos Aviadores, 16','Belo Horizonte','MG','F',2800.00,1,2);
insert into empregado values (4,'Rodrigo Moreira','1956-11-01 00:00:00','Av. Afonso Pena, 2433 apto 1101','Belo Horizonte','MG','M',800.00,2,1);
insert into empregado values (5,'Renata Carvalho','1972-02-05 00:00:00','Rua Alegria, 25','Rio de Janeiro','RJ','F',1700.00,3,2);
insert into empregado values (6,'Alice Borboleta','1969-05-08 00:00:00','Rua Sem Lenço, 1500 - Resfriado','São Paulo','SP','F',1000.00,3,1);
insert into empregado values (7,'Antônio Soares','1970-08-07 00:00:00','Rua Brasil, 239','São Paulo','SP','M',1500.00,1,3);
insert into empregado values (8,'Marcílio Costa','1950-05-05 00:00:00','Rua Trem das Onze, 1200','Belo Horizonte','MG','M',2000.00,1,4);
insert into empregado values (9,'Novo empregado','1975-04-08 00:00:00','Rua dos Aflitos, 84','São Paulo','SP','M',500.0,NULL,NULL);

insert into dependente values (1,'Huguinho','M','filho');
insert into dependente values (1,'Luizinho','M','filho');
insert into dependente values (1,'Margarida','F','cônjuge');
insert into dependente values (1,'Zezinho','M','filho');
insert into dependente values (3,'Kelly Key','F','filha');
insert into dependente values (4,'Luciana Melo','F','filha');
insert into dependente values (4,'Sandra de Sá','F','cônjuge');

insert into projeto values (1,'Migração para SQL 2005','BH',1);
insert into projeto values (2,'Nova arquitetura .NET','BH',1);
insert into projeto values (3,'Instalação do novo servidor','SP',1);
insert into projeto values (4,'Desenvolver novo produto','RJ',2);
insert into projeto values (5,'Abertura de novas lojas','BH',2);
insert into projeto values (6,'Realizar concorrência','RJ',3);
insert into projeto values (7,'Implantar sistema de compras','SP',3);
insert into projeto values (8,'Criar plano de cargos e salários','MG',4);
insert into projeto values (9,'Montar plano de capacitação','MG',4);
insert into projeto values (10,'Criar regras para PDV','SP',4);

insert into alocacao values (1,1,10);
insert into alocacao values (1,2,4);
insert into alocacao values (2,1,8);
insert into alocacao values (2,2,4);
insert into alocacao values (2,3,4);
insert into alocacao values (2,7,2);
insert into alocacao values (3,4,2);
insert into alocacao values (3,5,2);
insert into alocacao values (4,1,8);
insert into alocacao values (4,7,2);
insert into alocacao values (7,6,20);
insert into alocacao values (8,9,10);
insert into alocacao values (8,10,4);

update departamento
set num_matricula_gerente = 1,
	dat_inicio_gerente = '2005-05-05 00:00:00'
where cod_depto = 1;

update departamento
set num_matricula_gerente = 3,
	dat_inicio_gerente = '2000-04-02 00:00:00'
where cod_depto = 2;

update departamento
set num_matricula_gerente = 7,
	dat_inicio_gerente = '2002-01-01 00:00:00'
where cod_depto = 3;

update departamento
set num_matricula_gerente = 8,
	dat_inicio_gerente = '2003-04-07 00:00:00'
where cod_depto = 4;
