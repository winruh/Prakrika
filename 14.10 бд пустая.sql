create table roles (
    roles_ID serial primary key,
    last_name varchar(50) not null,
    first_name varchar(50) not null,
    midle_name varchar(50),
    login varchar(100) not null unique,
    roles varchar(50) not null
);

create table product (
    product_ID serial primary key,
    kat varchar(100) not null,
    podkat varchar(100) not null,
    img varchar(255),
    name_tovar varchar(100) not null unique,
    proiz varchar(100) not null,
    opis varchar(200) not null,
    sostav varchar(300) not null,
    prise numeric(10,2) not null,
    unique (name_tovar, proiz)
);

create table size_ (
    size_ID serial primary key,
    size_ numeric(3,1) not null unique
);

create table stock (
    stock_ID serial primary key,
    name_tovar varchar(100) not null,
    proiz varchar(100) not null,
    size_ numeric(3,1) not null references size_(size_) on delete restrict,
    kolvo integer not null,
    foreign key (name_tovar, proiz) references product(name_tovar, proiz) on delete restrict
);

create table orders (
    orders_ID serial primary key,
    order_date date not null default current_date,
    user_ID integer not null references roles(roles_ID) on delete restrict
);

create table orders_items (
    orders_items_ID serial primary key,
    orders_ID integer not null references orders(orders_ID) on delete cascade,
    product_ID integer not null references product(product_ID) on delete restrict,
    size_ID integer not null references size_(size_ID) on delete restrict,
    kolvo integer not null check (kolvo > 0),
    prise numeric(10,2) not null
);