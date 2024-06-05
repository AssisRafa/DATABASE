
CREATE DATABASE ExemploDB;


USE ExemploDB;


CREATE TABLE Clientes (
    ClienteID INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(100) NOT NULL,
    Email VARCHAR(100)
);


CREATE TABLE Pedidos (
    PedidoID INT PRIMARY KEY AUTO_INCREMENT,
    ClienteID INT,
    Data DATE,
    Valor DECIMAL(10, 2),
    FOREIGN KEY (ClienteID) REFERENCES Clientes(ClienteID)
);


CREATE TABLE Produtos (
    ProdutoID INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(100) NOT NULL,
    Preco DECIMAL(10, 2)
);


CREATE TABLE ItensPedido (
    ItemID INT PRIMARY KEY AUTO_INCREMENT,
    PedidoID INT,
    ProdutoID INT,
    Quantidade INT,
    FOREIGN KEY (PedidoID) REFERENCES Pedidos(PedidoID),
    FOREIGN KEY (ProdutoID) REFERENCES Produtos(ProdutoID)
);


INSERT INTO Clientes (Nome, Email) VALUES
('João Silva', 'joao@example.com'),
('Maria Oliveira', 'maria@example.com'),
('Carlos Souza', 'carlos@example.com');


INSERT INTO Pedidos (ClienteID, Data, Valor) VALUES
(1, '2024-06-01', 150.75),
(2, '2024-06-02', 200.50),
(1, '2024-06-03', 300.25);


INSERT INTO Produtos (Nome, Preco) VALUES
('Produto A', 50.25),
('Produto B', 75.50),
('Produto C', 100.00);


INSERT INTO ItensPedido (PedidoID, ProdutoID, Quantidade) VALUES
(1, 1, 2),
(1, 2, 1),
(2, 3, 1),
(3, 1, 1),
(3, 3, 2);


SELECT Pedidos.PedidoID, Clientes.Nome, Clientes.Email, Pedidos.Data, Pedidos.Valor
FROM Pedidos
JOIN Clientes ON Pedidos.ClienteID = Clientes.ClienteID;


SELECT Pedidos.PedidoID, Produtos.Nome, ItensPedido.Quantidade
FROM ItensPedido
JOIN Pedidos ON ItensPedido.PedidoID = Pedidos.PedidoID
JOIN Produtos ON ItensPedido.ProdutoID = Produtos.ProdutoID;
