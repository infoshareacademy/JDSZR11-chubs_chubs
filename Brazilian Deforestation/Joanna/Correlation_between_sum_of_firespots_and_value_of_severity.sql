-- Correlation between sum of firespots and value of severity

with table_2 as 
	(select year,
	sum(firespots) over (partition by year) as sum_fire,
	case 
	when severity = 'Weak' then 1
	when severity = 'Moderate' then 2
	when severity = 'Strong' then 3
	when severity = 'Very Strong' then 4
	end value_severity
	from el_nino_la_nina enln 
	join inpe_brazilian_amazon_fires ibaf 
	on enln."start year" =ibaf."year" 
	group by year, firespots, severity
	order by "year"),
	
table_3 as 
	(select 
	distinct year, sum_fire, value_severity
	from table_2
	order by year)

	select
	round(corr(value_severity, sum_fire)::decimal,2) as correlation
	from table_3