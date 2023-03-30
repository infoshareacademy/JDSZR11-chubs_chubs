with table_1 as (select 
				i."year", 
				firespots,
				sum (firespots) over (partition by year) as sum_firespots_dryseason 
				from inpe_brazilian_amazon_fires i 
				where month in (7, 8, 9, 10, 11)
				order by year)
						
select 
corr(sum_firespots_dryseason, firespots) as correlation_dryseason_firespots
from table_1;