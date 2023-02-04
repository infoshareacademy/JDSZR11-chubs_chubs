-- Median for the dry season 

select 
percentile_disc(0.5) within group (order by sum_firespots_dryseason)
from sum_of_firespots_dryseason