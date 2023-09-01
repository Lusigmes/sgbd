		/*5.RESPOSTAS PARA PERGUNTAS RELEVANTESS*/

/* Número de Pedidos por Cliente: */
select c.p_nome, COUNT(p.id_pedido) AS total_pedidos
from cliente c
LEFT JOIN pedido p on c.id_cliente = p.id_cliente
group by c.p_nome;


/* Produtos em Estoque por Categoria: */
select categoria, COUNT(produto_nome) AS total_produtos
from produto group by categoria;

/* Produtos Disponíveis na 'Loja 3' com Avaliação Maior ou Igual a 4.0: */
select p.produto_nome, p.avaliacao
from produto p
inner join estoque_local el on p.id_produto = el.id_produto
where el.local = 'Loja 3' and p.avaliacao >= 4.0;


/* Cliente com o Maior Frete em um Pedido: */
select c.p_nome, MAX(p.frete) AS maior_frete
from cliente c
inner join pedido p on c.id_cliente = p.id_cliente
group by c.p_nome;

/* Cliente com o Maior Número de Compras (Pedidos): */
select c.p_nome, COUNT(p.id_pedido) AS total_compras
from cliente c
LEFT JOIN pedido p on p.id_cliente = c.id_cliente
group by c.p_nome order by total_compras desc
limit 1;