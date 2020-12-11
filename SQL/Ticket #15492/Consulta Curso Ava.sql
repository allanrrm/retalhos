SELECT 
	 amc.mat_cur_descricao 'Nome da Matriz',
    ac.curso_nome 'Nome do Curso',
    simc.codigo 'Código do Ava', 
    CASE
        WHEN curso_unidade_medida = 'Mensal' THEN (curso_prazo_integralizacao * 1)
        WHEN curso_unidade_medida = 'Bimestral' THEN (curso_prazo_integralizacao * 2)
        WHEN curso_unidade_medida = 'trimestral' THEN (curso_prazo_integralizacao * 3)
        WHEN curso_unidade_medida = 'Quadrimestral' THEN (curso_prazo_integralizacao * 4)
        WHEN curso_unidade_medida = 'Semestral' THEN (curso_prazo_integralizacao * 6)
        WHEN curso_unidade_medida = 'Anual' THEN (curso_prazo_integralizacao * 12)
    END AS 'Tempo de Conclusão em Meses'
FROM
    sis__integracao si
        INNER JOIN
    sis__integracao_matriz_curricular simc ON simc.integracao_id = si.integracao_id
        INNER JOIN
    acadperiodo__matriz_curricular amc ON amc.mat_cur_id = simc.mat_cur_id
        INNER JOIN
    acad_curso ac ON ac.curso_id = amc.curso_id