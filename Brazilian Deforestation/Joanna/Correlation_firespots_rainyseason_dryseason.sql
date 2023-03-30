-- Correlation between number of firespots during the rainy season and dry season

select 
corr(r.sum_firespots_rainyseason, d.sum_firespots_dryseason)
from sum_of_firespots_rainyseason r
join sum_of_firespots_dryseason d
on r.year=d.year