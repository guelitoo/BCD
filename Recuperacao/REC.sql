CREATE TABLE Cliente (
    ClienteID INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL
);
CREATE TABLE Pedido (
    PedidoID INT PRIMARY KEY AUTO_INCREMENT,
    ClienteID INT,
    DataPedido DATE NOT NULL,
    FOREIGN KEY (ClienteID) REFERENCES Cliente(ClienteID)
);
CREATE TABLE Produto (
    ProdutoID INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(100) NOT NULL,
    Preco DECIMAL(10,2) NOT NULL
);
CREATE TABLE PedidoProduto (
    PedidoID INT,
    ProdutoID INT,
    Quantidade INT NOT NULL,
    PRIMARY KEY (PedidoID, ProdutoID),
    FOREIGN KEY (PedidoID) REFERENCES Pedido(PedidoID),
    FOREIGN KEY (ProdutoID) REFERENCES Produto(ProdutoID)
);

INSERT INTO Cliente (Nome, Email) VALUES
('João Silva', 'joao@email.com'),
('Maria Souza', 'maria@email.com');

ALTER TABLE Cliente ADD Telefone VARCHAR(15);

UPDATE Cliente SET Nome = 'João Santos' WHERE ClienteID = 1;

SELECT Cliente.Nome, Pedido.DataPedido
FROM Cliente
JOIN Pedido ON Cliente.ClienteID = Pedido.ClienteID;

CREATE VIEW DetalhesPedido AS
SELECT Pedido.PedidoID, Cliente.Nome AS Cliente, Produto.Nome AS Produto, PedidoProduto.Quantidade
FROM Pedido
JOIN Cliente ON Pedido.ClienteID = Cliente.ClienteID
JOIN PedidoProduto ON Pedido.PedidoID = PedidoProduto.PedidoID
JOIN Produto ON PedidoProduto.ProdutoID = Produto.ProdutoID;


