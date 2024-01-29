-- Listar todos os dados das tabelas empregado, departamento e projeto
SELECT * FROM empregado;
SELECT * FROM departamento;
SELECT * FROM projeto;

-- Listar os projetos que acontecem em BH
SELECT *
FROM projeto
WHERE nom_local = 'BH';

-- Listar todos os empregados do sexo masculino que moram em MG
SELECT *
FROM empregado
WHERE sex_empregado = 'M'
AND sig_uf = 'MG';

-- Liste o número de matrícula e nome do empregados e nome e parentesco de todos os dependentes
SELECT e.num_matricula,
       e.nom_empregado,
       d.nom_dependente,
       d.dsc_parentesco
FROM empregado e
JOIN dependente d ON d.num_matricula = e.num_matricula;

-- Liste nome dos departamentos com número de matrícula e nome de todos os funcionário. Ordene o resultado por departamento e nome do empregado.
SELECT nom_depto,
       num_matricula,
       nom_empregado
FROM departamento d
JOIN empregado e ON e.cod_depto = d.cod_depto
ORDER BY nom_depto, nom_empregado;

-- Para cada departamento um dos funcionários tem a função de gerência. Liste nome dos departamentos com número de matrícula e nome do gerente responsável.
SELECT nom_depto,
       num_matricula,
       nom_empregado
FROM departamento d
JOIN empregado e ON e.num_matricula = d.num_matricula_gerente;

-- Liste o número de matrícula e nome dos supervisores e número de matrícula e nome dos funcionários sob sua supervisão. Ordene os supervisores e empregados em ordem alfabética
SELECT sup.num_matricula as matricula_supervisor,
       sup.nom_empregado as nome_supervisor,
       e.num_matricula as matricula_empregado,
       e.nom_empregado as nome_empregado
FROM empregado e
JOIN empregado sup ON e.num_matricula_supervisor = sup.num_matricula;

-- Liste os funcionários dos projetos de BH com o total de horas alocado.  Exibir nome e local do projeto, número de matrícula e nome do empregado e o total de horas alocado.
SELECT p.nom_projeto,
       p.nom_local,
       e.num_matricula,
       e.nom_empregado,
       a.num_horas
FROM projeto p
JOIN alocacao a ON a.cod_projeto = p.cod_projeto
JOIN empregado e ON e.num_matricula = a.num_matricula
WHERE nom_local = 'BH';

-- Liste o número de matrícula e nome do empregados e nome e parentesco de todos os dependentes. Considere também os funcionários que não tem dependentes.
SELECT e.num_matricula,
e.nom_empregado,
d.nom_dependente,
d.dsc_parentesco
FROM empregado e
LEFT JOIN dependente d ON d.num_matricula = e.num_matricula;

-- Liste o número de matrícula e nome dos empregados que não tem dependentes cadastrados.
SELECT e.num_matricula,
e.nom_empregado,
d.nom_dependente,
d.dsc_parentesco
FROM empregado e
LEFT JOIN dependente d ON d.num_matricula = e.num_matricula
WHERE d.num_matricula is null;

-- Listar os nomes dos projetos, os locais de execução, o departamento, e os gerentes responsáveis. Considere também os departamentos sem projeto e sem gerente.
SELECT p.nom_projeto,
p.nom_local,
d.nom_depto,
nom_empregado
FROM projeto p
RIGHT JOIN departamento d on d.cod_depto = p.cod_depto
LEFT JOIN empregado e on e.num_matricula = d.num_matricula_gerente;

-- Liste o número de matrícula e nome dos empregados e seus dependentes, exibindo a coluna 'dependentes' com nome do dependente e o parentesco entre parêntesis . Exemplo: Zezinho (filho)
SELECT e.num_matricula,
       e.nom_empregado,
       d.nom_dependente + ' (' + RTRIM(d.dsc_parentesco) +')' as dependentes
