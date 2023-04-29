-- creates a table using the name and abilities from our 1NF data
-- this is one 2NF table because the data is no longer partially
-- dependent
create table secondnf_t1 as
	select name, abilities
	from firstnf_pokemon_data;

alter table firstnf_pokemon_data
	drop column abilities;

-- creates a table using the distinct rows from the same data without
-- including the abilities column
-- this is our second 2NF table
create table secondnf_t2 as
	select distinct *
	from firstnf_pokemon_data;

-- drops unneccesary temp table
drop table firstnf_pokemon_data;