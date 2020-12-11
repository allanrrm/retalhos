SELECT ad.* FROM acadgeral__disciplina ad 

WHERE ad.disc_nome ='estágio Supervisionado II';

-- disc_id = 83

SELECT * FROM acadperiodo__aluno_resumo aar 
INNER JOIN acadgeral__docente_formacao adf ON aar.docente_formacao_id = adf.form_id
WHERE aar.alunocurso_id = 000000029742;



SELECT ad.docente_id, p.pes_nome FROM acadgeral__docente ad INNER JOIN pessoa p ON ad.pes_id = p.pes_id;
-- Sabrina 019

SELECT p.pes_nome, ad.*, adf.*
FROM acadgeral__docente_formacao adf 
INNER JOIN acadgeral__docente ad ON ad.docente_id = adf.docente_id 
INNER JOIN pessoa p ON p.pes_id = ad.pes_id
WHERE adf.docente_id = 19;



SELECT p.pes_id, p.pes_nome, aa.aluno_id, aac.alunocurso_id 
FROM pessoa p 
INNER JOIN acadgeral__aluno aa ON p.pes_id = aa.pes_id 
INNER JOIN acadgeral__aluno_curso aac ON aac.aluno_id = aa.aluno_id
WHERE p.pes_nome = 'AMANDA BOTIN PEISINO';



