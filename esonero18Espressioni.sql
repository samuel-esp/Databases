  /*DATABASE USATO PER LE PROVE SQL*/

create schema if not exists "esonero18";
set search_path to "esonero18";

drop table if exists persone; 
drop table if exists utenze; 
drop table if exists bollette; 

CREATE TABLE persone ( 
CF text NOT NULL PRIMARY KEY,
cognome text,
nome text );

CREATE TABLE utenze ( 
codice integer NOT NULL PRIMARY KEY,
titolare text NOT NULL REFERENCES persone,
indirizzo text NOT NULL);

CREATE TABLE bollette ( 
numero integer NOT NULL PRIMARY KEY,
utenza integer NOT NULL REFERENCES utenze ,
data date NOT NULL,
importo integer NOT NULL,
datapagamento date );


insert into persone values('RSMR','Rossi', 'Mario');
insert into persone values('RSLC','Rossi', 'Luca');
insert into persone values('VRGS','Verdi', 'Giuseppe');
insert into persone values('BNMR','Bianchi', 'Mario');

insert into utenze values(10,'RSMR', 'Roma');
insert into utenze values(11,'RSLC', 'Roma');
insert into utenze values(12,'VRGS', 'Roma');
insert into utenze values(13,'BNMR', 'Milano');

insert into bollette values(01, 10, '2019-01-01', 35, '2019-01-02');
insert into bollette values(02, 11, '2019-01-01', 40, '2019-01-03');
insert into bollette values(03, 10, '2019-05-01', 35, '2019-01-07');
insert into bollette values(04, 10, '2019-06-01', 37, '2019-01-09');
insert into bollette values(05, 10, '2019-06-01', 37, null);

=========================================================================

/*ESERCIZIO 4*/

create or replace view Pagato as
select codice as cod_uno, sum(importo) as totalePagato, 
from utenze join bollette on codice=utenza
where datapagamento is not null 
group by codice

Pagato = REN cod_uno, totalePagato<-codice, SUM(importo) (SELECT codice, SUM(importo) ( GROUP BY codice ( SELECT datapagamento<>null (Utenze JOINcodice=utenza Bollette)))

create or replace view DaPagare as
select codice as cod_due, sum(importo) as totaleDaPagare
from utenze join bollette on codice=utenza
where datapagamento is null 
group by codice

DaPagare = REN cod_due, totaleDaPagare<-codice, SUM(importo) (SELECT codice, SUM(importo) ( GROUP BY codice ( SELECT datapagamento=null (Utenze JOINcodice=utenza Bollette)))

create or replace view passouno as
select cod_uno as listacodici, totalePagato, 0 as totaleDaPagare
from Pagato
union all
select cod_due, 0 as totalePagato, totaleDaPagare
from DaPagare

passouno = REN listacodici<-cod_uno (SEL cod_uno, totalePagato, totaleDaPagare=0) UNION SEL (cod_due, totalePagato as 0, totaleDaPagare=0 )

create or replace view passodue
select listacodici, sum(totalepagato) as pag, sum(totaledapagare) as dapag
from passouno 
group by listacodici

passodue = SEL listacodici, SUM(totalepagato), SUM(totaledapagare) ( GROUP BY listacodici (passouno))

select isnull(pag, 0 ) from passodue
select isnull(dapag, 0 ) from passodue

select listacodici as utenza, totalePagato, totaleDaPagare, totalePagato-TotaleDaPagare as debito
from passodue

/*ESERCIZIO 4 ALGEBRA*/

Pagato = REN cod_uno, totalePagato<-codice, SUM(importo) (PROJ codice, SUM(importo) ( AGG codice ( SEL datapagamento<>null (Utenze JOINcodice=utenza Bollette)))
DaPagare = REN cod_due, totaleDaPagare<-codice, SUM(importo) (PROJ codice, SUM(importo) ( AGG codice ( SEL datapagamento=null (Utenze JOINcodice=utenza Bollette)))
passouno = REN listacodici<-cod_uno (PROJ (cod_uno, totalePagato, totaleDaPagare=0) UNION PROJ (cod_due, totalePagato as 0, totaleDaPagare=0 )
passodue = PROJ listacodici, SUM(totalepagato), SUM(totaledapagare) ( AGG listacodici (passouno))
PROJ listacodici, totalePagato, totaleDaPagare, totalePagato-TotaleDaPagare

/*ESERCIZIO 5 SQL*/

