
create table	def_area_one (
								year int4,
								state varchar(2),
								area_km2 int4

							);
						
INSERT INTO def_area_one  select "Ano/Estados" ,'ac'as state ,ac from def_area da,
INSERT INTO def_area_one  select "Ano/Estados" ,'am'as state ,am from def_area da, 
INSERT INTO def_area_one  select "Ano/Estados" ,'ap'as state ,ap from def_area da, 
INSERT INTO def_area_one  select "Ano/Estados" ,'ma'as state ,ma from def_area da, 
INSERT INTO def_area_one  select "Ano/Estados" ,'mt'as state ,mt from def_area da, 
INSERT INTO def_area_one  select "Ano/Estados" ,'pa'as state ,pa from def_area da, 
INSERT INTO def_area_one  select "Ano/Estados" ,'ro' as state ,ro from def_area da,
INSERT INTO def_area_one  select "Ano/Estados" ,'rr'as state ,rr from def_area da,
INSERT INTO def_area_one  select "Ano/Estados" ,'to' as state ,"TO" from def_area da ;

select concat_ws ('_',state,year) as id_year, *
from def_area_one da ;
select * 
from def_area da ;

