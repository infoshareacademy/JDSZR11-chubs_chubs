-- Number of firespots during the rainy season

select distinct year,
sum (firespots) over (partition by year) as sum_firespots_rainyseason 
from inpe_brazilian_amazon_fires ibaf 
where month in (1, 2, 3, 4, 5, 6, 12)
order by year