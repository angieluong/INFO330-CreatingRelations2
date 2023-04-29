create table thirdnf_set (
	name text,
	base_egg_steps text,
	base_happiness text,
	base_total text,
	classification text,
	experience_growth text,
	percentage_male text,
	pokedex_number text,
	generation text,
	is_legendary text,
	type1 text,
	type2 text,
	primary key (name)
);

insert into thirdnf_set
	select 
		name,
		base_egg_steps,
		base_happiness,
		base_total,
		classfication,
		experience_growth,
		percentage_male,
		pokedex_number,
		generation,
		is_legendary,
		type1,
		type2
	from secondnf_t2;

create table thirdnf_change (
	name text,
	attack text,
	capture_rate text,
	defense text,
	height_m text,
	hp text,
	sp_attack text,
	sp_defense text,
	speed text,
	weight_kg text,
	FOREIGN key (name) references thirdnf_set (name)
);

insert into thirdnf_change
	select
		name,
		attack,
		capture_rate,
		defense,
		height_m,
		hp,
		sp_attack,
		sp_defense,
		speed,
		weight_kg
	from secondnf_t2;
	

create table thirdnf_types (
	name text,
	type1 text,
	type2 text,
	against_bug text,
	against_dark text,
	against_dragon text,
	against_electric text,
	against_fairy text,
	against_fight text,
	against_fire text,
	against_flying text,
	against_ghost text,
	against_grass text,
	against_ground text,
	against_ice text,
	against_normal text,
	against_poison text,
	against_psychic text,
	against_rock text,
	against_steel text,
	against_water text,
	primary key (name)
);

insert into thirdnf_types
	select
		name,
		type1,
		type2,
		against_bug,
		against_dark,
		against_dragon,
		against_electric,
		against_fairy,
		against_fight,
		against_fire,
		against_flying,
		against_ghost,
		against_grass,
		against_ground,
		against_ice,
		against_normal,
		against_poison,
		against_psychic,
		against_rock,
		against_steel,
		against_water
	from secondnf_t2