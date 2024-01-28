DROP DATABASE IF EXISTS bd_filmes;

CREATE DATABASE IF NOT EXISTS bd_filmes;

USE bd_filmes;

CREATE TABLE filmes (
    id_filme INT NOT NULL,
    dsc_filme VARCHAR(255) NULL,
    qtd_votos INT NULL,
    num_nota_media INT NULL,
    num_popularidade INT NULL,
    dsc_link_foto VARCHAR(255) NULL,
    dsc_sinopse TEXT NULL,
    dat_lancamento DATETIME NULL,
    PRIMARY KEY (id_filme)
);

CREATE TABLE generos (
    id_genero INT NOT NULL,
    dsc_genero VARCHAR(255) NULL,
    PRIMARY KEY (id_genero)
);

CREATE TABLE filmes_genero (
    id_filme INT NULL,
    id_genero INT NULL,
    FOREIGN KEY (id_filme) REFERENCES filmes(id_filme),
    FOREIGN KEY (id_genero) REFERENCES generos(id_genero)
);