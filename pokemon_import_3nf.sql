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