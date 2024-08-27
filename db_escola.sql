create database escola

-- Exemplo de Consultas de Escola:
declare @NOME varchar(30),
		@MEDIA real,
		@RESULTADO varchar(10)
select
	@NOME = nome_aluno,
	@MEDIA = (tbl_alunos.nota1 + tbl_alunos.nota2 + tbl_alunos.nota3 + tbl_alunos.nota4) / 5.00
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

	select 'O aluno' + @NOME + ' está ' + @RESULTADO + ' com média ' + cast(@MEDIA as varchar);

-- Funções Definidas pelo Usuário - Função Escalar no SQL Server - Parte 01....

-- Exemplos de Funções Escalar:
-- Função que calcula a média das notas dos alunos, com peso 2 na nota4:
create function nota_media(@nome varchar(30))
return real
as
begin
	declare @media real
	select @media = (nota1 + nota2 + nota3 + nota4 * 2) / 4.00
	from tbl_aluno where nome_aluno = @nome
	return @media
end

-- Uso:
select dbo.nota_media('Alex')