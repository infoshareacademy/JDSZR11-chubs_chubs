create database projekt_SQL;

select * from inpe_brazilian_amazon_fires ibaf

--GRUPOWANIE LICZBY POZAROW PO ROKU
;select "year" as ROK,
		sum(firespots) as Suma_pozarow,
		(sum(firespots)-lag(sum(firespots)) over (order by "year"))*100/lag(sum(firespots)) over (order by "year") as Yoy
from inpe_brazilian_amazon_fires ibaf
group by "year"
order by "year" 

--GRUPOWANIE LICZBY POZAROW PO STANACH
;select state as Stan, sum(firespots) as Suma_pozarow
from inpe_brazilian_amazon_fires ibaf 
group by state
order by sum(firespots) desc

;select *
from states s
order by area desc