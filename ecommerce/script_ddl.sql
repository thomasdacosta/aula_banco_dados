DROP DATABASE IF EXISTS ecommerce;

DROP TABLE IF EXISTS pedido_produtos;
DROP TABLE IF EXISTS pedidos;
DROP TABLE IF EXISTS produtos;
DROP TABLE IF EXISTS detalhe_usuario;
DROP TABLE IF EXISTS usuarios;
DROP TABLE IF EXISTS estado;

CREATE DATABASE ecommerce;

CREATE TABLE estado (
    id_estado INT PRIMARY KEY AUTO_INCREMENT,
    nome_estado VARCHAR(50) NOT NULL,
    sigla_estado VARCHAR(2) NOT NULL
);

CREATE TABLE usuarios (
    id_usuario INT PRIMARY KEY AUTO_INCREMENT,
    email VARCHAR(150) NOT NULL,
    senha VARCHAR(255) NOT NULL,
    data_cadastro TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT uq_email_usuarios UNIQUE (email),
    CONSTRAINT check_email_formato
        CHECK (email REGEXP '^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}$')
);

CREATE TABLE detalhe_usuario (
    id_detalhe_usuario INT PRIMARY KEY AUTO_INCREMENT,
    id_usuario INT NOT NULL,
    nome VARCHAR(100) NOT NULL,
    sobrenome VARCHAR(100) NOT NULL,
    endereco VARCHAR(255) NOT NULL,
    cidade VARCHAR(100) NOT NULL,
    id_estado INT NOT NULL,
    cep VARCHAR(8) NOT NULL,
    telefone VARCHAR(20) NOT NULL,
    CONSTRAINT check_cep_formato  CHECK (cep REGEXP '^[0-9]{8}$'),
    CONSTRAINT check_telefone_formato CHECK (telefone REGEXP '^[0-9]{2} [0-9]{5}-[0-9]{4}$'),
    CONSTRAINT fk_detalhe_usuario_usuarios FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario),
    CONSTRAINT fk_detalhe_usuario_estado FOREIGN KEY (id_estado) REFERENCES estado(id_estado)
);

CREATE TABLE produtos (
    id_produto INT PRIMARY KEY AUTO_INCREMENT,
    nome_produto VARCHAR(200) NOT NULL,
    descricao TEXT NOT NULL,
    preco DECIMAL(10, 2) NOT NULL,
    estoque INT NOT NULL DEFAULT 0,
    data_cadastro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE pedidos (
    id_pedido INT PRIMARY KEY AUTO_INCREMENT,
    id_usuario INT NOT NULL,
    data_pedido TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    status_pedido ENUM('pendente', 'processando', 'enviado', 'entregue') DEFAULT 'pendente',
    CONSTRAINT fk_pedidos_usuario FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario)
);

CREATE TABLE pedido_produtos (
    id_pedido INT NOT NULL,
    id_produto INT NOT NULL,
    quantidade INT NOT NULL,
    preco_unitario DECIMAL(10, 2) NOT NULL,
    CONSTRAINT check_quantidade CHECK (quantidade > 0),
    CONSTRAINT pk_pedido_produtos PRIMARY KEY (id_pedido, id_produto),
    CONSTRAINT fk_pedidos_produtos_pedidos FOREIGN KEY (id_pedido) REFERENCES pedidos(id_pedido),
    CONSTRAINT fk_pedidos_produtos_produtos FOREIGN KEY (id_produto) REFERENCES produtos(id_produto)
);
