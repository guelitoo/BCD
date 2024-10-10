-- Criando um banco de dados
CREATE DATABASE db_cadastro;

-- Usando um Banco Dados
USE db_cadastro;

-- Criando Tabela Pepessoasssoas
CREATE TABLE pessoas (
nome varchar(30),
idade int,
sexo char(1),
peso float,
altura float,
nacionalidade varchar(20)
);

-- Alterando Tabela Pessoas
ALTER TABLE pessoas
ADD COLUMN profissao varchar(10);

-- Exibi a coluna
SELECT * FROM pessoas;

-- Adiciona a coluna cpf após o nome
ALTER TABLE pessoas
ADD COLUMN cpf varchar(11)
AFTER nome;

-- Adiciona a coluna id_pessoa em primeiro
ALTER TABLE pessoas
ADD COLUMN id_pessoa int
FIRST;

ALTER TABLE pessoas
DROP COLUMN profissao;

-- Altera a coluna para não ser nula
ALTER TABLE pessoas
MODIFY COLUMN cpf int NOT NULL;

-- Renomeia a coluna
ALTER TABLE pessoas
CHANGE COLUMN cpf rg varchar(11);

-- Exibi a decrição da tabela
DESC pessoas;

-- Renomeia a tabela
ALTER TABLE pessoas
RENAME TO aluno;

--
DESC aluno;

DROP TABLE IF EXISTS aluno;

SHOW TABLES;

CREATE TABLE IF NOT EXISTS tb_curso (
id_curso int NOT NULL AUTO_INCREMENT,
nome varchar(30) NOT NULL UNIQUE,
descricao text,
carga int UNSIGNED,
ano year DEFAULT '2024',
PRIMARY KEY(id_curso)
)DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS professor (
id_professor int PRIMARY KEY NOT NULL AUTO_INCREMENT,
nome varchar(30) NOT NULL,
nascimento date,
sexo enum('M','F'),
peso decimal(5,2),
altura decimal(3,2),
nacionalidade varchar(20) DEFAULT 'Brasileira', 
CURSO_id_curso int,
FOREIGN KEY (CURSO_id_curso) REFERENCES tb_curso(id_curso)
);

CREATE TABLE IF NOT EXISTS tb_aluno (
id_aluno int NOT NULL,
nome varchar(30) NOT NULL,
nascimento date,
sexo enum('M','F'),
peso decimal(5,2),
altura decimal(3,2),
nacionalidade varchar(20) DEFAULT 'Brasileira'
);

ALTER TABLE tb_aluno
MODIFY COLUMN id_aluno int PRIMARY KEY NOT NULL AUTO_INCREMENT;

ALTER TABLE tb_aluno
ADD COLUMN CURSO_id_curso int;

ALTER TABLE tb_aluno
ADD FOREIGN KEY (CURSO_id_curso)
REFERENCES tb_curso(id_curso);