FROM empregado e
JOIN dependente d ON d.num_matricula = e.num_matricula;

-- Gerar a lista de aniversariantes da empresa com mês, dia e nome do empregado ordem cronológica
SELECT MONTH(dat_nascimento) AS Mês,
       DAY (dat_nascimento) AS Dia,
       nom_empregado
FROM empregado
ORDER BY 1, 2;

-- Listar os departamentos e seus gerentes com tempo de gerência em anos ordenando pelo mais antigo
-- Opção 1
SELECT nom_depto,
       nom_empregado,
       YEAR(now()) - YEAR(dat_inicio_gerente) tempo_gerencia
FROM departamento d
JOIN empregado e ON e.num_matricula = d.num_matricula_gerente
ORDER BY 3 DESC;

-- Listar os funcionários  que terão mais que 65 a partir de 2021
-- Opção 1
SELECT nom_empregado,
       YEAR(now()) - YEAR(dat_nascimento) AS idade_atual,
       YEAR(now()) + 1 - YEAR(dat_nascimento) AS idade_proximo_ano
FROM empregado
WHERE YEAR(now()) + 1 - YEAR(dat_nascimento) >= 65;

-- Listar a quantidade de empregados com idade média por supervisor
SELECT sup.nom_empregado,
       count(*) AS qtd_empregado,
       AVG(YEAR(now()) - YEAR(e.dat_nascimento)) AS idade_media
FROM empregado e
JOIN empregado sup on sup.num_matricula = e.num_matricula_supervisor
GROUP BY sup.nom_empregado;

-- Listar nome dos departamentos com nomes dos empregados e a quantidade de dependentes, se houver
SELECT nom_depto,
       nom_empregado,
       COUNT(dp.num_matricula) AS qtd_dependente
FROM departamento d
JOIN empregado e on e.cod_depto = d.cod_depto
LEFT JOIN dependente dp on dp.num_matricula = e.num_matricula
GROUP BY  nom_depto, nom_empregado
ORDER BY nom_depto, nom_empregado;

-- Listar somente os locais e a quantidade de projetos onde houver mais de 2 projetos alocados
SELECT nom_local,
       COUNT(*) qtd_projeto
FROM projeto p
GROUP BY nom_local
HAVING COUNT(*) > 2;

-- Listar o nome do empregado e o nome do respectivo departamento para todos os empregados que não estão alocados em projetos, resolver com:
-- a) NOT EXISTS
SELECT nom_empregado,
       nom_depto
FROM empregado e
JOIN departamento d on d.cod_depto = e.cod_depto
WHERE NOT EXISTS (SELECT 1
FROM alocacao a
WHERE a.num_matricula = e.num_matricula);

-- b) NOT IN
SELECT nom_empregado,
       nom_depto
FROM empregado e
JOIN departamento d on d.cod_depto = e.cod_depto
WHERE e.num_matricula NOT IN
                    (SELECT num_matricula FROM alocacao a);

-- c) LEFT JOIN
SELECT nom_empregado,
       nom_depto
FROM empregado e
JOIN departamento d on d.cod_depto = e.cod_depto
LEFT JOIN alocacao a on a.num_matricula = e.num_matricula
WHERE a.num_matricula is null;

-- Listar o empregado, o número de horas e o projeto cuja alocação de horas no projeto é maior do que a média de alocação do referido projeto.
SELECT a.cod_projeto,
       nom_empregado,
       nom_projeto,
       media,
       SUM(num_horas) AS qtd_horas
FROM empregado e
JOIN alocacao a on a.num_matricula = e.num_matricula
JOIN projeto p on p.cod_projeto = a.cod_projeto
JOIN (SELECT cod_projeto, AVG(num_horas) media
FROM alocacao a
GROUP BY cod_projeto) a_media ON a.cod_projeto = a_media.cod_projeto
GROUP BY a.cod_projeto, nom_empregado, nom_projeto, media
HAVING SUM(num_horas) > media;
