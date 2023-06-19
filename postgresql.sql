-- Criação da tabela "nome"
CREATE TABLE nome (
  id SERIAL PRIMARY KEY,
  nome VARCHAR(100)
);

-- Criação da tabela "lembrete"
CREATE TABLE lembrete (
  lembreteId SERIAL PRIMARY KEY,
  nomeId INT,
  mensagem VARCHAR(200),
  FOREIGN KEY (nomeId) REFERENCES nome(id)
);

-- Inserção de dados na tabela "nome"
INSERT INTO nome 
(nome)
VALUES 
('nome1'), 
(NULL), 
('nome2');

-- Criação da trigger "inserir_nome"
CREATE TRIGGER nome_trigger
AFTER INSERT 
ON nome FOR EACH ROW
BEGIN
  IF NEW.name IS NULL THEN
    INSERT INTO lembrete (nomeId, mensagem)
    VALUES (NEW.id, CONCAT(NEW.name, ', Informe seu nome.'));
  END IF;
 

SELECT * FROM nome

