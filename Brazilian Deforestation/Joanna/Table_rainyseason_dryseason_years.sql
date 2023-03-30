-- Table that compares number of firespots during the rainy season and dry season

create view sum_of_firespots_rainyseason as
select distinct year,
sum (firespots) over (partition by year) as sum_firespots_rainyseason 
from inpe_brazilian_amazon_fires ibaf 
where month in (1, 2, 3, 4, 5, 6, 12)
order by year

create view sum_of_firespots_dryseason as
select distinct year,
sum (firespots) over (partition by year) as sum_firespots_dryseason 
from inpe_brazilian_amazon_fires ibaf 
where month in (7, 8, 9, 10, 11)
order by year

select r.year,
r.sum_firespots_rainyseason,
d.sum_firespots_dryseason  
from sum_of_firespots_rainyseason r
join sum_of_firespots_dryseason d
on r.year=d.year