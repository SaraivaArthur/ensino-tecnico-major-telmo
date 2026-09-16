CREATE TABLE produtos (
    id_produto INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100),
    categoria VARCHAR(100),
    preco DECIMAL(10,2)
);

-- Tabela de vendas
CREATE TABLE vendas (
    id_venda INT PRIMARY KEY AUTO_INCREMENT,
    id_produto INT,
    quantidade INT,
    data_venda DATE,
    FOREIGN KEY (id_produto) REFERENCES produtos(id_produto)
);

INSERT INTO produtos (nome, categoria, preco) VALUES
('Teclado', 'Periféricos', 150.00),
('Mouse', 'Periféricos', 80.00),
('Monitor', 'Hardware', 900.00),
('Notebook', 'Hardware', 3500.00);

INSERT INTO vendas (id_produto, quantidade, data_venda) VALUES
-- Fevereiro
(1, 2, '2026-02-10'),
(2, 3, '2026-02-12'),

-- Março
(1, 1, '2026-03-05'),
(2, 2, '2026-03-05'),
(3, 1, '2026-03-10'),
(4, 1, '2026-03-15'),
(2, 5, '2026-03-20'),

-- Abril
(1, 1, '2026-04-02'),
(2, 1, '2026-04-03'),
(3, 2, '2026-04-10');

SELECT * FROM produtos;
SELECT * FROM vendas;

-- Nesse select ocorre a aplicação do innerjoin, mostra o total de vendas dos últimos 3 meses
SELECT p.nome, SUM(v.quantidade) AS total
FROM produtos p
JOIN vendas v ON p.id_produto = v.id_produto
WHERE v.data_venda >= DATE_SUB(CURDATE(), INTERVAL 3 MONTH)
GROUP BY p.nome
ORDER BY total DESC
LIMIT 1;

-- Ocorre a soma total da categoria de produtos
SELECT p.categoria, SUM(v.quantidade * p.preco) AS total
FROM produtos p
JOIN vendas v ON p.id_produto = v.id_produto
WHERE v.data_venda BETWEEN '2026-03-01' AND '2026-03-31'
GROUP BY p.categoria;

-- Ele faz a média aritmética dos últimos 3 meses
SELECT AVG(quantidade)
FROM vendas
WHERE data_venda >= DATE_SUB(CURDATE(), INTERVAL 3 MONTH);

-- Mostra em ordem decrescente do mais caro ao mais barato
SELECT 
MAX(v.quantidade * p.preco) AS maior,
MIN(v.quantidade * p.preco) AS menor
FROM vendas v
JOIN produtos p ON p.id_produto = v.id_produto
WHERE v.data_venda >= DATE_SUB(CURDATE(), INTERVAL 3 MONTH);

-- Mostra em ordem decrescente a venda de categoria de produtos
SELECT p.categoria, SUM(v.quantidade) AS total
FROM produtos p
JOIN vendas v ON p.id_produto = v.id_produto
WHERE v.data_venda >= DATE_SUB(CURDATE(), INTERVAL 3 MONTH)
GROUP BY p.categoria
ORDER BY total DESC
LIMIT 1