-- creation of id to creata connection in Tablou 
select 
case 
	when state ='ACRE' then lower(concat_ws ('_','ac',"year" )) 
	when state ='AMAPA' then lower(concat_ws ('_','ap',"year" )) 
	when state ='AMAZONAS' then lower(concat_ws ('_','am',"year" )) 
	when state ='MARANHAO' then lower(concat_ws ('_','ma',"year" )) 
	when state ='MATO GROSSO' then lower(concat_ws ('_','mt',"year" )) 
	when state ='PARA' then lower(concat_ws ('_','pa',"year" )) 
	when state ='RONDONIA' then lower(concat_ws ('_','ro',"year" )) 
	when state ='RORAIMA' then lower(concat_ws ('_','rr',"year" )) 
	when state ='TOCANTINS' then lower(concat_ws ('_','to',"year" )) 
end as id_year,
year,month,initcap(state) as state,latitude,longitude ,firespots  
from inpe_brazilian_amazon_fires ibaf;

