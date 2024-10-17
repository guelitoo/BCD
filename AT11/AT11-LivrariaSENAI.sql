DROP DATABASE db_livraria;

-- Criando um banco de dados
CREATE DATABASE db_livraria;

-- Usando um Banco Dados
USE db_livraria;

CREATE TABLE IF NOT EXISTS editora (
id_editora int PRIMARY KEY NOT NULL AUTO_INCREMENT,
nome varchar(30) NOT NULL,
contato varchar(11) NOT NULL,
email varchar(45) NOT NULL
);

CREATE TABLE IF NOT EXISTS livro (
id_livro int PRIMARY KEY NOT NULL AUTO_INCREMENT,
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
id_cliente int PRIMARY KEY NOT NULL AUTO_INCREMENT,
nome varchar(30),
cpf varchar(14),
rg varchar(14),
email varchar(45),
telefone varchar(11) NOT NULL
);

CREATE TABLE IF NOT EXISTS cliente_endereco (
id_endereco int PRIMARY KEY NOT NULL AUTO_INCREMENT,
rua varchar(45) NOT NULL,
numero int NOT NULL,
cidade varchar(45) NOT NULL,
estado varchar(45) NOT NULL,
CLIENTE_id_cliente int,
FOREIGN KEY (CLIENTE_id_cliente) REFERENCES cliente(id_cliente)
);

CREATE TABLE IF NOT EXISTS cliente_telefone (
id_telefone int PRIMARY KEY NOT NULL AUTO_INCREMENT,
telefone varchar(15),
CLIENTE_id_cliente int,
FOREIGN KEY (CLIENTE_id_cliente) REFERENCES cliente(id_cliente)
);

CREATE TABLE IF NOT EXISTS pedido (
id_pedido int PRIMARY KEY NOT NULL AUTO_INCREMENT,
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

DESC cliente;

ALTER TABLE cliente_endereco
MODIFY COLUMN CLIENTE_id_cliente int NOT NULL;

ALTER TABLE cliente
DROP COLUMN telefone;

ALTER TABLE clie
MODIFY COLUMN id_cliente int AUTO_INCREMENT NOT NULL;

DESC cliente_endereco;

SELECT * FROM cliente;

INSERT INTO cliente (nome, cpf, rg, email) VALUES
('Miguel', '44559988112', '224218190', 'miguel@gmail.com'),
('Isabele', '99232994062', '235973580', 'isabele@gmail.com'),
('Márcio', '2614396260', '165772773', 'marcio@gmail.com'),
('Sergio', '65240635897', '425004302', 'sergio@gmail.com'),
('Algemira', '53483288805', '48443746X', 'algemira@gmail.com'),
('Elielson', '93775199853', '276815610', 'elielson@gmail.com'),
('Theo', '37007816878', '236134620', 'theo@gmail.com'),
('Heládio', '624551508-44', '43702121X', 'heladio@gamil.com'),
('Nelmo', '57211665840', '486408607', 'nelmo@gmail.com'),
('Oseias', '42163080820', '395157936', 'oseias@gmail.com');

SELECT * FROM cliente_endereco;

ALTER TABLE cliente_endereco ADD COLUMN bairro VARCHAR(45) NOT NULL AFTER rua;

ALTER TABLE cliente_endereco DROP COLUMN bairro;




INSERT INTO cliente_endereco (rua, bairro, numero, cidade, estado) VALUES
('Rua Maestro Furio Franceschini', 'Cidade Continental', 23, 'São Paulo', 'SP'),
('Rua Doutor Raul David do Valle', 'Jardim Morada do Sol', 35, 'Indaiatuba', 'SP'),
('Rua Euclides Gonçalves de Oliveira', 'Jardim São Bento', 2, 'Jundiaí', 'SP'),
('Estrada Municipal Shohei Inui', 'Vila Moraes', 51, 'Mogi das Cruzes', 'SP');




