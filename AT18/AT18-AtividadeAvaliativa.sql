DROP DATABASE IF EXISTS db_campeonatos;

CREATE DATABASE IF not EXISTS db_campeonatos;

USE db_campeonatos;

CREATE TABLE tb_corredor (
    id_corredor INT PRIMARY KEY AUTO_INCREMENT,
    nome_corredor VARCHAR(50) NOT NULL,
    metros_distancia DECIMAL(10, 2) DEFAULT 0.00,
    dt_nasc DATE
);

INSERT INTO tb_corredor (nome_corredor, metros_distancia, dt_nasc) VALUES
('Ana Clara', 500.00, '1990-05-12'),
('Bruno Souza', 500.00, '1985-09-22'),
('Carlos Menezes', 500.00, '1998-01-15'),
('Daniela Lima', 1000.00, '1992-07-08'),
('Eduardo Santos', 5000.00, '1988-11-30'),
('Fernanda Costa', 200.00, '1995-03-25'),
('Gabriel Lopes', 500.00, '1997-06-14'),
('Helena Martins', 500.00, '2000-04-18'),
('Igor Carvalho', 1000.00, '1982-12-05'),
('Juliana Almeida', 5000.00, '1993-08-11'),
('Kleber Fonseca', 100.00, '1989-02-20'),
('Laura Ribeiro', 200.00, '1994-10-13'),
('Marcelo Vieira', 500.00, '1991-05-09'),
('Nathalia Rocha', 1000.00, '1999-03-03'),
('Otávio Borges', 5000.00, '1986-07-27'),
('Paula Fernandes', 5000.00, '1996-09-19'),
('Ricardo Gonçalves', 5000.00, '1987-11-04'),
('Sabrina Silva', 500.00, '1992-12-22'),
('Thiago Pereira', 1000.00, '1983-08-17'),
('Úrsula Nogueira', 5000.00, '2001-01-01'),
('Victor Hugo', 100.00, '1990-06-29'),
('Wesley Castro', 1000.00, '1984-03-15'),
('Xavier Teixeira', 500.00, '1995-07-10'),
('Yasmin Farias', 1000.00, '1998-10-05'),
('Zélia Monteiro', 5000.00, '1981-04-23'),
('Arthur Gomes', 100.00, '2002-02-07'),
('Beatriz Moraes', 200.00, '1993-08-30'),
('Cauê Andrade', 1000.00, '1980-09-11'),
('Débora Vasconcelos', 1000.00, '1997-05-18'),
('Elisa Guimarães', 1000.00, '1986-12-09');

CREATE TABLE tb_evento(
    id_evento INT PRIMARY KEY AUTO_INCREMENT,
    nome_evento VARCHAR(50) NOT NULL,
    cidade VARCHAR(50) DEFAULT 'SOROCABA',
    dt_evento DATE
);
INSERT INTO tb_evento VALUES
(DEFAULT, 'Corrida de Rua Sorocabana', 'SOROCABA', '2024-03-10'),
(DEFAULT, 'Maratona Internacional SP', 'SÃO PAULO', '2024-04-15'),
(DEFAULT, 'Desafio Trail Run', 'CAMPINAS', '2024-05-20'),
(DEFAULT, 'Corrida Noturna', DEFAULT, '2024-06-25'),
(DEFAULT, 'Maratona da Independência', 'BRASÍLIA', '2024-09-07'),
(DEFAULT, 'Circuito das Estações - Verão', 'RIO DE JANEIRO', '2024-01-14'),
(DEFAULT, 'Circuito das Estações - Inverno', 'CURITIBA', '2024-07-22'),
(DEFAULT, 'Ultramaratona Serra do Japi', 'JUNDIAÍ', '2024-08-30'),
(DEFAULT, 'Corrida Aniversário da Cidade', DEFAULT, '2024-08-15'),
(DEFAULT, 'Desafio Interlagos', 'SÃO PAULO', '2024-02-18');

CREATE TABLE tb_corredor_evento (
    CORREDOR_id_corredor INT,
    EVENTO_id_evento INT,
    FOREIGN KEY (CORREDOR_id_corredor)
        REFERENCES tb_corredor (id_corredor),
    FOREIGN KEY (EVENTO_id_evento)
        REFERENCES tb_evento (id_evento)
);

