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

INSERT INTO usuarios (id_usuario, email, senha) VALUES (1, 'joao@email.com', 'senha123');
INSERT INTO usuarios (id_usuario, email, senha) values (2, 'maria@email.com', 'senha123');
INSERT INTO usuarios (id_usuario, email, senha) values (3, 'jose@email.com', 'senha123');

INSERT INTO detalhe_usuario (id_usuario, nome, sobrenome, endereco, cidade, id_estado, cep, telefone)
VALUES (1, 'João', 'Silva', 'Rua das Flores, 123', 'São Paulo', 26, '01234567', '11 91234-5678');

INSERT INTO detalhe_usuario (id_usuario, nome, sobrenome, endereco, cidade, id_estado, cep, telefone)
VALUES (2, 'Maria', 'Silva', 'Rua das Flores, 123', 'São Paulo', 26, '01234567', '11 91234-5678');

INSERT INTO detalhe_usuario (id_usuario, nome, sobrenome, endereco, cidade, id_estado, cep, telefone)
VALUES (3, 'José', 'Silva', 'Rua das Flores, 123', 'São Paulo', 26, '01234567', '11 91234-5678');

INSERT INTO produtos (nome_produto, descricao, preco, estoque) VALUES
('Maçã', 'Fruta vermelha e doce', 5.50, 100),
('Banana', 'Fruta amarela e doce', 3.20, 150),
('Morango', 'Fruta vermelha e suculenta', 8.00, 80),
('Abacaxi', 'Fruta tropical e refrescante', 6.75, 70),
('Uva', 'Fruta pequena e saborosa', 10.90, 120),
('Laranja', 'Fruta cítrica e doce', 4.50, 100),
('Limão', 'Fruta cítrica e azeda', 3.00, 100),
('Pera', 'Fruta verde e doce', 5.00, 100),
('Melancia', 'Fruta grande e doce', 7.00, 100),
('Melão', 'Fruta grande e doce', 6.00, 100);

INSERT INTO produtos (nome_produto, descricao, preco, estoque) VALUES
('Smartwatch XYZ', 'Relógio inteligente com monitor de frequência cardíaca e notificações', 199.99, 30),
('Câmera DSLR 24MP', 'Câmera digital profissional com sensor de imagem de alta resolução', 899.99, 15),
('Tablet Samsung Galaxy Tab S7', 'Tablet Android com tela AMOLED de 11 polegadas e caneta S Pen', 649.99, 25),
('Impressora Laser HP', 'Impressora monocromática com velocidade de impressão rápida', 179.99, 20),
('Console de Videogame PS5', 'Console de última geração com suporte a jogos em 4K', 499.99, 10),
('Notebook Acer Aspire 5', 'Notebook com processador AMD Ryzen 5 e SSD de 256GB', 799.99, 18),
('Monitor Dell UltraSharp 27"', 'Monitor IPS com resolução QHD e design sem bordas', 399.99, 22),
('Caixa de Som Bluetooth JBL Charge 4', 'Caixa de som portátil à prova d''água com bateria de longa duração', 129.99, 40),
('Teclado Mecânico Corsair K95 RGB', 'Teclado mecânico premium com retroiluminação RGB personalizável', 169.99, 15),
('Mouse Logitech G Pro', 'Mouse para jogos com sensor HERO e design ambidestro', 59.99, 30),
('Forno Micro-ondas Panasonic', 'Micro-ondas com capacidade de 1.2 cu. ft. e funções programáveis', 129.99, 12),
('Câmera de Segurança Arlo Pro 4', 'Câmera de segurança sem fio com resolução 2K e visão noturna', 249.99, 18),
('Aspirador de Pó Dyson V11', 'Aspirador de pó sem fio com tecnologia de sucção avançada', 499.99, 15),
('Liquidificador Oster Pro 1200', 'Liquidificador com motor de alta potência e lâmina de aço inoxidável', 89.99, 25),
('Cadeira Gamer AKRacing', 'Cadeira ergonômica para jogos com suporte lombar e ajustes personalizados', 299.99, 8),
('Smart TV LG OLED 55"', 'Smart TV OLED 4K com inteligência artificial e sistema webOS', 1799.99, 10),
('Barbeador Elétrico Philips Norelco', 'Barbeador com lâminas de precisão e tecnologia de corte avançada', 79.99, 20),
('Ventilador de Torre Dyson TP04', 'Ventilador com purificador de ar e conectividade Wi-Fi', 399.99, 15),
('Panela de Pressão Instant Pot', 'Panela de pressão elétrica multifuncional com 10 programas', 129.99, 25),
('Auriculares Beats Studio Buds', 'Auriculares sem fios com cancelamento de ruído e áudio de alta qualidade', 149.99, 30);

INSERT INTO pedidos (id_usuario, status_pedido) VALUES (1, 'pendente');

INSERT INTO pedido_produtos (id_pedido, id_produto, quantidade, preco_unitario) VALUES
(1, 1, 2, 5.50),
(1, 2, 2, 3.20),
(1, 3, 2, 8.00),
(1, 4, 2, 6.75),
(1, 5, 2, 10.90);

SELECT * FROM usuarios
         WHERE id_usuario = 1;

UPDATE usuarios
SET
    email = 'joao@email.com.br',
    senha = 'senha1234'
WHERE id_usuario = 1;

UPDATE produtos
SET
    preco = 10.00
WHERE preco >= 1.00 AND preco <= 7.00;

DELETE FROM usuarios
WHERE id_usuario = 1;

SELECT * FROM produtos ORDER BY preco DESC;