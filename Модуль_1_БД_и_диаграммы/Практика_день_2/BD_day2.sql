create table users (
    role_id serial primary key,
	role_name varchar(50) not null unique
);

create table users (
    user_id serial primary key,
	last_name varchar(50) not null,
	first_name varchar(50) not null,
	midle_name varchar(50),
	lodin varchar(50) not null unique,
	role_id integer not null references roles(role_id) on delete restrict
);

create table product (
    product_id serial primary key,
	category varchar(100) not null,
	subcategory varchar(100),
	product_name varchar(150)not 
)

