-- 1. Создать и заполнить таблицу "sales".
USE seminar2;

CREATE TABLE sales
(id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
order_date DATE NOT NULL,
bucket VARCHAR(45) NOT NULL);

INSERT INTO seminar2.sales (id, order_date, bucket) VALUES
(1, '2023-02-21', '101 to 300'),
(2, '2023-05-21', '101 to 300'),
(3, '2023-05-22', 'less then equal to 100'),
(4, '2023-05-20', '101 to 300'),
(5, '2023-05-20', 'greater then 300');

-- 2. Разделить значения поля "bucket" на 3 сегмента.
-- >100 "Маленький заказ"
-- 100-300 "Средний заказ"
-- <300 "Большой заказ"

alter table sales
add column segment varchar(20) not null;
set sql_safe_updates = 0;
update sales 
set segment =
case 
when sales.bucket = 'less then equal to 100' then 'Маленький заказ'
when sales.bucket = '101 to 300' then 'Средний заказ'
when sales.bucket = 'greater then 300' then 'Большой заказ'
end where 1=1;

-- 3. Создайте таблицу orders, заполните ее значениями. 
-- Покажите полный статус заказа используя оператор CASE.

create table orders
(orderid int primary key auto_increment not null,
employeeid varchar(5) not null,
amount float not null,
orderstatus varchar(20) not null);

insert into orders (orderid, employeeid, amount, orderstatus)
values
(1, 'e03', 15.00, 'open'),
(2, 'e01', 25.50, 'open'),
(3, 'e05', 100.70, 'closed'),
(4, 'e02', 22.18, 'open'),
(5, 'e04', 9.50, 'cancelled'),
(6, 'e04', 99.99, 'open');

select orders.orderid, orders.orderstatus,
case
when orderstatus = 'open' then 'Order is in open state'
when orderstatus = 'closed' then 'Order is closed'
when orderstatus = 'cancelled' then 'Order is cancelled'
end
from orders;