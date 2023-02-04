-- Ranking of years with with the highest number of firespots during the dry season 

select *,
dense_rank() over (order by sum_of_firespots_dryseason desc) 
from sum_of_firespots_dryseason 