-- Curso de SQL - Introdu��o e grupos de comandos - SQL Server #1....
-- 2 - T-SQL - Bancos de Dados, SGBDR, Tipos de Dados - SQL Server....
-- 3 - T-SQL - CREATE DATABASE - Criar Banco de Dados - SQL Server....
-- 4 - T-SQL - CONSTRAINTS (Restri��es) - PRIMARY KEY, NOT NULL, etc - SQL Server....
create database db_Biblioteca on primary(
	name = db_Biblioteca,
	filename = 'C:\SQL\db_Biblioteca.MDF',
	size = 6 mb,
	maxsize = 15 mb,
	filegrowth = 10%
)

use db_Biblioteca

sp_helpdb db_Biblioteca

-- 5 - T-SQL - CREATE TABLE - Cria��o de Tabelas - SQL Server....
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
insert into tbl_editoras(Nome_Editora)values('O�Reilly')
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

-- 11 - T-SQL - ORDER BY - Consultas com ordena��o de Colunas - SQL Server....
select * from tbl_Livro order by Nome_Livro desc

select Nome_Autor from tbl_autores order by Nome_Autor

-- 12 - T-SQL - DISTINCT - Consultas com valores distintos, sem repeti��o - SQL Server....
use db_Biblioteca

select distinct ID_Autor from tbl_Livro

-- 13 - T-SQL - WHERE - Filtrando registros em uma consulta - SQL Server....
select * from tbl_Livro
where ID_Autor = '1'

select ID_Autor from tbl_autores
where Sobrenome_Autor = 'Stanek'

-- 14 - T-SQL - AND e OR - Operadores L�gicos - SQL Server...
use db_Biblioteca

-- Usando a cl�sula AND....
select * from tbl_Livro where ID_Livro > 101 and ID_Autor < 3

-- Usando a cl�sula OR....
select * from tbl_Livro where ID_Livro > 101 or ID_Autor < 3

-- Comando UPDATE - Atualizando registros em uma tabela no SQL Server....
use db_Biblioteca

select * from tbl_Livro;

-- SINTAXE UPDATE...
-- UPDATE tabela...
-- SET coluna = valor...
-- WHERE "filtro"...

-- Exemplo 01:
update tbl_Livro set Preco_Livro = 65.45 where ID_Livro = 112;

update tbl_autores set Sobrenome_Autor = 'Cartman' where ID_Autor = 2;

update tbl_Livro set Preco_Livro = 80.00, ISBN = '127657889' where ID_Livro = 112

-- 15 - T-SQL - TOP -- Especificar n�mero de registros a retornar - SQL Server....
use db_Biblioteca
select top 10 PERCENT Nome_Livro from tbl_Livro

-- 16 - T-SQL - Alias com AS - Nomes alternativos para colunas - SQL Server....
use db_Biblioteca

select Nome_Livro as Livro, ID_Autor as Autor from tbl_Livro

-- 17 - T-SQL - UNION - Unir resultados de declara��es SELECT - SQL Server....
select ID_Autor from tbl_autores 
union
select ID_Autor from tbl_Livro

-- 18 - T-SQL - SELECT INTO - Criar nova tabela a partir de uma tabela existente - SQL Server...
select ID_Livro, Nome_Livro, ISBN into Livro_ISBN from tbl_Livro
where ID_Livro > 2

select * from Livro_ISBN

select * into tbl_Livro_Backup from tbl_Livro

-- 19 - T-SQL - Fun��es Agregadas - SUM, COUNT, MAX, MIN, AVG - SQL Server....
select count(*) from tbl_autores

select max(Preco_Livro) from tbl_Livro

select min(Preco_Livro) from tbl_Livro

select avg(Preco_Livro) from tbl_Livro

select sum(Preco_Livro) from tbl_Livro

-- 20 - T-SQL - BETWEEN - Sele��o de Intervalos em Registros - SQL Server....
select * from tbl_Livro where Data_Pub between '20040517' and '20100515'

select Nome_Livro as Livro, Preco_Livro as Preco
from tbl_Livro
where Preco_Livro between 40.00 and 60.00

-- 21 - T-SQL - LIKE e NOT LIKE - Filtrar por padr�es espec�ficos - SQL Server....

/* 

% : Qualquer cadeia de 0 - (Zero) ou mais caracteres.....

_ : Qualquer caracter �nico.....

[] : Qualquer caracter �nico no intervalo ou conjunto especificado ([a-h]; [aeiou]).....

[^] : Qualquer caracter �nico que n�o esteja no intervalo ou conjunto especificado.....

*/

select Nome_Livro from tbl_Livro where Nome_Livro like '_i%'

select Nome_Livro from tbl_Livro where Nome_Livro not like 'M%'

-- 22 - T-SQL - JOINS e INNER JOIN - Selecionar dados de duas ou mais tabelas - SQL Server....
select * from tbl_Livro inner join tbl_autores on tbl_Livro.ID_Autor = tbl_autores.ID_Autor

