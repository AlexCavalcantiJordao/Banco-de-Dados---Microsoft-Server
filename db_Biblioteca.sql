-- Curso de SQL - Introdução e grupos de comandos - SQL Server #1....
-- 2 - T-SQL - Bancos de Dados, SGBDR, Tipos de Dados - SQL Server....
-- 3 - T-SQL - CREATE DATABASE - Criar Banco de Dados - SQL Server....
-- 4 - T-SQL - CONSTRAINTS (Restrições) - PRIMARY KEY, NOT NULL, etc - SQL Server....
create database db_Biblioteca on primary(
	name = db_Biblioteca,
	filename = 'C:\SQL\db_Biblioteca.MDF',
	size = 6 mb,
	maxsize = 15 mb,
	filegrowth = 10%
)

use db_Biblioteca

sp_helpdb db_Biblioteca

-- 5 - T-SQL - CREATE TABLE - Criação de Tabelas - SQL Server....
create table tbl_Livro(
	ID_Livro smallint primary key identity(100,1),
	Nome_Livro varchar(50) not null,
	ISBN varchar(30) not null unique,
	ID_Autor smallint not null,
	Data_Pub datetime not null,
	Preco_Livro money not null
)

create table tbl_autores(
	ID_Autor smallint primary key,
	Nome_Autor varchar(50),
	Sobrenome_Autor varchar(60)
)

use db_Biblioteca

create table tbl_editoras(
	ID_Editora smallint primary key identity,
	Nome_Editora varchar(50) not null
)

-- use db_Biblioteca

sp_help tbl_autores

-- 6 - T-SQL - IDENTITY - Auto-incremento de valores em colunas - SQL Server....
create table tbl_teste_identidade(
	ID_Teste smallint primary key identity,
	valor smallint not null
)

insert into tbl_teste_identidade(valor)values(10)
insert into tbl_teste_identidade(valor)values(20)
insert into tbl_teste_identidade(valor)values(30)
insert into tbl_teste_identidade(valor)values(40)

select * from tbl_teste_identidade

-- 7 - T-SQL - ALTER e DROP TABLE - Alterar e Excluir Tabelas e Colunas - SQL Server....
use db_Biblioteca 

alter table tbl_Livro
drop column ID_Autor

alter table tbl_Livro
add ID_Autor smallint not null,
constraint fk_ID_Autor foreign key(ID_Autor)
references tbl_autores

alter table tbl_Livro
add ID_editora smallint not null,
constraint fk_id_editora foreign key(ID_editora)
references tbl_editoras

drop table tbl_teste_identidade

-- 8 - T-SQL - INSERT INTO ... VALUES - Inserir dados nas Tabelas - SQL Server...
insert into tbl_Autores(ID_Autor, Nome_Autor, Sobrenome_Autor)values(1, 'Daniel', 'Barret')
insert into tbl_Autores(ID_Autor, Nome_Autor, Sobrenome_Autor)values(2, 'Gerald', 'Carter')
insert into tbl_Autores(ID_Autor, Nome_Autor, Sobrenome_Autor)values(3, 'Mark', 'Sobell')
insert into tbl_Autores(ID_Autor, Nome_Autor, Sobrenome_Autor)values(4, 'Richard', 'Blum')

-- Inserir Dados na Tabela de Editora...
insert into tbl_editoras(Nome_Editora)values('Prenticel Hall')
insert into tbl_editoras(Nome_Editora)values('O´Reilly')
insert into tbl_editoras(Nome_Editora)values('Microsoft')
insert into tbl_editoras(Nome_Editora)values('Wiley')

use db_Biblioteca

