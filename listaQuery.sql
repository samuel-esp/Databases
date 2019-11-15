/*PER CONFRONTARE VALORI DIVERSI FARE UN JOIN INTERNO E CONTROLLARE CHE LA CHIAVE SIA DIVERSA*/

select distinct p1.cognome, p2.nome
from persone p1 join persone p2 on p1.cognome=p2.cognome
where p1.cognome = p2.cognome and p1.cf <> p2.cf

/*PER CONFRONTARE VALORI DIVERSI FARE UN JOIN INTERNO E CONTROLLARE CHE LA CHIAVE SIA DIVERSA*/
