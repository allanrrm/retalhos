create database auto;
USE AUTO;

CREATE TABLE AUTOMOVEIS
(
  Codigo int not null,
  Fabricante  char(30)  not null,
  Modelo char(30)  not Null,
  Ano char(4) not null,
  Pais  char(15)  not Null,
  Preco_tabela  int not null,
  constraint PK_CodigoAno primary key (codigo)
  );


Insert into AUTOMOVEIS values (10,'Chevrolet'	,'Zafira'	,'2011','Brasil',35000);
Insert into AUTOMOVEIS values (12,'Chevrolet'	,'Zafira'	,'2012','Brasil',38000);
Insert into AUTOMOVEIS values (13,'Chevrolet'	,'Zafira'	,'2017','Brasil',75000);
Insert into AUTOMOVEIS values (14,'Chevrolet'	,'Vectra'	,'2014','Brasil',45000);
Insert into AUTOMOVEIS values (15,'Chevrolet'	,'Vectra'	,'2016','Brasil',50000);
Insert into AUTOMOVEIS values (16,'Chevrolet'	,'Astra '	,'2012','Brasil',35000);
Insert into AUTOMOVEIS values (17,'Chevrolet'	,'Astra '	,'2016','Brasil',47000);
Insert into AUTOMOVEIS values (18,'Chevrolet'	,'Astra '	,'2017','Brasil',52010);
Insert into AUTOMOVEIS values (20,'Fiat'	,'Uno'		,'2019','Brasil',20100);
Insert into AUTOMOVEIS values (21,'Fiat'	,'Palio'	,'2014','Brasil',38000);
Insert into AUTOMOVEIS values (22,'Fiat'	,'Doblo'	,'2016','Brasil',30000);
Insert into AUTOMOVEIS values (23,'Fiat'	,'Grand Siena'	,'2014','Brasil',65000);
Insert into AUTOMOVEIS values (24,'Fiat'	,'Weekend'	,'2016','Brasil',38000);
Insert into AUTOMOVEIS values (25,'Fiat'	,'Argo'		,'2018','Brasil',55000);
Insert into AUTOMOVEIS values (30,'Peugeot'	,'208'		,'2013','Argentina',43000);
Insert into AUTOMOVEIS values (31,'Peugeot'	,'2008'		,'2014','Argentina',56000);
Insert into AUTOMOVEIS values (32,'Peugeot'	,'3008'		,'2013','Argentina',65000);
Insert into AUTOMOVEIS values (33,'Peugeot'	,'5008'		,'2013','Argentina',85000);
Insert into AUTOMOVEIS values (40,'Citroen'	,'C3'		,'2015','França',44000);
Insert into AUTOMOVEIS values (41,'Citroen'	,'C4 Picasso'	,'2017','França',54000);
Insert into AUTOMOVEIS values (42,'Citroen'	,'C4 Cactus'	,'2017','França',64000);
Insert into AUTOMOVEIS values (43,'Citroen'	,'Aircross'	,'2019','França',75000);
Insert into AUTOMOVEIS values (44,'Citroen'	,'C4 Lounge'	,'2017','França',50000);
Insert into AUTOMOVEIS values (50,'Volkswagen'	,'Fusca'	,'2015','Brasil',10000);
Insert into AUTOMOVEIS values (51,'Volkswagen'	,'Polo'		,'2010','Brasil',45000);
Insert into AUTOMOVEIS values (52,'Volkswagen'	,'Golf'		,'2017','Brasil',40100);
Insert into AUTOMOVEIS values (53,'Volkswagen'	,'Fox'		,'2018','Brasil',53100);
Insert into AUTOMOVEIS values (54,'Volkswagen'	,'Tiguan'	,'2018','Brasil',50100);
Insert into AUTOMOVEIS values (60,'Mitsubishi'	,'Pajero'	,'2017','Japao ',90000);
Insert into AUTOMOVEIS values (70,'Ferrari'	,'TestaRossa'	,'2011','Italia',200000);
Insert into AUTOMOVEIS values (80,'Renault'	,'Zoe'		,'2017','França',48000);
Insert into AUTOMOVEIS values (81,'Renault'	,'Sandero'	,'2017','França',58000);
Insert into AUTOMOVEIS values (82,'Renault'	,'Logan'	,'2016','França',80000);
Insert into AUTOMOVEIS values (83,'Renault'	,'Duster'	,'2018','França',82010);



