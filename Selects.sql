USE vita;

SELECT * FROM SistemaRegistro ORDER BY dtRegistro DESC;
SELECT * FROM CpuRegistro ORDER BY dtRegistro DESC;
SELECT * FROM MemoriaRegistro ORDER BY dtRegistro DESC;
SELECT * FROM ProcessoRegistro ORDER BY dtRegistro DESC;
SELECT * FROM DiscoRegistro ORDER BY dtRegistro DESC;
SELECT * FROM Ocorrencia ORDER BY dtOcorrencia DESC;

SELECT * FROM ParametrosAlerta WHERE fkHospital =	 200;
SELECT * FROM Maquina;

DESC CpuRegistro;
DESC MemoriaRegistro;
DESC SistemaRegistro;
DESC DiscoRegistro;
DESC ProcessoRegistro;
DESC Ocorrencia;

SELECT AVG(usoPorcentagem) as avgUsoProcessador, AVG(temperatura) as avgTempProcessador, AVG(usoMemoria) as avgUsoMemoria from CpuRegistro as c JOIN MemoriaRegistro ON c.fkMaquina = MemoriaRegistro.fkMaquina WHERE TIMESTAMPDIFF(second,c.dtRegistro,now()) < 90000 and c.fkMaquina = '03000200-0400-0500-0006-000700080009';

SELECT * FROM Ocorrencia o WHERE fkMaquina = '03000200-0400-0500-0006-000700080009' AND TIMESTAMPDIFF(second,o.dtOcorrencia,now()) < 100 order by dtOcorrencia desc;
