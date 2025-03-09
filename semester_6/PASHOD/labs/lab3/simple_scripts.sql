USE mydb;

-- Удаление некоторых данных из таблицы products
DELETE FROM products WHERE product_ID IN (3, 4);

-- Удаление некоторых данных из таблицы customers
DELETE FROM customers WHERE customer_ID = 3;

-- Удаление некоторых данных из таблицы orders
DELETE FROM orders WHERE order_ID = 4;

-- Удаление некоторых данных из таблицы delivery_types
DELETE FROM delivery_types WHERE delivery_type_ID = 3;

-- Удаление некоторых данных из таблицы deliveries
DELETE FROM deliveries WHERE deliveries = 3;

-- Удаление некоторых данных из таблицы product_delivery_types
DELETE FROM product_delivery_types WHERE product_ID = 4;

-- Обновление данных в таблице products
UPDATE products SET p_price = 80000.00 WHERE product_ID = 1;
UPDATE products SET p_name = 'Новый Смартфон' WHERE product_ID = 2;

-- Обновление данных в таблице customers
UPDATE customers SET c_phone = '79991112233' WHERE customer_ID = 1;

-- Обновление данных в таблице orders
UPDATE orders SET order_quantity = 5 WHERE order_ID = 1;

-- Обновление данных в таблице delivery_types
UPDATE delivery_types SET dt_price = 1000.00 WHERE delivery_type_ID = 1;

-- Обновление данных в таблице deliveries
UPDATE deliveries SET delivery_cost = 1200.00 WHERE deliveries = 1;

-- Использование различных операторов

-- Оператор =
SELECT * FROM products WHERE p_price = 80000.00;

-- Оператор <=>
SELECT * FROM customers WHERE customerscol <=> NULL;

-- Оператор <>
SELECT * FROM orders WHERE order_quantity <> 2;

-- Оператор <
SELECT * FROM delivery_types WHERE dt_price < 1000.00;

-- Оператор <=
SELECT * FROM products WHERE p_price <= 80000.00;

-- Оператор >
SELECT * FROM deliveries WHERE delivery_cost > 1000.00;

-- Оператор >=
SELECT * FROM orders WHERE order_quantity >= 3;

-- Оператор BETWEEN
SELECT * FROM products WHERE p_price BETWEEN 50000 AND 100000;

-- Оператор IS NULL
SELECT * FROM customers WHERE customerscol IS NULL;

-- Оператор IS NOT NULL
SELECT * FROM customers WHERE c_phone IS NOT NULL;

-- Оператор IN
SELECT * FROM products WHERE product_ID IN (1, 2, 4);

-- Оператор AND
SELECT * FROM orders WHERE order_quantity > 2 AND order_date = '2025-02-15';

-- Оператор OR
SELECT * FROM customers WHERE c_name = 'ООО "ТехноМир"' OR c_name = 'АО "ГаджетПлюс"';

-- Оператор NOT
SELECT * FROM products WHERE NOT p_delivery_available = 1;

-- Оператор XOR
SELECT * FROM orders WHERE (order_quantity > 2) XOR (order_date = '2025-02-15');
