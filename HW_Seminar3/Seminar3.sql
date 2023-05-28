CREATE DATABASE seminar3;
USE seminar3;


-- ЧАСТЬ 1.

CREATE TABLE salespeople
(
snum INT  PRIMARY KEY AUTO_INCREMENT NOT NULL,
sname VARCHAR(25) NOT NULL,
city VARCHAR(25) NOT NULL,
comm VARCHAR(10) NOT NULL
);

INSERT INTO salespeople VALUES
(1001, 'Peel', 'London','.12'),
(1002, 'Serres', 'San Jose','.13'),
(1004, 'Motika', 'London','.11'),
(1007, 'Rifkin', 'Barcelona','.15'),
(1003, 'Axelrod', 'New York','.10');

CREATE TABLE customers
(
cnum INT  PRIMARY KEY AUTO_INCREMENT NOT NULL,
cname VARCHAR(25) NOT NULL,
city VARCHAR(25) NOT NULL,
rating INT NOT NULL,
snum INT NOT NULL,
FOREIGN KEY (snum) REFERENCES salespeople(snum)
);

INSERT INTO customers VALUES
(2001, 'Hoffman', 'London', 100, 1001),
(2002, 'Giovanni', 'ROME', 200, 1003),
(2003, 'Liu', 'SanJose', 200, 1002),
(2004, 'Grass', 'Berlin', 300, 1002),
(2006, 'Clemens', 'London', 100, 1001),
(2008, 'Cisneros', 'SanJose', 300, 1007),
(2007, 'Pereira', 'Rome', 100, 1004);

CREATE TABLE orders
(
onum INT  PRIMARY KEY AUTO_INCREMENT NOT NULL,
amt FLOAT NOT NULL,
odate DATE NOT NULL,
cnum INT NOT NULL,
snum INT NOT NULL,
FOREIGN KEY (snum) REFERENCES salespeople(snum),
FOREIGN KEY (cnum) REFERENCES customers(cnum)
);

INSERT INTO orders VALUES
(3001, 18.69, '1990-03-10', 2008, 1007),
(3003, 767.19, '1990-03-10', 2001, 1001),
(3002, 1900.10, '1990-03-10', 2007, 1004),
(3005, 5160.45, '1990-03-10', 2003, 1002),
(3006, 1098.16, '1990-03-10', 2008, 1007),
(3009, 1713.23, '1990-04-10', 2002, 1003),
(3007, 75.75, '1990-04-10', 2004, 1002),
(3008, 4723.00, '1990-05-10', 2006, 1001),
(3010, 1309.95, '1990-06-10', 2004, 1002),
(3011, 9891.88, '1990-06-10', 2006, 1001);


-- 1. Напишите запрос, который вывел бы таблицу со столбцами в следующем порядке: city, sname, snum, comm. 
SELECT city, sname, snum, comm 
FROM salespeople;

-- 2. Напишите команду SELECT, которая вывела бы оценку(rating), сопровождаемую именем каждого заказчика 
-- в городе San Jose. (“заказчики”)
SELECT rating, cname, city
FROM customers
WHERE city = 'SanJose';

-- 3.  Напишите запрос, который вывел бы значения snum всех продавцов из таблицы заказов без каких бы то 
-- ни было повторений. (уникальные значения в “snum“ “Продавцы”)
SELECT DISTINCT snum 
FROM customers;

-- 4.  Напишите запрос, который бы выбирал заказчиков, чьи имена начинаются с буквы G. 
-- Используется оператор "LIKE": (“заказчики”)
SELECT * FROM customers
WHERE cname LIKE 'G%';

-- 5. Напишите запрос, который может дать вам все заказы со значениями суммы выше 
-- чем $1,000. (“Заказы”, “amt” - сумма)
SELECT * FROM orders
WHERE amt > 1000;

-- 6. Напишите запрос который выбрал бы наименьшую сумму заказа.
-- (Из поля “amt” - сумма в таблице “Заказы” выбрать наименьшее значение)
SELECT MIN(amt) FROM orders;

-- 7. Напишите запрос к таблице “Заказчики”, который может показать всех заказчиков, 
-- у которых рейтинг больше 100 и они находятся не в Риме.
SELECT * FROM customers
WHERE rating > 100 AND NOT city = 'Rome';


-- ЧАСТЬ 2.

CREATE TABLE workers 
(
id INT  PRIMARY KEY AUTO_INCREMENT NOT NULL,
name VARCHAR(25) NOT NULL,
surname VARCHAR(25) NOT NULL,
speciality VARCHAR(25) NOT NULL,
seniority INT NOT NULL,
salary INT NOT NULL,
age INT NOT NULL
);

INSERT INTO workers VALUES
(1, 'Вася', 'Васькин', 'начальник', 40, 100000, 60),
(2, 'Петя', 'Петькин', 'начальник', 8, 70000, 30),
(3, 'Катя', 'Каткина', 'инженер', 2, 70000, 25),
(4, 'Саша', 'Сашкин', 'инженер', 12, 50000, 35),
(5, 'Иван', 'Иванов', 'рабочий', 40, 30000, 59),
(6, 'Петр', 'Петров', 'рабочий', 20, 25000, 40),
(7, 'Сидор', 'Сидоров', 'рабочий', 10, 20000, 35),
(8, 'Антон', 'Антонов', 'рабочий', 8, 19000, 28),
(9, 'Юра', 'Юркин', 'рабочий', 5, 15000, 25),
(10, 'Максим', 'Воронин', 'рабочий', 2, 11000, 22),
(11, 'Юра', 'Галкин', 'рабочий', 3, 12000, 24),
(12, 'Люся', 'Люськина', 'уборщик', 10, 10000, 49);

-- 1. Отсортируйте поле “зарплата” в порядке убывания:
SELECT salary FROM workers
ORDER BY salary DESC;
-- и возрастания:
SELECT salary FROM workers
ORDER BY salary;

-- 2. Отсортируйте по возрастанию поле “Зарплата” и выведите 5 строк с наибольшей 
-- заработной платой (возможен подзапрос)
SELECT salary FROM 
(SELECT * FROM workers
ORDER BY salary DESC
LIMIT 5) T
ORDER BY salary;

-- 3.Выполните группировку всех сотрудников по специальности , суммарная зарплата которых превышает 100000
SELECT speciality, SUM(salary) sum_salary FROM workers
GROUP BY speciality
HAVING SUM(salary) > 100000;