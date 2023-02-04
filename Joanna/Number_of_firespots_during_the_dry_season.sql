-- Number of firespots during the dry season

select distinct year,
sum (firespots) over (partition by year) as sum_firespots_dryseason 
from inpe_brazilian_amazon_fires ibaf 
where month in (7, 8, 9, 10, 11)
order by year