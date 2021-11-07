show search_path;

set search_path TO loja;

--Criar tabela cliente

CREATE TABLE IF NOT EXISTS "cliente" (
	id SERIAL PRIMARY KEY,
	nome VARCHAR(50),
	email VARCHAR(50),
	cod_postal char(8),
	telemovel char(9),
	morada varchar(50),
	login varchar(20),
	password varchar(20),
	ncontribuinte varchar(9)
);

--Criar tabela produto

CREATE TABLE IF NOT EXISTS "produto" (
	id SERIAL PRIMARY KEY,
	nome VARCHAR(50),
	preco float,
	stock int,
	categoria varchar(20)
);

-- Criar tabela loja

CREATE TABLE IF NOT EXISTS "loja" (
	id SERIAL PRIMARY KEY,
	morada VARCHAR(50),
	tipo VARCHAR(20)
);

--Criar tabela fornecedores

CREATE TABLE IF NOT EXISTS "fornecedores" (
	id SERIAL PRIMARY KEY,
	nome VARCHAR(50),
	id_produto INTEGER ,
	CONSTRAINT produto_fk FOREIGN KEY  (id_produto) REFERENCES produto(id)
);

--Criar tabela acesso

CREATE TABLE IF NOT EXISTS "acesso" (
	id SERIAL PRIMARY KEY,
	id_cliente INTEGER ,
	data_hora_inicio TIMESTAMP,
	data_hora_fim TIMESTAMP,
	CONSTRAINT cliente_fk FOREIGN KEY  (id_cliente) REFERENCES cliente(id)
);

--Criar tabela funcionario

CREATE TABLE IF NOT EXISTS "funcionario" (
	id SERIAL PRIMARY KEY,
	nome VARCHAR(50) ,
	telemovel char(9),
	morada varchar(50),
	cargo VARCHAR(20),
	id_turnos INTEGER,
	id_loja INTEGER,
	CONSTRAINT loja_fk FOREIGN KEY  (id_loja) REFERENCES loja(id)
);

--Criar tabela turnos

CREATE TABLE IF NOT EXISTS "turnos" (
	id SERIAL PRIMARY KEY,
	id_funcionario INTEGER ,
	data_hora_inicio TIMESTAMP,
	data_hora_fim TIMESTAMP,
	CONSTRAINT funcionario_fk FOREIGN KEY  (id_funcionario) REFERENCES funcionario(id)
);

--Criar tabela compra

CREATE TABLE IF NOT EXISTS "compra" (
	id SERIAL PRIMARY KEY,
	id_cliente INTEGER,
	id_funcionario INTEGER,
	id_produto INTEGER,
	quantidade int,
	total float,
	metodo_pagamento VARCHAR(20),
	tipo_levantamento VARCHAR(50),
	id_loja INTEGER,
	CONSTRAINT cliente_fk FOREIGN KEY  (id_cliente) REFERENCES cliente(id),
	CONSTRAINT funcionario_fk FOREIGN KEY  (id_funcionario) REFERENCES funcionario(id),
	CONSTRAINT produto_fk FOREIGN KEY  (id_produto) REFERENCES produto(id),
    CONSTRAINT loja_fk FOREIGN KEY  (id_loja) REFERENCES loja(id)
);

-- Insert entidade loja --

INSERT INTO loja.loja ( morada, tipo) VALUES ( 'Braga',  'Loja Fisica');
INSERT INTO loja.loja ( morada, tipo) VALUES ( Null,  'Loja Online');

-- Insert entidade produto --

