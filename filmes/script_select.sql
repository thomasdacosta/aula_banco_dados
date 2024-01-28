-- Listar todos os filmes cadastrados:
SELECT *
FROM filmes;

-- Listar todos os gêneros de filmes cadastrados:
SELECT *
FROM generos;

-- Listar somente a descrição dos gêneros de filmes:
SELECT dsc_genero
FROM generos;

-- Listar a descrição e a quantidade de votos dos filmes que tiveram mais de 1000 votos:
SELECT dsc_filme, qtd_votos
FROM filmes
WHERE qtd_votos > 10000;

-- Listar filmes com nota média entre 83 e 85:
SELECT *
FROM filmes
WHERE num_nota_media > 83 and num_nota_media  < 85;

-- O resultado traz a quantidade de votos e o nota média para o filme 'Matrix'.
-- Resultado query simples com string.png
-- Para esse cenário a query fica assim:
SELECT id_filme, dsc_filme, qtd_votos ,num_nota_media
FROM filmes
WHERE dsc_filme = 'Matrix';

-- O resultado traz filmes quantidade de votos inferior a 1000 e nota média enter 80 e 90.
-- Resultado query dessafio 1.png
-- Para esse cenário a query fica assim:
select id_filme, dsc_filme, qtd_votos ,num_nota_media
from filmes
where qtd_votos < 1000
and num_nota_media > 80
and num_nota_media < 90;

-- Considere os registros sem dados ao liste os filmes que estão sem link de foto
SELECT *
FROM filmes
WHERE dsc_link_foto is null;

-- Liste nome e data de lançamento dos filmes que contenham a palavra 'Bela'
SELECT dsc_filme, dat_lancamento
FROM filmes
WHERE dsc_filme like '%bela%';

-- Liste apenas os nomes dos filmes que contenham a palavra 'Bela'  retirando os itens duplicados
SELECT DISTINCT dsc_filme
FROM filmes
WHERE dsc_filme like '%bela%';

-- Liste a descrição e a quantidade de votos dos filmes que tiveram mais de 1000 votos, ordenar pela quantidade de votos em ordem decrescente
SELECT dsc_filme, qtd_votos
FROM filmes
WHERE qtd_votos > 1000
ORDER BY qtd_votos DESC;

-- Liste os filmes da série '007' com quantidade de votos acima de 3000 ou nota média acima de 65
SELECT *
FROM filmes
WHERE dsc_filme like '%007%'
AND (qtd_votos > 3000
OR num_nota_media > 65);

-- Liste nome e o índice de popularidade dos 5 filmes da série '007' com maior popularidade
SELECT dsc_filme, num_popularidade
FROM filmes
WHERE dsc_filme like '%007%'
ORDER BY num_popularidade DESC
LIMIT 5;

-- Listar os filmes que são do gênero Guerra ou do Gênero Ação
-- Opção 1
SELECT dsc_filme
FROM filmes f
JOIN filmes_genero fg on fg.id_filme = f.id_filme
JOIN generos g on g.id_genero = fg.id_genero
WHERE g.dsc_genero = 'Guerra'
UNION
SELECT dsc_filme
FROM filmes f
JOIN filmes_genero fg on fg.id_filme = f.id_filme
JOIN generos g on g.id_genero = fg.id_genero
WHERE g.dsc_genero = 'Ação';

-- Opção 2
SELECT DISTINCT dsc_filme
FROM filmes f
JOIN filmes_genero fg on fg.id_filme = f.id_filme
JOIN generos g on g.id_genero = fg.id_genero
WHERE g.dsc_genero IN ('Guerra', 'Ação');

-- Listar os filmes que são do gênero Guerra e também do Gênero Ação
-- Opção 1
SELECT dsc_filme
FROM filmes f
JOIN filmes_genero fg on fg.id_filme = f.id_filme
JOIN generos g on g.id_genero = fg.id_genero
WHERE g.dsc_genero = 'Guerra'
INTERSECT
SELECT dsc_filme
FROM filmes f
JOIN filmes_genero fg on fg.id_filme = f.id_filme
JOIN generos g on g.id_genero = fg.id_genero
WHERE g.dsc_genero = 'Ação';

-- Opção 2
SELECT dsc_filme
FROM filmes f
JOIN filmes_genero fg on fg.id_filme = f.id_filme
JOIN generos g on g.id_genero = fg.id_genero
WHERE g.dsc_genero = 'Guerra'
AND dsc_filme IN
     (SELECT dsc_filme
     FROM filmes f
     JOIN filmes_genero fg on fg.id_filme = f.id_filme
     JOIN generos g on g.id_genero = fg.id_genero
     WHERE g.dsc_genero = 'Ação');

-- Listar os filmes que são do gênero Guerra e não são do Gênero Ação
-- Opção 1
SELECT dsc_filme
FROM filmes f
JOIN filmes_genero fg on fg.id_filme = f.id_filme
JOIN generos g on g.id_genero = fg.id_genero
WHERE g.dsc_genero = 'Guerra'
EXCEPT
SELECT dsc_filme
FROM filmes f
JOIN filmes_genero fg on fg.id_filme = f.id_filme
JOIN generos g on g.id_genero = fg.id_genero
WHERE g.dsc_genero = 'Ação';

-- Opção 2
SELECT dsc_filme
FROM filmes f
JOIN filmes_genero fg on fg.id_filme = f.id_filme
JOIN generos g on g.id_genero = fg.id_genero
WHERE g.dsc_genero = 'Guerra'
AND dsc_filme NOT IN
     (SELECT dsc_filme
     FROM filmes f
     JOIN filmes_genero fg on fg.id_filme = f.id_filme
     JOIN generos g on g.id_genero = fg.id_genero
     WHERE g.dsc_genero = 'Ação');

