<<<<<<< HEAD
1)	Listar consumidores cadastrados (todos os campos)
select * from consumidores;

2)	Listar fabricantes de automóveis e seus respectivos países 
select fabricante, pais from automoveis;

3)	Quais são os carros (Fabricante, modelo, Ano) que custam mais do que R$ 50.000?
select fabricante, modelo, ano from automoveis where preco_tabela > 50000;
Chevrolet	Zafira	2017
Chevrolet	Astra	2017
Fiat	Grand Siena	2014
Fiat	Argo	2018
Peugeot	2008	2014
Peugeot	3008	2013
Peugeot	5008	2013
Citroen	C4 Picasso	2017
Citroen	C4 Cactus	2017
Citroen	Aircross	2019
Volkswagen	Fox	2018
Volkswagen	Tiguan	2018
Mitsubishi	Pajero	2017
Ferrari	TestaRossa	2011
Renault	Sandero	2017
Renault	Logan	2016
Renault	Duster	2018

 
4)	Qual é o valor (preço de tabela) de automóvel mais barato a venda? 
select min(preco_tabela) from automoveis
R$10.000
 
5)	Qual o modelo de automóvel mais barato a venda?
select modelo from automoveis order by preco_tabela
Fusca

6)	Listar fabricante e o valor de automóvel mais barato a venda por fabricante. 
 select fabricante ,min(preco_tabela) from automoveis group by fabricante
Chevrolet	35000
Fiat	20100
Peugeot	43000
Citroen	44000
Volkswagen	10000
Mitsubishi	90000
Ferrari	200000
Renault	48000
 
7)	Apresentar a quantidade de Negócios realizados, e o total de dinheiro movimentado nas vendas 
select count(*) as Quantidade, sum(preco) as Total from negocios;
12	707500


8)	Apresentar a quantidade de Negócios por CNPJ, listando o CNPJ da revendedora e o e o total de vendas por CNPJ
select n.CNPJ, count(n.cnpj) from negocios n inner join revendedora r on n.CNPJ = r.CNPJ group by n.CNPJ;

11111111111112	4
11131111111113	2
11134411111112	3
11136543011192	1
56784189011128	2


9)	Apresentar a quantidade de Negócios por CNPJ, listando o CNPJ da revendedora, e o total de vendas por CNPJ, considerando apenas vendas superiores a 3 unidades 
select n.CNPJ, count(n.cnpj) from negocios n inner join revendedora r on n.CNPJ = r.CNPJ group by n.CNPJ having count(n.cnpj) > 3;
11111111111112	4



10)	Listar os negócios realizados, apresentando nome do consumidor, CPF, CODIGO do veículo adquirido e preço pago
SELECT 
    c.Nome AS 'Nome do Cliente',
    c.CPF AS 'CPF',
    a.Codigo 'Código do Automovel',
    n.Preco 'Preço do Automovel'
FROM
    negocios n
        INNER JOIN
    consumidores c ON n.CPF = c.CPF
        INNER JOIN
    automoveis a ON n.Codigo = a.Codigo;

Michael Jackson	01122233344	51	57500
Michael Jackson	01122233344	23	65000
john Oats	11122230344	18	63000
Peter Centera	11122278944	14	53000
David Bowie	66622233300	33	97500
New Order	66622233555	10	38000
PetShop Boys	66622233666	15	57000
PetShop Boys	66622233666	10	55000
Kim Carnes	66622233888	20	49000
Kim Carnes	66622233888	60	106000
Air Supply	77722233300	22	49000
DC Sunshine Band	99922233300	50	17500


11)	Listar os negócios realizados, apresentando nome do consumidor, CPF, fabricante e modelo do veículo adquirido e preço pago
SELECT 
    c.Nome AS 'Nome do Cliente',
    c.CPF AS 'CPF',
    a.Fabricante as 'Fabricante',
    a.Modelo as 'Modelo',
    n.Preco 'Preço do Automovel'
FROM
    negocios n
        INNER JOIN
    consumidores c ON n.CPF = c.CPF
        INNER JOIN
    automoveis a ON n.Codigo = a.Codigo;

Michael Jackson	01122233344	Volkswagen	Polo	57500
Michael Jackson	01122233344	Fiat	Grand Siena	65000
john Oats	11122230344	Chevrolet	Astra	63000
Peter Centera	11122278944	Chevrolet	Vectra	53000
David Bowie	66622233300	Peugeot	5008	97500
New Order	66622233555	Chevrolet	Zafira	38000
PetShop Boys	66622233666	Chevrolet	Vectra	57000
PetShop Boys	66622233666	Chevrolet	Zafira	55000
Kim Carnes	66622233888	Fiat	Uno	49000
Kim Carnes	66622233888	Mitsubishi	Pajero	106000
Air Supply	77722233300	Fiat	Doblo	49000
DC Sunshine Band	99922233300	Volkswagen	Fusca	17500
=======
testando 1232
>>>>>>> 8a01810dd55ee69d8d0a27fac6d610dc57fa5e82