INSERT INTO loja.produto ( nome, preco, stock, categoria) VALUES ( 'RTX 2060', 165.99, 35, 'Componentes');
INSERT INTO loja.produto ( nome, preco, stock, categoria) VALUES ( 'Iphone 12 PRO', 1200.99, 30, 'Mobilidade');
INSERT INTO loja.produto ( nome, preco, stock, categoria) VALUES ( 'Computador Gaming', 1000.99, 7, 'Computadores');
INSERT INTO loja.produto ( nome, preco, stock, categoria) VALUES ( 'Macbook PRO', 1499.99, 10, 'Computadores');
INSERT INTO loja.produto ( nome, preco, stock, categoria) VALUES ( 'i58600k', 165.5, 25, 'Componentes');
INSERT INTO loja.produto ( nome, preco, stock, categoria) VALUES ( 'Ipad', 1440.5, 5, 'Mobilidade');
INSERT INTO loja.produto ( nome, preco, stock, categoria) VALUES ( 'Xiaomi mi8t', 400.99, 12, 'Mobilidade');
INSERT INTO loja.produto ( nome, preco, stock, categoria) VALUES ( 'G pro wireless logitech', 150.00, 16, 'Perifericos');
INSERT INTO loja.produto ( nome, preco, stock, categoria) VALUES ( 'RTX 2070', 600.5, 27, 'Componentes');
INSERT INTO loja.produto ( nome, preco, stock, categoria) VALUES ( 'Rato zowie ec1', 70.99, 50, 'Perifericos');
INSERT INTO loja.produto ( nome, preco, stock, categoria) VALUES ( 'Tapete Logitech', 25.99, 70, 'Perifericos');
INSERT INTO loja.produto ( nome, preco, stock, categoria) VALUES ( 'Iphone 6s', 300.99, 10, 'Mobilidade');
INSERT INTO loja.produto ( nome, preco, stock, categoria) VALUES ( 'RTX 3080', 1650.99, 20, 'Componentes');
INSERT INTO loja.produto ( nome, preco, stock, categoria) VALUES ( 'Smartv Samsung', 700.99,10, 'Imagem');
INSERT INTO loja.produto ( nome, preco, stock, categoria) VALUES ( 'Xiaomi Smartv ', 400.99, 15, 'Imagem');
INSERT INTO loja.produto ( nome, preco, stock, categoria) VALUES ( 'i7 9700k', 455.99, 20, 'Componentes');
INSERT INTO loja.produto ( nome, preco, stock, categoria) VALUES ( 'RTX 2080', 800.99, 25, 'Componentes');
INSERT INTO loja.produto ( nome, preco, stock, categoria) VALUES ( 'SSD 256GB',60.5, 30, 'Armazenamento');
INSERT INTO loja.produto ( nome, preco, stock, categoria) VALUES ( 'HDD 1TB', 55.99, 40, 'Armazenamento');
INSERT INTO loja.produto ( nome, preco, stock, categoria) VALUES ( 'Computador Office', 719.99, 15, 'Computadores');

-- Insert entidade funcionario --

INSERT INTO loja.funcionario ( nome, morada, telemovel, cargo) VALUES ( 'Joaquim', 'Braga', '912222222', 'Caixa');
INSERT INTO loja.funcionario ( nome, morada, telemovel, cargo) VALUES ( 'Joao', 'Fafe', '912224522', 'Caixa');
INSERT INTO loja.funcionario ( nome, morada, telemovel, cargo) VALUES ( 'Marcio', 'Famalicao', '912227862', 'Caixa');
INSERT INTO loja.funcionario ( nome, morada, telemovel, cargo) VALUES ( 'David', 'Porto', '912243222', 'Caixa');
INSERT INTO loja.funcionario ( nome, morada, telemovel, cargo) VALUES ( 'Diogo', 'Braga', '912222213', 'Assistente');
INSERT INTO loja.funcionario ( nome, morada, telemovel, cargo) VALUES ( 'Jorge', 'Braga', '912222212', 'Caixa');
INSERT INTO loja.funcionario ( nome, morada, telemovel, cargo) VALUES ( 'Joaquim', 'Fafe', '912222211', 'Repositor');
INSERT INTO loja.funcionario ( nome, morada, telemovel, cargo) VALUES ( 'Leonardo', 'Barcelos', '912222210', 'Repositor');
INSERT INTO loja.funcionario ( nome, morada, telemovel, cargo) VALUES ( 'Candido', 'Porto', '912222142', 'Repositor');
INSERT INTO loja.funcionario ( nome, morada, telemovel, cargo) VALUES ( 'Joao', 'Esposende', '912234222', 'Repositor');
INSERT INTO loja.funcionario ( nome, morada, telemovel, cargo) VALUES ( 'Luis', 'Braga', '912652222', 'Caixa');
INSERT INTO loja.funcionario ( nome, morada, telemovel, cargo) VALUES ( 'Joaquim', 'Braga', '912022222', 'Caixa');
INSERT INTO loja.funcionario ( nome, morada, telemovel, cargo) VALUES ( 'Abel', 'Braga', '912282222', 'Caixa');
INSERT INTO loja.funcionario ( nome, morada, telemovel, cargo) VALUES ( 'Armando', 'Vila Verde', '912220222', 'Repositor');
INSERT INTO loja.funcionario ( nome, morada, telemovel, cargo) VALUES ( 'Diogo', 'Braga', '912292222', 'Caixa');
INSERT INTO loja.funcionario ( nome, morada, telemovel, cargo) VALUES ( 'Pedro', 'Braga', '912252222', 'Gerente');
INSERT INTO loja.funcionario ( nome, morada, telemovel, cargo) VALUES ( 'Daniel', 'Vieira do mino', '912212222', 'Gerente');
INSERT INTO loja.funcionario ( nome, morada, telemovel, cargo) VALUES ( 'Pedro', 'Guimaraes', '912452222', 'Caixa');
INSERT INTO loja.funcionario ( nome, morada, telemovel, cargo) VALUES ( 'Carlos', 'Guimaraes', '912452232' ,'Assistente');



