-- Teste Universa
select * from selecao_inscricao where inscricao_id = @inscricao_id;
select * from acesso_pessoas where pes_fisica = @pes_id;
select * from acesso_usuarios_grupos where usuario_id = @usuario_id;
select * from acesso_usuarios where id = @usuario_id;
select * from endereco where pes_id = @pes_id;
select * from pessoa where pes_id = @pes_id;