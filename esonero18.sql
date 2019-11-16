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


