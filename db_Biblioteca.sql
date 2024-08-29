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
update tbl_Livro set Preco_Livro = 65.45 where ID_Livro = 112;

update tbl_autores set Sobrenome_Autor = 'Cartman' where ID_Autor = 2;

update tbl_Livro set Preco_Livro = 80.00, ISBN = '127657889' where ID_Livro = 112

-- 15 - T-SQL - TOP -- Especificar número de registros a retornar - SQL Server....
use db_Biblioteca
select top 10 PERCENT Nome_Livro from tbl_Livro

-- 16 - T-SQL - Alias com AS - Nomes alternativos para colunas - SQL Server....
use db_Biblioteca

select Nome_Livro as Livro, ID_Autor as Autor from tbl_Livro

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

select max(Preco_Livro) from tbl_Livro

select min(Preco_Livro) from tbl_Livro

select avg(Preco_Livro) from tbl_Livro

select sum(Preco_Livro) from tbl_Livro

-- 20 - T-SQL - BETWEEN - Seleção de Intervalos em Registros - SQL Server....
select * from tbl_Livro where Data_Pub between '20040517' and '20100515'

select Nome_Livro as Livro, Preco_Livro as Preco
from tbl_Livro
where Preco_Livro between 40.00 and 60.00

-- 21 - T-SQL - LIKE e NOT LIKE - Filtrar por padrões específicos - SQL Server....

/* 

% : Qualquer cadeia de 0 - (Zero) ou mais caracteres.....

_ : Qualquer caracter único.....

[] : Qualquer caracter único no intervalo ou conjunto especificado ([a-h]; [aeiou]).....

[^] : Qualquer caracter único que não esteja no intervalo ou conjunto especificado.....

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

-- 23 - T-SQL - OUTER JOINS - LEFT e RIGHT - Selecionar dados de várias tabelas - SQL Server.....

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

-- 24 - T-SQL - FULL OUTER JOIN - Selecionar dados de várias tabelas - SQL Server.....
-- Exemplo FULL JOIN:

use db_Biblioteca

select Li.Nome_Livro, Li.ID_autor, Au.Nome_autor
from tbl_Livro as Li full join tbl_autores as Au
on Li.ID_Autor = AU.ID_Autor where Li.ID_Autor is null
or Au.ID_Autor is null

-- 25 - T-SQL - Operadores IN e NOT IN - Filtros de Múltiplas Condições - SQL Server....
use db_Biblioteca

select * from tbl_Livro where ID_Autor in(1, 2)

select * from tbl_Livro where ID_Autor not in(1, 2)

-- 26 - T-SQL - Campos Calculados - Cálculos - SQL Server....
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

-- 27 - T-SQL - Índices - CREATE INDEX - SQL Server....
use db_Biblioteca

create index indice_nome_livro on tbl_Livro(Nome_Livro)

-- 28 - T-SQL - Regras - CREATE RULE - SQL Server....
use db_Biblioteca

select * from tbl_Livro

create rule rl_preco as @valor > 10.00

execute sp_bindrule rl_preco, 'tbl_Livro.Preco_Livro'

update tbl_Livro set Preco_Livro = 50.00 where ID_Livro = 112

update tbl_Livro set Preco_Livro = 10.90 where ID_Livro = 113

-- 29 - T-SQL - Backup do Banco de Dados e Restauração - SQL Server....

-- Exemplo como salvar os dados em backup no Banco de Dados:

/*

use Test
go 
backup database Test to disk = 'C:\arquivos\test.bak';
go 

select * fom Produtos

*/

-- 30 - T-SQL - Concatenação de Strings - SQL Server....

use db_Biblioteca
go

select * from tbl_Livro

-- Concatenação de Strings:
-- É possível concatenar string usando-se o operador de concanetação +
-- Sintaxe:
-- string1 | string2 | coluna
-- Exemplo:

select 'Alex ' + 'Cavalcanti' as Nome

select Nome_autor + ' ' + Sobrenome_autor as 'Nome Completo' from tbl_autores