select tbl_Livro.Nome_Livro, tbl_Livro.ISBN, tbl_autores.Nome_Autor from tbl_Livro
inner join tbl_autores on tbl_Livro.ID_Autor = tbl_autores.ID_Autor

-- Usando Aliases:
select L.Nome_Livro, E.Nome_editora from  tbl_Livro as L
inner join tbl_editoras as E on L.ID_editora = E.ID_Editora

-- 23 - T-SQL - OUTER JOINS - LEFT e RIGHT - Selecionar dados de v�rias tabelas - SQL Server.....

-- Exemplo LEFT JOIN:
select * from tbl_Livro

select * from tbl_autores left join tbl_Livro on tbl_Livro.ID_Autor = tbl_autores.ID_Autor

select * from tbl_autores left join tbl_Livro on tbl_Livro.ID_Autor = tbl_autores.ID_Autor
where tbl_autores .ID_Autor is null

-- Exemplo RIGHT JOIN:
select * from tbl_Livro right join tbl_autores on tbl_Livro.ID_Autor = tbl_autores.ID_Autor
where tbl_autores .ID_Autor is null

select * from tbl_autores right join tbl_Livro on tbl_Livro.ID_Autor = tbl_autores.ID_Autor
where tbl_autores .ID_Autor is null

-- 24 - T-SQL - FULL OUTER JOIN - Selecionar dados de v�rias tabelas - SQL Server.....
-- Exemplo FULL JOIN:

use db_Biblioteca

select Li.Nome_Livro, Li.ID_autor, Au.Nome_autor
from tbl_Livro as Li full join tbl_autores as Au
on Li.ID_Autor = AU.ID_Autor where Li.ID_Autor is null
or Au.ID_Autor is null

-- 25 - T-SQL - Operadores IN e NOT IN - Filtros de M�ltiplas Condi��es - SQL Server....
use db_Biblioteca

select * from tbl_Livro where ID_Autor in(1, 2)

select * from tbl_Livro where ID_Autor not in(1, 2)

-- 26 - T-SQL - Campos Calculados - C�lculos - SQL Server....
use test
-- Campo calculado
create table Produto(
	codProduto smallint, NomeProduto varchar(20),
	Preco money, Quant smallint,
	Total as (Preco * Quant)
)

select * from Produto

insert into Produto values(1, 'Mouse', 15.00, 2)
insert into Produto values(2, 'Teclado', 18.00, 1)
insert into Produto values(3, 'Monitor', 250.00, 21)
insert into Produto values(4, 'Pen-Driver', 25.00, 2)
insert into Produto values(5, 'SSD', 300.00, 3)
insert into Produto values(6, 'HD - Externo', 280.00, 12)

select * from Produto

select sum(Total) from Produto

-- 27 - T-SQL - �ndices - CREATE INDEX - SQL Server....
use db_Biblioteca

create index indice_nome_livro on tbl_Livro(Nome_Livro)

-- 28 - T-SQL - Regras - CREATE RULE - SQL Server....
use db_Biblioteca

select * from tbl_Livro

create rule rl_preco as @valor > 10.00

execute sp_bindrule rl_preco, 'tbl_Livro.Preco_Livro'

update tbl_Livro set Preco_Livro = 50.00 where ID_Livro = 112

update tbl_Livro set Preco_Livro = 10.90 where ID_Livro = 113

-- 29 - T-SQL - Backup do Banco de Dados e Restaura��o - SQL Server....

-- Exemplo como salvar os dados em backup no Banco de Dados:

/*

use Test
go 
backup database Test to disk = 'C:\arquivos\test.bak';
go 

select * fom Produtos

*/

-- 30 - T-SQL - Concatena��o de Strings - SQL Server....

use db_Biblioteca
go

select * from tbl_Livro

-- Concatena��o de Strings:
-- � poss�vel concatenar string usando-se o operador de concaneta��o +
-- Sintaxe:
-- string1 | string2 | coluna
-- Exemplo:

select 'Alex ' + 'Cavalcanti' as Nome

select Nome_autor + ' ' + Sobrenome_autor as 'Nome Completo' from tbl_autores

select 'Eu gosto do Livro' + Nome_Livro as 'Meu livro' from tbl_Livro
where ID_autor = 2

-- 32 - T-SQL - Cl�usula WITH TIES - SQL Server....

-- Cl�sula WITH TIES

select top(3) WITH TIES Nome_Time, Pontos from tbl_times
order by Pontos desc

-- 33 - T-SQL - VIEWS (Exibi��es) - Criar, Alterar e Excluir - SQL Server....
create view vw_LivrosAutores
as select tbl_Livro.Nome_Livro as Livro,
tbl_autores.Nome_Autor as Autor
from tbl_Livro
inner join tbl_autores
on tbl_Livro.ID_Autor = tbl_autores.ID_Autor

