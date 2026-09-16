DROP TABLE IF EXISTS produtos;

CREATE TABLE produtos (
    id_produto INT PRIMARY KEY AUTO_INCREMENT,
    nome_produto VARCHAR(100) NOT NULL,
    preco DECIMAL(10,2) NOT NULL,
    estoque INT NOT NULL
);

INSERT INTO produtos (nome_produto, preco, estoque) VALUES
('Notebook', 2500.00, 15),
('Smartphone', 1500.00, 30),
('Tablet', 800.00, 20),
('Fone de Ouvido', 200.00, 50),
('Mouse Gamer', 120.00, 40);

-- Exibir todos os produtos
SELECT * FROM produtos;

-- Produtos com estoque menor que 25
SELECT nome_produto, preco, estoque
FROM produtos
WHERE estoque < 25;

-- Produtos ordenados do maior para o menor preço
SELECT nome_produto, preco
FROM produtos
ORDER BY preco DESC;

-- Simulação de exportação CSV
SELECT
    CONCAT(nome_produto, ',', preco, ',', estoque) AS linha_csv
FROM produtos;

-- Simulação de exportação CSV com cabeçalho
SELECT 'nome_produto,preco,estoque' AS linha_csv
UNION ALL
SELECT
    CONCAT(nome_produto, ',', preco, ',', estoque)
FROM produtos;

-- Simulação de exportação XML
SELECT
    CONCAT(
        '<produto>',
        '<nome>', nome_produto, '</nome>',
        '<preco>', preco, '</preco>',
        '<estoque>', estoque, '</estoque>',
        '</produto>'
    ) AS xml_produto
FROM produtos;

-- Produtos com preço acima de 500
SELECT nome_produto, preco
FROM produtos
WHERE preco > 500;

-- Inserir novos produtos
INSERT INTO produtos (nome_produto, preco, estoque) VALUES
('Teclado Mecânico', 350.00, 25),
('Monitor LED', 900.00, 12);

-- Exibir tabela atualizada
SELECT * FROM produtos;