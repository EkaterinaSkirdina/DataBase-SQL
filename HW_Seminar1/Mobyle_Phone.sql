-- Создайте таблицу с мобильными телефонами, используя графический интерфейс.
-- Id, ProductName, Manufacturer, ProductCount, Price
-- Заполните БД данными.

CREATE TABLE `seminar1`.`mobyle_phone` (
  `idmobyle_phone` INT NOT NULL AUTO_INCREMENT,
  `ProductName` VARCHAR(45) NOT NULL,
  `Manufacturer` VARCHAR(45) NOT NULL,
  `ProductCount` INT NOT NULL,
  `Price` INT NOT NULL,
  UNIQUE INDEX `idmobyle_phone_UNIQUE` (`idmobyle_phone` ASC) VISIBLE,
  PRIMARY KEY (`idmobyle_phone`));

INSERT INTO `seminar1`.`mobyle_phone` (`idmobyle_phone`, `ProductName`, `Manufacturer`, `ProductCount`, `Price`) VALUES ('1', 'Mate X3', 'Huawey', '5', '149999');
INSERT INTO `seminar1`.`mobyle_phone` (`idmobyle_phone`, `ProductName`, `Manufacturer`, `ProductCount`, `Price`) VALUES ('2', 'IPhone 14Pro Max', 'Apple', '3', '115999');
INSERT INTO `seminar1`.`mobyle_phone` (`idmobyle_phone`, `ProductName`, `Manufacturer`, `ProductCount`, `Price`) VALUES ('3', 'IPhone 11', 'Apple', '2', '46999');
INSERT INTO `seminar1`.`mobyle_phone` (`idmobyle_phone`, `ProductName`, `Manufacturer`, `ProductCount`, `Price`) VALUES ('4', 'Galaxy S23+', 'Samsung', '6', '92999');
INSERT INTO `seminar1`.`mobyle_phone` (`idmobyle_phone`, `ProductName`, `Manufacturer`, `ProductCount`, `Price`) VALUES ('5', 'X9a', 'Honor', '3', '24999');
INSERT INTO `seminar1`.`mobyle_phone` (`idmobyle_phone`, `ProductName`, `Manufacturer`, `ProductCount`, `Price`) VALUES ('6', 'Galaxy A54', 'Samsung', '1', '32999');
INSERT INTO `seminar1`.`mobyle_phone` (`idmobyle_phone`, `ProductName`, `Manufacturer`, `ProductCount`, `Price`) VALUES ('7', 'X8', 'Honor', '1', '21999');

-- Выведите название, производителя и цену для товаров, количество которых превышает 2

SELECT ProductName, Manufacturer, Price  FROM seminar1.mobyle_phone
WHERE ProductCount > 2;

-- Выведите весь ассортимент товаров марки “Samsung”

SELECT * FROM seminar1.mobyle_phone
WHERE Manufacturer = "Samsung";

-- *** С помощью регулярных выражений найти:
-- Товары, в наименовании которых есть упоминание "Iphone"

SELECT * FROM seminar1.mobyle_phone
WHERE ProductName LIKE '%IPhone%';

-- Товары, в наименовании которых есть упоминание "Galaxy"

SELECT * FROM seminar1.mobyle_phone
WHERE ProductName LIKE '%Galaxy%';

-- Товары, в наименовании которых есть ЦИФРЫ

SELECT * FROM seminar1.mobyle_phone
WHERE ProductName RLIKE "[0-9]";

-- Товары, в наименовании которых есть ЦИФРА "8"

SELECT * FROM seminar1.mobyle_phone
WHERE ProductName LIKE '%8%';
