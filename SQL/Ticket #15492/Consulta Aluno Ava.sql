SELECT
    p.pes_nome AS nome,
    pf.pes_cpf 'CPF',
    sia.codigo 'Codigo do Aluno',
    aac.alunocurso_situacao 'Situação',
    simc.codigo 'Código do Curso',
    ac.curso_nome 'Nome do Curso', 
    unix_timestamp(aac.alunocurso_data_matricula) as 'Data Matricula'
	 FROM
    sis__integracao si
        INNER JOIN
    sis__integracao_aluno sia ON si.integracao_id = sia.integracao_id
        INNER JOIN
    acadgeral__aluno aa ON aa.aluno_id = sia.aluno_id
        INNER JOIN
    pessoa p ON p.pes_id = aa.pes_id
        INNER JOIN
    acadgeral__aluno_curso aac ON aac.aluno_id = aa.aluno_id
        INNER JOIN
    campus_curso cc ON cc.cursocampus_id = aac.cursocampus_id
			INNER JOIN
	 acad_curso ac ON ac.curso_id = cc.curso_id
	 		INNER JOIN
    sis__integracao_matriz_curricular simc ON aac.mat_cur_id = simc.mat_cur_id
        INNER JOIN
	acadperiodo__matriz_curricular amc on amc.mat_cur_id  = simc.mat_cur_id 
        INNER JOIN
    pessoa_fisica pf ON p.pes_id = pf.pes_id