create table firstnf AS
WITH split(name, abilities, nextability) AS (
    select name, '' as abilities, abilities||',' as nextability
    from imported_pokemon_data
    union all
        select name,
            substr(nextability, 0, instr(nextability, ',')) as abilities,
            substr(nextability, instr(nextability, ',')+1) as nextability
        from split
        where nextability !=''
)
select name, abilities
from split
where abilities !=''
order by name;
	
create table first_temp as
select * from imported_pokemon_data;

alter table first_temp
drop column abilities;

create table firstnf_pokemon_data AS
select firstnf.*, first_temp.*
from firstnf
join first_temp on first_temp.name=firstnf.name;

-- drop table imported_pokemon_data;
-- drop table firstnf;
-- drop table first_temp;