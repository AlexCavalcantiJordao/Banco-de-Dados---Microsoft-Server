-- Curso de SQL - Introdução e grupos de comandos - SQL Server #1....
-- 2 - T-SQL - Bancos de Dados, SGBDR, Tipos de Dados - SQL Server....
-- 3 - T-SQL - CREATE DATABASE - Criar Banco de Dados - SQL Server....
-- 4 - T-SQL - CONSTRAINTS (Restrições) - PRIMARY KEY, NOT NULL, etc - SQL Server....
create database db_Biblioteca
on primary (
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
create table tbl_teste_identidade
(ID_Teste smallint primary key identity,
valor smallint not null)

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