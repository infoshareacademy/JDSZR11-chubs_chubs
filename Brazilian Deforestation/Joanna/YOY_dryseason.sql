-- Year-over-year (YOY) for the dry season
-- Here we can see a large increase between 2001 and 2002 and a large decrease between 2010 and 2012

select *,
(sum_firespots_dryseason - lag(sum_firespots_dryseason) over (order by year))*100 / lag(sum_firespots_dryseason) over (order by year) as YOY  
from sum_of_firespots_dryseason 