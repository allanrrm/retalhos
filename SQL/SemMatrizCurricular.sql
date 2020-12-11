-- Verifica quais alunos não possuem Matriz Curricular Setada
SELECT
    *
FROM
    acadgeral__aluno_curso aac
    INNER JOIN campus_curso cc ON cc.cursocampus_id = aac.cursocampus_id
    INNER JOIN acad_curso ac ON cc.curso_id = ac.curso_id
    INNER JOIN acad_nivel an ON ac.nivel_id = an.nivel_id
WHERE
    aac.mat_cur_id IS NULL
    and an.nivel_id in (41, 50);