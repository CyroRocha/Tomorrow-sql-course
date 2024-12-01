# create database Projeto01Tomorrow;
# use Projeto01Tomorrow;

create table Pessoa (
  CPF varchar(11),
  Nome varchar(255) not null,
  DataNasc date default "1974-09-11",
  PRIMARY key(CPF)
);

create table Aluno(
  CPF varchar(11) primary key,
  Nome varchar(255),
  DataNasc Date default "2001-05-10",
  TipoAluno Enum("Medio", "superior"))

create table Departamento (
  IdDerp int auto_increment primary key,
  Nome varchar (255) not null
);

create TABLE Funcionario (
  IdFunc int primary key auto_increment ,
  Nome varchar(255) not null,
  Salario float not null,
  CPF varchar(11) ,
  IdDep int not null, 
  foreign key(IdDep) references Departamento(IdDerp)
  );
  
show tables;
show columns from Pessoa;
show columns from Departamento;
show columns from Funcionario;

#---------------------------------------------------------------------------------------
insert into Pessoa (CPF, Nome, DataNasc)
VALUES ("50483317020","Gilberto Gil", "1942-07-26");


insert into Pessoa (CPF, Nome, DataNasc) VALUES
  ("15604881074", "Maria Betania",null),
  ("80774910062", "Caetano Veloso", "1942-08-07"),
  ("29829502783", "Zeca pagodinho", null);
  
insert into Departamento (Nome) VALUES
  ("Finaceiro"),
  ("Recursos Humanos"),
  ("P&D");
  
insert into funcionario (Nome, salario, IdDep, CPF) Values 
  ("Gilbero Gil", 4500.75, 2, "50483317020"),
  ("Caetano Veloso", 4300.50, 1, "80774910062"),
  ("Maria Betania", 4400, 3, "15604881074"),
  ("Zeca pagodinho", 4000, 2, "29829502783");

#Select * from funcionario;

update funcionario set Nome = "Bezzera da silva"
  where IdFunc = 4;
update funcionario set salario = 18000
  where IdFunc = 1;
delete from funcionario
  where IdFunc = 2;
#delete from Departamento
#  where IdDerp = 2;

#select * from Pessoa;
#Select * from Departamento;
#Select * from funcionario;

show columns from Departamento;


alter table Departamento add
  DataCriacao Date default "2000-01-01";
show columns from Departamento;

alter table Departamento drop DataCriacao;
show columns from Departamento;

alter table Departamento rename column Nome to NomeDep;
show columns from Departamento;



#drop table Pessoa;
#show tables;

-- apaga o banco de dados
#drop database Projeto01Tomorrow;
