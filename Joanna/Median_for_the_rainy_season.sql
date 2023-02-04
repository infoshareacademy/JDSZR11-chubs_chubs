
-- Median for the rainy season 

select 
percentile_disc(0.5) within group (order by sum_firespots_rainyseason)
from sum_of_firespots_rainyseason 