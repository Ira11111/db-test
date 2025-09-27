--категория с логикой дерева
create table if not exists category(
id_category serial primary key,
category_name varchar(50) not null,
parent_category_id integer default null,
foreign key (parent_category_id) references category(id_category) 
    on delete set null on update cascade);

--номенклатура
create table if not exists product(
id_product serial primary key,
product_name varchar(100) not null,
price decimal not null,
amount integer DEFAULT 0,
id_category integer references category(id_category) on delete set null);


--клиенты
create table if not exists client(
id_client serial primary key,
client_name varchar(50) not null,
address varchar(100) not null
);

--заказы
create table if not exists purchase(
id_purchase serial primary key,
id_client integer references client (id_client));

--
create table if not exists purchase_product(
id_order_product serial primary key,
id_purchase integer references purchase(id_purchase),
id_product integer references product(id_product),
product_amount integer default 1);
