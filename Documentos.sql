create database aula0811;
show databases;
use aula0811;

CREATE TABLE Aluno (
  idAluno int PRIMARY KEY auto_increment not null,
  matricula varchar(20) unique NOT NULL,
  nome varchar(255),
  dataIngresso date NOT NULL,
  score Decimal(5,2) not null,
  tipoAluno enum ("Médio", "Superior")
);

INSERT INTO Aluno (matricula, nome, dataIngresso, score, tipoAluno) 
            values  ("111", "João", "2023-01-10", 7.2, "superior"),
                    ("222", "Maria", "2024-02-02", 9.2, "superior"),
                    ("333", "José", "2020-06-11", 5.2, "superior"),
                    ("444", "Carla", "2019-07-15", 3.2, "medio"),
                    ("555", "Joana", "2020-01-10", 4.9, "medio"),
                    ("666", "Ana", "2021-01-22", 4.1, "medio");
                    
select * from Aluno;

select avg(score) from Aluno where TipoAluno = "Superior";
select avg(score) from Aluno where TipoAluno = "Medio";

select tipoAluno, Avg(score) as Media from Aluno
	group by tipoAluno;
    
alter table Aluno change tipoAluno tipoAluno enum("Médio", "Superior","tecnico");

iNSERT INTO Aluno (matricula, nome, dataIngresso, score, tipoAluno) 
            values  ("777", "Jonny", "2024-01-10", 7.1, "tecnico");
            
select tipoAluno, avg(score) as media
	from Aluno
    group by tipoAluno
    having avg(score)>7.0;
    
    
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

select * from TabelaA;
select * from TabelaB;


select A.nome, B.nome from TabelaA A
	inner JOIN TabelaB B on A.nome = B.nome;
    
select A.nome, B.nome from TabelaA A
	Left JOIN TabelaB B on A.nome = B.nome;
    
select A.nome, B.nome from TabelaA A
	right JOIN TabelaB B on A.nome = B.nome;
    
select A.nome, B.nome from TabelaA A
	 left JOIN TabelaB B on A.nome = B.nome
     union
     select A.nome, B.nome from TabelaA A
	right JOIN TabelaB B on A.nome = B.nome;
        
select A.nome, B.nome from TabelaA A
	left JOIN TabelaB B on A.nome = B.nome
    where B.nome is null;
    
select A.nome, B.nome from TabelaA A
	right JOIN TabelaB B on A.nome = B.nome
    where A.nome is null;
    
SELECT A.nome,B.nome FROM TabelaA A
LEFT JOIN TabelaB B ON A.nome = B.nome
WHERE B.nome  IS NULL
UNION ALL
SELECT A.nome,B.nome FROM TabelaA A
RIGHT JOIN TabelaB B ON A.nome = B.nome
WHERE  A.nome IS NULL