-- Insert entidade cliente --

INSERT INTO loja.cliente ( nome,email, cod_postal,telemovel,morada,login,password,ncontribuinte) VALUES ( 'Joaquim', 'joaquim@gmail.com', '4702-345', '913322336','Braga','joaquim','joaquim123',252932123);
INSERT INTO loja.cliente ( nome,email, cod_postal,telemovel,morada,login,password,ncontribuinte) VALUES ( 'Jose', 'jose@gmail.com', '4232-045', '913300336','jose','Fafe','jose123',254232123);
INSERT INTO loja.cliente ( nome,email, cod_postal,telemovel,morada,login,password,ncontribuinte) VALUES ( 'Rodrigo', 'rodrigo@gmail.com', '4522-005', '910022336','Guimaraes','rodrigo','rodrigo123',251232123);
INSERT INTO loja.cliente ( nome,email, cod_postal,telemovel,morada,login,password,ncontribuinte) VALUES ( 'Carlos', 'carlos@gmail.com', '4724-345', '913309336','Braga','carlos','carlos123',253213123);
INSERT INTO loja.cliente ( nome,email, cod_postal,telemovel,morada,login,password,ncontribuinte) VALUES ( 'Leonardo', 'leonardo@gmail.com', '4721-335', '964322336','Famalicao','leonardo','leonardo123',232932123);
INSERT INTO loja.cliente ( nome,email, cod_postal,telemovel,morada,login,password,ncontribuinte) VALUES ( 'Joao', 'joao@gmail.com', '4733-525', '917422336','joao','Famalicao','joao123',257732123);
INSERT INTO loja.cliente ( nome,email, cod_postal,telemovel,morada,login,password,ncontribuinte) VALUES ( 'Marcio', 'marcio@gmail.com', '4712-545', '915522336','Esposende','marcio','marcio123',252932986);
INSERT INTO loja.cliente ( nome,email, cod_postal,telemovel,morada,login,password,ncontribuinte) VALUES ( 'Tadeu', 'tadeu@gmail.com', '4705-259', '914422336','Braga','tadeu','tadeu123',273932123);
INSERT INTO loja.cliente ( nome,email, cod_postal,telemovel,morada,login,password,ncontribuinte) VALUES ( 'Mariano', 'mariano@gmail.com', '4702-775', '913321236','Braga','mariano','mariano123',259123321);
INSERT INTO loja.cliente ( nome,email, cod_postal,telemovel,morada,login,password,ncontribuinte) VALUES ( 'Lucas', 'lucas@gmail.com', '4942-145', '923532336','Braga','lucas','lucas123',252932123);
INSERT INTO loja.cliente ( nome,email, cod_postal,telemovel,morada,login,password,ncontribuinte) VALUES ( 'Miguel', 'miguel@gmail.com', '4701-321', '962322336','Porto','miguel','miguel123',252932873);
INSERT INTO loja.cliente ( nome,email, cod_postal,telemovel,morada,login,password,ncontribuinte) VALUES ( 'Jorge', 'jorge@gmail.com', '4522-345', '923322336','Fafe','jorge','jorge123',252212123);
INSERT INTO loja.cliente ( nome,email, cod_postal,telemovel,morada,login,password,ncontribuinte) VALUES ( 'Anibal', 'anibal@gmail.com', '4562-605', '913311136','Braga','anibal','anibal123',232221243);
INSERT INTO loja.cliente ( nome,email, cod_postal,telemovel,morada,login,password,ncontribuinte) VALUES ( 'Duarte', 'duarte@gmail.com', '4602-125', '913322126','Guimaraes','duarte','duarte123',251232123);
INSERT INTO loja.cliente ( nome,email, cod_postal,telemovel,morada,login,password,ncontribuinte) VALUES ( 'Pedro', 'pedro@gmail.com', '4705-215', '914322338','Fafe','pedro','pedro123',222462123);
INSERT INTO loja.cliente ( nome,email, cod_postal,telemovel,morada,login,password,ncontribuinte) VALUES ( 'Luis', 'luis@gmail.com', '4701-135', '913322339','Braga','luis','luis123',222932123);
INSERT INTO loja.cliente ( nome,email, cod_postal,telemovel,morada,login,password,ncontribuinte) VALUES ( 'Marco', 'marco@gmail.com', '4702-345', '913127336','Viana do Castelo','marco','marco123',252967123);
INSERT INTO loja.cliente ( nome,email, cod_postal,telemovel,morada,login,password,ncontribuinte) VALUES ( 'Moises', 'moises@gmail.com', '4707-345', '913322336','Geres','moises','moises123',252432123);


