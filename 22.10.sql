create table rolls (
	rolls_id serial primary key,
	roll varchar(150)
);

create table size_item (
	size_id serial primary key,
	size_item numeric(3,1)
);

create table category (
	category_id serial primary key,
	category varchar(200)
);

create table users (
	users_id serial primary key,
	last_name varchar(100) not null,
	first_name varchar(100) not null,
	midle_name varchar(100),
	login varchar(150) not null,
	roll int,
	foreign key (roll) references rolls(rolls_id) 
);

create table product (
	product_id serial primary key,
	img varchar(200),
	name_tovar varchar(200),
	proiz varchar(300),
	opis varchar(300),
	sostav varchar(300),
	prise integer
);

create table stock_items (
	stock_items_id serial primary key,
	name_tovar int,
	proiz varchar(300),
	size_item int,
	kolvo integer,
	foreign key (size_item) references size_item(size_id),
	foreign key (name_tovar) references product(product_id) 
);

create table orders (
	orders serial primary key,
	nomer_zakaza integer,
	data_zakaza date,
	fio int,
	kat int,
	name_tovar int,
	proiz varchar(300),
	size_item int,
	kol integer,
	prise numeric(10,2),
	foreign key (fio) references users(users_id),
	foreign key (kat) references category(category_id),
	foreign key (size_item) references size_item(size_id),
	foreign key (name_tovar) references stock_items(stock_items_id)
);

