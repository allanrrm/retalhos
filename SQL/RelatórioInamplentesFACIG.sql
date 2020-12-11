/* SETANDO VALOR NAS VARIÁVEIS */
# FAVENI: MENSALIDADE=2; MATRICULA=36; RENEGOCIAÇÃO=33;
# DOM ALBERTO: MENSALIDADE=2; MATRICULA=36; RENEGOCIAÇÃO=33;
# FACIBA : MENSALIDADE=2; MATRICULA=61; RENEGOCIAÇÃO=33;
# FARESE : MENSALIDADE=2; MATRICULA=36; RENEGOCIAÇÃO=33;
# CULTUS : MENSALIDADE=2; MATRICULA=36; RENEGOCIAÇÃO=33;
# FUTURA : MENSALIDADE=2; MATRICULA=61; RENEGOCIAÇÃO=33;
# UNIFAVENI : MENSALIDADE=2; MATRICULA=36; RENEGOCIAÇÃO=33;
SET @mensalidade:=2,
    @matricula:=36,
    @renegociacao=33,
    @pagamentomultiplo=35,
    @datavencimentoinicial='2017-01-01',
    @datavencimentofinal= subdate(now(), interval 1 day);
    
    SELECT
           acadgeral__aluno_curso.aluno_id 'MATRICULA DO ALUNO',
           acadgeral__aluno_curso.alunocurso_id 'MATRICULA DO ALUNO NO CURSO',
           pes_nome AS 'NOME',
           con_contato_celular AS 'CELULAR',
           con_contato_telefone AS 'TELEFONE',
           con_contato_email AS 'EMAIL',
           curso_nome AS 'NOME DO CURSO',
           financeiro__titulo_tipo.tipotitulo_nome AS 'TIPO DE TITULO',
           titulo_data_vencimento AS 'DATA DE VENCIMENTO',
           titulo_estado AS 'ESTADO'
    FROM pessoa
        INNER JOIN financeiro__titulo ON pessoa.pes_id = financeiro__titulo.pes_id
        INNER JOIN acadgeral__aluno_curso ON financeiro__titulo.alunocurso_id = acadgeral__aluno_curso.alunocurso_id
        INNER JOIN campus_curso ON acadgeral__aluno_curso.cursocampus_id = campus_curso.cursocampus_id
        INNER JOIN acad_curso ON campus_curso.curso_id = acad_curso.curso_id
        INNER JOIN financeiro__titulo_tipo ON financeiro__titulo.tipotitulo_id = financeiro__titulo_tipo.tipotitulo_id
        INNER JOIN (
            SELECT
            financeiro__titulo.alunocurso_id,
            titulo_id
            FROM pessoa
                INNER JOIN financeiro__titulo ON pessoa.pes_id = financeiro__titulo.pes_id
            WHERE titulo_estado= 'Pago'
              AND pes_nome NOT LIKE 'Emerson José Fernandes'
              AND financeiro__titulo.tipotitulo_id IN (@matricula)
              AND financeiro__titulo.titulo_data_vencimento >=@datavencimentoinicial
              AND  financeiro__titulo.titulo_data_vencimento <=@datavencimentofinal
            ) AS tituloPago ON tituloPago.alunocurso_id = acadgeral__aluno_curso.alunocurso_id
    WHERE titulo_estado= 'Aberto'
      AND pes_nome NOT LIKE 'Emerson José Fernandes'
      AND financeiro__titulo.tipotitulo_id IN (@mensalidade, @renegociacao, 35)
      AND financeiro__titulo.titulo_data_vencimento >=@datavencimentoinicial
      AND   financeiro__titulo.titulo_data_vencimento <=@datavencimentofinal
GROUP BY pes_nome, curso_nome, financeiro__titulo.tipotitulo_id
ORDER BY pes_nome;

union all

SELECT
           acadgeral__aluno_curso.aluno_id 'MATRICULA DO ALUNO',
           acadgeral__aluno_curso.alunocurso_id 'MATRICULA DO ALUNO NO CURSO',
           pes_nome AS 'NOME',
           con_contato_celular AS 'CELULAR',
           con_contato_telefone AS 'TELEFONE',
           con_contato_email AS 'EMAIL',
           curso_nome AS 'NOME DO CURSO',
           financeiro__titulo_tipo.tipotitulo_nome AS 'TIPO DE TITULO',
           titulo_data_vencimento AS 'DATA DE VENCIMENTO',
           titulo_estado AS 'ESTADO'
    FROM pessoa
        INNER JOIN financeiro__titulo ON pessoa.pes_id = financeiro__titulo.pes_id
        INNER JOIN acadgeral__aluno_curso ON financeiro__titulo.alunocurso_id = acadgeral__aluno_curso.alunocurso_id
        INNER JOIN campus_curso ON acadgeral__aluno_curso.cursocampus_id = campus_curso.cursocampus_id
        INNER JOIN acad_curso ON campus_curso.curso_id = acad_curso.curso_id
        INNER JOIN financeiro__titulo_tipo ON financeiro__titulo.tipotitulo_id = financeiro__titulo_tipo.tipotitulo_id
        INNER JOIN (
            SELECT
            financeiro__titulo.alunocurso_id,
            titulo_id
            FROM pessoa
                INNER JOIN financeiro__titulo ON pessoa.pes_id = financeiro__titulo.pes_id
            WHERE titulo_estado= 'Aberto'
              AND pes_nome NOT LIKE 'Emerson José Fernandes'
              AND financeiro__titulo.tipotitulo_id IN (@matricula)
              AND financeiro__titulo.titulo_data_vencimento >=@datavencimentoinicial
              AND  financeiro__titulo.titulo_data_vencimento <=@datavencimentofinal
            ) AS tituloPago ON tituloPago.alunocurso_id = acadgeral__aluno_curso.alunocurso_id
    WHERE titulo_estado= 'Aberto'
      AND pes_nome NOT LIKE 'Emerson José Fernandes'
      AND financeiro__titulo.tipotitulo_id IN (@pagamentomultiplo)
      AND financeiro__titulo.titulo_data_vencimento >=@datavencimentoinicial
      AND   financeiro__titulo.titulo_data_vencimento <=@datavencimentofinal
GROUP BY pes_nome, curso_nome, financeiro__titulo.tipotitulo_id
ORDER BY pes_nome;