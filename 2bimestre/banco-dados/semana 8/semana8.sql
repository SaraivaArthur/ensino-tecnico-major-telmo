CREATE TABLE vendas (
    id_venda INT PRIMARY KEY AUTO_INCREMENT, 
    produto VARCHAR(100),                 
    quantidade INT,                         
    valor_unitario DECIMAL(10,2),          
    data_venda DATE                         
);

INSERT INTO vendas (produto, quantidade, valor_unitario, data_venda) VALUES
('Teclado', 2, 150.00, '2026-03-05'), 
('Mouse', 3, 80.00, '2026-03-05'),    
('Monitor', 1, 900.00, '2026-03-06'), 
('Teclado', 1, 150.00, '2026-03-10'),
('Mouse', 2, 80.00, '2026-03-10'),
('Notebook', 1, 3500.00, '2026-03-15'),
('Monitor', 2, 900.00, '2026-03-20'),
('Mouse', 5, 80.00, '2026-03-20'),
('Teclado', 1, 150.00, '2026-04-02'),
('Mouse', 1, 80.00, '2026-04-03'),
('Monitor', 1, 900.00, '2026-04-10');

SELECT * FROM vendas;

-- Quantidade de vendas em março
SELECT COUNT(*) 
FROM vendas
WHERE data_venda BETWEEN '2026-03-01' AND '2026-03-31';

-- O SUM realiza multiplicação do valor_unitario e quantidade
SELECT produto, 
       SUM(quantidade * valor_unitario) AS valor_total 
FROM vendas
GROUP BY produto;

-- Esse select retorna o produto mais vendido
SELECT produto, 
       SUM(quantidade) AS total
FROM vendas
GROUP BY produto
ORDER BY total DESC 
LIMIT 1;

-- Esse método realiza a média aritmética do mês de março
SELECT AVG(total_dia)
FROM (
    SELECT SUM(quantidade * valor_unitario) AS total_dia 
    FROM vendas
    WHERE data_venda BETWEEN '2026-03-01' AND '2026-03-31'
    GROUP BY data_venda 
) t;