CREATE TABLE REVENDEDORA
(
  CNPJ    char(15) not null,
  Nome   char(30) not null,
  Proprietario    char(30) not Null,
  Cidade char(15) not null,
  Estado char(2)  not Null,
  constraint PK_CNPJ primary key (CNPJ)
  );
  
 

Insert into REVENDEDORA  values ('11111111111111 ','GATAO Veiculos ','Ben Cisco','Rio de Janeiro ','RJ');
Insert into REVENDEDORA  values ('11111111111112 ','Dirija Veiculos','Johnatan Archer','Rio de Janeiro ','RJ');
Insert into REVENDEDORA  values ('11131111111113 ','SUPER Veiculos ','Catherine Janeway','Rio de Janeiro ','RJ');
Insert into REVENDEDORA  values ('11134411111112 ','Detroit Car ','Magali','Brasilia ','DF');
Insert into REVENDEDORA  values ('11134418901112 ','Itavema','Picard','Rio de Janeiro ','RJ');
Insert into REVENDEDORA  values ('11136543011192 ','ROBAUTO veiculos','Cascão','Santo Andre    ','SP');
Insert into REVENDEDORA  values ('11211111111112 ','Dirija Veiculos','Christofer Pike','Rio de Janeiro ','RJ');
Insert into REVENDEDORA  values ('12344418901112 ','CarHouse','Monica','Rio de Janeiro ','RJ');
Insert into REVENDEDORA  values ('17131111177113 ','Iguauto Automóveis','James Kirk','Sao Paulo','SP');
Insert into REVENDEDORA  values ('56784189011128 ','Green Star','Cebolinha ','Niteroi  ','RJ');




-- drop table CONSUMIDORES
CREATE TABLE CONSUMIDORES
(
  CPF    char(11) not null,
  Nome   varchar(50) not null,
  Cidade varchar(15) not null,
  Estado char(2)  not Null,
  constraint PK_CPF primary key (CPF)
  );

Insert into CONSUMIDORES values ('11122278944','Peter Centera', 'Rio de Janeiro', 'RJ' );
Insert into CONSUMIDORES values ('01122233344','Michael Jackson', 'Rio de Janeiro', 'RJ' );
Insert into CONSUMIDORES values ('11120233344','Freddy Mercury', 'Rio de Janeiro', 'RJ' );
Insert into CONSUMIDORES values ('11122230344','john Oats', 'Rio de Janeiro', 'RJ' );
Insert into CONSUMIDORES values ('11122233300','Daryl Hall', 'Rio de Janeiro', 'RJ' );
Insert into CONSUMIDORES values ('99922233300','DC Sunshine Band', 'Brasilia', 'DF' );
Insert into CONSUMIDORES values ('88822233300','Donna Summer', 'Brasilia', 'DF' );
Insert into CONSUMIDORES values ('77722233300','Air Supply', 'Brasilia', 'DF' );
Insert into CONSUMIDORES values ('66622233300','David Bowie', 'Brasilia', 'DF' );
Insert into CONSUMIDORES values ('55522233300','Duran Duran', 'Brasilia', 'DF' );
Insert into CONSUMIDORES values ('44422233300','Fleetwood Mac', 'Brasilia', 'DF' );
Insert into CONSUMIDORES values ('66622233999','Bryan Adams', 'Brasilia', 'DF' );
Insert into CONSUMIDORES values ('66622233888','Kim Carnes', 'Sao Paulo', 'SP' );
Insert into CONSUMIDORES values ('66622233777','Men at Work', 'Sao Paulo', 'SP' );
Insert into CONSUMIDORES values ('66622233666','PetShop Boys', 'Sao Paulo', 'SP' );
Insert into CONSUMIDORES values ('66622233555','New Order', 'Sao Paulo', 'SP' );
Insert into CONSUMIDORES values ('66622233444','Simple Mind', 'Sao Paulo', 'SP' );
Insert into CONSUMIDORES values ('66622233333','Spandau Ballet', 'Sao Paulo', 'SP' );
Insert into CONSUMIDORES values ('66622233222','The Cars', 'Sao Paulo', 'SP' );
Insert into CONSUMIDORES values ('66622233111','Christopher Cross', 'Sao Paulo', 'SP' ); 
Insert into CONSUMIDORES values ('67667533111','The Corrs', 'Sao Paulo', 'SP' ); 
Insert into CONSUMIDORES values ('68622233111','Queen', 'Sao Paulo', 'SP' ); 

