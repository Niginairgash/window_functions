-- Анализируем общие продажи товаров и динамику по времени
select 
	p.product_name,
	c.category_name,
	s.sale_date,
	s.quantity,
	s.price,
	s.quantity * s.price as total_sale,
	sum(s.quantity * s.price) over (partition by p.product_id order by s.sale_date) as total,                               -- Общая сумма на каждый момент времени
	lag(s.quantity * s.price) over (partition by p.product_id order by s.sale_date) as prev_sale,                           -- сумма предыдущей продажи то же товара
	(s.quantity * s.price) - lag(s.quantity * s.price) over (partition by p.product_id order by s.sale_date) as sale_diff   -- разница между текущей продажи товара
from sales s
inner join products p  on s.product_id = p.product_id 
inner join categories c on p.category_id = c.category_id 
order by p.product_id , s.sale_date

-- Анализируем общие продажи товаров и динамику по времени
select 
	p.product_name,
	c.category_name,
	s.sale_date,
	sum(s.quantity) ,
	sum(s.quantity*s.price) ,
	lag(sum(s.quantity*s.price)) over(partition by p.product_id order by s.sale_date) as prev_sales,
	case 
		when lag(sum(s.quantity*s.price)) over(partition by p.product_id order by s.sale_date)  is not null
		then (sum(s.quantity * p.price) - lag(sum(s.quantity * p.price)) over(partition by p.product_id order by s.sale_date)) 
			/ lag(sum(s.quantity * p.price)) over (partition by p.product_id order by s.sale_date) * 100                    -- процентное изменение продаж по сравнению с предыдущей 
	end
from sales s
inner join products p on p.product_id = s.product_id 
inner join categories c on c.category_id = p.category_id 
group  by p.product_name, c.category_name, s.sale_date, p.product_id
order by p.product_name, s.sale_date