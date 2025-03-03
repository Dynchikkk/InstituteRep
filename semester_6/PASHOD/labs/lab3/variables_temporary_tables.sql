USE mydb;

-- Использование переменных и временных таблиц

-- Объявление переменных
SET @max_price = (SELECT MAX(p_price) FROM products);
SET @min_price = (SELECT MIN(p_price) FROM products);
SET @customer_count = (SELECT COUNT(*) FROM customers);

-- Вывод значений переменных
SELECT @max_price AS MaxPrice, @min_price AS MinPrice, @customer_count AS CustomerCount;

-- Создание временной таблицы с дорогими продуктами
CREATE TEMPORARY TABLE ExpensiveProducts AS
SELECT * FROM products WHERE p_price > @max_price * 0.8;

-- Выборка из временной таблицы
SELECT * FROM ExpensiveProducts;

-- Создание временной таблицы с заказами за последний месяц
CREATE TEMPORARY TABLE RecentOrders AS
SELECT * FROM orders WHERE order_date >= DATE_SUB(CURDATE(), INTERVAL 1 MONTH);

-- Выборка из временной таблицы
SELECT * FROM RecentOrders;

-- Использование переменной в условии
SET @target_price = 60000;
SELECT * FROM products WHERE p_price > @target_price;

-- Удаление временных таблиц
DROP TEMPORARY TABLE IF EXISTS ExpensiveProducts;
DROP TEMPORARY TABLE IF EXISTS RecentOrders;
