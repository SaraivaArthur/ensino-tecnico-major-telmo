DROP TABLE IF EXISTS clientes_online;
DROP TABLE IF EXISTS clientes_fisicos;

CREATE TABLE clientes_online (
    id_cliente INT,
    nome VARCHAR(100),
    email VARCHAR(100)
);

CREATE TABLE clientes_fisicos (
    id_cliente INT,
    nome VARCHAR(100),
    email VARCHAR(100)
);

INSERT INTO clientes_online VALUES
(1, 'Ana', 'ana@email.com'),
(2, 'Carlos', 'carlos@email.com'),
(3, 'Bia', 'bia@email.com');

INSERT INTO clientes_fisicos VALUES
(2, 'Carlos', 'carlos@email.com'),
(3, 'Bia', 'bia@email.com'),
(4, 'Denis', 'denis@email.com');

-- 1. Listar todos os clientes sem repetir
SELECT nome, email
FROM clientes_online
UNION
SELECT nome, email
FROM clientes_fisicos;

-- 2. Listar todos os clientes mantendo repetições
SELECT nome, email
FROM clientes_online
UNION ALL
SELECT nome, email
FROM clientes_fisicos;

-- 3. Listar os clientes que aparecem nas duas tabelas
SELECT o.nome, o.email
FROM clientes_online o
INNER JOIN clientes_fisicos f
ON o.id_cliente = f.id_cliente;

-- 4. Listar os clientes que compraram online,
-- mas não compraram na loja física
SELECT o.nome, o.email
FROM clientes_online o
WHERE o.id_cliente NOT IN (
    SELECT id_cliente
    FROM clientes_fisicos
);