create database lojinha;

use lojinha;

create table tbclientes(
    idcli int primary key auto_increment,
    nome varchar(50) not null,
    fone varchar(15) not null,
    cpf varchar(15) not null    
);

describe tbclientes;

insert into tbclientes(nome,fone,cpf)
values('Lucas dos Anjos','99999-9999','12345678999');

insert into tbclientes(nome,fone,cpf)
values('Jose de Assis','99999-9999','12345678999');

insert into tbclientes(nome,fone,cpf)
values('Edilson','99999-9999','12345678999');

select * from tbclientes;

create table tbprodutos(
	idpro int primary key auto_increment,
    produto varchar(50) not null,
    valor decimal(10,2),
    quantidade int not null
);

describe tbprodutos;

insert into tbprodutos(produto,valor,quantidade)
values('Suco',3.00,400);

insert into tbprodutos(produto,valor,quantidade)
values('Red Bull',7.00,200);

insert into tbprodutos(produto,valor,quantidade)
values('Agua',1.00,500);

insert into tbprodutos(produto,valor,quantidade)
values('Refrigerante',5.00,300);

insert into tbprodutos(produto,valor,quantidade)
values('Monster',6.00,200);

select * from tbprodutos;

create table tbpedidos(
	idpedido int primary key auto_increment,
    dataped timestamp default current_timestamp,
    idcli int not null,
    idpro int not null,
    foreign key(idcli) references tbclientes(idcli),
    foreign key(idpro) references tbprodutos(idpro)
);

describe tbpedidos;

insert into tbpedidos(idcli,idpro) values (1,1);

insert into tbpedidos(idcli,idpro) values (1,2);

insert into tbpedidos(idcli,idpro) values (2,3);

insert into tbpedidos(idcli,idpro) values (2,4);

insert into tbpedidos(idcli,idpro) values (3,1);

insert into tbpedidos(idcli,idpro) values (3,2);

insert into tbpedidos(idcli,idpro) values (3,3);

insert into tbpedidos(idcli,idpro) values (3,4);

select * from tbpedidos
inner join tbclientes
on tbpedidos.idcli = tbclientes.idcli
inner join tbprodutos
on tbpedidos.idpro = tbprodutos.idpro;

select
P.idpedido as Pedido,
A.nome as cliente,
C.produto,valor
from tbpedidos as P
inner join tbclientes as A
on (P.idcli = A.idcli)
inner join tbprodutos as C
on (P.idpro = C.idpro);

select sum(valor) as Total from tbprodutos;






