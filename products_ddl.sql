create table products(
	product_id int primary key,
	product_name varchar(255) not null,
	price decimal(10,2) not null,
	stock_quantity int not null,
	category_id int,
	foreign key (category_id) references categories(category_id)
)


insert into products(product_id, product_name, price, stock_quantity, category_id)
values
(1, 'iPhone 14', 999.99, 150, 1),
(2, 'Samsung Galaxy S22', 799.99, 100, 1),
(3, 'Футболка', 19.99, 200, 2),
(4, 'Джинсы', 49.99, 120, 2),
(5, 'Пельмени', 5.99, 300, 3),
(6, 'Чипсы', 2.99, 500, 3),
(7, 'Конструктор LEGO', 29.99, 80, 4),
(8, 'Мяч для тенниса', 7.99, 150, 5);