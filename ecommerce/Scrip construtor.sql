		/*2.SCRIPT SQL - POSTGRESQL*/
create database ecommerce;

create table cliente(
	id_cliente serial constraint pk_id_cliente primary key,
	p_nome varchar(20),
	minit char(3),
	s_nome varchar(20),
	cpf varchar(11) not null,
	endereco varchar(255),
	data_nascimento date,	
	constraint unique_cpf_cliente unique(cpf)
	);

select * from cliente;
drop table cliente;

create type categoria_produto as enum('Brinquedos','Utilitarios', 'Cozinha', 'Esporte', 'Limpeza', 'Tecnologia');
create table produto(
	id_produto serial constraint pk_id_produto primary key,
	classificacao_kids bool default false,
	produto_nome varchar(20),
	categoria categoria_produto not null,
	avaliacao float default 0,
	tamanho varchar(10) --dimensoes do produto
);

create type pedido_status as enum ('Em processamento', 'Confirmado', 'Cancelado');
drop type pedido_status
create type tipo_pagamento as enum ('Boleto', 'Pix', 'Cartão de crédito', 'Cartão de débito');

create table pedido( 
	id_pedido serial constraint pk_id_pedido primary key,
	id_cliente integer,
	status pedido_status default 'Em processamento',
	descricao varchar(255),
	frete float default 10,
	pagamento tipo_pagamento not null,
	constraint fk_id_cliente_pedido foreign key(id_cliente) 
	references cliente(id_cliente) 
	on update cascade
);

create table estoque(
	id_estoque serial constraint pk_id_estoque primary key,
	categoria categoria_produto not null,
	quantidade integer not null default 1
);

create table fornecedor(
	id_fornecedor serial constraint pk_id_fornecedor primary key,
	cnpj varchar(15) not null,
	nome_social varchar(255) not null,
	telefone varchar(15) not null,
	constraint unique_cnpj_fornecedor unique(cnpj)
);

create table vendedor(
	id_vendedor serial constraint pk_id_vendedor primary key,
	nome_social varchar(255) not null,
	local varchar(255),
	nome_ficticio varchar(255) not null,
	telefone varchar(15) not null,
	cnpj varchar(15),
	cpf varchar(11),
	constraint unique_cnpj_vendedor unique(cnpj),
	constraint unique_cpf_vendedor unique(cpf)

);

create table produto_fornecedor(
	id_fornecedor integer,
	id_produto integer,
	quantidade integer not null,
	primary key(id_produto, id_fornecedor),
	constraint fk_id_fornecedor_pf foreign key(id_fornecedor)
	references fornecedor(id_fornecedor),
	constraint fk_id_produto_pf foreign key(id_produto)
	references produto(id_produto)
);

create table produto_vendedor(
	id_produto integer,
	id_vendedor integer,
	quantidade integer default 1,
	primary key(id_produto,id_vendedor),
	constraint fk_id_vendedor_pv foreign key(id_vendedor)
	references vendedor(id_vendedor),
	constraint fk_id_produto_pv foreign key(id_produto)
	references produto(id_produto)
);

create table produto_pedido(
	id_produto integer,
	id_pedido integer,
	quantidade integer default 1,
	primary key(id_produto,id_pedido),
	constraint fk_id_pedido_pp foreign key(id_pedido)
	references pedido(id_pedido),
	constraint fk_id_produto_pp foreign key(id_produto)
	references produto(id_produto)

);

create table estoque_local(
	id_estoque integer,
	id_produto integer, 
	local varchar(255) not null,
	primary key(id_produto,id_estoque),
	constraint fk_id_estoque_el foreign key(id_estoque)
	references estoque(id_estoque),
	constraint fk_id_produto_el foreign key(id_produto)
	references produto(id_produto)

);
 