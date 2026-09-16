PRAGMA foreign_keys = ON;

CREATE TABLE Clientes (
    id_cliente INTEGER PRIMARY KEY,
    nome TEXT NOT NULL,
    email TEXT NOT NULL,
    telefone TEXT NOT NULL
);

CREATE TABLE Produtos (
    id_produto INTEGER PRIMARY KEY,
    nome_produto TEXT NOT NULL,
    preco REAL NOT NULL
);

CREATE TABLE Pedidos (
    id_pedido INTEGER PRIMARY KEY,
    id_cliente INTEGER NOT NULL,
    id_produto INTEGER NOT NULL,
    data_pedido TEXT NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente),
    FOREIGN KEY (id_produto) REFERENCES Produtos(id_produto)
);

CREATE TABLE Fornecedores (
    id_fornecedor INTEGER PRIMARY KEY,
    nome_fornecedor TEXT NOT NULL,
    telefone TEXT NOT NULL
);

INSERT INTO Clientes VALUES
(1,'Alice','alice@example.com','1191111-1111'),
(2,'Bob','bob@example.com','1192222-2222'),
(3,'Carlos','carlos@example.com','1193333-3333'),
(4,'Diana','diana@example.com','1194444-4444'),
(5,'Eva','eva@example.com','1195555-5555');

INSERT INTO Produtos VALUES
(1,'Produto A',100.00),
(2,'Produto B',150.00),
(3,'Produto C',200.00),
(4,'Produto D',250.00),
(5,'Produto E',300.00);

INSERT INTO Pedidos VALUES
(1,1,1,'2024-10-01'),
(2,2,3,'2024-10-02'),
(3,3,2,'2024-10-03'),
(4,4,5,'2024-10-04'),
(5,5,4,'2024-10-05');

INSERT INTO Fornecedores VALUES
(1,'Fornecedor X','113333-4444'),
(2,'Fornecedor Y','115555-6666'),
(3,'Fornecedor Z','117777-8888');

SELECT * FROM Pedidos;

CREATE TABLE Pedidos_backup AS
SELECT * FROM Pedidos;

SELECT * FROM Pedidos_backup;

DELETE FROM Pedidos;

SELECT * FROM Pedidos;

INSERT INTO Pedidos
SELECT * FROM Pedidos_backup;

SELECT * FROM Pedidos;

EXPLAIN QUERY PLAN
SELECT *
FROM Pedidos
WHERE id_cliente = 3;

CREATE INDEX idx_pedidos_cliente
ON Pedidos(id_cliente);

EXPLAIN QUERY PLAN
SELECT *
FROM Pedidos
WHERE id_cliente = 3;

CREATE VIEW Clientes_Publico AS
SELECT
    id_cliente,
    nome,
    substr(email, 1, 2) || '***@***' AS email_protegido,
    '***-****' AS telefone_protegido
FROM Clientes;

SELECT * FROM Clientes;

SELECT * FROM Clientes_Publico;

UPDATE Clientes
SET nome = 'Alice Atualizada'
WHERE id_cliente = 1;

SELECT * FROM Clientes
WHERE id_cliente = 1;

INSERT INTO Clientes VALUES(6,'Cliente Teste','teste@example.com','1190000-0000');

DELETE FROM Clientes
WHERE id_cliente = 6;

SELECT * FROM Clientes
WHERE id_cliente = 6;
