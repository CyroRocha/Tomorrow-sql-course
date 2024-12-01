create table Departamento (
	n_dep int not null auto_increment,
    nome varchar(50) not null,
    data_criacao date not null,
    primary key (n_dep)
);

insert into Departamento (nome,data_criacao) values ("Dpt A", "2019-05-22");
insert into Departamento (nome,data_criacao) values ("Dpt B", "2019-03-21");
insert into Departamento (nome,data_criacao) values ("Dpt C", "2019-04-29");
insert into Departamento (nome,data_criacao) values ("Dpt D", "2019-07-08");

create table Categoria (
	nome_categoria varchar(50) not null,
    salario decimal(10,2) not null,
    primary key(nome_categoria)
);

insert into Categoria (nome_categoria,salario) values ("Cat A", 850);
insert into Categoria (nome_categoria,salario) values ("Cat B", 1250);
insert into Categoria (nome_categoria,salario) values ("Cat C", 1855);

create table Empregado (
	cod_emp int not null auto_increment,
    nome varchar(50) not null,
    nome_categoria varchar(50) not null,
    primary key(cod_emp),
    foreign key (nome_categoria) references Categoria (nome_categoria)
);

insert into Empregado (nome,nome_categoria) values ("João","Cat A");
insert into Empregado (nome,nome_categoria) values ("José","Cat A");
insert into Empregado (nome,nome_categoria) values ("Maria","Cat A");
insert into Empregado (nome,nome_categoria) values ("Ricardo","Cat B");
insert into Empregado (nome,nome_categoria) values ("Luan","Cat C");
insert into Empregado (nome,nome_categoria) values ("Renato","Cat B");
insert into Empregado (nome,nome_categoria) values ("Paulo","Cat C");
insert into Empregado (nome,nome_categoria) values ("Fernanda","Cat C");
insert into Empregado (nome,nome_categoria) values ("Antonia","Cat C");
insert into Empregado (nome,nome_categoria) values ("Alexandre","Cat B");
insert into Empregado (nome,nome_categoria) values ("Alex","Cat A");

create table Projeto (
	cod_proj int not null auto_increment,
    tipo varchar(30) not null,
    descr varchar(50) not null,
    n_dep int not null,
    primary key(cod_proj),
    foreign key (n_dep) references Departamento (n_dep)
);

insert into Projeto (tipo, descr, n_dep) values ("Desenvolvimento","Proj de Desenvolvimento de Jogos",1);
insert into Projeto (tipo, descr, n_dep) values ("Suporte","Suporte Operacional",2);
insert into Projeto (tipo, descr, n_dep) values ("Didática","Projeto Didática",3);
insert into Projeto (tipo, descr, n_dep) values ("Extensão Rural","Projeto Agricultura",1);
insert into Projeto (tipo, descr, n_dep) values ("Excel","Projeto Ensino de Excel",2);
insert into Projeto (tipo, descr, n_dep) values ("Word","Projeto Ensino de Word",4);
insert into Projeto (tipo, descr, n_dep) values ("LibreOffice","Projeto Ensino de LibreOffice",2);
insert into Projeto (tipo, descr, n_dep) values ("Turismo","Projeto Turismo",1);


create table Proj_Emp (
	cod_emp int not null,
    cod_proj int not null,
    data_ini date not null,
    temp_emp int not null,
	primary key (cod_emp, cod_proj),
    foreign key (cod_emp) references Empregado (cod_emp),
    foreign key (cod_proj) references Projeto (cod_proj)
);

insert into Proj_Emp (cod_emp, cod_proj,data_ini, temp_emp) values (1,1,"2019-04-05",5);
insert into Proj_Emp (cod_emp, cod_proj,data_ini, temp_emp) values (1,2,"2019-06-25",8);
insert into Proj_Emp (cod_emp, cod_proj,data_ini, temp_emp) values (1,4,"2019-04-05",10);
insert into Proj_Emp (cod_emp, cod_proj,data_ini, temp_emp) values (1,3,"2019-07-01",5);
insert into Proj_Emp (cod_emp, cod_proj,data_ini, temp_emp) values (2,1,"2019-04-05",2);
insert into Proj_Emp (cod_emp, cod_proj,data_ini, temp_emp) values (2,4,"2019-10-11",12);
insert into Proj_Emp (cod_emp, cod_proj,data_ini, temp_emp) values (3,1,"2019-04-05",2);
insert into Proj_Emp (cod_emp, cod_proj,data_ini, temp_emp) values (3,2,"2019-04-05",14);
insert into Proj_Emp (cod_emp, cod_proj,data_ini, temp_emp) values (4,1,"2019-04-05",5);
insert into Proj_Emp (cod_emp, cod_proj,data_ini, temp_emp) values (4,3,"2019-04-05",12);
insert into Proj_Emp (cod_emp, cod_proj,data_ini, temp_emp) values (5,2,"2019-04-05",6);
insert into Proj_Emp (cod_emp, cod_proj,data_ini, temp_emp) values (5,3,"2019-04-05",7);
insert into Proj_Emp (cod_emp, cod_proj,data_ini, temp_emp) values (6,1,"2019-04-05",8);
insert into Proj_Emp (cod_emp, cod_proj,data_ini, temp_emp) values (7,4,"2019-04-05",6);
insert into Proj_Emp (cod_emp, cod_proj,data_ini, temp_emp) values (8,2,"2019-04-05",3);
insert into Proj_Emp (cod_emp, cod_proj,data_ini, temp_emp) values (9,4,"2019-04-05",3);