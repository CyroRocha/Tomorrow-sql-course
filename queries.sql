create table Aluno (
  IdAluno int auto_increment primary key not null,
  Matricula varchar(20) not null unique,
  Nome varchar(255) not null,
  DataIngresso Date default "2002-02-12" not null,
  score double not null, 
  TipoAluno Enum("Medio", "Superior")
);


insert into Aluno (Matricula, Nome, DataIngresso,score, TipoAluno) values
  ("111", "Joao", "2023-01-10", 7.2, "Superior"),
  ("222", "Maria", "2024-02-02", 9.2, "Superior"),
  ("333", "Jose", "2024-06-11", 5.2, "Superior"),
  ("444", "Carla", "2019-07-15", 7.2, "Medio"),
  ("555", "Joana", "2020-01-10", 7.9, "Medio"),
  ("666", "Ana", "2021-01-22", 7.1, "Medio");

select * from Aluno;

select Matricula, Nome from Aluno;

select *
from Aluno
where score >7.5;


select Matricula as "Matricula do aluno", Nome as "Nome aluno" from Aluno;

select *
from Aluno
where score = 7.2 ;


SELECT * FROM Aluno WHERE CAST(score as decimal(5,2)) = 7.2;
SELECT * FROM Aluno WHERE ROUND(score,2) = 7.2;

select  date_format (DataIngresso, "%d/%m/%y") AS "Data do Ingresso" from aluno;
select  date_format (DataIngresso, "%D/%M/%Y") AS "Data do Ingresso" from aluno;

select year(DataIngresso) from Aluno;
select Month(DataIngresso) from Aluno;
select Day(DataIngresso) from Aluno;

select * from Aluno;

select
Matricula as "Matricula do aluno",
Nome as "Nome aluno"
from Aluno
WHERE score > 6
ORDER by Nome;

select *
from Aluno
order By score desc;


select Matricula, Nome, score
from Aluno
WHERE TipoAluno = "Superior"
ORDER BY score asc;

select * 
from Aluno
where Nome like "J%";

select * 
from Aluno
where Nome like"%J%";

Select *
from Aluno
where nome like "%A";

alter table Aluno 
ADD NomeCurso varchar(255);

update Aluno set NomeCurso = "Letras" 
where Matricula = "111" or Matricula = "222";

#WRONG WAY
select * 
from aluno
where NomeCurso = NULL;

#CORRECT WAY
select *
FROM aluno
where NomeCurso IS NULL;

#CORRECT WAY
select *
FROM aluno
where NomeCurso IS NOT NULL;



#FUNÇAO DE AGREGAÇÃO (COUNT, MAX, MIN, AVG, SUM, VARIANCE)
SELECT COUNT(IdAluno) as "Quant de Alunos"
FROM aluno;

select COUNT(TipoAluno = "Superior") as " Quant Alunos Superior"
from aluno
WHERE TipoAluno = "Superior";

select MAX(score) as "Maior Nota"
from aluno;

select MIN(score) as "Menor nota"
from aLUNO;

select AVG(score) as "Media" 
from aluno;

select ROUND(VARIANCE(score),2) as "Variancia"
from aluno;

select score, Nome
from aluno
ORDER BY score desc
limit 1;

select max(score)
  from aluno;

select Nome, score from aluno where score = (select max(score) from aluno);

insert into Aluno (Matricula, Nome, DataIngresso,score, TipoAluno) values
  ("777", "Ricardo", "2023-01-10", 9.2, "Superior");

select Nome, score from aluno where score = (select max(score) from aluno);

insert into Aluno (Matricula, Nome, DataIngresso,score, TipoAluno) values
  ("888", "Lucas", "2023-01-10", 9.4, "Superior");

select Nome, score 
  from aluno 
  where score = (select max(score)
    from aluno);


select AVG(score)
  from aluno
  where TipoAluno = "Superior";

select Nome, score
  from Aluno
  where score > (select AVG(score)
    from aluno 
    where TipoAluno = "Superior")
  ORDER BY Nome asc;
  
select * from aluno;

select "Finish";

