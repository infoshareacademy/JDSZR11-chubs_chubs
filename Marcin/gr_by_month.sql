-- grouping by year and month sum of firespots

select 
ibaf."month",
ibaf."year" ,
sum(ibaf.firespots) as sum_of_firespots
from inpe_brazilian_amazon_fires ibaf
group by ibaf."year" ,ibaf."month" 
order by ibaf."year",ibaf."month" ;





