create database escola

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

	select 'O aluno' + @NOME + ' está ' + @RESULTADO + ' com média ' + cast(@MEDIA as varchar);