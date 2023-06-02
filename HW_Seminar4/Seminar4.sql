CREATE DATABASE seminar4;
USE seminar4;

CREATE TABLE  AUTO 
(       
	REGNUM VARCHAR(10) PRIMARY KEY, 
	MARK VARCHAR(10), 
	COLOR VARCHAR(15),
	RELEASEDT DATE, 
	PHONENUM VARCHAR(15)
);

INSERT INTO AUTO (REGNUM, MARK,	COLOR, RELEASEDT, PHONENUM )
VALUES(111114,'LADA', 'КРАСНЫЙ', date'2008-01-01', '9152222221'),
(111115,'VOLVO', 'КРАСНЫЙ', date'2013-01-01', '9173333334'),
(111116,'BMW', 'СИНИЙ', date'2015-01-01', '9173333334'),
(111121,'AUDI', 'СИНИЙ', date'2009-01-01', '9173333332'),
(111122,'AUDI', 'СИНИЙ', date'2011-01-01', '9213333336'),
(111113,'BMW', 'ЗЕЛЕНЫЙ', date'2007-01-01', '9214444444'),
(111126,'LADA', 'ЗЕЛЕНЫЙ', date'2005-01-01', null),
(111117,'BMW', 'СИНИЙ', date'2005-01-01', null),
(111119,'LADA', 'СИНИЙ', date'2017-01-01', 9213333331);

-- 1. Вывести на экран, сколько машин каждого цвета для машин марок BMW и LADA

SELECT MARK, COLOR, COUNT(COLOR) count_car 
FROM AUTO WHERE MARK in ('BMW', 'LADA') 
GROUP BY MARK, COLOR 
ORDER BY MARK;

-- 2. Вывести на экран марку авто(количество) и количество авто не этой марки.
-- 100 машин, их них 20 - BMW и 80 машин другой марки , AUDI - 30 и 70
-- машин другой марки, LADA - 15, 85 авто другой марки

SELECT MARK, COUNT(MARK) count_mark, (SELECT COUNT(*) FROM AUTO) - COUNT(*) AS count_other_marks FROM AUTO
GROUP BY MARK;

-- 3. Даны 2 таблицы, созданные следующим образом:

create table test_a (id INT, test varchar(10));
create table test_b (id INT);
insert into test_a(id, test) values
(10, 'A'),
(20, 'A'),
(30, 'F'),
(40, 'D'),
(50, 'C');
insert into test_b(id) values
(10),
(30),
(50);

-- Напишите запрос, который вернет строки из таблицы test_a, id
-- которых нет в таблице test_b, НЕ используя ключевого слова NOT.

SELECT a.* FROM test_a a
LEFT JOIN test_b b ON a.id = b.id
WHERE b.id IS NULL;
