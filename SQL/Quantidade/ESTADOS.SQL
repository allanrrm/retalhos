-- PÓS GRADUAÇÃO 04
-- CAPACITAÇÃO 28

SELECT * FROM  acad_nivel;

SET @datainicial = '2020-09-26',
    @datafinal = '2020-10-25',
    @nivelposgraduacao = 4,
    @nivelcapacitacao = 28;

SELECT 
    e.end_estado AS 'ESTADO',
    COUNT(alunocurso_id) AS 'QTD MATRÍCULAS'
FROM
    acadgeral__aluno aa
        INNER JOIN
    acadgeral__aluno_curso aac ON aac.aluno_id = aa.aluno_id
        INNER JOIN
    campus_curso cc ON cc.cursocampus_id = aac.cursocampus_id
		INNER JOIN
    acad_curso ac ON ac.curso_id = cc.curso_id
        INNER JOIN
    endereco e ON e.pes_id = aa.pes_id
WHERE
aac.alunocurso_data_cadastro between @datainicial AND @datafinal
        AND
     ac.nivel_id in (@nivelposgraduacao,@nivelcapacitacao)
GROUP BY  e.end_estado
order by COUNT(alunocurso_id) desc;


SELECT 
    e.end_estado AS 'ESTADO',
    COUNT(alunocurso_id) AS 'QTD MATRÍCULAS'
FROM
    acadgeral__aluno aa
        INNER JOIN
    acadgeral__aluno_curso aac ON aac.aluno_id = aa.aluno_id
        INNER JOIN
    campus_curso cc ON cc.cursocampus_id = aac.cursocampus_id
		INNER JOIN
    acad_curso ac ON ac.curso_id = cc.curso_id
        INNER JOIN
    endereco e ON e.pes_id = aa.pes_id
WHERE
     ac.nivel_id in (@nivelposgraduacao,@nivelcapacitacao)
GROUP BY  e.end_estado
order by COUNT(alunocurso_id) desc