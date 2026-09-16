DROP TABLE IF EXISTS transacao_item_novo;
DROP TABLE IF EXISTS itens_novo;
DROP TABLE IF EXISTS transacoes_novo;
DROP TABLE IF EXISTS usuarios_novo;

DROP TABLE IF EXISTS pedido_produto_antigo;
DROP TABLE IF EXISTS produtos_antigo;
DROP TABLE IF EXISTS pedidos_antigo;
DROP TABLE IF EXISTS clientes_antigo;

CREATE TABLE clientes_antigo (
    id_cliente INTEGER PRIMARY KEY,
    nome TEXT,
    email TEXT,
    telefone TEXT
);

CREATE TABLE pedidos_antigo (
    id_pedido INTEGER PRIMARY KEY,
    id_cliente INTEGER,
    data_pedido TEXT,
    total REAL
);

CREATE TABLE produtos_antigo (
    id_produto INTEGER PRIMARY KEY,
    nome TEXT,
    preco REAL
);

CREATE TABLE pedido_produto_antigo (
    id INTEGER PRIMARY KEY,
    id_pedido INTEGER,
    id_produto INTEGER,
    quantidade INTEGER
);

INSERT INTO clientes_antigo VALUES
(1, 'Ana Silva', 'ana.silva@email.com', '123456789'),
(2, 'Carlos Oliveira', 'carlos.oliveira@email.com', '987654321'),
(3, 'Mariana Costa', 'mariana.costa@email.com', '456123789');

INSERT INTO pedidos_antigo VALUES
(1, 1, '2024-11-01', 150.75),
(2, 2, '2024-11-02', 200.50),
(3, 3, '2024-11-03', 99.99);

INSERT INTO produtos_antigo VALUES
(1, 'Camiseta', 25.00),
(2, 'Calca', 80.00),
(3, 'Tenis', 45.75);

INSERT INTO pedido_produto_antigo VALUES
(1, 1, 1, 2),
(2, 1, 3, 1),
(3, 2, 2, 1),
(4, 3, 1, 1),
(5, 3, 2, 1);

CREATE TABLE usuarios_novo (
    id_usuario INTEGER PRIMARY KEY,
    nome_completo TEXT,
    email TEXT,
    contato TEXT
);

CREATE TABLE transacoes_novo (
    id_transacao INTEGER PRIMARY KEY,
    id_usuario INTEGER,
    data_transacao TEXT,
    valor_total REAL
);

CREATE TABLE itens_novo (
    id_item INTEGER PRIMARY KEY,
    nome_item TEXT,
    preco REAL
);

CREATE TABLE transacao_item_novo (
    id_transacao_item INTEGER PRIMARY KEY,
    id_transacao INTEGER,
    id_item INTEGER,
    quantidade INTEGER
);

INSERT INTO usuarios_novo
SELECT id_cliente, nome, email, telefone
FROM clientes_antigo;

INSERT INTO transacoes_novo
SELECT id_pedido, id_cliente, data_pedido, total
FROM pedidos_antigo;

INSERT INTO itens_novo
SELECT id_produto, nome, preco
FROM produtos_antigo;

INSERT INTO transacao_item_novo
SELECT id, id_pedido, id_produto, quantidade
FROM pedido_produto_antigo;

SELECT * FROM usuarios_novo;
SELECT * FROM transacoes_novo;
SELECT * FROM itens_novo;
SELECT * FROM transacao_item_novo;

DROP TABLE IF EXISTS vendas;

CREATE TABLE vendas (
    id_venda INTEGER PRIMARY KEY,
    id_produto INTEGER,
    id_cliente INTEGER,
    data_venda TEXT,
    quantidade INTEGER,
    valor_total REAL
);

INSERT INTO vendas VALUES
(1, 101, 201, '2023-06-15', 2, 100.00),
(2, 102, 202, '2023-06-17', 1, 75.00),
(3, 103, 203, '2023-07-20', 3, 300.00),
(4, 104, 201, '2024-01-25', 1, 150.00),
(5, 101, 202, '2024-02-10', 4, 200.00),
(6, 101, 203, '2024-08-05', 1, 50.00);

EXPLAIN QUERY PLAN
SELECT * FROM vendas
WHERE id_produto = 101
AND data_venda BETWEEN '2024-01-01' AND '2024-12-31';

CREATE INDEX idx_produto_data
ON vendas (id_produto, data_venda);

EXPLAIN QUERY PLAN
SELECT * FROM vendas
WHERE id_produto = 101
AND data_venda BETWEEN '2024-01-01' AND '2024-12-31';

SELECT * FROM vendas
WHERE id_produto = 101
AND data_venda BETWEEN '2024-01-01' AND '2024-12-31';

DROP VIEW IF EXISTS vendas_2024;

CREATE VIEW vendas_2024 AS
SELECT * FROM vendas
WHERE data_venda BETWEEN '2024-01-01' AND '2024-12-31';

SELECT * FROM vendas_2024;