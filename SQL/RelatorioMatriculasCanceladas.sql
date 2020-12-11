select
    p.pes_nome 'Nome do Aluno',
    pf.pes_cpf 'CPF',
    e.end_cidade 'Cidade',
    e.end_estado 'Estado',
    pf.pes_sexo 'Sexo',
    date_format(pf.pes_data_nascimento, '%d/%m/%Y') as 'Data de Nascimento',
    ac.curso_nome 'Nome do Curso'
from
    acadgeral__aluno_curso aac
    inner join campus_curso cc on aac.cursocampus_id = cc.cursocampus_id
    inner join acad_curso ac on ac.curso_id = cc.curso_id
    inner join acadgeral__aluno aa on aa.aluno_id = aac.aluno_id
    left join pessoa_fisica pf on aa.pes_id = pf.pes_id
    left join endereco e on e.pes_id = pf.pes_id
    left join pessoa p on p.pes_id = pf.pes_id
where
    aac.alunocurso_situacao = 'Cancelado'
    and aac.alunocurso_data_cadastro between '2020-01-01 00:00:00'
    and '2020-09-30 23:59:59'
group by
    e.pes_id,
    aac.alunocurso_id;



