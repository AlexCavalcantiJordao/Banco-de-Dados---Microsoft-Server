-- Loop While no SQL Server - Estrutura de Repeti��o....
declare @valor int
set @valor = 0

while @valor < 10
	begin
		print 'N�mero : ' + cast(@valor as varchar(2))
		set @valor = @valor + 1
	end;