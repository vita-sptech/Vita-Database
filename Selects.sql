use vita;
Select * from SistemaRegistro order by dtRegistro desc;
SELECT * FROM CpuRegistro;
select * from MemoriaRegistro order by dtregistro desc;
select * from Maquina;
SELECT * FROM ProcessoRegistro;
SELECT * FROM ParametrosAlerta WHERE fkHospital =	 200;


desc CpuRegistro;
desc MemoriaRegistro;
desc SistemaRegistro;
desc DiscoRegistro;
desc ProcessoRegistro;
desc Ocorrencia;

SELECT AVG(usoPorcentagem) as avgUsoProcessador, AVG(temperatura) as avgTempProcessador, AVG(usoMemoria) as avgUsoMemoria from CpuRegistro as c JOIN MemoriaRegistro ON c.fkMaquina = MemoriaRegistro.fkMaquina WHERE TIMESTAMPDIFF(second,c.dtRegistro,now()) < 90000 and c.fkMaquina = '03000200-0400-0500-0006-000700080009';

SELECT * FROM Ocorrencia o WHERE fkMaquina = '03000200-0400-0500-0006-000700080009' and componente = 'cpu'