--Insert entidade Fornecedores

INSERT INTO loja.fornecedores (id, nome, id_produto) VALUES (1, 'Nvidia', 1);
INSERT INTO loja.fornecedores (id, nome, id_produto) VALUES (2, 'Apple', 2);
INSERT INTO loja.fornecedores (id, nome, id_produto) VALUES (3, 'Pcdiga', 3);
INSERT INTO loja.fornecedores (id, nome, id_produto) VALUES (4, 'Apple', 4);
INSERT INTO loja.fornecedores (id, nome, id_produto) VALUES (5, 'Intel', 5);
INSERT INTO loja.fornecedores (id, nome, id_produto) VALUES (6, 'Apple', 6);
INSERT INTO loja.fornecedores (id, nome, id_produto) VALUES (7, 'Xiaomi', 7);
INSERT INTO loja.fornecedores (id, nome, id_produto) VALUES (8, 'Logitech', 8);
INSERT INTO loja.fornecedores (id, nome, id_produto) VALUES (9, 'Nvidia', 9);
INSERT INTO loja.fornecedores (id, nome, id_produto) VALUES (10, 'Benq', 10);
INSERT INTO loja.fornecedores (id, nome, id_produto) VALUES (11, 'Logitech', 11);
INSERT INTO loja.fornecedores (id, nome, id_produto) VALUES (12, 'Apple', 12);
INSERT INTO loja.fornecedores (id, nome, id_produto) VALUES (13, 'Nvidia', 13);
INSERT INTO loja.fornecedores (id, nome, id_produto) VALUES (14, 'Samsung', 14);
INSERT INTO loja.fornecedores (id, nome, id_produto) VALUES (15, 'Xiaomi', 15);
INSERT INTO loja.fornecedores (id, nome, id_produto) VALUES (16, 'Intel', 16);
INSERT INTO loja.fornecedores (id, nome, id_produto) VALUES (17, 'Nvidia', 17);
INSERT INTO loja.fornecedores (id, nome, id_produto) VALUES (18, 'Samsung', 18);
INSERT INTO loja.fornecedores (id, nome, id_produto) VALUES (19, 'Intel', 19);
INSERT INTO loja.fornecedores (id, nome, id_produto) VALUES (20, 'Globaldata', 20);

-- Insert entidade turnos