--- ************************** Credito ************************** 
CREATE TABLE CREDITO
(
  CPF    	char(11) PRIMARY KEY,
  Situacao	int not null
  );
  
Insert into CREDITO values ('11122278944', 1 );
Insert into CREDITO values ('01122233344', 1 );
Insert into CREDITO values ('11120233344', 0 );
Insert into CREDITO values ('11122230344', 1 );
Insert into CREDITO values ('11122233300', 1 );
Insert into CREDITO values ('99922233300', 1 );
Insert into CREDITO values ('88822233300', 0 );
Insert into CREDITO values ('77722233300', 0 );
Insert into CREDITO values ('66622233300', 1 );
Insert into CREDITO values ('55522233300', 0 );
Insert into CREDITO values ('44422233300', 1 );
Insert into CREDITO values ('66622233999', 0 );
Insert into CREDITO values ('66622233888', 1 );
Insert into CREDITO values ('66622233777', 1);
Insert into CREDITO values ('66622233666', 1 );
Insert into CREDITO values ('66622233555', 1 );
Insert into CREDITO values ('66622233444', 1 );
Insert into CREDITO values ('66622233333', 1 );
Insert into CREDITO values ('66622233222', 0 );
Insert into CREDITO values ('66622233111', 1 ); 
Insert into CREDITO values ('67667533111', 1 ); 
Insert into CREDITO values ('68622233111', 1 );
--- ************************** GARAGENS ************************** 

CREATE TABLE GARAGENS
(
   CNPJ     char(15) not null,
   Codigo  int not null,
   Quantidade int not null,
  constraint PK_GARAGE primary key (CNPJ,Codigo),
  constraint FK_Gar1 foreign key (Codigo) references AUTOMOVEIS(Codigo),
  constraint FK_Gar2 foreign key (CNPJ) references REVENDEDORA(CNPJ)
  );