select 'Eu gosto do Livro' + Nome_Livro as 'Meu livro' from tbl_Livro
where ID_autor = 2

-- 32 - T-SQL - Cláusula WITH TIES - SQL Server....

-- Clásula WITH TIES

select top(3) WITH TIES Nome_Time, Pontos from tbl_times
order by Pontos desc

-- 33 - T-SQL - VIEWS (Exibições) - Criar, Alterar e Excluir - SQL Server....
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

-- drop view nome_exibição

drop view vw_LivrosAutores

-- 34 - T-SQL - Subconsultas (subqueries) com Tabelas Derivadas - SQL Server....
select(select 'Alex') as subconsultas;

-- Consulta inicial, sem as técnicas apresentada:
select CL.Nome_Cliente as Cliente,
PR.Preco_Produto * CO.Quantidade as Total
from Cliente as CL
inner join Compras as CO 
on CL.ID_Clientes = CO.ID_Cliente
inner join Produtos as PR
on CO.ID_Produto = PR.ID_Produto

-- Subconsultas com Tabelas Derivadas - Aplicações:
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

-- 36 - T-SQL - Variáveis - Declaração e atribuição de valores no SQL Server....
declare @valor int,
		@texto varchar(40),
		@data_nasc date,
		@nada money
set @valor = 50
set @texto = 'Alex'
set @data_nasc = getdate()
select @valor as Valor, @texto as Texto, @data_nasc as 'Data de Nascimento', @nada as Salário

declare @livro varchar(40)
select @livro = nome_livro from tbl_livro
where ID_Livro = 112
select @livro as 'Nome do Livro'

-- Exemplo:
declare @preco money, @quantidade int, @nome varchar(30) set @quantidade = 5

select @preco = Preco_Livro, @nome = Nome_Livro from tbl_Livro where ID_Livro = 112

select @nome as 'Nome do Livro', @preco * @quantidade as 'Preço dos  Livros'

-- 37 - Conversão de Tipos de Dados no SQL Server com Cast e Convert....

-- CAST:
select 'O preço do livro ' + Nome_Livro + ' é de : R$ ' + cast(Preco_Livro as varchar(6)) as Item from tbl_livro
where ID_Autor = 2

-- CONVERT:
select 'O preço do livro ' + Nome_Livro + ' é de : R$ ' + CONVERT(varchar(6), Preco_Livro) from tbl_livro

-- Exemplo de Data com CONVERT:

-- Sem alterar estilo:
select 'A data de publicação' + convert(varchar(20), Data_Pub) from tbl_livro
where ID_Livro = 112

-- Alterando estilo para britânico / Frânces (103):
select 'A data de publicação' + convert(varchar(15), Data_Pub, 103) from tbl_livro
where ID_Livro = 113

-- Condicional IF / ELSE no SQL Server - Estrutura de decisão....

-- Primeiro Exemplo:
declare @numero int,
		@texto varchar(10)

set @numero = 20
set @texto = 'Alex'

if @numero = 20
	  select 'Número correto'
if @texto = 'Alex'
	 begin
		set @numero = 30
		select @numero
	 end;
else
	 begin
		set @numero = 40
		select 'Número incorreto'
	 end;

-- Loop While no SQL Server - Estrutura de Repetição....

-- Exemplo 2: Imprimir Livro e Preço dos livros de ID´s de 100 a 105
declare @codigo int
set @codigo = 100

while @codigo < 106
	begin
	   select ID_Livro as ID, Nome_livro as Livro, Preco_Livro as Preco
	   from tbl_livro where ID_Livro = @codigo set @codigo = @codigo + 1
	end;

-- Stored Procedures - Criação e Execução no SQL Server - parte 01....
create procedure Teste
as select 'Bóson Treinamento' as Nome

exec Teste

-- Exemplo 2:
create procedure p_LivroValor as select Nome_Livro, Preco_livro from tbl_Livro

-- Execução:
exec sp_help p_LivroValor

-- Criptografar Stored Procedure....
create procedure p_LivroISBN with encryption as
select Nome_Livro, ISBN from tbl_Livro

exec p_LivroISBN