INSERT INTO loja.turnos (id, id_funcionario,data_hora_inicio, data_hora_fim) VALUES (1, 1, '2021-05-01 00:00:00.000000', '2021-05-04 08:00:00.000000');
INSERT INTO loja.turnos (id, id_funcionario,data_hora_inicio, data_hora_fim) VALUES (2, 2, '2021-05-01 00:00:00.000000', '2021-05-04 08:00:00.000000');
INSERT INTO loja.turnos (id, id_funcionario,data_hora_inicio, data_hora_fim) VALUES (3, 3, '2021-05-01 00:00:00.000000', '2021-05-04 08:00:00.000000');
INSERT INTO loja.turnos (id, id_funcionario,data_hora_inicio, data_hora_fim) VALUES (4, 4, '2021-05-01 00:00:00.000000', '2021-05-04 08:00:00.000000');
INSERT INTO loja.turnos (id, id_funcionario,data_hora_inicio, data_hora_fim) VALUES (5, 5, '2021-05-01 00:00:00.000000', '2021-05-04 08:00:00.000000');
INSERT INTO loja.turnos (id, id_funcionario,data_hora_inicio, data_hora_fim) VALUES (6, 6, '2021-05-02 08:00:00.000000', '2021-05-04 16:00:00.000000');
INSERT INTO loja.turnos (id, id_funcionario,data_hora_inicio, data_hora_fim) VALUES (7, 7, '2021-05-02 00:00:00.000000', '2021-05-04 08:00:00.000000');
INSERT INTO loja.turnos (id, id_funcionario,data_hora_inicio, data_hora_fim) VALUES (8, 8, '2021-05-02 00:00:00.000000', '2021-05-04 08:00:00.000000');
INSERT INTO loja.turnos (id, id_funcionario,data_hora_inicio, data_hora_fim) VALUES (9, 9, '2021-05-02 00:00:00.000000', '2021-05-04 08:00:00.000000');
INSERT INTO loja.turnos (id, id_funcionario,data_hora_inicio, data_hora_fim) VALUES (10, 10, '2021-05-02 08:00:00.000000', '2021-05-04 16:00:00.000000');
INSERT INTO loja.turnos (id, id_funcionario,data_hora_inicio, data_hora_fim) VALUES (11, 11, '2021-05-02 08:00:00.000000', '2021-05-04 16:00:00.000000');
INSERT INTO loja.turnos (id, id_funcionario,data_hora_inicio, data_hora_fim) VALUES (12, 12, '2021-05-02 00:00:00.000000', '2021-05-04 08:00:00.000000');
INSERT INTO loja.turnos (id, id_funcionario,data_hora_inicio, data_hora_fim) VALUES (13, 13, '2021-05-01 00:00:00.000000', '2021-05-04 08:00:00.000000');
INSERT INTO loja.turnos (id, id_funcionario,data_hora_inicio, data_hora_fim) VALUES (14, 14, '2021-05-01 00:00:00.000000', '2021-05-04 08:00:00.000000');
INSERT INTO loja.turnos (id, id_funcionario,data_hora_inicio, data_hora_fim) VALUES (15, 15, '2021-05-02 08:00:00.000000', '2021-05-04 16:00:00.000000');
INSERT INTO loja.turnos (id, id_funcionario,data_hora_inicio, data_hora_fim) VALUES (16, 16, '2021-05-01 00:00:00.000000', '2021-05-04 08:00:00.000000');
INSERT INTO loja.turnos (id, id_funcionario,data_hora_inicio, data_hora_fim) VALUES (17, 17, '2021-05-02 08:00:00.000000', '2021-05-04 16:00:00.000000');
INSERT INTO loja.turnos (id, id_funcionario,data_hora_inicio, data_hora_fim) VALUES (18, 18, '2021-05-01 08:00:00.000000', '2021-05-04 16:00:00.000000');
INSERT INTO loja.turnos (id, id_funcionario,data_hora_inicio, data_hora_fim) VALUES (19, 19, '2021-05-02 08:00:00.000000', '2021-05-04 16:00:00.000000');


-- Insert entidade Acesso

