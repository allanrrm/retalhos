SELECT 
    p.pes_nome,
    apa.alunoper_id,
    aad.alunodisc_id,
    ad.disc_id,
    apt.turma_id,
    apt.mat_cur_id,
    COUNT(apf.frequencia_id) AS falta,
    @totalch:=(SELECT 
            SUM(amd1.per_disc_chteorica)
        FROM
            acadperiodo__matriz_disciplina amd1
                INNER JOIN
			acadperiodo__turma apt1 on apt1.mat_cur_id = amd1.mat_cur_id  
				inner join 
            acadperiodo__aluno_disciplina aad1 ON  aad1.turma_id = apt1.turma_id and amd1.disc_id = aad1.disc_id
        WHERE
           aad1.alunoper_id = apa.alunoper_id and apt1.mat_cur_id = apt.mat_cur_id ) AS totalcargahoraria,
    100 - (COUNT(apf.frequencia_id) * 100) AS 'Frequencia'
FROM
    acadperiodo__frequencia apf
        INNER JOIN
    acadperiodo__aluno_disciplina aad ON apf.alunodisc_id = aad.alunodisc_id
        INNER JOIN
    acadperiodo__aluno apa ON apa.alunoper_id = aad.alunoper_id
        INNER JOIN
    acadgeral__aluno_curso aac ON apa.alunocurso_id = aac.alunocurso_id
        INNER JOIN
    acadgeral__disciplina ad ON ad.disc_id = aad.disc_id
        INNER JOIN
    acadgeral__aluno aa ON aa.aluno_id = aac.aluno_id
        INNER JOIN
    pessoa p ON p.pes_id = aa.pes_id
        INNER JOIN
    acadperiodo__turma apt ON apt.turma_id = apa.turma_id
WHERE
    apt.per_id = 11
GROUP BY apa.alunoper_id