# Базы данных и SQL (семинары)


### Урок 1. Установка СУБД, подключение к БД, просмотр и создание таблиц

1. Создайте таблицу с мобильными телефонами, используя графический интерфейс.
Id, ProductName, Manufacturer, ProductCount, Price
Заполните БД данными.

2. Выведите название, производителя и цену для товаров, количество которых превышает 2

3. Выведите весь ассортимент товаров марки “Samsung”
4. С помощью регулярных выражений найти:

    * Товары, в наименовании которых есть упоминание "Iphone"
    * Товары, в наименовании которых есть упоминание "Samsung"
    * Товары, в наименовании которых есть ЦИФРЫ
    * Товары, в наименовании которых есть ЦИФРА "8"

### Урок 2. SQL - создание объектов, простые запросы выборки.

1. Создать и заполнить таблицу "sales".
2. Разделить значения поля "bucket" на 3 сегмента. 
    * \>100 "Маленький заказ"
    *  100-300 "Средний заказ"
    *  <300 "Большой заказ"
3. Создайте таблицу orders, заполните ее значениями. Покажите полный статус заказа используя оператор CASE.