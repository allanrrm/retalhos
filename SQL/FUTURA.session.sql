use ofc_futura;

-- POR TODO PERIODO
SET
    @DATAINICIAL = '2020-09-26';

SET
    @DATAFINAL = '2020-10-25';

SELECT
    aac.aluno_id AS 'MATRICULA INSTITUIÇÃO',
    aac.alunocurso_id AS 'MATRICULA',
    p.pes_nome AS 'NOME',
    p.con_contato_email AS 'E-MAIL',
    aac.alunocurso_situacao AS 'SITUAÇÃO'
FROM
    acadgeral__aluno_curso aac
    INNER JOIN acadgeral__aluno aa ON aac.aluno_id = aa.aluno_id
    INNER JOIN pessoa p ON p.pes_id = aa.pes_id
WHERE
    aac.alunocurso_data_cadastro < @DATAFINAL
ORDER BY
    p.pes_nome; 
    
    
    -- POR DATA DETERMINADA
SET
    @DATAINICIAL = '2020-09-26';

SET
    @DATAFINAL = '2020-10-25';

SELECT
    aac.aluno_id AS 'MATRICULA INSTITUIÇÃO',
    aac.alunocurso_id AS 'MATRICULA',
    p.pes_nome AS 'NOME',
    p.con_contato_email AS 'E-MAIL',
    aac.alunocurso_situacao AS 'SITUAÇÃO'
FROM
    acadgeral__aluno_curso aac
    INNER JOIN acadgeral__aluno aa ON aac.aluno_id = aa.aluno_id
    INNER JOIN pessoa p ON p.pes_id = aa.pes_id
WHERE
    aac.alunocurso_data_cadastro BETWEEN @DATAINICIAL
    AND @DATAFINAL
ORDER BY
    p.pes_nome; 