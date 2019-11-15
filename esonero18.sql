====================================================================================

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
ESERCIZIO 1 -- CARDINALITA

/*DOMANDA 1 SQL*/

SELECT *
FROM utenze JOIN persone ON titolare=CF
WHERE importo > 100

MIN SIMBOLI: 0 
MIN VALORE: 0
MAX SIMBOLI: B 
MAX VALORE: 100000

(Join tra key e reference seguito da una selezione)


/*DOMANDA 2 SQL*/

SELECT *
FROM bollette JOIN utenze ON utenza=codice
JOIN persone ON titolare=CF
WHERE importo > 100

MIN SIMBOLI: 0 
MIN VALORE: 0
MAX SIMBOLI: B 
MAX VALORE: 100000 

(Join con key e reference seguito da una selezione)

/*DOMANDA 3 SQL*/

SELECT codice, indirizzo, SUM(importo) AS totale
FROM utenze JOIN bollette ON codice = utenza
GROUP BY codice, indirizzo

MIN SIMBOLI: 1 
MIN VALORE: 1
MAX SIMBOLI: U
MAX VALORE: 20000 

(Raggruppamento per key di R2 dopo aver eseguito un Join con key e reference)

==========================================================================

ESERCIZIO 3 CARDINALITA'

/*DOMANDA 1*/

CHECK ( ( ( Netto = StipLordo - Trattenute) AND (OK = ’true’))
OR ((Netto <> StipLordo - Trattenute) AND (OK = ’false’ ) ) )

Questa e' una condizione di "se e solo" se di conseguenza le tabelle che la soddisfano saranno:

A: NO
B: SI 
C: NO
D: NO


/*DOMANDA 2*/

CHECK ( ( NOT (OK = ’true’) ) OR ( Netto = Lordo - Tasse ) )

Questa condizione dice che se OK vale true allora il netto deve per forza valere quella differenza, non specifica cosa accade per valori diversi da false; le tabelle che la soddisfano saranno:

A: NO
B: SI 
C: SI
D: SI

/*DOMANDA 3*/

CHECK ( NOT( Netto = Lordo - Tasse ) ) OR ( ( (OK = ’true’) )

Questa condizione dice che se netto e' eguale a quella differenza OK deve essere per forza valere true, non specifica cosa succede altrimenti; le tabelle che la soddisfano saranno:

A: SI
B: SI 
C: NO
D: NO


