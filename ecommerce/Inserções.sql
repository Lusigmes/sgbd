		/*3.INSERÇÃO*/
	/*cliente*/
INSERT INTO cliente (p_nome, minit, s_nome, cpf, endereco, data_nascimento)
VALUES ('João', 'A.', 'Silva', '12345678901', 'Rua Principal, 123', '1990-05-15'),
 ('Luis', 'C.', 'Silva', '125215215', 'Rua Principal, 444', '1995-01-12'),
  ('Carlin', 'D.', 'Silva', '643643643', 'Rua Secundária, 111', '1980-01-11'),
   ('Marcin', 'H.', 'Silva', '532151515', 'Rua Tercáaria, 1243', '1999-01-15'), 
   ('João', 'A.', 'Silva', '644363422', 'Rua Secundária, 123', '2001-11-30');

select * from cliente;


	/*produto*/
ALTER TABLE produto ALTER COLUMN produto_nome TYPE varchar(255); 

INSERT INTO produto (classificacao_kids, produto_nome, categoria, avaliacao, tamanho)
VALUES (false, 'Fones de ouvido', 'Utilitarios', 5.0, '05x05x10'),
        (true, 'Carrinho', 'Brinquedos', 4.5, '10x10x10'),
        (true, 'Aviao', 'Brinquedos', 4.5, '10x10x10'),
        (false, 'Panela Antiaderente', 'Cozinha', 4.0, '20x20x10'),
        (true, 'Boneco', 'Brinquedos', 4.5, '10x10x10'),
        (false, 'Notbook', 'Tecnologia', 5.0, '20x20x10'),
        (false, 'Iphone', 'Tecnologia', 5.0, '20x20x10'),
        (true, 'Dinossauro', 'Brinquedos', 4.5, '10x10x10'),
        (false, 'Kit limpeza geral', 'Limpeza', 5.0, '20x20x10'),
        (false, 'Conjunto de utilitários de prata', 'Cozinha', 4.0, '20x20x10'),
        (false, 'Bola de futebol', 'Esporte', 3.0, '20x20x10');
		
		
select * from produto;


	/*pedido*/
INSERT INTO pedido (id_cliente, status, descricao, frete, pagamento)
VALUES (1, 'Em processamento', 'Pedido de produtos de limpeza', 8.5, 'Cartão de crédito'),
(2, 'Confirmado', 'Pedido de brinquedos', 7.0, 'Boleto'),
 (3, 'Cancelado', 'Pedido de eletrônicos', 12.0, 'Pix'),
 (1, 'Em processamento', 'Pedido de produtos esportivos', 8.5, 'Pix'),
(1, 'Confirmado', 'Pedido de brinquedos', 7.0, 'Pix'),
 (5, 'Cancelado', 'Pedido de brinquedos', 12.0, 'Pix'),
 (2, 'Em processamento', 'Pedido de produtos de limpeza', 8.5, 'Cartão de débito'),
(2, 'Confirmado', 'Pedido de produtos de cozinha', 7.0, 'Cartão de débito'),
 (1, 'Cancelado', 'Pedido de eletrônicos', 12.0, 'Pix'),
 (4, 'Em processamento', 'Pedido de produtos de limpeza', 8.5, 'Cartão de crédito'),
(4, 'Confirmado', 'Pedido de produtos de limpeza', 7.0, 'Pix'),
 (1, 'Cancelado', 'Pedido de utilitarios ', 12.0, 'Boleto'),
 (3, 'Em processamento', 'Pedido de notbooks', 8.5, 'Cartão de crédito'),
(5, 'Confirmado', 'Pedido de acessórios', 7.0, 'Pix'),
 (4, 'Cancelado', 'Pedido de celulares', 12.0, 'Cartão de crédito');

select * from pedido;


	/*estoque*/

INSERT INTO estoque (categoria, quantidade)
VALUES ('Brinquedos', 100), ('Utilitarios', 100),
('Cozinha', 200), ('Esporte', 50),
('Tecnologia', 50), ('Limpeza', 100);

select * from estoque;


	/*fornecedor*/

INSERT INTO fornecedor (cnpj, nome_social, telefone)
VALUES ('12345678901234', 'Fornecedor A', '987654321'),
 ('56015623789478', 'Fornecedor B', '843251760'),
('93456018902712', 'Fornecedor C', '214309765'),
 ('58947856236017', 'Fornecedor D', '843251760'),
('74560189932012', 'Fornecedor E', '765214309'),
('58902793412601', 'Fornecedor F', '230976145');

select * from fornecedor;


	/*vendedor*/

INSERT INTO vendedor (nome_social, local, nome_ficticio, telefone, cnpj, cpf)
VALUES ('Vendedor João', 'Loja 1', 'LojaX', '123456789', '98765432101234', NULL),
 ('Vendedor Luis', 'Loja 2', 'LojaY', '987654321', NULL, '12345678901'),
('Vendedor Carlin', 'Loja 3', 'LojaZ', '876543210', '56789012304567', NULL),
 ('Vendedor Marcin', 'Loja 4', 'LojaW', '987654321', NULL, '12345678902');

select * from vendedor;


	/*estoque-local*/

INSERT INTO estoque_local (id_estoque, id_produto, local)
VALUES (1, 1, 'Loja 1'), (1, 2, 'Loja 1'),
       (2, 3, 'Loja 2'), (3, 4, 'Loja 3'),
        (4, 5, 'Loja 2'), (4, 6, 'Loja 3'),
       (5, 7, 'Loja 4'), (5, 8, 'Loja 5') ,
       (6, 9, 'Loja 1'), (5, 10, 'Loja 2'),
       (2, 11, 'Loja 3'), (6, 11, 'Loja 4');
	   
select * from estoque_local;


	/*produto-fornecedor*/

INSERT INTO produto_fornecedor (id_fornecedor, id_produto, quantidade)
VALUES (1, 1, 50),(1, 2, 100),
       (2, 3, 75),(3, 4, 30),
       (4, 5, 60),(5, 6, 45),
       (2, 7, 25),(3, 8, 40),
       (4, 9, 55),(5, 10, 70),
       (1, 11, 15),(2, 12, 30);

select * from produto_fornecedor;

	/*produto-vendedor*/

INSERT INTO produto_vendedor (id_produto, id_vendedor, quantidade)
VALUES (2, 3, 12), (3, 1, 8),
       (4, 2, 5), (6, 4, 15),
       (6, 3, 12), (4, 1, 8),
       (3, 2, 5), (5, 4, 15);

select * from produto_vendedor;

	/*produto-pedido*/

INSERT INTO produto_pedido (id_produto, id_pedido, quantidade)
VALUES (1, 1, 5), (2, 1, 3),
       (3, 2, 2), (4, 3, 4),
       (5, 3, 1), (6, 4, 2);
       
select * from produto_pedido;

