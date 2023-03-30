select *,
case 
	when severity = 'Weak' then 1
	when severity = 'Moderate' then 2
	when severity = 'Strong' then 3
	when severity = 'Very Strong' then 4
end value_severity
from el_nino_la_nina enln ;

select *
corr
from el_nino_la_nina enln 
join inpe_brazilian_amazon_fires ibaf 
on "start year" = ibaf."year" ;

select 