Insert into GARAGENS  values ('11111111111112 ',21,2);
Insert into GARAGENS  values ('11111111111112 ',30,2);
Insert into GARAGENS  values ('11111111111112 ',12,2);
Insert into GARAGENS  values ('11111111111112 ',24,2);
Insert into GARAGENS  values ('11131111111113 ',41,1);
Insert into GARAGENS  values ('11131111111113 ',42,1);
Insert into GARAGENS  values ('11131111111113 ',52,1);
Insert into GARAGENS  values ('11131111111113 ',25,1);
Insert into GARAGENS  values ('11134411111112 ',10,1);
Insert into GARAGENS  values ('11134411111112 ',22,1);
Insert into GARAGENS  values ('11134411111112 ',82,1);
Insert into GARAGENS  values ('11134411111112 ',60,4);
Insert into GARAGENS  values ('11134418901112 ',81,3);
Insert into GARAGENS  values ('11134418901112 ',83,3);
Insert into GARAGENS  values ('11134418901112 ',70,3);
Insert into GARAGENS  values ('11136543011192 ',81,2);
Insert into GARAGENS  values ('11136543011192 ',22,2);
Insert into GARAGENS  values ('11136543011192 ',52,2);
Insert into GARAGENS  values ('11136543011192 ',12,2);
Insert into GARAGENS  values ('11211111111112 ',51,1);
Insert into GARAGENS  values ('11211111111112 ',40,1);
Insert into GARAGENS  values ('11211111111112 ',10,5);
Insert into GARAGENS  values ('12344418901112 ',60,4);
Insert into GARAGENS  values ('12344418901112 ',31,4);
Insert into GARAGENS  values ('12344418901112 ',30,4);
Insert into GARAGENS  values ('12344418901112 ',40,4);
Insert into GARAGENS  values ('12344418901112 ',18,4);
Insert into GARAGENS  values ('17131111177113 ',81,3);
Insert into GARAGENS  values ('17131111177113 ',83,3);
Insert into GARAGENS  values ('17131111177113 ',53,3);
Insert into GARAGENS  values ('17131111177113 ',12,3);
Insert into GARAGENS  values ('56784189011128 ',41,2);
Insert into GARAGENS  values ('56784189011128 ',43,2);
Insert into GARAGENS  values ('56784189011128 ',33,2);
Insert into GARAGENS  values ('56784189011128 ',18,3);

--- ************************** NEGOCIOS ************************** 

CREATE TABLE NEGOCIOS
(
   CPF     char(11) not null,
   CNPJ     char(15) not null,
   Codigo  int not null,
   DataC   Char(10),
   Preco   int not null,
  constraint PK_Negocio primary key (CPF,CNPJ,Codigo)
  );

alter table NEGOCIOS add constraint FK_Cons1 foreign key (Codigo) references AUTOMOVEIS(Codigo);
alter table NEGOCIOS add constraint FK_Cons2 foreign key (CNPJ) references REVENDEDORA(CNPJ);
alter table NEGOCIOS add constraint FK_Cons3 foreign key (CPF) references CONSUMIDORES(CPF);


Insert into NEGOCIOS values ('66622233555','11111111111112 ', '10', '01-07-2018', 38000 );
Insert into NEGOCIOS values ('66622233888','11111111111112 ', '20', '01-03-2018', 49000 );
Insert into NEGOCIOS values ('99922233300','11131111111113 ', '50', '01-07-2018', 17500 );
Insert into NEGOCIOS values ('11122278944','11134411111112 ', '14', '10-07-2018', 53000 );
Insert into NEGOCIOS values ('77722233300','11134411111112 ', '22', '25-10-2018', 49000 );
Insert into NEGOCIOS values ('01122233344','11136543011192 ', '51', '05-08-2018', 57500 );
Insert into NEGOCIOS values ('66622233666','11111111111112 ', '15', '01-07-2018', 57000 );
Insert into NEGOCIOS values ('66622233888','11111111111112 ', '60', '01-03-2018', 106000 );
Insert into NEGOCIOS values ('66622233300','11131111111113 ', '33', '01-07-2018', 97500 );
Insert into NEGOCIOS values ('11122230344','56784189011128 ', '18', '10-07-2018', 63000 );
Insert into NEGOCIOS values ('66622233666','11134411111112 ', '10', '25-10-2018', 55000 );
Insert into NEGOCIOS values ('01122233344','56784189011128 ', '23', '05-08-2018', 65000 );

-- Tabela Negocios Suspensos

CREATE TABLE NEGSUSP
(
   CPF     char(11) not null,
   CNPJ     char(15) not null,
   Codigo  int not null,
   DataC   Char(10),
   Preco   int not null,
  constraint PK_NegSusp primary key (CPF,CNPJ,Codigo)
  )
