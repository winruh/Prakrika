drop table if exists roles cascade;
drop table if exists category cascade;
drop table if exists users cascade;
drop table if exists size_items cascade;
drop table if exists product cascade;
drop table if exists stock cascade;
drop table if exists orders cascade;

create table roles (
    roles_id serial primary key,
    roles_name varchar(150)
);

create table category (
    category_id serial primary key,
    category varchar(150)
);

create table users (
    user_id serial primary key,
    last_name varchar(150),
    first_name varchar(150),
    midle_name varchar(150),
    login varchar(150),
    roles int,
    foreign key (roles) references roles(roles_id)
);

create table size_items (
    size_items_id serial primary key,
    size_ numeric(3,1)
);

create table product (
    product_id serial primary key,
    kat int,
    img varchar(255),
    name_tovar varchar(255),
    proiz varchar(255),
    opis varchar(255),
    sostav varchar(255),
    prise numeric(10,2),
    foreign key (kat) references category(category_id)
);

create table stock (
    stock_id serial primary key,
    name_tovar int,
    proiz int,
    size_ int,
    kolvo int,
    foreign key (size_) references size_items(size_items_id),
    foreign key (name_tovar) references product(product_id)
);

create table orders (
    orders_id serial primary key,
    nomer_zakaza integer,
    data_ date,
    fio int,
    kat int,
    name_tovar int,
    proiz int,
    size_items int,
    kolvo integer,
    prise numeric(10,2),
    foreign key (fio) references users(user_id),
    foreign key (kat) references category(category_id),
    foreign key (name_tovar) references product(product_id),
    foreign key (size_items) references size_items(size_items_id)
);

select
    conrelid::regclass as table_name,
    conname,
    confrelid::regclass as referenced_table
from pg_constraint
where contype = 'f';