INSERT INTO loja.acesso (id, id_cliente,data_hora_inicio, data_hora_fim) VALUES (1, 1, '2021-05-03 00:00:00.000000', '2021-05-04 08:00:00.000000');
INSERT INTO loja.acesso (id, id_cliente,data_hora_inicio, data_hora_fim) VALUES (2, 2, '2021-05-07 00:00:00.000000', '2021-05-08 08:00:00.000000');
INSERT INTO loja.acesso (id, id_cliente,data_hora_inicio, data_hora_fim) VALUES (3, 3, '2021-05-05 00:00:00.000000', '2021-05-09 08:00:00.000000');
INSERT INTO loja.acesso (id, id_cliente,data_hora_inicio, data_hora_fim) VALUES (4, 4, '2021-05-04 00:00:00.000000', '2021-05-10 08:00:00.000000');
INSERT INTO loja.acesso (id, id_cliente,data_hora_inicio, data_hora_fim) VALUES (5, 5, '2021-05-04 00:00:00.000000', '2021-05-06 08:00:00.000000');
INSERT INTO loja.acesso (id, id_cliente,data_hora_inicio, data_hora_fim) VALUES (6, 6, '2021-05-02 08:00:00.000000', '2021-05-04 16:00:00.000000');
INSERT INTO loja.acesso (id, id_cliente,data_hora_inicio, data_hora_fim) VALUES (7, 7, '2021-05-02 00:00:00.000000', '2021-05-04 08:00:00.000000');
INSERT INTO loja.acesso (id, id_cliente,data_hora_inicio, data_hora_fim) VALUES (8, 8, '2021-05-02 00:00:00.000000', '2021-05-07 08:00:00.000000');
INSERT INTO loja.acesso (id, id_cliente,data_hora_inicio, data_hora_fim) VALUES (9, 9, '2021-05-02 00:00:00.000000', '2021-05-06 08:00:00.000000');
INSERT INTO loja.acesso (id, id_cliente,data_hora_inicio, data_hora_fim) VALUES (10, 10, '2021-05-03 08:00:00.000000', '2021-05-08 16:00:00.000000');
INSERT INTO loja.acesso (id, id_cliente,data_hora_inicio, data_hora_fim) VALUES (11, 11, '2021-05-03 08:00:00.000000', '2021-05-02 16:00:00.000000');
INSERT INTO loja.acesso (id, id_cliente,data_hora_inicio, data_hora_fim) VALUES (12, 12, '2021-05-03 00:00:00.000000', '2021-05-05 08:00:00.000000');
INSERT INTO loja.acesso (id, id_cliente,data_hora_inicio, data_hora_fim) VALUES (13, 13, '2021-05-03 00:00:00.000000', '2021-05-07 08:00:00.000000');
INSERT INTO loja.acesso (id, id_cliente,data_hora_inicio, data_hora_fim) VALUES (14, 14, '2021-05-02 00:00:00.000000', '2021-05-04 08:00:00.000000');
INSERT INTO loja.acesso (id, id_cliente,data_hora_inicio, data_hora_fim) VALUES (15, 15, '2021-05-02 08:00:00.000000', '2021-05-04 16:00:00.000000');
INSERT INTO loja.acesso (id, id_cliente,data_hora_inicio, data_hora_fim) VALUES (16, 16, '2021-05-01 00:00:00.000000', '2021-05-04 08:00:00.000000');
INSERT INTO loja.acesso (id, id_cliente,data_hora_inicio, data_hora_fim) VALUES (17, 17, '2021-05-02 08:00:00.000000', '2021-05-04 16:00:00.000000');
INSERT INTO loja.acesso (id, id_cliente,data_hora_inicio, data_hora_fim) VALUES (18, 18, '2021-05-01 08:00:00.000000', '2021-05-04 16:00:00.000000');

--Insert entidade compra

