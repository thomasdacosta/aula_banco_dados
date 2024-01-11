DROP DATABASE aula_banco_dados;

/*
 Slide 7
 */
CREATE DATABASE aula_banco_dados;

/*
 Slide 8
 */
CREATE TABLE usuarios (
  id INT PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(100) NOT NULL,
  email VARCHAR(100) UNIQUE,
  data_nascimento DATE
);

DROP TABLE usuarios;

/*
 Slide 11
 */
CREATE TABLE usuarios (
  id INT PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(100) NOT NULL,
  email VARCHAR(100) UNIQUE,
  data_nascimento DATE DEFAULT (CURRENT_DATE),
  CONSTRAINT check_email_format
      CHECK (email REGEXP '^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}$')
);

/*
 Slide 12
 */
CREATE TABLE pedidos (
    id INT PRIMARY KEY AUTO_INCREMENT,
    descricao VARCHAR(255) NOT NULL,
    valor DECIMAL(10, 2) NOT NULL,
    data_pedido DATE,
    usuario_id INT,
    CONSTRAINT fk_pedidos_usuario FOREIGN KEY (usuario_id) REFERENCES usuarios(id)
);

/*
 Slide 17
 */
ALTER TABLE usuarios ADD sobrenome VARCHAR(100);

/*
 Slide 18
 */
ALTER TABLE usuarios MODIFY nome VARCHAR(150);

/*
 Slide 19
 */
ALTER TABLE usuarios DROP COLUMN sobrenome;

/*
 Slide 20
 */
DROP TABLE usuarios;

/*
 Slide 22
 */
CREATE INDEX idx_email ON usuarios(email);

/*
 Slide 23
 */
CREATE UNIQUE INDEX idx_email_unique ON usuarios(email);

/*
 Slide 28
 */
ALTER TABLE pedidos
    DROP FOREIGN KEY fk_pedidos_usuario;

/*
 Slide 24
 */
ALTER TABLE usuarios ADD CONSTRAINT pk_usuarios PRIMARY KEY (id);

/*
 Slide 25
 */
ALTER TABLE pedidos
    ADD CONSTRAINT fk_pedidos_usuario
        FOREIGN KEY (usuario_id) REFERENCES usuarios(id);

/*
 Slide 26
 */
ALTER TABLE usuarios
    MODIFY nome VARCHAR(100) NOT NULL;

/*
 Slide 27
 */
ALTER TABLE usuarios
    ADD CONSTRAINT unique_email UNIQUE (email);

/*
 Resposta do exercicio do slide 29
 */
CREATE TABLE produtos (
    cod_prod INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome TEXT NOT NULL,
    preco DECIMAL(10, 2) NOT NULL
);
