create table roles (
	roles_ID serial primary key,
	roles_name varchar (100) not null
);

create table category(
	category_id serial primary key,
	category_name varchar(400)
);

create table users (
	user_id serial primary key,
    last_name varchar(50) not null,
    first_name varchar(50) not null,
    midle_name varchar(50),
    login varchar(100) not null,
    roles INT,
	foreign key (roles) references roles(roles_ID)
);

create table size_items (
	size_items_id serial primary key,
	size_items numeric(3,1)
);

create table stock (
	stock_id serial primary key,
	name_tovar varchar(100),
	proiz varchar(100),
	size_items int,
	kolvo int,
	foreign key (size_items) references size_items(size_items_id)
);

create table product (
	product_id serial primary key,
	kat int,
	img varchar(255),
	name_tovar int,
	proiz varchar(200),
	opiz varchar(250),
	sostav varchar(250),
	prize numeric(10,2), 
	foreign key (name_tovar) references stock(stock_id),
	foreign key (kat) references category(category_id)
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
	foreign key (name_tovar) references product(product_id),
	foreign key (size_items) references size_items(size_items_id) 
);