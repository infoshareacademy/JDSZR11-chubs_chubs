

with short_position as (select 
						ibaf."year",
						ibaf.state,
						(to_char(ibaf.latitude,'FM90.0')::numeric) as south,
						(to_char(ibaf.longitude,'FM990.0')::numeric) as west,
						ibaf.firespots
						from inpe_brazilian_amazon_fires ibaf
						order by ibaf.latitude desc, ibaf.longitude desc 
						)
						
select 
corr(firespots,south) as corr_by_south,
corr(firespots,west) as corr_by_west
from short_position;