INSERT INTO loja.compra ( id, id_cliente, id_funcionario, id_produto,quantidade,total,metodo_pagamento,tipo_pagamento,id_loja) VALUES ( 1,1,1,1,50,2,null ,'dinheiro',1);
INSERT INTO loja.compra ( id, id_cliente, id_funcionario, id_produto,quantidade,total,metodo_pagamento,tipo_pagamento,id_loja) VALUES ( 2,2,2,2,50,4,'multibanco' ,'cartao',2);
INSERT INTO loja.compra ( id, id_cliente, id_funcionario, id_produto,quantidade,total,metodo_pagamento,tipo_pagamento,id_loja) VALUES ( 3,3,3,3,50,6,'mastercard' ,'cartao',2);
INSERT INTO loja.compra ( id, id_cliente, id_funcionario, id_produto,quantidade,total,metodo_pagamento,tipo_pagamento,id_loja) VALUES ( 4,4,4,4,50,7,'multibanco' ,'cartao',2);
INSERT INTO loja.compra ( id, id_cliente, id_funcionario, id_produto,quantidade,total,metodo_pagamento,tipo_pagamento,id_loja) VALUES ( 5,5,5,5,50,10,'multibanco' ,'cartao',2);
INSERT INTO loja.compra ( id, id_cliente, id_funcionario, id_produto,quantidade,total,metodo_pagamento,tipo_pagamento,id_loja) VALUES ( 6,6,6,6,50,12, null ,'dinheiro',1);
INSERT INTO loja.compra ( id, id_cliente, id_funcionario, id_produto,quantidade,total,metodo_pagamento,tipo_pagamento,id_loja) VALUES ( 7,7,7,7,50,1, null ,'dinheiro',1);
INSERT INTO loja.compra ( id, id_cliente, id_funcionario, id_produto,quantidade,total,metodo_pagamento,tipo_pagamento,id_loja) VALUES ( 8,8,8,8,50,2,'cobranca' ,'dinheiro',2);
INSERT INTO loja.compra ( id, id_cliente, id_funcionario, id_produto,quantidade,total,metodo_pagamento,tipo_pagamento,id_loja) VALUES ( 9,9,9,9,50,3,'mbway' ,'cartao',1);
INSERT INTO loja.compra ( id, id_cliente, id_funcionario, id_produto,quantidade,total,metodo_pagamento,tipo_pagamento,id_loja) VALUES ( 10,10,10,10,50,5,'multibanco' ,'cartao',2);
INSERT INTO loja.compra ( id, id_cliente, id_funcionario, id_produto,quantidade,total,metodo_pagamento,tipo_pagamento,id_loja) VALUES ( 11,11,11,11,50,3,'mbway' ,'cartao',1);
INSERT INTO loja.compra ( id, id_cliente, id_funcionario, id_produto,quantidade,total,metodo_pagamento,tipo_pagamento,id_loja) VALUES ( 12,12,12,12,50,2,'mbway' ,'cartao',1);
INSERT INTO loja.compra ( id, id_cliente, id_funcionario, id_produto,quantidade,total,metodo_pagamento,tipo_pagamento,id_loja) VALUES ( 13,13,13,13,50,2,'cobranca' ,'dinheiro',2);
INSERT INTO loja.compra ( id, id_cliente, id_funcionario, id_produto,quantidade,total,metodo_pagamento,tipo_pagamento,id_loja) VALUES ( 14,14,14,14,50,1,'mbway' ,'cartao',2);
INSERT INTO loja.compra ( id, id_cliente, id_funcionario, id_produto,quantidade,total,metodo_pagamento,tipo_pagamento,id_loja) VALUES ( 15,15,15,15,50,4,'mbway' ,'cartao',1);
INSERT INTO loja.compra ( id, id_cliente, id_funcionario, id_produto,quantidade,total,metodo_pagamento,tipo_pagamento,id_loja) VALUES ( 16,16,16,16,50,6,'mbway' ,'cartao',1);
INSERT INTO loja.compra ( id, id_cliente, id_funcionario, id_produto,quantidade,total,metodo_pagamento,tipo_pagamento,id_loja) VALUES ( 17,17,17,17,50,4,'mastercard' ,'cartao',2);
INSERT INTO loja.compra ( id, id_cliente, id_funcionario, id_produto,quantidade,total,metodo_pagamento,tipo_pagamento,id_loja) VALUES ( 18,18,18,18,50,3,'mastercard' ,'cartao', 1);
INSERT INTO loja.compra ( id, id_cliente, id_funcionario, id_produto,quantidade,total,metodo_pagamento,tipo_pagamento,id_loja) VALUES ( 19,12,19,19,50,2,'mastercard' ,'cartao',1);
INSERT INTO loja.compra ( id, id_cliente, id_funcionario, id_produto,quantidade,total,metodo_pagamento,tipo_pagamento,id_loja) VALUES ( 20,16,14,20,50,70,'cobranca' ,'dinheiro',2);
INSERT INTO loja.compra ( id, id_cliente, id_funcionario, id_produto,quantidade,total,metodo_pagamento,tipo_pagamento,id_loja) VALUES ( 21,12,1,1,50,1,'mbway' ,'cartao',2);
INSERT INTO loja.compra ( id, id_cliente, id_funcionario, id_produto,quantidade,total,metodo_pagamento,tipo_pagamento,id_loja) VALUES (22,5,14,13,50,2,'mbway' ,'cartao',1);
INSERT INTO loja.compra ( id, id_cliente, id_funcionario, id_produto,quantidade,total,metodo_pagamento,tipo_pagamento,id_loja) VALUES ( 23,3,15,16,50,1,'multibanco' ,'cartao',2);
INSERT INTO loja.compra ( id, id_cliente, id_funcionario, id_produto,quantidade,total,metodo_pagamento,tipo_pagamento,id_loja) VALUES ( 24,15,1,1,50,3,'' ,'dinheiro',1);
INSERT INTO loja.compra ( id, id_cliente, id_funcionario, id_produto,quantidade,total,metodo_pagamento,tipo_pagamento,id_loja) VALUES ( 25,13,11,1,50,1,'mbway' ,'cartao',2);
INSERT INTO loja.compra ( id, id_cliente, id_funcionario, id_produto,quantidade,total,metodo_pagamento,tipo_pagamento,id_loja) VALUES ( 26,17,12,1,50,2,'mbway' ,'cartao',1);
INSERT INTO loja.compra ( id, id_cliente, id_funcionario, id_produto,quantidade,total,metodo_pagamento,tipo_pagamento,id_loja) VALUES ( 27,12,1,17,50,4,'mbway' ,'cartao',2);
INSERT INTO loja.compra ( id, id_cliente, id_funcionario, id_produto,quantidade,total,metodo_pagamento,tipo_pagamento,id_loja) VALUES ( 28,1,14,1,50,6,'VISA' ,'cartao',1);
INSERT INTO loja.compra ( id, id_cliente, id_funcionario, id_produto,quantidade,total,metodo_pagamento,tipo_pagamento,id_loja) VALUES ( 29,1,8,10,50,5,'' ,'dinheiro',1);
INSERT INTO loja.compra ( id, id_cliente, id_funcionario, id_produto,quantidade,total,metodo_pagamento,tipo_pagamento,id_loja) VALUES ( 30,14,1,14,50,7,'VISA' ,'cartao',2);


