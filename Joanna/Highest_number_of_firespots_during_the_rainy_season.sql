-- Ranking of years with with the highest number of firespots during the rainy season 

select *,
dense_rank() over (order by sum_firespots_rainyseason desc) 
from sum_of_firespots_rainyseason 