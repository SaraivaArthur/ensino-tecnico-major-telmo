DROP TABLE IF EXISTS produtos;

CREATE TABLE produtos (
    id_produto INT PRIMARY KEY AUTO_INCREMENT,
    nome_produto VARCHAR(100) NOT NULL,
    preco DECIMAL(10, 2) NOT NULL,
    estoque INT NOT NULL
);

INSERT INTO
    produtos (nome_produto, preco, estoque)
VALUES
    ('Notebook', 2500.00, 15),
    ('Smartphone', 1500.00, 30),
    ('Tablet', 800.00, 20),
    ('Fone de Ouvido', 200.00, 50),
    ('Mouse Gamer', 120.00, 40);

SELECT
    *
FROM
    produtos;

SELECT
    nome_produto,
    preco,
    estoque
FROM
    produtos
WHERE
    estoque < 25;

SELECT
    nome_produto,
    preco
FROM
    produtos
ORDER BY
    preco DESC;

SELECT
    CONCAT (nome_produto, ',', preco, ',', estoque) AS linha_csv
FROM
    produtos;

SELECT
    'nome_produto,preco,estoque' AS linha_csv
UNION ALL
SELECT
    CONCAT (nome_produto, ',', preco, ',', estoque) AS linha_csv
FROM
    produtos;

SELECT
    CONCAT (
        '<produto>',
        '<nome>',
        nome_produto,
        '</nome>',
        '<preco>',
        preco,
        '</preco>',
        '<estoque>',
        estoque,
        '</estoque>',
        '</produto>'
    ) AS xml_produto
FROM
    produtos;

SELECT
    nome_produto,
    preco
FROM
    produtos
WHERE
    preco > 500;

INSERT INTO
    produtos (nome_produto, preco, estoque)
VALUES
    ('Teclado Mecânico', 350.00, 25),
    ('Monitor LED', 900.00, 12);

SELECT
    *
FROM
    produtos;