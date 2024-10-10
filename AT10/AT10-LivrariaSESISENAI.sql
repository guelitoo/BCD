-- Criando um banco de dados
CREATE DATABASE db_livraria;

-- Usando um Banco Dados
USE db_livraria;

CREATE TABLE IF NOT EXISTS editora (
id_editora int PRIMARY KEY NOT NULL,
nome varchar(30) NOT NULL,
contato varchar(11) NOT NULL,
email varchar(45) NOT NULL
);

CREATE TABLE IF NOT EXISTS livro (
id_livro int PRIMARY KEY NOT NULL,
titulo varchar(45) NOT NULL,
categoria varchar(45) NOT NULL,
isbn varchar(13) NOT NULL,
ano date NOT NULL, 
valor decimal(10,2),
autor varchar(45) NOT NULL,
EDITORA_id_editora int,
FOREIGN KEY (EDITORA_id_editora) REFERENCES editora(id_editora)
);

CREATE TABLE estoque (
quantidade int NOT NULL,
LIVRO_id_livro int,
FOREIGN KEY (LIVRO_id_livro) REFERENCES livro(id_livro)
);

-- Criando Tabela Pepessoasssoas
CREATE TABLE IF NOT EXISTS cliente (
id_cliente int PRIMARY KEY NOT NULL,
nome varchar(30),
cpf varchar(11),
rg varchar(11),
email varchar(45),
telefone varchar(11) NOT NULL
);

CREATE TABLE IF NOT EXISTS cliente_endereco (
id_endereco int PRIMARY KEY NOT NULL,
rua varchar(45) NOT NULL,
numero int NOT NULL,
cidade varchar(45) NOT NULL,
estado varchar(45) NOT NULL,
CLIENTE_id_cliente int,
FOREIGN KEY (CLIENTE_id_cliente) REFERENCES cliente(id_cliente)
);

CREATE TABLE IF NOT EXISTS cliente_telefone (
id_telefone int PRIMARY KEY NOT NULL,
telefone varchar(15),
CLIENTE_id_cliente int,
FOREIGN KEY (CLIENTE_id_cliente) REFERENCES cliente(id_cliente)
);

CREATE TABLE IF NOT EXISTS pedido (
id_pedido int PRIMARY KEY NOT NULL,
valor decimal(10,2),
dia date,
CLIENTE_id_cliente int NOT NULL,
FOREIGN KEY (CLIENTE_id_cliente) REFERENCES cliente(id_cliente)
);

CREATE TABLE IF NOT EXISTS item_pedido (
quantidade int NOT NULL,
valor decimal(10,2) NOT NULL,
PEDIDO_id_cliente int NOT NULL,
LIVRO_id_livro int NOT NULL,
FOREIGN KEY (LIVRO_id_livro) REFERENCES livro(id_livro),
FOREIGN KEY (PEDIDO_id_cliente) REFERENCES pedido(id_pedido)
);

ALTER TABLE cliente_telefone
MODIFY COLUMN CLIENTE_id_cliente int NOT NULL;

ALTER TABLE livro
MODIFY COLUMN EDITORA_id_editora int NOT NULL;

ALTER TABLE estoque
MODIFY COLUMN LIVRO_id_livro int NOT NULL;