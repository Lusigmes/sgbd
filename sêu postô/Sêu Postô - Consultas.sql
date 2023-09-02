 	/*  rascunho de esquema relacional - sgbd
        sêu postô - busca econômica para abastecimento(estudo)
    */
/*Listar todos os clientes e seus veículos:*/
select nome_cliente, veiculo from cliente;

/*Listar todas as associações e os nomes de seus proprietários*/
select a.nome_associacao, p.nome_proprietario
from associacao as a
join proprietario as p on a.id_proprietario = p.id_proprietario;

/* Mostrar o total de consumo de cada cliente em todos os locais*/
select c.nome_cliente, sum(cp.quantidade_consumo)
from cliente as c
left join cliente_posto as cp ON c.id_cliente = cp.id_cliente
group by c.nome_cliente;

/*. Encontrar os clientes que usam cartões de crédito como forma de pagamento*/
select c.nome_cliente
from cliente_posto pc
inner join cliente c on c.id_cliente = pc.id_cliente 
where pagamento = 'Cartão de crédito';


/*Listar todas as franquias em ordem alfabética*/
select nome_franquia
from franquia
order by nome_franquia asc;

/* Encontrar os locais com 3 ou mais  clientes associados*/
select l.nome_local, count(cp.id_cliente) as total_clientes
from local as l
left join cliente_posto as cp ON l.id_local = cp.id_local
group by l.nome_local
having count(cp.id_cliente) >= 3;

/*Mostrar os clientes que têm um veículo do tipo "Elétrico"*/
select nome_cliente from cliente
where veiculo = 'Elétrico';


/*Listar todas as associações e a quantidade de locais associados a cada uma:*/
select a.nome_associacao, count(l.id_local) as total_locais
from associacao as a
left join local as l ON a.id_associacao = l.id_associacao
group by a.nome_associacao;


/*Encontrar o cliente com o maior consumo de gasolina comum*/
select c.nome_cliente, max(cp.quantidade_consumo) as maior_consumo
from cliente as c
JOIN cliente_posto as cp ON c.id_cliente = cp.id_cliente
where cp.consumo = 'Gasolina comum'
group by c.nome_cliente
order by maior_consumo desc
limit 1;
select c.nome_cliente, max(cp.quantidade_consumo) as maior_consumo
from cliente as c
JOIN cliente_posto as cp ON c.id_cliente = cp.id_cliente
where cp.consumo = 'Gasolina comum'
group by c.nome_cliente
order by maior_consumo desc
limit 1;


/* Listar os locais que possuem pelo menos um cliente usando cartão de débito*/
select distinct l.nome_local
from local as l
join cliente_posto as cp on l.id_local = cp.id_local
where cp.pagamento = 'Cartão de débito';
