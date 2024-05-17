CREATE DATABASE db_farmacia_bem_estar;
USE db_farmacia_bem_estar;

CREATE TABLE tb_categorias(
id BIGINT AUTO_INCREMENT PRIMARY KEY,
nome_cat VARCHAR(255) NOT NULL,
descricao VARCHAR(255) NOT NULL
);
CREATE TABLE tb_produtos (
id BIGINT AUTO_INCREMENT,
nome VARCHAR(255) NOT NULL,
descricao VARCHAR (255),
preco DECIMAL(6, 2) NOT NULL,
quantidade INT NOT NULL,
PRIMARY KEY (id)
);
INSERT INTO tb_produtos(nome,descricao,preco,quantidade) VALUES
('Paracetamol', 'Analgésico e antitérmico', 12.50, 100),
('Vitamina C', 'Suplemento vitamínico', 25.00, 50),
('Shampoo Anticaspa', 'Para tratamento de caspa', 45.90, 30),
('Escova de Dentes', 'Escova dental macia', 7.80, 200),
('Luvas Cirúrgicas', 'Luvas descartáveis', 35.00, 150),
('Creme Hidratante', 'Hidratação para a pele', 60.00, 80),
('Antisséptico Bucal', 'Higiene bucal', 15.00, 120),
('Suplemento Whey Protein', 'Suplemento proteico', 150.00, 40);

SELECT * FROM tb_produtos;

INSERT INTO tb_categorias (nome_cat, descricao) VALUES
('Medicamentos', 'Produtos para tratamento de doenças e condições de saúde.'),
('Vitaminas e Suplementos', 'Suplementos para apoio à saúde e bem-estar.'),
('Cosméticos', 'Produtos de beleza e cuidados pessoais.'),
('Higiene Pessoal', 'Produtos de higiene e cuidados diários.'),
('Materiais Médicos', 'Produtos para cuidados médicos e hospitalares.');
SELECT * FROM tb_categorias;

ALTER TABLE tb_produtos ADD categoriaid BIGINT;
ALTER TABLE tb_produtos ADD CONSTRAINT fk_produtos_categorias 
FOREIGN KEY (categoriaid) REFERENCES tb_categorias (id);

SELECT * FROM tb_produtos;

UPDATE tb_produtos SET categoriaid = 1 WHERE id = 1;
UPDATE tb_produtos SET categoriaid = 2 WHERE id = 2;
UPDATE tb_produtos SET categoriaid = 3 WHERE id = 3;
UPDATE tb_produtos SET categoriaid = 4 WHERE id = 4;
UPDATE tb_produtos SET categoriaid = 5 WHERE id = 5;
UPDATE tb_produtos SET categoriaid = 3 WHERE id = 6;
UPDATE tb_produtos SET categoriaid = 4 WHERE id = 7;
UPDATE tb_produtos SET categoriaid = 2 WHERE id = 8;

SELECT * FROM tb_produtos;

SELECT * FROM tb_produtos WHERE preco > 50.00;
SELECT * FROM tb_produtos WHERE preco BETWEEN 5.00 AND 60.00;

SELECT * FROM tb_produtos WHERE nome LIKE '%c%';

SELECT nome, preco, quantidade,tb_categorias.descricao
FROM tb_produtos INNER JOIN tb_categorias 
ON tb_produtos.categoriaid = tb_categorias.id;

SELECT nome, preco, quantidade,tb_categorias.descricao
FROM tb_produtos INNER JOIN tb_categorias 
ON tb_produtos.categoriaid = tb_categorias.id
WHERE nome_cat = 'Cosméticos';

