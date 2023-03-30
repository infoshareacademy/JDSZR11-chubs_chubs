-- Year-over-year (YOY) for the rainy season 
-- Here we can see a large increase between 2001 and 2002

select *,
(sum_firespots_rainyseason - lag(sum_firespots_rainyseason) over (order by year))*100 / lag(sum_firespots_rainyseason) over (order by year) as YOY  
from sum_of_firespots_rainyseason 