
-- Unificação de Titulos, os Titulos da matricula [39039] serão incorporadas a matricula [37647]
SELECT
*
FROM;
UPDATE 
	financeiro_titulo 
SET 
    alunocurso_id = 37647
WHERE
    alunocurso_id = 39039;

DELETE FROM acadgeral__aluno_curso WHERE alunocurso_id = 39039;

-- Financeiro__aluno_config_pgto_curso não foi encontrado nenhum registro para nenhuma das matriculas
-- acadgeral__aluno_ingresso não possui registros para nenhuma das matriculas
-- acadperiodo__aluno_resumo não possui registros para a matricula 39039
-- documento__pessoa não possui registros para a matricula 39039
-- protocolo não possui registros para matricula 39039
-- A Alteração do estado da matricula do aluno pode ser feito via interface

-- Levantamento de casos Semelhantes 

