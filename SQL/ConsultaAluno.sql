SELECT nivel.nivel_nome              Nivel,
       tipo.nivel_nome               Tipo,
       acad_modalidade.mod_nome      Modalidade,
       COUNT(DISTINCT alunocurso_id) Alunos,
       1
FROM acad_nivel tipo
         INNER JOIN
     acad_curso ON acad_curso.nivel_id = tipo.nivel_id
         LEFT JOIN
     acad_nivel nivel ON nivel.nivel_id = tipo.nivel_pai
         INNER JOIN
     acad_modalidade ON acad_modalidade.mod_id = acad_curso.mod_id
         INNER JOIN
     campus_curso ON campus_curso.curso_id = acad_curso.curso_id
         INNER JOIN
     acadgeral__aluno_curso ON acadgeral__aluno_curso.cursocampus_id = campus_curso.cursocampus_id
WHERE alunocurso_situacao = 'Deferido'
  AND acad_curso.curso_possui_periodo_letivo = 'Não'
  AND alunocurso_data_matricula <= '2020-09-30 23:59:59'
GROUP BY nivel.nivel_id, tipo.nivel_id, acad_curso.mod_id
UNION
SELECT nivel.nivel_nome                                 Nivel,
       tipo.nivel_nome                                  Tipo,
       acad_modalidade.mod_nome                         Modalidade,
       COUNT(DISTINCT acadperiodo__aluno.alunocurso_id) Alunos,
       2
FROM acad_nivel tipo
         LEFT JOIN
     acad_nivel nivel ON nivel.nivel_id = tipo.nivel_pai
         INNER JOIN
     acad_curso ON acad_curso.nivel_id = tipo.nivel_id
         INNER JOIN
     acad_modalidade ON acad_modalidade.mod_id = acad_curso.mod_id
         INNER JOIN
     campus_curso ON campus_curso.curso_id = acad_curso.curso_id
         INNER JOIN
     acadgeral__aluno_curso ON acadgeral__aluno_curso.cursocampus_id = campus_curso.cursocampus_id
         INNER JOIN
     acadperiodo__aluno ON acadperiodo__aluno.alunocurso_id = acadgeral__aluno_curso.alunocurso_id
         LEFT JOIN
     acadperiodo__turma USING (turma_id)
         INNER JOIN
     acadperiodo__letivo ON acadperiodo__letivo.per_id = acadperiodo__turma.per_id
         OR acadperiodo__letivo.per_id = acadperiodo__aluno.per_id
WHERE alunocurso_situacao = 'Deferido'
  AND acad_curso.curso_possui_periodo_letivo = 'Sim'
  AND DATE(NOW()) BETWEEN acadperiodo__letivo.per_data_inicio AND acadperiodo__letivo.per_data_fim
  AND alunocurso_data_matricula <= '2020-09-30 23:59:59'
  AND matsituacao_id IN (1, 14)
GROUP BY nivel.nivel_id, acad_curso.mod_id;