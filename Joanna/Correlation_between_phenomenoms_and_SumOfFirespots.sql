-- Correlation between phenomenons and sum of firespots 

with table_2 as 
	(select year, phenomenon, severity,
	sum(firespots) as sum_of_fires,
	case 
	when phenomenon  = 'La Nina' then 1
	when phenomenon  = 'El Nino' then 2
	end value_phenomenon
	from el_nino_la_nina enln 
	join inpe_brazilian_amazon_fires ibaf
	on enln."start year" =ibaf."year" 
	group by "year", phenomenon, severity
	order by "year")

	select
	round(corr(sum_of_fires, value_phenomenon):: numeric, 2)
	from table_2