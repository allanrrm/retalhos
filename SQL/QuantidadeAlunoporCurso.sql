SELECT
    ac.curso_nome as 'Nome do Curso',
    COUNT(aac.alunocurso_id) as 'Quantidade de Alunos'
FROM
    acad_curso ac
    INNER JOIN campus_curso cc ON ac.curso_id = cc.curso_id
    INNER JOIN acadgeral__aluno_curso aac ON aac.cursocampus_id = cc.cursocampus_id
GROUP BY
    ac.curso_nome
order by
    COUNT(aac.alunocurso_id) desc