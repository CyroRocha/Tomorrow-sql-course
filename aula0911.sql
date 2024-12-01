create database aulatomorrow0811;

show databases;

use aulatomorrow0811;

CREATE TABLE Aluno (
  idAluno int PRIMARY KEY auto_increment not null,
  matricula varchar(20) unique NOT NULL,
  nome varchar(255),
  dataIngresso date NOT NULL,
  score decimal(10,2) not null,
  tipoAluno enum ("Médio", "Superior")
);

INSERT INTO Aluno (matricula, nome, dataIngresso, score, tipoAluno) 
            values  ("111", "João", "2023-01-10", 7.2, "superior"),
                    ("222", "Maria", "2024-02-02", 9.2, "superior"),
                    ("333", "José", "2020-06-11", 5.2, "superior"),
                    ("444", "Carla", "2019-07-15", 3.2, "medio"),
                    ("555", "Joana", "2020-01-10", 4.9, "medio"),
                    ("666", "Ana", "2021-01-22", 4.1, "medio");

SELECT AVG(score) from Aluno WHERE tipoAluno = "superior";

SELECT AVG(score) from Aluno WHERE tipoAluno = "medio";

SELECT tipoAluno, avg(score) as media from Aluno group by tipoAluno;

ALTER table Aluno change tipoAluno tipoAluno enum ("Médio", "Superior", "Tecnico");

INSERT INTO Aluno (matricula, nome, dataIngresso, score, tipoAluno) 
			values ("777", "John", "2024-08-11", 7.1, "tecnico");

SELECT tipoAluno, avg(score) from Aluno group by tipoAluno;

SELECT tipoAluno, avg(score) as media from Aluno 
			group by tipoAluno having avg(score)>7.0;

CREATE TABLE TabelaA(
  Nome varchar(50) not null,
  primary key(Nome)
);

CREATE TABLE TabelaB(
  Nome varchar(50) not null,
  primary key(Nome)
);

INSERT INTO TabelaA VALUES('Fernando');
INSERT INTO TabelaA VALUES('João');
INSERT INTO TabelaA VALUES('Luiz');
INSERT INTO TabelaA VALUES('Maria');

INSERT INTO TabelaB VALUES('Carla');
INSERT INTO TabelaB VALUES('Fernando');
INSERT INTO TabelaB VALUES('Francisco');
INSERT INTO TabelaB VALUES('Luiz');

SELECT A.nome, B.nome from TabelaA A 
		inner join TabelaB B on A.nome = B.nome;

SELECT A.nome, B.nome from TabelaA A 
		left join TabelaB B on A.nome = B.nome;

SELECT A.nome, B.nome from TabelaA A 
		right join TabelaB B on A.nome = B.nome;

SELECT A.nome, B.nome from TabelaA A 
		left join TabelaB B on A.nome = B.nome
        union
        SELECT A.nome, B.nome from TabelaA A 
			right join TabelaB B on A.nome = B.nome;

SELECT A.nome, B.nome from TabelaA A 
		left join TabelaB B on A.nome = B.nome where B.nome IS null;

SELECT A.nome, B.nome from TabelaA A 
		right join TabelaB B on A.nome = B.nome where A.nome IS null;
        
SELECT A.nome, B.nome from TabelaA A 
		left join TabelaB B on A.nome = B.nome where B.nome IS null
        union
SELECT A.nome, B.nome from TabelaA A 
		right join TabelaB B on A.nome = B.nome where A.nome IS null;

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
insert into Departamento (nome,data_criacao) values ("Dpt E", "2019-08-09");
insert into Departamento (nome,data_criacao) values ("Dpt F", "2019-10-12");

create table Categoria (
	nome_categoria varchar(50) not null,
    salario decimal(10,2) not null,
    primary key(nome_categoria)
);

insert into Categoria (nome_categoria,salario) values ("Cat A", 850);
insert into Categoria (nome_categoria,salario) values ("Cat B", 1250);
insert into Categoria (nome_categoria,salario) values ("Cat C", 1855);
insert into Categoria (nome_categoria,salario) values ("Cat D", 1300);
insert into Categoria (nome_categoria,salario) values ("Cat E", 1100);

create table Empregado (
	cod_emp int not null auto_increment,
    nome varchar(50) not null,
    nome_categoria varchar(50) not null,
    primary key(cod_emp),
    foreign key (nome_categoria) references Categoria (nome_categoria)
);

insert into Empregado (nome,nome_categoria) values ("Pablo","Cat C");
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
insert into Empregado (nome,nome_categoria) values ("Joaquim","Cat D");

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
insert into Projeto (tipo, descr, n_dep) values ("SQL","Projeto SQL",6);


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
 
SELECT D.nome, P.tipo from Departamento D join Projeto P on D.n_dep = P.n_dep; 

SELECT D.nome, P.tipo from Departamento D, Projeto P where D.n_dep = P.n_dep;

SELECT C.nome_categoria from Categoria C left join Empregado E on C.nome_categoria = E.nome_categoria where E.nome_categoria IS NULL;        

SELECT D.nome, D.n_dep, count(*) from Departamento D join Projeto P on D.n_dep = P.n_dep group by D.n_dep having count(*) > 2;        

SELECT D.nome, D.n_dep from Departamento D join Projeto P on D.n_dep = P.n_dep group by D.n_dep having count(*) > 2; 

set @x = 15;

DELIMITER $$
CREATE function dobrar(valor int) returns int deterministic
	begin
		set valor = valor*2;
        return valor;
    end $$
DELIMITER ;   

select dobrar(@x);
DELIMITER $$
CREATE function qtdDEP() returns int deterministic
	begin
		declare n int;
        select count(*) into n from Departamento;
        return n;
    end $$
DELIMITER ;  

select qtdDEP();

DELIMITER $$
CREATE function qtdEmp(valor float) returns int deterministic
	begin 
		declare n int;
        select count(*)  into n from Categoria C join Empregado E on C.nome_categoria = E.nome_categoria where C.salario > valor;
		return n;
	end $$	
DELIMITER ; 

select qtdEmp(800);

delimiter $$
create Procedure proc1() 
	begin
		select * from Empregado;

	end $$
Delimiter ;

show procedure status;
call proc1;

Delimiter $$

create Procedure ListaEmpregadosporProjeto(projeto varchar(30))
	begin
		select E.nome from Empregado E 
        join Proj_Emp PE 
        on  E.cod_emp = PE.cod_emp 
		join Projeto P
		on PE.cod_proj = P.cod_proj
		where P.tipo = projeto;
        
    end $$

Delimiter ; 	

call ListaEmpregadosporProjeto("suporte");

Delimiter $$

create Procedure NewDepartamento(Nome varchar(50), DatadeCriacao date)
	begin
		insert into Departamento (nome,data_criacao)
        values (Nome, DatadeCriacao);
    end $$
Delimiter ; 	

call NewDepartamento("Dpt H", "2024-11-09");