-- Stored Procedures - Alteração e Parâmetros de Entrada no SQL Server - parte 02....
alter procedure Teste (@par1 as int) as select @par1

exec Teste 25

alter procedure p_LivroValor
(@ID smallint)
as
select Nome_Livro Livro,
Preco_Livro as Preco
from tbl_Livro where ID_Livro = @ID

exec p_Livrovalor 112

-- Múltiplos parâmetros de entrada....
alter procedure Teste(@par1 as int, @par2 as varchar(20)) as
begin
	select @par1
	select @par2
end

-- Executar passando um parâmetro:
exec Teste 22, 'Laranja'  -- Sem posição....

-- Execução:
exec Teste @par1 = 25, @par2 = 'Abacate' -- Por nome....

-- Stored Procedures - Parâmetros de Entrada e INSERT no SQL Server - parte 03....

-- Outro exemplo com múltiplos parâmetros de entrada:
alter procedure p_LivroValor(@ID smallint, @Preco money) as
select Nome_Livro as Livro, Preco_Livro as Preco from tbl_Livro
where ID_Livro > @ID and Preco_Livro > @Preco

-- Execução:
exec p_LivroValor @ID = 112, @Preco = 60

-- Stored Procedures - Parâmetros de Saída e RETURN no SQL Server - parte 04.....
-- Outro exemplo - Parâmetro....

-- Desejo fornecer o ID e a quantidade de um título adquirido, e saber o valor total pago pelos livros:
alter procedure p_LivroValor(
	@Quantidade smallint,
	@ID smallint
)

as
select Nome_Livro as Livro, Preco_Livro * @Quantidade as Preco from tbl_Livro
where ID_Livro = @ID

-- Execução:
exec p_LivroValor @ID = 112, @Quantidade = 10

-- Exemplo - Inserção de Dados....
create procedure p_insere_editora(
	@nome varchar(50)
)

as
insert into tbl_editoras(Nome_Editora)values(@nome)

-- Execução e Verificação:
exec p_insere_editora @nome = 'Editora' select * from tbl_editoras

-- Stored Procedures - Parâmetros de Saída e RETURN no SQL Server - parte 04....
-- Parâmetros com valor padrão:

create procedure p_teste_valor_padrao(
	@param1 int,
	@param2 varchar(20) = 'Valor Padrão!'
)

as

select 'Valor do parâmetros 1: ' + cast(@param1 as varchar)

select 'Valor do parâmetros 2: ' + @param2

-- Execução:
exec p_teste_valor_padrao 30
exec p_teste_valor_padrao @param1 = 40, @param2 = 'Valor Modificado'

-- Parâmetro de Saída:
alter procedure teste(@par1 as int output) as
select @par1 *2 return

-- Executar passando um parâmetro:
declare @valor as int = 15
exec teste @valor output
print @valor

-- Uso de RETURN:
alter procedure p_LivroValor(
	@Quantidade smallint,
	@Cod smallint = -10,
	@ID smallint
)

as
set nocount on
if @ID > 100
	begin
		select Nome_Livro as Livro, Preco_Livro * @Quantidade as Preco
		from tbl_Livro
		where ID_Livro = @ID
		return 1
	end
 else
	return @Cod

-- Executar:
declare @Codigo int
exec @Codigo = p_LivroValor @ID = 112, @Quantidade = 10
print @Codigo

-- Funções Definidas pelo Usuário - Valor de Tabela Embutida - SQL Server - Parte 02....

-- Função com Valor de Tabela Embutida (Inline)....
-- Exemplo de Função de Valor de Tabela Embutida:
create function retorna_itens(@valor real)
returns table
as
return(
	select L.Nome_Livro, A.Nome_Autor, E.Nome_Editora
	from tbl_Livro as L
	inner join tbl_autores as A
	on L.ID_Autor = A.ID_Autor
	inner join tbl_editoras as E
	on L.ID_editora = E.ID_Editora
	where L.Preco_Livro > @valor
)

-- Como usar:
select Nome_livro, Nome_Autor from retorna_itens(62.00)

