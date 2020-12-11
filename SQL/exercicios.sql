1) Busca consulta de médico que tem consulta marcada e as datas de suas consultas.
select medicos.nome,
consultas.data
from medicos
inner join consultas on consultas.codm = medicos.codm;

2)Buscar número e a capacidade dos ambulatórios do quinto andar, e o nome dos médicos ortopedistas que atendem nele.
select ambulatorio.nroa,
ambulatorio.capacidade,
medicos.nome
from ambulatorio
inner join medicos on medicos.nroa = ambulatorio.nroa
where ambulatorio.andar = 5 and medicos.especialidade = 'Ortopedia';

3)Listar em ordem crescente o nome e o número de consultas de cada médico
select medicos.nome,
count(consultas.codm) numero_consultas
from medicos
inner join consultas on medicos.codm = consultas.codm
group by medicos.nome
order by numero_consultas;

4) Listar em ordem crescente o nome e o numero de consultas de cada medico com mais de 60 consultas marcadas.
select medicos.nome,
count(consultas.codm) numero_consultas
from medicos
inner join consultas on medicos.codm = consultas.codm
group by medicos.nome
having numero_consultas > 60
order by numero_consultas;

5)Buscar o nome, especialidade e a idade de todos os médicos, e para aqueles que tem consultas marcadas,
mostrar os dados de suas consultas (data e hora).
select medicos.nome,
medicos.especialidade,
medicos.idade,
consultas.data,
consultas.hora
from medicos
left join consultas on consultas.codm = medicos.codm;

6)Buscar o numero e andares de todos os ambulatórios e para aqueles ambulatórios nos quais os médicos dão atendimento
exibir o código e nome dos médicos associados
select ambulatorio.nroa,
ambulatorio.andar,
medicos.codm,
medicos.nome
from ambulatorio
left join medicos on medicos.nroa = ambulatorio.nroa;