-- Inserir Dados na Tabela de Livro...
insert into tbl_Livro(Nome_Livro, ISBN, Data_Pub, Preco_Livro, ID_Autor, ID_editora)values('Linux Command Line and Shell', 143858969, '20091221', 68.35, 5, 4)
insert into tbl_Livro(Nome_Livro, ISBN, Data_Pub, Preco_Livro, ID_Autor, ID_editora)values('SSH, the Secure Shell', 127657889, '20091221', 58.30, 1, 2)
insert into tbl_Livro(Nome_Livro, ISBN, Data_Pub, Preco_Livro, ID_Autor, ID_editora)values('Using Samba', 123456789, '20001221', 61.45, 2, 2)
insert into tbl_Livro(Nome_Livro, ISBN, Data_Pub, Preco_Livro, ID_Autor, ID_editora)values('Fedora', 143858087, '20083111', 78.35, 5, 4)
insert into tbl_Livro(Nome_Livro, ISBN, Data_Pub, Preco_Livro, ID_Autor, ID_editora)values('Windows Servers 2012 Inside', 127657234, '20003224', 48.30, 1, 2)
insert into tbl_Livro(Nome_Livro, ISBN, Data_Pub, Preco_Livro, ID_Autor, ID_editora)values('Microsoft Exchange', 123456570, '20003331', 31.45, 2, 2)

select * from tbl_Livro

-- 9 - T-SQL - TRUNCATE TABLE - Excluindo todos os dados de uma Tabela - SQL Server....
-- 10 - T-SQL - SELECT FROM - Consultas simples a uma Tabela - SQL Server....
use db_Biblioteca

select Nome_Autor from tbl_autores

Select * from tbl_Autores

select Nome_Autor, Sobrenome_Autor from tbl_autores

-- 11 - T-SQL - ORDER BY - Consultas com ordenação de Colunas - SQL Server....
select * from tbl_Livro order by Nome_Livro desc

select Nome_Autor from tbl_autores order by Nome_Autor

-- 12 - T-SQL - DISTINCT - Consultas com valores distintos, sem repetição - SQL Server....
use db_Biblioteca

select distinct ID_Autor from tbl_Livro

-- 13 - T-SQL - WHERE - Filtrando registros em uma consulta - SQL Server....
select * from tbl_Livro
where ID_Autor = '1'

select ID_Autor from tbl_autores
where Sobrenome_Autor = 'Stanek'

-- 14 - T-SQL - AND e OR - Operadores Lógicos - SQL Server...
use db_Biblioteca

-- Usando a clásula AND....
select * from tbl_Livro where ID_Livro > 101 and ID_Autor < 3

-- Usando a clásula OR....
select * from tbl_Livro where ID_Livro > 101 or ID_Autor < 3

-- Comando UPDATE - Atualizando registros em uma tabela no SQL Server....
use db_Biblioteca

select * from tbl_Livro;

-- SINTAXE UPDATE...
-- UPDATE tabela...
-- SET coluna = valor...
-- WHERE "filtro"...

-- Exemplo 01:
update tbl_Livro set Preco_Livro = 65.45
where ID_Livro = 112;

update tbl_autores set Sobrenome_Autor = 'Cartman'
where ID_Autor = 2;

update tbl_Livro set Preco_Livro = 80.00,
ISBN = '127657889' where ID_Livro = 112

-- 15 - T-SQL - TOP -- Especificar número de registros a retornar - SQL Server....
use db_Biblioteca
select top 10 PERCENT Nome_Livro from tbl_Livro

-- 16 - T-SQL - Alias com AS - Nomes alternativos para colunas - SQL Server....
use db_Biblioteca
select Nome_Livro as Livro, ID_Autor as Autor
from tbl_Livro

-- 17 - T-SQL - UNION - Unir resultados de declarações SELECT - SQL Server....
select ID_Autor from tbl_autores 
union
select ID_Autor from tbl_Livro

-- 18 - T-SQL - SELECT INTO - Criar nova tabela a partir de uma tabela existente - SQL Server...
select ID_Livro, Nome_Livro, ISBN into Livro_ISBN from tbl_Livro
where ID_Livro > 2

select * from Livro_ISBN

select * into tbl_Livro_Backup from tbl_Livro

-- 19 - T-SQL - Funções Agregadas - SUM, COUNT, MAX, MIN, AVG - SQL Server....
select count(*) from tbl_autores

select max(Preco_Livro)from tbl_Livro

select min(Preco_Livro) from tbl_Livro

select avg(Preco_Livro) from tbl_Livro

select sum(Preco_Livro) from tbl_Livro