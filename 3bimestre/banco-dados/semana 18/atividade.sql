PRAGMA foreign_keys = ON;

DROP TABLE IF EXISTS vendas;
DROP TABLE IF EXISTS clientes;
DROP TABLE IF EXISTS fornecedores;
DROP TABLE IF EXISTS produtos;
DROP TABLE IF EXISTS funcionarios;

CREATE TABLE vendas (
    id_venda INTEGER PRIMARY KEY,
    data_venda TEXT NOT NULL,
    produto TEXT NOT NULL,
    vendedor TEXT NOT NULL,
    cliente TEXT NOT NULL,
    regiao TEXT NOT NULL,
    quantidade INTEGER NOT NULL,
    valor_total REAL NOT NULL
);

INSERT INTO vendas VALUES
(1,'2024-10-01','Laptop','Carlos','Ana Souza','Sul',2,3000.00),
(2,'2024-10-05','Smartphone','Ana','Bruno Lima','Sul',1,1500.00),
(3,'2024-10-06','Tablet','Carlos','Carla Dias','Norte',3,1800.00),
(4,'2024-10-07','Monitor','Bruno','Diego Alves','Norte',4,1200.00),
(5,'2024-10-08','Laptop','Ana','Eva Martins','Sul',1,1500.00),
(6,'2024-10-09','Smartphone','Bruno','Felipe Rocha','Norte',2,3000.00),
(7,'2024-10-10','Monitor','Carlos','Gabriela Nunes','Sul',1,600.00),
(8,'2024-10-12','Tablet','Ana','Helena Costa','Norte',5,3000.00),
(9,'2024-10-13','Smartphone','Carlos','Igor Melo','Sul',2,3000.00),
(10,'2024-10-15','Laptop','Bruno','Joana Reis','Norte',2,4000.00);

SELECT * FROM vendas;

SELECT
    id_venda,
    data_venda,
    produto,
    vendedor,
    ROW_NUMBER() OVER (
        ORDER BY data_venda DESC
    ) AS numero_venda
FROM vendas;

SELECT
    id_venda,
    vendedor,
    valor_total,
    ROW_NUMBER() OVER (
        PARTITION BY vendedor
        ORDER BY valor_total DESC
    ) AS posicao
FROM vendas
ORDER BY vendedor, posicao;

WITH total_vendas AS (
    SELECT
        vendedor,
        SUM(valor_total) AS total
    FROM vendas
    GROUP BY vendedor
)
SELECT
    vendedor,
    total
FROM total_vendas
ORDER BY total DESC;

CREATE TABLE clientes (
    nome TEXT,
    email TEXT
);

INSERT INTO clientes VALUES
('Ana Souza','ana@email.com'),
('Bruno Lima','bruno@email.com'),
('Carla Dias','carla@email.com');

CREATE TABLE fornecedores (
    nome TEXT,
    email TEXT
);

INSERT INTO fornecedores VALUES
('Carla Dias','carla@email.com'),
('Delta Tech','contato@delta.com'),
('Ana Souza','ana@email.com');

SELECT nome
FROM clientes
UNION
SELECT nome
FROM fornecedores
ORDER BY nome;

SELECT nome
FROM clientes
UNION ALL
SELECT nome
FROM fornecedores
ORDER BY nome;

SELECT
    cliente,
    valor_total,
    CASE
        WHEN valor_total > 1000 THEN 'Alta'
        WHEN valor_total BETWEEN 500 AND 1000 THEN 'Media'
        ELSE 'Baixa'
    END AS categoria_venda
FROM vendas
ORDER BY id_venda;

WITH total_vendedores AS (
    SELECT
        vendedor,
        SUM(valor_total) AS total_vendas
    FROM vendas
    GROUP BY vendedor
)
SELECT
    vendedor,
    total_vendas,
    CASE
        WHEN total_vendas > 10000 THEN 'Excelente'
        WHEN total_vendas BETWEEN 5000 AND 10000 THEN 'Bom'
        ELSE 'Regular'
    END AS desempenho
FROM total_vendedores
ORDER BY total_vendas DESC;

CREATE TABLE produtos (
    id_produto INTEGER PRIMARY KEY,
    nome_produto TEXT NOT NULL,
    preco REAL NOT NULL
);

INSERT INTO produtos VALUES
(1,'Mouse',45.00),
(2,'Teclado',80.00),
(3,'Headset',120.00),
(4,'Monitor',900.00);

SELECT
    nome_produto,
    preco,
    CASE
        WHEN preco > 100 THEN 'Caro'
        WHEN preco BETWEEN 50 AND 100 THEN 'Moderado'
        ELSE 'Barato'
    END AS categoria_preco
FROM produtos
ORDER BY preco;

CREATE TABLE funcionarios (
    id_funcionario INTEGER PRIMARY KEY,
    nome TEXT NOT NULL,
    id_supervisor INTEGER
);

INSERT INTO funcionarios VALUES
(1,'Carlos',NULL),
(2,'Maria',1),
(3,'Joao',1),
(4,'Ana',2),
(5,'Pedro',3);

WITH RECURSIVE hierarquia AS (
    SELECT
        id_funcionario,
        nome,
        id_supervisor,
        1 AS nivel
    FROM funcionarios
    WHERE id_supervisor IS NULL

    UNION ALL

    SELECT
        f.id_funcionario,
        f.nome,
        f.id_supervisor,
        h.nivel + 1
    FROM funcionarios f
    INNER JOIN hierarquia h
        ON f.id_supervisor = h.id_funcionario
)
SELECT *
FROM hierarquia
ORDER BY nivel, id_funcionario;