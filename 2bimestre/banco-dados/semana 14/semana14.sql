CREATE TABLE Cliente (
    id_cliente INTEGER PRIMARY KEY,
    nome TEXT NOT NULL,
    email TEXT
);

CREATE TABLE Produto (
    id_produto INTEGER PRIMARY KEY,
    nome TEXT NOT NULL,
    preco REAL NOT NULL
);

CREATE TABLE Pedido (
    id_pedido INTEGER PRIMARY KEY,
    id_cliente INTEGER,
    data_pedido TEXT,
    FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente)
);

INSERT INTO Cliente
VALUES (1, 'Arthur', 'arthur@email.com');

INSERT INTO Cliente
VALUES (2, 'Maria', 'maria@email.com');

INSERT INTO Produto
VALUES (1, 'Camiseta', 50.00);

INSERT INTO Produto
VALUES (2, 'Calça Jeans', 120.00);

INSERT INTO Pedido
VALUES (1, 1, '2026-06-10');

INSERT INTO Pedido
VALUES (2, 2, '2026-06-11');

SELECT * FROM Cliente;

SELECT * FROM Produto;

SELECT
    Pedido.id_pedido,
    Cliente.nome,
    Pedido.data_pedido
FROM Pedido
JOIN Cliente
    ON Pedido.id_cliente = Cliente.id_cliente;

