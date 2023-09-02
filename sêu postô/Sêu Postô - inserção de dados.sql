    /*  rascunho de esquema relacional - sgbd
        sêu postô - busca econômica para abastecimento(estudo)
    */
INSERT INTO cliente (nome_cliente, cpf, veiculo) VALUES
    ('João Silva', '12345678901', 'Automòvel'),
    ('Maria Santos', '98765432109', 'Motocicleta'),
    ('Pedro Oliveira', '23456789012', 'Elétrico'),
    ('Ana Pereira', '34567890123', 'Motocicleta'),
    ('Carlos Fernandes', '45678901234', 'Caminhão'),
    ('Laura Santos', '56789012345', 'Automòvel'),
    ('Ricardo Pereira', '67890123456', 'Motocicleta'),
    ('Camila Oliveira', '78901234567', 'Elétrico'),
    ('Lucas Fernandes', '89012345678', 'Motocicleta'),
    ('Fernanda Souza', '90123456789', 'Caminhão');


INSERT INTO proprietario (nome_proprietario, cnpj) VALUES
    ('Posto A', '12345678901234'),
    ('Posto B', '56789012345678'),
    ('Posto C', '90123456789012'),
    ('Posto D', '34567890123456'),
    ('Posto E', '78901234567890');
    
INSERT INTO associacao (nome_associacao, id_proprietario) VALUES
    ('Associação X', 1),
    ('Associação Y', 2),
    ('Associação Z', 3),
    ('Associação W', 4),
    ('Associação V', 5);

INSERT INTO local (nome_local, endereco, id_proprietario, id_associacao) VALUES
    ('Local 1', 'Endereço 1', 1, 1),
    ('Local 2', 'Endereço 2', 2, 1),
    ('Local 3', 'Endereço 3', 3, 2),
    ('Local 4', 'Endereço 4', 4, 2),
    ('Local 5', 'Endereço 5', 5, 3),
    ('Local 1', 'Endereço 1', 1, 1),
    ('Local 2', 'Endereço 2', 2, 1),
    ('Local 3', 'Endereço 3', 3, 2),
    ('Local 4', 'Endereço 4', 4, 2),
    ('Local 5', 'Endereço 5', 5, 3)

INSERT INTO franquia (nome_franquia, franquia_tipo, id_associacao) VALUES
    ('Franquia A', 'Hotel', 1),
    ('Franquia B', 'Restaurante', 2),
    ('Franquia C', 'Loja de conveniência', 3),
    ('Franquia D', 'Hotel', 4),
    ('Franquia E', 'Setores privados', 5);
    

INSERT INTO cliente_posto (id_cliente, id_local, quantidade_consumo, consumo, pagamento) VALUES
    (1, 1, 2, 'Gasolina comum', 'Cartão de crédito'),
    (2, 2, 1, 'Etanol', 'Dinheiro'),
    (3, 3, 3, 'Diesel', 'Cartão de débito'),
    (4, 4, 2, 'Gasolina aditivada', 'Pix'),
    (5, 5, 4, 'Etanol aditivado', 'Dinheiro'),
    (1, 10, 2, 'Gasolina comum', 'Cartão de crédito'),
    (2, 1, 1, 'Etanol', 'Dinheiro'),
    (3, 10, 3, 'Diesel', 'Cartão de débito'),
    (10, 4, 2, 'Gasolina aditivada', 'Pix'),
    (5,2, 4, 'Etanol aditivado', 'Dinheiro'),
    (6, 2, 2, 'Gasolina comum', 'Cartão de crédito'), 
    (7, 3, 1, 'Etanol', 'Dinheiro'), 
    (8, 4, 3, 'Diesel', 'Cartão de débito'), 
    (9, 5, 2, 'Gasolina aditivada', 'Pix'),
    (10, 1, 4, 'Etanol aditivado', 'Dinheiro'); 

INSERT INTO cliente_franquia (id_cliente, id_franquia, consumo_franquia, pagamento) VALUES
    (1, 1, 'Hotel', 'Dinheiro'),
    (2, 2, 'Restaurante', 'Pix'),
    (3, 3, 'Loja de conveniência', 'Cartão de crédito'),
    (4, 4, 'Setores privados', 'Dinheiro'),
    (5, 5, 'Hotel', 'Cartão de débito');
