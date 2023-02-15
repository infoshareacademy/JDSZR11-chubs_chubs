-- Correlation between El Nino and sum of firespots 

with table_2 as 
	(select year, phenomenon, severity,
	sum(firespots) as sum_of_firespots,
	case 
	when severity = 'Weak' then 1
	when severity = 'Moderate' then 2
	when severity = 'Strong' then 3
	when severity = 'Very Strong' then 4
	end value_severity
	from el_nino_la_nina enln 
	join inpe_brazilian_amazon_fires ibaf
	on enln."start year" =ibaf."year" 
	where phenomenon='El Nino'
	group by "year", phenomenon, severity
	order by "year")

	select
	round(corr(sum_of_firespots, value_severity):: numeric, 2)
	from table_2