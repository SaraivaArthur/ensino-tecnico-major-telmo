-- Criação da tabela clientes
CREATE TABLE clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL,
    cidade VARCHAR(50),
    data_nascimento DATE
);

-- Criação da tabela produtos
CREATE TABLE produtos (
    id_produto INT AUTO_INCREMENT PRIMARY KEY,
    nome_produto VARCHAR(100) NOT NULL,
    preco DECIMAL(10,2) NOT NULL,
    fabricante VARCHAR(50),
    estoque INT
);

-- Criação da tabela pedidos
CREATE TABLE pedidos (
    id_pedido INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT,
    data_pedido DATE,
    valor_total DECIMAL(10,2),
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
);

-- Inserindo clientes
INSERT INTO clientes (nome, email, cidade, data_nascimento)
VALUES
('Ana Lima', 'ana@email.com', 'Barueri', '2005-03-10'),
('Carlos Souza', 'carlos@email.com', 'Osasco', '2004-07-22');

-- Inserindo produtos
INSERT INTO produtos (nome_produto, preco, fabricante, estoque)
VALUES
('Mouse Óptico', 49.90, 'TechMouse', 30),
('Teclado USB', 79.90, 'KeyTech', 20);

-- Inserindo pedidos
INSERT INTO pedidos (id_cliente, data_pedido, valor_total)
VALUES
(1, '2026-05-20', 129.80),
(2, '2026-05-21', 79.90);

-- Tarefa 1: adicionar telefone_secundario
ALTER TABLE clientes
ADD COLUMN telefone_secundario VARCHAR(15);

-- Tarefa 2: remover fabricante
ALTER TABLE produtos
DROP COLUMN fabricante;

-- Tarefa 3: alterar data_pedido para DATETIME
ALTER TABLE pedidos
MODIFY COLUMN data_pedido DATETIME;

-- Tarefa 4: adicionar peso e dimensao
ALTER TABLE produtos
ADD COLUMN peso DECIMAL(5,2),
ADD COLUMN dimensao VARCHAR(50);

-- Tarefa 5: aumentar tamanho do nome
ALTER TABLE clientes
MODIFY COLUMN nome VARCHAR(100);

-- Tarefa 6: criar índice para nome do produto
CREATE INDEX idx_nome_produto
ON produtos(nome_produto);

-- Tarefa 7: verificar estrutura das tabelas
DESCRIBE clientes;
DESCRIBE produtos;
DESCRIBE pedidos;

-- Conferir os dados cadastrados
SELECT * FROM clientes;
SELECT * FROM produtos;
SELECT * FROM pedidos;
