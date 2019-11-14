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
