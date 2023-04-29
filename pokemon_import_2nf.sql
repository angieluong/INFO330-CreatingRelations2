create table secondnf_t1 as
	select name, abilities
	from firstnf_pokemon_data;

alter table firstnf_pokemon_data
	drop column abilities;

create table secondnf_t2 as
	select distinct *
	from firstnf_pokemon_data;


drop table firstnf_pokemon_data;