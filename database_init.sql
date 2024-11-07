drop table if exists salesman_level CASCADE;
create table salesman_level
(
    id    uuid        not null  default gen_random_uuid()
        constraint salesman_level_pk
            primary key,
    name  varchar(50) not null,
    color varchar(10)
);

alter table salesman_level
    owner to local;


drop table if exists salesman CASCADE;
create table salesman
(
    id uuid not null
        constraint salesman_pk
            primary key default gen_random_uuid(),
    name varchar(50) not null,
    level_id uuid not null
        constraint salesman_salesman_level_id_fk
            references salesman_level
);

alter table salesman
    owner to local;

drop table if exists sales_area CASCADE;
create table sales_area
(
    id          uuid        not null
        constraint sales_area_pk
            primary key default gen_random_uuid(),
    name        varchar(50) not null,
    coordinates jsonb
);

alter table sales_area
    owner to local;

drop table if exists sales_interaction CASCADE;
create table sales_interaction
(
    id          uuid        not null
        constraint sales_interaction_pk
            primary key default gen_random_uuid(),
    date        varchar(50) not null,
    salesman_id uuid not null
        constraint salesman_interaction_salesman_id_fk
            references salesman,
    area_id uuid not null
        constraint salesman_interaction_salesman_area_id_fk
            references sales_area,
    status varchar(50) not null
);

alter table sales_interaction
    owner to local;

