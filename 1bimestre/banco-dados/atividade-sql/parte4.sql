-- PARTE 4: Deadlock

-- Exemplo de deadlock (executado separadamente)
-- Ver arquivos:
-- transacaoA.sql
-- transacaoB.sql

-- SOLUÇÃO: acessar na mesma ordem

BEGIN TRANSACTION;

UPDATE Salas SET NomeSala = 'Padrao' WHERE SalaID = 1;
UPDATE Salas SET NomeSala = 'Padrao' WHERE SalaID = 2;

COMMIT;