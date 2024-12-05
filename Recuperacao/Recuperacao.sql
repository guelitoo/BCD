DROP DATABASE db_reobote;

CREATE DATABASE db_reobote;

USE db_reobote;

CREATE TABLE Cliente (
    id_cliente INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    cpf VARCHAR(11) UNIQUE NOT NULL,
    rua VARCHAR(100) NOT NULL,
    cidade VARCHAR(50) NOT NULL,
    bairro VARCHAR(50) NOT NULL,
    numero INT NOT NULL
);
CREATE TABLE Pedido (
    id_pedido INT PRIMARY KEY AUTO_INCREMENT,
    CLIENTE_id_cliente INT,
    data_pedido DATE NOT NULL,
    FOREIGN KEY (CLIENTE_id_cliente) REFERENCES Cliente(id_cliente)
);
CREATE TABLE Produto (
    id_produto INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    preco DECIMAL(10,2) NOT NULL
);
CREATE TABLE PedidoProduto (
    id_pedido INT PRIMARY KEY AUTO_INCREMENT,
    PRODUTO_id_produto INT,
    quantidade INT NOT NULL,
	nome VARCHAR(100) NOT NULL,
    preco DECIMAL(10,2) NOT NULL,
    data_pedido DATE NOT NULL,
    FOREIGN KEY (PRODUTO_id_produto) REFERENCES Produto(id_produto)
);

INSERT INTO Cliente (nome, email, cpf, rua, cidade, bairro, numero) VALUES
('João Silva', 'joao@email.com', '44455599911', 'Rua Juan Pablo Benitez', 'Foz do Iguaçu','Vila Residencial Andradina', 20),
('Maria Souza', 'maria@email.com', '88857589222', 'Rua Vinte e Três', 'Imperatriz', 'Santa Luzia', 34),
('Milena', 'milena@gmail.com', '99955585585', 'Rua João Lins Cedrim', 'Maceió', 'Trapiche da Barra', 25),
('Ana Maria', 'ana@gmail.com', '33366688875', 'Rua RBN 3', 'Goiânia', 'Residencial Beatriz Nascimento', 98),
('Mateus Alves', 'mateus@gmail.com', '44466611152', 'Rua C 13', 'Serra', 'Conjunto Carapina I', 87),
('Roberto Nogueria', 'roberto@gmail.com', '22266677799', '2ª Travessa Padre Cícero', 'Maceió', 'Ouro Preto', 55),
('Nathalia Pinheiro', 'nath@gmeil.com', '11199976835', 'Travessa Atlântica', 'Caucaia', 'Tabapuá Brasília II', 383),
('Thiago Gazola', 'th13@gmai.com', '22299974582', 'Rua Santa Terezinha', 'Santarém', 'São Cristóvão', 543),
('Murilo Silva', 'mh345@gmail.com', '66699922258', 'Rua Doutor Equililerico Nogueira', 'Parnaíba', 'Planalto de Monteserra The', 123),
('Leandro Rosa', 'rosa@gmail.com', '55584896752', 'Rua Luís Ribeiro', 'Fortaleza', 'Mucuripe', 465);

INSERT INTO PedidoProduto (quantidade, nome, preco, data_pedido) VALUES
(2, 'Eixo', 250),
(1, 'Camisa', 200),
(4, 'Cilindro', 300),
(7, 'Usinagem com Fresa', 150),
(2, 'Usinagem em eixo', 200),
(4, 'Desbastar com lixa', 50),
(10, 'Retifica', 100),
(8, 'Rolo grafico', 200)
;

ALTER TABLE Cliente ADD telefone VARCHAR(15);

UPDATE Cliente SET Nome = 'João Santos' WHERE id_cliente = 1;

SELECT Cliente.nome, Pedido.data_pedido
FROM Cliente
JOIN Pedido ON Cliente.id_cliente = Pedido.CLIENTE_id_cliente;

CREATE VIEW vw_detalhes_pedido AS
SELECT Pedido.id_pedido, Cliente.nome AS Cliente, Produto.nome AS Produto, PedidoProduto.quantidade
FROM Pedido
JOIN Cliente ON Pedido.id_cliente = Cliente.id_cliente
JOIN PedidoProduto ON Pedido.id_pedido = PedidoProduto.id_pedido
JOIN Produto ON PedidoProduto.id_produto = Produto.id_produto;