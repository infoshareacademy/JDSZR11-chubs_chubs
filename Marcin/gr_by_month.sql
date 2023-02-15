-- grouping by year and month sum of firespots

select
percentile_disc(0.5) within group (order by sum_of_firespots),
max(sum_of_firespots), 
STDDEV(sum_of_firespots)
from(
select 
ibaf."month",
ibaf."year" ,
AVG(firespots),
sum(ibaf.firespots) as sum_of_firespots,
STDDEV(firespots), 
variance(firespots)
from inpe_brazilian_amazon_fires ibaf
group by ibaf."year" ,ibaf."month" 
order by ibaf."year",ibaf."month") as year_month
;





