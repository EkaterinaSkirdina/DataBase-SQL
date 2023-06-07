CREATE DATABASE Seminar5;
USE Seminar5;

CREATE TABLE cars(
id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
name varchar(25),
cost int);

INSERT INTO cars (name, cost) VALUES(
"AUDI", 52642),
("MERCEDES", 57127),
("SKODA", 9000),
("VOLVO", 2900),
("BENTLEY", 350000),
("CITROEN", 21000),
("HAMMER", 41400),
("VOLKSWAGEN", 21600);


-- 1. Создайте представление, в которое попадут автомобили стоимостью до 25 000 долларов
CREATE VIEW car_cost AS
(SELECT * FROM cars WHERE cost <25000);

SELECT* FROM car_cost;

-- 2. Изменить в существующем представлении порог для стоимости: пусть цена будет 
-- до 30 000 долларов (используя оператор ALTER VIEW)
ALTER VIEW car_cost AS 
(SELECT * FROM cars WHERE cost <30000);

-- 3. Создайте представление, в котором будут только автомобили марки “Шкода” и “Ауди” (аналогично)

ALTER VIEW car_cost AS 
(SELECT * FROM cars WHERE name IN ("SKODA", "AUDI"));

-- 4. Есть таблица анализов Analysis: an_id — ID анализа; an_name — название анализа; 
-- an_cost — себестоимость анализа; an_price — розничная цена анализа; an_group — группа анализов. 
-- Есть таблица групп анализов Groups: gr_id — ID группы; gr_name — название группы; gr_temp — температурный режим хранения. 
-- Есть таблица заказов Orders: ord_id — ID заказа; ord_datetime — дата и время заказа; ord_an — ID анализа.

CREATE TABLE a_groups(
gr_id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
gr_name VARCHAR (150),
gr_temp DECIMAL (8, 4));

CREATE TABLE Analysis (
an_id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
an_name VARCHAR (150),
an_cost DECIMAL (16, 2),
an_price DECIMAL (16,2),
an_group INT,
FOREIGN KEY (an_group) REFERENCES a_groups (gr_id));

CREATE TABLE Orders(
ord_id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
ord_datetime DATETIME,
ord_an INT,
FOREIGN KEY (ord_an) REFERENCES Analysis(an_id));

INSERT INTO a_groups (gr_id, gr_name, gr_temp) VALUES  
(1, "BLOOD", 36.3), 
(2, "URINE", 35.4), 
(3, "salvia", 28.6);

INSERT INTO Analysis (an_name, an_cost, an_price, an_group) VALUES 
("ОАК", 560, 650, 1),
("gemoglobin", 300, 450, 1),
("kalcitonin", 900, 1200, 1),
("TTG", 300, 700, 1),
("PH", 200, 400, 2),
("leikocyt", 300, 500, 2),
("eozonofil", 400, 500, 1);
SELECT * FROM Analysis;

INSERT INTO Orders (ord_datetime, ord_an) VALUES
 ('2020-02-01 18:00:00', 15), 
 ('2020-02-01 19:15:00', 17), 
 ('2020-02-12 17:00:00', 21), 
 ('2020-02-12 14:00:00', 16),
 ('2020-02-12 12:00:00', 20), 
 ('2020-02-01 11:15:00', 15), 
 ('2020-02-01 12:15:00', 18), 
 ('2020-02-01 10:15:00', 21),
 ('2020-02-10 17:00:00', 16), 
 ('2020-02-01 21:00:12', 19), 
 ('2020-02-12 13:25:00', 20), 
 ('2020-02-03 14:45:00', 15),
 ('2020-02-04 18:21:00', 21), 
 ('2020-02-04 14:45:00', 19), 
 ('2020-02-05 12:14:00', 18), 
 ('2020-02-06 15:41:00', 16);

SELECT * FROM ORDERS;


-- Вывести название и цену для всех анализов, которые продавались 5 февраля 2020 и всю следующую неделю. 

SELECT an_name, an_price, ord_datetime
FROM Analysis
JOIN Orders
ON Orders.ord_an = Analysis.an_id
WHERE DATE(ord_datetime) BETWEEN '2020-02-05' AND '2020-02-12'
ORDER BY ord_datetime;

-- 5. Добавьте новый столбец под названием «время до следующей станции». 
-- Чтобы получить это значение, мы вычитаем время станций для пар смежных станций. 
-- Мы можем вычислить это значение без использования оконной функции SQL, но это может быть очень сложно.
-- Проще это сделать с помощью оконной функции LEAD . Эта функция сравнивает значения из одной строки со 
-- следующей строкой, чтобы получить результат. В этом случае функция сравнивает значения в столбце «время» 
-- для станции со станцией сразу после нее.

CREATE TABLE trains (
tr_id INT,
station VARCHAR(20),
station_time TIME);

INSERT INTO trains(tr_id, station, station_time) 
VALUES (110, "SAN FRANCISCO", '10:00:00'),
(110, 'REDWOOD CITY', '10:54:00'),
(110, 'PLATO ALTO', '11:02:00'),
(110, 'SAN JOSE', '12:35:00'),
(120, 'SAN FRANCISCO', '11:00:00'),
(120, 'PALO ALTO', '12:49:00'),
(120, 'SAN JOSE', '13:30:00');

SELECT * FROM trains;

SELECT *, timediff(LEAD(station_time) 
OVER (PARTITION BY tr_id ORDER BY station_time), station_time) 'время до следующей станции' 
FROM trains;
