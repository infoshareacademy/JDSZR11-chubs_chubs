-- Cumulative distribution for the dry season 

select year, 
sum_firespots_dryseason,
cume_dist() over (order by sum_firespots_dryseason)
from sum_of_firespots_dryseason 
order by "year" 