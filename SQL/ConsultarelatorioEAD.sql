SELECT 
    curso_nome Curso,
    PessoaProfessor.pes_nome professor_nome,
    Disciplina.disc_nome disc_nome,
    Turma.turma_nome Turma,
    COUNT(AlunoDisciplina.alunodisc_id) 'Total de Alunos',
    IF(codigo IS NULL, 'Presencial', 'EaD') Modalidade
FROM
    acadperiodo__docente_disciplina DocenteDisc
        LEFT JOIN
    acadgeral__docente Docente ON Docente.docente_id = DocenteDisc.docente_id
        NATURAL JOIN
    pessoa PessoaProfessor
        INNER JOIN
    acadgeral__disciplina Disciplina ON Disciplina.disc_id = DocenteDisc.disc_id
        INNER JOIN
    acadperiodo__turma Turma ON Turma.turma_id = DocenteDisc.turma_id
        INNER JOIN
    acadperiodo__letivo PerLetivo ON PerLetivo.per_id = Turma.per_id
        INNER JOIN
    acadperiodo__aluno_disciplina AlunoDisciplina ON AlunoDisciplina.turma_id = Turma.turma_id
        AND AlunoDisciplina.disc_id = Disciplina.disc_id
        INNER JOIN
    acadperiodo__aluno AlunoPeriodo ON AlunoPeriodo.alunoper_id = AlunoDisciplina.alunoper_id
        INNER JOIN
    acadgeral__aluno_curso AlunoCurso ON AlunoCurso.alunocurso_id = AlunoPeriodo.alunocurso_id
        INNER JOIN
    acadgeral__aluno Aluno ON Aluno.aluno_id = AlunoCurso.aluno_id
        INNER JOIN
    pessoa PessoaAluno ON PessoaAluno.pes_id = Aluno.pes_id
        INNER JOIN
    acadgeral__situacao situacaoDisc ON situacaoDisc.situacao_id = AlunoDisciplina.situacao_id
        INNER JOIN
    acadgeral__situacao situacaoGeral ON situacaoGeral.situacao_id = AlunoPeriodo.matsituacao_id
        INNER JOIN
    campus_curso ON campus_curso.cursocampus_id = AlunoCurso.cursocampus_id
        INNER JOIN
    acad_curso ON acad_curso.curso_id = campus_curso.curso_id
        LEFT JOIN
    acadgeral__disciplina_curso ON acad_curso.curso_id = campus_curso.curso_id
        AND Disciplina.disc_id = acadgeral__disciplina_curso.disc_id
        LEFT JOIN
    sis__integracao_disciplina ON sis__integracao_disciplina.curso_disc_id = acadgeral__disciplina_curso.disc_curso_id
WHERE
    PerLetivo.per_id = 1
        AND AlunoDisciplina.situacao_id IN (1 , 8, 9)
        AND PessoaProfessor.pes_nome != 'PROFESSOR MESTRE'
        AND DocenteDisc.docdisc_data_fim IS NULL
        AND acad_curso.curso_id != 00000000017
GROUP BY DocenteDisc.docdisc_id having 
Modalidade = 'EAD'
ORDER BY curso_nome , Turma.turma_serie , Turma