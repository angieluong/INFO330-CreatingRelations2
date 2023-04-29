-- created a reference table using Justin's recursive query in order to
-- normalize the database into first normal form
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

-- creates a temp table with all data from the original data (imported_pokemon_data)
-- and drops the abilities column to avoid duplication during the join
create table first_temp as
select * from imported_pokemon_data;

alter table first_temp
drop column abilities;

-- creates the final 1NF pokemon data table using our recursively broken down table
-- (firstnf) and temp table (first_temp)
create table firstnf_pokemon_data AS
select firstnf.*, first_temp.*
from firstnf
join first_temp on first_temp.name=firstnf.name;

-- drops the temporary tables we do not need anymore, leaving the 1NF table
drop table imported_pokemon_data;
drop table firstnf;
drop table first_temp;