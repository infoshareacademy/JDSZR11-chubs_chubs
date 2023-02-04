-- Cumulative distribution for the rainy season 

select year, 
sum_firespots_rainyseason,
cume_dist() over (order by sum_firespots_rainyseason)
from sum_of_firespots_rainyseason 
order by "year" 