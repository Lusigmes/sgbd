	/*	rascunho de esquema relacional - sgbd
		sêu postô - busca econômica para abastecimento(estudo)
	*/

create database seuposto;

create type tipo_veiculo as enum('Automòvel', 'Motocicleta', 'Elétrico', 'ônibus','Microônibus', 'Caminhão');
create type tipo_pagamento as enum('Dinheiro', 'Cartão de crédito', 'Cartão de débito', 'Pix');
create type tipo_consumo as enum('Gasolina comum','Gasolina aditivada', 'Etanol', 'Etanol aditivado','Diesel','Gás Natural(GNV)', 'Gasolina formulada','Recarga Elétrica');
create type tipo_franquia as enum('Hotel', 'Restaurante','Loja de conveniência','Setores privados');

create table cliente(
	id_cliente serial constraint pk_id_cliente primary key,
	nome_cliente varchar(100) not null,
	cpf varchar(11) not null,
	veiculo tipo_veiculo not null default 'Automòvel',
	constraint unique_cpf_cliente unique(cpf)
	
);

create table proprietario(
	id_proprietario serial constraint pk_id_proprietario primary key,
	nome_proprietario varchar(100) not null,
	cnpj varchar(15) not null,
	constraint unique_cnpj_proprietario unique(cnpj)
);

create table associacao(
	id_associacao serial constraint pk_id_associacao primary key,
	nome_associacao varchar(50) not null,
	id_proprietario integer not null,
	constraint fk_id_proprietario_a foreign key(id_proprietario) references proprietario(id_proprietario)
);

create table local(
	id_local serial constraint pk_id_local primary key,
	nome_local varchar(50) not null,
	endereco varchar(255) not null,
	id_proprietario integer not null,
	id_associacao integer,
	constraint fk_id_proprietario_l foreign key(id_proprietario) references proprietario(id_proprietario),
	constraint fk_id_associacao_l foreign key(id_associacao) references associacao(id_associacao)
);

create table franquia(
	id_franquia serial constraint pk_id_franquia primary key,
	nome_franquia varchar(50) not null,
	franquia_tipo tipo_franquia not null default 'Loja de conveniência',
	id_associacao integer not null,
	constraint fk_id_associacao_f foreign key(id_associacao) references associacao(id_associacao)
	
);

create table cliente_posto(
	id_cliente integer,
	id_local integer,
	quantidade_consumo integer default 1,
	consumo tipo_consumo default 'Gasolina comum',
	pagamento tipo_pagamento default 'Dinheiro',
	primary key(id_cliente, id_local),
	constraint pk_id_cliente_pc foreign key(id_cliente) references cliente(id_cliente),
	constraint pk_id_local_pc foreign key(id_local) references local(id_local)
);

create table cliente_franquia(
	id_cliente integer,
	id_franquia integer,
	consumo_franquia tipo_franquia default 'Loja de conveniência',
	pagamento tipo_pagamento default 'Dinheiro',
	primary key(id_cliente, id_franquia),
	constraint pk_id_cliente_cf foreign key(id_cliente) references cliente(id_cliente),
	constraint pk_id_franquia_cf foreign key(id_franquia) references franquia(id_franquia)
);

