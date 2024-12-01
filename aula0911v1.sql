create database aula0911v1;

use aula0911v1;

create table Produto (
	cod_prod varchar(5) not null,
    nome varchar(30) not null,
    primary key(cod_prod)
);


insert into Produto (cod_prod, nome) values ("111","Detergente"), ("222","Sabonete");


create table Estoque (
	cod_estoque varchar(5) not null,
    nome varchar(30) not null,
    primary key(cod_estoque)
);
insert into Estoque (cod_estoque, nome) values ("123","Est A"), ("456","Est B");


create table Prod_Est (
	cod_prod varchar(5) not null,
    cod_estoque varchar(5) not null,
    qtd int not null,
    primary key(cod_estoque, cod_prod),
    foreign key(cod_prod) references Produto (cod_prod),
    foreign key(cod_estoque) references Estoque (cod_estoque)
);

insert into Prod_Est (cod_prod,cod_estoque, qtd) values ("111","123",10), ("222","456",20);

create table Venda_Item(
	cod_venda int not null auto_increment,
    cod_prod varchar(5) not null,
    cod_estoque varchar(5) not null,
    qtd_venda int not null,
    primary key(cod_venda),
    foreign key(cod_prod) references Produto (cod_prod),
    foreign key(cod_estoque) references Estoque (cod_estoque)
);


Delimiter $$
Create Trigger Venda_atualização after insert on Venda_Item
	for each row
		begin
			update Prod_Est set qtd = qtd-new.qtd_venda
				where cod_prod = new.cod_prod and
                cod_estoque = new.cod_estoque;
        end $$
Delimiter ;

show triggers;

select * from Prod_Est;

insert into Venda_Item(cod_prod, cod_estoque, qtd_venda)
	values ("111", "123", 5);

insert into Venda_Item(cod_prod, cod_estoque, qtd_venda)
	values ("222", "456", 10);

select * from Prod_Est;

Delimiter $$
Create Trigger validar_venda before insert on Venda_Item
	for each row
		begin
        set @Qtd_Estoque = (select qtd from Prod_Est 
			where cod_prod = new.cod_prod and cod_estoque = new.cod_estoque);
		if (new.qtd_venda > @Qtd_Estoque) then
				signal sqlstate "04000" set message_text = "Quantidade inválida";
		end if;
        end $$
Delimiter ;

insert into Venda_Item(cod_prod, cod_estoque, qtd_venda)
	values ("111", "123", 14);

select * from Produto;

