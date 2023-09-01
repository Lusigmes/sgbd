		/*4.CONSULTAS*/
/*1.
Selecione todos os produtos da categoria 'Brinquedos' 
com avaliação maior ou igual a 4.5, ordenados por nome 
do produto em ordem crescente.
*/
select produto_nome, categoria, avaliacao
from produto where categoria = 'Brinquedos' and avaliacao >= 4.5
order by produto_nome asc;

/*2.
Selecionar todos os pedidos que têm um fret
e superior a 10 e que foram confirmados (status igual a 'Confirmado')*/
select * from pedido
where frete > 5.0 and status = 'Confirmado';

/*3.
Listar os nomes e CPFs de clientes que fizeram pelo menos 2 pedidos.
*/
select c.p_nome, c.cpf
from cliente c
inner join pedido p on c.id_cliente = p.id_cliente
group by c.p_nome, c.cpf
having count(p.id_pedido) >= 2;

/*4.
Listar todos os produtos que estão em estoque na 'Loja 1'.
*/
select p.produto_nome, e.local
from produto p
inner join estoque_local e on p.id_produto = e.id_produto
where e.local = 'Loja 1';

/*5.
Selecionar todos os fornecedores que têm mais de
50 unidades de produtos em estoque.
*/
select f.nome_social, pf.quantidade
from fornecedor f
inner join produto_fornecedor pf on f.id_fornecedor = pf.id_fornecedor
where pf.quantidade > 50;

/*6.
Listar os nomes de todos os vendedores que também são fornecedores.
*/
select nome_social from id_vendedor
where cnpj is not null 
union select nome_social from fornecedor;


/*7.
Selecionar todos os produtos que foram pedidos pelo menos 1 vezes.
*/
select p.produto_nome, count(pp.id_pedido) as total_pedidos
from produto p
left join produto_pedido pp on p.id_produto = pp.id_produto
group by p.produto_nome
having count(pp.id_pedido) >= 1;


/*8. 
Listar todos os produtos que estão disponíveis na 
 'Loja 1' e têm uma avaliação maior ou igual a 4.0.
*/
select p.produto_nome, p.avaliacao
from produto p
inner join estoque_local el on p.id_produto = el.id_produto
where el.local = 'Loja 1' and p.avaliacao >= 4.0;


/*9.
Selecionar o nome do cliente que fez o pedido com o maior frete
*/
select c.p_nome, max(p.frete) as maior_frete
from cliente c
inner join pedido p on c.id_cliente = p.id_cliente group by p_nome;

/*10.
Listar o nome do cliente que realizou o maior 
número de compras (pedidos).*/
select c.p_nome, count(p.id_pedido) as total_compras
from cliente c
left join pedido p on p.id_cliente = c.id_cliente
group by c.p_nome
order by total_compras desc
limit 1;