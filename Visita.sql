-- Tipo de dado TIME no SQL Server - Armazenar horários em uma tabela....
create database tbl_Visitas

create table tbl_Visitas(
	id_visita int primary key identity,
	nome_visitante varchar(50) not null,
	CPF varchar(11) not null,
	cj_visita date not null,
	data_visita date not null,
	hora_entr time(0) not null,
	hora_sai time(0) not null
);

insert into tbl_Visitas(
	nome_visitante, CPF, cj_visitado, data_visita, hora_entr, hora_sai
)

values(
	'Alex Cavalcanti',
	'29785632419',
	19,
	GETDATE(),
	'14:05:06',
	'18:10:00'
)

select  *from tbl_Visitas;

select DATEDIFF(minute, hora_entr, hora_sai) as Permanencia
from tbl_Visitas;