select Livro, Autor from vw_LivrosAutores
where Livro like 'S%'

alter view vw_LivrosAutores as
select tbl_Livro.Nome_Livro Livro, tbl_autores.Nome_Autor
as Autor, Preco_Livro as Valor from tbl_Livro inner join tbl_autores
on tbl_Livro.ID_Autor = tbl_autores.ID_Autor

select * from vw_LivrosAutores

-- drop view nome_exibi��o

drop view vw_LivrosAutores

-- 34 - T-SQL - Subconsultas (subqueries) com Tabelas Derivadas - SQL Server....
select(select 'Alex') as subconsultas;

-- Consulta inicial, sem as t�cnicas apresentada:
select CL.Nome_Cliente as Cliente,
PR.Preco_Produto * CO.Quantidade as Total
from Cliente as CL
inner join Compras as CO 
on CL.ID_Clientes = CO.ID_Cliente
inner join Produtos as PR
on CO.ID_Produto = PR.ID_Produto

-- Subconsultas com Tabelas Derivadas - Aplica��es:
select Resultado.Cliente, SUM(Resultado.Total) as Total from
(select CL.Nome_Cliente as Cliente, PR.Preco_Produto * CO.Quantidade as Total
from Clientes as CL inner join Compras as CO on CL.ID_Cliente = CL.ID_Cliente
inner join Produtos as PR on CO.ID_Produto = PR.ID_Produto) as Resultado group by
Resultado.Cliente order by Total

-- 35 - T-SQL - CTE - Common Table Expression (subconsultas) - SQL Server...

-- Subconsultas e CTE - Com tabelas Derivadas:
with ConsultaCTE(Cliente, Total)
as (select CL.Nome_Cliente as Cliente,
PR.Preco_Produto * CO.Quantidade as Total from Clientes as CL
inner join Compras as CO on CL.ID_Cliente = CO.ID_Cliente
inner join Produtos as PR on CO.ID_Produto = PR.ID_Produto)
select Cliente, SUM(Total) as ValorTotal from ConsultaCTE
group by Cliente
order by ValorTotal

-- 36 - T-SQL - Vari�veis - Declara��o e atribui��o de valores no SQL Server....
declare @valor int,
		@texto varchar(40),
		@data_nasc date,
		@nada money
set @valor = 50
set @texto = 'Alex'
set @data_nasc = getdate()
select @valor as Valor, @texto as Texto, @data_nasc as 'Data de Nascimento', @nada as Sal�rio

declare @livro varchar(40)
select @livro = nome_livro from tbl_livro
where ID_Livro = 112
select @livro as 'Nome do Livro'

-- Exemplo:
declare @preco money, @quantidade int, @nome varchar(30) set @quantidade = 5

select @preco = Preco_Livro, @nome = Nome_Livro from tbl_Livro where ID_Livro = 112

select @nome as 'Nome do Livro', @preco * @quantidade as 'Pre�o dos  Livros'

-- 37 - Convers�o de Tipos de Dados no SQL Server com Cast e Convert....

-- CAST:
select 'O pre�o do livro ' + Nome_Livro + ' � de : R$ ' + cast(Preco_Livro as varchar(6)) as Item from tbl_livro
where ID_Autor = 2

-- CONVERT:
select 'O pre�o do livro ' + Nome_Livro + ' � de : R$ ' + CONVERT(varchar(6), Preco_Livro) from tbl_livro

-- Exemplo de Data com CONVERT:

-- Sem alterar estilo:
select 'A data de publica��o' + convert(varchar(20), Data_Pub) from tbl_livro
where ID_Livro = 112

-- Alterando estilo para brit�nico / Fr�nces (103):
select 'A data de publica��o' + convert(varchar(15), Data_Pub, 103) from tbl_livro
where ID_Livro = 113

-- Condicional IF / ELSE no SQL Server - Estrutura de decis�o....

-- Primeiro Exemplo:
declare @numero int,
		@texto varchar(10)

set @numero = 20
set @texto = 'Alex'

if @numero = 20
	  select 'N�mero correto'
if @texto = 'Alex'
	 begin
		set @numero = 30
		select @numero
	 end;
else
	 begin
		set @numero = 40
		select 'N�mero incorreto'
	 end;

-- Exemplo de Consultas de Escola:
declare @NOME varchar(30),
		@MEDIA real,
		@RESULTADO varchar(10)
select
	@NOME = nome_aluno,
	@MEDIA = (tbl_alunos.nota1 + tbl_alunos.nota2 + tbl_alunos.nota3 + tbl_alunos.nota4) / 4.00
from tbl_alunos
where nome_aluno = 'Alex'
	if @MEDIA >= 7.00
	begin
		select @RESULTADO = 'Aprovado';
	end;
	else
	begin
		select @RESULTADO = 'Reprovado';
	end;

	select 'O aluno' + @NOME + ' est� ' + @RESULTADO + ' com m�dia ' + cast(@MEDIA as varchar);