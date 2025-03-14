create table sales (
	sale_id serial primary key,
	product_id int,
	sale_date date not null,
	quantity int not null,
	price decimal(10, 2) not null,
	foreign key (product_id) references products(product_id)
);


insert into sales(product_id, sale_date, quantity, price)
values
(1, '2024-01-01', 2, 999.99),  -- iPhone 14
(1, '2024-01-15', 1, 999.99),
(2, '2024-01-10', 3, 799.99),  -- Samsung Galaxy S22
(3, '2024-02-05', 5, 19.99),   -- Футболка
(4, '2024-02-10', 2, 49.99),   -- Джинсы
(5, '2024-03-01', 10, 5.99),   -- Пельмени
(6, '2024-03-02', 15, 2.99),   -- Чипсы
(7, '2024-03-10', 1, 29.99),   -- Конструктор LEGO
(8, '2024-03-15', 4, 7.99);    -- Мяч для тенниса