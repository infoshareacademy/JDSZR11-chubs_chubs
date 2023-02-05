-- Correlation between El Nino and sum of firespots during rainyseason 
	
with table_2 as 
	(select *,
	case 
	when severity = 'Weak' then 1
	when severity = 'Moderate' then 2
	when severity = 'Strong' then 3
	when severity = 'Very Strong' then 4
	end value_severity
	from el_nino_la_nina enln 
	join sum_of_firespots_rainyseason s
	on enln."start year" =s."year" 
	where phenomenon='El Nino'
	)

	select
	round(corr(sum_firespots_rainyseason, value_severity):: numeric, 2)
	from table_2