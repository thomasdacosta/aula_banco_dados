INSERT INTO estado (nome_estado, sigla_estado) VALUES
('Acre', 'AC'),
('Alagoas', 'AL'),
('Amapá', 'AP'),
('Amazonas', 'AM'),
('Bahia', 'BA'),
('Ceará', 'CE'),
('Distrito Federal', 'DF'),
('Espírito Santo', 'ES'),
('Goiás', 'GO'),
('Maranhão', 'MA'),
('Mato Grosso', 'MT'),
('Mato Grosso do Sul', 'MS'),
('Minas Gerais', 'MG'),
('Pará', 'PA'),
('Paraíba', 'PB'),
('Paraná', 'PR'),
('Pernambuco', 'PE'),
('Piauí', 'PI'),
('Rio de Janeiro', 'RJ'),
('Rio Grande do Norte', 'RN'),
('Rio Grande do Sul', 'RS'),
('Rondônia', 'RO'),
('Roraima', 'RR'),
('Santa Catarina', 'SC'),
('São Paulo', 'SP'),
('Sergipe', 'SE'),
('Tocantins', 'TO');

INSERT INTO usuarios (email, senha) VALUES ('usuario@email.com', 'senha123');

INSERT INTO detalhe_usuario (id_usuario, nome, sobrenome, endereco, cidade, id_estado, cep, telefone)
VALUES (1, 'João', 'Silva', 'Rua das Flores, 123', 'São Paulo', 26, '01234567', '11 91234-5678');

INSERT INTO produtos (nome_produto, descricao, preco, estoque) VALUES
('Maçã', 'Fruta vermelha e doce', 5.50, 100),
('Banana', 'Fruta amarela e doce', 3.20, 150),
('Morango', 'Fruta vermelha e suculenta', 8.00, 80),
('Abacaxi', 'Fruta tropical e refrescante', 6.75, 70),
('Uva', 'Fruta pequena e saborosa', 10.90, 120);

INSERT INTO pedidos (id_usuario, status_pedido) VALUES (1, 'pendente');

INSERT INTO pedido_produtos (id_pedido, id_produto, quantidade, preco_unitario) VALUES
(1, 1, 2, 5.50),
(1, 2, 2, 3.20),
(1, 3, 2, 8.00),
(1, 4, 2, 6.75),
(1, 5, 2, 10.90);