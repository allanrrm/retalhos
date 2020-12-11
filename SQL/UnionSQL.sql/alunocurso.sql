/*DOCUMENTOS CURSO*/
SELECT 
    pessoa.pes_id AS 'ID PESSOA',
    pessoa.pes_nome AS NOME,
    documento__tipo.tdoc_descricao AS DOCUMENTO,
    if(documento__pessoa.docpessoa_status is null or documento__pessoa.docpessoa_status = '', 'Não', documento__pessoa.docpessoa_status) AS 'STATUS ENTREGA',
    if(documento__pessoa.docpessoa_situacao is null or documento__pessoa.docpessoa_situacao = '', 'Pendente', documento__pessoa.docpessoa_situacao) AS 'SITUAÇÃO DEFERIMENTO'
FROM
    pessoa
        INNER JOIN
    pessoa_fisica ON pessoa_fisica.pes_id = pessoa.pes_id
        INNER JOIN
    acadgeral__aluno ON acadgeral__aluno.pes_id = pessoa_fisica.pes_id
		INNER JOIN
	acadgeral__aluno_curso ON acadgeral__aluno_curso.aluno_id = acadgeral__aluno.aluno_id
        INNER JOIN 
    documento__grupo_regra dgr ON JSON_CONTAINS(acadgeral__aluno_curso.alunocurso_docgruporegra_id , CAST(dgr.docgruporegra_id as JSON), '$')
        INNER JOIN
    documento__tipo ON documento__tipo.tdoc_id = dgr.tdoc_id
       LEFT JOIN
    documento__pessoa ON documento__pessoa.pes_id = pessoa.pes_id AND documento__pessoa.alunocurso_id = acadgeral__aluno_curso.alunocurso_id AND documento__pessoa.docgruporegra_id = dgr.docgruporegra_id