-- Funções Definidas pelo Usuário - Valor de Tabela com Várias Instruções - SQL Server - Parte 03....
-- Funções com Valor de Tabelas com Várias Instruções....

-- Exemplo:
create function multi_tabela()
returns @valores table(
	Nome_Livro varchar(50),
	Data_Pub datetime, Nome_Editora varchar(50),
	Preco_Livro money
)
as
begin
insert @valores(Nome_Livro, Data_Pub, Nome_Editora, Preco_Livro)
	select L.Nome_Livro, L.Data_Pub, E.Nome_Editora, L.Preco_Livro
	from tbl_Livro as L
	inner join tbl_editoras as E
	on L.ID_editora = E.ID_Editora
return
end

-- Uso:
select * from multi_tabela()

-- Triggers - Definição e Tipos Instead Of e After - SQL Server - Parte 01....

-- Triggers - Criação e Testes dos modos Instead Of e After - SQL Server - Parte 02....
create trigger teste_trigger_after
on tbl_editoras
after insert
as
print 'Olá Mundo !';

insert tbl_editoras values('Editora10')

-- Trigger AFTER - Exemplo com Tabelas:
create trigger trigger_after
on tbl_editoras
after insert
as
insert into tbl_autores values(25, 'José', 'da Silva')
insert into tbl_Livro values('Livro110', '123456000', '20001010', 77, 25, 2)

drop trigger teste_trigger_after

select * from tbl_autores

-- Criar um Trigger	INSTEAD OF - Exemplo:
create trigger teste_trigger_insteadof
on tbl_autores
instead of insert
as
print 'Olá Mundo ! Não inserir o registro dessa vez.'

insert into tbl_autores values(26, 'João', 'Moura')

select * from tbl_autores

-- Triggers - Habilitar, Desabilitar e verificar Status - SQL Server - Parte 03....

-- Exemplo: Desabilitar um Trigger:
alter table tbl_editoras
enable trigger trigger_after

-- Verificar a existência de trigger....

-- Em uma tabela especifica:
exec sp_helptrigger @tabname = tbl_editoras

-- No Banco de Dados todo:
use db_Biblioteca
select * from sys.triggers
where is_disabled = 1 or is_disabled = 0

-- Triggers - Determinar colunas alteradas e função update() - SQL Server - Parte 04....
create trigger trigger_after_autores
on tbl_autores
after insert, update
as
if update(nome_autor)
	begin
		print 'O nome do autor foi alterado.'
	end
else
	begin
		print 'Nome não foi modificado.'
	end

-- Atualizar o Nome do Autor:
update tbl_autores
set Nome_Autor = 'João'
where ID_Autor = 10

-- Atualizar o Sobrenome do Autor:
update tbl_autores
set Sobrenome_Autor = 'Guimarães'
where ID_Autor = 10

-- Triggers - Aninhamento e Triggers Recursivos - SQL Server - Parte 05....

-- Trigger Recursivo - Exemplo:
alter database db_Biblioteca
set recurvise_trigger on

create table tbl_trigger_recursivo(
	Codigo int primary key
)

insert into tbl_trigger_recursivo values(1)

select Codigo from tbl_trigger_recursivo

-- Criar Trigger Recursivo:
create trigger trigger_rec on tbl_trigger_recursivo
after insert
as
declare @cod int
select
@cod = max(codigo)
from teste_trigger
if @cod < 10
	begin
		insert into tbl_trigger_recursivo select max(codigo) + 1 from tbl_trigger_recursivo
	end
else
	begin
		print 'Trigger Recursivo Finalizado'
	end

-- Como renomear colunas e tabelas de um banco de dados no SQL Server....
select * from sys.tables;

select * from tbl_Livro;

select * from tbl_autores;

select * from tbl_editoras;

sp_rename 'NomeTabelaAntigo',
'NovoNomeTabela';

sp_rename 'tbl_livros.Nome_Livro', 'Nome_Livro', 'Column';

select * from sys.tables;

-- O que é a Linguagem SQL - Apresentação, Sintaxe, História....
