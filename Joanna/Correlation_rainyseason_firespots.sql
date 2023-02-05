-- Correlation between sum of firesports during rainyseason and all firespots
with table_1 as (select 
				i."year", 
				firespots,
				sum (firespots) over (partition by year) as sum_firespots_rainyseason 
				from inpe_brazilian_amazon_fires i 
				where month in (1, 2, 3, 4, 5, 6, 12) 
				order by year)