INSERT INTO tb_corredor_evento (CORREDOR_id_corredor, EVENTO_id_evento) VALUES
(1,9),
(1,1),
(1,7),
(1,3),
(1,4),
(1,5),
(2,1),
(2,8),
(2,9),
(2,7),
(2,4),
(2,10),
(2,6),
(3,5),
(3,8),
(3,3),
(3,6),
(3,10),
(3,9),
(3,7),
(4,7),
(4,5),
(4,2),
(4,4),
(4,8),
(4,9),
(5,6),
(5,8),
(5,1),
(5,2),
(5,7),
(5,4),
(5,10),
(6,7),
(6,1),
(6,6),
(6,8),
(6,2),
(6,3),
(7,5),
(7,7),
(7,6),
(7,9),
(7,2),
(7,1),
(7,8),
(8,4),
(8,5),
(8,8),
(8,9),
(8,3),
(8,1),
(9,5),
(9,3),
(9,6),
(9,2),
(9,4),
(9,7),
(9,8),
(10,9),
(10,7),
(10,10),
(10,2),
(10,5),
(10,8),
(10,6),
(11,2),
(11,1),
(11,4),
(11,8),
(11,6),
(11,10),
(12,5),
(12,6),
(12,10),
(12,8),
(12,9),
(13,5),
(13,10),
(13,9),
(13,2),
(13,4),
(14,6),
(14,1),
(14,8),
(14,7),
(14,3),
(14,5),
(14,10),
(15,2),
(15,1),
(15,5),
(15,8),
(15,3),
(15,7),
(15,4),
(16,2),
(16,4),
(16,3),
(16,8),
(16,7),
(16,6),
(16,5),
(16,9),
(17,10),
(17,9),
(17,4),
(17,2),
(17,5),
(17,6),
(18,1),
(18,10),
(18,7),
(18,4),
(18,6),
(18,8),
(19,3),
(19,9),
(19,8),
(19,7),
(19,2),
(19,4),
(19,5),
(20,6),
(20,5),
(20,9),
(20,8),
(20,10),
(21,6),
(21,10),
(21,7),
(21,3),
(21,9),
(21,1),
(21,5),
(21,4),
(22,4),
(22,9),
(22,1),
(22,10),
(22,5),
(22,8),
(23,7),
(23,1),
(23,8),
(23,2),
(23,3),
(23,9),
(23,6),
(23,4),
(24,9),
(24,5),
(24,1),
(24,2),
(24,6),
(24,10),
(24,3),
(25,2),
(25,7),
(25,9),
(25,6),
(25,3),
(27,9),
(27,1),
(27,7),
(27,3),
(27,4),
(27,5),
(28,1),
(28,8),
(28,9),
(28,7),
(28,4),
(28,10),
(28,6),
(29,5),
(29,8),
(29,3),
(29,6),
(29,10),
(29,9),
(29,7),
(30,7),
(30,5),
(30,2),
(30,4),
(30,8),
(30,9);

-- 01)  Selecione a distância principal e o número de corredores que correram a distância determinada (numero_corredores). Exiba somente as linhas em que o número de corredores for maior que 3.
SELECT 
    metros_distancia,
    COUNT(id_corredor) AS numero_corredores
FROM 
    tb_corredor
GROUP BY 
    metros_distancia
HAVING 
    COUNT(id_corredor) > 3;

-- 02) Exiba o nome do evento e o número de membros do clube que participam desse evento (chame essa coluna de runner_count). Observe que pode haver eventos em que nenhum associado do clube participe. Para esses eventos, o runner_count deve ser igual a 0.
SELECT 
    e.nome_evento,
    COUNT(ce.CORREDOR_id_corredor) AS runner_count
FROM 
    tb_evento e
LEFT JOIN 
    tb_corredor_evento ce
ON 
    e.id_evento = ce.EVENTO_id_evento
GROUP BY 
    e.nome_evento;

-- 03) Determinar o corredor mais jovem que participou de pelo menos um evento e a data do evento mais recente que ele participou
SELECT 
    c.nome_corredor,
    MAX(e.dt_evento) AS evento_mais_recente
FROM 
    tb_corredor c
JOIN 
    tb_corredor_evento ce ON c.id_corredor = ce.CORREDOR_id_corredor
JOIN 
    tb_evento e ON ce.EVENTO_id_evento = e.id_evento
WHERE 
    c.dt_nasc = (SELECT MAX(dt_nasc) FROM tb_corredor)
GROUP BY 
    c.id_corredor;

-- 3
SELECT 
    c.nome_corredor,
    MAX(e.dt_evento) AS evento_mais_recente
FROM 
    (SELECT * FROM tb_corredor WHERE dt_nasc = (SELECT MAX(dt_nasc) FROM tb_corredor)) c
JOIN 
    tb_corredor_evento ce ON c.id_corredor = ce.CORREDOR_id_corredor
JOIN 
    tb_evento e ON ce.EVENTO_id_evento = e.id_evento
GROUP BY 
    c.id_corredor;


