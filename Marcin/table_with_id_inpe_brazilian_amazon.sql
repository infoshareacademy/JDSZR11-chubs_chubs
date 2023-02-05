-- creation of id to creata connection in Tablou 
select 
lower(concat_ws ('_',left(state,2),"year" )) as id_year,
*
from inpe_brazilian_amazon_fires ibaf;