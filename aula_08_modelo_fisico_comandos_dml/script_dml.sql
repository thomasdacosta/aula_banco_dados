/*
 Slide 4
 */
SELECT * FROM usuarios
WHERE id_usuario = 1;

/*
 Slide 7
 */
INSERT INTO usuarios (id_usuario, email, senha) VALUES (1, 'joao@email.com', 'senha123');

/*
 Slide 9
 */
UPDATE usuarios
SET
    email = 'joao@email.com.br',
    senha = 'senha1234'
WHERE id_usuario = 1;

/*
 Slide 10
 */
UPDATE produtos
SET
    preco = 10.00
WHERE preco >= 1.00 AND preco <= 7.00;

/*
 Slide 12
 */
DELETE FROM usuarios
       WHERE id_usuario = 1;
