-- 1. Создайте функцию, которая принимает кол-во сек и формат их в кол-во дней часов. 
--    Пример: 123456 ->'1 days 10 hours 17 minutes 36 seconds '

DROP PROCEDURE IF EXISTS convert_times;

DELIMITER // 
CREATE PROCEDURE convert_times(seconds INT) 
BEGIN 
DECLARE days INT default 0; 
DECLARE hours INT default 0; 
DECLARE minutes INT default 0; 
WHILE seconds >= 84600 DO 
	SET days = seconds / 84600; 
	SET seconds = seconds % 84600; 
END WHILE; 
WHILE seconds >= 3600 DO 
	SET hours = seconds / 3600; 
	SET seconds = seconds % 3600; 
END WHILE; 
WHILE seconds >= 60 DO 
	SET minutes = seconds / 60; 
	SET seconds = seconds % 60; 
END WHILE; 
SELECT days, hours, minutes, seconds; 
END // 
DELIMITER ;
CALL convert_times(123456);


-- 2. Выведите только четные числа от 1 до 10. Пример: 2,4,6,8,10

DROP FUNCTION IF EXISTS even_numbers;

DELIMITER //
CREATE FUNCTION even_numbers(n INT)
RETURNS VARCHAR(100)
DETERMINISTIC
BEGIN
DECLARE i INT DEFAULT 1;
DECLARE result VARCHAR(100) DEFAULT "";
	WHILE i <= n do
		IF (i % 2 = 0) THEN
			SET result = concat(result, " ", i);
			SET i = i + 2;
		ELSE
			SET i = i + 1;
        END IF;
	END WHILE;
RETURN result;
END //
DELIMITER ;

SELECT even_numbers(10);