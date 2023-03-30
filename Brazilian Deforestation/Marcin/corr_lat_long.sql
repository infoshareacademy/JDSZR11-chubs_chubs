-- checking for crorelation for entire data between firespots and latitude/longitude 
select 
corr(ibaf.firespots,ibaf.latitude) as corr_by_south,
corr(ibaf.firespots,ibaf.longitude) as corr_by_west
from inpe_brazilian_amazon_fires ibaf ;