-- VIEW TURNOS_FUNCIONARIO

Create VIEW Turnos_Funcionarios AS
select f.nome , f.cargo , t.data_hora_inicio, t.data_hora_fim
FROM loja.funcionario f , loja.turnos t
where f.id = t.id_funcionario;

-- Select Clientes_Acessos

select c.nome , c.login ,c.password, a.data_hora_inicio , a.data_hora_fim
FROM loja.cliente c  , loja.acesso a
where c.id = a.id_cliente;

-- View Produto_Fornecedores

Create or replace View Produtos_Fornecedores AS
select p.nome as Produto_Nome, p.stock , f.nome as Fornecedor_Nome
from loja.produto p , loja.fornecedores f
where  p.id =  f.id_produto order by Produto_Nome;

-- Select Media do preco dos produtos

select avg(preco) from produto;

-- Select número de produtos por fornecedor

select count(p.id), f.nome
from loja.produto p , loja.fornecedores f
where  p.id =  f.id_produto
group by f.nome;

-- Select valor feito em vendas

Select SUM(total)
from compra ;


-- Select vendas por funcionarios

select count(v.id), f.nome
from loja.compra v , loja.funcionario f
where  v.id_funcionario =  f.id
group by f.nome;


-- Select venda mais alta e mais baixa

select MIN(total) , MAX(total)
from compra;


-- View Vendas conforme quantidade e o preco do produto
Create or replace View Vendas as
select f.nome as Nome_Funcionario , c.nome as Nome_Cliente , p.nome as Nome_Produto , v.quantidade * p.preco as total,  l.tipo as Loja
FROM loja.funcionario f , loja.cliente c ,loja.compra v ,loja.produto p , loja.loja l
where f.id =  v.id_funcionario
    and c.id = v.id_cliente
    and p.id = v.id_produto
    and l.id = v.id_loja order by total;



-- Trigger Criar Funcionario

create function funcionario_trigger() returns trigger
    language plpgsql
as
$$
BEGIN
	RAISE NOTICE 'Funcionario Criado';
	return new;
END;
$$;

alter function funcionario_trigger() owner to postgres;

create trigger f_trigger
    after insert
    on funcionario
    for each row
execute procedure funcionario_trigger();

-- Function para ver o total de vendas na loja fisica

create or replace function total_vendas_Fisica()
returns int
language plpgsql
as
$$
declare
   total integer;
begin
   select count(*)
   into total
   from loja.Vendas
   where loja.Vendas.loja = 'Loja Fisica';


   return total;

end;
$$;

select total_vendas_Fisica();


-- Numero de funcionarios por dia
SELECT DATE(t.data_hora_inicio) AS day , count(t.id) AS total
FROM loja.turnos t
GROUP BY day;


--Numero total de vendas por funcionario

SELECT f.nome AS Funcionarios , sum(v.total) AS total
FROM loja.Vendas v, loja.funcionario f
where v.nome_funcionario = f.nome
GROUP BY f.nome ;