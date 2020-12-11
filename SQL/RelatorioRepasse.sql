# Pagamentos por agente primeira parcela
SELECT
       COALESCE(pes_nome, 'Sem agente') AS 'Agente',
       COUNT(titulo_id) AS 'Títulos de alunos Pagos',
       CONCAT("R$", CAST(SUM(titulo_valor_pago) AS CHAR(20))) AS 'Total'
FROM
       acadgeral__aluno
       INNER JOIN acadgeral__aluno_curso USING (aluno_id)
       INNER JOIN campus_curso cc on acadgeral__aluno_curso.cursocampus_id = cc.cursocampus_id
       INNER JOIN acad_curso ac on cc.curso_id = ac.curso_id
       INNER JOIN acad_nivel an on ac.nivel_id = an.nivel_id
       INNER JOIN financeiro__titulo ON financeiro__titulo.alunocurso_id = acadgeral__aluno_curso.alunocurso_id
       AND titulo_estado = 'Pago'
       AND titulo_parcela = 1
       LEFT JOIN pessoa ON pessoa.pes_id = COALESCE(pes_id_agente, pes_id_agenciador)
WHERE
       financeiro__titulo.titulo_data_pagamento >= '2020-08-11 00:00:00'
       AND titulo_data_pagamento <= '2020-09-10 23:59:59'
       AND an.nivel_id IN (3)
       AND financeiro__titulo.tipotitulo_id IN (2)
GROUP BY
       pessoa.pes_id
ORDER BY
       pes_nome;

-- ---------------------------------------------------------------------------------
# Pagamentos por agente posteriores a primeira parcela
SELECT
       COALESCE(pes_nome, 'Sem agente') AS 'Agente',
       COUNT(titulo_id) AS 'Títulos de alunos Pagos',
       CONCAT("R$", CAST(SUM(titulo_valor_pago) AS CHAR(20))) AS 'Total'
FROM
       acadgeral__aluno
       INNER JOIN acadgeral__aluno_curso USING (aluno_id)
       INNER JOIN campus_curso cc on acadgeral__aluno_curso.cursocampus_id = cc.cursocampus_id
       INNER JOIN acad_curso ac on cc.curso_id = ac.curso_id
       INNER JOIN acad_nivel an on ac.nivel_id = an.nivel_id
       INNER JOIN financeiro__titulo ON financeiro__titulo.alunocurso_id = acadgeral__aluno_curso.alunocurso_id
       AND titulo_estado = 'Pago'
       AND titulo_parcela > 1
       LEFT JOIN pessoa ON pessoa.pes_id = COALESCE(pes_id_agente, pes_id_agenciador)
WHERE
       financeiro__titulo.titulo_data_pagamento >= '2020-08-11 00:00:00'
       AND titulo_data_pagamento <= '2020-09-10 23:59:59'
       AND an.nivel_id IN (3)
       AND financeiro__titulo.tipotitulo_id IN (2)
GROUP BY
       pessoa.pes_id
ORDER BY
       pes_nome;

-- ---------------------------------------------------------------------------------
#Títulos pagos por agente
SELECT
       COALESCE(pessoaAgente.pes_nome, 'Sem agente') AS 'Agente',
       COALESCE(oue.unidade_nome, 'Sem unidade') AS 'Unidade de Estudo',
       pessoa.pes_nome AS 'Aluno',
       acadgeral__aluno_curso.alunocurso_data_cadastro AS 'Data Cadastro',
       acadgeral__aluno.aluno_id AS 'Código Aluno',
       acadgeral__aluno_curso.alunocurso_id AS 'Matrícula',
       COALESCE(
              acadperiodo__turma.turma_nome,
              acad_curso.curso_nome
       ) 'Turma',
       titulo_id AS 'Título',
       titulo_descricao AS 'Parcela',
       CONCAT("R$", titulo_valor_pago) AS 'Valor',
       titulo_data_pagamento AS 'Data Pagamento'
FROM
       acadgeral__aluno
       INNER JOIN acadgeral__aluno_curso USING (aluno_id)
       INNER JOIN campus_curso ON campus_curso.cursocampus_id = acadgeral__aluno_curso.cursocampus_id
       INNER JOIN acad_curso ON campus_curso.curso_id = acad_curso.curso_id
       INNER JOIN acad_nivel an on acad_curso.nivel_id = an.nivel_id
       INNER JOIN financeiro__titulo ON financeiro__titulo.alunocurso_id = acadgeral__aluno_curso.alunocurso_id
       AND titulo_estado = 'Pago'
       INNER JOIN pessoa ON pessoa.pes_id = acadgeral__aluno.pes_id
       LEFT JOIN acadperiodo__aluno ON acadperiodo__aluno.alunocurso_id = acadgeral__aluno_curso.alunocurso_id
       LEFT JOIN acadperiodo__turma USING(turma_id)
       LEFT JOIN pessoa pessoaAgente ON pessoaAgente.pes_id = COALESCE(pes_id_agente, pes_id_agenciador)
       LEFT JOIN org__unidade_estudo oue on oue.unidade_id = acadgeral__aluno_curso.polo_id
WHERE
       financeiro__titulo.titulo_data_pagamento >= '2020-08-11 00:00:00'
       AND titulo_data_pagamento <= '2020-09-10 23:59:59'
       AND an.nivel_id IN (3)
       AND financeiro__titulo.tipotitulo_id IN (2)
GROUP BY
       financeiro__titulo.titulo_id
ORDER BY
       pessoaAgente.pes_nome,
       pessoa.pes_nome;

select
       *
from
       acad_nivel;

select
       *
from
       financeiro__titulo_tipo;

SELECT
       aac.*
FROM
;

UPDATE
       acadgeral__aluno_curso aac
       INNER JOIN campus_curso cc ON aac.cursocampus_id = cc.cursocampus_id
       INNER JOIN acad_curso ac ON ac.curso_id = cc.curso_id
SET
       alunocurso_docgruporegra_id = REPLACE(
              alunocurso_docgruporegra_id,
              ']',
              ', 54]'
       )
WHERE
       ac.nivel_id IN (31, 27)
       AND aac.alunocurso_situacao = 'Deferido';